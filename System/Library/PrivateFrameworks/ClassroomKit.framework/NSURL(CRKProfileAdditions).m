@implementation NSURL(CRKProfileAdditions)

+ (id)crk_macOSProfileURL
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "crk_nonContainerizedHomeDirectoryURL");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v0, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v7[1] = CFSTR("Library");
  v7[2] = CFSTR("Apple Education Configuration");
  v7[3] = CFSTR("Configuration.plist");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pathWithComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (uint64_t)crk_iOSPlaceholderProfileURL
{
  return objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/var/mobile/Library/Classroom/StudentConfiguration.plist"));
}

@end
