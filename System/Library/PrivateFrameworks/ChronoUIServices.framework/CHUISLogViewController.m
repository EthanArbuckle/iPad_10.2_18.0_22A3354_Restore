@implementation CHUISLogViewController

void __CHUISLogViewController_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.chrono", "ViewController");
  v1 = (void *)CHUISLogViewController___logObj;
  CHUISLogViewController___logObj = (uint64_t)v0;

}

@end
