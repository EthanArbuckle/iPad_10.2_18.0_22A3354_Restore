@implementation MTLFXTemporalScaler

id __49___MTLFXTemporalScaler__emitTelemetry_forDevice___block_invoke(_QWORD *a1)
{
  __CFBundle *MainBundle;
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  _QWORD v20[11];
  _QWORD v21[13];

  v21[11] = *MEMORY[0x24BDAC8D0];
  MainBundle = CFBundleGetMainBundle();
  if (MainBundle)
  {
    CFBundleGetInfoDictionary(MainBundle);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v19 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v4 = CFSTR("Unknown");
      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDBD288]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
        v4 = v5;
      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDBD2A0]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        v8 = v7;
      else
        v8 = CFSTR("Unknown");

    }
    else
    {
      v19 = 0;
      v4 = CFSTR("Unknown");
      v8 = CFSTR("Unknown");
    }

  }
  else
  {
    v19 = 0;
    v4 = CFSTR("Unknown");
    v8 = CFSTR("Unknown");
  }
  v20[0] = CFSTR("bundleIdentifier");
  v20[1] = CFSTR("bundleVersion");
  v21[0] = v4;
  v21[1] = v8;
  v20[2] = CFSTR("class");
  v20[3] = CFSTR("gpu");
  v9 = a1[5];
  v21[2] = a1[4];
  v21[3] = v9;
  v20[4] = CFSTR("colorTextureFormat");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[6]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v10;
  v20[5] = CFSTR("outputTextureFormat");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[7]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v11;
  v20[6] = CFSTR("inputWidth");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v12;
  v20[7] = CFSTR("inputHeight");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[9]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[7] = v13;
  v20[8] = CFSTR("outputWidth");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[10]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[8] = v14;
  v20[9] = CFSTR("outputHeight");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[11]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[9] = v15;
  v20[10] = CFSTR("version");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[12]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[10] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
