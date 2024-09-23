@implementation DOCIntentLocation(DOCIntentsExtensions)

+ (void)imageForType:()DOCIntentsExtensions .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "+[DOCIntentLocation(DOCIntentsExtensions) imageForType:]";
  v4 = 2112;
  v5 = a1;
  _os_log_fault_impl(&dword_2172C6000, a2, OS_LOG_TYPE_FAULT, "%s encountered enexpected location type: %@", (uint8_t *)&v2, 0x16u);
}

@end
