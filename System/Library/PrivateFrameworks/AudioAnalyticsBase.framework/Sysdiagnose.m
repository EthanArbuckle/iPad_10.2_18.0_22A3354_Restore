@implementation Sysdiagnose

+ (BOOL)isInProgressWithDestination:(BOOL *)a3 error:(id *)a4
{
  *a3 = objc_msgSend(MEMORY[0x24BEDE3A8], "isSysdiagnoseInProgressWithError:", a4);
  return 1;
}

@end
