@implementation AirPortAssistantUINavigationController

- (BOOL)disablesAutomaticKeyboardDismissal
{
  return 0;
}

- (BOOL)shouldAutorotate
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;

  v4 = (void *)objc_msgSend_currentDevice(MEMORY[0x24BDF69C8], a2, v2);
  return objc_msgSend_userInterfaceIdiom(v4, v5, v6) == 1 && sub_21A731A84(self, v7, v8) == 2;
}

- (unint64_t)supportedInterfaceOrientations
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;

  v4 = (void *)objc_msgSend_currentDevice(MEMORY[0x24BDF69C8], a2, v2);
  if (objc_msgSend_userInterfaceIdiom(v4, v5, v6) == 1 && sub_21A731A84(self, v7, v8) == 2)
    return 30;
  else
    return 2;
}

@end
