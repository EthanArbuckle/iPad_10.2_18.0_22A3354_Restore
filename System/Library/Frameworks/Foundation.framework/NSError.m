@implementation NSError

- (id)redactedDescription
{
  return (id)_CFErrorCreateRedactedDescription();
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *v5;
  NSString *v6;
  int v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = -[NSError userInfo](self, "userInfo");
  v8[0] = v5;
  if (!-[NSDictionary count](v5, "count"))
  {
    v5 = 0;
    v8[0] = 0;
  }
  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    objc_msgSend(a3, "encodeInteger:forKey:", -[NSError code](self, "code"), CFSTR("NSCode"));
    objc_msgSend(a3, "encodeObject:forKey:", -[NSError domain](self, "domain"), CFSTR("NSDomain"));
    objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("NSUserInfo"));
  }
  else
  {
    v7 = -[NSError code](self, "code");
    v6 = -[NSError domain](self, "domain");
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "i@@", &v7, &v6, v8);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSDictionary *v5;
  __objc2_class *v6;
  __objc2_class *v7;

  v5 = -[NSError userInfo](self, "userInfo");
  if (!-[NSDictionary count](v5, "count"))
    v5 = 0;
  v6 = (__objc2_class *)objc_opt_class();
  if (v6 == NSCFError)
    return -[NSError initWithDomain:code:userInfo:](+[NSError allocWithZone:](NSError, "allocWithZone:", a3), "initWithDomain:code:userInfo:", -[NSError domain](self, "domain"), -[NSError code](self, "code"), v5);
  v7 = -[__objc2_class allocWithZone:](v6, "allocWithZone:", a3);
  v7->vtable = (void *)-[NSString copy](-[NSError domain](self, "domain"), "copy");
  v7->cache = (void *)-[NSError code](self, "code");
  v7->info = (__objc2_class_ro *)-[NSDictionary copy](v5, "copy");
  return v7;
}

- (NSDictionary)userInfo
{
  if (self->_userInfo)
    return self->_userInfo;
  if (_CFExecutableLinkedOnOrAfter())
    return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  return 0;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](-[NSError domain](self, "domain"), "hash");
  return -[NSError code](self, "code") + v3;
}

- (NSErrorDomain)domain
{
  return self->_domain;
}

- (NSInteger)code
{
  return self->_code;
}

+ (NSError)errorWithDomain:(NSErrorDomain)domain code:(NSInteger)code userInfo:(NSDictionary *)dict
{
  return (NSError *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithDomain:code:userInfo:", domain, code, dict);
}

- (NSError)initWithDomain:(NSErrorDomain)domain code:(NSInteger)code userInfo:(NSDictionary *)dict
{
  NSError *v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  NSDictionary *v13;
  NSDictionary *v14;
  uint64_t v17;
  NSString *v18;
  objc_super v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!domain)
  {
    v17 = objc_opt_class();
    v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid domain=nil in -[%@ %s]"), v17, sel_getName(a2));

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v18, 0));
  }
  v19.receiver = self;
  v19.super_class = (Class)NSError;
  v9 = -[NSError init](&v19, sel_init);
  if (v9)
  {
    v10 = -[NSString copy](domain, "copy");
    v9->_code = code;
    v9->_domain = (NSString *)v10;
    v11 = _CFErrorCreateCallStackReturnAddresses();
    if (v11)
    {
      v12 = (const void *)v11;
      if (dict)
        v13 = (NSDictionary *)-[NSDictionary mutableCopy](dict, "mutableCopy");
      else
        v13 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
      v14 = v13;
      if (v13)
      {
        -[NSDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v12, CFSTR("NSCallStackReturnAddresses"));
        dict = v14;
      }
      CFRelease(v12);
    }
    else
    {
      v14 = 0;
    }
    v9->_userInfo = (NSDictionary *)-[NSDictionary copy](dict, "copy");

  }
  return v9;
}

- (int64_t)_collectApplicableUserInfoFormatters:(id *)a3 max:(int64_t)a4
{
  NSEnumerator *v7;
  uint64_t v8;
  id v9;
  int64_t v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v11;

  +[NSError _registerBuiltInFormatters](NSError, "_registerBuiltInFormatters");
  if (qword_1ECD099A0)
  {
    v7 = -[NSDictionary keyEnumerator](-[NSError userInfo](self, "userInfo"), "keyEnumerator");
    v8 = -[NSEnumerator nextObject](v7, "nextObject");
    if (v8)
    {
      v9 = (id)v8;
      v10 = 0;
      while (1)
      {
        os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_7);
        v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)NSMapGet((NSMapTable *)qword_1ECD099A0, v9);
        os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_7);
        if (v11)
        {
          if (v10 == a4)
            return -1;
          a3[v10++] = v11;
        }
        v9 = -[NSEnumerator nextObject](v7, "nextObject");
        if (!v9)
          return v10;
      }
    }
  }
  return 0;
}

+ (void)_registerBuiltInFormatters
{
  if (_registerBuiltInFormatters_builtInsRegistered != -1)
    dispatch_once(&_registerBuiltInFormatters_builtInsRegistered, &__block_literal_global_8);
}

uint64_t __53__NSError_NSErrorPrivate___registerBuiltInFormatters__block_invoke()
{
  +[NSError _registerFormatter:forErrorKey:parameters:](NSError, "_registerFormatter:forErrorKey:parameters:", pathComponentFromPath, CFSTR("NSDestinationFilePath"), "p");
  +[NSError _registerFormatter:forErrorKey:parameters:](NSError, "_registerFormatter:forErrorKey:parameters:", pathComponentFromPath, CFSTR("NSFilePath"), "dfv");
  +[NSError _registerFormatter:forErrorKey:parameters:](NSError, "_registerFormatter:forErrorKey:parameters:", pathComponentFromURL, CFSTR("NSURL"), "dfuv");
  +[NSError _registerFormatter:forErrorKey:parameters:](NSError, "_registerFormatter:forErrorKey:parameters:", encodingName, CFSTR("NSStringEncoding"), "e");
  +[NSError _registerFormatter:forErrorKey:parameters:](NSError, "_registerFormatter:forErrorKey:parameters:", validationValue, CFSTR("NSInvalidValue"), "a");
  +[NSError _registerFormatter:forErrorKey:parameters:](NSError, "_registerFormatter:forErrorKey:parameters:", validationValue, CFSTR("NSMinimumValidValue"), "n");
  return +[NSError _registerFormatter:forErrorKey:parameters:](NSError, "_registerFormatter:forErrorKey:parameters:", validationValue, CFSTR("NSMaximumValidValue"), "x");
}

+ (void)_registerFormatter:(void *)a3 forErrorKey:(id)a4 parameters:(const char *)a5
{
  NSMapTable *v8;
  _QWORD *v10;
  char v11;
  int v12;
  const char *v13;
  int v14;

  if (!qword_1ECD099A0)
  {
    v8 = NSCreateMapTableWithZone((NSMapTableKeyCallBacks *)&NSObjectMapKeyCallBacks, (NSMapTableValueCallBacks *)&NSOwnedPointerMapValueCallBacks, (NSUInteger)a3, (NSZone *)a4);
    while (!__ldaxr((unint64_t *)&qword_1ECD099A0))
    {
      if (!__stlxr((unint64_t)v8, (unint64_t *)&qword_1ECD099A0))
        goto LABEL_7;
    }
    __clrex();
    NSFreeMapTable(v8);
  }
LABEL_7:
  v10 = malloc_type_malloc(0x18uLL, 0x1080040622C3295uLL);
  *v10 = a3;
  v10[1] = objc_msgSend(a4, "copy");
  *((_DWORD *)v10 + 4) = 0;
  v11 = *a5;
  if (*a5)
  {
    v12 = 0;
    v13 = a5 + 1;
    do
    {
      v12 |= 1 << (v11 - 97);
      *((_DWORD *)v10 + 4) = v12;
      v14 = *(unsigned __int8 *)v13++;
      v11 = v14;
    }
    while (v14);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_7);
  if (NSMapGet((NSMapTable *)qword_1ECD099A0, a4))
    free(v10);
  else
    NSMapInsert((NSMapTable *)qword_1ECD099A0, a4, v10);
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_7);
}

- (NSError)initWithCoder:(id)a3
{
  NSError *v5;
  uint64_t v6;
  void **p_userInfo;
  void *userInfo;
  const __CFString *v9;
  id v10;
  const __CFString *v11;
  id v12;
  NSString *v14;
  uint64_t v15;
  int v16;
  objc_super v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)NSError;
  v5 = -[NSError init](&v17, sel_init);
  v6 = objc_msgSend((id)objc_msgSend(a3, "allowedClasses"), "setByAddingObjectsFromSet:", __NSPropertyListClasses_ForArchival_ErrorAndException());
  if (!objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v16 = 0;
    p_userInfo = (void **)&v5->_userInfo;
    objc_msgSend(a3, "decodeValuesOfObjCTypes:", "i@@", &v16, &v5->_domain, &v5->_userInfo);
    v5->_code = v16;
    if (!v5->_userInfo)
      return v5;
    if ((_NSIsNSDictionary() & 1) != 0)
    {
      userInfo = *p_userInfo;
      if (!*p_userInfo)
        return v5;
      goto LABEL_9;
    }
    goto LABEL_18;
  }
  if ((objc_msgSend(a3, "containsValueForKey:", CFSTR("NSCode")) & 1) == 0)
  {
    v14 = _NSMethodExceptionProem((objc_class *)v5, a2);
    v11 = CFSTR("%@: missing error code");
LABEL_19:
    v10 = +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", v11, v14, v15);
    goto LABEL_20;
  }
  v5->_code = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSCode"));
  if (objc_msgSend(a3, "error"))
    goto LABEL_5;
  v5->_domain = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSDomain"));
  if (objc_msgSend(a3, "error"))
    goto LABEL_5;
  if (!v5->_domain)
  {
    v14 = _NSMethodExceptionProem((objc_class *)v5, a2);
    v11 = CFSTR("%@: missing domain string");
    goto LABEL_19;
  }
  v5->_userInfo = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v6, CFSTR("NSUserInfo"));
  if (objc_msgSend(a3, "error"))
  {
LABEL_5:

    return 0;
  }
  if (!v5->_userInfo)
    return v5;
  if ((_NSIsNSDictionary() & 1) == 0)
  {
LABEL_18:
    v14 = _NSMethodExceptionProem((objc_class *)v5, a2);
    v11 = CFSTR("%@: userInfo dictionary found in archive was not a dictionary");
    goto LABEL_19;
  }
  userInfo = v5->_userInfo;
  if (!userInfo)
    return v5;
LABEL_9:
  v9 = _validateKnownUserInfoKeyTypes(userInfo);
  if (v9)
  {
    v10 = +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", CFSTR("%@: userInfo dictionary found in archive contained an invalid value type for key %@"), _NSMethodExceptionProem((objc_class *)v5, a2), v9);
LABEL_20:
    v12 = v10;

    objc_msgSend(a3, "failWithError:", v12);
    return 0;
  }
  return v5;
}

- (id)_cocoaErrorStringWithKind:(id)a3 variant:(id)a4
{
  NSMutableString *v7;
  NSMutableString *v8;
  id v9;

  v7 = -[NSString initWithFormat:]([NSMutableString alloc], "initWithFormat:", CFSTR("Err%ld"), -[NSError code](self, "code"));
  v8 = v7;
  if (a3)
    -[NSMutableString appendFormat:](v7, "appendFormat:", CFSTR("-%@"), a3);
  if (a4)
    -[NSMutableString appendFormat:](v8, "appendFormat:", CFSTR("(%@)"), a4);
  v9 = -[NSError _cocoaErrorString:](self, "_cocoaErrorString:", v8);

  return v9;
}

- (id)_cocoaErrorString:(id)a3
{
  uint64_t v5;
  id result;

  v5 = -[NSError code](self, "code");
  if (v5 >= 0x10000
    || (result = -[NSError _cocoaErrorString:fromBundle:tableName:](self, "_cocoaErrorString:fromBundle:tableName:", a3, _NSFoundationBundle(), CFSTR("FoundationErrors"))) == 0)
  {
    if ((v5 & 0xFFFFFFFFFFFF0000) != 0x20000 && (unint64_t)(v5 - 1024) > 0x3FE)
      return 0;
    result = -[NSError _cocoaErrorString:fromBundle:tableName:](self, "_cocoaErrorString:fromBundle:tableName:", a3, +[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CoreData")), CFSTR("CoreDataErrors"));
    if (!result)
      return 0;
  }
  return result;
}

- (id)_cocoaErrorString:(id)a3 fromBundle:(id)a4 tableName:(id)a5
{
  NSError *v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t i;
  char *v21;
  _BYTE *v22;
  _BYTE *v23;
  unint64_t v24;
  BOOL v25;
  id v26;
  NSString *v27;
  void *v28;
  void *v29;
  id result;
  id v31;
  _QWORD v32[2];
  uint64_t v33;
  NSError *v34;
  unint64_t v35;
  id v36;
  id v37;
  _BYTE v38[6];
  _OWORD v39[6];
  uint64_t v40;

  v37 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v36 = a4;
  if (!a4)
    return 0;
  v6 = self;
  memset(v39, 0, sizeof(v39));
  v7 = -[NSError _collectApplicableUserInfoFormatters:max:](self, "_collectApplicableUserInfoFormatters:max:", v39, 12);
  if (v7)
  {
    v33 = v7;
    v8 = 0;
    if (v7 >= 1)
    {
      v9 = (uint64_t *)v39;
      v10 = v7;
      do
      {
        v11 = *v9++;
        v8 |= *(_DWORD *)(v11 + 16);
        --v10;
      }
      while (v10);
    }
    v12 = 0;
    v13 = 0;
    do
    {
      if (((v8 >> v12) & 1) != 0)
        v38[v13++] = v12 + 97;
      if (v12 > 0x18)
        break;
      ++v12;
    }
    while (v13 < 6);
    v34 = v6;
    v32[1] = v32;
    v14 = 1 << v13;
    v15 = (char *)v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    *v15 = 0;
    if (1 << v13 >= 2)
    {
      v16 = 1;
      do
      {
        if (v16 < 2 * v16)
        {
          v17 = 0;
          do
          {
            v15[v16 + v17] = v15[v17] + 1;
            ++v17;
          }
          while (v16 != v17);
          v16 *= 2;
        }
      }
      while (v16 < v14);
    }
    if (v13 >= 1)
    {
      if (v14 <= 1)
        v18 = 1;
      else
        v18 = 1 << v13;
      v35 = (v13 + 16) & 0xFFFFFFFFFFFFFFF0;
      v19 = v13;
      do
      {
        if ((_DWORD)v13 != 31)
        {
          for (i = 0; i != v18; ++i)
          {
            if (v19 == v15[i])
            {
              v21 = (char *)v32 - v35;
              v22 = (char *)v32 - v35;
              if (i)
              {
                v23 = v38;
                v24 = i;
                v22 = (char *)v32 - v35;
                do
                {
                  if ((v24 & 1) != 0)
                    *v22++ = *v23;
                  ++v23;
                  v25 = v24 > 1;
                  v24 >>= 1;
                }
                while (v25);
              }
              *v22 = 0;
              v26 = a3;
              v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%s"), a3, v21);
              v28 = (void *)objc_msgSend(v36, "localizedStringForKey:value:table:", v27, 0, v37);
              if (v28)
              {
                v29 = v28;
                if ((objc_msgSend(v28, "isEqual:", v27) & 1) == 0)
                {
                  result = -[NSError _formatCocoaErrorString:parameters:applicableFormatters:count:](v34, "_formatCocoaErrorString:parameters:applicableFormatters:count:", v29, v21, v39, v33);
                  if (result)
                    return result;
                }
              }
              a3 = v26;
            }
          }
        }
        v25 = v19-- < 2;
      }
      while (!v25);
    }
    v6 = v34;
  }
  result = (id)objc_msgSend(v36, "localizedStringForKey:value:table:", a3, 0, v37);
  if (result)
  {
    v31 = result;
    if ((objc_msgSend(result, "isEqual:", a3) & 1) != 0)
      return 0;
    return -[NSError _formatCocoaErrorString:parameters:applicableFormatters:count:](v6, "_formatCocoaErrorString:parameters:applicableFormatters:count:", v31, 0, 0, 0);
  }
  return result;
}

- (id)_formatCocoaErrorString:(id)a3 parameters:(const char *)a4 applicableFormatters:(id *)a5 count:(int64_t)a6
{
  id v6;
  int64_t v10;
  int64_t v11;
  NSDictionary *v12;
  uint64_t v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **v14;
  uint64_t v15;
  int v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;
  const char *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v6 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4)
    {
      v10 = strlen(a4);
      if (v10 >= 1)
      {
        v11 = v10;
        v21 = v6;
        v22 = a4;
        v25 = 0u;
        v26 = 0u;
        v24 = 0u;
        v12 = -[NSError userInfo](self, "userInfo");
        v13 = 0;
        while (1)
        {
          if (a6 >= 1)
          {
            v14 = a5;
            v15 = v22[v13];
            v16 = 1 << (v22[v13] - 97);
            v17 = a6;
            do
            {
              if ((*((_DWORD *)*v14 + 4) & v16) != 0)
              {
                v18 = -[NSDictionary objectForKey:](v12, "objectForKey:", *((_QWORD *)*v14 + 1));
                if (v18)
                {
                  v19 = (*(uint64_t (**)(uint64_t, NSError *, uint64_t))*v14)(v18, self, v15);
                  if (v19)
                    *((_QWORD *)&v24 + v13) = v19;
                }
              }
              ++v14;
              --v17;
            }
            while (v17);
          }
          if (!*((_QWORD *)&v24 + v13))
            break;
          if (++v13 == v11)
            return +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v21, CFSTR("%@%@%@%@%@%@"), 0, v24, v25, v26);
        }
        return 0;
      }
    }
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSError;
  -[NSError dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)_CFErrorCreateDebugDescription();
}

+ (id)_web_errorWithDomain:(id)a3 code:(int64_t)a4 URL:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_web_initWithDomain_nowarn:code:URL:", a3, a4, a5);
}

- (id)_web_initWithDomain_nowarn:(id)a3 code:(int64_t)a4 URL:(id)a5
{
  id v9;
  void *v10;
  id v11;
  uint64_t LocalizedFailureReason;
  uint64_t LocalizedRecoverySuggestion;
  void *v14;

  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = v9;
  if (a5)
  {
    objc_msgSend(v9, "setObject:forKey:", a5, CFSTR("NSErrorFailingURLKey"));
    objc_msgSend(v10, "setObject:forKey:", objc_msgSend(a5, "absoluteString"), CFSTR("NSErrorFailingURLStringKey"));
  }
  objc_msgSend(a5, "host");
  v11 = localizedDescriptionForError(a3, a4);
  if (v11)
    objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("NSLocalizedDescription"));
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NSURLErrorDomain")))
  {
    LocalizedFailureReason = _CFNetworkErrorGetLocalizedFailureReason();
    if (LocalizedFailureReason)
      objc_msgSend(v10, "setObject:forKey:", LocalizedFailureReason, CFSTR("NSLocalizedFailureReason"));
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NSURLErrorDomain")))
  {
    LocalizedRecoverySuggestion = _CFNetworkErrorGetLocalizedRecoverySuggestion();
    if (LocalizedRecoverySuggestion)
      objc_msgSend(v10, "setObject:forKey:", LocalizedRecoverySuggestion, CFSTR("NSLocalizedRecoverySuggestion"));
  }
  if (objc_msgSend(v10, "count"))
    v14 = v10;
  else
    v14 = 0;
  return -[NSError initWithDomain:code:userInfo:](self, "initWithDomain:code:userInfo:", a3, a4, v14);
}

+ (void)userInfoValueProviderForDomain:(NSErrorDomain)errorDomain
{
  return (id)CFErrorCopyCallBackBlockForDomain();
}

+ (void)setUserInfoValueProviderForDomain:(NSErrorDomain)errorDomain provider:(void *)provider
{
  NSString *v6;

  if (!errorDomain)
  {
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil domain argument"), _NSMethodExceptionProem((objc_class *)a1, a2));
    goto LABEL_6;
  }
  if (-[NSString isEqual:](errorDomain, "isEqual:", CFSTR("NSCocoaErrorDomain")))
  {
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Cannot replace provider for NSCocoaErrorDomain"), _NSMethodExceptionProem((objc_class *)a1, a2));
LABEL_6:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v6, 0));
  }
  CFErrorSetCallBackBlockForDomain();
}

- (__CFString)_retainedUserInfoCallBackForKey:(id)a3
{
  __CFString *v5;
  const __CFString *v6;

  _CFAutoreleasePoolPush();
  if (objc_msgSend(a3, "isEqual:", CFSTR("NSLocalizedDescription")))
  {
    v5 = -[NSError _cocoaErrorStringWithKind:](self, "_cocoaErrorStringWithKind:", 0);
    if (v5)
    {
LABEL_9:
      CFRetain(v5);
      goto LABEL_10;
    }
    goto LABEL_5;
  }
  if ((objc_msgSend(a3, "isEqual:", CFSTR("NSLocalizedFailureReason")) & 1) != 0)
  {
LABEL_5:
    v6 = CFSTR("C");
    goto LABEL_8;
  }
  if (!objc_msgSend(a3, "isEqual:", CFSTR("NSLocalizedRecoverySuggestion")))
  {
    v5 = 0;
    goto LABEL_10;
  }
  v6 = CFSTR("R");
LABEL_8:
  v5 = -[NSError _cocoaErrorStringWithKind:](self, "_cocoaErrorStringWithKind:", v6);
  if (v5)
    goto LABEL_9;
LABEL_10:
  _CFAutoreleasePoolPop();
  return v5;
}

- (id)_cocoaErrorStringWithKind:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id result;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = -[NSDictionary objectForKey:](-[NSError userInfo](self, "userInfo"), "objectForKey:", CFSTR("NSUserStringVariant"));
  if (!v5)
    return -[NSError _cocoaErrorStringWithKind:variant:](self, "_cocoaErrorStringWithKind:variant:", a3, 0);
  v6 = v5;
  if (_NSIsNSString() && objc_msgSend(v6, "containsString:", CFSTR(",")))
    v6 = _variantPermutations((void *)objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(",")));
  if (!_NSIsNSArray())
  {
    result = -[NSError _cocoaErrorStringWithKind:variant:](self, "_cocoaErrorStringWithKind:variant:", a3, v6);
    if (result)
      return result;
    return -[NSError _cocoaErrorStringWithKind:variant:](self, "_cocoaErrorStringWithKind:variant:", a3, 0);
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (!v7)
    return -[NSError _cocoaErrorStringWithKind:variant:](self, "_cocoaErrorStringWithKind:variant:", a3, 0);
  v8 = v7;
  v9 = *(_QWORD *)v14;
LABEL_8:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v14 != v9)
      objc_enumerationMutation(v6);
    result = -[NSError _cocoaErrorStringWithKind:variant:](self, "_cocoaErrorStringWithKind:variant:", a3, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
    if (result)
      return result;
    if (v8 == ++v10)
    {
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      if (v8)
        goto LABEL_8;
      return -[NSError _cocoaErrorStringWithKind:variant:](self, "_cocoaErrorStringWithKind:variant:", a3, 0);
    }
  }
}

- (NSString)localizedDescription
{
  id v3;
  void *LocalizedDescription;

  v3 = -[NSDictionary objectForKey:](-[NSError userInfo](self, "userInfo"), "objectForKey:", CFSTR("NSLocalizedDescription"));
  if (v3)
  {
    LocalizedDescription = (void *)objc_msgSend(v3, "copy");
    return (NSString *)LocalizedDescription;
  }
  LocalizedDescription = (void *)_CFErrorCreateLocalizedDescription();
  if (LocalizedDescription)
    return (NSString *)LocalizedDescription;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend((id)_NSFoundationBundle(), "localizedStringForKey:value:table:", CFSTR("The operation couldn\\U2019t be completed. (%1$@ error %2$ld.)"), &stru_1E0F56070, CFSTR("FoundationErrors")), -[NSError domain](self, "domain"), -[NSError code](self, "code"));
}

- (NSString)localizedFailureReason
{
  id v2;
  NSString *result;

  v2 = -[NSDictionary objectForKey:](-[NSError userInfo](self, "userInfo"), "objectForKey:", CFSTR("NSLocalizedFailureReason"));
  if (v2)
    return (NSString *)(id)objc_msgSend(v2, "copy");
  result = (NSString *)_CFErrorCreateLocalizedFailureReason();
  if (result)
    return result;
  return result;
}

+ (void)_setFileNameLocalizationEnabled:(BOOL)a3
{
  fileNameLocalizationDisabled = !a3;
}

- (NSError)init
{
  NSObject *v3;
  objc_super v5;
  uint8_t buf[8];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((init_warned & 1) == 0)
  {
    init_warned = 1;
    v3 = _NSOSLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1817D9000, v3, OS_LOG_TYPE_ERROR, "-[NSError init] called; this results in an invalid NSError instance. It will raise an exception in a future rele"
        "ase. Please call errorWithDomain:code:userInfo: or initWithDomain:code:userInfo:. This message shown only once.",
        buf,
        2u);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)NSError;
  return -[NSError init](&v5, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  NSInteger v5;
  int v6;
  NSDictionary *v7;
  uint64_t v8;

  if (self == a3)
    goto LABEL_9;
  if (!a3
    || (objc_opt_isKindOfClass() & 1) == 0
    || (v5 = -[NSError code](self, "code"), v5 != objc_msgSend(a3, "code")))
  {
    LOBYTE(v6) = 0;
    return v6;
  }
  v6 = -[NSString isEqual:](-[NSError domain](self, "domain"), "isEqual:", objc_msgSend(a3, "domain"));
  if (v6)
  {
    v7 = -[NSError userInfo](self, "userInfo");
    v8 = objc_msgSend(a3, "userInfo");
    if (v7 != (NSDictionary *)v8)
    {
      LOBYTE(v6) = -[NSDictionary isEqual:](v7, "isEqual:", v8);
      return v6;
    }
LABEL_9:
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (NSString)localizedRecoverySuggestion
{
  id v2;
  NSString *result;

  v2 = -[NSDictionary objectForKey:](-[NSError userInfo](self, "userInfo"), "objectForKey:", CFSTR("NSLocalizedRecoverySuggestion"));
  if (v2)
    return (NSString *)(id)objc_msgSend(v2, "copy");
  result = (NSString *)_CFErrorCreateLocalizedRecoverySuggestion();
  if (result)
    return result;
  return result;
}

- (NSArray)localizedRecoveryOptions
{
  id v3;
  uint64_t v5;
  const void *v6;
  NSArray *v7;

  v3 = -[NSDictionary objectForKey:](-[NSError userInfo](self, "userInfo"), "objectForKey:", CFSTR("NSLocalizedRecoveryOptions"));
  if (v3)
    return (NSArray *)v3;
  -[NSError domain](self, "domain");
  v5 = CFErrorCopyCallBackBlockForDomain();
  if (!v5)
    return 0;
  v6 = (const void *)v5;
  v7 = (NSArray *)(*(uint64_t (**)(uint64_t, NSError *, const __CFString *))(v5 + 16))(v5, self, CFSTR("NSLocalizedRecoveryOptions"));
  CFRelease(v6);
  if (!v7)
    return 0;
  return v7;
}

- (id)recoveryAttempter
{
  id v3;
  uint64_t v4;
  const void *v5;

  v3 = -[NSDictionary objectForKey:](-[NSError userInfo](self, "userInfo"), "objectForKey:", CFSTR("NSRecoveryAttempter"));
  if (!v3)
  {
    -[NSError domain](self, "domain");
    v4 = CFErrorCopyCallBackBlockForDomain();
    if (!v4)
      return 0;
    v5 = (const void *)v4;
    v3 = (id)(*(uint64_t (**)(uint64_t, NSError *, const __CFString *))(v4 + 16))(v4, self, CFSTR("NSRecoveryAttempter"));
    CFRelease(v5);
    if (!v3)
      return 0;
  }
  return v3;
}

- (NSString)helpAnchor
{
  NSString *v3;
  uint64_t v4;
  const void *v5;

  v3 = -[NSDictionary objectForKey:](-[NSError userInfo](self, "userInfo"), "objectForKey:", CFSTR("NSHelpAnchor"));
  if (!v3)
  {
    -[NSError domain](self, "domain");
    v4 = CFErrorCopyCallBackBlockForDomain();
    if (!v4)
      return 0;
    v5 = (const void *)v4;
    v3 = (NSString *)(*(uint64_t (**)(uint64_t, NSError *, const __CFString *))(v4 + 16))(v4, self, CFSTR("NSHelpAnchor"));
    CFRelease(v5);
    if (!v3)
      return 0;
  }
  return v3;
}

- (NSArray)underlyingErrors
{
  id v3;
  id v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = -[NSDictionary objectForKey:](-[NSError userInfo](self, "userInfo"), "objectForKey:", CFSTR("NSUnderlyingError"));
  v4 = -[NSDictionary objectForKey:](-[NSError userInfo](self, "userInfo"), "objectForKey:", CFSTR("NSMultipleUnderlyingErrorsKey"));
  v5 = -[NSDictionary objectForKey:](-[NSError userInfo](self, "userInfo"), "objectForKey:", CFSTR("NSDetailedErrors"));
  v6 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[NSArray addObject:](v6, "addObject:", v3);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v4);
        v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[NSArray addObject:](v6, "addObject:", v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
    }
    while (v8);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v5);
        v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[NSArray addObject:](v6, "addObject:", v16);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
    }
    while (v13);
  }
  return v6;
}

+ (void)_web_addErrorsWithCodesAndDescriptions:(id)a3 inDomain:(id)a4
{
  pthread_once(&initControl, WebNSErrorExtrasInit);
  objc_msgSend((id)descriptions, "setObject:forKey:", a3, a4);
}

+ (id)_web_errorWithDomain:(id)a3 code:(int64_t)a4 failingURL:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_web_initWithDomain:code:failingURL:", a3, a4, a5);
}

- (id)_web_initWithDomain:(id)a3 code:(int64_t)a4 failingURL:(id)a5
{
  id v9;
  void *v10;
  id v11;
  uint64_t LocalizedFailureReason;
  uint64_t LocalizedRecoverySuggestion;
  void *v14;

  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = v9;
  if (a5)
  {
    objc_msgSend(v9, "setObject:forKey:", a5, CFSTR("NSErrorFailingURLStringKey"));
    a5 = (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a5);
    if (a5)
      objc_msgSend(v10, "setObject:forKey:", a5, CFSTR("NSErrorFailingURLKey"));
  }
  objc_msgSend(a5, "host");
  v11 = localizedDescriptionForError(a3, a4);
  if (v11)
    objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("NSLocalizedDescription"));
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NSURLErrorDomain")))
  {
    LocalizedFailureReason = _CFNetworkErrorGetLocalizedFailureReason();
    if (LocalizedFailureReason)
      objc_msgSend(v10, "setObject:forKey:", LocalizedFailureReason, CFSTR("NSLocalizedFailureReason"));
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NSURLErrorDomain")))
  {
    LocalizedRecoverySuggestion = _CFNetworkErrorGetLocalizedRecoverySuggestion();
    if (LocalizedRecoverySuggestion)
      objc_msgSend(v10, "setObject:forKey:", LocalizedRecoverySuggestion, CFSTR("NSLocalizedRecoverySuggestion"));
  }
  if (objc_msgSend(v10, "count"))
    v14 = v10;
  else
    v14 = 0;
  return -[NSError initWithDomain:code:userInfo:](self, "initWithDomain:code:userInfo:", a3, a4, v14);
}

- (BOOL)_web_errorIsInDomain:(id)a3
{
  return -[NSString isEqualToString:](-[NSError domain](self, "domain"), "isEqualToString:", a3);
}

- (id)_web_localizedDescription
{
  id v3;
  void *v4;
  NSString *v5;
  uint64_t v6;
  id result;

  v3 = -[NSError _web_failingURL](self, "_web_failingURL");
  if (v3)
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  else
    v4 = 0;
  v5 = -[NSError domain](self, "domain");
  v6 = -[NSError code](self, "code");
  objc_msgSend(v4, "host");
  result = localizedDescriptionForError(v5, v6);
  if (!result)
    return -[NSError localizedDescription](self, "localizedDescription");
  return result;
}

- (id)_web_failingURL
{
  return (id)objc_msgSend(-[NSDictionary objectForKey:](-[NSError userInfo](self, "userInfo"), "objectForKey:", CFSTR("NSErrorFailingURLStringKey")), "copy");
}

+ (id)_readCorruptErrorWithFormat:(id)a3
{
  NSString *v3;
  NSString *v4;
  uint64_t v5;
  const __CFString *v7;
  _QWORD v8[2];
  uint64_t v9;

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = -[NSString initWithFormat:arguments:]([NSString alloc], "initWithFormat:arguments:", a3, &v9);
  if (v3)
  {
    v4 = v3;
    v7 = CFSTR("NSDebugDescription");
    v8[0] = v3;
    v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);

  }
  else
  {
    v5 = 0;
  }
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, v5, &v9);
}

- (id)replacementObjectForPortCoder:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isByref"))
  {
    v6.receiver = self;
    v6.super_class = (Class)NSError;
    return -[NSError replacementObjectForPortCoder:](&v6, sel_replacementObjectForPortCoder_, a3);
  }
  return self;
}

@end
