@implementation HMDSULocalUtilities

+ (void)parseProductVersion:(id)a3 intoMajorVersion:(id *)a4 minorVersion:(id *)a5 updateVersion:(id *)a6
{
  void *v6;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (unint64_t)objc_msgSend(v26, "count") >= 2;
  v11 = v26;
  if (v10)
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v26, "objectAtIndex:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "integerValue"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v26, "objectAtIndex:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "integerValue"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0CB37E8];
    v17 = objc_msgSend(v26, "count");
    if (v17 == 3)
    {
      objc_msgSend(v26, "objectAtIndex:", 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v6, "integerValue");
    }
    else
    {
      v18 = 0;
    }
    objc_msgSend(v16, "numberWithInteger:", v18);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    if (v17 == 3)

    v19 = objc_msgSend(*a4, "integerValue") == 9;
    v11 = v26;
    if (v19)
    {
      v19 = objc_msgSend(*a5, "integerValue") == 9;
      v11 = v26;
      if (v19)
      {
        if ((unint64_t)objc_msgSend(v26, "count") >= 4)
        {
          v20 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v26, "objectAtIndex:", 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v21, "integerValue"));
          *a4 = (id)objc_claimAutoreleasedReturnValue();

          v22 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v26, "objectAtIndex:", 3);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "numberWithInteger:", objc_msgSend(v23, "integerValue"));
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        v10 = (unint64_t)objc_msgSend(v26, "count") >= 5;
        v11 = v26;
        if (v10)
        {
          v24 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v26, "objectAtIndex:", 4);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "numberWithInteger:", objc_msgSend(v25, "integerValue"));
          *a6 = (id)objc_claimAutoreleasedReturnValue();

          v11 = v26;
        }
      }
    }
  }

}

+ (id)descriptorFromControllerStatus:(id)a3 controllerDescriptor:(id)a4 errorCode:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "productVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v8, "productVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    v38 = 0;
    v36 = 0;
    objc_msgSend(a1, "parseProductVersion:intoMajorVersion:minorVersion:updateVersion:", v12, &v38, &v37, &v36);
    v35 = v38;
    v34 = v37;
    v33 = v36;

  }
  else
  {
    v34 = 0;
    v35 = 0;
    v33 = 0;
  }
  v13 = objc_alloc(MEMORY[0x1E0CBA898]);
  v14 = objc_msgSend(v10, "updateState");

  if (v14 <= 0x12)
    v15 = (void *)v14;
  else
    v15 = 0;
  v16 = objc_msgSend(v8, "downloadSize");
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v8, "downloadSize"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }
  objc_msgSend(v8, "humanReadableUpdateName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v9;
  v30 = v16;
  v27 = v15;
  v26 = objc_msgSend(v8, "rampEnabled");
  if (v26)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "rampEnabled"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }
  objc_msgSend(v8, "documentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "serverAssetURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "documentation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "serverAssetAlgorithm");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "documentation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "serverAssetMeasurement");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "productBuildVersion");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (id)objc_msgSend(v13, "initWithStatus:downloadSize:humanReadableUpdateName:rampEnabled:errorCode:serverAssetURL:serverAssetAlgorithm:serverAssetMeasurement:majorVersion:minorVersion:updateVersion:buildVersion:", v27, v32, v17, v31, v29, v19, v21, v23, v35, v34, v33, v24);

  if (v26)
  if (v30)

  return v28;
}

+ (id)progressFromControllerProgress:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  int v6;
  int v7;
  double v8;
  double v9;
  double v10;

  v3 = (objc_class *)MEMORY[0x1E0CBA8B8];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "portionComplete");
  v7 = v6;
  objc_msgSend(v4, "estimatedTimeRemaining");
  v9 = v8;

  LODWORD(v10) = v7;
  return (id)objc_msgSend(v5, "initWithPercentageComplete:estimatedTimeRemaining:", v10, v9);
}

@end
