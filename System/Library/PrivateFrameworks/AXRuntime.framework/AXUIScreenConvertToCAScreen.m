@implementation AXUIScreenConvertToCAScreen

void ___AXUIScreenConvertToCAScreen_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  -[objc_class valueForKey:](NSClassFromString((NSString *)CFSTR("UIScreen")), "valueForKey:", CFSTR("mainScreen"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_AXUIScreenConvertToCAScreen_mainScreen;
  _AXUIScreenConvertToCAScreen_mainScreen = v0;

  objc_msgSend((id)_AXUIScreenConvertToCAScreen_mainScreen, "valueForKey:", CFSTR("scale"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  _AXUIScreenConvertToCAScreen_MainScale = v3;

  objc_msgSend((id)_AXUIScreenConvertToCAScreen_mainScreen, "valueForKey:", CFSTR("_rotation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  _AXUIScreenConvertToCAScreen_MainRotation = v5;

  objc_msgSend((id)_AXUIScreenConvertToCAScreen_mainScreen, "valueForKey:", CFSTR("_unjailedReferenceBoundsInPixels"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rectValue");
  _AXUIScreenConvertToCAScreen_MainScreenSize_0 = v6;
  _AXUIScreenConvertToCAScreen_MainScreenSize_1 = v7;

}

@end
