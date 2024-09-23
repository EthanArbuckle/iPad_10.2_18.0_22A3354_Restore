uint64_t _DDResultIsURL(uint64_t result)
{
  void *v1;
  uint64_t v2;
  void *v3;

  if (result)
  {
    v1 = (void *)_DDResultIsURL__sURLTypes;
    if (!_DDResultIsURL__sURLTypes)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0D1CAE0], *MEMORY[0x1E0D1CBC0], *MEMORY[0x1E0D1CB18], *MEMORY[0x1E0D1CB20], *MEMORY[0x1E0D1CAD8], *MEMORY[0x1E0D1CAB0], 0);
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = (void *)_DDResultIsURL__sURLTypes;
      _DDResultIsURL__sURLTypes = v2;

      v1 = (void *)_DDResultIsURL__sURLTypes;
    }
    return objc_msgSend(v1, "containsObject:", DDResultGetType());
  }
  return result;
}

uint64_t dd_urlLooksSuspicious(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = a1;
  objc_msgSend(v1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("http")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("https")))
  {
    v4 = objc_msgSend(v1, "_lp_userVisibleStringUsesEncodedHost");
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("javascript"));
  }
  v5 = v4;

  return v5;
}

id dd_transientAttributesSet()
{
  if (dd_transientAttributesSet_onceToken != -1)
    dispatch_once(&dd_transientAttributesSet_onceToken, &__block_literal_global_58);
  return (id)_sTransientAttributesSet;
}

id dd_ensureUrlIsUrl(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v3 = 0;
      goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = v1;
  }
  v3 = v2;
LABEL_5:

  return v3;
}

void __dd_transientAttributesSet_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0D1CC00], CFSTR("DDContext"), CFSTR("DDAttributeBackup"), CFSTR("DDFoundExistingLink"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_sTransientAttributesSet;
  _sTransientAttributesSet = v0;

}

id _DDURLFromResult(uint64_t a1)
{
  void *v1;
  void *v2;

  if (a1)
  {
    v1 = (void *)DDResultCopyExtractedURLWithOptions();
    if (v1)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v1);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

BOOL DDTrackEventCreationInHostApplication(_DWORD *a1)
{
  int v2;

  if (DDTrackEventCreationInHostApplication_onceToken != -1)
    dispatch_once(&DDTrackEventCreationInHostApplication_onceToken, &__block_literal_global_107);
  v2 = DDTrackEventCreationInHostApplication_track;
  if (a1 && DDTrackEventCreationInHostApplication_track)
    *a1 = DDTrackEventCreationInHostApplication_host;
  return v2 != 0;
}

void sub_19EFC05D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EFC09A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EFC1504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EFC1704(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[DDOperation main].cold.1();
    objc_end_catch();
    JUMPOUT(0x19EFC16E8);
  }
  _Unwind_Resume(a1);
}

void sub_19EFC2474(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19EFC287C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_19EFC2ED4(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  uint64_t v13;

  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[DDDetectionController _doURLification:].cold.4();
    objc_end_catch();
    JUMPOUT(0x19EFC2C88);
  }
  _Block_object_dispose((const void *)(v13 - 208), 8);
  _Unwind_Resume(exc_buf);
}

void sub_19EFC4ECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19EFC5070(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_19EFCDE28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

BOOL _supportsBusinessService()
{
  void *v0;
  unint64_t v1;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  return v1 < 2 || v1 == 6;
}

void sub_19EFCE860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

void sub_19EFD0618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void DDPerformWebSearchFromQuery(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v1 = a1;
  if (dd_canReadDefaultBrowser_onceToken != -1)
    dispatch_once(&dd_canReadDefaultBrowser_onceToken, &__block_literal_global_2);
  if (dd_canReadDefaultBrowser__isEntitled == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringByTrimmingCharactersInSet:", v2);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    +[DDUISearchWebHandler webSearchURLForQueryString:](DDUISearchWebHandler, "webSearchURLForQueryString:", v11);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openURL:configuration:completionHandler:", v3, 0, 0);

  }
  else
  {
    v3 = v1;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.datadetectors.AddToRecentsService"));

    if (v7)
    {
      NSLog(CFSTR("AddToRecentsService couldn't get the default browser"));
    }
    else
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.datadetectors.AddToRecentsService"));
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5816B0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setRemoteObjectInterface:", v9);

      objc_msgSend(v8, "resume");
      objc_msgSend(v8, "remoteObjectProxy");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "performWebSearchFromQuery:", v3);

      objc_msgSend(v8, "invalidate");
    }
    v11 = v3;
  }

}

void __dd_canReadDefaultBrowser_block_invoke()
{
  __SecTask *v0;
  const __CFArray *v1;
  CFTypeID TypeID;
  __SecTask *v3;
  const __CFArray *v4;
  CFTypeID v5;
  CFRange v6;
  CFRange v7;

  v0 = _copy_entitlement_value(CFSTR("com.apple.security.exception.shared-preference.read-only"));
  if (v0)
  {
    v1 = v0;
    TypeID = CFArrayGetTypeID();
    if (TypeID == CFGetTypeID(v1))
    {
      v6.length = CFArrayGetCount(v1);
      v6.location = 0;
      if (CFArrayContainsValue(v1, v6, CFSTR("com.apple.mobilesafarishared")))
        dd_canReadDefaultBrowser__isEntitled = 1;
    }
    CFRelease(v1);
  }
  if ((dd_canReadDefaultBrowser__isEntitled & 1) == 0)
  {
    v3 = _copy_entitlement_value(CFSTR("com.apple.security.exception.shared-preference.read-write"));
    if (v3)
    {
      v4 = v3;
      v5 = CFArrayGetTypeID();
      if (v5 == CFGetTypeID(v4))
      {
        v7.length = CFArrayGetCount(v4);
        v7.location = 0;
        if (CFArrayContainsValue(v4, v7, CFSTR("com.apple.mobilesafarishared")))
          dd_canReadDefaultBrowser__isEntitled = 1;
      }
      CFRelease(v4);
    }
  }
}

__SecTask *_copy_entitlement_value(const __CFString *a1)
{
  __SecTask *result;
  __SecTask *v3;
  CFTypeRef v4;

  result = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (result)
  {
    v3 = result;
    v4 = SecTaskCopyValueForEntitlement(result, a1, 0);
    CFRelease(v3);
    return (__SecTask *)v4;
  }
  return result;
}

void sub_19EFD50D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void OUTLINED_FUNCTION_5_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

void OUTLINED_FUNCTION_8_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_9_0(uint64_t a1, uint64_t a2)
{
  return a2;
}

id _displayString(void *a1, uint64_t SubresultWithType, void *a3, void *a4, int a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  const __CFString *Type;
  uint64_t v14;
  void *v15;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;

  v9 = a1;
  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (SubresultWithType)
  {
    if (!a5
      || (Type = (const __CFString *)DDResultGetType(), CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E0D1CAC8], 0))
      || (SubresultWithType = DDResultGetSubresultWithType(),
          DDResultGetMatchedString(),
          (v15 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      DDMapAddressFromResult(SubresultWithType);
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v15 = (void *)v14;
    }
  }
  else
  {
    if (v9)
    {
      DDMapAddressFromURL(v9);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    if (v10)
    {
      DDDefaultAddressForContact(v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        if (!a5 || (objc_msgSend(v17, "street"), (v19 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          objc_msgSend(MEMORY[0x1E0C973B0], "stringFromPostalAddress:style:", v18, 0);
          v19 = objc_claimAutoreleasedReturnValue();
        }
        v20 = (void *)v19;
      }
      else
      {
        v20 = 0;
      }
    }
    else
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("event"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("icsEvent"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v18;
      if (v18 || (v22 = v21) != 0)
      {
        objc_msgSend(v22, "location");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = 0;
      }

    }
    if (v20)
    {
      objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("(\\s|\\n)+"), CFSTR(" "), 1024, 0, objc_msgSend(v20, "length"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

void sub_19EFD7358(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _ddui_parsec_xpcInterface(int a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  void *v12;
  char *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  void *v21;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE581710);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)MEMORY[0x1E0C99E60];
    v3 = objc_opt_class();
    v4 = objc_opt_class();
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_startQueryWithResult_context_, 0, 0);
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    gotLoadHelper_x8__OBJC_CLASS___SFResultSection(v11);
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = sel_showClientQueryResults_error_;
    v14 = v1;
    v15 = v12;
    v16 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE55CAE8);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    gotLoadHelper_x8__OBJC_CLASS___SFResultSection(v20);
    objc_msgSend(v17, "setWithObjects:", v18, v19, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_performClientTextQueryWithTerm_queryId_sessionId_userAgent_reply_, 0, 1);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = sel_loadReportAnIssueImage_;
    v14 = v1;
    v15 = v12;
    v16 = 1;
  }
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v15, v13, 0, v16);

  return v1;
}

void DDRecursivelyRemoveResultLinksFromAnchor(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  id v20;
  id v21;
  id v22;

  v22 = a1;
  v5 = a2;
  v6 = a3;
  if (v22)
  {
    objc_msgSend(v22, "getAttribute:", *MEMORY[0x1E0D1CE48]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = objc_msgSend(v7, "isEqual:", CFSTR("true"));
    else
      v8 = 0;
    objc_msgSend(v22, "childNodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      do
      {
        objc_msgSend(v9, "item:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          DDRecursivelyRemoveResultLinksFromAnchor(v13, v22, v6);

        v12 = (v12 + 1);
      }
      while (v11 != (_DWORD)v12);
    }
    v14 = v8 ^ 1;
    if (!v5)
      v14 = 1;
    if ((v14 & 1) != 0)
    {
      v16 = v9;
    }
    else
    {
      objc_msgSend(v22, "childNodes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "copy");

      v17 = objc_msgSend(v16, "length");
      if (v17)
      {
        v18 = v17;
        do
        {
          objc_msgSend(v16, "item:", 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (id)objc_msgSend(v5, "insertBefore:refChild:", v19, v22);

          --v18;
        }
        while (v18);
      }
      v21 = (id)objc_msgSend(v5, "removeChild:", v22);
    }

  }
}

void sub_19EFDA6E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _DDArrayWithList(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v1, "length"))
  {
    v3 = 0;
    do
    {
      objc_msgSend(v1, "item:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v4);

      v3 = (v3 + 1);
    }
    while (v3 < objc_msgSend(v1, "length"));
  }

  return v2;
}

void _DDRemoveResultLinksFromArrayOfAnchors(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "parentNode");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "parentNode");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          DDRecursivelyRemoveResultLinksFromAnchor(v9, v10, v4);

      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

id DDLocalizedString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB34D0];
  v2 = a1;
  objc_msgSend(v1, "bundleWithIdentifier:", CFSTR("com.apple.DataDetectorsUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, &stru_1E4259460, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id DDLocalizedStringFromTable(void *a1, uint64_t a2, void *a3, void *a4)
{
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0CB34D0];
  v7 = a4;
  v8 = a3;
  v9 = a1;
  objc_msgSend(v6, "bundleWithIdentifier:", CFSTR("com.apple.DataDetectorsUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id DDLocalizedStringWithDefaultValue(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB34D0];
  v6 = a4;
  v7 = a1;
  objc_msgSend(v5, "bundleWithIdentifier:", CFSTR("com.apple.DataDetectorsUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", v7, v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id beginDateOfEventResults(void *a1, void *a2, _BYTE *a3, BOOL *a4, _QWORD *a5)
{
  return beginDateAndTimezoneOfEventResultsRespectingSpecificEndDates(a1, 0, a2, a3, a4, a5, 0);
}

id beginDateAndTimezoneOfEventResultsRespectingSpecificEndDates(void *a1, uint64_t a2, void *a3, _BYTE *a4, BOOL *a5, _QWORD *a6, _QWORD *a7)
{
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  const void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  const __CFString *Type;
  const __CFString *v27;
  void *v28;
  _BYTE *v29;
  _QWORD *v30;
  _QWORD *v31;
  id v33;
  BOOL *v34;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v39 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        if (DDResultGetCategory() == 4)
          objc_msgSend(v11, "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v14);
  }

  v18 = DDResultCreateFromDateTimeResults();
  if (!v18)
  {
    v23 = 0;
    goto LABEL_35;
  }
  v19 = (const void *)v18;
  v34 = a5;
  objc_msgSend(v10, "objectForKey:", CFSTR("ReferenceDate"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = v20;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v24 = v22;

  objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("ReferenceDate"));
  DDResultIsPartialDateRangeOrTimeRange();
  Type = (const __CFString *)DDResultGetType();
  v27 = (const __CFString *)*MEMORY[0x1E0D1CB88];
  v33 = v10;
  if (CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E0D1CB88], 0)
    && CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E0D1CA98], 0)
    && CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E0D1CAA0], 0))
  {
    v27 = (const __CFString *)*MEMORY[0x1E0D1CB80];
    if (CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E0D1CB80], 0)
      && CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E0D1CA90], 0))
    {
      if (v34)
        *v34 = 0;
      v29 = a4;
      v30 = a7;
      v31 = a6;
      if (!a6)
        goto LABEL_30;
      goto LABEL_29;
    }
    if (!DDResultCopyExtractedStartDateEndDate())
      goto LABEL_25;
LABEL_23:
    v28 = 0;

    goto LABEL_26;
  }
  if (DDResultCopyExtractedDateFromReferenceDate())
    goto LABEL_23;
LABEL_25:
  v28 = v24;
LABEL_26:
  v29 = a4;
  if (v34)
    *v34 = CFStringCompare(Type, v27, 0) == kCFCompareEqualTo;
  v30 = a7;
  v31 = a6;
  v24 = v28;
  v10 = v33;
  if (!a6)
    goto LABEL_30;
LABEL_29:
  *v31 = objc_retainAutorelease(0);
LABEL_30:
  if (v29)
    *v29 = 0;
  CFRelease(v19);
  if (v30)
    *v30 = objc_retainAutorelease(v25);
  v23 = v24;

LABEL_35:
  return v23;
}

id beginDateOfEventResultsRespectingSpecificEndDates(void *a1, uint64_t a2, void *a3, _BYTE *a4, _QWORD *a5)
{
  return beginDateAndTimezoneOfEventResultsRespectingSpecificEndDates(a1, a2, a3, a4, 0, a5, 0);
}

id dueDateAndTimezoneOfEventResults(void *a1, void *a2, _BYTE *a3, _QWORD *a4)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v16;
  id v17;

  v17 = 0;
  beginDateAndTimezoneOfEventResultsRespectingSpecificEndDates(a1, 0, a2, a3, 0, &v17, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;
  v7 = objc_alloc(MEMORY[0x1E0C99D48]);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "calendarIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithCalendarIdentifier:", v9);

  if (a4)
    objc_msgSend(v10, "setTimeZone:", *a4);
  v11 = v6;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "components:fromDate:", 224, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "hour") || objc_msgSend(v13, "minute"))
    {

    }
    else
    {
      v16 = objc_msgSend(v13, "second");

      v14 = v11;
      if (!v16)
        goto LABEL_8;
    }
  }
  v14 = v5;

LABEL_8:
  return v14;
}

id dd_urlUserVisibleString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;

  v1 = a1;
  objc_msgSend(v1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v1, "dd_isMaps:", 1))
  {
    DDMapAddressFromURL(v1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      goto LABEL_14;
LABEL_13:
    v9 = v4;
LABEL_18:
    v4 = v9;
    v7 = v9;
    goto LABEL_20;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("mailto")))
  {
    objc_msgSend(v1, "dd_emailFromMailtoScheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dd_userFriendlyEmail");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_14;
    goto LABEL_13;
  }
  if (!objc_msgSend(v1, "dd_isAnySimpleTelephonyScheme")
    || (objc_msgSend(v1, "dd_phoneNumberFromTelScheme"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_14:
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("http")) & 1) == 0
      && !objc_msgSend(v3, "isEqualToString:", CFSTR("https"))
      || (objc_msgSend(v1, "_lp_userVisibleString"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(v1, "absoluteString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 0;
      goto LABEL_20;
    }
    v9 = v10;
    goto LABEL_18;
  }
  v4 = v6;
  if ((objc_msgSend(v6, "containsString:", CFSTR("@")) & 1) != 0)
    goto LABEL_13;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("open")) & 1) == 0)
  {
    TUFormattedPhoneNumber();
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
    if (v8)
      goto LABEL_13;
    goto LABEL_14;
  }
  v7 = 0;
LABEL_20:

  return v7;
}

id actionSheetTitleForResult(uint64_t a1)
{
  void *v1;
  uint64_t Range;
  uint64_t v3;
  uint64_t v4;
  uint64_t RangeForURLification;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSRange v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  const __CFString *Type;
  unsigned int ParsecDomain;
  const __CFString *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  id result;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  NSRange v38;
  NSRange v39;

  if (a1)
  {
    DDResultGetMatchedString();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    Range = DDResultGetRange();
    v4 = v3;
    RangeForURLification = DDResultGetRangeForURLification();
    v7 = v6;
    v8 = RangeForURLification - Range;
    if (v8 || v6 != v4)
    {
      v39.length = objc_msgSend(v1, "length");
      v38.location = v8;
      v38.length = v7;
      v39.location = 0;
      v9 = NSIntersectionRange(v38, v39);
      if (v8 == v9.location && v7 == v9.length)
      {
        objc_msgSend(v1, "substringWithRange:", v8, v7);
        v10 = objc_claimAutoreleasedReturnValue();

        v1 = (void *)v10;
      }
    }
    switch(DDResultGetCategory())
    {
      case 1u:
        goto LABEL_17;
      case 3u:
        _DDSentenceCasedString(v1);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      case 4u:
        _DDSentenceCasedString(v1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0;
        objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\(|\\)|\\[|\\]"), 1, &v37);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v37;
        v36 = v14;
        objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("  +"), 1, &v36);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v36;

        if (v16)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *_DDEventSanitizedString(NSString *__strong)");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localizedDescription");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("DDUIUtils.m"), 219, v35);

        }
        objc_msgSend(v13, "stringByReplacingMatchesInString:options:range:withTemplate:", v12, 0, 0, objc_msgSend(v12, "length"), CFSTR(" "));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByReplacingMatchesInString:options:range:withTemplate:", v17, 0, 0, objc_msgSend(v17, "length"), CFSTR(" "));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_28;
      case 5u:
        Type = (const __CFString *)DDResultGetType();
        if (CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E0D1CAB8], 0))
        {
          if (DDResultHasType() && DDScannerShouldKeepParsecScoresBelowThreshold())
          {
            ParsecDomain = DDResultGetParsecDomain();
            if (ParsecDomain > 9)
              v21 = CFSTR("interesting to look up");
            else
              v21 = off_1E4258740[ParsecDomain];
            if (DDShouldUseDebugHighlightForResult())
              v30 = CFSTR("Internal: red link? Lookup thinks this hint may be %@, is it?");
            else
              v30 = CFSTR("Internal: Lookup thinks this hint is %@, is it?");
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v30, v21);
            v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
            v18 = v11;
            goto LABEL_29;
          }
LABEL_17:
          v12 = (void *)DDResultCopyExtractedURL();
          if (!v12
            || (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12),
                (v22 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
          {

LABEL_21:
            v11 = v1;
            goto LABEL_22;
          }
          v23 = v22;
          dd_urlUserVisibleString(v22);
          v24 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          DDResultGetSubresultWithType();
          DDResultGetSubresultWithType();
          DDResultGetValue();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          DDResultGetMatchedString();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "lowercaseString");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "lowercaseString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v25, "isEqualToString:", v26);

          if (v27)
          {
            objc_msgSend(v12, "uppercaseString");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "stringByAppendingString:", DDResultGetValue());
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_27;
          }
          _DDSentenceCasedString(v1);
          v24 = objc_claimAutoreleasedReturnValue();
        }
        v18 = (void *)v24;
LABEL_27:

LABEL_28:
LABEL_29:

        result = v18;
        break;
      default:
        goto LABEL_21;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *actionSheetTitleForResult(DDResultRef)");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("DDUIUtils.m"), 275, CFSTR("Attempting to determine title for result that is nil."));

    return 0;
  }
  return result;
}

id _DDSentenceCasedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  if ((unint64_t)objc_msgSend(v1, "length") > 1)
  {
    objc_msgSend(v1, "substringToIndex:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedCapitalizedString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "substringFromIndex:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", v5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v1, "localizedUppercaseString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

id actionSheetTitleForURL(void *a1)
{
  id v1;
  void *v2;
  void *v4;
  void *v5;

  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *actionSheetTitleForURL(NSURL *__strong)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("DDUIUtils.m"), 378, CFSTR("Attempting to determine title for url that is nil."));

  }
  dd_urlUserVisibleString(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id findNearbyResultsInArray(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t Range;
  DDResultTracker *v16;
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  id v25;

  v9 = a1;
  v25 = a5;
  v10 = a2 - 1;
  v11 = a2 + 1;
  v12 = objc_msgSend(v9, "count");
  v13 = a2 + 1 < v12;
  v14 = objc_msgSend(v9, "objectAtIndex:", a2);
  Range = DDResultGetRange();
  v16 = -[DDResultTracker initWithReferenceResult:]([DDResultTracker alloc], "initWithReferenceResult:", v14);
  -[DDResultTracker setMaximumDistanceForEmails:](v16, "setMaximumDistanceForEmails:", a3);
  -[DDResultTracker setMaximumDistance:](v16, "setMaximumDistance:", a4);
  if ((v10 & 0x8000000000000000) == 0 || v11 < v12)
  {
    v17 = v10 >= 0;
    do
    {
      if ((v17 & 1) != 0)
      {
        v18 = objc_msgSend(v9, "objectAtIndex:", v10);
        v19 = DDResultGetRange();
        v21 = Range - (v20 + v19);
        if ((v13 & 1) == 0)
          goto LABEL_6;
      }
      else
      {
        v18 = 0;
        v21 = -1;
        if ((v13 & 1) == 0)
        {
LABEL_6:
          if ((v17 & 1) == 0)
          {
            v13 = 0;
            goto LABEL_12;
          }
LABEL_10:
          v17 = -[DDResultTracker addResultIfAppropriate:referenceDate:referenceTimeZone:](v16, "addResultIfAppropriate:referenceDate:referenceTimeZone:", v18, v25, 0);
          --v10;
          goto LABEL_12;
        }
      }
      v22 = objc_msgSend(v9, "objectAtIndex:", v11);
      if ((v17 & (v21 < DDResultGetRange() - Range)) != 0)
        goto LABEL_10;
      v13 = -[DDResultTracker addResultIfAppropriate:referenceDate:referenceTimeZone:](v16, "addResultIfAppropriate:referenceDate:referenceTimeZone:", v22, v25, 0);
      ++v11;
LABEL_12:
      v17 &= v10 >= 0;
      v13 &= v11 < objc_msgSend(v9, "count");
    }
    while ((v17 & 1) != 0 || (v13 & 1) != 0);
  }
  -[DDResultTracker results](v16, "results");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

id findNearbyResultsInTextStorage(void *a1, unint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, void *a6)
{
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  DDResultTracker *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;

  v11 = a1;
  v12 = a6;
  v13 = *MEMORY[0x1E0D1CC00];
  objc_msgSend(v11, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D1CC00], a2, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "coreResult");

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v16 = -[DDResultTracker initWithReferenceResult:]([DDResultTracker alloc], "initWithReferenceResult:", v15);
  -[DDResultTracker setMaximumDistanceForEmails:](v16, "setMaximumDistanceForEmails:", a4);
  -[DDResultTracker setMaximumDistance:](v16, "setMaximumDistance:", a5);
  if (a2 >= a5)
    v17 = a2 - a5;
  else
    v17 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __findNearbyResultsInTextStorage_block_invoke;
  v39[3] = &unk_1E42586C0;
  v19 = v18;
  v40 = v19;
  objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v13, v17, a2 - v17, 2, v39);
  v20 = a2 + a3;
  if (objc_msgSend(v11, "length") - (a2 + a3) < a5)
    a5 = objc_msgSend(v11, "length") - v20;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = MEMORY[0x1E0C809B0];
  v35 = 3221225472;
  v36 = __findNearbyResultsInTextStorage_block_invoke_2;
  v37 = &unk_1E42586C0;
  v22 = v21;
  v38 = v22;
  objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v13, v20, a5, 0, &v34);
  while (objc_msgSend(v19, "count", v34, v35, v36, v37) || objc_msgSend(v22, "count"))
  {
    if (objc_msgSend(v19, "count"))
    {
      objc_msgSend(v19, "objectAtIndex:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = a2 - objc_msgSend(v23, "range");

    }
    else
    {
      v24 = -1;
    }
    if (objc_msgSend(v22, "count"))
    {
      objc_msgSend(v22, "objectAtIndex:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "range") - a2;

    }
    else
    {
      v26 = -1;
    }
    if (v24 >= v26)
    {
      objc_msgSend(v22, "objectAtIndex:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[DDResultTracker addResultIfAppropriate:referenceDate:referenceTimeZone:](v16, "addResultIfAppropriate:referenceDate:referenceTimeZone:", objc_msgSend(v30, "coreResult"), v12, 0);

      v29 = v22;
      if (!v31)
        goto LABEL_20;
LABEL_18:
      objc_msgSend(v29, "removeObjectAtIndex:", 0);
    }
    else
    {
      objc_msgSend(v19, "objectAtIndex:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[DDResultTracker addResultIfAppropriate:referenceDate:referenceTimeZone:](v16, "addResultIfAppropriate:referenceDate:referenceTimeZone:", objc_msgSend(v27, "coreResult"), v12, 0);

      v29 = v19;
      if (v28)
        goto LABEL_18;
LABEL_20:
      objc_msgSend(v29, "removeAllObjects");
    }
  }
  -[DDResultTracker results](v16, "results");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
  return v32;
}

uint64_t __findNearbyResultsInTextStorage_block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

uint64_t __findNearbyResultsInTextStorage_block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

uint64_t dd_callsRequireExternalPrompt()
{
  if (dd_callsRequireExternalPrompt_onceToken != -1)
    dispatch_once(&dd_callsRequireExternalPrompt_onceToken, &__block_literal_global_4);
  return dd_callsRequireExternalPrompt__entitled;
}

uint64_t __dd_callsRequireExternalPrompt_block_invoke()
{
  uint64_t result;

  result = _get_BOOL_entitlement((uint64_t)CFSTR("com.apple.springboard.allowallcallurls"));
  dd_callsRequireExternalPrompt__entitled = result ^ 1;
  return result;
}

uint64_t _get_BOOL_entitlement(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___get_BOOL_entitlement_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_get_BOOL_entitlement_onceToken != -1)
    dispatch_once(&_get_BOOL_entitlement_onceToken, block);
  return _get_BOOL_entitlement__isEntitled;
}

BOOL dd_canListURLHandlers()
{
  return _get_BOOL_entitlement((uint64_t)CFSTR("com.apple.private.coreservices.canmaplsdatabase")) != 0;
}

uint64_t applicationWithBundleIdentifierIsRestricted(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;

  v1 = a1;
  if (_get_BOOL_entitlement((uint64_t)CFSTR("com.apple.private.coreservices.canmaplsdatabase")))
  {
    v9 = 0;
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v1, 0, &v9);
    v3 = v9;
    if (v2)
    {
      v4 = 0;
    }
    else
    {
      v8 = 0;
      v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifierOfSystemPlaceholder:error:", v1, &v8);
      v4 = v8;
      if (!v2)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          applicationWithBundleIdentifierIsRestricted_cold_1((uint64_t)v1, (uint64_t)v3, (uint64_t)v4);
        v5 = 1;
        goto LABEL_9;
      }
    }
    objc_msgSend(v2, "applicationState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isRestricted");

LABEL_9:
    goto LABEL_10;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __applicationWithBundleIdentifierIsRestricted_block_invoke;
  block[3] = &unk_1E42580C8;
  v11 = v1;
  if (applicationWithBundleIdentifierIsRestricted_onceToken != -1)
    dispatch_once(&applicationWithBundleIdentifierIsRestricted_onceToken, block);
  v5 = 0;
  v3 = v11;
LABEL_10:

  return v5;
}

void __applicationWithBundleIdentifierIsRestricted_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Host process %@ can't map the LS db. This will be logged once", (uint8_t *)&v3, 0xCu);
  }
}

void DDUILogAssertionFailure(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v12 = (objc_class *)MEMORY[0x1E0CB3940];
  v13 = a5;
  v14 = (void *)objc_msgSend([v12 alloc], "initWithFormat:arguments:", v13, &a9);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Data Detectors UI assertion on %s:%d \"%s\" failed: %@"), a2, a4, a1, v14);
  if (LoadCrashSupportIfNecessary___CrashReportHandle)
    goto LABEL_2;
  v18 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport"), "fileSystemRepresentation"), 1);
  LoadCrashSupportIfNecessary___CrashReportHandle = (uint64_t)v18;
  if (!v18)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      DDUILogAssertionFailure_cold_2();
LABEL_2:
    v16 = DDUISimulateCrash;
    if (!DDUISimulateCrash)
      goto LABEL_4;
    goto LABEL_3;
  }
  v16 = dlsym(v18, "SimulateCrash");
  DDUISimulateCrash = v16;
  if (v16)
  {
LABEL_3:
    v17 = getpid();
    ((void (*)(uint64_t, uint64_t, void *))v16)(v17, 3131747805, v15);
  }
LABEL_4:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    DDUILogAssertionFailure_cold_1((uint64_t)v15);

}

id DDShipmentTrackingUrlForResult()
{
  void *v0;
  void *v1;

  DDResultGetShipmentTrackingUrlString();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

id DDWebSearchURLFromQuery(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = a1;
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringByTrimmingCharactersInSet:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAddingPercentEncodingWithAllowedCharacters:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("x-web-search://?%@"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLWithString:", v7);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

uint64_t dd_handleIsChatBot(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = a1;
  objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("@"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 2)
  {
    objc_msgSend(v2, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lowercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v4, "hasPrefix:", CFSTR("botplatform.")) & 1) != 0)
      v5 = 1;
    else
      v5 = objc_msgSend(v4, "containsString:", CFSTR(".botplatform."));
    v1 = v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t dd_isDeviceLocked()
{
  void *v0;
  uint64_t v1;

  v0 = (void *)MGCopyAnswer();
  v1 = objc_msgSend(v0, "BOOLValue");

  return v1;
}

uint64_t dd_isInternalInstall()
{
  if (dd_isInternalInstall_onceToken != -1)
    dispatch_once(&dd_isInternalInstall_onceToken, &__block_literal_global_288);
  return dd_isInternalInstall_isInternalInstall;
}

void __dd_isInternalInstall_block_invoke()
{
  char v0;
  id v1;

  v1 = (id)MGCopyAnswer();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v0 = objc_msgSend(v1, "isEqualToString:", CFSTR("Internal"));
  else
    v0 = 0;
  dd_isInternalInstall_isInternalInstall = v0;

}

BOOL dd_phoneNumberResultCanBeRdarLink(_BOOL8 result)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  if (result)
  {
    DDResultGetRange();
    if ((v1 & 0xFFFFFFFFFFFFFFFELL) != 8)
      return 0;
    if (dd_isInternalInstall_onceToken != -1)
      dispatch_once(&dd_isInternalInstall_onceToken, &__block_literal_global_288);
    if (!dd_isInternalInstall_isInternalInstall)
      return 0;
    DDResultGetMatchedString();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invertedSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v2, "rangeOfCharacterFromSet:", v4);
    return v5 == 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

void dd_requireDeviceUnlockAndPerformBlock(int a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  double v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (a1 && (v4 = (void *)MGCopyAnswer(), v5 = objc_msgSend(v4, "BOOLValue"), v4, v3 = v7, (v5 & 1) != 0))
    SBSRequestPasscodeUnlockUI_delayInitStub(v6);
  else
    (*((void (**)(id, uint64_t))v3 + 2))(v3, 1);

}

void sub_19EFDEBA0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *context, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,__int128 buf)
{
  id v25;

  if (a2 == 1)
  {
    v25 = objc_begin_catch(a1);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v25;
      _os_log_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Exception caught in dd_collectDDRangesForQuery: %@", (uint8_t *)&buf, 0xCu);
    }
    objc_end_catch();
    objc_autoreleasePoolPop(context);
    JUMPOUT(0x19EFDEB54);
  }
  _Unwind_Resume(a1);
}

uint64_t _isLinkNode(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "nodeType") == 1)
  {
    objc_msgSend(v1, "tagName");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "length") == 1 && (objc_msgSend(v2, "characterAtIndex:", 0) & 0xFFFFFFDF) == 0x41)
      v3 = objc_msgSend(v1, "hasAttribute:", CFSTR("href"));
    else
      v3 = 0;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t _isDataDetectorLinkNode(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "nodeType") == 1 && objc_msgSend(v1, "hasAttribute:", CFSTR("href")))
  {
    objc_msgSend(v1, "getAttribute:", CFSTR("href"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "hasPrefix:", *MEMORY[0x1E0D1CE48]);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void _removeDataDetectorLinkInNode(void *a1)
{
  void *v1;
  void *v2;
  id v3;

  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "parentElement");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "parentElement");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }

    DDRecursivelyRemoveResultLinksFromAnchor(v3, v2, 0);
  }

}

void DDUpdateContactWithContactResult(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, void *);
  void *v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD v37[5];
  _QWORD v38[6];

  v38[5] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "givenName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "familyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__2;
  v35 = __Block_byref_object_dispose__2;
  v36 = 0;
  if (!objc_msgSend(v5, "length") && !objc_msgSend(v6, "length"))
  {
    objc_msgSend(v4, "valueForKey:", *MEMORY[0x1E0D1CA70]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 == 0;

    if (!v12)
    {
      if (!objc_msgSend(MEMORY[0x1E0C9AA60], "count"))
      {
        v13 = *MEMORY[0x1E0C96790];
        v14 = *MEMORY[0x1E0D1CA50];
        v37[0] = *MEMORY[0x1E0D1CA80];
        v37[1] = v14;
        v15 = *MEMORY[0x1E0C966D0];
        v38[0] = v13;
        v38[1] = v15;
        v16 = *MEMORY[0x1E0C96780];
        v17 = *MEMORY[0x1E0D1CA60];
        v37[2] = *MEMORY[0x1E0D1CA68];
        v37[3] = v17;
        v18 = *MEMORY[0x1E0C966C0];
        v38[2] = v16;
        v38[3] = v18;
        v37[4] = *MEMORY[0x1E0D1CA78];
        v38[4] = *MEMORY[0x1E0C96798];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 5);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = MEMORY[0x1E0C809B0];
        v25 = 3221225472;
        v26 = __DDUpdateContactWithContactResult_block_invoke;
        v27 = &unk_1E42588A0;
        v30 = &v31;
        v28 = v4;
        v29 = v3;
        objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", &v24);

      }
      objc_msgSend(v4, "valueForKey:", *MEMORY[0x1E0D1CB00], v24, v25, v26, v27);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v32[5];
      v32[5] = v20;

      v22 = (void *)v32[5];
      if (v22)
      {
        objc_msgSend(v22, "matchedString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setJobTitle:", v23);

      }
      else
      {
        objc_msgSend(v3, "setJobTitle:", &stru_1E4259460);
      }
    }
  }
  objc_msgSend(v4, "valueForKey:", *MEMORY[0x1E0D1CA48]);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v32[5];
  v32[5] = v7;

  objc_msgSend(v3, "organizationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
    goto LABEL_6;
  v10 = v32[5] == 0;

  if (!v10)
  {
    objc_msgSend((id)v32[5], "matchedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setOrganizationName:", v9);
LABEL_6:

  }
  _Block_object_dispose(&v31, 8);

}

void sub_19EFE0A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

id DDPhoneLabeledValue(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v3 = a1;
  v4 = a2;
  if (!v4)
  {
    v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v8)
      DDPhoneLabeledValue_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v16 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v16)
      DDPhoneLabeledValue_cold_2(v16, v17, v18, v19, v20, v21, v22, v23);
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  v6 = (void *)v5;
  objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v7;
}

id DDHarvestDataFromResults(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  int v47;
  id v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  int v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  id v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t k;
  void *v81;
  void *v82;
  char v83;
  char v84;
  void *v85;
  char v86;
  void *v87;
  void *v88;
  void *v89;
  int v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  id v99;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  id v129;
  uint64_t v130;
  int v131;
  id obj;
  uint64_t v133;
  uint64_t v134;
  BOOL v135;
  void *v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  void *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  id v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  id v162;
  int v163;
  uint64_t v164;
  void *v165;
  void *v166;
  uint64_t v167;
  void *v168;
  uint64_t v169;
  void *v170;
  id v171;
  id v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  id v176;
  id v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  id v182;
  id v183;
  id v184;
  id v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  _BYTE v202[128];
  _BYTE v203[128];
  _BYTE v204[128];
  _BYTE v205[128];
  _BYTE v206[128];
  _QWORD v207[4];

  v207[2] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v129 = objc_alloc_init(MEMORY[0x1E0C97360]);
  v101 = v3;
  v130 = objc_msgSend(v3, "range");
  v6 = v5;
  v157 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v7 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v8 = *MEMORY[0x1E0C96740];
  v207[0] = *MEMORY[0x1E0C966A8];
  v207[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v207, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_ios_meContactWithKeysToFetch:error:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v201 = 0u;
    v200 = 0u;
    v199 = 0u;
    v198 = 0u;
    objc_msgSend(v10, "emailAddresses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v198, v206, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v199;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v199 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v198 + 1) + 8 * i), "value");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v157, "addObject:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v198, v206, 16);
      }
      while (v13);
    }

    v197 = 0u;
    v195 = 0u;
    v196 = 0u;
    v194 = 0u;
    objc_msgSend(v10, "instantMessageAddresses");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v194, v205, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v195;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v195 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v194 + 1) + 8 * j), "value");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "username");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v157, "addObject:", v23);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v194, v205, 16);
      }
      while (v19);
    }

  }
  objc_msgSend(v101, "type");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = *MEMORY[0x1E0D1CB58];
  v131 = objc_msgSend(v24, "isEqualToString:");

  v192 = 0u;
  v193 = 0u;
  v190 = 0u;
  v191 = 0u;
  obj = v4;
  v140 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v190, v204, 16);
  if (v140)
  {
    v124 = 0;
    v127 = 0;
    v171 = 0;
    v25 = 0;
    v26 = 0;
    v135 = 0;
    v138 = *(_QWORD *)v191;
    v27 = *MEMORY[0x1E0D1CAD8];
    v28 = v130;
    v29 = v130 + v6;
    v167 = *MEMORY[0x1E0D1CAB0];
    v164 = *MEMORY[0x1E0D1CAF8];
    v143 = *MEMORY[0x1E0D1CA28];
    v134 = *MEMORY[0x1E0D1CA58];
    v128 = *MEMORY[0x1E0D1CAC8];
    v126 = *MEMORY[0x1E0D1CAE8];
    v123 = *MEMORY[0x1E0D1CAE0];
    v103 = *MEMORY[0x1E0D1CBC0];
    v102 = *MEMORY[0x1E0C97068];
    v137 = (void *)*MEMORY[0x1E0C96908];
    v122 = *MEMORY[0x1E0D1CE90];
    v136 = (void *)*MEMORY[0x1E0C96930];
    v121 = *MEMORY[0x1E0D1CEB8];
    v120 = *MEMORY[0x1E0C96938];
    v119 = *MEMORY[0x1E0D1CEC0];
    v118 = *MEMORY[0x1E0C96928];
    v117 = *MEMORY[0x1E0D1CEB0];
    v116 = *MEMORY[0x1E0C96950];
    v115 = *MEMORY[0x1E0D1CED8];
    v114 = *MEMORY[0x1E0C96948];
    v113 = *MEMORY[0x1E0D1CED0];
    v112 = *MEMORY[0x1E0C96910];
    v111 = *MEMORY[0x1E0D1CE98];
    v110 = *MEMORY[0x1E0C96920];
    v109 = *MEMORY[0x1E0D1CEA8];
    v108 = *MEMORY[0x1E0C96940];
    v107 = *MEMORY[0x1E0D1CEC8];
    v106 = *MEMORY[0x1E0C96918];
    v105 = *MEMORY[0x1E0D1CEA0];
    v168 = (void *)*MEMORY[0x1E0C96FF8];
    v125 = *MEMORY[0x1E0D1CB00];
    v104 = *MEMORY[0x1E0D1CA48];
    v161 = (void *)*MEMORY[0x1E0C97070];
    v160 = *MEMORY[0x1E0D1CF08];
    v159 = *MEMORY[0x1E0D1CE88];
    v133 = *MEMORY[0x1E0C97000];
    v158 = *MEMORY[0x1E0D1CEF0];
    v170 = (void *)*MEMORY[0x1E0C97028];
    v156 = *MEMORY[0x1E0C97058];
    v155 = *MEMORY[0x1E0D1CF10];
    v154 = *MEMORY[0x1E0D1CEE8];
    v153 = *MEMORY[0x1E0C97020];
    v152 = *MEMORY[0x1E0D1CEE0];
    v151 = *MEMORY[0x1E0C97010];
    v150 = *MEMORY[0x1E0D1CE80];
    v149 = *MEMORY[0x1E0C97050];
    v148 = *MEMORY[0x1E0D1CF00];
    v147 = *MEMORY[0x1E0C97038];
    v146 = *MEMORY[0x1E0D1CEF8];
    v144 = *MEMORY[0x1E0D1CAD8];
    v169 = v130 + v6;
    while (1)
    {
      v30 = 0;
      do
      {
        v31 = v26;
        if (*(_QWORD *)v191 != v138)
        {
          v32 = v30;
          objc_enumerationMutation(obj);
          v30 = v32;
        }
        v145 = v30;
        v33 = *(void **)(*((_QWORD *)&v190 + 1) + 8 * v30);
        objc_msgSend(v33, "type");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "isEqualToString:", v139);

        v36 = (void *)MEMORY[0x1E0C99D20];
        if (v35)
        {
          objc_msgSend(v33, "subResults");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "arrayWithArray:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          v39 = 1;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v33);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v131;
        }
        v163 = v39;
        v188 = 0u;
        v189 = 0u;
        v186 = 0u;
        v187 = 0u;
        v172 = v38;
        v26 = v31;
        v174 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v186, v203, 16);
        if (v174)
        {
          v173 = *(_QWORD *)v187;
LABEL_27:
          v40 = 0;
          while (1)
          {
            if (*(_QWORD *)v187 != v173)
              objc_enumerationMutation(v172);
            v41 = *(void **)(*((_QWORD *)&v186 + 1) + 8 * v40);
            v42 = objc_msgSend(v41, "range");
            v44 = v42 - v29;
            if (v42 <= v28)
              v44 = v28 - (v43 + v42);
            if ((v44 & (unint64_t)~(v44 >> 63)) > 0x1F4)
              goto LABEL_156;
            objc_msgSend(v41, "type");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v175 = v45;
            if (objc_msgSend(v41, "category") == 2)
              break;
            if (!objc_msgSend(v45, "isEqualToString:", v27))
            {
              if ((objc_msgSend(v45, "isEqualToString:", v167) & 1) == 0
                && (objc_msgSend(v45, "isEqualToString:", v164) & 1) == 0
                && !objc_msgSend(v45, "isEqualToString:", v143))
              {
                if (objc_msgSend(v45, "isEqualToString:", v134))
                {
                  DDUpdateContactWithContactResult(v129, v41);
                  if (!v163)
                    goto LABEL_74;
                  if (v135)
                  {
                    v135 = 1;
                    goto LABEL_74;
                  }
                  objc_msgSend(v41, "valueForKey:", v125);
                  v48 = (id)objc_claimAutoreleasedReturnValue();
                  if (v48)
                  {
                    v135 = 1;
                    goto LABEL_73;
                  }
                  objc_msgSend(v41, "valueForKey:", v104);
                  v49 = (id)objc_claimAutoreleasedReturnValue();
                  v135 = v49 != 0;
                  goto LABEL_72;
                }
                if (objc_msgSend(v45, "isEqualToString:", v128))
                {
                  if (v127)
                    goto LABEL_74;
                  DDMapsGetBestAddressForResults(v172, 0);
                  v48 = (id)objc_claimAutoreleasedReturnValue();
                  if (!v48)
                  {
                    v127 = 0;
                    goto LABEL_73;
                  }
                  objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", v168, v48);
                  v49 = (id)objc_claimAutoreleasedReturnValue();
                  if (v49)
                  {
                    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v49);
                    v127 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v127 = 0;
                  }
                  goto LABEL_72;
                }
                v88 = v25;
                v89 = v26;
                if (objc_msgSend(v45, "isEqualToString:", v126))
                {
                  v177 = 0;
                  v176 = 0;
                  v90 = objc_msgSend(v41, "getIMScreenNameValue:type:", &v177, &v176);
                  v48 = v177;
                  v49 = v176;
                  if (v90)
                  {
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v137, v122, v136, v121, v120, v119, v118, v117, v116, v115, v114, v113, v112, v111, v110, v109, v108,
                      v107,
                      v106,
                      v105,
                      0);
                    v91 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v91, "objectForKey:", v49);
                    v92 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v92)
                    {
                      v166 = v91;
                      v93 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97330]), "initWithUsername:service:", v48, v92);
                      v94 = (uint64_t)v171;
                      if (!v171)
                      {
                        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                        v94 = objc_claimAutoreleasedReturnValue();
                      }
                      v171 = (id)v94;
                      v26 = v89;
                      if (v93)
                      {
                        objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", v168, v93);
                        v95 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v95 && (objc_msgSend(v171, "containsObject:", v95) & 1) == 0)
                          objc_msgSend(v171, "addObject:", v95);

                      }
                      v91 = v166;
                    }
                    else
                    {
                      v26 = v89;
                    }

                    v25 = v88;
                    v29 = v169;
                    goto LABEL_72;
                  }
                }
                else
                {
                  if (!v163
                    || (objc_msgSend(v45, "isEqualToString:", v123) & 1) == 0
                    && !objc_msgSend(v45, "isEqualToString:", v103)
                    || v124)
                  {
                    v25 = v88;
                    goto LABEL_74;
                  }
                  v96 = (void *)MEMORY[0x1E0C97338];
                  objc_msgSend(v41, "matchedString");
                  v97 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v96, "labeledValueWithLabel:value:", v102, v97);
                  v48 = (id)objc_claimAutoreleasedReturnValue();

                  if (!v48)
                  {
                    v124 = 0;
                    v26 = v89;
                    v25 = v88;
                    goto LABEL_73;
                  }
                  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v48);
                  v49 = 0;
                  v124 = (void *)objc_claimAutoreleasedReturnValue();
                }
                v26 = v89;
                v25 = v88;
                goto LABEL_72;
              }
              v57 = v168;
              v183 = 0;
              v182 = 0;
              v58 = objc_msgSend(v41, "getMailValue:label:", &v183, &v182);
              v59 = v183;
              v49 = v182;
              if (v58)
              {
                v165 = v57;
                objc_msgSend(v59, "dd_userFriendlyEmail");
                v48 = (id)objc_claimAutoreleasedReturnValue();

                if ((v163 & 1) != 0 || (objc_msgSend(v157, "containsObject:", v48) & 1) == 0)
                {
                  if (v25)
                  {
                    if (objc_msgSend(v25, "count"))
                      goto LABEL_57;
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  if (v49)
                  {
                    v68 = v25;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v161, v160, v165, v159, v133, v158, 0);
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v69, "objectForKey:", v49);
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    v71 = v70;
                    v162 = v165;
                    if (v70)
                    {
                      v162 = v70;

                    }
                    v25 = v68;
                    v29 = v169;
LABEL_87:

                  }
                  else
                  {
                    v162 = v165;
                    if (v135)
                    {
                      v162 = v161;
                      v69 = v165;
                      goto LABEL_87;
                    }
                  }
                  if (v48)
                  {
                    objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", v162, v48);
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v72 && (objc_msgSend(v25, "containsObject:", v72) & 1) == 0)
                      objc_msgSend(v25, "addObject:", v72);

                  }
                  if ((objc_msgSend(v175, "isEqualToString:", v164) & 1) != 0
                    || objc_msgSend(v175, "isEqualToString:", v143))
                  {
                    v141 = v25;
                    v73 = objc_msgSend(v175, "isEqualToString:", v164);
                    v74 = v137;
                    if (v73)
                      v74 = v136;
                    v75 = v74;
                    v76 = v171;
                    if (!v171)
                    {
                      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                      v76 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    v142 = v26;
                    v180 = 0u;
                    v181 = 0u;
                    v178 = 0u;
                    v179 = 0u;
                    v171 = v76;
                    v77 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v178, v202, 16);
                    if (v77)
                    {
                      v78 = v77;
                      v79 = *(_QWORD *)v179;
                      while (2)
                      {
                        for (k = 0; k != v78; ++k)
                        {
                          if (*(_QWORD *)v179 != v79)
                            objc_enumerationMutation(v171);
                          objc_msgSend(*(id *)(*((_QWORD *)&v178 + 1) + 8 * k), "value");
                          v81 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v81, "service");
                          v82 = (void *)objc_claimAutoreleasedReturnValue();
                          v83 = objc_msgSend(v82, "isEqualToString:", v75);

                          if ((v83 & 1) != 0)
                          {
                            v84 = 1;
                            goto LABEL_109;
                          }
                        }
                        v78 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v178, v202, 16);
                        if (v78)
                          continue;
                        break;
                      }
                      v84 = 0;
LABEL_109:
                      v28 = v130;
                      v27 = v144;
                      v29 = v169;
                    }
                    else
                    {
                      v84 = 0;
                    }

                    if (v48)
                    {
                      v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97330]), "initWithUsername:service:", v48, v75);
                      if (v85)
                        v86 = v84;
                      else
                        v86 = 1;
                      if ((v86 & 1) == 0)
                      {
                        objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", v165, v85);
                        v87 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v87 && (objc_msgSend(v171, "containsObject:", v87) & 1) == 0)
                          objc_msgSend(v171, "addObject:", v87);

                        v29 = v169;
                      }

                    }
                    v25 = v141;
                    v26 = v142;
                  }

                  goto LABEL_72;
                }
LABEL_57:
                v59 = v48;
                v57 = v165;
              }

              v48 = v59;
              goto LABEL_72;
            }
            objc_msgSend(v41, "matchedString");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "lowercaseString");
            v48 = (id)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v48, "hasPrefix:", CFSTR("mailto:")))
            {
              objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v48);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "dd_emailFromMailtoScheme");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "dd_userFriendlyEmail");
              v49 = (id)objc_claimAutoreleasedReturnValue();

              if (v49)
              {
                objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", 0, v49);
                v46 = (id)objc_claimAutoreleasedReturnValue();
                if (v46)
                  objc_msgSend(v25, "addObject:", v46);
LABEL_71:

              }
LABEL_72:

              goto LABEL_73;
            }
            if (objc_msgSend(v48, "hasPrefix:", CFSTR("tel:")))
            {
              objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v48);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "dd_phoneNumberFromTelScheme");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              DDPhoneLabeledValue(0, v61);
              v49 = (id)objc_claimAutoreleasedReturnValue();

              if (v49 && (objc_msgSend(v26, "containsObject:", v49) & 1) == 0)
                objc_msgSend(v26, "addObject:", v49);
              goto LABEL_72;
            }
LABEL_73:

            v45 = v175;
LABEL_74:

            if (++v40 == v174)
            {
              v98 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v186, v203, 16);
              v174 = v98;
              if (v98)
                goto LABEL_27;
              goto LABEL_156;
            }
          }
          v46 = v170;
          v185 = 0;
          v184 = 0;
          v47 = objc_msgSend(v41, "getPhoneValue:label:", &v185, &v184);
          v48 = v185;
          v49 = v184;
          if (!v47)
            goto LABEL_71;
          if (v48)
          {
            TUFormattedPhoneNumber();
            v50 = objc_claimAutoreleasedReturnValue();
            v51 = (void *)v50;
            if (v50)
              v52 = (void *)v50;
            else
              v52 = v48;
            v53 = v52;

            v48 = v53;
            v29 = v169;
          }
          if (v26)
          {
            if ((unint64_t)objc_msgSend(v26, "count") > 2)
              goto LABEL_71;
            if (!v49)
              goto LABEL_67;
LABEL_64:
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v161, v160, v168, v159, v46, v158, v156, v155, v46, v154, v153, v152, v151, v150, v149, v148, v147,
              v146,
              0);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "objectForKey:", v49);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = v63;
            if (v63)
            {
              v65 = v25;
              v66 = v63;

              v46 = v66;
              v25 = v65;
              v27 = v144;
            }

            v29 = v169;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v49)
              goto LABEL_64;
          }
LABEL_67:
          DDPhoneLabeledValue(v46, v48);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          if (v67 && (objc_msgSend(v26, "containsObject:", v67) & 1) == 0)
            objc_msgSend(v26, "addObject:", v67);

          goto LABEL_71;
        }
LABEL_156:

        v30 = v145 + 1;
      }
      while (v145 + 1 != v140);
      v140 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v190, v204, 16);
      if (!v140)
        goto LABEL_160;
    }
  }
  v124 = 0;
  v127 = 0;
  v171 = 0;
  v25 = 0;
  v26 = 0;
LABEL_160:

  objc_msgSend(v129, "setEmailAddresses:", v25);
  objc_msgSend(v129, "setUrlAddresses:", v124);
  objc_msgSend(v129, "setInstantMessageAddresses:", v171);
  objc_msgSend(v129, "setPhoneNumbers:", v26);
  objc_msgSend(v129, "setPostalAddresses:", v127);
  v99 = v129;

  return v99;
}

void DDMergeContactIntoContact(void *a1, void *a2, int a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  int *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  id obj;
  _BOOL4 v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  int v64;
  _BYTE v65[128];
  _QWORD v66[13];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  v5 = a2;
  v6 = *MEMORY[0x1E0C967C0];
  v7 = *MEMORY[0x1E0C966A8];
  v66[0] = *MEMORY[0x1E0C967C0];
  v66[1] = v7;
  v50 = v7;
  v43 = *MEMORY[0x1E0C968A0];
  v44 = *MEMORY[0x1E0C96740];
  v66[2] = *MEMORY[0x1E0C96740];
  v66[3] = v43;
  v8 = *MEMORY[0x1E0C96758];
  v42 = *MEMORY[0x1E0C967F0];
  v66[4] = *MEMORY[0x1E0C967F0];
  v66[5] = v8;
  v38 = *MEMORY[0x1E0C96780];
  v39 = *MEMORY[0x1E0C966D0];
  v66[6] = *MEMORY[0x1E0C966D0];
  v66[7] = v38;
  v36 = *MEMORY[0x1E0C96798];
  v37 = *MEMORY[0x1E0C966C0];
  v66[8] = *MEMORY[0x1E0C966C0];
  v66[9] = v36;
  v34 = v8;
  v35 = *MEMORY[0x1E0C967B8];
  v66[10] = *MEMORY[0x1E0C967B8];
  v66[11] = v8;
  v41 = *MEMORY[0x1E0C96790];
  v66[12] = *MEMORY[0x1E0C96790];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "organizationName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
    v11 = 1;
  else
    v11 = objc_msgSend(v4, "contactType") == 1;
  v52 = v11;

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v9;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v56;
    v33 = &v64;
    v15 = *MEMORY[0x1E0C97000];
    v54 = *MEMORY[0x1E0C97070];
    v47 = v5;
    v48 = v4;
    v45 = *(_QWORD *)v56;
    v46 = v6;
    do
    {
      v16 = 0;
      v49 = v13;
      do
      {
        if (*(_QWORD *)v56 != v14)
          objc_enumerationMutation(obj);
        v53 = v16;
        v17 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v16);
        objc_msgSend(v4, "valueForKey:", v17, v33);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v17, "isEqualToString:", v6) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", v50) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", v44) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", v43) & 1) != 0
          || objc_msgSend(v17, "isEqualToString:", v42))
        {
          if (objc_msgSend(v18, "count"))
          {
            if (v52)
            {
              v19 = v18;
              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v19, "count"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v59 = 0u;
              v60 = 0u;
              v61 = 0u;
              v62 = 0u;
              v20 = v19;
              v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
              if (v21)
              {
                v22 = v21;
                v23 = *(_QWORD *)v60;
                do
                {
                  for (i = 0; i != v22; ++i)
                  {
                    if (*(_QWORD *)v60 != v23)
                      objc_enumerationMutation(v20);
                    v25 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
                    objc_msgSend(v25, "label");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = objc_msgSend(v26, "isEqualToString:", v15);

                    if (v27)
                    {
                      v28 = (void *)MEMORY[0x1E0C97338];
                      objc_msgSend(v25, "value");
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v28, "labeledValueWithLabel:value:", v54, v29);
                      v30 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v30)
                        objc_msgSend(v18, "addObject:", v30);

                    }
                    else
                    {
                      objc_msgSend(v18, "addObject:", v25);
                    }
                  }
                  v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
                }
                while (v22);
              }

              v5 = v47;
              v4 = v48;
              v14 = v45;
              v6 = v46;
              v13 = v49;
            }
            objc_msgSend(v5, "setValue:forKey:", v18, v17);
          }
        }
        else if ((objc_msgSend(v17, "isEqualToString:", v41) & 1) != 0
               || (objc_msgSend(v17, "isEqualToString:", v39) & 1) != 0
               || (objc_msgSend(v17, "isEqualToString:", v38) & 1) != 0
               || (objc_msgSend(v17, "isEqualToString:", v37) & 1) != 0
               || (objc_msgSend(v17, "isEqualToString:", v36) & 1) != 0
               || (objc_msgSend(v17, "isEqualToString:", v35) & 1) != 0
               || objc_msgSend(v17, "isEqualToString:", v34))
        {
          if (a3)
          {
            objc_msgSend(v4, "valueForKey:", v17);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setValue:forKey:", v31, v17);

          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          DDMergeContactIntoContact_cold_1(buf, (uint64_t)v17, v33);
        }

        v16 = v53 + 1;
      }
      while (v53 + 1 != v13);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
      v13 = v32;
    }
    while (v32);
  }

}

id DDDefaultAddressForContact(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  if (objc_msgSend(v1, "isKeyAvailable:", CFSTR("postalAddresses")))
  {
    objc_msgSend(v1, "postalAddresses");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

BOOL DDContactHasNameInfo(void *a1)
{
  id v1;
  void *v2;
  _BOOL8 v3;

  v1 = a1;
  if (objc_msgSend(v1, "isKeyAvailable:", CFSTR("givenName")))
  {
    objc_msgSend(v1, "givenName");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v1, "isKeyAvailable:", CFSTR("familyName")))
  {
    objc_msgSend(v1, "familyName");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v1, "isKeyAvailable:", CFSTR("organizationName")))
    {
      v3 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v1, "organizationName");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2 != 0;

LABEL_8:
  return v3;
}

void DDAugmentContactWithResultsFromAction(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void **v9;
  void *v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v4, "result");
  v6 = objc_msgSend(v4, "coalescedResult");
  if (v5)
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D1CE68], "resultFromCoreResult:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v7;
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = (void **)v25;
    }
    else
    {
      if (objc_msgSend(v4, "associatedResults"))
      {
        objc_msgSend(MEMORY[0x1E0D1CE68], "resultsFromCoreResults:");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0D1CE68], "resultFromCoreResult:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v7;
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = &v24;
    }
    objc_msgSend(v8, "arrayWithObjects:count:", v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
    objc_msgSend(MEMORY[0x1E0D1CE68], "resultFromCoreResult:", v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v10, "sortedArrayUsingFunction:context:", MEMORY[0x1E0D1CE60], v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v20;
    }
    objc_msgSend(MEMORY[0x1E0D1CE68], "resultFromCoreResult:", v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    DDHarvestDataFromResults(v21, v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "associatedVisualResults");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _DDFillContactWithGroupResult(v22, v23);

    DDMergeContactIntoContact(v22, v3, 1);
    goto LABEL_12;
  }
  v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v11)
    DDAugmentContactWithResultsFromAction_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
LABEL_12:

}

void _DDFillContactWithGroupResult(void *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  id obj;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  _BOOL4 v71;
  id v72;
  void *v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v74 = a1;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v89, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v84;
    v6 = *MEMORY[0x1E0D1CA58];
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v84 != v5)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v7);
      objc_msgSend(v8, "type");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", v6);

      if (v10)
        break;
      if (v4 == ++v7)
      {
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v89, 16);
        if (!v4)
          goto LABEL_65;
        goto LABEL_3;
      }
    }
    objc_msgSend(v74, "givenName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      v71 = 0;
    }
    else
    {
      objc_msgSend(v74, "familyName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "length"))
      {
        v71 = 0;
      }
      else
      {
        objc_msgSend(v74, "nickname");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend(v13, "length") == 0;

      }
    }

    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    objc_msgSend(v8, "subResults");
    v70 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
    v15 = v74;
    if (v14)
    {
      v16 = v14;
      v17 = *(_QWORD *)v80;
      v68 = *MEMORY[0x1E0D1CB00];
      v69 = *MEMORY[0x1E0D1CA48];
      v66 = *MEMORY[0x1E0D1CA70];
      v67 = *(_QWORD *)v80;
      do
      {
        v18 = 0;
        v63 = v16;
        do
        {
          if (*(_QWORD *)v80 != v17)
            objc_enumerationMutation(v70);
          v19 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v18);
          objc_msgSend(v19, "type");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "organizationName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v21, "length"))
          {
            v22 = v20;

          }
          else
          {
            v22 = v20;
            v23 = objc_msgSend(v20, "isEqualToString:", v69);

            if (v23)
            {
              objc_msgSend(v19, "matchedString");
              v24 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setOrganizationName:", v24);
LABEL_33:
              v29 = v22;
              goto LABEL_61;
            }
          }
          objc_msgSend(v15, "departmentName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v25, "length"))
          {

          }
          else
          {
            v26 = objc_msgSend(v22, "isEqualToString:", CFSTR("DepartmentName"));

            if (v26)
            {
              objc_msgSend(v19, "matchedString");
              v24 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setDepartmentName:", v24);
              goto LABEL_33;
            }
          }
          objc_msgSend(v15, "jobTitle");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v27, "length"))
          {

          }
          else
          {
            v28 = objc_msgSend(v22, "isEqualToString:", v68);

            if (v28)
            {
              objc_msgSend(v19, "matchedString");
              v24 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setJobTitle:", v24);
              goto LABEL_33;
            }
          }
          v29 = v22;
          if (!v71)
            goto LABEL_62;
          if (objc_msgSend(v22, "isEqualToString:", CFSTR("NLPContactName")))
          {
            v24 = objc_alloc_init(MEMORY[0x1E0CB3858]);
            objc_msgSend(v19, "matchedString");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "personNameComponentsFromString:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v31, "givenName");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
            v33 = v18;
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "capitalizedStringWithLocale:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "setGivenName:", v35);

            objc_msgSend(v31, "middleName");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "setMiddleName:", v36);

            objc_msgSend(v31, "familyName");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v74;
            objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "capitalizedStringWithLocale:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "setFamilyName:", v39);

            v17 = v67;
            v18 = v33;

            objc_msgSend(v31, "namePrefix");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "setNamePrefix:", v40);

            objc_msgSend(v31, "nameSuffix");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "setNameSuffix:", v41);

            goto LABEL_61;
          }
          if (!objc_msgSend(v22, "isEqualToString:", v66))
            goto LABEL_62;
          v65 = v18;
          v77 = 0u;
          v78 = 0u;
          v75 = 0u;
          v76 = 0u;
          objc_msgSend(v19, "subResults");
          v24 = (id)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
          if (!v42)
            goto LABEL_61;
          v43 = v42;
          v64 = v22;
          v44 = *(_QWORD *)v76;
          v45 = 0x1E0C99000uLL;
          do
          {
            v46 = 0;
            do
            {
              if (*(_QWORD *)v76 != v44)
                objc_enumerationMutation(v24);
              v47 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v46);
              objc_msgSend(v47, "type");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "matchedString");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v48, "isEqualToString:", CFSTR("FirstName")))
              {
                objc_msgSend(*(id *)(v45 + 3528), "currentLocale");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "capitalizedStringWithLocale:", v50);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "setGivenName:", v51);
LABEL_45:

                goto LABEL_48;
              }
              if (objc_msgSend(v48, "isEqualToString:", CFSTR("MiddleName")))
              {
                objc_msgSend(v74, "setMiddleName:", v49);
              }
              else
              {
                if (objc_msgSend(v48, "isEqualToString:", CFSTR("LastName")))
                {
                  objc_msgSend(*(id *)(v45 + 3528), "currentLocale");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "capitalizedStringWithLocale:", v50);
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "setFamilyName:", v51);
                  goto LABEL_45;
                }
                if (objc_msgSend(v48, "isEqualToString:", CFSTR("Title")))
                {
                  objc_msgSend(v74, "setNamePrefix:", v49);
                }
                else if (objc_msgSend(v48, "isEqualToString:", CFSTR("NameSuffix")))
                {
                  objc_msgSend(v74, "setNameSuffix:", v49);
                }
                else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("AddressBookContactName")) & 1) != 0
                       || objc_msgSend(v48, "isEqualToString:", CFSTR("NLPContactName")))
                {
                  v72 = objc_alloc_init(MEMORY[0x1E0CB3858]);
                  objc_msgSend(v72, "personNameComponentsFromString:", v49);
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v73, "givenName");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "capitalizedStringWithLocale:", v53);
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "setGivenName:", v54);

                  objc_msgSend(v73, "middleName");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "setMiddleName:", v55);

                  objc_msgSend(v73, "familyName");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v56, "capitalizedStringWithLocale:", v57);
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "setFamilyName:", v58);

                  objc_msgSend(v73, "namePrefix");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "setNamePrefix:", v59);

                  objc_msgSend(v73, "nameSuffix");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "setNameSuffix:", v60);

                  v45 = 0x1E0C99000;
                }
              }
LABEL_48:

              ++v46;
            }
            while (v43 != v46);
            v61 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
            v43 = v61;
          }
          while (v61);
          v16 = v63;
          v29 = v64;
          v17 = v67;
          v18 = v65;
          v15 = v74;
LABEL_61:

LABEL_62:
          ++v18;
        }
        while (v18 != v16);
        v16 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
      }
      while (v16);
    }

  }
LABEL_65:

}

uint64_t DDPersonActionsSupportedSchemes()
{
  return objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E426B378);
}

id DDContactFromResult(uint64_t a1, void *a2, void *a3, BOOL *a4)
{
  void *v6;
  const __CFString *Type;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  int Category;
  void *v15;
  id v16;
  char v17;
  char v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  uint64_t v30;
  id v31;
  double v32;
  double Helper_x8__OBJC_CLASS___CNContactContentViewController;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  CFTypeRef *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  BOOL *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id obj;
  void *v64;
  id v65;
  id v66;
  id v67;
  uint64_t v68;
  id v69;
  unint64_t v70;
  _QWORD v71[5];
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[5];
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  CFTypeRef cf;
  CFTypeRef *p_cf;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  void *v99;
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;

  v54 = a4;
  v102 = *MEMORY[0x1E0C80C00];
  v70 = a2;
  v55 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E426B378);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1 | v70)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a1)
    {
      Type = (const __CFString *)DDResultGetType();
      if (CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E0D1CB58], 0))
      {
        objc_msgSend(v6, "addObject:", a1);
        if (v55)
        {
          v95 = 0u;
          v96 = 0u;
          v93 = 0u;
          v94 = 0u;
          v8 = v55;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v93, v101, 16);
          if (v9)
          {
            v10 = *(_QWORD *)v94;
            do
            {
              for (i = 0; i != v9; ++i)
              {
                if (*(_QWORD *)v94 != v10)
                  objc_enumerationMutation(v8);
                objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * i), "coreResult", v54));
              }
              v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v93, v101, 16);
            }
            while (v9);
          }

        }
      }
      else
      {
        objc_msgSend(v6, "addObjectsFromArray:", DDResultGetSubResults());
      }
    }
    if (v70)
      objc_msgSend(v6, "addObject:", v70);
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    obj = v6;
    v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v100, 16);
    if (v68)
    {
      v65 = *(id *)v90;
      do
      {
        v12 = 0;
        do
        {
          if (*(id *)v90 != v65)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v12);
          if (v13 == (void *)v70)
            goto LABEL_26;
          Category = DDResultGetCategory();
          if ((Category - 1) >= 2)
          {
            if (Category != 3)
              goto LABEL_47;
            v19 = objc_alloc_init(MEMORY[0x1E0C97378]);
            DDResultGetSubresultWithType();
            objc_msgSend(v19, "setStreet:", DDResultGetMatchedString());
            objc_msgSend(v19, "street");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v27 == 0;

            if (v28)
            {
              DDResultGetSubresultWithType();
              objc_msgSend(v19, "setStreet:", DDResultGetMatchedString());
            }
            DDResultGetSubresultWithType();
            objc_msgSend(v19, "setCity:", DDResultGetMatchedString());
            DDResultGetSubresultWithType();
            objc_msgSend(v19, "setState:", DDResultGetMatchedString());
            DDResultGetSubresultWithType();
            objc_msgSend(v19, "setPostalCode:", DDResultGetMatchedString());
            DDResultGetSubresultWithType();
            objc_msgSend(v19, "setCountry:", DDResultGetMatchedString());
            objc_msgSend(v19, "setISOCountryCode:", DDResultGetCountryCode());
            objc_msgSend(v59, "addObject:", v19);
            v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97338]), "initWithLabel:value:", 0, v19);
            objc_msgSend(v60, "addObject:", v29);

            goto LABEL_46;
          }
          if (!v13)
          {
LABEL_26:
            v18 = 1;
          }
          else
          {
            v15 = (void *)DDResultCopyExtractedURLWithOptions();
            if (v15)
            {
              v16 = v15;
              v17 = 0;
              v18 = 0;
              v19 = v16;
              goto LABEL_29;
            }
            v18 = 0;
          }
          objc_msgSend((id)v70, "absoluteString", v54);
          v19 = (id)objc_claimAutoreleasedReturnValue();
          v16 = 0;
          if (v19)
          {
            v17 = 1;
LABEL_29:
            cf = 0;
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v19, v54);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "dd_emailFromValidSchemes:", v64);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "dd_userFriendlyEmail");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22 && (objc_msgSend(v62, "containsObject:", v22) & 1) == 0)
            {
              objc_msgSend(v62, "addObject:", v22);
              if ((v18 & 1) == 0)
                DDResultCopyMailValue();
              v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97338]), "initWithLabel:value:", cf, v22);
              objc_msgSend(v58, "addObject:", v23);

            }
            objc_msgSend(v20, "dd_phoneNumberFromValidSchemes:", v64);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24 && (objc_msgSend(v61, "containsObject:", v24) & 1) == 0)
            {
              objc_msgSend(v61, "addObject:", v24);
              v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97398]), "initWithStringValue:", v24);
              objc_msgSend(v56, "addObject:", v25);
              if ((v18 & 1) == 0)
                DDResultCopyPhoneValue();
              v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97338]), "initWithLabel:value:", cf, v25);
              objc_msgSend(v57, "addObject:", v26);

            }
            if ((v17 & 1) == 0)
              CFRelease(v16);
            goto LABEL_46;
          }
          v19 = 0;
LABEL_46:

LABEL_47:
          ++v12;
        }
        while (v68 != v12);
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v100, 16);
        v68 = v30;
      }
      while (v30);
    }

  }
  cf = 0;
  p_cf = &cf;
  v85 = 0x3032000000;
  v86 = __Block_byref_object_copy__2;
  v87 = __Block_byref_object_dispose__2;
  v88 = 0;
  if ((dd_isDeviceLocked() & 1) == 0
    && objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) == 3)
  {
    v69 = objc_alloc_init(MEMORY[0x1E0C97298]);
    v31 = objc_alloc(MEMORY[0x1E0C97210]);
    Helper_x8__OBJC_CLASS___CNContactContentViewController = gotLoadHelper_x8__OBJC_CLASS___CNContactContentViewController(v32);
    objc_msgSend(*(id *)(v34 + 1192), "descriptorForRequiredKeys", Helper_x8__OBJC_CLASS___CNContactContentViewController);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v99, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v31, "initWithKeysToFetch:", v36);

    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v66 = v56;
    v38 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v79, v98, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v80;
      v40 = MEMORY[0x1E0C809B0];
      do
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v80 != v39)
            objc_enumerationMutation(v66);
          objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * j), v54);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setPredicate:", v42);

          v77[4] = &cf;
          v78 = 0;
          v77[0] = v40;
          v77[1] = 3221225472;
          v77[2] = __DDContactFromResult_block_invoke;
          v77[3] = &unk_1E42588C8;
          objc_msgSend(v69, "enumerateContactsWithFetchRequest:error:usingBlock:", v37, &v78, v77);
        }
        v38 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v79, v98, 16);
      }
      while (v38);
    }

    if (!p_cf[5])
    {
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v67 = v62;
      v43 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v73, v97, 16);
      if (v43)
      {
        v44 = *(_QWORD *)v74;
        v45 = MEMORY[0x1E0C809B0];
        do
        {
          for (k = 0; k != v43; ++k)
          {
            if (*(_QWORD *)v74 != v44)
              objc_enumerationMutation(v67);
            objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * k), v54);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setPredicate:", v47);

            v71[4] = &cf;
            v72 = 0;
            v71[0] = v45;
            v71[1] = 3221225472;
            v71[2] = __DDContactFromResult_block_invoke_2;
            v71[3] = &unk_1E42588C8;
            objc_msgSend(v69, "enumerateContactsWithFetchRequest:error:usingBlock:", v37, &v72, v71);
          }
          v43 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v73, v97, 16);
        }
        while (v43);
      }

    }
  }
  v48 = p_cf;
  if (v54)
    *v54 = p_cf[5] != 0;
  v49 = (void *)v48[5];
  if (!v49)
  {
    v50 = objc_alloc_init(MEMORY[0x1E0C97360]);
    objc_msgSend(v50, "setPhoneNumbers:", v57);
    objc_msgSend(v50, "setEmailAddresses:", v58);
    objc_msgSend(v50, "setPostalAddresses:", v60);
    _DDFillContactWithGroupResult(v50, v55);
    v51 = (void *)p_cf[5];
    p_cf[5] = v50;

    v49 = (void *)p_cf[5];
  }
  v52 = v49;
  _Block_object_dispose(&cf, 8);

  return v52;
}

void sub_19EFE38F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  _Block_object_dispose(&a57, 8);
  _Unwind_Resume(a1);
}

CFTypeRef specialCaseResultForResult(uint64_t a1)
{
  void *v1;
  int v2;
  uint64_t Copy;
  const void *v4;

  if (!a1)
    return 0;
  if (!DDResultHasType())
    return 0;
  if (!DDResultGetSubresultWithType())
    return 0;
  objc_msgSend((id)DDResultGetMatchedString(), "lowercaseString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hasPrefix:", CFSTR("pounds"));

  if (!v2)
    return 0;
  Copy = DDResultCreateCopy();
  if (!Copy)
    return 0;
  v4 = (const void *)Copy;
  DDResultSetType();
  DDResultGetQueryRange();
  DDResultCreate();
  DDResultSetMatchedString();
  DDResultAddSubresult();
  return CFAutorelease(v4);
}

id DDMapsGetBestAddressForResults(void *a1, int a2)
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t i;
  void *v20;
  uint64_t Type;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v64;
  id v65;
  void *v66;
  id obj;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v2 = a1;
  v65 = objc_alloc_init(MEMORY[0x1E0C97378]);
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v3 = v2;
  v53 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
  v4 = 0;
  if (v53)
  {
    v5 = *(_QWORD *)v69;
    v6 = *MEMORY[0x1E0D1CAC8];
    v61 = *MEMORY[0x1E0D1CA40];
    v58 = *MEMORY[0x1E0D1CBC8];
    v54 = *MEMORY[0x1E0D1CB60];
    v50 = *MEMORY[0x1E0D1CA88];
    v7 = (id *)&dlopenHelperFlag_CoreParsec;
    v60 = *MEMORY[0x1E0D1CB68];
    v55 = *MEMORY[0x1E0D1CB30];
    v48 = *(_QWORD *)v69;
    v49 = v3;
    v47 = *MEMORY[0x1E0D1CAC8];
    do
    {
      v8 = 0;
      do
      {
        v59 = v4;
        if (*(_QWORD *)v69 != v5)
          objc_enumerationMutation(v3);
        v56 = v8;
        v9 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v8);
        objc_msgSend(v9, "type", v46);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v6);

        if (v11)
        {
          v12 = v4;
          if (v4)
          {
            objc_msgSend(v4, "coreResult");
            objc_msgSend(v9, "coreResult");
            if (!DDAddressResultCanBeMergedWith())
              goto LABEL_51;
          }
          else
          {
            v12 = v9;
          }
          v52 = v12;
          v13 = v9;
          v65 = v65;
          v14 = objc_alloc_init(MEMORY[0x1E0C97378]);
          v72 = 0u;
          v73 = 0u;
          v74 = 0u;
          v75 = 0u;
          v51 = v13;
          objc_msgSend(v13, "subResults");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
          if (v15)
          {
            v16 = v15;
            v62 = 0;
            v66 = 0;
            v17 = *(_QWORD *)v73;
            v18 = &dlopenHelperFlag_CoreParsec;
            v64 = *(_QWORD *)v73;
            while (2)
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v73 != v17)
                  objc_enumerationMutation(obj);
                v20 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
                objc_msgSend(v20, "coreResult", v46);
                if (v18[366] != -1)
                  dispatch_once(&_CNPropertyNameForResult_sOnce, &__block_literal_global_6);
                Type = DDResultGetType();
                objc_msgSend(v7[365], "objectForKeyedSubscript:", Type);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = v22;
                if (v22)
                {
                  if (objc_msgSend(v22, "length"))
                  {
                    objc_msgSend(v65, "valueForKey:", v23);
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    v25 = objc_msgSend(v24, "length");

                    if (v25)
                    {

                      v38 = 0;
                      goto LABEL_48;
                    }
                    if (!v66)
                    {
                      objc_msgSend(v20, "valueForKeyPath:", CFSTR("Location.value"));
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    objc_msgSend(v20, "type");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "valueForKeyPath:", CFSTR("CountryCode.value"));
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v27, "length"))
                    {
                      v28 = v26;
                      if ((objc_msgSend(v28, "isEqualToString:", v61) & 1) != 0)
                      {
                        v29 = 4;
                      }
                      else if ((objc_msgSend(v28, "isEqualToString:", v58) & 1) != 0)
                      {
                        v29 = 6;
                      }
                      else if ((objc_msgSend(v28, "isEqualToString:", v54) & 1) != 0)
                      {
                        v29 = 8;
                      }
                      else
                      {
                        v29 = objc_msgSend(v28, "isEqualToString:", v50) ? 10 : 2;
                      }

                      if (v29 > v62)
                      {
                        objc_msgSend(v14, "setISOCountryCode:", v27);
                        v62 = v29;
                      }
                    }
                    objc_msgSend(v20, "matchedString");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    if (a2 && objc_msgSend(v26, "isEqualToString:", v60))
                    {
                      objc_msgSend(v20, "valueForKey:", v55);
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v31)
                      {
                        v32 = objc_msgSend(v20, "range");
                        v33 = objc_msgSend(v31, "range");
                        v57 = v34;
                        v35 = v33 - v32;
                        v36 = (void *)objc_msgSend(v30, "mutableCopy");
                        v37 = v35;
                        v18 = (_QWORD *)&dlopenHelperFlag_CoreParsec;
                        objc_msgSend(v36, "replaceCharactersInRange:withString:", v37, v57, &stru_1E4259460);

                        v30 = v36;
                      }

                    }
                    objc_msgSend(v14, "setValue:forKey:", v30, v23);

                    v7 = (id *)&dlopenHelperFlag_CoreParsec;
                    v17 = v64;
                  }
                }
                else
                {
                  v46 = Type;
                  DDLog();
                }

              }
              v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
              if (v16)
                continue;
              break;
            }
          }
          else
          {
            v66 = 0;
          }

          v38 = v14;
LABEL_48:

          v5 = v48;
          v3 = v49;
          v4 = v52;
          v6 = v47;
          if (v38)
          {
            objc_msgSend(v65, "dictionaryRepresentation");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = (void *)objc_msgSend(v39, "mutableCopy");

            objc_msgSend(v38, "dictionaryRepresentation");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "addEntriesFromDictionary:", v41);

            objc_msgSend(MEMORY[0x1E0C97378], "postalAddressWithDictionaryRepresentation:", v40);
            v42 = objc_claimAutoreleasedReturnValue();

            v65 = (id)v42;
          }

          if (v59)
            goto LABEL_53;
        }
LABEL_51:
        v8 = v56 + 1;
      }
      while (v56 + 1 != v53);
      v53 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
    }
    while (v53);
  }
LABEL_53:

  objc_msgSend(v65, "ISOCountryCode");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v43)
  {
    v43 = (void *)CPPhoneNumberCopyNetworkCountryCode();
    if (!v43)
      v43 = (void *)CPPhoneNumberCopyHomeCountryCode();
    if ((a2 & 1) == 0 && v43)
      objc_msgSend(v65, "setISOCountryCode:", v43);
  }
  v44 = v65;

  return v44;
}

id DDMapURLForResult(void *a1)
{
  void *v2;
  double v3;
  double Helper_x8__OBJC_CLASS____GEOMapURLBuilder;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  char v12;

  _addressStringForResult(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    Helper_x8__OBJC_CLASS____GEOMapURLBuilder = gotLoadHelper_x8__OBJC_CLASS____GEOMapURLBuilder(v3);
    objc_msgSend(*(id *)(v5 + 1872), "URLForAddress:", v2, Helper_x8__OBJC_CLASS____GEOMapURLBuilder);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (!a1 || DDResultGetCategory() != 1)
  {
LABEL_10:
    v6 = 0;
    goto LABEL_11;
  }
  v7 = (void *)DDResultCopyExtractedURL();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {

    goto LABEL_10;
  }
  v9 = v8;
  v12 = 0;
  if (!objc_msgSend(v8, "dd_isMaps:isDirections:", 1, &v12) || v12)
  {
    DDMapURLForURL(v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v9;
  }
  v6 = v10;

LABEL_11:
  return v6;
}

id _addressStringForResult(void *a1)
{
  const __CFString *Type;
  CFComparisonResult v2;

  if (a1)
  {
    Type = (const __CFString *)DDResultGetType();
    v2 = CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E0D1CAC8], 0);
    a1 = 0;
    if (v2 == kCFCompareEqualTo)
    {
      DDResultGetMatchedString();
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return a1;
}

id DDMapURLForURL(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "scheme");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lowercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "isEqualToString:", CFSTR("geo"));

    if ((_DWORD)v5)
    {
      DDMapAddressFromURL(v2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      DDMapURLForString(v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
      v9 = v8;
LABEL_23:

      goto LABEL_24;
    }
    gotLoadHelper_x8__OBJC_CLASS____GEOMapURLParser(v6);
    v7 = (void *)objc_msgSend(objc_alloc(*(Class *)(v10 + 1880)), "initWithURL:", v2);
    objc_msgSend(v7, "parseIncludingCustomParameters:", 0);
    objc_msgSend(v7, "searchQuery");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 || (objc_msgSend(v7, "addressString"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v7, "directionsSourceAddressString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        objc_msgSend(v7, "directionsDestinationAddressString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {

          if (v16)
            goto LABEL_13;
        }
        else
        {

          if (v16)
            goto LABEL_13;
        }
        v8 = v2;
        goto LABEL_4;
      }

      if (v11)
        v13 = v11;
      else
        v13 = v5;

    }
LABEL_13:
    objc_msgSend(v7, "searchQuery");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
      goto LABEL_20;
    objc_msgSend(v7, "addressString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v15, "length"))
    {
      objc_msgSend(v7, "directionsDestinationAddressString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "length"))
      {
LABEL_20:
        if (objc_msgSend(v14, "length"))
        {
          DDMapURLForString(v14);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {

          v9 = 0;
        }
        goto LABEL_23;
      }
      objc_msgSend(v7, "directionsSourceAddressString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v14 = v15;
    goto LABEL_20;
  }
  v9 = 0;
LABEL_24:

  return v9;
}

id DDMapsURLForUrlAndResult(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a1;
  v4 = v3;
  if (!v3 && a2)
  {
    DDMapURLForResult(a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v4 = v4;
    v5 = v4;
    goto LABEL_8;
  }
  if (!v3)
    goto LABEL_7;
  if (!objc_msgSend(v3, "dd_isMaps:", 1))
  {
    v5 = 0;
    goto LABEL_8;
  }
  v5 = 0;
  if (DDExtractMapLocationInformationFromURL(v4, 0, 0))
    goto LABEL_7;
LABEL_8:

  return v5;
}

BOOL DDExtractMapLocationInformationFromURL(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a1;
  objc_msgSend(v5, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("geo"));

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB39D8];
    DDMapAddressFromURL(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "queryItemWithName:value:", CFSTR("ll"), v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = 0;
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "dd_isMaps:", 1))
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v5, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "queryItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("name == %@"), CFSTR("ll"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "filteredArrayUsingPredicate:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("name == %@"), CFSTR("q"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "filteredArrayUsingPredicate:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v12 = objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("name == %@"), CFSTR("address"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "filteredArrayUsingPredicate:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstObject");
      v12 = objc_claimAutoreleasedReturnValue();

    }
LABEL_7:

    if (!a2)
      goto LABEL_9;
    goto LABEL_8;
  }
  v12 = 0;
  v11 = 0;
  if (a2)
LABEL_8:
    *a2 = objc_retainAutorelease((id)v11);
LABEL_9:
  if (a3)
    *a3 = objc_retainAutorelease((id)v12);

  return (v11 | v12) != 0;
}

id DDMapURLForString(void *a1)
{
  id v1;
  void *v2;
  double v3;
  double Helper_x8__OBJC_CLASS____GEOMapURLBuilder;
  uint64_t v5;
  void *v6;

  v1 = a1;
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("(\\s|\\n)+"), CFSTR(" "), 1024, 0, objc_msgSend(v1, "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "length"))
  {
    Helper_x8__OBJC_CLASS____GEOMapURLBuilder = gotLoadHelper_x8__OBJC_CLASS____GEOMapURLBuilder(v3);
    objc_msgSend(*(id *)(v5 + 1872), "URLForAddress:", v2, Helper_x8__OBJC_CLASS____GEOMapURLBuilder);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id DDDirectionsURLForResult(void *a1)
{
  void *v2;
  double v3;
  double Helper_x8__OBJC_CLASS____GEOMapURLBuilder;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  char v12;

  _addressStringForResult(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    Helper_x8__OBJC_CLASS____GEOMapURLBuilder = gotLoadHelper_x8__OBJC_CLASS____GEOMapURLBuilder(v3);
    objc_msgSend(*(id *)(v5 + 1872), "URLForDirectionsFromHereTo:", v2, Helper_x8__OBJC_CLASS____GEOMapURLBuilder);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (!a1 || DDResultGetCategory() != 1)
  {
LABEL_10:
    v6 = 0;
    goto LABEL_11;
  }
  v7 = (void *)DDResultCopyExtractedURL();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {

    goto LABEL_10;
  }
  v9 = v8;
  v12 = 0;
  if (objc_msgSend(v8, "dd_isMaps:isDirections:", 1, &v12) && v12)
  {
    v10 = v9;
  }
  else
  {
    DDMapURLForURL(v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v10;

LABEL_11:
  return v6;
}

id DDDirectionsURLForString(void *a1)
{
  id v1;
  void *v2;
  double v3;
  double Helper_x8__OBJC_CLASS____GEOMapURLBuilder;
  uint64_t v5;
  void *v6;

  v1 = a1;
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("(\\s|\\n)+"), CFSTR(" "), 1024, 0, objc_msgSend(v1, "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "length"))
  {
    Helper_x8__OBJC_CLASS____GEOMapURLBuilder = gotLoadHelper_x8__OBJC_CLASS____GEOMapURLBuilder(v3);
    objc_msgSend(*(id *)(v5 + 1872), "URLForDirectionsFromHereTo:", v2, Helper_x8__OBJC_CLASS____GEOMapURLBuilder);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id DDMapAddressFromURL(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v24;
  id v25;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "scheme");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lowercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("geo"));

    if (!v5)
    {
      gotLoadHelper_x8__OBJC_CLASS____GEOMapURLParser(v6);
      v7 = (void *)objc_msgSend(objc_alloc(*(Class *)(v12 + 1880)), "initWithURL:", v2);
      objc_msgSend(v7, "parseIncludingCustomParameters:", 0);
      objc_msgSend(v7, "addressString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "length"))
      {
        objc_msgSend(v7, "directionsDestinationAddressString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "length"))
        {
          v11 = v13;
        }
        else
        {
          objc_msgSend(v7, "searchQuery");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      if (objc_msgSend(v11, "length"))
        goto LABEL_24;
      v24 = 0;
      v25 = 0;
      v14 = DDExtractMapLocationInformationFromURL(v2, &v25, &v24);
      v10 = v25;
      v15 = v24;
      v16 = v15;
      if (v14)
      {
        objc_msgSend(v15, "value");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "length");

        v19 = v16;
        if (v18
          || (objc_msgSend(v10, "value"),
              v20 = (void *)objc_claimAutoreleasedReturnValue(),
              v21 = objc_msgSend(v20, "length"),
              v20,
              v19 = v10,
              v21))
        {
          objc_msgSend(v19, "value");
          v22 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v22;
        }
      }

      goto LABEL_23;
    }
    objc_msgSend(v2, "resourceSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "hasPrefix:", CFSTR("//")))
    {
      if ((unint64_t)objc_msgSend(v7, "length") < 3)
        goto LABEL_15;
      objc_msgSend(v7, "substringFromIndex:", 2);
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    if (objc_msgSend(v7, "hasPrefix:", CFSTR("?")))
    {
      if ((unint64_t)objc_msgSend(v7, "length") < 2)
        goto LABEL_15;
      objc_msgSend(v7, "substringFromIndex:", 1);
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v9;
    }
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(";"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:

      goto LABEL_24;
    }
LABEL_15:
    v11 = 0;
LABEL_24:

    goto LABEL_25;
  }
  v11 = 0;
LABEL_25:

  return v11;
}

id DDDirectionsURLForURL(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  double v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "scheme");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lowercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("geo"));

    if (v5)
    {
      DDMapAddressFromURL(v2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      DDDirectionsURLForString(v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
      v9 = v8;
LABEL_18:

      goto LABEL_19;
    }
    gotLoadHelper_x8__OBJC_CLASS____GEOMapURLParser(v6);
    v7 = (void *)objc_msgSend(objc_alloc(*(Class *)(v10 + 1880)), "initWithURL:", v2);
    objc_msgSend(v7, "parseIncludingCustomParameters:", 0);
    objc_msgSend(v7, "searchQuery");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 || (objc_msgSend(v7, "addressString"), (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

      goto LABEL_9;
    }
    objc_msgSend(v7, "directionsSourceAddressString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {

    }
    else
    {
      objc_msgSend(v7, "directionsDestinationAddressString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
LABEL_9:
        objc_msgSend(v7, "directionsDestinationAddressString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "length"))
          goto LABEL_15;
        objc_msgSend(v7, "addressString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v13, "length"))
        {
          objc_msgSend(v7, "directionsSourceAddressString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v12, "length"))
          {
LABEL_15:
            if (objc_msgSend(v12, "length"))
            {
              DDDirectionsURLForString(v12);
              v9 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {

              v9 = 0;
            }
            goto LABEL_18;
          }
          objc_msgSend(v7, "centerCoordinate");
          if (v17 == -180.0 || (objc_msgSend(v7, "centerCoordinate"), v18 == -180.0))
          {
            objc_msgSend(v7, "searchQuery");
            v23 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v19 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v7, "centerCoordinate");
            v21 = v20;
            objc_msgSend(v7, "centerCoordinate");
            objc_msgSend(v19, "stringWithFormat:", CFSTR("%f,%f"), v21, v22);
            v23 = objc_claimAutoreleasedReturnValue();
          }
          v13 = (void *)v23;

        }
        v12 = v13;
        goto LABEL_15;
      }
    }
    v8 = v2;
    goto LABEL_4;
  }
  v9 = 0;
LABEL_19:

  return v9;
}

void *DDCreateUpdatedResultWithContext(void *Copy, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t Range;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFArray *SubResults;
  const __CFArray *v15;
  CFIndex Count;
  CFIndex v17;
  CFIndex i;
  uint64_t MatchedString;
  uint64_t v20;
  CFStringRef v21;
  CFStringRef v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (Copy)
  {
    if (DDResultHasType())
    {
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v4 = copyAssociatedResultsFromResultWithContext(Copy, v3, 0);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v25;
        while (2)
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v25 != v7)
              objc_enumerationMutation(v4);
            if (DDResultHasType())
            {
              Range = DDResultGetRange();
              v11 = v10;
              v12 = DDResultGetRange();
              if ((unint64_t)(v12 - (Range + v11)) < 0x32 || (unint64_t)(Range - v12 + v13) <= 0x31)
              {
                if (DDAddressResultCanBeMergedWith())
                {
                  Copy = (void *)DDResultCreateCopy();
                  if (Copy)
                  {
                    SubResults = (const __CFArray *)DDResultGetSubResults();
                    if (SubResults)
                    {
                      v15 = SubResults;
                      Count = CFArrayGetCount(SubResults);
                      if (Count >= 1)
                      {
                        v17 = Count;
                        for (i = 0; i != v17; ++i)
                        {
                          CFArrayGetValueAtIndex(v15, i);
                          DDResultAddSubresultSorted();
                        }
                      }
                      MatchedString = DDResultGetMatchedString();
                      v20 = DDResultGetMatchedString();
                      v21 = CFStringCreateWithFormat(0, 0, CFSTR("%@, %@"), MatchedString, v20, (_QWORD)v24);
                      if (v21)
                      {
                        v22 = v21;
                        DDResultSetMatchedString();
                        CFRelease(v22);
                      }
                      goto LABEL_24;
                    }
                    CFRelease(Copy);
                  }
                }
              }
            }
            ++v8;
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v6)
            continue;
          break;
        }
      }
      Copy = 0;
LABEL_24:

    }
    else
    {
      Copy = 0;
    }
  }

  return Copy;
}

void *copyAssociatedResultsFromResultWithContext(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t RangeForURLification;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("GroupAllResultsKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      if (objc_msgSend(v7, "count"))
      {
        objc_msgSend(v8, "sortedArrayUsingFunction:context:", _DDScannerResultProximitySort, a1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!a3)
        {
LABEL_6:
          a1 = copyCoreResultsArray(v9);

          goto LABEL_22;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D1CE68], "resultFromCoreResult:", a1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!a3)
          goto LABEL_6;
      }
      *a3 = objc_retainAutorelease(v9);
      goto LABEL_6;
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("AllResults"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("TextStorage"));
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v10 = (void *)v16;
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "bundleIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.MobileSMS")))
          v19 = 2000;
        else
          v19 = 50;

        RangeForURLification = DDResultGetRangeForURLification();
        v22 = v21;
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ReferenceDate"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        findNearbyResultsInTextStorage(v10, RangeForURLification, v22, v19, 4 * v19, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        a1 = (void *)CFRetain(v24);

LABEL_21:
        goto LABEL_22;
      }
      v28 = a1;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        a1 = 0;
        goto LABEL_22;
      }
    }
    v11 = objc_msgSend(v10, "count");
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      while (1)
      {
        objc_msgSend(v10, "objectAtIndex:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 == a1)
          break;
        if (v12 == ++v13)
          goto LABEL_12;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ReferenceDate"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      findNearbyResultsInArray(v10, v13, 50, 200, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = (void *)CFRetain(v26);

    }
    else
    {
LABEL_12:
      a1 = 0;
    }
    goto LABEL_21;
  }
LABEL_22:

  return a1;
}

uint64_t DDUIRecordOtherActionInSheetForResultIfNeeded(uint64_t result)
{
  uint64_t v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double Helper_x8__OBJC_CLASS___SGNLEventSuggestionsMetrics;
  uint64_t v12;
  int v13;

  if (result)
  {
    result = DDResultGetCategory();
    v13 = 0;
    if ((_DWORD)result == 4)
    {
      result = DDTrackEventCreationInHostApplication(&v13);
      if ((_DWORD)result)
      {
        if (v13 == 1)
          v1 = 2;
        else
          v1 = 3;
        v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
        if (v2)
          DDUIRecordOtherActionInSheetForResultIfNeeded_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
        Helper_x8__OBJC_CLASS___SGNLEventSuggestionsMetrics = gotLoadHelper_x8__OBJC_CLASS___SGNLEventSuggestionsMetrics(v10);
        return objc_msgSend(*(id *)(v12 + 2232), "recordUserInteraction:withLinkInApplication:eventPrefillMode:eventTypeClassification:proposedEvent:confirmedEvent:", 2, v1, 0, 0, 0, 0, Helper_x8__OBJC_CLASS___SGNLEventSuggestionsMetrics);
      }
    }
  }
  return result;
}

void *copyCoreResultsArray(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (v1)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v1, "count"));
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = v1;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(v2, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "coreResult", (_QWORD)v9));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_19EFEA238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  _Block_object_dispose(&a42, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_19EFECDFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EFEDE14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19EFEE0C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t _DDScannerResultProximitySort(void *a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(a1, "coreResult");
  objc_msgSend(v3, "coreResult");

  return DDResultProximitySort();
}

id OUTLINED_FUNCTION_10_0(id a1)
{
  return a1;
}

id _eventTitleFromCache(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("event"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("icsEvent")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "summary"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id _eventStartDateFromCache(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("event"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("icsEvent"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dtstart");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "components");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "calendar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "dateFromComponents:", v6);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

void sub_19EFF25E4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_19EFF3A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, id *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id *a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  id location;

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19EFF4A10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id DDUIAugmentedContextForEvent(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v27;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (objc_msgSend(v5, "count"))
  {
    _DDUIEventGetComponents(v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v27 = 1;
    if (!v8)
    {
      beginDateOfEventResultsRespectingSpecificEndDates(v5, 1, v6, &v27, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v6, "mutableCopy");
      v13 = v15;
      if (!v14)
      {
        v12 = 0;
        v23 = 0;
        v16 = 0;
        goto LABEL_28;
      }
      objc_msgSend(v15, "setObject:forKey:", v14, CFSTR("EventStartDate"));
      v16 = 0;
      v17 = 0;
      v12 = 0;
LABEL_25:
      v23 = v14;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v27 != 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v24, CFSTR("EventIsAllDay"));

      v14 = (void *)v17;
      if (!v12)
      {
LABEL_28:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v25, CFSTR("PrefillMode"));

        goto LABEL_29;
      }
LABEL_26:
      objc_msgSend(v13, "setObject:forKey:", v12, CFSTR("EventTitle"));
      goto LABEL_28;
    }
    objc_msgSend(v8, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11)
    {
      objc_msgSend(v9, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v9, "startDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v27 = 0;
      objc_msgSend(v9, "startDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "endDate");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
      v17 = 0;
    }
    objc_msgSend(v9, "startDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      objc_msgSend(v9, "duration");
      if (v20 > 0.0)
      {
        if (!v18)
          goto LABEL_17;
        objc_msgSend(v9, "duration");
        objc_msgSend(v14, "dateByAddingTimeInterval:");
        v19 = (void *)v17;
        v17 = objc_claimAutoreleasedReturnValue();
      }
    }

LABEL_17:
    v21 = objc_msgSend(v9, "source") - 1;
    if (v21 > 3)
      v16 = 0;
    else
      v16 = qword_19F006750[v21];
    v22 = (void *)objc_msgSend(v6, "mutableCopy");
    v13 = v22;
    if (v14)
    {
      objc_msgSend(v22, "setObject:forKey:", v14, CFSTR("EventStartDate"));
      if (!v17)
        goto LABEL_25;
    }
    else if (!v17)
    {
      v23 = 0;
      if (!v12)
        goto LABEL_28;
      goto LABEL_26;
    }
    objc_msgSend(v13, "setObject:forKey:", v17, CFSTR("EventEndDate"));
    goto LABEL_25;
  }
  v13 = v6;
LABEL_29:

  return v13;
}

id _DDUIEventGetComponents(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  DDActionSuggestionsContext *v8;
  void *v9;
  DDActionNaturalLanguageContext *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  v8 = objc_alloc_init(DDActionSuggestionsContext);
  objc_msgSend(v6, "objectForKey:", CFSTR("CoreSpotlightUniqueIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDActionSuggestionsContext setCoreSpotlightUniqueIdentifier:](v8, "setCoreSpotlightUniqueIdentifier:", v9);

  -[DDActionSuggestionsContext setBundleIdentifier:](v8, "setBundleIdentifier:", v5);
  v10 = objc_alloc_init(DDActionNaturalLanguageContext);
  objc_msgSend(v6, "objectForKey:", CFSTR("LeadingText"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDActionNaturalLanguageContext setLeadingText:](v10, "setLeadingText:", v11);

  objc_msgSend(v6, "objectForKey:", CFSTR("TrailingText"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDActionNaturalLanguageContext setTrailingText:](v10, "setTrailingText:", v12);

  objc_msgSend(v7, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDActionNaturalLanguageContext setResult:](v10, "setResult:", v13);

  -[DDActionNaturalLanguageContext setAssociatedResults:](v10, "setAssociatedResults:", v7);
  -[DDActionNaturalLanguageContext setBundleIdentifier:](v10, "setBundleIdentifier:", v5);

  objc_msgSend(v7, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[DDEventComponents bestEventComponentsForResult:withNaturalLanguageContext:suggestionsContext:context:](DDEventComponents, "bestEventComponentsForResult:withNaturalLanguageContext:suggestionsContext:context:", v14, v10, v8, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id DDUISuggestedEventForResults(void *a1, void *a2, void *a3, void *a4, uint64_t *a5, _QWORD *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v43;

  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = a4;
  if (objc_msgSend(v12, "count"))
  {
    _DDUIEventGetComponents(v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v16 = 0;
LABEL_39:

      goto LABEL_40;
    }
    v43 = a6;
    objc_msgSend(MEMORY[0x1E0CAA060], "eventWithEventStore:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "title");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      objc_msgSend(v15, "title");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "length");

      if (v20)
      {
        objc_msgSend(v15, "title");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setTitle:", v21);

      }
    }
    objc_msgSend(v15, "notes");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)v22;
      objc_msgSend(v15, "notes");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "length");

      if (v25)
      {
        objc_msgSend(v15, "notes");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setNotes:", v26);

      }
    }
    objc_msgSend(v15, "URL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v15, "URL");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setURL:", v28);

    }
    objc_msgSend(v15, "location");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v15, "location");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setLocation:", v30);

    }
    objc_msgSend(v15, "structuredLocation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(v15, "structuredLocation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setStructuredLocation:", v32);

    }
    objc_msgSend(v15, "startDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v16, "setAllDay:", 0);
      objc_msgSend(v15, "startDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setStartDate:", v34);

      objc_msgSend(v15, "endDate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setEndDate:", v35);

    }
    objc_msgSend(v15, "startDate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v36)
    {
      objc_msgSend(v15, "duration");
      if (v37 > 0.0)
      {
        if ((objc_msgSend(v16, "isAllDay") & 1) != 0)
          goto LABEL_22;
        objc_msgSend(v16, "startDate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "duration");
        objc_msgSend(v36, "dateByAddingTimeInterval:");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setEndDate:", v38);

      }
    }

LABEL_22:
    if (objc_msgSend(v15, "source") == 1)
    {
      v39 = v43;
      if (!a5)
        goto LABEL_37;
      v40 = 2;
    }
    else
    {
      v39 = v43;
      if (objc_msgSend(v15, "source") == 2)
      {
        if (!a5)
          goto LABEL_37;
        v40 = 1;
      }
      else if (objc_msgSend(v15, "source") == 3)
      {
        if (!a5)
          goto LABEL_37;
        v40 = 4;
      }
      else
      {
        v41 = objc_msgSend(v15, "source");
        if (!a5 || v41 != 4)
        {
LABEL_37:
          if (v39)
          {
            objc_msgSend(v15, "eventTypeIdentifier");
            *v39 = (id)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_39;
        }
        v40 = 3;
      }
    }
    *a5 = v40;
    goto LABEL_37;
  }
  v16 = 0;
LABEL_40:

  return v16;
}

id DDUIEventForResults(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  void *v48;
  void *v49;
  const __CFString *Type;
  CFComparisonResult v51;
  void *v52;
  void *v53;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  const __CFString *theString2;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  CFTypeRef v70;
  CFTypeRef cf;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  id v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ICS"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v60)
    goto LABEL_6;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NotificationStyle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "BOOLValue"))
  {

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.BarcodeSupport.BarcodeNotificationService"));

  if (!v11)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CAA060], "eventWithEventStore:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 && objc_msgSend(v6, "count"))
    {
      LOBYTE(cf) = 0;
      v80 = 0;
      beginDateOfEventResultsRespectingSpecificEndDates(v6, 1, v7, &cf, &v80);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v80;
      if (!v16)
      {
        objc_msgSend(v15, "dateByAddingTimeInterval:", 3600.0);
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v14, "setStartDate:", v15);
      objc_msgSend(v14, "setEndDate:", v16);
      objc_msgSend(v14, "setAllDay:", (_BYTE)cf != 0);

    }
    goto LABEL_11;
  }
LABEL_5:
  objc_msgSend(v60, "dataUsingEncoding:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "importICSData:intoCalendar:options:", v12, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_6;
LABEL_11:
  objc_msgSend(v7, "objectForKey:", CFSTR("EventTitle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "title");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "length"))
  {

  }
  else
  {
    v19 = objc_msgSend(v17, "length");

    if (v19)
      objc_msgSend(v14, "setTitle:", v17);
  }
  if (objc_msgSend(v6, "count"))
  {
    v20 = objc_msgSend(v6, "objectAtIndex:", 0);
    objc_msgSend(v6, "sortedArrayUsingFunction:context:", MEMORY[0x1E0D1CD40], v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  v58 = v6;
  objc_msgSend(v14, "URL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = v5;
  v61 = v7;
  v57 = v17;
  if (v22)
  {
    v23 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("SpecialURL"));
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = (void *)v24;
      objc_msgSend(v14, "setURL:", v24);
    }
    else
    {
      v62 = v14;
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v55 = v21;
      v26 = v21;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v76, v83, 16);
      if (v27)
      {
        v28 = v27;
        v25 = 0;
        v29 = *(_QWORD *)v77;
        while (2)
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v77 != v29)
              objc_enumerationMutation(v26);
            if ((DDResultHasType() & 1) != 0 || (DDResultHasType() & 1) != 0 || DDResultHasType())
            {
              v31 = (void *)DDResultCopyExtractedURLWithOptions();
              if (v31)
              {
                objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v31);
                v32 = (void *)objc_claimAutoreleasedReturnValue();

                if (v32)
                {
                  objc_msgSend(v32, "scheme");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "lowercaseString");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();

                  if ((objc_msgSend(v34, "isEqualToString:", CFSTR("http")) & 1) != 0
                    || (objc_msgSend(v34, "isEqualToString:", CFSTR("tel")) & 1) != 0
                    || (objc_msgSend(v34, "isEqualToString:", CFSTR("sip")) & 1) != 0
                    || (objc_msgSend(v34, "hasPrefix:", CFSTR("facetime")) & 1) != 0)
                  {
                    objc_msgSend(v62, "setURL:", v32);

                    v25 = v32;
                    goto LABEL_44;
                  }

                }
              }
              else
              {
                v32 = v25;
              }

              v25 = v32;
            }
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v76, v83, 16);
          if (v28)
            continue;
          break;
        }
      }
      else
      {
        v25 = 0;
      }
LABEL_44:

      v14 = v62;
      v21 = v55;
    }
    objc_msgSend(v14, "URL");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      v23 = 0;
    }
    else
    {
      v63 = v14;
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v36 = v21;
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
      if (v37)
      {
        v38 = v37;
        v56 = v21;
        v39 = *(_QWORD *)v73;
        while (2)
        {
          for (j = 0; j != v38; ++j)
          {
            if (*(_QWORD *)v73 != v39)
              objc_enumerationMutation(v36);
            v23 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * j);
            if (DDResultHasType())
            {
              v70 = 0;
              cf = 0;
              DDResultCopyPhoneValue();
              if (cf)
              {
                if ((objc_msgSend((id)cf, "containsString:", CFSTR(",")) & 1) != 0
                  || objc_msgSend((id)cf, "containsString:", CFSTR(";")))
                {
                  v41 = (void *)DDResultCopyExtractedURLWithOptions();
                  if (v41)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v41);
                    v42 = objc_claimAutoreleasedReturnValue();

                    if (v42)
                    {
                      objc_msgSend(v63, "setURL:", v42);

                      v25 = (void *)v42;
                      goto LABEL_66;
                    }
                    v25 = 0;
                  }

                }
                if (cf)
                  CFRelease(cf);
              }
            }
          }
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
          if (v38)
            continue;
          break;
        }
        v23 = 0;
LABEL_66:
        v21 = v56;
      }
      else
      {
        v23 = 0;
      }

      v14 = v63;
    }

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v43 = v21;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v66, v81, 16);
  if (!v44)
    goto LABEL_85;
  v45 = v44;
  v46 = *(_QWORD *)v67;
  theString2 = (const __CFString *)*MEMORY[0x1E0D1CAC8];
  do
  {
    for (k = 0; k != v45; ++k)
    {
      if (*(_QWORD *)v67 != v46)
        objc_enumerationMutation(v43);
      if (*(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * k) != v23)
      {
        v48 = v14;
        objc_msgSend(v14, "location");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v49, "length"))
        {

        }
        else
        {
          Type = (const __CFString *)DDResultGetType();
          v51 = CFStringCompare(Type, theString2, 0);

          if (v51 == kCFCompareEqualTo)
          {
            v14 = v48;
            objc_msgSend(v48, "setLocation:", DDResultGetMatchedString());
            continue;
          }
        }
        v14 = v48;
        if (DDResultHasType())
        {
          cf = 0;
          DDResultCopyPhoneValue();
          if (cf)
          {
            objc_msgSend(v64, "addObject:");
            CFRelease(cf);
          }
        }
      }
    }
    v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v66, v81, 16);
  }
  while (v45);
LABEL_85:

  objc_msgSend(v61, "objectForKey:", CFSTR("SelectedText"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52)
    objc_msgSend(v64, "addObject:", v52);
  objc_msgSend(v14, "notes");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
LABEL_90:

  }
  else if (objc_msgSend(v64, "count"))
  {
    objc_msgSend(v64, "componentsJoinedByString:", CFSTR("\n"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNotes:", v53);
    goto LABEL_90;
  }

  return v14;
}

BOOL _DDUICalendarIsTitleGenerationUsed(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:", CFSTR("PrefillMode"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue");

  return (unint64_t)(v2 - 3) < 2;
}

void sub_19EFF85FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_19EFF8D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void OUTLINED_FUNCTION_4_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

id linkAncestorOfNode(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (v1)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v1, "parentNode");
      v2 = objc_claimAutoreleasedReturnValue();

      v1 = (id)v2;
    }
    while (v2);
  }
  return v1;
}

void applicationWithBundleIdentifierIsRestricted_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 138412802;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  v7 = 2112;
  v8 = a3;
  _os_log_error_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Application proxy for bundle identifier %@ is nil (errors %@ -- %@).", (uint8_t *)&v3, 0x20u);
}

void DDUILogAssertionFailure_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v1, 0xCu);
}

void DDUILogAssertionFailure_cold_2()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to load CrashReporterSupport framework.", v0, 2u);
}

void DDPhoneLabeledValue_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_1(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "Can't extract phone url value", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void DDPhoneLabeledValue_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_1(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "Can't extract phone string value", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void DDMergeContactIntoContact_cold_1(uint8_t *buf, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_error_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "unknown key: %@", buf, 0xCu);
}

void DDAugmentContactWithResultsFromAction_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_1(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "_augmentRecord called with NULL result, should not happen", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void DDUIRecordOtherActionInSheetForResultIfNeeded_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "Will record user interaction OtherActionInSheet. #DDUINLEventMetrics", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D10](theArray, range.location, range.length, value);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982F0](theSetIdentifier);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1E0C98320](theSet, theChar);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x1E0C98FE8](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFTimeZoneRef CFTimeZoneCopyDefault(void)
{
  return (CFTimeZoneRef)MEMORY[0x1E0C99270]();
}

uint64_t CPPhoneNumberCopyHomeCountryCode()
{
  return MEMORY[0x1E0CFA360]();
}

uint64_t CPPhoneNumberCopyNetworkCountryCode()
{
  return MEMORY[0x1E0CFA370]();
}

uint64_t DDAddressResultCanBeMergedWith()
{
  return MEMORY[0x1E0D1CA20]();
}

uint64_t DDInternalURLStringForResultIdentifier()
{
  return MEMORY[0x1E0D1CBE0]();
}

uint64_t DDLog()
{
  return MEMORY[0x1E0D1CBE8]();
}

uint64_t DDResultAddSubresult()
{
  return MEMORY[0x1E0D1CBF0]();
}

uint64_t DDResultAddSubresultSorted()
{
  return MEMORY[0x1E0D1CBF8]();
}

uint64_t DDResultCopyAuthCode()
{
  return MEMORY[0x1E0D1CC08]();
}

uint64_t DDResultCopyExtractedDateFromReferenceDate()
{
  return MEMORY[0x1E0D1CC10]();
}

uint64_t DDResultCopyExtractedStartDateEndDate()
{
  return MEMORY[0x1E0D1CC20]();
}

uint64_t DDResultCopyExtractedURL()
{
  return MEMORY[0x1E0D1CC30]();
}

uint64_t DDResultCopyExtractedURLWithOptions()
{
  return MEMORY[0x1E0D1CC38]();
}

uint64_t DDResultCopyMailValue()
{
  return MEMORY[0x1E0D1CC50]();
}

uint64_t DDResultCopyPhoneValue()
{
  return MEMORY[0x1E0D1CC58]();
}

uint64_t DDResultCopyUPIIdentifierValue()
{
  return MEMORY[0x1E0D1CC60]();
}

uint64_t DDResultCreate()
{
  return MEMORY[0x1E0D1CC68]();
}

uint64_t DDResultCreateCopy()
{
  return MEMORY[0x1E0D1CC70]();
}

uint64_t DDResultCreateFromDateTimeResults()
{
  return MEMORY[0x1E0D1CC78]();
}

uint64_t DDResultCurrencyExtraction()
{
  return MEMORY[0x1E0D1CC80]();
}

uint64_t DDResultGetCategory()
{
  return MEMORY[0x1E0D1CC90]();
}

uint64_t DDResultGetCountryCode()
{
  return MEMORY[0x1E0D1CC98]();
}

uint64_t DDResultGetMatchedString()
{
  return MEMORY[0x1E0D1CCA0]();
}

uint64_t DDResultGetParsecDomain()
{
  return MEMORY[0x1E0D1CCA8]();
}

uint64_t DDResultGetParsecRawDomain()
{
  return MEMORY[0x1E0D1CCB0]();
}

uint64_t DDResultGetQueryRange()
{
  return MEMORY[0x1E0D1CCC0]();
}

uint64_t DDResultGetQueryRangeForURLification()
{
  return MEMORY[0x1E0D1CCC8]();
}

uint64_t DDResultGetRange()
{
  return MEMORY[0x1E0D1CCD0]();
}

uint64_t DDResultGetRangeForURLification()
{
  return MEMORY[0x1E0D1CCD8]();
}

uint64_t DDResultGetShipmentTrackingUrlString()
{
  return MEMORY[0x1E0D1CCE0]();
}

uint64_t DDResultGetSignatureContainingResult()
{
  return MEMORY[0x1E0D1CCE8]();
}

uint64_t DDResultGetSubResults()
{
  return MEMORY[0x1E0D1CCF0]();
}

uint64_t DDResultGetSubresultWithType()
{
  return MEMORY[0x1E0D1CCF8]();
}

uint64_t DDResultGetType()
{
  return MEMORY[0x1E0D1CD00]();
}

uint64_t DDResultGetValue()
{
  return MEMORY[0x1E0D1CD08]();
}

uint64_t DDResultHasProperties()
{
  return MEMORY[0x1E0D1CD10]();
}

uint64_t DDResultHasType()
{
  return MEMORY[0x1E0D1CD18]();
}

uint64_t DDResultIsPartialDateRangeOrTimeRange()
{
  return MEMORY[0x1E0D1CD20]();
}

uint64_t DDResultIsPastDate()
{
  return MEMORY[0x1E0D1CD28]();
}

uint64_t DDResultPhysicalUnitsExtraction()
{
  return MEMORY[0x1E0D1CD38]();
}

uint64_t DDResultProximitySort()
{
  return MEMORY[0x1E0D1CD40]();
}

uint64_t DDResultSetMatchedString()
{
  return MEMORY[0x1E0D1CD48]();
}

uint64_t DDResultSetType()
{
  return MEMORY[0x1E0D1CD50]();
}

uint64_t DDResultTimeIsApprox()
{
  return MEMORY[0x1E0D1CD58]();
}

uint64_t DDResultTypesAreEqual()
{
  return MEMORY[0x1E0D1CD60]();
}

uint64_t DDScanQueryAddLineBreak()
{
  return MEMORY[0x1E0D1CD68]();
}

uint64_t DDScanQueryAddSeparator()
{
  return MEMORY[0x1E0D1CD70]();
}

uint64_t DDScanQueryAddTextFragment()
{
  return MEMORY[0x1E0D1CD78]();
}

uint64_t DDScanQueryCreate()
{
  return MEMORY[0x1E0D1CD80]();
}

uint64_t DDScanQueryCreateFromString()
{
  return MEMORY[0x1E0D1CD88]();
}

uint64_t DDScanQueryGetFragmentMetaData()
{
  return MEMORY[0x1E0D1CD90]();
}

uint64_t DDScanQueryGetNumberOfFragments()
{
  return MEMORY[0x1E0D1CD98]();
}

uint64_t DDScannerServiceScanQuerySyncWithOptionsAndQOS()
{
  return MEMORY[0x1E0D1CDF8]();
}

uint64_t DDScannerShouldKeepParsecScoresBelowThreshold()
{
  return MEMORY[0x1E0D1CE18]();
}

uint64_t DDShouldImmediatelyShowActionSheetForResult()
{
  return MEMORY[0x1E0D1CE28]();
}

uint64_t DDShouldImmediatelyShowActionSheetForURL()
{
  return MEMORY[0x1E0D1CE30]();
}

uint64_t DDShouldUseDebugHighlightForResult()
{
  return MEMORY[0x1E0D1CE38]();
}

uint64_t DDShouldUseLightLinksForResult()
{
  return MEMORY[0x1E0D1CE40]();
}

uint64_t DDURLStringForResult()
{
  return MEMORY[0x1E0D1CE50]();
}

uint64_t DDURLTapAndHoldSchemes()
{
  return MEMORY[0x1E0D1CE58]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB3400](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

uint64_t TUFormattedPhoneNumber()
{
  return MEMORY[0x1E0DBD620]();
}

uint64_t TUUnformattedPhoneNumber()
{
  return MEMORY[0x1E0DBD760]();
}

uint64_t WebThreadIsEnabled()
{
  return MEMORY[0x1E0CEF7E8]();
}

uint64_t WebThreadRun()
{
  return MEMORY[0x1E0CEF7F8]();
}

uint64_t _AXSSoftwareTTYEnabled()
{
  return MEMORY[0x1E0DDDCF0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1E0CB3BC8](commaSeparatedKeysString, firstValue);
}

uint64_t _UIApplicationIsExtension()
{
  return MEMORY[0x1E0CEBEE0]();
}

uint64_t _UISystemFontName()
{
  return MEMORY[0x1E0CEC288]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
  MEMORY[0x1E0C80FD0](dso, description, *(_QWORD *)&flags, activity_block);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x1E0C81618](__x);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x1E0DE80D8](lhs, rhs);
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x1E0C857E8](__x);
  return result;
}

int32_t u_charDigitValue(UChar32 c)
{
  return MEMORY[0x1E0DE5958](*(_QWORD *)&c);
}

UBool u_isdigit(UChar32 c)
{
  return MEMORY[0x1E0DE5A30](*(_QWORD *)&c);
}

void uidna_close(UIDNA *idna)
{
  MEMORY[0x1E0DE62B0](idna);
}

int32_t uidna_nameToASCII_UTF8(const UIDNA *idna, const char *name, int32_t length, char *dest, int32_t capacity, UIDNAInfo *pInfo, UErrorCode *pErrorCode)
{
  return MEMORY[0x1E0DE62C8](idna, name, *(_QWORD *)&length, dest, *(_QWORD *)&capacity, pInfo, pErrorCode);
}

int32_t uidna_nameToUnicodeUTF8(const UIDNA *idna, const char *name, int32_t length, char *dest, int32_t capacity, UIDNAInfo *pInfo, UErrorCode *pErrorCode)
{
  return MEMORY[0x1E0DE62D8](idna, name, *(_QWORD *)&length, dest, *(_QWORD *)&capacity, pInfo, pErrorCode);
}

UIDNA *__cdecl uidna_openUTS46(uint32_t options, UErrorCode *pErrorCode)
{
  return (UIDNA *)MEMORY[0x1E0DE62E0](*(_QWORD *)&options, pErrorCode);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

uint64_t SBSRequestPasscodeUnlockUI_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_SpringBoardServices))
    dlopenHelper_SpringBoardServices(a1);
  return MEMORY[0x1E0DAB950]();
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_SearchFoundation(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/SearchFoundation.framework/SearchFoundation", 0);
  atomic_store(1u, &dlopenHelperFlag_SearchFoundation);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_SpringBoardServices(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/SpringBoardServices.framework/SpringBoardServices", 0);
  atomic_store(1u, &dlopenHelperFlag_SpringBoardServices);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_DataDetectorsNaturalLanguage(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/DataDetectorsNaturalLanguage.framework/DataDetectorsNaturalLanguage", 0);
  atomic_store(1u, &dlopenHelperFlag_DataDetectorsNaturalLanguage);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_NewsServices(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/NewsServices.framework/NewsServices", 0);
  atomic_store(1u, &dlopenHelperFlag_NewsServices);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_SearchUI(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/SearchUI.framework/SearchUI", 0);
  atomic_store(1u, &dlopenHelperFlag_SearchUI);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_iCalendar(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/iCalendar.framework/iCalendar", 0);
  atomic_store(1u, &dlopenHelperFlag_iCalendar);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_MessageUI(double a1)
{
  dlopen("/System/Library/Frameworks/MessageUI.framework/MessageUI", 0);
  atomic_store(1u, &dlopenHelperFlag_MessageUI);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_GeoServices(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/GeoServices.framework/GeoServices", 0);
  atomic_store(1u, &dlopenHelperFlag_GeoServices);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_CoreSuggestions(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/CoreSuggestions.framework/CoreSuggestions", 0);
  atomic_store(1u, &dlopenHelperFlag_CoreSuggestions);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_StoreKit(double a1)
{
  dlopen("/System/Library/Frameworks/StoreKit.framework/StoreKit", 0);
  atomic_store(1u, &dlopenHelperFlag_StoreKit);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_FlightUtilities(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/FlightUtilities.framework/FlightUtilities", 0);
  atomic_store(1u, &dlopenHelperFlag_FlightUtilities);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_BusinessChatService(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/BusinessChatService.framework/BusinessChatService", 0);
  atomic_store(1u, &dlopenHelperFlag_BusinessChatService);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_CalendarUIKit(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/CalendarUIKit.framework/CalendarUIKit", 0);
  atomic_store(1u, &dlopenHelperFlag_CalendarUIKit);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_CoreLocation(double a1)
{
  dlopen("/System/Library/Frameworks/CoreLocation.framework/CoreLocation", 0);
  atomic_store(1u, &dlopenHelperFlag_CoreLocation);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_BusinessChat(double a1)
{
  dlopen("/System/Library/Frameworks/BusinessChat.framework/BusinessChat", 0);
  atomic_store(1u, &dlopenHelperFlag_BusinessChat);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_ContactsUI(double a1)
{
  dlopen("/System/Library/Frameworks/ContactsUI.framework/ContactsUI", 0);
  atomic_store(1u, &dlopenHelperFlag_ContactsUI);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_CoreSpotlight(double a1)
{
  dlopen("/System/Library/Frameworks/CoreSpotlight.framework/CoreSpotlight", 0);
  atomic_store(1u, &dlopenHelperFlag_CoreSpotlight);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_AppProtectionUI(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/AppProtectionUI.framework/AppProtectionUI", 0);
  atomic_store(1u, &dlopenHelperFlag_AppProtectionUI);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_CoreParsec(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/CoreParsec.framework/CoreParsec", 0);
  atomic_store(1u, &dlopenHelperFlag_CoreParsec);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_IconServices(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 0);
  atomic_store(1u, &dlopenHelperFlag_IconServices);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_AppProtection(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/AppProtection.framework/AppProtection", 0);
  atomic_store(1u, (unsigned int *)&dlopenHelperFlag_AppProtection);
  return a1;
}

double gotLoadHelper_x8__OBJC_CLASS___BCError(double result)
{
  if (!atomic_load(&dlopenHelperFlag_BusinessChat))
    return dlopenHelper_BusinessChat(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___APApplication(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_AppProtection))
    return dlopenHelper_AppProtection(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___ISIcon(double result)
{
  if (!atomic_load(&dlopenHelperFlag_IconServices))
    return dlopenHelper_IconServices(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___ISImageDescriptor(double result)
{
  if (!atomic_load(&dlopenHelperFlag_IconServices))
    return dlopenHelper_IconServices(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___APBaseExtensionShieldView(double result)
{
  if (!atomic_load(&dlopenHelperFlag_AppProtectionUI))
    return dlopenHelper_AppProtectionUI(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___APGuard(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_AppProtection))
    return dlopenHelper_AppProtection(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___CUIKOccurrencesCollection(double result)
{
  if (!atomic_load(&dlopenHelperFlag_CalendarUIKit))
    return dlopenHelper_CalendarUIKit(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___BCSBusinessQueryService(double result)
{
  if (!atomic_load(&dlopenHelperFlag_BusinessChatService))
    return dlopenHelper_BusinessChatService(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___IPEventClassificationType(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DataDetectorsNaturalLanguage))
    return dlopenHelper_DataDetectorsNaturalLanguage(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___CSSearchableItemAttributeSet(double result)
{
  if (!atomic_load(&dlopenHelperFlag_CoreSpotlight))
    return dlopenHelper_CoreSpotlight(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___CSSearchableItem(double result)
{
  if (!atomic_load(&dlopenHelperFlag_CoreSpotlight))
    return dlopenHelper_CoreSpotlight(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___SGSuggestionsService(double result)
{
  if (!atomic_load(&dlopenHelperFlag_CoreSuggestions))
    return dlopenHelper_CoreSuggestions(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___CLLocation(double result)
{
  if (!atomic_load(&dlopenHelperFlag_CoreLocation))
    return dlopenHelper_CoreLocation(result);
  return result;
}

double gotLoadHelper_x8__IPMessageTypeEmail(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DataDetectorsNaturalLanguage))
    return dlopenHelper_DataDetectorsNaturalLanguage(result);
  return result;
}

double gotLoadHelper_x9__IPMessageTypeShortMessage(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DataDetectorsNaturalLanguage))
    return dlopenHelper_DataDetectorsNaturalLanguage(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___IPMessage(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DataDetectorsNaturalLanguage))
    return dlopenHelper_DataDetectorsNaturalLanguage(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___IPMessageUnit(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DataDetectorsNaturalLanguage))
    return dlopenHelper_DataDetectorsNaturalLanguage(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___FUFlightViewController(double result)
{
  if (!atomic_load(&dlopenHelperFlag_FlightUtilities))
    return dlopenHelper_FlightUtilities(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___SKStoreProductViewController(double result)
{
  if (!atomic_load(&dlopenHelperFlag_StoreKit))
    return dlopenHelper_StoreKit(result);
  return result;
}

double gotLoadHelper_x8__SKStoreProductParameterITunesItemIdentifier(double result)
{
  if (!atomic_load(&dlopenHelperFlag_StoreKit))
    return dlopenHelper_StoreKit(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___NSSNewsViewController(double result)
{
  if (!atomic_load(&dlopenHelperFlag_NewsServices))
    return dlopenHelper_NewsServices(result);
  return result;
}

void gotLoadHelper_x20__OBJC_CLASS___NSSNewsViewController(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_NewsServices))
    dlopenHelper_NewsServices(a1);
}

double gotLoadHelper_x8__OBJC_CLASS___SFResultSection(double result)
{
  if (!atomic_load(&dlopenHelperFlag_SearchFoundation))
    return dlopenHelper_SearchFoundation(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___SearchUIMediaPlayerViewController(double result)
{
  if (!atomic_load(&dlopenHelperFlag_SearchUI))
    return dlopenHelper_SearchUI(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___CNContactContentViewController(double result)
{
  if (!atomic_load(&dlopenHelperFlag_ContactsUI))
    return dlopenHelper_ContactsUI(result);
  return result;
}

double gotLoadHelper_x8__kPARLookupClient(double result)
{
  if (!atomic_load(&dlopenHelperFlag_CoreParsec))
    return dlopenHelper_CoreParsec(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___PARSessionConfiguration(double result)
{
  if (!atomic_load(&dlopenHelperFlag_CoreParsec))
    return dlopenHelper_CoreParsec(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___PARSession(double result)
{
  if (!atomic_load(&dlopenHelperFlag_CoreParsec))
    return dlopenHelper_CoreParsec(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___SFLookupHintRelevancyFeedback(double result)
{
  if (!atomic_load(&dlopenHelperFlag_SearchFoundation))
    return dlopenHelper_SearchFoundation(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS____GEOMapURLBuilder(double result)
{
  if (!atomic_load(&dlopenHelperFlag_GeoServices))
    return dlopenHelper_GeoServices(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS____GEOMapURLParser(double result)
{
  if (!atomic_load(&dlopenHelperFlag_GeoServices))
    return dlopenHelper_GeoServices(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___SGNLEventSuggestionsMetrics(double result)
{
  if (!atomic_load(&dlopenHelperFlag_CoreSuggestions))
    return dlopenHelper_CoreSuggestions(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___ICSDocument(double result)
{
  if (!atomic_load(&dlopenHelperFlag_iCalendar))
    return dlopenHelper_iCalendar(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___MFMessageComposeViewController(double result)
{
  if (!atomic_load(&dlopenHelperFlag_MessageUI))
    return dlopenHelper_MessageUI(result);
  return result;
}

