@implementation CAMediaTimingFunction(AppleServices)

+ (uint64_t)jet_appleServicesLoadingFunction
{
  LODWORD(a1) = 1051260355;
  LODWORD(a3) = 1062501089;
  LODWORD(a2) = 0;
  LODWORD(a4) = 1062501089;
  return objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", a1, a2, a3, a4);
}

@end
