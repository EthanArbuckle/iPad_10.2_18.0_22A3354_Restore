@implementation DNDModeConfigurationLocationTrigger(Record)

+ (uint64_t)newWithDictionaryRepresentation:()Record context:
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;

  v3 = a3;
  objc_msgSend(v3, "bs_safeNumberForKey:", CFSTR("latitude"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  objc_msgSend(v3, "bs_safeNumberForKey:", CFSTR("longitude"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  objc_msgSend(v3, "bs_safeNumberForKey:", CFSTR("radius"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  objc_msgSend(v3, "bs_safeStringForKey:", CFSTR("identifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_safeNumberForKey:", CFSTR("referenceFrame"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "intValue");

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E368]), "initWithCenter:radius:identifier:", v13, v6, v9, v12);
  objc_msgSend(v16, "setGeoReferenceFrame:", v15);
  objc_msgSend(v3, "bs_safeStringForKey:", CFSTR("detail"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_safeNumberForKey:", CFSTR("enabledSetting"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "unsignedIntegerValue");
  v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D670]), "initWithRegion:detail:enabledSetting:", v16, v17, v19);

  return v20;
}

- (id)dictionaryRepresentationWithContext:()Record
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[7];
  _QWORD v24[9];

  v24[7] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("DNDModeConfigurationLocationTrigger");
  v23[0] = CFSTR("class");
  v23[1] = CFSTR("latitude");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "region");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "center");
  objc_msgSend(v2, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v21;
  v23[2] = CFSTR("longitude");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "region");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "center");
  objc_msgSend(v3, "numberWithDouble:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v19;
  v23[3] = CFSTR("radius");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "region");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "radius");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v7;
  v23[4] = CFSTR("referenceFrame");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "region");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInt:", objc_msgSend(v9, "geoReferenceFrame"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v10;
  v23[5] = CFSTR("identifier");
  objc_msgSend(a1, "region");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v12;
  v23[6] = CFSTR("enabledSetting");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "enabledSetting"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  objc_msgSend(a1, "detail");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(a1, "detail");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("detail"));

  }
  return v15;
}

@end
