@implementation NSUserDefaults

void __66__NSUserDefaults_BarcodeSupportExtras__bcs_barcodeSupportDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.BarcodeSupport"));
  v1 = (void *)bcs_barcodeSupportDefaults_barcodeSupportDefaults;
  bcs_barcodeSupportDefaults_barcodeSupportDefaults = v0;

}

@end
