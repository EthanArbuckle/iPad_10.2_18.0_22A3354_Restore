@implementation ABVCardActivityAlertSerialization

+ (id)stringWithType:(id)a3 info:(id)a4
{
  return +[ABVCardActivityAlertSerializer serializeDictionary:](ABVCardActivityAlertSerializer, "serializeDictionary:", objc_msgSend(a1, "dictionaryWithType:info:", a3, a4));
}

+ (id)dictionaryWithType:(id)a3 info:(id)a4
{
  void *v6;
  const __CFString *v7;
  _QWORD v9[5];

  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if (a3)
  {
    if (objc_msgSend(a3, "caseInsensitiveCompare:", CFSTR("com.apple.activityalert.call")))
    {
      if (objc_msgSend(a3, "caseInsensitiveCompare:", CFSTR("com.apple.activityalert.text")))
        v7 = (const __CFString *)a3;
      else
        v7 = CFSTR("text");
    }
    else
    {
      v7 = CFSTR("call");
    }
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("type"));
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__ABVCardActivityAlertSerialization_dictionaryWithType_info___block_invoke;
  v9[3] = &unk_1E3CA4A08;
  v9[4] = v6;
  objc_msgSend(a4, "enumerateKeysAndObjectsUsingBlock:", v9);
  return v6;
}

uint64_t __61__ABVCardActivityAlertSerialization_dictionaryWithType_info___block_invoke(uint64_t a1, __CFString *a2, uint64_t a3)
{
  const __CFString *v6;

  if (-[__CFString caseInsensitiveCompare:](a2, "caseInsensitiveCompare:", CFSTR("sound")))
  {
    if (-[__CFString caseInsensitiveCompare:](a2, "caseInsensitiveCompare:", CFSTR("vibration")))
      v6 = a2;
    else
      v6 = CFSTR("vib");
  }
  else
  {
    v6 = CFSTR("snd");
  }
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a3, v6);
}

+ (void)parseString:(id)a3 intoTypeAndInfo:(id)a4
{
  uint64_t v6;

  v6 = objc_msgSend(a1, "activityAlertWithString:", a3);
  (*((void (**)(id, uint64_t, uint64_t))a4 + 2))(a4, objc_msgSend(a1, "typeFromDictionary:", v6), objc_msgSend(a1, "infoFromDictionary:", v6));
}

+ (id)activityAlertWithString:(id)a3
{
  return +[ABVCardActivityAlertScanner scanAlertValueFromString:](ABVCardActivityAlertScanner, "scanAlertValueFromString:", a3);
}

+ (id)typeFromDictionary:(id)a3
{
  id result;
  id v4;

  result = (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("type"));
  if (result)
  {
    v4 = result;
    if (objc_msgSend(result, "caseInsensitiveCompare:", CFSTR("call")))
    {
      if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("text")))
        return v4;
      else
        return CFSTR("com.apple.activityalert.text");
    }
    else
    {
      return CFSTR("com.apple.activityalert.call");
    }
  }
  return result;
}

+ (id)infoFromDictionary:(id)a3
{
  void *v4;
  _QWORD v6[5];

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__ABVCardActivityAlertSerialization_infoFromDictionary___block_invoke;
  v6[3] = &unk_1E3CA4A08;
  v6[4] = v4;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v6);
  return v4;
}

uint64_t __56__ABVCardActivityAlertSerialization_infoFromDictionary___block_invoke(uint64_t a1, __CFString *a2, uint64_t a3)
{
  __CFString *v4;
  uint64_t result;

  v4 = a2;
  result = -[__CFString caseInsensitiveCompare:](a2, "caseInsensitiveCompare:", CFSTR("type"));
  if (result)
  {
    if (-[__CFString caseInsensitiveCompare:](v4, "caseInsensitiveCompare:", CFSTR("snd")))
    {
      result = -[__CFString caseInsensitiveCompare:](v4, "caseInsensitiveCompare:", CFSTR("vib"));
      if (result)
      {
        if (!v4)
          return result;
      }
      else
      {
        v4 = CFSTR("vibration");
      }
    }
    else
    {
      v4 = CFSTR("sound");
    }
    return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a3, v4);
  }
  return result;
}

@end
