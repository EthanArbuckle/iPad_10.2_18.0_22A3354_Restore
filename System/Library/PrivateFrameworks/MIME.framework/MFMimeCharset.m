@implementation MFMimeCharset

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)allMimeCharsets:(BOOL)a3
{
  id v4;
  __CFArray *Mutable;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  CFMutableArrayRef MutableCopy;
  void *v21;
  void *v22;
  void *v23;
  CFIndex Count;
  CFIndex i;
  const void *ValueAtIndex;
  CFIndex v27;
  CFIndex v28;
  _DWORD *v29;
  BOOL v30;
  void *v31;
  uint64_t v32;
  void *v33;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v35;
  id v36;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  BOOL v43;
  id obj;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;
  CFRange v57;

  v56 = *MEMORY[0x1E0C80C00];
  _MFLockGlobalLock();
  v4 = (id)allMimeCharsets__cachedResult;
  _MFUnlockGlobalLock();
  v43 = a3;
  if (!a3 && v4)
    return v4;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v4;
  objc_msgSend(v6, "stringArrayForKey:", CFSTR("AppleKeyboards"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = v7;
  _convertKeyboardsArrayToLanguages(v7);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v42, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "objectAtIndex:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v12);

    }
    if (v11)
      objc_msgSend(v8, "addObject:", v11);
    _convertKeyboardsArrayToLanguages(v8);
    v13 = objc_claimAutoreleasedReturnValue();

    v42 = (void *)v13;
  }
  v39 = (void *)objc_msgSend(objc_allocWithZone((Class)a1), "initWithEncoding:", 1536);
  CFArrayAppendValue(Mutable, v39);
  v40 = (void *)objc_msgSend(objc_allocWithZone((Class)a1), "initWithEncoding:", 134217984);
  CFArrayAppendValue(Mutable, v40);
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v42;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (!v14)
  {
    v15 = 0;
    goto LABEL_43;
  }
  v48 = v14;
  v15 = 0;
  v46 = *MEMORY[0x1E0C99820];
  v47 = *(_QWORD *)v52;
  v45 = *MEMORY[0x1E0C997E8];
  do
  {
    v49 = 0;
    do
    {
      if (*(_QWORD *)v52 != v47)
        objc_enumerationMutation(obj);
      v16 = *(id *)(*((_QWORD *)&v51 + 1) + 8 * v49);
      if (_copyEncodingsForLocaleIdentifier_onceToken != -1)
        dispatch_once(&_copyEncodingsForLocaleIdentifier_onceToken, &__block_literal_global_6);
      objc_msgSend((id)_copyEncodingsForLocaleIdentifier_regionEncodingMapping, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v46);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        if (v17)
          MutableCopy = CFArrayCreateMutableCopy(0, 0, (CFArrayRef)v17);
        else
          MutableCopy = CFArrayCreateMutable(0, 0, 0);
        v17 = MutableCopy;
        v21 = (void *)_copyEncodingsForLocaleIdentifier_regionEncodingMapping;
        objc_msgSend(v18, "objectForKeyedSubscript:", v45);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          v57.length = CFArrayGetCount((CFArrayRef)v23);
          v57.location = 0;
          CFArrayAppendArray((CFMutableArrayRef)v17, (CFArrayRef)v23, v57);
        }

        if (!v17)
          goto LABEL_37;
      }
      else
      {
        if (!v17)
        {

          goto LABEL_37;
        }
        CFRetain(v17);

      }
      Count = CFArrayGetCount((CFArrayRef)v17);
      if (Count < 1)
      {
        v31 = v15;
      }
      else
      {
        for (i = 0; i != Count; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v17, i);
          v27 = CFArrayGetCount(Mutable);
          if (v27 < 1)
          {
LABEL_31:
            v31 = (void *)objc_msgSend(objc_allocWithZone((Class)a1), "initWithEncoding:", ValueAtIndex);

            objc_msgSend(v31, "_setPrimaryLanguage:", v16);
            CFArrayAppendValue(Mutable, v31);
          }
          else
          {
            v28 = 0;
            while (1)
            {
              CFArrayGetValueAtIndex(Mutable, v28);
              v29 = (_DWORD *)objc_claimAutoreleasedReturnValue();
              v30 = v29[2] == (_DWORD)ValueAtIndex;

              if (v30)
                break;
              if (v27 == ++v28)
                goto LABEL_31;
            }
            v31 = v15;
          }
          v15 = v31;
        }
      }
      v15 = v31;
      CFRelease(v17);
LABEL_37:
      ++v49;
    }
    while (v49 != v48);
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    v48 = v32;
  }
  while (v32);
LABEL_43:

  v33 = v41;
  if (!v43)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)__keyboardsUpdated, CFSTR("AppleKeyboardsPreferencesChangedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  _MFLockGlobalLock();
  v35 = (void *)allMimeCharsets__cachedResult;
  if (v43 || !allMimeCharsets__cachedResult)
  {
    allMimeCharsets__cachedResult = (uint64_t)Mutable;

    v33 = v41;
  }
  else
  {
    CFRelease(Mutable);
  }
  v36 = (id)allMimeCharsets__cachedResult;

  v4 = v36;
  _MFUnlockGlobalLock();
  return v4;
}

+ (id)allMimeCharsets
{
  return (id)objc_msgSend(a1, "allMimeCharsets:", 0);
}

+ (id)charsetForEncoding:(unsigned int)a3
{
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  _DWORD *v8;

  v4 = (const __CFArray *)objc_msgSend(a1, "allMimeCharsets");
  Count = CFArrayGetCount(v4);
  if (Count < 1)
  {
LABEL_5:
    v8 = 0;
  }
  else
  {
    v6 = Count;
    v7 = 0;
    while (1)
    {
      CFArrayGetValueAtIndex(v4, v7);
      v8 = (_DWORD *)objc_claimAutoreleasedReturnValue();
      if (v8[2] == a3)
        break;

      if (v6 == ++v7)
        goto LABEL_5;
    }
  }
  return v8;
}

+ (id)preferredMimeCharset
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "allMimeCharsets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "count") < 2)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "objectAtIndex:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (MFMimeCharset)initWithCoder:(id)a3
{
  id v4;
  MFMimeCharset *v5;

  v4 = a3;
  v5 = -[MFMimeCharset initWithEncoding:](self, "initWithEncoding:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("Encoding")));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt32:forKey:", self->_encoding, CFSTR("Encoding"));
}

- (MFMimeCharset)initWithEncoding:(unsigned int)a3
{
  MFMimeCharset *v4;
  MFMimeCharset *v5;
  NSString *v6;
  uint64_t v7;
  NSString *primaryLanguage;
  NSString *v9;
  uint64_t v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  NSString *v15;
  NSString *v16;
  NSString *v17;
  void *v18;
  void *v19;
  char v20;
  NSString *v21;
  NSString *charsetName;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)MFMimeCharset;
  v4 = -[MFMimeCharset init](&v24, sel_init);
  v5 = v4;
  if (!v4)
    return v5;
  v4->_encoding = a3;
  if ((int)a3 > 2111)
  {
    if ((int)a3 > 2367)
    {
      switch(a3)
      {
        case 0xA02u:
        case 0xA05u:
          goto LABEL_21;
        case 0xA03u:
        case 0xA06u:
          goto LABEL_20;
        case 0xA04u:
          goto LABEL_26;
        default:
          if (a3 == 2814 || a3 == 2368)
            goto LABEL_25;
          goto LABEL_26;
      }
    }
    if (a3 != 2112)
    {
      if (a3 != 2336)
      {
        if (a3 == 2352)
        {
          primaryLanguage = v4->_primaryLanguage;
          v4->_primaryLanguage = 0;

          v7 = objc_msgSend(CFSTR("GB2312"), "copy");
          goto LABEL_29;
        }
        goto LABEL_26;
      }
      goto LABEL_25;
    }
    goto LABEL_20;
  }
  if ((int)a3 <= 1055)
  {
    if (a3 >= 2)
    {
      if (a3 == 518)
      {
        v21 = v4->_primaryLanguage;
        v4->_primaryLanguage = 0;

        v7 = objc_msgSend(CFSTR("ISO-8859-6-i"), "copy");
        goto LABEL_29;
      }
      if (a3 == 520)
      {
        v6 = v4->_primaryLanguage;
        v4->_primaryLanguage = 0;

        v7 = objc_msgSend(CFSTR("ISO-8859-8-i"), "copy");
LABEL_29:
        charsetName = v5->_charsetName;
        v5->_charsetName = (NSString *)v7;

        v14 = *((_BYTE *)v5 + 32) & 0xF8 | 4;
        goto LABEL_30;
      }
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if ((int)a3 > 1058)
  {
    if (a3 == 1059)
    {
LABEL_21:
      v15 = v4->_primaryLanguage;
      v4->_primaryLanguage = 0;

      v11 = v5->_charsetName;
      v5->_charsetName = 0;
      goto LABEL_22;
    }
    if (a3 == 2080)
    {
LABEL_20:
      v12 = v4->_primaryLanguage;
      v4->_primaryLanguage = 0;

      v13 = v5->_charsetName;
      v5->_charsetName = 0;

      v14 = *((_BYTE *)v5 + 32) | 7;
LABEL_30:
      *((_BYTE *)v5 + 32) = v14;
      return v5;
    }
  }
  else
  {
    if (a3 == 1056)
    {
LABEL_25:
      v16 = v4->_primaryLanguage;
      v4->_primaryLanguage = 0;

      v17 = v5->_charsetName;
      v5->_charsetName = 0;

      v14 = *((_BYTE *)v5 + 32) & 0xF8;
      goto LABEL_30;
    }
    if (a3 == 1057)
    {
      v9 = v4->_primaryLanguage;
      v4->_primaryLanguage = 0;

      v10 = objc_msgSend(CFSTR("CP936"), "copy");
      v11 = v5->_charsetName;
      v5->_charsetName = (NSString *)v10;
LABEL_22:

      v14 = *((_BYTE *)v5 + 32) & 0xF8 | 5;
      goto LABEL_30;
    }
  }
LABEL_26:
  -[MFMimeCharset charsetName](v4, "charsetName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
    v20 = 4 * (objc_msgSend(v18, "rangeOfString:options:", CFSTR("X-"), 9) == 0x7FFFFFFFFFFFFFFFLL);
  else
    v20 = 0;
  *((_BYTE *)v5 + 32) = *((_BYTE *)v5 + 32) & 0xFB | v20;

  return v5;
}

- (void)_setPrimaryLanguage:(id)a3
{
  NSString *v4;
  NSString *primaryLanguage;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  primaryLanguage = self->_primaryLanguage;
  self->_primaryLanguage = v4;

}

- (unsigned)cfStringEncoding
{
  return self->_encoding;
}

- (unint64_t)encoding
{
  return CFStringConvertEncodingToNSStringEncoding(self->_encoding);
}

- (NSString)charsetName
{
  NSString *charsetName;
  void *v4;
  NSString *v5;
  NSString *v6;

  charsetName = self->_charsetName;
  if (!charsetName)
  {
    MFCharsetForEncoding(self->_encoding);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      _MFLockGlobalLock();
      if (!self->_charsetName)
      {
        v5 = (NSString *)objc_msgSend(v4, "copyWithZone:", 0);
        v6 = self->_charsetName;
        self->_charsetName = v5;

      }
      _MFUnlockGlobalLock();
    }

    charsetName = self->_charsetName;
  }
  return charsetName;
}

- (BOOL)canBeUsedForOutgoingMessages
{
  return (*((unsigned __int8 *)self + 32) >> 2) & 1;
}

- (BOOL)coversLargeUnicodeSubset
{
  return *((_BYTE *)self + 32) & 1;
}

- (BOOL)useBase64InHeaders
{
  return (*((unsigned __int8 *)self + 32) >> 1) & 1;
}

- (NSString)displayName
{
  CFStringEncoding encoding;
  void *v3;

  encoding = self->_encoding;
  if (encoding == -1)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedNameOfStringEncoding:", CFStringConvertEncodingToNSStringEncoding(encoding));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (id)primaryLanguage
{
  return self->_primaryLanguage;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MFMimeCharset displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> %@ encoding=0X%08lX charsetName=%@ lang=%@"), v4, self, v5, self->_encoding, self->_charsetName, self->_primaryLanguage);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_charsetName, 0);
  objc_storeStrong((id *)&self->_primaryLanguage, 0);
}

@end
