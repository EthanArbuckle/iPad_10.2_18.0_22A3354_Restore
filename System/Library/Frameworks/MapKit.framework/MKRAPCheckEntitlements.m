@implementation MKRAPCheckEntitlements

void ___MKRAPCheckEntitlements_block_invoke()
{
  void *v0;
  int v1;
  void *v2;
  void *v3;
  uint64_t v4;
  const void *v5;
  const __CFBoolean *v6;
  const __CFBoolean *v7;
  CFTypeID v8;
  BOOL v9;
  const __CFBoolean *v10;
  const __CFBoolean *v11;
  CFTypeID v12;
  BOOL v13;
  _Unwind_Exception *v14;
  CFTypeRef cf;
  CFTypeRef *p_cf;
  uint64_t v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isInternalInstall");

  if (v1)
  {
    _MKRAPCheckEntitlements_entitlementCheckPassed = 0;
    cf = 0;
    p_cf = &cf;
    v17 = 0x2020000000;
    v2 = getSecTaskCreateFromSelfSymbolLoc_ptr;
    v18 = getSecTaskCreateFromSelfSymbolLoc_ptr;
    if (!getSecTaskCreateFromSelfSymbolLoc_ptr)
    {
      v3 = (void *)SecurityLibrary();
      v2 = dlsym(v3, "SecTaskCreateFromSelf");
      p_cf[3] = v2;
      getSecTaskCreateFromSelfSymbolLoc_ptr = v2;
    }
    _Block_object_dispose(&cf, 8);
    if (!v2)
    {
      dlerror();
      v14 = (_Unwind_Exception *)abort_report_np();
      _Block_object_dispose(&cf, 8);
      _Unwind_Resume(v14);
    }
    v4 = ((uint64_t (*)(_QWORD))v2)(0);
    if (v4)
    {
      v5 = (const void *)v4;
      cf = 0;
      v6 = (const __CFBoolean *)mk_SecTaskCopyValueForEntitlement(v4, (uint64_t)CFSTR("com.apple.accounts.appleaccount.fullaccess"), (uint64_t)&cf);
      if (v6)
      {
        v7 = v6;
        v8 = CFGetTypeID(v6);
        v9 = v8 == CFBooleanGetTypeID() && CFBooleanGetValue(v7) != 0;
        _MKRAPCheckEntitlements_entitlementCheckPassed = v9;
        CFRelease(v7);
      }
      if (!_MKRAPCheckEntitlements_entitlementCheckPassed)
      {
        v10 = (const __CFBoolean *)mk_SecTaskCopyValueForEntitlement((uint64_t)v5, (uint64_t)CFSTR("com.apple.private.accounts.allaccounts"), (uint64_t)&cf);
        if (v10)
        {
          v11 = v10;
          v12 = CFGetTypeID(v10);
          v13 = v12 == CFBooleanGetTypeID() && CFBooleanGetValue(v11) != 0;
          _MKRAPCheckEntitlements_entitlementCheckPassed = v13;
          CFRelease(v11);
        }
      }
      CFRelease(v5);
      if (cf)
        CFRelease(cf);
    }
    if (!_MKRAPCheckEntitlements_entitlementCheckPassed)
      NSLog(CFSTR("MAPS PLACE VIEW CONTROLLER (ONCE): Could not find or check the entitlement for Apple Accounts ('%@') or Full Account Access ('%@') on this process. This entitlement is required to correctly disable Report an Issue on certain configurations of iOS. Please add this entitlement to your binary and contact maps-client@group.apple.com for more information."), CFSTR("com.apple.accounts.appleaccount.fullaccess"), CFSTR("com.apple.private.accounts.allaccounts"));
  }
}

@end
