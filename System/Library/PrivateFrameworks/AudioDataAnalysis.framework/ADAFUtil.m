@implementation ADAFUtil

+ (id)stringFromDataType:(unsigned int)a3
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = CFSTR("UnkownType");
  if (a3 == 1936614505)
    v3 = CFSTR("SoundClassification");
  if (a3 == 1751213428)
    v4 = CFSTR("HeadphoneAudioExposure");
  else
    v4 = v3;
  if (a3 == 1702260324)
    return CFSTR("EnvironmentalDosage");
  else
    return (id)v4;
}

+ (BOOL)isProcessMediaserverd
{
  if (isProcessMediaserverd_once != -1)
    dispatch_once(&isProcessMediaserverd_once, &__block_literal_global_0);
  return isProcessMediaserverd_isMediaserverd;
}

void __33__ADAFUtil_isProcessMediaserverd__block_invoke()
{
  int v0;
  __CFString *v1;
  void *v2;
  __CFString *v3;
  void *v4;
  char v5;
  id v6;

  v0 = _os_feature_enabled_impl();
  v1 = CFSTR("mediaserverd");
  if (v0)
    v1 = CFSTR("audiomxd");
  v2 = (void *)MEMORY[0x24BDD1760];
  v3 = v1;
  objc_msgSend(v2, "processInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v3);

  isProcessMediaserverd_isMediaserverd = v5;
}

@end
