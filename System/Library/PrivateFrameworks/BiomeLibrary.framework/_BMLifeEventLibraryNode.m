@implementation _BMLifeEventLibraryNode

+ (id)identifier
{
  return CFSTR("LifeEvent");
}

+ (id)Intraday
{
  return (id)objc_opt_class();
}

+ (id)Retrospective
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
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "Intraday");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(a1, "Retrospective");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
