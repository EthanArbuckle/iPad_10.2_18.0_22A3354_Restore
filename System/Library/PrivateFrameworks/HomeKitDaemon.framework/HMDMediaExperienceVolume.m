@implementation HMDMediaExperienceVolume

+ (BOOL)getActiveCategoryVolume:(float *)a3 andName:(id *)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x24BE64988], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v6, "getActiveCategoryVolume:andName:", a3, a4);

  return (char)a4;
}

@end
