@implementation CCUIConnectivityWiFiDefaults

+ (id)standardDefaults
{
  if (qword_25414CC20 != -1)
    dispatch_once(&qword_25414CC20, &unk_24FFCA9A8);
  return (id)qword_25414CC10;
}

- (CCUIConnectivityWiFiDefaults)init
{
  return (CCUIConnectivityWiFiDefaults *)MEMORY[0x24BEDD108](self, sel__initWithDomain_, CFSTR("com.apple.control-center.WiFiModule"));
}

- (void)_bindAndRegisterDefaults
{
  const char *v3;
  id v4;

  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], a2, (uint64_t)"didPresentDisconnectBehaviorAlert");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__bindProperty_withDefaultKey_toDefaultValue_options_(self, v3, (uint64_t)v4, CFSTR("PresentedDisconnectBehaviorAlert"), MEMORY[0x24BDBD1C0], 4);

}

@end
