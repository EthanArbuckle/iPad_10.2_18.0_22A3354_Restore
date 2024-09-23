@implementation VNFgBgInstanceSegmenterError

+ (id)genericErrorInvalidSourceDescription
{
  return CFSTR("Data source is not valid!");
}

+ (id)genericErrorImageDescription
{
  return CFSTR("Image not found!");
}

+ (id)genericErrorModelDescription
{
  return CFSTR("Model cannot be loaded!");
}

+ (id)genericErrorConfigDescription
{
  return CFSTR("Config is not valid!");
}

+ (id)genericErrorEspressoContextDescription
{
  return CFSTR("Espresso context is not valid!");
}

+ (id)genericErrorEspressoPlanDescription
{
  return CFSTR("Espresso plan is not valid!");
}

+ (id)genericErrorIOSurface
{
  return CFSTR("IOSurface Failed!");
}

+ (id)allocationErrorIOSurface
{
  return CFSTR("IOSurface Allocation Failed!");
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = *MEMORY[0x1E0CB2D50];
  v11[0] = a4;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a4;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VNFgBgInstanceSegmenterErrorCodeDomain"), a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
