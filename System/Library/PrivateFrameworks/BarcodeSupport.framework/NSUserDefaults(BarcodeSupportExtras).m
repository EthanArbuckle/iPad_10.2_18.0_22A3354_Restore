@implementation NSUserDefaults(BarcodeSupportExtras)

+ (id)bcs_barcodeSupportDefaults
{
  if (bcs_barcodeSupportDefaults_onceToken != -1)
    dispatch_once(&bcs_barcodeSupportDefaults_onceToken, &__block_literal_global_9);
  return (id)bcs_barcodeSupportDefaults_barcodeSupportDefaults;
}

- (uint64_t)bcs_BOOLForKey:()BarcodeSupportExtras defaultValue:
{
  void *v5;

  objc_msgSend(a1, "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

@end
