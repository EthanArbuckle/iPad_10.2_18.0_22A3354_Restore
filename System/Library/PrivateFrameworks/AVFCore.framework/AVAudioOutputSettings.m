@implementation AVAudioOutputSettings

+ (id)registeredOutputSettingsClasses
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
}

+ (id)_outputSettingsWithOutputSettingsDictionary:(id)a3 mediaType:(id)a4 exceptionReason:(id *)a5
{
  return (id)objc_msgSend(a1, "_audioOutputSettingsWithAudioSettingsDictionary:exceptionReason:", a3, a5);
}

+ (AVAudioOutputSettings)audioOutputSettingsWithAudioSettingsDictionary:(id)a3
{
  AVAudioOutputSettings *result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v13 = 0;
  result = (AVAudioOutputSettings *)objc_msgSend(a1, "_audioOutputSettingsWithAudioSettingsDictionary:exceptionReason:", a3, &v13);
  if (!result)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, v13, v6, v7, v8, v9, v10, v12), 0);
    objc_exception_throw(v11);
  }
  return result;
}

+ (AVAudioOutputSettings)audioOutputSettingsWithTrustedAudioSettingsDictionary:(id)a3
{
  AVAudioOutputSettings *result;

  result = (AVAudioOutputSettings *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C898E0]);
  if (result)
    return (AVAudioOutputSettings *)-[AVAVAudioSettingsAudioOutputSettings initWithTrustedAVAudioSettingsDictionary:]([AVAVAudioSettingsAudioOutputSettings alloc], "initWithTrustedAVAudioSettingsDictionary:", a3);
  return result;
}

+ (id)_audioOutputSettingsWithAudioSettingsDictionary:(id)a3 exceptionReason:(id *)a4
{
  objc_super v5;

  if (!a3)
    return (id)objc_msgSend(a1, "defaultAudioOutputSettings", 0, a4);
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___AVAudioOutputSettings;
  return objc_msgSendSuper2(&v5, sel__outputSettingsWithOutputSettingsDictionary_mediaType_exceptionReason_, a3, CFSTR("soun"), a4);
}

+ (id)defaultAudioOutputSettings
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)CFSTR("not implemented"), v2, v3, v4, v5, v6, v8), 0);
  objc_exception_throw(v7);
}

+ (id)audioConverterPropertiesForAudioSettingsDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v20;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(a3, "count"));
  v5 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C898F0]);
  if (v5 || (v5 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C898B8])) != 0)
  {
    v20 = objc_msgSend(v5, "unsignedIntValue");
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v20, 4), AVStringForOSType(0x61636264u));
  }
  v6 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C898C8]);
  if (v6)
  {
    v20 = objc_msgSend(v6, "unsignedIntValue");
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v20, 4), AVStringForOSType(0x62726174u));
  }
  v7 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C898D0]);
  if (v7)
  {
    v8 = objc_msgSend(v7, "unsignedIntValue");
    v9 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C89930]);
    if (v9)
    {
      v20 = objc_msgSend(v9, "unsignedIntValue") * v8;
      objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v20, 4), AVStringForOSType(0x62726174u));
    }
  }
  v10 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C898B0]);
  if (v10)
  {
    v20 = objc_msgSend(v10, "unsignedIntValue");
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v20, 4), AVStringForOSType(0x63647175u));
  }
  v11 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C89968]);
  if (v11)
  {
    v20 = objc_msgSend(v11, "unsignedIntValue");
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v20, 4), AVStringForOSType(0x73726371u));
  }
  v12 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C898D8]);
  if (v12)
  {
    v13 = v12;
    if (objc_msgSend(v12, "compare:", *MEMORY[0x1E0C89630]))
    {
      if (objc_msgSend(v13, "compare:", *MEMORY[0x1E0C89638]))
      {
        if (objc_msgSend(v13, "compare:", *MEMORY[0x1E0C89648]))
        {
          if (objc_msgSend(v13, "compare:", *MEMORY[0x1E0C89640]))
            goto LABEL_24;
          v14 = 3;
        }
        else
        {
          v14 = 2;
        }
      }
      else
      {
        v14 = 1;
      }
      v20 = v14;
    }
    else
    {
      v20 = 0;
    }
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v20, 4), AVStringForOSType(0x61636266u));
  }
LABEL_24:
  v15 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C898A8]);
  if (v15)
  {
    v20 = objc_msgSend(v15, "unsignedIntValue");
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v20, 4), AVStringForOSType(0x76627271u));
  }
  v16 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C89948]);
  if (v16)
  {
    v17 = v16;
    if ((objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0C89960]) & 1) != 0)
    {
      v18 = 1852797549;
    }
    else if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0C89958]))
    {
      v18 = 1650553971;
    }
    else
    {
      v18 = 0;
    }
    v20 = v18;
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v20, 4), AVStringForOSType(0x73726361u));
  }
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v4);
}

- (id)compatibleMediaTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("soun"));
}

- (BOOL)validateUsingOutputSettingsValidator:(id)a3 reason:(id *)a4
{
  return objc_msgSend(a3, "validateAudioOutputSettings:reason:", self, a4);
}

@end
