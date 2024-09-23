@implementation NEHasher

- (NEHasher)init
{
  NEHasher *v2;
  CC_SHA1_CTX *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NEHasher;
  v2 = -[NEHasher init](&v5, sel_init);
  if (v2)
  {
    v3 = (CC_SHA1_CTX *)malloc_type_malloc(0x60uLL, 0x1000040565EDBD2uLL);
    v2->_sha1Context = v3;
    CC_SHA1_Init(v3);
  }
  return v2;
}

- (void)dealloc
{
  CC_SHA1state_st *sha1Context;
  objc_super v4;

  if (self)
  {
    sha1Context = self->_sha1Context;
    if (sha1Context)
      free(sha1Context);
  }
  v4.receiver = self;
  v4.super_class = (Class)NEHasher;
  -[NEHasher dealloc](&v4, sel_dealloc);
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (BOOL)containsValueForKey:(id)a3
{
  return 0;
}

- (int64_t)versionForClassName:(id)a3
{
  return 0;
}

- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4
{
  NEHasher *v5;
  int v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  CC_LONG v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  CC_SHA1_CTX *v26;
  NSObject *v27;
  const char *v28;
  CC_LONG v29;
  CC_SHA1_CTX *sha1Context;
  const char *p_data;
  uint64_t v32;
  id v33;
  const char *v34;
  id Property;
  objc_class *v36;
  const char *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t m;
  NSObject *v43;
  objc_class *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  __int128 data;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  if (!a4)
    return;
  v5 = self;
  v6 = *a3;
  if (v6 == 64)
  {
    v7 = *(id *)a4;
    v8 = v7;
    if (!v7)
    {
LABEL_42:

      return;
    }
    if (isa_nsdictionary(v7))
    {
      v9 = v8;
      objc_msgSend(v9, "allKeys");
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v59;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v59 != v13)
              objc_enumerationMutation(v10);
            if (!isa_nsstring(*(void **)(*((_QWORD *)&v58 + 1) + 8 * i)))
            {

              ne_log_obj();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                LOWORD(data) = 0;
                _os_log_debug_impl(&dword_19BD16000, v15, OS_LOG_TYPE_DEBUG, "Not hashing dictionary containing one or more non-string keys", (uint8_t *)&data, 2u);
              }
              goto LABEL_39;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
          if (v12)
            continue;
          break;
        }
      }

      objc_msgSend(v10, "sortedArrayUsingSelector:", NSSelectorFromString(CFSTR("compare:")));
      v15 = objc_claimAutoreleasedReturnValue();
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v55;
        do
        {
          for (j = 0; j != v17; ++j)
          {
            if (*(_QWORD *)v55 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[NEHasher encodeObject:](v5, "encodeObject:", v20);

          }
          v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
        }
        while (v17);
      }
LABEL_39:

LABEL_40:
      goto LABEL_41;
    }
    if (isa_nsarray(v8))
    {
      v9 = v8;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v22 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v51;
        do
        {
          for (k = 0; k != v23; ++k)
          {
            if (*(_QWORD *)v51 != v24)
              objc_enumerationMutation(v9);
            -[NEHasher encodeObject:](v5, "encodeObject:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * k));
          }
          v23 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
        }
        while (v23);
      }
LABEL_41:

      goto LABEL_42;
    }
    if (isa_nsdata(v8))
    {
      -[NEHasher encodeDataObject:](v5, "encodeDataObject:", v8);
      goto LABEL_42;
    }
    if (isa_nsstring(v8))
    {
      v28 = (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      if (v5)
LABEL_57:
        v5 = (NEHasher *)v5->_sha1Context;
    }
    else
    {
      if (isa_nsnumber(v8))
      {
        objc_msgSend(v8, "doubleValue");
        *(_QWORD *)&data = v32;
        if (v5)
          sha1Context = v5->_sha1Context;
        else
          sha1Context = 0;
        p_data = (const char *)&data;
        v29 = 8;
        goto LABEL_67;
      }
      if (isa_nsuuid(v8))
      {
        data = 0uLL;
        objc_msgSend(v8, "getUUIDBytes:", &data);
        if (v5)
          sha1Context = v5->_sha1Context;
        else
          sha1Context = 0;
        p_data = (const char *)&data;
        v29 = 16;
        goto LABEL_67;
      }
      if (!isa_nsurl(v8))
      {
        if (isa_neclass())
        {
          objc_msgSend(v8, "encodeWithCoder:", v5);
        }
        else
        {
          if (v5)
            Property = objc_getProperty(v5, v34, 16, 1);
          else
            Property = 0;
          if (objc_msgSend(Property, "count"))
          {
            v36 = (objc_class *)objc_opt_class();
            NSStringFromClass(v36);
            v9 = (id)objc_claimAutoreleasedReturnValue();
            v46 = 0u;
            v47 = 0u;
            v48 = 0u;
            v49 = 0u;
            if (v5)
              v38 = objc_getProperty(v5, v37, 16, 1);
            else
              v38 = 0;
            v10 = v38;
            v39 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
            if (v39)
            {
              v40 = v39;
              v41 = *(_QWORD *)v47;
              while (2)
              {
                for (m = 0; m != v40; ++m)
                {
                  if (*(_QWORD *)v47 != v41)
                    objc_enumerationMutation(v10);
                  if (objc_msgSend(v9, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * m), (_QWORD)v46))
                  {
                    objc_msgSend(v8, "encodeWithCoder:", v5);
                    goto LABEL_40;
                  }
                }
                v40 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
                if (v40)
                  continue;
                break;
              }
            }

          }
          ne_log_obj();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            v44 = (objc_class *)objc_opt_class();
            NSStringFromClass(v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(data) = 138412290;
            *(_QWORD *)((char *)&data + 4) = v45;
            _os_log_debug_impl(&dword_19BD16000, v43, OS_LOG_TYPE_DEBUG, "Not hashing value with class %@", (uint8_t *)&data, 0xCu);

          }
        }
        goto LABEL_42;
      }
      objc_msgSend(v8, "absoluteString");
      v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v28 = (const char *)objc_msgSend(v33, "UTF8String");

      if (v5)
        goto LABEL_57;
    }
    v29 = strlen(v28);
    sha1Context = (CC_SHA1_CTX *)v5;
    p_data = v28;
LABEL_67:
    CC_SHA1_Update(sha1Context, p_data, v29);
    goto LABEL_42;
  }
  v21 = 1;
  if (v6 > 80)
  {
    switch(v6)
    {
      case 'c':
        goto LABEL_47;
      case 'd':
      case 'l':
        goto LABEL_46;
      case 'e':
      case 'f':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
        goto LABEL_52;
      case 'i':
        goto LABEL_27;
      default:
        if (v6 == 81 || v6 == 113)
          goto LABEL_46;
        goto LABEL_52;
    }
  }
  if ((v6 - 66) < 2)
    goto LABEL_47;
  if (v6 == 73)
  {
LABEL_27:
    v21 = 4;
LABEL_47:
    if (self)
      v26 = self->_sha1Context;
    else
      v26 = 0;
    CC_SHA1_Update(v26, a4, v21);
    return;
  }
  if (v6 == 76)
  {
LABEL_46:
    v21 = 8;
    goto LABEL_47;
  }
LABEL_52:
  ne_log_obj();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(data) = 136315138;
    *(_QWORD *)((char *)&data + 4) = a3;
    _os_log_debug_impl(&dword_19BD16000, v27, OS_LOG_TYPE_DEBUG, "Not hashing value with type %s", (uint8_t *)&data, 0xCu);
  }

}

- (void)encodeDataObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8 = v4;
    v6 = objc_msgSend(v4, "length");
    v5 = v8;
    if (v6)
    {
      if (self)
        self = (NEHasher *)self->_sha1Context;
      v7 = objc_retainAutorelease(v8);
      CC_SHA1_Update((CC_SHA1_CTX *)self, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
      v5 = v8;
    }
  }

}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4;

  v4 = a3;
  -[NEHasher encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", "B", &v4);
}

- (void)encodeBytes:(const void *)a3 length:(unint64_t)a4
{
  if (a3 && a4)
  {
    if (self)
      self = (NEHasher *)self->_sha1Context;
    CC_SHA1_Update((CC_SHA1_CTX *)self, a3, a4);
  }
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  double v4;

  v4 = a3;
  -[NEHasher encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", "d", &v4);
}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  int v4;

  v4 = a3;
  -[NEHasher encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", "i", &v4);
}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  float v4;

  v4 = a3;
  -[NEHasher encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", "f", &v4);
}

- (void)encodeInteger:(int64_t)a3 forKey:(id)a4
{
  int64_t v4;

  v4 = a3;
  -[NEHasher encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", "q", &v4);
}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  int v4;

  v4 = a3;
  -[NEHasher encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", "i", &v4);
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  int64_t v4;

  v4 = a3;
  -[NEHasher encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", "q", &v4);
}

- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NEHasherInvalidOperationException"), CFSTR("NEHasher cannot be used as a decoder"), 0);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_exception_throw(v4);
}

- (id)decodeDataObject
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NEHasherInvalidOperationException"), CFSTR("NEHasher cannot be used as a decoder"), 0);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_exception_throw(v2);
}

- (BOOL)decodeBoolForKey:(id)a3
{
  BOOL v4;

  v4 = 0;
  -[NEHasher decodeValueOfObjCType:at:size:](self, "decodeValueOfObjCType:at:size:", "B", &v4, 1);
  return v4;
}

- (const)decodeBytesForKey:(id)a3 returnedLength:(unint64_t *)a4
{
  return (const char *)-[NEHasher decodeBytesWithReturnedLength:](objc_retainAutorelease(self), "decodeBytesWithReturnedLength:", a4);
}

- (double)decodeDoubleForKey:(id)a3
{
  double v4;

  v4 = 0.0;
  -[NEHasher decodeValueOfObjCType:at:size:](self, "decodeValueOfObjCType:at:size:", "d", &v4, 8);
  return v4;
}

- (float)decodeFloatForKey:(id)a3
{
  float v4;

  v4 = 0.0;
  -[NEHasher decodeValueOfObjCType:at:size:](self, "decodeValueOfObjCType:at:size:", "f", &v4, 4);
  return v4;
}

- (int)decodeInt32ForKey:(id)a3
{
  int v4;

  v4 = 0;
  -[NEHasher decodeValueOfObjCType:at:size:](self, "decodeValueOfObjCType:at:size:", "i", &v4, 4);
  return v4;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  int64_t v4;

  v4 = 0;
  -[NEHasher decodeValueOfObjCType:at:size:](self, "decodeValueOfObjCType:at:size:", "q", &v4, 8);
  return v4;
}

- (int64_t)decodeIntegerForKey:(id)a3
{
  int64_t v4;

  v4 = 0;
  -[NEHasher decodeValueOfObjCType:at:size:](self, "decodeValueOfObjCType:at:size:", "q", &v4, 8);
  return v4;
}

- (int)decodeIntForKey:(id)a3
{
  int v4;

  v4 = 0;
  -[NEHasher decodeValueOfObjCType:at:size:](self, "decodeValueOfObjCType:at:size:", "i", &v4, 4);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classPrefixWhitelist, 0);
}

+ (id)hashObject:(id)a3
{
  id v3;
  NEHasher *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(NEHasher);
  -[NEHasher encodeRootObject:](v4, "encodeRootObject:", v3);

  -[NEHasher finishHashing]((uint64_t)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hashObject:(id)a3 withClassPrefixWhitelist:(id)a4
{
  id v5;
  id v6;
  NEHasher *v7;
  const char *v8;
  NEHasher *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(NEHasher);
  v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, v6, 16);
    -[NEHasher encodeRootObject:](v9, "encodeRootObject:", v5);
    -[NEHasher finishHashing]((uint64_t)v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(0, "encodeRootObject:", v5);
    v10 = 0;
  }

  return v10;
}

- (id)finishHashing
{
  CC_SHA1_CTX *v2;
  void *v3;
  unsigned __int8 md[20];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = *(CC_SHA1_CTX **)(a1 + 8);
  if (!v2)
    return 0;
  CC_SHA1_Final(md, v2);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  free(*(void **)(a1 + 8));
  *(_QWORD *)(a1 + 8) = 0;
  return v3;
}

@end
