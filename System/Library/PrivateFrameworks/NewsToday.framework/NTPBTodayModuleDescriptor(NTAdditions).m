@implementation NTPBTodayModuleDescriptor(NTAdditions)

+ (id)nt_defaultModule
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)objc_opt_new();
  objc_msgSend(v0, "setModuleDescriptorType:", 0);
  v1 = (void *)objc_opt_new();
  objc_msgSend(v1, "setRequest:", v0);
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setIdentifier:", CFSTR("default"));
  objc_msgSend(v2, "setType:", 0);
  objc_msgSend(v2, "addAvailableContents:", v1);

  return v2;
}

+ (id)nt_moduleWithTagID:()NTAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setModuleDescriptorType:", 1);
  objc_msgSend(v4, "setTagID:", v3);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setRequest:", v4);
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setIdentifier:", v3);

  objc_msgSend(v6, "setType:", 1);
  objc_msgSend(v6, "addAvailableContents:", v5);

  return v6;
}

@end
