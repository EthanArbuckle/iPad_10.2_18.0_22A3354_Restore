@implementation _DPErrorUtilities

+ (BOOL)isCoreDataFatalError:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C979C8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "isEqualToValue:", &unk_1E9687390);
  return (char)v3;
}

@end
