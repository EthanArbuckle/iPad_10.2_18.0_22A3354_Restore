@implementation NSString(NSStringUtils)

+ (uint64_t)mf_UUID
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
}

+ (id)mf_messageIDStringWithDomainHint:()NSStringUtils
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0D1E710], "stringByEncodingDomainName:", a3);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", objc_msgSend(v4, "length") + objc_msgSend(v5, "length") + 3);
  objc_msgSend(v6, "appendString:", CFSTR("<"));
  objc_msgSend(v6, "appendString:", v4);
  if (a3)
  {
    objc_msgSend(v6, "appendString:", CFSTR("@"));
    objc_msgSend(v6, "appendString:", v5);
  }
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (uint64_t)mf_stringByLocalizingReOrFwdPrefix
{
  int v2;

  v2 = mf_stringByLocalizingReOrFwdPrefix_localizedRePrefix;
  if (mf_stringByLocalizingReOrFwdPrefix_localizedRePrefix == -1)
  {
    mf_stringByLocalizingReOrFwdPrefix_localizedRePrefix = objc_msgSend((id)MFLookupLocalizedString((uint64_t)CFSTR("REPLY_SUBJECT_PREFIX"), (uint64_t)CFSTR("Re:"), 0), "isEqualToString:", CFSTR("Re:")) ^ 1;
    mf_stringByLocalizingReOrFwdPrefix_localizedFwdPrefix = objc_msgSend((id)MFLookupLocalizedString((uint64_t)CFSTR("FORWARD_SUBJECT_PREFIX"), (uint64_t)CFSTR("Fwd:"), 0), "isEqualToString:", CFSTR("Fwd:")) ^ 1;
    mf_stringByLocalizingReOrFwdPrefix_nonLocalizedReLength = objc_msgSend(CFSTR("Re:"), "length");
    mf_stringByLocalizingReOrFwdPrefix_nonLocalizedFwdLength = objc_msgSend(CFSTR("Fwd:"), "length");
    v2 = mf_stringByLocalizingReOrFwdPrefix_localizedRePrefix;
  }
  if (v2 == 1
    && !objc_msgSend(a1, "compare:options:range:", CFSTR("Re:"), 1, 0, mf_stringByLocalizingReOrFwdPrefix_nonLocalizedReLength))
  {
    a1 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@⁨%@⁩"), MFLookupLocalizedString((uint64_t)CFSTR("REPLY_SUBJECT_PREFIX"), (uint64_t)CFSTR("Re:"), 0), objc_msgSend(a1, "substringFromIndex:", mf_stringByLocalizingReOrFwdPrefix_nonLocalizedReLength));
  }
  if (mf_stringByLocalizingReOrFwdPrefix_localizedFwdPrefix == 1
    && !objc_msgSend(a1, "compare:options:range:", CFSTR("Fwd:"), 1, 0, mf_stringByLocalizingReOrFwdPrefix_nonLocalizedFwdLength))
  {
    return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@⁨%@⁩"), MFLookupLocalizedString((uint64_t)CFSTR("FORWARD_SUBJECT_PREFIX"), (uint64_t)CFSTR("Fwd:"), 0), objc_msgSend(a1, "substringFromIndex:", mf_stringByLocalizingReOrFwdPrefix_nonLocalizedFwdLength));
  }
  else
  {
    return (uint64_t)a1;
  }
}

- (id)mf_fileSystemString
{
  uint64_t v2;
  id result;
  int v4;
  _BYTE v5[1024];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "length");
  result = a1;
  if (v2)
  {
    v4 = objc_msgSend(a1, "getFileSystemRepresentation:maxLength:", v5, 1023);
    result = a1;
    if (v4)
    {
      v5[1023] = 0;
      result = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v5);
    }
  }
  if (!result)
    return a1;
  return result;
}

+ (uint64_t)mf_stringRepresentationForBytes:()NSStringUtils
{
  return CPFSSizeStrings();
}

- (id)mf_stringWithNoExtraSpaces
{
  void *v1;
  unint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  if (objc_msgSend(v1, "length"))
  {
    v2 = 0;
    do
    {
      v3 = objc_msgSend(v1, "characterAtIndex:", v2++);
      if (v3 == 32)
      {
        while (v2 < objc_msgSend(v1, "length") && objc_msgSend(v1, "characterAtIndex:", v2) == 32)
          objc_msgSend(v1, "deleteCharactersInRange:", v2, 1);
      }
    }
    while (v2 < objc_msgSend(v1, "length"));
  }
  if (objc_msgSend(v1, "length") && objc_msgSend(v1, "characterAtIndex:", 0) == 32)
    objc_msgSend(v1, "deleteCharactersInRange:", 0, 1);
  v4 = objc_msgSend(v1, "length");
  if (v4)
  {
    v5 = v4 - 1;
    if (objc_msgSend(v1, "characterAtIndex:", v4 - 1) == 32)
      objc_msgSend(v1, "deleteCharactersInRange:", v5, 1);
  }
  return v1;
}

+ (uint64_t)mf_stringWithAttachmentCharacter
{
  uint64_t result;
  __int16 v1;

  result = mf_stringWithAttachmentCharacter_stringWithAttachmentCharacter;
  if (!mf_stringWithAttachmentCharacter_stringWithAttachmentCharacter)
  {
    v1 = -4;
    result = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", &v1, 1);
    mf_stringWithAttachmentCharacter_stringWithAttachmentCharacter = result;
  }
  return result;
}

- (void)mf_uniqueFilenameWithRespectToFilenames:()NSStringUtils
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  LODWORD(v5) = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v22 = *MEMORY[0x1E0C80C00];
  do
  {
    while (1)
    {
      if (!v8)
      {
        v8 = a1;
        goto LABEL_12;
      }
      if (v7)
      {
        if (!v6)
          goto LABEL_9;
      }
      else
      {
        v7 = objc_msgSend(a1, "stringByDeletingPathExtension");
        if (!v6)
LABEL_9:
          v6 = (void *)objc_msgSend(a1, "pathExtension");
      }
      v5 = (v5 + 1);
      v9 = objc_msgSend(v6, "length")
         ? objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%d.%@"), v7, v5, v6)
         : objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%d"), v7, v5, v16);
      v8 = (void *)v9;
LABEL_12:
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v11 = v8;
      if (!v10)
        break;
      v12 = v10;
      v13 = *(_QWORD *)v18;
LABEL_14:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(a3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "isEqualToString:", v8) & 1) != 0)
          break;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v12)
            goto LABEL_14;
          v11 = v8;
          goto LABEL_21;
        }
      }
    }
LABEL_21:
    ;
  }
  while (!v11);
  return v8;
}

- (id)mf_stringByEscapingForXML
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&"), CFSTR("&amp;"),
    0,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<"), CFSTR("&lt;"),
    0,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR(">"), CFSTR("&gt;"),
    0,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("'"), CFSTR("&apos;"),
    0,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), CFSTR("&quot;"),
    0,
    0,
    objc_msgSend(v1, "length"));
  return v1;
}

- (__CFString)mf_stringByEscapingHTMLCodes
{
  __CFString *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  UniChar *v8;
  uint64_t v9;
  unsigned int v10;
  __CFString *v11;
  const __CFString *v12;
  void *v14;
  UniChar chars[512];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v14 = a1;
  v3 = objc_msgSend(a1, "length");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v7 = v4 - v5 >= 0x1FF ? 511 : v4 - v5;
      objc_msgSend(v14, "getCharacters:range:", chars, v5, v7);
      if (v7)
        break;
LABEL_28:
      v5 += v7;
      if (v5 >= v4)
        return v2;
    }
    v8 = chars;
    v9 = v7;
    while (1)
    {
      v10 = *v8;
      if (v10 > 0x25)
      {
        switch(v10)
        {
          case '&':
            v11 = v2;
            v12 = CFSTR("&amp;");
            break;
          case '>':
            v11 = v2;
            v12 = CFSTR("&gt;");
            break;
          case '<':
            v11 = v2;
            v12 = CFSTR("&lt;");
            break;
          default:
            goto LABEL_26;
        }
      }
      else
      {
        switch(v10)
        {
          case 9u:
            v11 = v2;
            v12 = CFSTR("&nbsp;&nbsp;&nbsp;&nbsp;");
            break;
          case 0xAu:
            v11 = v2;
            v12 = CFSTR("<br>");
            break;
          case 0x20u:
            if ((v6 & 1) != 0)
            {
              -[__CFString appendString:](v2, "appendString:", CFSTR("&nbsp;"));
              v6 = 1;
            }
            else
            {
              v6 = 1;
              CFStringAppendCharacters(v2, v8, 1);
            }
            goto LABEL_24;
          default:
LABEL_26:
            CFStringAppendCharacters(v2, v8, 1);
            goto LABEL_23;
        }
      }
      -[__CFString appendString:](v11, "appendString:", v12);
LABEL_23:
      v6 = 0;
LABEL_24:
      ++v8;
      if (!--v9)
        goto LABEL_28;
    }
  }
  return v2;
}

+ (uint64_t)mf_stringForMimeTypeFromFileName:()NSStringUtils
{
  id v4;
  uint64_t v5;

  v4 = objc_alloc_init(MEMORY[0x1E0D46148]);
  objc_msgSend(v4, "setPathExtension:", objc_msgSend(a3, "pathExtension"));
  objc_msgSend(v4, "setFilename:", a3);
  v5 = objc_msgSend(v4, "mimeType");
  if (MFGetTypeInfo())
    v5 = objc_msgSend(v4, "mimeType");

  return v5;
}

- (BOOL)mf_caseInsensitiveIsEqualToString:()NSStringUtils
{
  return objc_msgSend(a1, "compare:options:", a3, 1) == 0;
}

- (BOOL)mf_containsSubstring:()NSStringUtils options:
{
  return objc_msgSend(a1, "rangeOfString:options:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)mf_containsSubstring:()NSStringUtils
{
  return objc_msgSend(a1, "mf_containsSubstring:options:", a3, 0);
}

- (uint64_t)mf_stringByTrimmingWhitespaceAndNewlineCharacters
{
  return objc_msgSend(a1, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet"));
}

- (uint64_t)mf_prefixToString:()NSStringUtils
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, "rangeOfString:");
  if (v3)
    return objc_msgSend(a1, "substringWithRange:", 0, v2);
  else
    return 0;
}

@end
