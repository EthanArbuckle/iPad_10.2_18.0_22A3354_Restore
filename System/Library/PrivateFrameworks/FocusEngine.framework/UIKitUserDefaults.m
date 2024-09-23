@implementation UIKitUserDefaults

uint64_t ___UIKitUserDefaults_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t result;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.UIKit"));
  v1 = (void *)qword_256BAFD00;
  qword_256BAFD00 = v0;

  result = os_variant_has_internal_diagnostics();
  if ((_DWORD)result)
    return objc_msgSend((id)qword_256BAFD00, "addSuiteNamed:", *MEMORY[0x24BDD0B50]);
  return result;
}

@end
