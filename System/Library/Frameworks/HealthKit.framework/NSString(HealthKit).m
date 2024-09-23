@implementation NSString(HealthKit)

- (id)hk_copyNonEmptyString
{
  void *v2;

  v2 = (void *)objc_msgSend(a1, "length");
  if (v2)
    v2 = (void *)objc_msgSend(a1, "copy");
  return v2;
}

- (uint64_t)hk_compareBuildVersionWithString:()HealthKit
{
  id v4;
  id v5;
  char *v6;
  id v7;
  char *v8;

  v4 = objc_retainAutorelease(a1);
  v5 = a3;
  v6 = (char *)objc_msgSend(v4, "UTF8String");
  v7 = objc_retainAutorelease(v5);
  v8 = (char *)objc_msgSend(v7, "UTF8String");

  return (int)HKCompareBuildVersionStrings(v6, v8);
}

- (BOOL)hk_isValidPurposeString
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hk_stringByRemovingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (unint64_t)objc_msgSend(v4, "length") > 0xB;
  return v5;
}

- (id)hk_stripLeadingTrailingWhitespace
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hk_trimWhitespaceAndNewlines
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hk_stringByRemovingCharactersInSet:()HealthKit
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "appendString:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  return v5;
}

- (uint64_t)hk_stringByNormalizingSpaces
{
  return objc_msgSend(a1, "hk_stringByReplacingSpacesWithString:", CFSTR(" "));
}

- (id)hk_stringByReplacingSpacesWithString:()HealthKit
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = a1;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(&unk_1E389DE40, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      v10 = v5;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(&unk_1E389DE40);
        objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), v4);
        v5 = (id)objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = v5;
      }
      while (v7 != v9);
      v7 = objc_msgSend(&unk_1E389DE40, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)hk_stringByUnescapingJSONCharactersForDisplay
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\/"), CFSTR("/"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\\\"), CFSTR("\\"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hk_stringByAppendingKeyPathComponent:()HealthKit
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB3500];
  v5 = a3;
  objc_msgSend(v4, "characterSetWithCharactersInString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqualToString:", &stru_1E37FD4C0))
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

- (BOOL)hk_isCaseInsensitiveSubstringInString:()HealthKit
{
  return objc_msgSend(a1, "rangeOfString:options:", a3, 1) != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)hk_firstWordCapitalizedStringWithLocale:()HealthKit
{
  id v4;
  uint64_t v5;
  uint64_t *v6;
  id v7;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3010000000;
  v20 = &unk_19A47752F;
  v21 = xmmword_19A44C6D0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__44;
  v15 = __Block_byref_object_dispose__44;
  v16 = 0;
  v5 = objc_msgSend(a1, "length");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__NSString_HealthKit__hk_firstWordCapitalizedStringWithLocale___block_invoke;
  v10[3] = &unk_1E37F35E8;
  v10[4] = &v17;
  v10[5] = &v11;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 3, v10);
  v6 = v18;
  if (v18[4] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = a1;
  }
  else
  {
    objc_msgSend((id)v12[5], "capitalizedStringWithLocale:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:", v6[4], v6[5], v8);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

- (id)hk_localizedFirstWordCapitalizedString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hk_firstWordCapitalizedStringWithLocale:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hk_isBase64
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unsigned __int16 *i;
  int v8;
  BOOL v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "length");
  if ((v2 & 3) != 0)
    return 0;
  v4 = v2;
  if (!v2)
    return 1;
  MEMORY[0x1E0C80A78]();
  v6 = (char *)v10 - ((v5 + 17) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(a1, "getCharacters:range:", v6, 0, v4);
  for (i = (unsigned __int16 *)(v6 + 2); ; ++i)
  {
    v8 = *(i - 1);
    v9 = (v8 - 48) >= 0xA && (v8 - 97) >= 0x1A;
    if (v9 && (v8 - 65) >= 0x1A && (v8 & 0xFFFFFFFB) != 0x2B)
      break;
    if (!--v4)
      return 1;
  }
  if (v8 != 61)
    return 0;
  if (v4 == 1)
    return 1;
  return v4 == 2 && *i == 61;
}

- (uint64_t)hk_stringIndentedBy:()HealthKit
{
  return objc_msgSend(a1, "hk_stringIndentedBy:prefix:", a3, 0);
}

- (id)hk_stringIndentedBy:()HealthKit prefix:
{
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = &stru_1E37FD4C0;
  if (a4)
    v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%*s"), v5, a3, ");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)hk_isBetweenLowerBuildVersion:()HealthKit upperBuildVersion:
{
  id v6;
  id v7;
  id v8;
  char *v9;
  id v10;
  char *v11;
  _BOOL8 v12;

  v6 = a4;
  v7 = objc_retainAutorelease(a1);
  v8 = a3;
  v9 = (char *)objc_msgSend(v7, "UTF8String");
  v10 = objc_retainAutorelease(v8);
  v11 = (char *)objc_msgSend(v10, "UTF8String");

  v12 = HKCompareBuildVersionStrings(v9, v11) != -1
     && HKCompareBuildVersionStrings((char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String")) == -1;

  return v12;
}

+ (id)hk_randomStringOfLength:()HealthKit
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v11;

  if (a3 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSString+HealthKit.m"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("length >= 0"));

  }
  objc_msgSend(MEMORY[0x1E0C99D50], "hk_randomDataOfLength:", vcvtpd_s64_f64((double)a3 * 0.75));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "substringToIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)hk_SHA224Hash
{
  id v1;
  void *v2;
  uint64_t i;
  unsigned __int8 md[28];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CC_SHA224((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 56);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 28; ++i)
    objc_msgSend(v2, "appendFormat:", CFSTR("%02x"), md[i]);

  return v2;
}

- (id)hk_SHA256Hash
{
  id v1;
  void *v2;
  uint64_t i;
  unsigned __int8 md[32];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CC_SHA256((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 64);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 32; ++i)
    objc_msgSend(v2, "appendFormat:", CFSTR("%02x"), md[i]);

  return v2;
}

- (id)hk_SHA384Hash
{
  id v1;
  void *v2;
  uint64_t i;
  unsigned __int8 md[48];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CC_SHA384((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 96);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 48; ++i)
    objc_msgSend(v2, "appendFormat:", CFSTR("%02x"), md[i]);

  return v2;
}

- (id)hk_SHA512Hash
{
  id v1;
  void *v2;
  uint64_t i;
  unsigned __int8 md[64];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CC_SHA512((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 128);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 64; ++i)
    objc_msgSend(v2, "appendFormat:", CFSTR("%02x"), md[i]);

  return v2;
}

- (id)hk_MD5Hash
{
  id v1;
  void *v2;
  uint64_t i;
  unsigned __int8 md[16];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CC_MD5((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 32);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 16; ++i)
    objc_msgSend(v2, "appendFormat:", CFSTR("%02x"), md[i]);

  return v2;
}

- (id)hk_MD5HashAsUUID
{
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  unsigned __int8 md[16];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  v2 = objc_msgSend(v1, "cStringUsingEncoding:", 4);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v2, objc_msgSend(v1, "length"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CC_MD5((const void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), md);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", md);

  return v4;
}

@end
