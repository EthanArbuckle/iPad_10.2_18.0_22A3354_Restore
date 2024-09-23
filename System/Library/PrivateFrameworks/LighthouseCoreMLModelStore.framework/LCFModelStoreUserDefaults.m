@implementation LCFModelStoreUserDefaults

+ (id)lastTrainedDate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.LighthouseCoreMLModelStore"));
  objc_msgSend(v2, "objectForKey:", CFSTR("lastTrained"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)setLastTrainedDate:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x24BDBCF50];
  v4 = a3;
  v5 = (id)objc_msgSend([v3 alloc], "initWithSuiteName:", CFSTR("com.apple.LighthouseCoreMLModelStore"));
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("lastTrained"));

}

@end
