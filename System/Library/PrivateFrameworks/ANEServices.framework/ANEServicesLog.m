@implementation ANEServicesLog

+ (id)verbose
{
  if (+[ANEServicesLog verbose]::onceToken != -1)
    dispatch_once(&+[ANEServicesLog verbose]::onceToken, &__block_literal_global);
  return (id)+[ANEServicesLog verbose]::_verbose;
}

os_log_t __25__ANEServicesLog_verbose__block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.ane", "aneverbose");
  +[ANEServicesLog verbose]::_verbose = (uint64_t)result;
  return result;
}

+ (id)test
{
  if (+[ANEServicesLog test]::onceToken != -1)
    dispatch_once(&+[ANEServicesLog test]::onceToken, &__block_literal_global_2);
  return (id)+[ANEServicesLog test]::_test;
}

os_log_t __22__ANEServicesLog_test__block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.ane", "anetest");
  +[ANEServicesLog test]::_test = (uint64_t)result;
  return result;
}

+ (id)services
{
  if (+[ANEServicesLog services]::onceToken != -1)
    dispatch_once(&+[ANEServicesLog services]::onceToken, &__block_literal_global_4);
  return (id)+[ANEServicesLog services]::_services;
}

os_log_t __26__ANEServicesLog_services__block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.ane", "aneservices");
  +[ANEServicesLog services]::_services = (uint64_t)result;
  return result;
}

+ (id)handle
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__ANEServicesLog_handle__block_invoke;
  block[3] = &unk_24C06AA88;
  block[4] = a1;
  if (+[ANEServicesLog handle]::onceToken != -1)
    dispatch_once(&+[ANEServicesLog handle]::onceToken, block);
  return (id)+[ANEServicesLog handle]::_handle;
}

uint64_t __24__ANEServicesLog_handle__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "services");
  +[ANEServicesLog handle]::_handle = result;
  return result;
}

@end
