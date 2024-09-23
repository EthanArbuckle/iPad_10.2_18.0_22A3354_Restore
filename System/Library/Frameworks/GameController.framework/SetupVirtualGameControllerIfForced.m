@implementation SetupVirtualGameControllerIfForced

void __SetupVirtualGameControllerIfForced_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc((Class)&off_254DEF040), "initWithSuiteName:", CFSTR("com.apple.GameController"));
  if (objc_msgSend(v3, "BOOLForKey:", CFSTR("GCForceVirtual")))
  {
    VirtualControllerBundle();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = v0;
    if (v0)
    {
      v2 = (void *)objc_msgSend(v0, "classNamed:", CFSTR("_GCVirtualControllerImpl"));
      if (v2)
        objc_msgSend(v2, "forceVirtualController");
    }

  }
}

@end
