@implementation UINavigationController

void __86__UINavigationController_MFMailComposeRemoteService__mf_keyPathsMapForUICustomization__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("navigationBar.tintColor");
  v8[0] = objc_opt_class();
  v7[1] = CFSTR("navigationBar.barStyle");
  v8[1] = objc_opt_class();
  v7[2] = CFSTR("navigationBar.titleTextAttributes");
  v5[0] = *MEMORY[0x1E0DC1138];
  +[_MFValueTransformer valueTransformer](_MFFontToFontDescriptorTransformer, "valueTransformer");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  v5[1] = *MEMORY[0x1E0DC1140];
  v6[1] = objc_opt_class();
  v5[2] = *MEMORY[0x1E0DC1198];
  +[_MFValueTransformer valueTransformer](_MFNSShadowTransformer, "valueTransformer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v1;
  v5[3] = *MEMORY[0x1E0DC53F0];
  v6[3] = objc_opt_class();
  v5[4] = *MEMORY[0x1E0DC53F8];
  v6[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)mf_keyPathsMapForUICustomization_keyPathsMap;
  mf_keyPathsMapForUICustomization_keyPathsMap = v3;

}

void __84__UINavigationController_MFUtilities__mf_viewControllerOfClass_startFromTopOfStack___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

@end
