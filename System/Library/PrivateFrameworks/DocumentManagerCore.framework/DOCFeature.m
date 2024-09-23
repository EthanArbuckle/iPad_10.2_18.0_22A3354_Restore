@implementation DOCFeature

+ (DOCFeatureState)useBlastDoorThumbnails
{
  if (useBlastDoorThumbnails_onceToken != -1)
    dispatch_once(&useBlastDoorThumbnails_onceToken, &__block_literal_global_2);
  return (DOCFeatureState *)(id)useBlastDoorThumbnails_cachedValue;
}

+ (DOCFeatureState)returnToSender
{
  if (returnToSender_onceToken != -1)
    dispatch_once(&returnToSender_onceToken, &__block_literal_global_36);
  return (DOCFeatureState *)(id)returnToSender_cachedValue;
}

+ (DOCFeatureState)showTips
{
  if (showTips_onceToken != -1)
    dispatch_once(&showTips_onceToken, &__block_literal_global_41);
  return (DOCFeatureState *)(id)showTips_cachedValue;
}

void __36__DOCFeature_useBlastDoorThumbnails__block_invoke()
{
  DOCFeatureStateFFSetting *v0;
  uint64_t v1;
  void *v2;

  v0 = [DOCFeatureStateFFSetting alloc];
  v1 = -[DOCFeatureStateFFSetting initWithDomainID:featureID:overrideKey:valueMode:requirements:](v0, "initWithDomainID:featureID:overrideKey:valueMode:requirements:", CFSTR("DocumentManager"), CFSTR("UseBlastDoorThumbnails"), 0, 0, MEMORY[0x24BDBD1A8]);
  v2 = (void *)useBlastDoorThumbnails_cachedValue;
  useBlastDoorThumbnails_cachedValue = v1;

}

void __22__DOCFeature_showTips__block_invoke()
{
  DOCFeatureStateFFSetting *v0;
  uint64_t v1;
  void *v2;

  v0 = [DOCFeatureStateFFSetting alloc];
  v1 = -[DOCFeatureStateFFSetting initWithDomainID:featureID:overrideKey:valueMode:requirements:](v0, "initWithDomainID:featureID:overrideKey:valueMode:requirements:", CFSTR("DocumentManager"), CFSTR("ShowTips"), 0, 1, MEMORY[0x24BDBD1A8]);
  v2 = (void *)showTips_cachedValue;
  showTips_cachedValue = v1;

}

void __28__DOCFeature_returnToSender__block_invoke()
{
  DOCFeatureStateFFSetting *v0;
  uint64_t v1;
  void *v2;

  v0 = [DOCFeatureStateFFSetting alloc];
  v1 = -[DOCFeatureStateFFSetting initWithDomainID:featureID:overrideKey:valueMode:requirements:](v0, "initWithDomainID:featureID:overrideKey:valueMode:requirements:", CFSTR("Synapse"), CFSTR("ReturnToSender"), 0, 0, MEMORY[0x24BDBD1A8]);
  v2 = (void *)returnToSender_cachedValue;
  returnToSender_cachedValue = v1;

}

+ (DOCFeatureState)quickLookInWindow
{
  if (quickLookInWindow_onceToken != -1)
    dispatch_once(&quickLookInWindow_onceToken, &__block_literal_global_6);
  return (DOCFeatureState *)(id)quickLookInWindow_cachedValue;
}

void __31__DOCFeature_quickLookInWindow__block_invoke()
{
  DOCFeatureStateFFSetting *v0;
  uint64_t v1;
  void *v2;

  v0 = [DOCFeatureStateFFSetting alloc];
  v1 = -[DOCFeatureStateFFSetting initWithDomainID:featureID:overrideKey:valueMode:requirements:](v0, "initWithDomainID:featureID:overrideKey:valueMode:requirements:", CFSTR("DocumentManager"), CFSTR("QuickLookInSeparateWindow"), 0, 0, MEMORY[0x24BDBD1A8]);
  v2 = (void *)quickLookInWindow_cachedValue;
  quickLookInWindow_cachedValue = v1;

}

+ (DOCFeatureState)quickLookEntireFolderInWindow
{
  if (quickLookEntireFolderInWindow_onceToken != -1)
    dispatch_once(&quickLookEntireFolderInWindow_onceToken, &__block_literal_global_9_0);
  return (DOCFeatureState *)(id)quickLookEntireFolderInWindow_cachedValue;
}

void __43__DOCFeature_quickLookEntireFolderInWindow__block_invoke()
{
  DOCFeatureStateFFSetting *v0;
  uint64_t v1;
  void *v2;

  v0 = [DOCFeatureStateFFSetting alloc];
  v1 = -[DOCFeatureStateFFSetting initWithDomainID:featureID:overrideKey:valueMode:requirements:](v0, "initWithDomainID:featureID:overrideKey:valueMode:requirements:", CFSTR("DocumentManager"), CFSTR("QuickLookEntireFolderInWindow"), 0, 2, MEMORY[0x24BDBD1A8]);
  v2 = (void *)quickLookEntireFolderInWindow_cachedValue;
  quickLookEntireFolderInWindow_cachedValue = v1;

}

+ (DOCFeatureState)quickLookRestrictContentTypesThatOpenInWindow
{
  if (quickLookRestrictContentTypesThatOpenInWindow_onceToken != -1)
    dispatch_once(&quickLookRestrictContentTypesThatOpenInWindow_onceToken, &__block_literal_global_12);
  return (DOCFeatureState *)(id)quickLookRestrictContentTypesThatOpenInWindow_cachedValue;
}

void __59__DOCFeature_quickLookRestrictContentTypesThatOpenInWindow__block_invoke()
{
  DOCFeatureStateFFSetting *v0;
  uint64_t v1;
  void *v2;

  v0 = [DOCFeatureStateFFSetting alloc];
  v1 = -[DOCFeatureStateFFSetting initWithDomainID:featureID:overrideKey:valueMode:requirements:](v0, "initWithDomainID:featureID:overrideKey:valueMode:requirements:", CFSTR("DocumentManager"), CFSTR("QuickLookRestrictContentTypesThatOpenInSeparateWindow"), 0, 0, MEMORY[0x24BDBD1A8]);
  v2 = (void *)quickLookRestrictContentTypesThatOpenInWindow_cachedValue;
  quickLookRestrictContentTypesThatOpenInWindow_cachedValue = v1;

}

+ (DOCFeatureState)quickLookInWindowShared
{
  if (quickLookInWindowShared_onceToken != -1)
    dispatch_once(&quickLookInWindowShared_onceToken, &__block_literal_global_15);
  return (DOCFeatureState *)(id)quickLookInWindowShared_cachedValue;
}

void __37__DOCFeature_quickLookInWindowShared__block_invoke()
{
  DOCFeatureStateFFSetting *v0;
  uint64_t v1;
  void *v2;

  v0 = [DOCFeatureStateFFSetting alloc];
  v1 = -[DOCFeatureStateFFSetting initWithDomainID:featureID:overrideKey:valueMode:requirements:](v0, "initWithDomainID:featureID:overrideKey:valueMode:requirements:", CFSTR("DocumentManager"), CFSTR("QuickLookInSeparateSharedWindow"), 0, 0, MEMORY[0x24BDBD1A8]);
  v2 = (void *)quickLookInWindowShared_cachedValue;
  quickLookInWindowShared_cachedValue = v1;

}

+ (DOCFeatureState)quickLookAllDocumentsInFiles
{
  if (quickLookAllDocumentsInFiles_onceToken != -1)
    dispatch_once(&quickLookAllDocumentsInFiles_onceToken, &__block_literal_global_18);
  return (DOCFeatureState *)(id)quickLookAllDocumentsInFiles_cachedValue;
}

void __42__DOCFeature_quickLookAllDocumentsInFiles__block_invoke()
{
  DOCFeatureStateFFSetting *v0;
  uint64_t v1;
  void *v2;

  v0 = [DOCFeatureStateFFSetting alloc];
  v1 = -[DOCFeatureStateFFSetting initWithDomainID:featureID:overrideKey:valueMode:requirements:](v0, "initWithDomainID:featureID:overrideKey:valueMode:requirements:", CFSTR("DocumentManager"), CFSTR("QuickLookAllDocumentsInFilesFirst"), 0, 0, MEMORY[0x24BDBD1A8]);
  v2 = (void *)quickLookAllDocumentsInFiles_cachedValue;
  quickLookAllDocumentsInFiles_cachedValue = v1;

}

+ (DOCFeatureState)suggestedMoveToFolderInContextMenu
{
  if (suggestedMoveToFolderInContextMenu_onceToken != -1)
    dispatch_once(&suggestedMoveToFolderInContextMenu_onceToken, &__block_literal_global_21);
  return (DOCFeatureState *)(id)suggestedMoveToFolderInContextMenu_cachedValue;
}

void __48__DOCFeature_suggestedMoveToFolderInContextMenu__block_invoke()
{
  DOCFeatureStateFFSetting *v0;
  uint64_t v1;
  void *v2;

  v0 = [DOCFeatureStateFFSetting alloc];
  v1 = -[DOCFeatureStateFFSetting initWithDomainID:featureID:overrideKey:valueMode:requirements:](v0, "initWithDomainID:featureID:overrideKey:valueMode:requirements:", CFSTR("DocumentManager"), CFSTR("SuggestedMoveToFolderInContextMenu"), 0, 0, MEMORY[0x24BDBD1A8]);
  v2 = (void *)suggestedMoveToFolderInContextMenu_cachedValue;
  suggestedMoveToFolderInContextMenu_cachedValue = v1;

}

+ (DOCFeatureState)usbRenameErase
{
  if (usbRenameErase_onceToken != -1)
    dispatch_once(&usbRenameErase_onceToken, &__block_literal_global_24);
  return (DOCFeatureState *)(id)usbRenameErase_cachedValue;
}

void __28__DOCFeature_usbRenameErase__block_invoke()
{
  DOCFeatureStateFFSetting *v0;
  uint64_t v1;
  void *v2;

  v0 = [DOCFeatureStateFFSetting alloc];
  v1 = -[DOCFeatureStateFFSetting initWithDomainID:featureID:overrideKey:valueMode:requirements:](v0, "initWithDomainID:featureID:overrideKey:valueMode:requirements:", CFSTR("DocumentManager"), CFSTR("USBRenameReformat"), 0, 1, MEMORY[0x24BDBD1A8]);
  v2 = (void *)usbRenameErase_cachedValue;
  usbRenameErase_cachedValue = v1;

}

+ (DOCFeatureState)usbEraseDialog
{
  if (usbEraseDialog_onceToken != -1)
    dispatch_once(&usbEraseDialog_onceToken, &__block_literal_global_27);
  return (DOCFeatureState *)(id)usbEraseDialog_cachedValue;
}

void __28__DOCFeature_usbEraseDialog__block_invoke()
{
  DOCFeatureStateFFSetting *v0;
  uint64_t v1;
  void *v2;

  v0 = [DOCFeatureStateFFSetting alloc];
  v1 = -[DOCFeatureStateFFSetting initWithDomainID:featureID:overrideKey:valueMode:requirements:](v0, "initWithDomainID:featureID:overrideKey:valueMode:requirements:", CFSTR("DocumentManager"), CFSTR("USBReformatDialog"), 0, 0, MEMORY[0x24BDBD1A8]);
  v2 = (void *)usbEraseDialog_cachedValue;
  usbEraseDialog_cachedValue = v1;

}

+ (DOCFeatureState)usbDiskProperties
{
  if (usbDiskProperties_onceToken != -1)
    dispatch_once(&usbDiskProperties_onceToken, &__block_literal_global_30);
  return (DOCFeatureState *)(id)usbDiskProperties_cachedValue;
}

void __31__DOCFeature_usbDiskProperties__block_invoke()
{
  DOCFeatureStateFFSetting *v0;
  uint64_t v1;
  void *v2;

  v0 = [DOCFeatureStateFFSetting alloc];
  v1 = -[DOCFeatureStateFFSetting initWithDomainID:featureID:overrideKey:valueMode:requirements:](v0, "initWithDomainID:featureID:overrideKey:valueMode:requirements:", CFSTR("DocumentManager"), CFSTR("USBDiskProperties"), 0, 1, MEMORY[0x24BDBD1A8]);
  v2 = (void *)usbDiskProperties_cachedValue;
  usbDiskProperties_cachedValue = v1;

}

+ (DOCFeatureState)forceUnmount
{
  if (forceUnmount_onceToken != -1)
    dispatch_once(&forceUnmount_onceToken, &__block_literal_global_33);
  return (DOCFeatureState *)(id)forceUnmount_cachedValue;
}

void __26__DOCFeature_forceUnmount__block_invoke()
{
  DOCFeatureStateFFSetting *v0;
  uint64_t v1;
  void *v2;

  v0 = [DOCFeatureStateFFSetting alloc];
  v1 = -[DOCFeatureStateFFSetting initWithDomainID:featureID:overrideKey:valueMode:requirements:](v0, "initWithDomainID:featureID:overrideKey:valueMode:requirements:", CFSTR("DocumentManager"), CFSTR("USBForceUnmount"), 0, 0, MEMORY[0x24BDBD1A8]);
  v2 = (void *)forceUnmount_cachedValue;
  forceUnmount_cachedValue = v1;

}

+ (DOCFeatureState)semanticSearch
{
  if (semanticSearch_onceToken != -1)
    dispatch_once(&semanticSearch_onceToken, &__block_literal_global_44);
  return (DOCFeatureState *)(id)semanticSearch_cachedValue;
}

void __28__DOCFeature_semanticSearch__block_invoke()
{
  DOCFeatureStateFFSetting *v0;
  uint64_t v1;
  void *v2;

  v0 = [DOCFeatureStateFFSetting alloc];
  v1 = -[DOCFeatureStateFFSetting initWithDomainID:featureID:overrideKey:valueMode:requirements:](v0, "initWithDomainID:featureID:overrideKey:valueMode:requirements:", CFSTR("DocumentManager"), CFSTR("SemanticSearch"), 0, 0, MEMORY[0x24BDBD1A8]);
  v2 = (void *)semanticSearch_cachedValue;
  semanticSearch_cachedValue = v1;

}

+ (DOCFeatureState)workaroundFor_113995648
{
  if (workaroundFor_113995648_onceToken != -1)
    dispatch_once(&workaroundFor_113995648_onceToken, &__block_literal_global_47);
  return (DOCFeatureState *)(id)workaroundFor_113995648_cachedValue;
}

void __37__DOCFeature_workaroundFor_113995648__block_invoke()
{
  DOCFeatureStateFFSetting *v0;
  uint64_t v1;
  void *v2;

  v0 = [DOCFeatureStateFFSetting alloc];
  v1 = -[DOCFeatureStateFFSetting initWithDomainID:featureID:overrideKey:valueMode:requirements:](v0, "initWithDomainID:featureID:overrideKey:valueMode:requirements:", CFSTR("DocumentManager"), CFSTR("WorkaroundFor_113995648"), 0, 0, MEMORY[0x24BDBD1A8]);
  v2 = (void *)workaroundFor_113995648_cachedValue;
  workaroundFor_113995648_cachedValue = v1;

}

+ (DOCFeatureState)protectedApps
{
  if (protectedApps_onceToken != -1)
    dispatch_once(&protectedApps_onceToken, &__block_literal_global_50);
  return (DOCFeatureState *)(id)protectedApps_cachedValue;
}

void __27__DOCFeature_protectedApps__block_invoke()
{
  DOCFeatureStateFFSetting *v0;
  uint64_t v1;
  void *v2;

  v0 = [DOCFeatureStateFFSetting alloc];
  v1 = -[DOCFeatureStateFFSetting initWithDomainID:featureID:overrideKey:valueMode:requirements:](v0, "initWithDomainID:featureID:overrideKey:valueMode:requirements:", CFSTR("AppProtection"), CFSTR("protected_apps"), 0, 0, MEMORY[0x24BDBD1A8]);
  v2 = (void *)protectedApps_cachedValue;
  protectedApps_cachedValue = v1;

}

+ (DOCFeatureState)dsEnumerationUSB
{
  if (dsEnumerationUSB_onceToken != -1)
    dispatch_once(&dsEnumerationUSB_onceToken, &__block_literal_global_55);
  return (DOCFeatureState *)(id)dsEnumerationUSB_cachedValue;
}

void __30__DOCFeature_dsEnumerationUSB__block_invoke()
{
  DOCFeatureStateFFSetting *v0;
  uint64_t v1;
  void *v2;

  v0 = [DOCFeatureStateFFSetting alloc];
  v1 = -[DOCFeatureStateFFSetting initWithDomainID:featureID:overrideKey:valueMode:requirements:](v0, "initWithDomainID:featureID:overrideKey:valueMode:requirements:", CFSTR("DocumentManager"), CFSTR("DSEnumeration_USB"), 0, 0, MEMORY[0x24BDBD1A8]);
  v2 = (void *)dsEnumerationUSB_cachedValue;
  dsEnumerationUSB_cachedValue = v1;

}

+ (DOCFeatureState)dsEnumerationFPv2
{
  if (dsEnumerationFPv2_onceToken != -1)
    dispatch_once(&dsEnumerationFPv2_onceToken, &__block_literal_global_58);
  return (DOCFeatureState *)(id)dsEnumerationFPv2_cachedValue;
}

void __31__DOCFeature_dsEnumerationFPv2__block_invoke()
{
  DOCFeatureStateFFSetting *v0;
  uint64_t v1;
  void *v2;

  v0 = [DOCFeatureStateFFSetting alloc];
  v1 = -[DOCFeatureStateFFSetting initWithDomainID:featureID:overrideKey:valueMode:requirements:](v0, "initWithDomainID:featureID:overrideKey:valueMode:requirements:", CFSTR("DocumentManager"), CFSTR("DSEnumeration_FPv2"), 0, 0, MEMORY[0x24BDBD1A8]);
  v2 = (void *)dsEnumerationFPv2_cachedValue;
  dsEnumerationFPv2_cachedValue = v1;

}

+ (DOCFeatureState)dsEnumerationLocal
{
  if (dsEnumerationLocal_onceToken != -1)
    dispatch_once(&dsEnumerationLocal_onceToken, &__block_literal_global_61);
  return (DOCFeatureState *)(id)dsEnumerationLocal_cachedValue;
}

void __32__DOCFeature_dsEnumerationLocal__block_invoke()
{
  DOCFeatureStateFFSetting *v0;
  uint64_t v1;
  void *v2;

  v0 = [DOCFeatureStateFFSetting alloc];
  v1 = -[DOCFeatureStateFFSetting initWithDomainID:featureID:overrideKey:valueMode:requirements:](v0, "initWithDomainID:featureID:overrideKey:valueMode:requirements:", CFSTR("DocumentManager"), CFSTR("DSEnumeration_Local"), 0, 0, MEMORY[0x24BDBD1A8]);
  v2 = (void *)dsEnumerationLocal_cachedValue;
  dsEnumerationLocal_cachedValue = v1;

}

+ (DOCFeatureState)dsEnumerationSMB
{
  if (dsEnumerationSMB_onceToken != -1)
    dispatch_once(&dsEnumerationSMB_onceToken, &__block_literal_global_64);
  return (DOCFeatureState *)(id)dsEnumerationSMB_cachedValue;
}

void __30__DOCFeature_dsEnumerationSMB__block_invoke()
{
  DOCFeatureStateFFSetting *v0;
  uint64_t v1;
  void *v2;

  v0 = [DOCFeatureStateFFSetting alloc];
  v1 = -[DOCFeatureStateFFSetting initWithDomainID:featureID:overrideKey:valueMode:requirements:](v0, "initWithDomainID:featureID:overrideKey:valueMode:requirements:", CFSTR("DocumentManager"), CFSTR("DSEnumeration_SMB"), 0, 0, MEMORY[0x24BDBD1A8]);
  v2 = (void *)dsEnumerationSMB_cachedValue;
  dsEnumerationSMB_cachedValue = v1;

}

+ (DOCFeatureState)viewOptionsSizeSetting
{
  if (viewOptionsSizeSetting_onceToken != -1)
    dispatch_once(&viewOptionsSizeSetting_onceToken, &__block_literal_global_67);
  return (DOCFeatureState *)(id)viewOptionsSizeSetting_cachedValue;
}

void __36__DOCFeature_viewOptionsSizeSetting__block_invoke()
{
  DOCFeatureStateFFSetting *v0;
  uint64_t v1;
  void *v2;

  v0 = [DOCFeatureStateFFSetting alloc];
  v1 = -[DOCFeatureStateFFSetting initWithDomainID:featureID:overrideKey:valueMode:requirements:](v0, "initWithDomainID:featureID:overrideKey:valueMode:requirements:", CFSTR("DocumentManager"), CFSTR("ViewOptionsSizeSetting"), 0, 0, MEMORY[0x24BDBD1A8]);
  v2 = (void *)viewOptionsSizeSetting_cachedValue;
  viewOptionsSizeSetting_cachedValue = v1;

}

+ (BOOL)_UIPTabInfrastructureEnabled
{
  Class v3;

  v3 = NSClassFromString(CFSTR("UITabBarController"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[objc_class _uip_isFloatingTabBarEnabled](v3, "_uip_isFloatingTabBarEnabled");
  else
    return objc_msgSend(a1, "_docImplementation_uip_isFloatingTabBarEnabled");
}

+ (BOOL)_docImplementation_uip_isUIPDocumentLandingEnabled
{
  if (_docImplementation_uip_isUIPDocumentLandingEnabled_onceToken != -1)
    dispatch_once(&_docImplementation_uip_isUIPDocumentLandingEnabled_onceToken, &__block_literal_global_72);
  return _docImplementation_uip_isUIPDocumentLandingEnabled_enabled;
}

void __64__DOCFeature__docImplementation_uip_isUIPDocumentLandingEnabled__block_invoke()
{
  int v0;
  char v1;
  id v2;

  _docImplementation_uip_isUIPDocumentLandingEnabled_enabled = (MGGetSInt32Answer() & 0xFFFFFFFD) == 1;
  v0 = dyld_program_sdk_at_least();
  if (v0)
    LOBYTE(v0) = _os_feature_enabled_impl();
  _docImplementation_uip_isUIPDocumentLandingEnabled_enabled = v0;
  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.UIKit"));
  v1 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ForceDocumentViewControllerDocumentLanding"));
  _docImplementation_uip_isUIPDocumentLandingEnabled_enabled |= v1;

}

+ (BOOL)_docImplementation_uip_isFloatingTabBarEnabled
{
  if (_docImplementation_uip_isFloatingTabBarEnabled_onceToken != -1)
    dispatch_once(&_docImplementation_uip_isFloatingTabBarEnabled_onceToken, &__block_literal_global_79);
  return _docImplementation_uip_isFloatingTabBarEnabled_wantsFloatingTabBar;
}

void __60__DOCFeature__docImplementation_uip_isFloatingTabBarEnabled__block_invoke()
{
  void *v0;
  char v1;
  id v2;

  if (dyld_program_sdk_at_least())
  {
    v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.UIKit"));
    objc_msgSend(v0, "objectForKey:", CFSTR("UseFloatingTabBar"));
    v2 = (id)objc_claimAutoreleasedReturnValue();

    if (v2)
      v1 = objc_msgSend(v2, "BOOLValue");
    else
      v1 = _os_feature_enabled_impl();
    _docImplementation_uip_isFloatingTabBarEnabled_wantsFloatingTabBar = v1;

  }
}

+ (BOOL)protectedAppsEnabled
{
  void *v2;
  char v3;

  +[DOCFeature protectedApps](DOCFeature, "protectedApps");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

+ (BOOL)supportsQuickLookInSharedWindow
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a1, "quickLookInWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEnabled"))
  {
    objc_msgSend(a1, "quickLookInWindowShared");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEnabled");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsQuickLookInsteadOfOpen:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "quickLookAllDocumentsInFiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEnabled"))
    v6 = objc_msgSend(v4, "isFilesApp");
  else
    v6 = 0;

  return v6;
}

+ (BOOL)quickLookInSeparateProcess
{
  return 0;
}

@end
