@implementation BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay

void __BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  mach_port_name_t v8;
  mach_port_name_t v9;
  char buffer[1024];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay_displayToModeCache, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mode");

  objc_msgSend((id)BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay_displayToModeCache, "bs_removeObject:fromCollectionForKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  objc_msgSend((id)BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay_displayToModeCache, "objectForKey:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "mode");

  bzero(buffer, 0x400uLL);
  CFStringGetCString(*(CFStringRef *)(a1 + 32), buffer, 1024, 0x8000100u);
  if (objc_msgSend(v5, "count"))
  {
    if (v4 != v7)
    {
      v8 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
      _BKSDisplaySetCloneMirroringModeForDestinationDisplay(v8, buffer, v7);
    }
  }
  else
  {
    v9 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
    _BKSDisplayRemoveCloneMirroringModeForDestinationDisplay(v9, buffer);
  }

}

@end
