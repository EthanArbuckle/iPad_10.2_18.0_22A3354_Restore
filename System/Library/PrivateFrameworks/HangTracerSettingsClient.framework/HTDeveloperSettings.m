@implementation HTDeveloperSettings

- (HTDeveloperSettings)init
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  HTDeveloperSettings *v7;

  v3 = objc_alloc(MEMORY[0x24BDBCF50]);
  v4 = (void *)objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x24BE3F310]);
  v5 = objc_alloc(MEMORY[0x24BDBCF50]);
  v6 = (void *)objc_msgSend(v5, "initWithSuiteName:", *MEMORY[0x24BE3F308]);
  v7 = -[HTDeveloperSettings initWithDefaults:savedSettingsDefaults:](self, "initWithDefaults:savedSettingsDefaults:", v4, v6);

  return v7;
}

- (HTDeveloperSettings)initWithDefaults:(id)a3 savedSettingsDefaults:(id)a4
{
  id v7;
  id v8;
  HTDeveloperSettings *v9;
  HTDeveloperSettings *v10;
  uint64_t v11;
  NSMeasurementFormatter *shortDurationFormatter;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSMeasurementFormatter *longDurationFormatter;
  HTDeveloperSettings *v18;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HTDeveloperSettings;
  v9 = -[HTDeveloperSettings init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_defaults, a3);
    objc_storeStrong((id *)&v10->_savedSettingsDefaults, a4);
    v11 = objc_opt_new();
    shortDurationFormatter = v10->_shortDurationFormatter;
    v10->_shortDurationFormatter = (NSMeasurementFormatter *)v11;

    -[NSMeasurementFormatter setUnitStyle:](v10->_shortDurationFormatter, "setUnitStyle:", 1);
    -[NSMeasurementFormatter setUnitOptions:](v10->_shortDurationFormatter, "setUnitOptions:", 1);
    v13 = (void *)objc_opt_new();
    -[NSMeasurementFormatter setNumberFormatter:](v10->_shortDurationFormatter, "setNumberFormatter:", v13);

    -[NSMeasurementFormatter numberFormatter](v10->_shortDurationFormatter, "numberFormatter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNumberStyle:", 0);

    -[NSMeasurementFormatter numberFormatter](v10->_shortDurationFormatter, "numberFormatter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMaximumFractionDigits:", 0);

    v16 = objc_opt_new();
    longDurationFormatter = v10->_longDurationFormatter;
    v10->_longDurationFormatter = (NSMeasurementFormatter *)v16;

    -[NSMeasurementFormatter setUnitStyle:](v10->_longDurationFormatter, "setUnitStyle:", 3);
    -[NSMeasurementFormatter setUnitOptions:](v10->_longDurationFormatter, "setUnitOptions:", 1);
    v18 = v10;
  }

  return v10;
}

- (BOOL)isEnabled
{
  NSUserDefaults *defaults;
  void *v3;

  defaults = self->_defaults;
  keyWithPrefix(*MEMORY[0x24BE3F390], *MEMORY[0x24BE3F3B0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(defaults) = -[NSUserDefaults BOOLForKey:](defaults, "BOOLForKey:", v3);

  return (char)defaults;
}

- (BOOL)isInternalBuild
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE3F328], "sharedPrefs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInternal");

  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSUserDefaults *defaults;
  uint64_t v6;
  void *v7;
  NSUserDefaults *v8;
  void *v9;
  NSUserDefaults *v10;
  void *v11;
  NSUserDefaults *v12;
  void *v13;
  NSUserDefaults *v14;
  uint64_t v15;
  void *v16;
  NSUserDefaults *v17;
  void *v18;
  NSUserDefaults *v19;
  void *v20;
  NSUserDefaults *v21;
  void *v22;
  NSUserDefaults *v23;
  void *v24;
  double v25;
  NSUserDefaults *v26;
  void *v27;
  NSUserDefaults *v28;
  void *v29;
  NSUserDefaults *v30;
  void *v31;
  NSUserDefaults *v32;
  void *v33;
  NSUserDefaults *v34;
  void *v35;
  double v36;
  NSUserDefaults *v37;
  uint64_t v38;
  void *v39;
  NSUserDefaults *v40;
  void *v41;
  NSUserDefaults *v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  uint64_t v51;
  NSUserDefaults *savedSettingsDefaults;
  void *v53;
  void *v54;
  NSUserDefaults *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  uint64_t v63;
  NSUserDefaults *v64;
  void *v65;
  void *v66;
  NSUserDefaults *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t k;
  NSUserDefaults *v81;
  void *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _QWORD v98[19];

  v3 = a3;
  v98[17] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    defaults = self->_defaults;
    v6 = *MEMORY[0x24BE3F3B0];
    keyWithPrefix(*MEMORY[0x24BE3F390], *MEMORY[0x24BE3F3B0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults setBool:forKey:](defaults, "setBool:forKey:", 1, v7);

    v8 = self->_defaults;
    keyWithPrefix(*MEMORY[0x24BE3F3F8], v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults setBool:forKey:](v8, "setBool:forKey:", 1, v9);

    v10 = self->_defaults;
    keyWithPrefix(*MEMORY[0x24BE3F438], v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults setBool:forKey:](v10, "setBool:forKey:", 1, v11);

    v12 = self->_defaults;
    keyWithPrefix(*MEMORY[0x24BE3F388], v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults setInteger:forKey:](v12, "setInteger:forKey:", 500, v13);

    v14 = self->_defaults;
    keyWithPrefix(*MEMORY[0x24BE3F3E0], v6);
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults setInteger:forKey:](v14, "setInteger:forKey:", 500, v15);

    objc_msgSend(MEMORY[0x24BE3F328], "sharedPrefs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v15) = objc_msgSend(v16, "isInternal");

    if ((v15 & 1) == 0)
    {
      v17 = self->_defaults;
      keyWithPrefix(*MEMORY[0x24BE3F3B8], v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSUserDefaults setInteger:forKey:](v17, "setInteger:forKey:", 0, v18);

      v19 = self->_defaults;
      keyWithPrefix(*MEMORY[0x24BE3F3D0], v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSUserDefaults setInteger:forKey:](v19, "setInteger:forKey:", 0, v20);

      v21 = self->_defaults;
      keyWithPrefix(*MEMORY[0x24BE3F3D8], v6);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSUserDefaults setInteger:forKey:](v21, "setInteger:forKey:", 0, v22);

      v23 = self->_defaults;
      keyWithPrefix(*MEMORY[0x24BE3F3E8], v6);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v25) = 0;
      -[NSUserDefaults setFloat:forKey:](v23, "setFloat:forKey:", v24, v25);

      v26 = self->_defaults;
      keyWithPrefix(*MEMORY[0x24BE3F440], v6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSUserDefaults setBool:forKey:](v26, "setBool:forKey:", 0, v27);

    }
    v28 = self->_defaults;
    keyWithPrefix(*MEMORY[0x24BE3F3C0], v6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults setInteger:forKey:](v28, "setInteger:forKey:", 120, v29);

    v30 = self->_defaults;
    keyWithPrefix(*MEMORY[0x24BE3F368], v6);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults setInteger:forKey:](v30, "setInteger:forKey:", 60, v31);

    v32 = self->_defaults;
    keyWithPrefix(*MEMORY[0x24BE3F3C8], v6);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults setInteger:forKey:](v32, "setInteger:forKey:", 250, v33);

    v34 = self->_defaults;
    keyWithPrefix(*MEMORY[0x24BE3F398], v6);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v36) = 1120403456;
    -[NSUserDefaults setFloat:forKey:](v34, "setFloat:forKey:", v35, v36);

    v37 = self->_defaults;
    v38 = *MEMORY[0x24BE3F360];
    keyWithPrefix(*MEMORY[0x24BE3F400], v6);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults setObject:forKey:](v37, "setObject:forKey:", v38, v39);

    v40 = self->_defaults;
    keyWithPrefix(*MEMORY[0x24BE3F3F0], v6);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults setInteger:forKey:](v40, "setInteger:forKey:", 250, v41);

    v42 = self->_defaults;
    if (bootSessionUUID_onceToken != -1)
      dispatch_once(&bootSessionUUID_onceToken, &__block_literal_global_5);
    v43 = *MEMORY[0x24BE3F430];
    v44 = (id)bootSessionUUID_bootUUID;
    keyWithPrefix(v43, v6);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults setObject:forKey:](v42, "setObject:forKey:", v44, v45);

    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    HTPrefsKeysToRestoreForPrefix();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v92;
      do
      {
        for (i = 0; i != v48; ++i)
        {
          if (*(_QWORD *)v92 != v49)
            objc_enumerationMutation(v46);
          v51 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * i);
          savedSettingsDefaults = self->_savedSettingsDefaults;
          savedSettingPrefixedDefaultsKey(v51);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSUserDefaults objectForKey:](savedSettingsDefaults, "objectForKey:", v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          if (v54)
          {
            v55 = self->_defaults;
            keyWithPrefix(v51, v6);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSUserDefaults setObject:forKey:](v55, "setObject:forKey:", v54, v56);

          }
        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
      }
      while (v48);
    }
  }
  else
  {
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v57 = *MEMORY[0x24BE3F3B0];
    HTPrefsKeysToRestoreForPrefix();
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v88;
      do
      {
        for (j = 0; j != v60; ++j)
        {
          if (*(_QWORD *)v88 != v61)
            objc_enumerationMutation(v58);
          v63 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * j);
          v64 = self->_defaults;
          keyWithPrefix(v63, v57);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSUserDefaults objectForKey:](v64, "objectForKey:", v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          v67 = self->_savedSettingsDefaults;
          savedSettingPrefixedDefaultsKey(v63);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSUserDefaults setObject:forKey:](v67, "setObject:forKey:", v66, v68);

        }
        v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
      }
      while (v60);
    }

    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v69 = *MEMORY[0x24BE3F3F8];
    v98[0] = *MEMORY[0x24BE3F390];
    v98[1] = v69;
    v70 = *MEMORY[0x24BE3F3E0];
    v98[2] = *MEMORY[0x24BE3F438];
    v98[3] = v70;
    v71 = *MEMORY[0x24BE3F3B8];
    v98[4] = *MEMORY[0x24BE3F388];
    v98[5] = v71;
    v72 = *MEMORY[0x24BE3F3D8];
    v98[6] = *MEMORY[0x24BE3F3D0];
    v98[7] = v72;
    v73 = *MEMORY[0x24BE3F440];
    v98[8] = *MEMORY[0x24BE3F3E8];
    v98[9] = v73;
    v74 = *MEMORY[0x24BE3F368];
    v98[10] = *MEMORY[0x24BE3F3C0];
    v98[11] = v74;
    v75 = *MEMORY[0x24BE3F398];
    v98[12] = *MEMORY[0x24BE3F3C8];
    v98[13] = v75;
    v76 = *MEMORY[0x24BE3F3F0];
    v98[14] = *MEMORY[0x24BE3F400];
    v98[15] = v76;
    v98[16] = *MEMORY[0x24BE3F430];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v98, 17, 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
    if (v77)
    {
      v78 = v77;
      v79 = *(_QWORD *)v84;
      do
      {
        for (k = 0; k != v78; ++k)
        {
          if (*(_QWORD *)v84 != v79)
            objc_enumerationMutation(v46);
          v81 = self->_defaults;
          keyWithPrefix(*(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * k), v57);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSUserDefaults removeObjectForKey:](v81, "removeObjectForKey:", v82);

        }
        v78 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
      }
      while (v78);
    }
  }

  notify_post((const char *)*MEMORY[0x24BE3F318]);
  configureTailspinForThirdPartyDevelopment(v3);
}

- (int64_t)hangTracerThreshold
{
  NSUserDefaults *defaults;
  void *v3;
  int64_t v4;

  defaults = self->_defaults;
  keyWithPrefix(*MEMORY[0x24BE3F3E0], *MEMORY[0x24BE3F3B0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSUserDefaults integerForKey:](defaults, "integerForKey:", v3);

  return v4;
}

- (void)setHangTracerThreshold:(int64_t)a3
{
  NSUserDefaults *defaults;
  uint64_t v6;
  void *v7;
  NSUserDefaults *v8;
  void *v9;

  defaults = self->_defaults;
  v6 = *MEMORY[0x24BE3F3B0];
  keyWithPrefix(*MEMORY[0x24BE3F3E0], *MEMORY[0x24BE3F3B0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults setInteger:forKey:](defaults, "setInteger:forKey:", a3, v7);

  v8 = self->_defaults;
  keyWithPrefix(*MEMORY[0x24BE3F388], v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults setInteger:forKey:](v8, "setInteger:forKey:", a3, v9);

  notify_post((const char *)*MEMORY[0x24BE3F318]);
}

- (NSArray)availableThresholdsValues
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HTDeveloperSettings hangTracerThreshold](self, "hangTracerThreshold"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", &unk_250E6A1C0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HTDeveloperSettings hangTracerThreshold](self, "hangTracerThreshold")
    && (objc_msgSend(v4, "containsObject:", v3) & 1) == 0)
  {
    objc_msgSend(v4, "addObject:", v3);
    objc_msgSend(v4, "sortUsingSelector:", sel_compare_);
  }
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSArray *)v5;
}

- (NSArray)availableThresholdsShortNames
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  HTDeveloperSettings *v12;
  id v13;

  -[HTDeveloperSettings availableThresholdsValues](self, "availableThresholdsValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __52__HTDeveloperSettings_availableThresholdsShortNames__block_invoke;
  v11 = &unk_250E63500;
  v12 = self;
  v13 = v4;
  v5 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v8);
  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return (NSArray *)v6;
}

void __52__HTDeveloperSettings_availableThresholdsShortNames__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v4 = (objc_class *)MEMORY[0x24BDD1660];
  v5 = a2;
  v6 = [v4 alloc];
  v7 = objc_msgSend(v5, "integerValue");

  objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithDoubleValue:unit:", v8, (double)v7);
  objc_msgSend(v3, "stringFromMeasurement:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
}

- (NSArray)availableThresholdsLongNames
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  HTDeveloperSettings *v12;
  id v13;

  -[HTDeveloperSettings availableThresholdsValues](self, "availableThresholdsValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __51__HTDeveloperSettings_availableThresholdsLongNames__block_invoke;
  v11 = &unk_250E63500;
  v12 = self;
  v13 = v4;
  v5 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v8);
  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return (NSArray *)v6;
}

void __51__HTDeveloperSettings_availableThresholdsLongNames__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_msgSend(a2, "integerValue");
  if (v3 > 999)
  {
    objc_msgSend(MEMORY[0x24BDD18D8], "seconds");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v3 /= 0x3E8uLL;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD18D8], "milliseconds");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1660]), "initWithDoubleValue:unit:", v7, (double)v3);
  objc_msgSend(v4, "stringFromMeasurement:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longDurationFormatter, 0);
  objc_storeStrong((id *)&self->_shortDurationFormatter, 0);
  objc_storeStrong((id *)&self->_savedSettingsDefaults, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
