@implementation AFVoiceInfo(SiriTTSServiceAdditions)

- (uint64_t)isMatchForSiriVoice:()SiriTTSServiceAdditions
{
  id v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v19;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  v6 = objc_msgSend(a1, "isCustom");
  v7 = objc_msgSend(a1, "footprint");
  v8 = objc_msgSend(v4, "AFVoiceFootprint");
  objc_msgSend(a1, "languageCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "language");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", v10))
  {
    if (v6)
      v11 = -3;
    else
      v11 = -1;
    objc_msgSend(a1, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v12;
    v14 = objc_msgSend(v12, "isEqualToString:", v13);
    v15 = 0;
    if (v14 && (unint64_t)(v11 + v5) <= 1 && v7 == v8)
    {
      objc_msgSend(a1, "contentVersion");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "version"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v16, "isEqualToNumber:", v17);

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
