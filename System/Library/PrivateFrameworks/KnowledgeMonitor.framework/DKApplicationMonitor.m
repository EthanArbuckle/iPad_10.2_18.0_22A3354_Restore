@implementation DKApplicationMonitor

uint64_t __59___DKApplicationMonitor_focalApplicationFromDisplayLayout___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;

  v2 = a2;
  if (!objc_msgSend(v2, "isSpringBoardElement"))
    goto LABEL_8;
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    objc_msgSend(v2, "bundleIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v2, "layoutRole"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(&unk_24DA70EE0, "containsObject:", v5);

  if (!v6)
  {
LABEL_8:
    v4 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v2, "layoutRole") == 4)
  {
    objc_msgSend(v2, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(&unk_24DA70EF8, "containsObject:", v7);

  }
  else
  {
    v4 = 1;
  }
LABEL_9:

  return v4;
}

uint64_t __55___DKApplicationMonitor_displayLayoutTransitionHandler__block_invoke_2(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 168) == *(_QWORD *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "layoutMonitor:didUpdateDisplayLayout:withContext:");
  return result;
}

BOOL __97___DKApplicationMonitor_BMFrontBoardDisplayElement__donateElementsFromDisplayLayout_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __97___DKApplicationMonitor_BMFrontBoardDisplayElement__donateElementsFromDisplayLayout_withContext___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "level");
  if (v6 != objc_msgSend(v5, "level"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "level"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "level"));
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(v4, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  if (!v9)
  {
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v12 = (void *)v11;
    v9 = objc_msgSend(v10, "compare:", v11);

  }
  return v9;
}

void __55___DKApplicationMonitor_displayLayoutTransitionHandler__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;

  v13 = a2;
  v7 = a3;
  v8 = a4;
  v9 = (void *)os_transaction_create();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55___DKApplicationMonitor_displayLayoutTransitionHandler__block_invoke_2;
    block[3] = &unk_24DA67388;
    block[4] = v11;
    v15 = v13;
    v16 = v7;
    v17 = v8;
    dispatch_sync(v12, block);

  }
}

void __97___DKApplicationMonitor_BMFrontBoardDisplayElement__donateElementsFromDisplayLayout_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    objc_msgSend(v3, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218242;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_219056000, v4, OS_LOG_TYPE_DEFAULT, "BMFrontBoardDisplayElement - Finished initializing currentFrontBoardElements with %lu elements from stream, err: %@", (uint8_t *)&v7, 0x16u);

  }
}

void __97___DKApplicationMonitor_BMFrontBoardDisplayElement__donateElementsFromDisplayLayout_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_updateCurrentElementsWithDisplayElement:", v5);

    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }

}

void __97___DKApplicationMonitor_BMFrontBoardDisplayElement__donateElementsFromDisplayLayout_withContext___block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) & 1) == 0)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "timestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "_newElementFromExistingDisplayElement:newTimestamp:newChangeType:", v8, v6, 3);

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v7);
  }

}

void __97___DKApplicationMonitor_BMFrontBoardDisplayElement__donateElementsFromDisplayLayout_withContext___block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __97___DKApplicationMonitor_BMFrontBoardDisplayElement__donateElementsFromDisplayLayout_withContext___block_invoke_12_cold_1(v4, v5);

}

void __29___DKApplicationMonitor_init__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  BiomeLibrary();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "FrontBoard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DisplayElement");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 208);
  *(_QWORD *)(v4 + 208) = v3;

}

void __46___DKApplicationMonitor_platformSpecificStart__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "processUpdateHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUpdateHandler:", v4);

}

uint64_t __59___DKApplicationMonitor_focalApplicationFromDisplayLayout___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v6 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "compare:", v8);

      if (v9)
        break;
      if (objc_msgSend(v4, "count") <= (unint64_t)++v6)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v9 = 0;
  }

  return v9;
}

void __44___DKApplicationMonitor_ignoreAppExtension___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.CryptoTokenKit.setoken"), CFSTR("com.apple.Sharing.AirDropDiagnostic"), CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"), CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider"), CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged"), CFSTR("com.apple.UIKit.ShareUI"), CFSTR("com.apple.WebKit.WebContent"), CFSTR("com.apple.WebKit.Networking"), CFSTR("com.apple.WebKit.GPU"), CFSTR("com.apple.mobileslideshow.PhotosDiagnostics"), CFSTR("com.apple.CarKit.CarPlayDiagnosticsExtension"), CFSTR("com.apple.CloudDocsDaemon.diagnostic"), CFSTR("com.apple.Maps.DEMapsExtension"), CFSTR("com.apple.Search.framework.SpotlightDiagnostic"), CFSTR("com.apple.BiometricKit.BioLogDiagnostic"), CFSTR("com.apple.audio.toolbox.AudioToolbox.DiagnosticExtensions"), CFSTR("com.apple.Symptoms.SFDiagnosticExtension.appex"),
    CFSTR("com.apple.news.articlenotificationserviceextension"),
    CFSTR("com.apple.DiagnosticsService.SystemReport"),
    CFSTR("com.apple.FileProvider.LocalStorage"),
    CFSTR("com.apple.news.diagnosticextension"),
    CFSTR("com.apple.mobilesafari.SafariDiagnosticExtension"),
    CFSTR("com.apple.mobilemail.DiagnosticExtension"),
    CFSTR("com.apple.mobilecal.diagnosticextension"),
    CFSTR("com.apple.accessibility.Accessibility.AXTapToRadar"),
    CFSTR("com.apple.accessibility.Accessibility.GuidedAccessTapToRadar"),
    CFSTR("com.apple.accessibility.Accessibility.HearingAidsTapToRadar"),
    CFSTR("com.apple.accessibility.Accessibility.SwitchControlTapToRadar"),
    CFSTR("com.apple.accessibility.Accessibility.VoiceOverTapToRadar"),
    CFSTR("com.apple.audio.toolbox.AudioToolbox.DiagnosticExtensions"),
    CFSTR("com.apple.duet.expertcenter.diagnosticextension"),
    CFSTR("com.apple.keyboard.TypoTracker.DiagnosticExtension"),
    CFSTR("com.apple.PowerlogCore.diagnosticextension"),
    CFSTR("com.apple.PassKit.applepay.diagnosticextension"),
    CFSTR("com.apple.HomeKit.diagnosticextensioncom.apple.MediaPlayer.DiagnosticExtension"),
    CFSTR("com.apple.MobileAddressBook"),
    CFSTR("com.apple.MobileBackup.framework.DiagnosticExtension"),
    CFSTR("com.apple.CoreRoutine.RTDiagnosticExtension"),
    CFSTR("com.apple.DiagnosticExtensions.sysdiagnose"),
    CFSTR("com.apple.DiagnosticExtensions.Bluetooth"),
    CFSTR("com.apple.DiagnosticExtensions.WiFi"),
    CFSTR("com.apple.DiagnosticExtensions.Syslog"),
    CFSTR("com.apple.DiagnosticExtensions.StackShot"),
    CFSTR("com.apple.DiagnosticExtensions.Keyboard"),
    CFSTR("com.apple.DiagnosticExtensions.CrashLogs"),
    CFSTR("com.apple.DiagnosticExtensions.Panic"),
    CFSTR("com.apple.DiagnosticExtensions.LowMemory"),
    CFSTR("com.apple.DiagnosticExtensions.Siri"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ignoreAppExtension__ignoreList;
  ignoreAppExtension__ignoreList = v0;

}

void __45___DKApplicationMonitor_processUpdateHandler__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;

  v13 = a2;
  v7 = a3;
  v8 = a4;
  v9 = (void *)os_transaction_create();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __45___DKApplicationMonitor_processUpdateHandler__block_invoke_2;
    block[3] = &unk_24DA67388;
    block[4] = v11;
    v15 = v13;
    v16 = v8;
    v17 = v7;
    dispatch_sync(v12, block);

  }
}

uint64_t __45___DKApplicationMonitor_processUpdateHandler__block_invoke_2(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 176) == *(_QWORD *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "processMonitor:didUpdateState:forProcess:");
  return result;
}

void __97___DKApplicationMonitor_BMFrontBoardDisplayElement__donateElementsFromDisplayLayout_withContext___block_invoke_12_cold_1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "changeType");
  BMFrontBoardDisplayElementChangeTypeAsString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  _os_log_debug_impl(&dword_219056000, a2, OS_LOG_TYPE_DEBUG, "BMFrontBoardDisplayElement - %@ event for identifier: %@ bundleIdentifier: %@", (uint8_t *)&v7, 0x20u);

}

@end
