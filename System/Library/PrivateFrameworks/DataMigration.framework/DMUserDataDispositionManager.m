@implementation DMUserDataDispositionManager

+ (unsigned)dispositionFlagsFromDispositionDict:(id)a3
{
  id v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  int v24;
  unsigned int v25;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SyntheticDidUpgrade"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
    v6 = 2;
  else
    v6 = 0;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DidRestoreFromBackup"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");
  v9 = v8;
  v10 = v6 | 4;
  if (v8)
    v11 = v6 | 4;
  else
    v11 = v6;
  if (!v8)
    v10 = v6 | 1;
  if (v5)
    v12 = v11;
  else
    v12 = v10;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DidMigrateBackupFromDifferentDevice"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if (v14)
    v12 |= 8u;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DidRestoreFromCloudBackup"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  if (v16)
  {
    v17 = v12 | 0x10;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RestoreFromBackupSourceiTunes"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");

    if (v19)
    {
      v17 = v12 | 0x20;
    }
    else
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RestoreFromBackupSourceDeviceToDevice"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "BOOLValue");

      v22 = v12 | 0x20;
      if (!v9)
        v22 = v12;
      if (v21)
        v17 = v12 | 0x40;
      else
        v17 = v22;
    }
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RestoredBackupIsMegaBackup"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "BOOLValue");

  if (v24)
    v25 = v17 | 0x80;
  else
    v25 = v17;

  return v25;
}

+ (unsigned)basicDispositionFlagsFromDispositionFlags:(unsigned int)a3
{
  return a3 & 7;
}

+ (unsigned)backupSourceDispositionFlagsFromDispositionFlags:(unsigned int)a3
{
  return a3 & 0x70;
}

+ (id)descriptionFromDispositionFlags:(unsigned int)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;

  v3 = CFSTR("erase");
  v4 = CFSTR("iTunes restore");
  v5 = CFSTR("D2D restore");
  if ((a3 & 1) == 0)
    v3 = 0;
  if ((a3 & 0x40) == 0)
    v5 = CFSTR("iCloud restore");
  if ((a3 & 0x20) == 0)
    v4 = v5;
  if ((a3 & 4) != 0)
    v3 = v4;
  if ((a3 & 2) != 0)
    return CFSTR("upgrade");
  else
    return (id)v3;
}

@end
