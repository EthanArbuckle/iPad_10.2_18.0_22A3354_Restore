@implementation _BMAeroMLLibraryNode

+ (id)identifier
{
  return CFSTR("AeroML");
}

+ (id)DataCorrelations
{
  return (id)objc_opt_class();
}

+ (id)Insights
{
  return (id)objc_opt_class();
}

+ (id)LabeledData
{
  return (id)objc_opt_class();
}

+ (id)RawEvent
{
  return (id)objc_opt_class();
}

+ (id)streamNames
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)validKeyPaths
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

+ (id)streamWithName:(id)a3
{
  return 0;
}

+ (id)sublibraries
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "DataCorrelations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(a1, "Insights");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(a1, "LabeledData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(a1, "RawEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
