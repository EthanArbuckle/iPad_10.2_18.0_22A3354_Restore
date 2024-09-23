@implementation NSData(COSE)

+ (id)dataWithCOSE:()COSE
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE50];
  -[COSE sourceObject](a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithCBOR:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
