id RTTUIUtilitiesClass()
{
  if (qword_1000921C8 != -1)
    dispatch_once(&qword_1000921C8, &stru_10007D370);
  return (id)qword_1000921C0;
}

void sub_1000039D0(id a1)
{
  id v1;
  NSObject *v2;
  uint8_t v3[16];

  qword_1000921C0 = CUTWeakLinkClass(CFSTR("RTTUIUtilities"), CFSTR("RTTUI"));
  if (!qword_1000921C0)
  {
    v1 = PHDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue(v1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find class RTTUIUtilities; RTTUI.framework may have failed to link.",
        v3,
        2u);
    }

  }
}

UIFont *__cdecl sub_100003C58(UIFont *self, SEL a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  void *v12;
  UIFontDescriptorAttributeName v13;
  void *v14;

  v13 = UIFontDescriptorFeatureSettingsAttribute;
  v10[0] = UIFontFeatureTypeIdentifierKey;
  v10[1] = UIFontFeatureSelectorIdentifierKey;
  v11[0] = &off_100080220;
  v11[1] = &off_100080238;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
  v12 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  v14 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIFont fontDescriptor](self, "fontDescriptor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fontDescriptorByAddingAttributes:", v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v7, 0.0));
  return (UIFont *)v8;
}

void sub_100003DE4(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleHeadline, 0x8000, 0));
  v2 = (void *)qword_1000921D0;
  qword_1000921D0 = v1;

}

void sub_100003E64(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleCaption2, 0x8000, 0));
  v2 = (void *)qword_1000921E0;
  qword_1000921E0 = v1;

}

void sub_100003F18(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1000921F0;
  qword_1000921F0 = (uint64_t)v1;

}

void sub_100004030(uint64_t a1)
{
  id v2;
  TUFeatureFlags *v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];

  +[TUCallCapabilities initializeCachedValues](TUCallCapabilities, "initializeCachedValues");
  v2 = objc_alloc_init((Class)VMVoicemailManager);
  objc_msgSend(*(id *)(a1 + 32), "setAccountManager:", v2);
  v3 = objc_opt_new(TUFeatureFlags);
  v4 = -[TUFeatureFlags callScreeningEnabledM3](v3, "callScreeningEnabledM3");

  if (v4)
    v5 = objc_claimAutoreleasedReturnValue(+[PHApplicationServices getFTVoiceMailOnVoicemailsChanged:](PHApplicationServices, "getFTVoiceMailOnVoicemailsChanged:", &stru_10007D3F8));
  else
    v5 = objc_claimAutoreleasedReturnValue(+[PHVisualVoicemailManagerFactory getVisualVoiceMailWithVisualVoicemailManager:onVoicemailsChanged:](PHVisualVoicemailManagerFactory, "getVisualVoiceMailWithVisualVoicemailManager:onVoicemailsChanged:", v2, &stru_10007D3F8));
  v6 = (void *)v5;
  objc_msgSend(*(id *)(a1 + 32), "setVoicemailManager:", v5);
  v7 = objc_alloc_init((Class)TUCallProviderManager);
  objc_msgSend(*(id *)(a1 + 32), "setCallProviderManager:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactStore contactStore](CNContactStore, "contactStore"));
  objc_msgSend(*(id *)(a1 + 32), "setContactStore:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactStore suggestedContactStore](CNContactStore, "suggestedContactStore"));
  objc_msgSend(*(id *)(a1 + 32), "setSuggestedContactStore:", v9);

  v10 = objc_alloc_init((Class)TUCallDirectoryMetadataCacheDataProvider);
  v19[0] = v10;
  v11 = objc_alloc_init((Class)TUMapsMetadataCacheDataProvider);
  v19[1] = v11;
  v12 = objc_alloc_init((Class)TUSuggestionsMetadataCacheDataProvider);
  v19[2] = v12;
  v13 = objc_alloc_init((Class)TUGeoLocationMetadataCacheDataProvider);
  v19[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 4));

  v15 = objc_msgSend(objc_alloc((Class)TUMetadataCache), "initWithDataProviders:", v14);
  objc_msgSend(*(id *)(a1 + 32), "setMetadataCache:", v15);

  if (+[PHDevice isGeminiCapable](PHDevice, "isGeminiCapable"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "telephonyProvider"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
    v18 = objc_msgSend(v7, "providerWithIdentifier:", v17);

  }
  objc_msgSend(*(id *)(a1 + 32), "setInitializationBlockQueued:", 0);

}

void sub_100004298(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  objc_msgSend(v1, "addOperationWithBlock:", &stru_10007D418);

}

void sub_1000042D4(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("PHVoicemailManagerVoicemailsChanged"), 0);

}

void sub_1000044C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000044E0(uint64_t a1)
{
  id v2;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  return v2;
}

uint64_t sub_100004528(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100004538(uint64_t a1)
{

}

void sub_100004540(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_100004820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100004838(uint64_t a1)
{
  id v2;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  return v2;
}

void sub_100004880(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_100004A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100004A80(uint64_t a1)
{
  id v2;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  return v2;
}

void sub_100004AC8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_100004CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100004CBC(uint64_t a1)
{
  id v2;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  return v2;
}

void sub_100004D04(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_100004EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100004EF8(uint64_t a1)
{
  id v2;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  return v2;
}

void sub_100004F40(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_1000050B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000050C8(uint64_t a1)
{
  id v2;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  return v2;
}

void sub_100005110(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

id PHDefaultLog()
{
  if (qword_100092208 != -1)
    dispatch_once(&qword_100092208, &stru_10007D550);
  return (id)qword_100092200;
}

void sub_1000052F8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.calls.mobilephone", "Default");
  v2 = (void *)qword_100092200;
  qword_100092200 = (uint64_t)v1;

}

void sub_1000058AC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id PHPreferencesGetValue(void *a1)
{
  return PHPreferencesGetValueInDomain(a1, 0);
}

id PHPreferencesGetValueInDomain(void *a1, void *a2)
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;

  v3 = a1;
  v4 = a2;
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));

  }
  if (-[__CFString length](v3, "length") && -[__CFString length](v4, "length"))
    v6 = (void *)CFPreferencesCopyValue(v3, v4, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  else
    v6 = 0;

  return v6;
}

void PHPreferencesSetValueInDomain(void *a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  void *v7;
  __CFString *key;

  key = a1;
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));

  }
  if (-[__CFString length](key, "length") && -[__CFString length](v6, "length"))
  {
    CFPreferencesSetValue(key, v5, v6, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    CFPreferencesSynchronize(v6, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  }

}

void sub_100005A90(id a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote));
  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "withCaseSensitiveAttribute"));
  v2 = (void *)qword_100092210;
  qword_100092210 = v1;

}

void sub_100005B24(id a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor voicemailHeadlineShortFontDescriptor](UIFontDescriptor, "voicemailHeadlineShortFontDescriptor"));
  v1 = objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v3, 0.0));
  v2 = (void *)qword_100092220;
  qword_100092220 = v1;

}

void sub_100005BC8(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor voicemailCaptionRegularFontDescriptor](UIFontDescriptor, "voicemailCaptionRegularFontDescriptor"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v4, 0.0));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "withCaseSensitiveAttribute"));
  v3 = (void *)qword_100092230;
  qword_100092230 = v2;

}

void sub_10000810C(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;

  v2 = PHDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "intent"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "extensionContext"));
    v15 = 138412546;
    v16 = v4;
    v17 = 2112;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "countdown completed, request handling of intent: %@ on extension context: %@", (uint8_t *)&v15, 0x16u);

  }
  v7 = *(void **)(a1 + 32);
  v6 = (id *)(a1 + 32);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "intent"));

  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*v6, "extensionContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v6, "intent"));
    -[NSObject _requestHandlingOfIntent:](v9, "_requestHandlingOfIntent:", v10);

  }
  else
  {
    v11 = PHDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000520F8(v6, v9);
  }

  v12 = PHDefaultLog();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Enabling application idleTimer for CallIntentCountdown: countdownCompleted", (uint8_t *)&v15, 2u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v14, "_setIdleTimerDisabled:forReason:", 0, CFSTR("CallIntentCountdown"));

}

void sub_10000886C(id a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)CHManager);
  v2 = (void *)qword_100092240;
  qword_100092240 = (uint64_t)v1;

}

void sub_1000088D4(id a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)NSCache);
  v2 = (void *)qword_100092250;
  qword_100092250 = (uint64_t)v1;

}

void sub_100009D2C(id a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)NSCache);
  v2 = (void *)qword_100092260;
  qword_100092260 = (uint64_t)v1;

}

void sub_10000A418(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_10000A424(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10000A450(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000C1D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000C1F0(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  uint64_t v11;
  uint64_t v12;

  --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "countdownLabel"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000C2D8;
  v10[3] = &unk_10007D658;
  v6[0] = _NSConcreteStackBlock;
  v6[2] = sub_10000C348;
  v6[3] = &unk_10007D680;
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(void **)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v6[1] = 3221225472;
  v8 = v3;
  v9 = v4;
  v6[4] = v11;
  v7 = v5;
  +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", v2, 5242880, v10, v6, 0.200000003);

}

void sub_10000C2D8(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "countdownLabel"));
  objc_msgSend(v2, "setText:", v3);

}

uint64_t sub_10000C348(uint64_t result)
{
  uint64_t v1;
  id v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    v2 = PHDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(v1 + 56);
      v5 = 134217984;
      v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "completed count down from number: %ld", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(*(id *)(v1 + 32), "cancel");
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

id sub_10000CEEC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v17;
  id v18;
  __int16 v19;
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "handle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value"));

  if (objc_msgSend(v8, "length"))
  {
    v9 = *(void **)(a1 + 32);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUID"));
    LODWORD(v9) = objc_msgSend(v9, "isEmergencyNumberForDigits:senderIdentityUUID:", v8, v10);

    if ((_DWORD)v9)
      objc_msgSend(v5, "setDialType:", 1);
  }
  if (objc_msgSend(v5, "dialType") == (id)1
    && objc_msgSend(*(id *)(a1 + 40), "canMakeEmergencyCallForSenderIdentity:", v6))
  {
    v11 = v6;
    v12 = PHDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412546;
      v18 = v5;
      v19 = 2112;
      v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Updating emergency dial request %@ to use sender identity %@", (uint8_t *)&v17, 0x16u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUID"));
    objc_msgSend(v5, "setLocalSenderIdentityUUID:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accountUUID"));
    objc_msgSend(v5, "setLocalSenderIdentityAccountUUID:", v15);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void sub_1000103C4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "gridView"));
  objc_msgSend(v2, "setArrangedSubviewRows:", &__NSArray0__struct);

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "titleStackView"));
  objc_msgSend(v3, "setArrangedSubviews:", &__NSArray0__struct);

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "subtitleStackView"));
  objc_msgSend(v4, "setArrangedSubviews:", &__NSArray0__struct);

}

void sub_100011044(id a1)
{
  PHDevice *v1;
  void *v2;

  v1 = objc_alloc_init(PHDevice);
  v2 = (void *)qword_100092270;
  qword_100092270 = (uint64_t)v1;

}

void sub_1000110AC(id a1)
{
  const __CFBoolean *v1;
  const __CFBoolean *v2;
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  int v7;

  v7 = 0;
  v1 = (const __CFBoolean *)MGCopyAnswerWithError(CFSTR("jkr5aFPOh/d6zTzNKYthBw"), 0, &v7);
  if (v1)
  {
    v2 = v1;
    if (v7)
    {
      v3 = PHDefaultLog();
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        sub_100052620(&v7, v4);

    }
    else
    {
      byte_100092280 = CFBooleanGetValue(v1) != 0;
    }
    CFRelease(v2);
  }
  else
  {
    v5 = PHDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000525E0(v6);

  }
}

id sub_100011244(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id result;

  v2 = objc_alloc((Class)RadiosPreferences);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dispatchQueue"));
  v4 = objc_msgSend(v2, "initWithQueue:", v3);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDelegate:");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = objc_msgSend(*(id *)(a1 + 32), "fetchCellularRadioEnabled");
  result = objc_msgSend(*(id *)(a1 + 32), "fetchRingerSwitchEnabled");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = (_BYTE)result;
  return result;
}

void sub_1000113DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000113F4(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

void sub_100011484(uint64_t a1)
{
  uint64_t v1;
  int v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 8) != v2)
  {
    *(_BYTE *)(v1 + 8) = v2;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000114F8;
    block[3] = &unk_10007D440;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_1000114F8(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("PHDeviceCellularRadioEnabledDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void sub_1000115E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100011600(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 9);
  return result;
}

void sub_100011690(uint64_t a1)
{
  uint64_t v1;
  int v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 9) != v2)
  {
    *(_BYTE *)(v1 + 9) = v2;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100011704;
    block[3] = &unk_10007D440;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_100011704(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("PHDeviceRingerSwitchDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void sub_100011828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100011840(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100011850(uint64_t a1)
{

}

void sub_100011858(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

void sub_10001198C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000119B0(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setRingerSwitchEnabled:", objc_msgSend(WeakRetained, "fetchRingerSwitchEnabled"));

}

id sub_100011B04(id a1, SEL a2, id a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "senderDestinationID"));
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "senderISOCountryCode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle normalizedPhoneNumberHandleForValue:isoCountryCode:](TUHandle, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v5, v6));

    if (v7)
      v8 = objc_msgSend(objc_alloc((Class)a1), "initWithHandle:", v7);
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id sub_100011BB8(id a1, SEL a2, id a3)
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableOrderedSet);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "receiverDestinationID"));
        if (objc_msgSend(v10, "length"))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "receiverISOCountryCode"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle normalizedPhoneNumberHandleForValue:isoCountryCode:](TUHandle, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v10, v11));

          if (v12)
            v13 = objc_msgSend(objc_alloc((Class)TUMetadataDestinationID), "initWithHandle:", v12);
          else
            v13 = 0;
          objc_msgSend(v4, "addObject:", v13);

        }
        else
        {
          v13 = 0;
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "senderDestinationID"));

        if (objc_msgSend(v14, "length"))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "senderISOCountryCode"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle normalizedPhoneNumberHandleForValue:isoCountryCode:](TUHandle, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v14, v15));

          if (v16)
          {
            v17 = objc_msgSend(objc_alloc((Class)TUMetadataDestinationID), "initWithHandle:", v16);

            v13 = v17;
          }
          objc_msgSend(v4, "addObject:", v13);

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "array"));
  return v18;
}

void sub_100012228(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  int *v17;
  NSObject *v18;
  _QWORD handler[4];
  id v20;
  id v21;
  id location;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "fetchContactFormatter"));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "fetchNumberFormatter"));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v5;

  v8 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 80);
  *(_QWORD *)(v9 + 80) = v8;

  v11 = objc_alloc_init((Class)NSDictionary);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 88);
  *(_QWORD *)(v12 + 88) = v11;

  objc_msgSend(*(id *)(a1 + 32), "updateRecentCalls");
  objc_msgSend(*(id *)(a1 + 32), "populateMessageCache");
  objc_msgSend(*(id *)(a1 + 32), "setUnreadCallCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "unreadCallCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v14, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "handleCNContactStoreDidChangeNotification:", CNContactStoreDidChangeNotification, 0);
  objc_msgSend(v14, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "handleIDSServiceAvailabilityDidChangeNotification:", IDSServiceAvailabilityDidChangeNotification, 0);
  objc_msgSend(v14, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "handleNSCurrentLocaleDidChangeNotification:", NSCurrentLocaleDidChangeNotification, 0);
  objc_msgSend(v14, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "handleTUCallHistoryControllerRecentCallsDidChangeNotification:", TUCallHistoryControllerRecentCallsDidChangeNotification, 0);
  objc_msgSend(v14, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "handleTUCallHistoryControllerUnreadCallCountDidChangeNotification:", TUCallHistoryControllerUnreadCallCountDidChangeNotification, 0);
  objc_msgSend(v14, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "handleTUMetadataCacheDidFinishUpdatingNotification:", TUMetadataCacheDidFinishUpdatingNotification, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
  objc_msgSend(v14, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "handleUIApplicationSignificantTimeChangeNotification:", UIApplicationSignificantTimeChangeNotification, 0);
  objc_msgSend(v14, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "handleUIApplicationDidBecomeActiveNotification:", UIApplicationDidBecomeActiveNotification, 0);
  objc_initWeak(&location, *(id *)(a1 + 32));
  if (qword_1000922A0 != -1)
    dispatch_once(&qword_1000922A0, &stru_10007D980);
  v15 = (const char *)qword_1000922A8;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = (int *)(v16 + 16);
  v18 = *(NSObject **)(v16 + 48);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100012514;
  handler[3] = &unk_10007D7D8;
  objc_copyWeak(&v21, &location);
  v20 = *(id *)(a1 + 32);
  notify_register_dispatch(v15, v17, v18, handler);
  objc_msgSend(*(id *)(a1 + 32), "setInitializationBlockQueued:", 0);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void sub_1000124F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100012514(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = PHDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (qword_1000922A0 != -1)
        dispatch_once(&qword_1000922A0, &stru_10007D980);
      *(_DWORD *)buf = 136315138;
      v11 = qword_1000922A8;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Handling %s by fetching metadata for recent calls", buf, 0xCu);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recentCalls"));
    if (objc_msgSend(v5, "count"))
    {
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serialQueue"));
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10001268C;
      v7[3] = &unk_10007D7B0;
      v8 = *(id *)(a1 + 32);
      v9 = v5;
      dispatch_async(v6, v7);

    }
  }

}

id sub_10001268C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchMetadataForRecentCalls:", *(_QWORD *)(a1 + 40));
}

void sub_100012938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100012950(uint64_t a1)
{
  id v2;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 112);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  return v2;
}

uint64_t sub_100012998(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000129A8(uint64_t a1)
{

}

void sub_1000129B0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_100012C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100012C8C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactForHandle:", *(_QWORD *)(a1 + 40)));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_100012D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100012DB4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "itemCache"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "uniqueId"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v2));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_100012EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100012F14(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ph_uniqueIDs", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v5)
        objc_enumerationMutation(v2);
      v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "messageCache"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        break;
      if (v4 == (id)++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }

}

void sub_100013164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001317C(uint64_t a1)
{
  void *v2;
  id v3;
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "callHistoryController"));
  v3 = objc_msgSend(v2, "coalescingStrategy");

  if (v3 == (id)2)
  {
    v4 = (id *)&kCHCoalescingStrategyCollapseIfEqual;
  }
  else
  {
    if (v3 != (id)1)
      return;
    v4 = (id *)&kCHCoalescingStrategyRecents;
  }
  v5 = *v4;
  if (v5)
  {
    v9 = v5;
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "coalescedCallWithCall:usingStrategy:", *(_QWORD *)(a1 + 48), v5));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void sub_1000132A4(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "callHistoryController"));
  objc_msgSend(v1, "deleteAllRecentCalls");

}

void sub_10001336C(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "callHistoryController"));
  objc_msgSend(v2, "deleteRecentCalls:", *(_QWORD *)(a1 + 40));

}

void sub_100013460(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "callHistoryController"));
  objc_msgSend(v1, "markRecentCallsAsRead");

}

void sub_1000134FC(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "callHistoryController"));
  objc_msgSend(v1, "markRecentAudioCallsAsRead");

}

void sub_1000136C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000136E4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactsByHandleForRecentCall:keyDescriptors:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allValues"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void sub_10001386C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100013884(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactsByHandleForRecentCall:keyDescriptors:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)));
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allKeys", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", v11));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v13, v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
}

void sub_100013AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100013AF0(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;

  v2 = PHDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v20 = 138412290;
    v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Attempting to create a dial request for recent call %@", (uint8_t *)&v20, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "callProviderManager"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dialRequestForRecentCall:", *(_QWORD *)(a1 + 32)));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "validRemoteParticipantHandles"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "anyObject"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "contactForHandle:", v10));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setContactIdentifier:", v12);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setOriginatingUIType:", 8);
  }
  else
  {
    v13 = PHDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100052698(a1 + 32, v10, v14, v15, v16, v17, v18, v19);
  }

}

void sub_100013DA8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a2;
  if (v3)
  {
    v4 = PHDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100052700(a1, (uint64_t)v3, v5);

  }
}

id sub_1000145A8(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "recentsController:didUpdateCalls:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

id sub_1000145B8(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "recentsController:didChangeCalls:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 112));
}

id sub_100014784(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "recentsController:didChangeCalls:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

id sub_10001492C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "recentsController:didChangeUnreadCallCount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

id sub_100014AD0(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "recentsControllerDidChangeMessages:", *(_QWORD *)(a1 + 40));
}

void sub_100015EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100015EC8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController descriptorForRequiredKeys](CNContactViewController, "descriptorForRequiredKeys"));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fetchUnifiedContactForID:withDescriptors:", v3, v5));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

id sub_100017AD4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a2;
  if (!objc_msgSend(v3, "length"))
    goto LABEL_6;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 != 1)
  {
    if (v4 >= 2)
    {
      v9 = TUBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("%@_AND_%@_OTHERS"), &stru_10007F010, CFSTR("TelephonyUtilities")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "numberFormatter"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(a1 + 40)));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringFromNumber:", v13));
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v3, v14));

      goto LABEL_7;
    }
LABEL_6:
    v8 = v3;
    goto LABEL_7;
  }
  v5 = TUBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("%@_AND_ONE_OTHER"), &stru_10007F010, CFSTR("TelephonyUtilities")));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v3));

LABEL_7:
  return v8;
}

void sub_100017E04(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "featureFlags"));
  v3 = objc_msgSend(v2, "phoneRecentsAvatarsEnabled");

  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serialQueue"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100017EB4;
    v7[3] = &unk_10007D7B0;
    v5 = *(id *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 32);
    v8 = v5;
    v9 = v6;
    dispatch_async(v4, v7);

  }
}

void sub_100017EB4(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v2 = *(id *)(a1 + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uniqueId", (_QWORD)v15));
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "itemCache"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v8));
          v11 = objc_msgSend(v10, "mutableCopy");

          if (v11)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "localizedSubtitleForRecentCall:", v7));
            objc_msgSend(v11, "setLocalizedSubtitle:", v12);

            v13 = objc_msgSend(v11, "copy");
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "itemCache"));
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v8);

          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v4);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 12));
    objc_msgSend(*(id *)(a1 + 40), "notifyDelegatesRecentsController:didUpdateCalls:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 12));
  }
}

void sub_1000188E0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recentCalls"));
  if (objc_msgSend(v6, "count"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactCache"));
    objc_msgSend(v2, "removeAllObjects");

    v3 = *(void **)(a1 + 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recentCalls"));
    objc_msgSend(v3, "fetchContactsForRecentCalls:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "itemCache"));
    objc_msgSend(v5, "removeAllObjects");

    objc_msgSend(*(id *)(a1 + 32), "populateItemCacheForRecentCalls:", v6);
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
    objc_msgSend(*(id *)(a1 + 32), "notifyDelegatesRecentsController:didChangeCalls:", *(_QWORD *)(a1 + 32), v6);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  }

}

id sub_100018AFC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateRecentCalls");
}

void sub_100018C50(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "fetchContactFormatter"));
  objc_msgSend(*(id *)(a1 + 32), "setContactFormatter:", v2);

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "fetchNumberFormatter"));
  objc_msgSend(*(id *)(a1 + 32), "setNumberFormatter:", v3);

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recentCalls"));
  if (objc_msgSend(v8, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "itemCache"));
    objc_msgSend(v4, "removeAllObjects");

    objc_msgSend(*(id *)(a1 + 32), "populateItemCacheForRecentCalls:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "featureFlags"));
    v6 = objc_msgSend(v5, "phoneRecentsAvatarsEnabled");

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
    v7 = *(void **)(a1 + 32);
    if (v6)
      objc_msgSend(v7, "notifyDelegatesRecentsController:didUpdateCalls:", v7, v8);
    else
      objc_msgSend(v7, "notifyDelegatesRecentsController:didChangeCalls:", v7, v8);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  }

}

id sub_100018F04(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateRecentCalls");
}

void sub_1000191DC(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recentCalls"));
  if (objc_msgSend(v2, "count"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v16 = v2;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueId"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "itemCache"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));
          v12 = objc_msgSend(v11, "mutableCopy");

          if (v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localizedSubtitleForRecentCall:", v8));
            objc_msgSend(v12, "setLocalizedSubtitle:", v13);

            v14 = objc_msgSend(v12, "copy");
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "itemCache"));
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v9);

          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v5);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
    objc_msgSend(*(id *)(a1 + 32), "notifyDelegatesRecentsController:didChangeCalls:", *(_QWORD *)(a1 + 32), v3);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
    v2 = v16;
  }

}

id sub_100019508(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "populateMessageCache");
}

void sub_10001965C(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recentCalls"));
  if (objc_msgSend(v3, "count"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "itemCache"));
    objc_msgSend(v2, "removeAllObjects");

    objc_msgSend(*(id *)(a1 + 32), "populateItemCacheForRecentCalls:", v3);
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
    objc_msgSend(*(id *)(a1 + 32), "notifyDelegatesRecentsController:didChangeCalls:", *(_QWORD *)(a1 + 32), v3);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  }

}

id sub_100019834(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateRecentCalls");
}

void sub_10001A510(id a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_LABEL"), &stru_10007F010, CFSTR("PHRecents")));
  v2 = (void *)qword_100092290;
  qword_100092290 = v1;

}

void sub_10001A704(id a1)
{
  uint64_t *v1;

  v1 = (uint64_t *)CUTWeakLinkSymbol("CXCallDirectoryManagerIdentificationEntriesChangedNotification", CFSTR("CallKit"));
  if (v1)
    qword_1000922A8 = *v1;
}

void sub_10001A738(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];

  v4[0] = CNContactPhoneNumbersKey;
  v4[1] = CNContactEmailAddressesKey;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter descriptorForRequiredKeysForStyle:](CNContactFormatter, "descriptorForRequiredKeysForStyle:", 0));
  v4[2] = v1;
  v4[3] = CNContactSocialProfilesKey;
  v2 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, 4));
  v3 = (void *)qword_1000922B0;
  qword_1000922B0 = v2;

}

void sub_10001A9E8(id *a1)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  NSObject *v9;
  id v10;
  id v11;
  uint8_t buf[8];
  id to;

  v2 = a1 + 5;
  objc_copyWeak(&to, a1 + 5);
  v3 = objc_loadWeakRetained(&to);

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "sharedUtilityProvider"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "UUIDString"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "conversationForCallUID:", v5));

    if (v6)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001AB68;
      block[3] = &unk_10007D9C8;
      objc_copyWeak(&v11, v2);
      v6 = v6;
      v9 = v6;
      v10 = a1[4];
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      objc_destroyWeak(&v11);
    }
  }
  else
  {
    v7 = PHDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopped fetchRTTConversationForCallUUID because MPRTTTranscriptionMessage was deallocated before starting", buf, 2u);
    }
  }

  objc_destroyWeak(&to);
}

void sub_10001AB50(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_10001AB68(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint8_t v10[8];
  const __CFString *v11;
  void *v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setConversation:", *(_QWORD *)(a1 + 32));
    v4 = PHDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully finished fetchRTTConversationForCallUUID", v10, 2u);
    }

    v6 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v11 = CFSTR("MPVoicemailRTTTranscriptDidLoadCallIDKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
    v12 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    -[NSObject postNotificationName:object:userInfo:](v6, "postNotificationName:object:userInfo:", CFSTR("MPVoicemailRTTTranscriptDidLoadNotification"), 0, v8);

  }
  else
  {
    v9 = PHDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopped fetchRTTConversationForCallUUID because MPRTTTranscriptionMessage was deallocated when trying to write conversation", v10, 2u);
    }
  }

}

void sub_10001FAA0(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v2 = PHDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MPVoicemailController initWithVoicemailManager, inside serialDispatchQueue", buf, 2u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), &_dispatch_main_q);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = &__NSArray0__struct;

  v6 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001FC8C;
  v8[3] = &unk_10007DA18;
  v9 = v6;
  objc_msgSend(v9, "fetchMessagesCompletion:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "handleCNContactStoreDidChangeNotification:", CNContactStoreDidChangeNotification, 0);
  objc_msgSend(v7, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "handleNSCurrentLocaleDidChangeNotification:", NSCurrentLocaleDidChangeNotification, 0);
  objc_msgSend(v7, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "handleTUMetadataCacheDidFinishUpdatingNotification:", TUMetadataCacheDidFinishUpdatingNotification, 0);
  objc_msgSend(v7, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "handleUIApplicationSignificantTimeChangeNotification:", UIApplicationSignificantTimeChangeNotification, 0);
  objc_msgSend(v7, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "handleUIApplicationWillEnterForegroundNotification:", UIApplicationWillEnterForegroundNotification, 0);
  objc_msgSend(v7, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "handleRecentsChangedNotification:", kCallHistoryDatabaseChangedNotification, 0);
  objc_msgSend(v7, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "handleVoicemailsChangedNotification:", CFSTR("PHVoicemailManagerVoicemailsChanged"), 0);

}

void sub_10001FC8C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  v4 = PHDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MPVoicemailController initWithVoicemailManager, fetchMessagesCompletion", v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setMessages:", v3);
}

void sub_10001FE3C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_10001FE50(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

void sub_10001FF48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001FF60(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001FF70(uint64_t a1)
{

}

void sub_10001FF78(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

void sub_100020038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100020050(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

void sub_1000200EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100020104(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

void sub_100020304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002031C(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  unsigned int v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
  v46 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v2));

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "localizedSubtitleCache"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v46));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "senderDestinationID"));
    if (objc_msgSend(v7, "length"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "senderISOCountryCode"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "senderContactForMessage:", *(_QWORD *)(a1 + 32)));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle normalizedHandleWithDestinationID:](TUHandle, "normalizedHandleWithDestinationID:", v7));
      v11 = v10;
      if (v9 && objc_msgSend(v10, "type") == (id)2)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[CNPhoneNumber phoneNumberWithDigits:countryCode:](CNPhoneNumber, "phoneNumberWithDigits:countryCode:", v7, v8));
        if (v12)
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "labeledValueForPhoneNumber:", v12));
        else
          v13 = 0;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "label"));
        v15 = objc_claimAutoreleasedReturnValue(+[CNLabeledValue localizedDisplayStringForLabel:propertyName:](CNLabeledValue, "localizedDisplayStringForLabel:propertyName:", v14, CNContactPhoneNumbersKey));
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v17 = *(void **)(v16 + 40);
        *(_QWORD *)(v16 + 40) = v15;

      }
      if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length"))
      {
        v18 = objc_msgSend(objc_alloc((Class)TUMetadataDestinationID), "initWithHandle:", v11);
        if (v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "metadataCache"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "metadataForDestinationID:", v18));

          v21 = objc_msgSend(v20, "metadataForProvider:", objc_opt_class(TUCallDirectoryMetadataCacheDataProvider));
          v22 = objc_claimAutoreleasedReturnValue(v21);
          v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v24 = *(void **)(v23 + 40);
          *(_QWORD *)(v23 + 40) = v22;

          if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length"))
          {
            v25 = objc_msgSend(v20, "metadataForProvider:", objc_opt_class(TUSuggestionsMetadataCacheDataProvider));
            v26 = objc_claimAutoreleasedReturnValue(v25);
            v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v28 = *(void **)(v27 + 40);
            *(_QWORD *)(v27 + 40) = v26;

          }
          if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length"))
          {
            v29 = objc_msgSend(v20, "metadataForProvider:", objc_opt_class(TUGeoLocationMetadataCacheDataProvider));
            v30 = objc_claimAutoreleasedReturnValue(v29);
            v31 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v32 = *(void **)(v31 + 40);
            *(_QWORD *)(v31 + 40) = v30;

          }
        }

      }
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "featureFlags"));
    v34 = objc_msgSend(v33, "callScreeningEnabledM3");

    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "provider"));
      v36 = objc_msgSend(v35, "isEqual:", CFSTR("com.apple.telephonyutilities.callservicesd.FaceTimeProvider"));

      if (v36)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("MPVOICEMAIL_TABLE_VIEW_CELL_TITLE_FaceTime_Audio"), &stru_10007F010, CFSTR("MPVoicemail")));
        v39 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v40 = *(void **)(v39 + 40);
        *(_QWORD *)(v39 + 40) = v38;

      }
    }
    if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length"))
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("MPVOICEMAIL_TABLE_VIEW_CELL_SUBTITLE_UNKNOWN"), &stru_10007F010, CFSTR("MPVoicemail")));
      v43 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v44 = *(void **)(v43 + 40);
      *(_QWORD *)(v43 + 40) = v42;

    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "localizedSubtitleCache"));
    objc_msgSend(v45, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v46);

  }
}

void sub_1000208C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000208DC(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
  v22 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v2));

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "localizedDowntimeTitleCache"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v22));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "senderContactForMessage:", *(_QWORD *)(a1 + 32)));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "contactFormatter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringFromContact:", v7));

    if (!objc_msgSend(v9, "length"))
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "localizedHandleTitleFromMessage:", *(_QWORD *)(a1 + 32)));

      v9 = (void *)v10;
    }
    if (!objc_msgSend(v9, "length"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("MPVOICEMAIL_TABLE_VIEW_CELL_TITLE_UNKNOWN"), &stru_10007F010, CFSTR("MPVoicemail")));

      v9 = (void *)v12;
    }
    v13 = *(void **)(a1 + 40);
    v14 = TUBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("DOWNTIME_CALLER_%@"), &stru_10007F010, CFSTR("TelephonyUtilities")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v9));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "attributedStringForDowntimeMessage:", v17));
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "localizedDowntimeTitleCache"));
    objc_msgSend(v21, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v22);

  }
}

void sub_100020BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100020BE0(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
  v20 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v2));

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "localizedTitleCache"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v20));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "senderContactForMessage:", *(_QWORD *)(a1 + 32)));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "contactFormatter"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringFromContact:", v7));
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length"))
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "localizedHandleTitleFromMessage:", *(_QWORD *)(a1 + 32)));
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

    }
    if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("MPVOICEMAIL_TABLE_VIEW_CELL_TITLE_UNKNOWN"), &stru_10007F010, CFSTR("MPVoicemail")));
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "localizedTitleCache"));
    objc_msgSend(v19, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v20);

  }
}

void sub_1000210DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1000210F0(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v4 = WeakRetained[4];
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8);
          if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
            objc_msgSend(v3, "addObject:", v9);
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }
    v10 = *(_QWORD *)(a1 + 40);
    v11 = objc_msgSend(v3, "copy");
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);

  }
}

void sub_100021488(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_10002149C(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v4 = WeakRetained[3];
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8);
          if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
            objc_msgSend(v3, "addObject:", v9);
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }
    v10 = *(_QWORD *)(a1 + 40);
    v11 = objc_msgSend(v3, "copy");
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);

  }
}

id sub_1000216C0(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "deleteVoicemails:", *(_QWORD *)(a1 + 40));
}

id sub_100021788(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "markVoicemailsAsRead:", *(_QWORD *)(a1 + 40));
}

id sub_100021850(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "trashVoicemails:", *(_QWORD *)(a1 + 40));
}

id sub_100021918(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "removeVoicemailsFromTrash:", *(_QWORD *)(a1 + 40));
}

void sub_1000219F0(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100021A68;
  v4[3] = &unk_10007DAB8;
  v3 = (void *)a1[7];
  v4[4] = a1[6];
  v5 = v3;
  objc_msgSend(v1, "voicemailWithIdentifier:completion:", v2, v4);

}

void sub_100021A68(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completionDispatchQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100021B10;
  v7[3] = &unk_10007DA90;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t sub_100021B10(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

BOOL sub_100021FAC(id a1, MPMessage *a2, NSDictionary *a3)
{
  return -[MPMessage messageType](a2, "messageType", a3) != (id)2;
}

id sub_1000220B8(id result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *((_QWORD *)result + 4);
  v2 = *((_QWORD *)result + 5);
  if (*(_QWORD *)(v1 + 40) != v2)
  {
    *(_QWORD *)(v1 + 40) = v2;
    return _objc_msgSend(*((id *)result + 4), "postMPVoicemailControllerUnreadMessageCountDidChangeNotification");
  }
  return result;
}

void sub_100022290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000222A8(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "senderDestinationID"));
  if (objc_msgSend(v7, "length"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "contactCache"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", v7));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

void sub_10002279C(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serialDispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100022848;
  block[3] = &unk_10007DB70;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t sub_100022848(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contactKeyDescriptors"));
  objc_msgSend(v2, "fetchContactsForMessages:keyDescriptors:", v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "fetchMetadataForMessages:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void sub_100022A28(id a1)
{
  id v1;
  void *v2;
  dispatch_queue_t v3;

  v3 = dispatch_queue_create("com.apple.mobilephone.voicemail", 0);
  v1 = objc_msgSend(objc_alloc((Class)CoreTelephonyClient), "initWithQueue:", v3);
  v2 = (void *)qword_1000922C0;
  qword_1000922C0 = (uint64_t)v1;

}

void sub_100022B28(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  unsigned int v36;
  uint64_t v37;
  id v38;
  _QWORD block[4];
  id v40;
  id v41;
  _QWORD v42[4];
  NSObject *v43;
  id v44;
  id v45;
  void *v46;
  _QWORD v47[5];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v31 = 0;
    v8 = dispatch_group_create();
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v32 = v5;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subscriptions"));
    v38 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (!v38)
      goto LABEL_20;
    v37 = *(_QWORD *)v49;
    v33 = v15;
    v34 = a1;
    while (1)
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v37)
          objc_enumerationMutation(v15);
        v17 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "context", v31));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accountManager"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "accounts"));
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_100022EE0;
        v47[3] = &unk_10007DBE0;
        v47[4] = v17;
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "tu_firstObjectPassingTest:", v47));

        if (v21)
        {
          v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accountManager"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "UUID"));
          if (-[NSObject isAccountSubscribed:](v22, "isAccountSubscribed:", v23))
          {

            goto LABEL_17;
          }
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accountManager"));
          if ((objc_opt_respondsToSelector(v24, "isCallVoicemailSupportedForAccountUUID:") & 1) == 0)
          {

LABEL_16:
            dispatch_group_enter(v8);
            v28 = *(void **)(a1 + 40);
            v42[0] = _NSConcreteStackBlock;
            v42[1] = 3221225472;
            v42[2] = sub_100022F50;
            v42[3] = &unk_10007DC08;
            v43 = v8;
            v44 = v35;
            v45 = v21;
            v46 = v17;
            objc_msgSend(v28, "getVoicemailInfo:completion:", v18, v42);

            v22 = v43;
LABEL_17:

            goto LABEL_18;
          }
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accountManager"));
          v26 = v8;
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "UUID"));
          v36 = objc_msgSend(v25, "isCallVoicemailSupportedForAccountUUID:", v27);

          v8 = v26;
          a1 = v34;

          v15 = v33;
          if (v36)
            goto LABEL_16;
        }
LABEL_18:

      }
      v38 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      if (!v38)
      {
LABEL_20:

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000230E0;
        block[3] = &unk_10007DA90;
        v29 = *(id *)(a1 + 48);
        v40 = v35;
        v41 = v29;
        v30 = v35;
        dispatch_group_notify(v8, (dispatch_queue_t)&_dispatch_main_q, block);

        v6 = v31;
        v5 = v32;
        goto LABEL_21;
      }
    }
  }
  v7 = PHDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_1000528DC((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
LABEL_21:

}

id sub_100022EE0(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "UUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "labelID"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

void sub_100022F50(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  MPLegacyVoicemail *v21;
  void *v22;
  MPLegacyVoicemail *v23;
  int v24;
  const __CFString *v25;
  __int16 v26;
  unsigned int v27;

  v8 = a3;
  v9 = a5;
  v10 = PHDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100052940((uint64_t)v9, v12, v13, v14, v15, v16, v17, v18);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if ((_DWORD)a2)
        v19 = CFSTR("YES");
      else
        v19 = CFSTR("NO");
      v24 = 138412546;
      v25 = v19;
      v26 = 1024;
      v27 = objc_msgSend(v8, "intValue");
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Voicemail info returned available=%@, count=%d", (uint8_t *)&v24, 0x12u);
    }

    v20 = *(void **)(a1 + 40);
    v21 = [MPLegacyVoicemail alloc];
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "UUID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "label"));
    v23 = -[MPLegacyVoicemail initWithAccountID:label:hasUnreadMessages:](v21, "initWithAccountID:label:hasUnreadMessages:", v12, v22, a2);
    objc_msgSend(v20, "addObject:", v23);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t sub_1000230E0(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

id sub_100023230(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactCache"));
  objc_msgSend(v2, "removeAllObjects");

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localizedSubtitleCache"));
  objc_msgSend(v3, "removeAllObjects");

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localizedTitleCache"));
  objc_msgSend(v4, "removeAllObjects");

  v5 = *(_QWORD **)(a1 + 32);
  v6 = v5[4];
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactKeyDescriptors"));
  objc_msgSend(v5, "fetchContactsForMessages:keyDescriptors:", v6, v7);

  return objc_msgSend(*(id *)(a1 + 32), "postMPVoicemailControllerMessagesDidChangeNotification");
}

id sub_10002340C(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localizedSubtitleCache"));
  objc_msgSend(v2, "removeAllObjects");

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localizedTitleCache"));
  objc_msgSend(v3, "removeAllObjects");

  return objc_msgSend(*(id *)(a1 + 32), "postMPVoicemailControllerMessagesDidChangeNotification");
}

id sub_10002359C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 144);
  *(_QWORD *)(v2 + 144) = 0;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localizedSubtitleCache"));
  objc_msgSend(v4, "removeAllObjects");

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localizedTitleCache"));
  objc_msgSend(v5, "removeAllObjects");

  return objc_msgSend(*(id *)(a1 + 32), "postMPVoicemailControllerMessagesDidChangeNotification");
}

id sub_10002373C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localizedSubtitleCache"));
  objc_msgSend(v2, "removeAllObjects");

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localizedTitleCache"));
  objc_msgSend(v3, "removeAllObjects");

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localizedDowntimeTitleCache"));
  objc_msgSend(v4, "removeAllObjects");

  return objc_msgSend(*(id *)(a1 + 32), "postMPVoicemailControllerMessagesDidChangeNotification");
}

id sub_100023AF0(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100023B44;
  v3[3] = &unk_10007DA18;
  v3[4] = v1;
  return objc_msgSend(v1, "fetchMessagesCompletion:", v3);
}

id sub_100023B44(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMessages:", a2);
}

void sub_100023BBC(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MPVoicemailControllerMessagesDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void sub_100023C74(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MPVoicemailControllerUnreadMessageCountDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void sub_100024918(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  NSAttributedStringKey v10;
  void *v11;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_accessibilityHigherContrastTintColorForColor:", a2));
  v8 = *(void **)(a1 + 40);
  v10 = NSForegroundColorAttributeName;
  v11 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  objc_msgSend(v8, "setAttributes:range:", v9, a3, a4);

}

void sub_10002831C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "metadataView"));
  objc_msgSend(v3, "setExpanded:", v2);

  v4 = *(unsigned __int8 *)(a1 + 40);
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "metadataViewTapGestureRecognizer"));
  objc_msgSend(v5, "setEnabled:", v4);

}

id sub_100028388(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "transcriptView"));
  objc_msgSend(v2, "setNeedsUpdateConstraints");

  objc_msgSend(*(id *)(a1 + 32), "setNeedsUpdateConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "transcriptView"));
  objc_msgSend(v3, "layoutIfNeeded");

  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

id PHIsInAirplaneMode()
{
  id v0;
  id v1;

  v0 = objc_alloc_init((Class)RadiosPreferences);
  v1 = objc_msgSend(v0, "airplaneMode");

  return v1;
}

void sub_1000299F0(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[UIImage tpImageForSymbolType:textStyle:scale:isStaticSize:](UIImage, "tpImageForSymbolType:textStyle:scale:isStaticSize:", 25, UIFontTextStyleBody, 3, 0));
  v2 = (void *)qword_1000922D0;
  qword_1000922D0 = v1;

}

void sub_100029A74(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[UIImage tpImageForSymbolType:textStyle:scale:isStaticSize:](UIImage, "tpImageForSymbolType:textStyle:scale:isStaticSize:", 24, UIFontTextStyleBody, 3, 0));
  v2 = (void *)qword_1000922E0;
  qword_1000922E0 = v1;

}

id PHVoicemailCellDateFormatter()
{
  void *v0;
  id v1;
  void *v2;

  v0 = (void *)qword_1000922F0;
  if (!qword_1000922F0)
  {
    v1 = objc_alloc_init((Class)NSDateFormatter);
    v2 = (void *)qword_1000922F0;
    qword_1000922F0 = (uint64_t)v1;

    objc_msgSend((id)qword_1000922F0, "setTimeStyle:", 1);
    objc_msgSend((id)qword_1000922F0, "setDateStyle:", 3);
    v0 = (void *)qword_1000922F0;
  }
  return v0;
}

id PHVoicemailDurationFormatter()
{
  if (qword_100092300 != -1)
    dispatch_once(&qword_100092300, &stru_10007DCB8);
  return (id)qword_1000922F8;
}

void sub_10002C0A4(id a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)NSDateComponentsFormatter);
  v2 = (void *)qword_1000922F8;
  qword_1000922F8 = (uint64_t)v1;

  objc_msgSend((id)qword_1000922F8, "setAllowedUnits:", 192);
  _objc_msgSend((id)qword_1000922F8, "setZeroFormattingBehavior:", 0x10000);
}

id PHVoicemailFormatTime(double a1)
{
  __CFString *v1;
  double v2;
  __CFString *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = &stru_10007F010;
  if (a1 >= 0.0)
  {
    v2 = a1;
  }
  else
  {
    v1 = CFSTR("-");
    v2 = -a1;
  }
  v3 = v1;
  v4 = PHVoicemailDurationFormatter();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromTimeInterval:", v2));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v3, v6));
  return v7;
}

float PHVoicemailLowQualityConfidenceThresholdForTranscript()
{
  id Value;
  void *v1;
  void *v2;
  float v3;
  float v4;

  Value = PHPreferencesGetValue(CFSTR("VoicemailTranscriptionLowQualityConfidenceThreshold"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(Value);
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "floatValue");
    v4 = v3;
  }
  else
  {
    v4 = 0.6878;
  }

  return v4;
}

float PHVoicemailConfidenceThresholdForTranscript()
{
  id Value;
  void *v1;
  void *v2;
  float v3;
  float v4;

  Value = PHPreferencesGetValue(CFSTR("VoicemailTranscriptionConfidenceThreshold"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(Value);
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "floatValue");
    v4 = v3;
  }
  else
  {
    v4 = 0.45096;
  }

  return v4;
}

id PHVoicemailTranscriptAttributedPrefix()
{
  if (qword_100092310 != -1)
    dispatch_once(&qword_100092310, &stru_10007DCD8);
  return (id)qword_100092308;
}

void sub_10002C280(id a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];

  v1 = objc_msgSend(UIApp, "userInterfaceLayoutDirection");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = v2;
  if (v1 == (id)1)
    v4 = CFSTR("VOICEMAIL_TRANSCRIPTION_QUOTE_SUFFIX");
  else
    v4 = CFSTR("VOICEMAIL_TRANSCRIPTION_QUOTE_PREFIX");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_10007F010, CFSTR("General")));

  v6 = objc_alloc((Class)NSAttributedString);
  v12[0] = NSForegroundColorAttributeName;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.572549045, 0.572549045, 0.572549045, 1.0));
  v13[0] = v7;
  v12[1] = NSFontAttributeName;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont phPreferredTightLeadingFontForTextStyle:](UIFont, "phPreferredTightLeadingFontForTextStyle:", UIFontTextStyleBody));
  v13[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
  v10 = objc_msgSend(v6, "initWithString:attributes:", v5, v9);
  v11 = (void *)qword_100092308;
  qword_100092308 = (uint64_t)v10;

}

id PHVoicemailTranscriptAttributedSuffix()
{
  if (qword_100092320[0] != -1)
    dispatch_once(qword_100092320, &stru_10007DCF8);
  return (id)qword_100092318;
}

void sub_10002C44C(id a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];

  v1 = objc_msgSend(UIApp, "userInterfaceLayoutDirection");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = v2;
  if (v1 == (id)1)
    v4 = CFSTR("VOICEMAIL_TRANSCRIPTION_QUOTE_PREFIX");
  else
    v4 = CFSTR("VOICEMAIL_TRANSCRIPTION_QUOTE_SUFFIX");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_10007F010, CFSTR("General")));

  v6 = objc_alloc((Class)NSAttributedString);
  v12[0] = NSForegroundColorAttributeName;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.572549045, 0.572549045, 0.572549045, 1.0));
  v13[0] = v7;
  v12[1] = NSFontAttributeName;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont phPreferredTightLeadingFontForTextStyle:](UIFont, "phPreferredTightLeadingFontForTextStyle:", UIFontTextStyleBody));
  v13[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
  v10 = objc_msgSend(v6, "initWithString:attributes:", v5, v9);
  v11 = (void *)qword_100092318;
  qword_100092318 = (uint64_t)v10;

}

uint64_t PHVoicemailFeedbackReportingAvailable()
{
  return 0;
}

uint64_t sub_10002E3E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6[46] = a5;
  v6[47] = a6;
  v6[45] = a4;
  v7 = type metadata accessor for TPTipsHelper.Entry.Kind(0);
  v6[48] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v6[49] = v8;
  v9 = (*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v6[50] = swift_task_alloc(v9);
  v6[51] = swift_task_alloc(v9);
  v10 = type metadata accessor for LiveVoicemailTip(0);
  v6[52] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v6[53] = v11;
  v12 = (*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v6[54] = swift_task_alloc(v12);
  v6[55] = swift_task_alloc(v12);
  v13 = sub_100031408(&qword_100091140);
  v6[56] = v13;
  v6[57] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v13 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_100031408(&qword_100091148);
  v6[58] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v14 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100031408(&qword_100091150);
  v6[59] = v15;
  v16 = *(_QWORD *)(v15 - 8);
  v6[60] = v16;
  v6[61] = swift_task_alloc((*(_QWORD *)(v16 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_100031408(&qword_100091158);
  v6[62] = v17;
  v18 = *(_QWORD *)(v17 - 8);
  v6[63] = v18;
  v6[64] = swift_task_alloc((*(_QWORD *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for MainActor(0);
  v6[65] = v19;
  v6[66] = static MainActor.shared.getter(v19);
  v20 = dispatch thunk of Actor.unownedExecutor.getter(v19, &protocol witness table for MainActor);
  v6[67] = v20;
  v6[68] = v21;
  return swift_task_switch(sub_10002E574, v20, v21);
}

uint64_t sub_10002E574()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *, uint64_t);

  v1 = *(_QWORD *)(v0 + 480);
  v2 = *(_QWORD *)(v0 + 488);
  v3 = *(_QWORD *)(v0 + 464);
  v4 = *(_QWORD *)(v0 + 472);
  v5 = *(_QWORD *)(v0 + 448);
  v6 = *(_QWORD *)(v0 + 416);
  v16 = *(_QWORD *)(v0 + 368) + 16;
  v7 = sub_1000316E0(&qword_100091138, (uint64_t (*)(uint64_t))&type metadata accessor for LiveVoicemailTip, (uint64_t)&protocol conformance descriptor for LiveVoicemailTip);
  *(_QWORD *)(v0 + 552) = v7;
  Tip.shouldDisplayUpdates.getter(v6, v7);
  AsyncMapSequence.base.getter(v4);
  v8 = sub_100031720(&qword_100091160, &qword_100091140, (uint64_t)&protocol conformance descriptor for AsyncStream<A>);
  dispatch thunk of AsyncSequence.makeAsyncIterator()(v5, v8);
  v9 = AsyncMapSequence.transform.getter(v4);
  v11 = v10;
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v4);
  AsyncMapSequence.Iterator.init(_:transform:)(v3, v9, v11, v5, &type metadata for Bool, v8);
  v12 = swift_beginAccess(v16, v0 + 288, 0, 0);
  *(_DWORD *)(v0 + 632) = enum case for TPTipsHelper.Entry.Kind.voicemailDetail(_:);
  v13 = static MainActor.shared.getter(v12);
  *(_QWORD *)(v0 + 560) = v13;
  v17 = (uint64_t (*)(uint64_t, void *, uint64_t))((char *)&dword_100091168 + dword_100091168);
  v14 = (_QWORD *)swift_task_alloc(unk_10009116C);
  *(_QWORD *)(v0 + 568) = v14;
  *v14 = v0;
  v14[1] = sub_10002E718;
  return v17(v13, &protocol witness table for MainActor, v0 + 336);
}

uint64_t sub_10002E718(char a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 568);
  v4 = *(_QWORD *)(*v1 + 560);
  *(_BYTE *)(*v1 + 636) = a1;
  swift_task_dealloc(v3);
  swift_release(v4);
  return swift_task_switch(sub_10002E780, *(_QWORD *)(v2 + 536), *(_QWORD *)(v2 + 544));
}

uint64_t sub_10002E780()
{
  uint64_t v0;
  void *Strong;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  _QWORD *v52;
  uint64_t (*v53)(uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  void (*v60)(_QWORD *, uint64_t, uint64_t);
  uint64_t v61;
  uint64_t v62;
  id v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  if (*(_BYTE *)(v0 + 636) == 2
    || (Strong = (void *)swift_unknownObjectWeakLoadStrong(*(_QWORD *)(v0 + 368) + 16),
        (*(_QWORD *)(v0 + 576) = Strong) == 0))
  {
    v22 = *(_QWORD *)(v0 + 528);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 504) + 8))(*(_QWORD *)(v0 + 512), *(_QWORD *)(v0 + 496));
    swift_release(v22);
LABEL_9:
    v23 = *(_QWORD *)(v0 + 488);
    v25 = *(_QWORD *)(v0 + 456);
    v24 = *(_QWORD *)(v0 + 464);
    v27 = *(_QWORD *)(v0 + 432);
    v26 = *(_QWORD *)(v0 + 440);
    v29 = *(_QWORD *)(v0 + 400);
    v28 = *(_QWORD *)(v0 + 408);
    swift_task_dealloc(*(_QWORD *)(v0 + 512));
    swift_task_dealloc(v23);
    swift_task_dealloc(v24);
    swift_task_dealloc(v25);
    swift_task_dealloc(v26);
    swift_task_dealloc(v27);
    swift_task_dealloc(v28);
    swift_task_dealloc(v29);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  if ((*(_BYTE *)(v0 + 636) & 1) == 0)
  {
    if (qword_100091078 != -1)
      swift_once(&qword_100091078, sub_1000516E4);
    v3 = *(_QWORD *)(v0 + 440);
    v5 = *(_QWORD *)(v0 + 416);
    v4 = *(_QWORD *)(v0 + 424);
    v6 = *(_QWORD *)(v0 + 360);
    v7 = type metadata accessor for Logger(0, v2);
    sub_100030760(v7, (uint64_t)qword_100092EA8);
    v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
    v9 = Logger.logObject.getter(v8);
    v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v10))
    {
      v74 = *(_QWORD *)(v0 + 552);
      v11 = *(_QWORD *)(v0 + 440);
      v12 = *(_QWORD *)(v0 + 416);
      v77 = *(_QWORD *)(v0 + 424);
      v13 = *(_QWORD *)(v0 + 376);
      v14 = swift_slowAlloc(22, -1);
      v15 = swift_slowAlloc(64, -1);
      v79 = v15;
      *(_DWORD *)v14 = 136315394;
      v16 = _typeName(_:qualified:)(v13, 0);
      v18 = v17;
      *(_QWORD *)(v0 + 328) = sub_10004DF18(v16, v17, &v79);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 328, v0 + 336, v14 + 4, v14 + 12);
      swift_bridgeObjectRelease(v18);
      *(_WORD *)(v14 + 12) = 2080;
      v19 = dispatch thunk of Tip.id.getter(v12, v74);
      v21 = v20;
      *(_QWORD *)(v0 + 320) = sub_10004DF18(v19, v20, &v79);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 320, v0 + 328, v14 + 14, v14 + 22);
      swift_bridgeObjectRelease(v21);
      (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v11, v12);
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "%s: Stopping observation of tip %s", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy(v15, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v15, -1, -1);
      swift_slowDealloc(v14, -1, -1);
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 424) + 8))(*(_QWORD *)(v0 + 440), *(_QWORD *)(v0 + 416));
    }

    type metadata accessor for TPTipsHelper(0);
    v52 = (_QWORD *)swift_task_alloc(async function pointer to static TPTipsHelper.shared.getter[1]);
    *(_QWORD *)(v0 + 616) = v52;
    v53 = sub_10002F0B8;
    goto LABEL_18;
  }
  v31 = Strong;
  v32 = objc_msgSend(Strong, "voicemailTipView");

  if (v32)
  {
    swift_release(*(_QWORD *)(v0 + 528));
    if (qword_100091078 != -1)
      swift_once(&qword_100091078, sub_1000516E4);
    v34 = *(_QWORD *)(v0 + 424);
    v35 = *(_QWORD *)(v0 + 432);
    v36 = *(_QWORD *)(v0 + 416);
    v37 = *(_QWORD *)(v0 + 360);
    v38 = type metadata accessor for Logger(0, v33);
    sub_100030760(v38, (uint64_t)qword_100092EA8);
    v39 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v35, v37, v36);
    v40 = Logger.logObject.getter(v39);
    v41 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v40, v41))
    {
      v72 = *(_QWORD *)(v0 + 552);
      v75 = *(_QWORD *)(v0 + 504);
      v76 = *(_QWORD *)(v0 + 496);
      v78 = *(_QWORD *)(v0 + 512);
      v71 = *(_QWORD *)(v0 + 432);
      v42 = *(_QWORD *)(v0 + 416);
      v73 = *(_QWORD *)(v0 + 424);
      v43 = *(_QWORD *)(v0 + 376);
      v44 = swift_slowAlloc(22, -1);
      v45 = swift_slowAlloc(64, -1);
      v79 = v45;
      *(_DWORD *)v44 = 136315394;
      v46 = _typeName(_:qualified:)(v43, 0);
      v48 = v47;
      *(_QWORD *)(v0 + 312) = sub_10004DF18(v46, v47, &v79);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 312, v0 + 320, v44 + 4, v44 + 12);
      swift_bridgeObjectRelease(v48);
      *(_WORD *)(v44 + 12) = 2080;
      v49 = dispatch thunk of Tip.id.getter(v42, v72);
      v51 = v50;
      *(_QWORD *)(v0 + 352) = sub_10004DF18(v49, v50, &v79);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 352, v0 + 360, v44 + 14, v44 + 22);
      swift_bridgeObjectRelease(v51);
      (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v71, v42);
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "%s: Already tracking tip %s, ignoring to add new one.", (uint8_t *)v44, 0x16u);
      swift_arrayDestroy(v45, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v45, -1, -1);
      swift_slowDealloc(v44, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v78, v76);
    }
    else
    {
      v66 = *(_QWORD *)(v0 + 504);
      v65 = *(_QWORD *)(v0 + 512);
      v67 = *(_QWORD *)(v0 + 496);
      v69 = *(_QWORD *)(v0 + 424);
      v68 = *(_QWORD *)(v0 + 432);
      v70 = *(_QWORD *)(v0 + 416);

      (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v68, v70);
      (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v65, v67);
    }
    goto LABEL_9;
  }
  v54 = *(_QWORD *)(v0 + 552);
  v55 = *(_QWORD *)(v0 + 416);
  v56 = *(_QWORD *)(v0 + 424);
  v57 = *(_QWORD *)(v0 + 376);
  v58 = *(_QWORD *)(v0 + 360);
  *(_QWORD *)(v0 + 200) = v55;
  *(_QWORD *)(v0 + 208) = v54;
  v59 = sub_100031594((_QWORD *)(v0 + 176));
  v60 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v56 + 16);
  *(_QWORD *)(v0 + 584) = v60;
  v60(v59, v58, v55);
  v61 = swift_allocObject(&unk_10007DEA8, 24, 7);
  swift_unknownObjectWeakInit(v61 + 16, v31);
  v62 = swift_allocObject(&unk_10007DF20, 32, 7);
  *(_QWORD *)(v62 + 16) = v61;
  *(_QWORD *)(v62 + 24) = v57;
  v63 = objc_allocWithZone((Class)type metadata accessor for TipUIView(0));
  v64 = (void *)TipUIView.init(_:arrowEdge:actionHandler:)(v0 + 176, 4, sub_1000316D8, v62);
  *(_QWORD *)(v0 + 592) = v64;
  objc_msgSend(v64, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  type metadata accessor for TPTipsHelper(0);
  v52 = (_QWORD *)swift_task_alloc(async function pointer to static TPTipsHelper.shared.getter[1]);
  *(_QWORD *)(v0 + 600) = v52;
  v53 = sub_10002EDD4;
LABEL_18:
  *v52 = v0;
  v52[1] = v53;
  return static TPTipsHelper.shared.getter();
}

uint64_t sub_10002EDD4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 600);
  *(_QWORD *)(*v1 + 608) = a1;
  swift_task_dealloc(v3);
  return swift_task_switch(sub_10002EE30, *(_QWORD *)(v2 + 536), *(_QWORD *)(v2 + 544));
}

uint64_t sub_10002EE30()
{
  uint64_t v0;
  void (*v1)(_QWORD *, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void (*v6)(uint64_t, _QWORD);
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  void (*v20)(unint64_t, _QWORD);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t (*v31)(uint64_t, uint64_t);
  uint64_t v32;

  v1 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v0 + 584);
  v2 = *(_QWORD *)(v0 + 552);
  v3 = *(_QWORD *)(v0 + 416);
  v4 = *(_QWORD *)(v0 + 360);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 392) + 104))(*(_QWORD *)(v0 + 408), *(unsigned int *)(v0 + 632), *(_QWORD *)(v0 + 384));
  *(_QWORD *)(v0 + 240) = v3;
  *(_QWORD *)(v0 + 248) = v2;
  v5 = sub_100031594((_QWORD *)(v0 + 216));
  v1(v5, v4, v3);
  v6 = (void (*)(uint64_t, _QWORD))dispatch thunk of TPTipsHelper.currentTip.modify(v0 + 256);
  v8 = v7;
  if (*(_QWORD *)(v0 + 240))
  {
    v9 = *(_QWORD *)(v0 + 408);
    v10 = *(_QWORD *)(v0 + 384);
    v11 = *(_QWORD *)(v0 + 392);
    sub_100031678((__int128 *)(v0 + 216), v0 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v8);
    v32 = *v8;
    *v8 = 0x8000000000000000;
    sub_100030D50((__int128 *)(v0 + 16), v9, isUniquelyReferenced_nonNull_native);
    v13 = *v8;
    *v8 = v32;
    swift_bridgeObjectRelease(v13);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  else
  {
    v14 = *(_QWORD *)(v0 + 408);
    sub_100031760(v0 + 216, &qword_100091170);
    v15 = *v8;
    swift_bridgeObjectRetain(*v8);
    v16 = sub_100048540(v14);
    LOBYTE(v14) = v17;
    swift_bridgeObjectRelease(v15);
    if ((v14 & 1) != 0)
    {
      v18 = swift_isUniquelyReferenced_nonNull_native(*v8);
      *(_QWORD *)(v0 + 344) = *v8;
      *v8 = 0x8000000000000000;
      if ((v18 & 1) == 0)
        sub_100035B20();
      v19 = *(_QWORD *)(v0 + 392);
      v20 = *(void (**)(unint64_t, _QWORD))(v19 + 8);
      v20(*(_QWORD *)(*(_QWORD *)(v0 + 344) + 48) + *(_QWORD *)(v19 + 72) * v16, *(_QWORD *)(v0 + 384));
      v21 = *(_QWORD *)(v0 + 344);
      sub_100031678((__int128 *)(*(_QWORD *)(v21 + 56) + 40 * v16), v0 + 56);
      sub_100030AA4(v16, v21);
      v22 = *v8;
      *v8 = v21;
      swift_bridgeObjectRelease(v22);
    }
    else
    {
      v23 = *(_QWORD *)(v0 + 392);
      *(_OWORD *)(v0 + 56) = 0u;
      *(_OWORD *)(v0 + 72) = 0u;
      *(_QWORD *)(v0 + 88) = 0;
      v20 = *(void (**)(unint64_t, _QWORD))(v23 + 8);
    }
    v20(*(_QWORD *)(v0 + 408), *(_QWORD *)(v0 + 384));
    sub_100031760(v0 + 56, &qword_100091170);
  }
  v24 = *(void **)(v0 + 608);
  v25 = *(void **)(v0 + 592);
  v26 = *(void **)(v0 + 576);
  v6(v0 + 256, 0);

  objc_msgSend(v26, "setVoicemailTipView:", v25);
  v28 = static MainActor.shared.getter(v27);
  *(_QWORD *)(v0 + 560) = v28;
  v31 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_100091168 + dword_100091168);
  v29 = (_QWORD *)swift_task_alloc(unk_10009116C);
  *(_QWORD *)(v0 + 568) = v29;
  *v29 = v0;
  v29[1] = sub_10002E718;
  return v31(v28, (uint64_t)&protocol witness table for MainActor);
}

uint64_t sub_10002F0B8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 616);
  *(_QWORD *)(*v1 + 624) = a1;
  swift_task_dealloc(v3);
  return swift_task_switch(sub_10002F114, *(_QWORD *)(v2 + 536), *(_QWORD *)(v2 + 544));
}

uint64_t sub_10002F114()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  char v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v1 = *(void **)(v0 + 624);
  v2 = *(unsigned int *)(v0 + 632);
  v4 = *(_QWORD *)(v0 + 392);
  v3 = *(_QWORD *)(v0 + 400);
  v5 = *(_QWORD *)(v0 + 384);
  swift_release(*(_QWORD *)(v0 + 528));
  v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 104))(v3, v2, v5);
  v7 = dispatch thunk of TPTipsHelper.currentTip.getter(v6);

  if (*(_QWORD *)(v7 + 16) && (v8 = sub_100048540(*(_QWORD *)(v0 + 400)), (v9 & 1) != 0))
  {
    sub_1000315D0(*(_QWORD *)(v7 + 56) + 40 * v8, v0 + 136);
  }
  else
  {
    *(_QWORD *)(v0 + 168) = 0;
    *(_OWORD *)(v0 + 136) = 0u;
    *(_OWORD *)(v0 + 152) = 0u;
  }
  v11 = *(_QWORD *)(v0 + 392);
  v10 = *(_QWORD *)(v0 + 400);
  v12 = *(_QWORD *)(v0 + 384);
  swift_bridgeObjectRelease(v7);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  if (*(_QWORD *)(v0 + 160))
  {
    v13 = *(_QWORD *)(v0 + 552);
    v14 = *(_QWORD *)(v0 + 416);
    sub_100031678((__int128 *)(v0 + 136), v0 + 96);
    v15 = *(_QWORD *)(v0 + 120);
    v16 = *(_QWORD *)(v0 + 128);
    sub_100031690((_QWORD *)(v0 + 96), v15);
    v17 = dispatch thunk of Tip.id.getter(v15, v16);
    v19 = v18;
    v21 = dispatch thunk of Tip.id.getter(v14, v13);
    v22 = v20;
    if (v17 == v21 && v19 == v20)
    {
      swift_bridgeObjectRelease_n(v19, 2);
    }
    else
    {
      v24 = _stringCompareWithSmolCheck(_:_:expecting:)(v17, v19, v21, v20, 0);
      swift_bridgeObjectRelease(v22);
      swift_bridgeObjectRelease(v19);
      if ((v24 & 1) == 0)
      {
        v30 = *(void **)(v0 + 576);
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 504) + 8))(*(_QWORD *)(v0 + 512), *(_QWORD *)(v0 + 496));

        goto LABEL_13;
      }
    }
    v25 = *(void **)(v0 + 576);
    v27 = *(_QWORD *)(v0 + 504);
    v26 = *(_QWORD *)(v0 + 512);
    v28 = *(_QWORD *)(v0 + 496);
    v29 = objc_msgSend(v25, "voicemailTipView");
    objc_msgSend(v29, "removeFromSuperview");

    objc_msgSend(v25, "setVoicemailTipView:", 0);
    objc_msgSend(v25, "loadExpandedViewsIfNecessary");

    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
LABEL_13:
    sub_100031614((_QWORD *)(v0 + 96));
    goto LABEL_14;
  }
  v23 = *(void **)(v0 + 576);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 504) + 8))(*(_QWORD *)(v0 + 512), *(_QWORD *)(v0 + 496));

  sub_100031760(v0 + 136, &qword_100091170);
LABEL_14:
  v31 = *(_QWORD *)(v0 + 488);
  v33 = *(_QWORD *)(v0 + 456);
  v32 = *(_QWORD *)(v0 + 464);
  v35 = *(_QWORD *)(v0 + 432);
  v34 = *(_QWORD *)(v0 + 440);
  v37 = *(_QWORD *)(v0 + 400);
  v36 = *(_QWORD *)(v0 + 408);
  swift_task_dealloc(*(_QWORD *)(v0 + 512));
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002F3AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3[7] = a2;
  v3[8] = v2;
  v3[6] = a1;
  v6 = sub_100031408(&qword_100091158);
  v3[9] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v3[10] = v7;
  v3[11] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100031408(&qword_100091180);
  v3[12] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v8 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Tips.Status(0);
  v3[13] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v3[14] = v10;
  v3[15] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    ObjectType = swift_getObjectType(a1);
    v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, a2);
    v14 = v13;
  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  v3[16] = v12;
  v3[17] = v14;
  return swift_task_switch(sub_10002F49C, v12, v14);
}

uint64_t sub_10002F49C()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[18] = AsyncMapSequence.Iterator.baseIterator.modify(v0 + 2, v0[9]);
  sub_100031408(&qword_100091148);
  sub_100031720(&qword_100091188, &qword_100091148, (uint64_t)&protocol conformance descriptor for AsyncStream<A>.Iterator);
  v1 = (_QWORD *)swift_task_alloc(_sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTjTu[1]);
  v0[19] = v1;
  *v1 = v0;
  v1[1] = sub_10002F544;
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v0[12], v0[6], v0[7]);
}

uint64_t sub_10002F544()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v2 = *v1;
  swift_task_dealloc(*(_QWORD *)(*v1 + 152));
  if (v0)
  {
    v3 = *(_QWORD *)(v2 + 128);
    v4 = *(_QWORD *)(v2 + 136);
    v5 = sub_10002F708;
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v2 + 144))(v2 + 16, 0);
    v3 = *(_QWORD *)(v2 + 128);
    v4 = *(_QWORD *)(v2 + 136);
    v5 = sub_10002F5B4;
  }
  return swift_task_switch(v5, v3, v4);
}

uint64_t sub_10002F5B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  _QWORD *v13;
  int *v14;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 96);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_100031760(v3, &qword_100091180);
    v4 = *(_QWORD *)(v0 + 88);
    v5 = *(_QWORD *)(v0 + 96);
    swift_task_dealloc(*(_QWORD *)(v0 + 120));
    swift_task_dealloc(v5);
    swift_task_dealloc(v4);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(2);
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 80);
    v7 = *(_QWORD *)(v0 + 88);
    v10 = *(_QWORD *)(v0 + 64);
    v9 = *(_QWORD *)(v0 + 72);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v2 + 32))(*(_QWORD *)(v0 + 120), v3, v1);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v10, v9);
    v11 = (int *)AsyncMapSequence.Iterator.transform.getter(v9);
    *(_QWORD *)(v0 + 160) = v12;
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    v14 = (int *)((char *)v11 + *v11);
    v13 = (_QWORD *)swift_task_alloc(v11[1]);
    *(_QWORD *)(v0 + 168) = v13;
    *v13 = v0;
    v13[1] = sub_10002F76C;
    return ((uint64_t (*)(uint64_t, _QWORD))v14)(v0 + 176, *(_QWORD *)(v0 + 120));
  }
}

uint64_t sub_10002F708()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  (*(void (**)(uint64_t, uint64_t))(v0 + 144))(v0 + 16, 1);
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002F76C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 160);
  v4 = *(_QWORD *)(*v0 + 112);
  v3 = *(_QWORD *)(*v0 + 120);
  v5 = *(_QWORD *)(*v0 + 104);
  swift_task_dealloc(*(_QWORD *)(*v0 + 168));
  swift_release(v2);
  *(_BYTE *)(v1 + 177) = *(_BYTE *)(v1 + 176);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  return swift_task_switch(sub_10002F7F0, *(_QWORD *)(v1 + 128), *(_QWORD *)(v1 + 136));
}

uint64_t sub_10002F7F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(unsigned __int8 *)(v0 + 177);
  v3 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  swift_task_dealloc(*(_QWORD *)(v0 + 120));
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

void sub_10002F848(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t Strong;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[24];

  v4 = a2 + 16;
  swift_beginAccess(a2 + 16, v21, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v4);
  if (Strong)
  {
    v7 = (void *)Strong;
    if (qword_100091078 != -1)
      swift_once(&qword_100091078, sub_1000516E4);
    v8 = type metadata accessor for Logger(0, v6);
    v9 = sub_100030760(v8, (uint64_t)qword_100092EA8);
    v10 = Logger.logObject.getter(v9);
    v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(12, -1);
      v13 = swift_slowAlloc(32, -1);
      v20 = v13;
      *(_DWORD *)v12 = 136315138;
      v14 = _typeName(_:qualified:)(a3, 0);
      v16 = v15;
      v19 = sub_10004DF18(v14, v15, &v20);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v19, &v20, v12 + 4, v12 + 12);
      swift_bridgeObjectRelease(v16);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "%s: Calling voicemailMessageTableViewCellShouldPresentWelcomeViewController", v12, 0xCu);
      swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v13, -1, -1);
      swift_slowDealloc(v12, -1, -1);
    }

    v17 = objc_msgSend(v7, "delegate");
    if (v17)
    {
      v18 = v17;
      if ((objc_msgSend(v17, "respondsToSelector:", "voicemailMessageTableViewCellShouldPresentWelcomeViewController:") & 1) != 0)objc_msgSend(v18, "voicemailMessageTableViewCellShouldPresentWelcomeViewController:", v7);

      swift_unknownObjectRelease(v18);
    }
    else
    {

    }
  }
}

uint64_t sub_10002FA40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t ObjectType;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v1 = v0;
  ObjectType = swift_getObjectType(v0);
  if (qword_100091078 != -1)
    swift_once(&qword_100091078, sub_1000516E4);
  v4 = type metadata accessor for Logger(0, v2);
  v5 = sub_100030760(v4, (uint64_t)qword_100092EA8);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v18 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = _typeName(_:qualified:)(ObjectType, 0);
    v12 = v11;
    v17 = sub_10004DF18(v10, v11, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v17, &v18, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease(v12);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s: Starting observation of tips", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);
  }

  type metadata accessor for TPTipsHelper(0);
  v13 = static TPTipsHelper.taskQueue.getter();
  v14 = swift_allocObject(&unk_10007DEA8, 24, 7);
  swift_unknownObjectWeakInit(v14 + 16, v1);
  v15 = swift_allocObject(&unk_10007DED0, 32, 7);
  *(_QWORD *)(v15 + 16) = v14;
  *(_QWORD *)(v15 + 24) = ObjectType;
  swift_retain(v14);
  dispatch thunk of TaskQueue.async(_:)(&unk_100091110, v15);
  swift_release(v13);
  swift_release(v14);
  return swift_release(v15);
}

uint64_t sub_10002FC4C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2[7] = a1;
  v2[8] = a2;
  v3 = type metadata accessor for LiveVoicemailTip(0);
  v2[9] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[10] = v4;
  v2[11] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TPTipsHelper(0);
  v5 = (_QWORD *)swift_task_alloc(async function pointer to static TPTipsHelper.shared.getter[1]);
  v2[12] = v5;
  *v5 = v2;
  v5[1] = sub_10002FCCC;
  return static TPTipsHelper.shared.getter();
}

uint64_t sub_10002FCCC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 96);
  *(_QWORD *)(*(_QWORD *)v1 + 104) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_10002FD28, 0, 0);
}

uint64_t sub_10002FD28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 112) = v1;
  *(_QWORD *)(v0 + 120) = static MainActor.shared.getter(v1);
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_10002FD94, v2, v3);
}

uint64_t sub_10002FD94()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 104);
  v2 = swift_release(*(_QWORD *)(v0 + 120));
  dispatch thunk of TPTipsHelper.setup()(v2);

  return swift_task_switch(sub_10002FDDC, 0, 0);
}

uint64_t sub_10002FDDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t Strong;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;

  v1 = *(_QWORD *)(v0 + 56) + 16;
  swift_beginAccess(v1, v0 + 16, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  *(_QWORD *)(v0 + 128) = Strong;
  if (Strong)
  {
    if (qword_100091078 != -1)
      swift_once(&qword_100091078, sub_1000516E4);
    v4 = type metadata accessor for Logger(0, v3);
    v5 = sub_100030760(v4, (uint64_t)qword_100092EA8);
    v6 = Logger.logObject.getter(v5);
    v7 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = *(_QWORD *)(v0 + 64);
      v9 = (uint8_t *)swift_slowAlloc(12, -1);
      v10 = swift_slowAlloc(32, -1);
      v27 = v10;
      *(_DWORD *)v9 = 136315138;
      v11 = _typeName(_:qualified:)(v8, 0);
      v13 = v12;
      *(_QWORD *)(v0 + 48) = sub_10004DF18(v11, v12, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 48, v0 + 56, v9 + 4, v9 + 12);
      swift_bridgeObjectRelease(v13);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s: Observing LiveVoicemailTip", v9, 0xCu);
      swift_arrayDestroy(v10, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v10, -1, -1);
      swift_slowDealloc(v9, -1, -1);
    }

    v14 = LiveVoicemailTip.init()();
    *(_QWORD *)(v0 + 136) = static MainActor.shared.getter(v14);
    v15 = (_QWORD *)swift_task_alloc(dword_10009111C);
    *(_QWORD *)(v0 + 144) = v15;
    *v15 = v0;
    v15[1] = sub_100030134;
    return sub_100030F74(*(_QWORD *)(v0 + 88));
  }
  else
  {
    if (qword_100091078 != -1)
      swift_once(&qword_100091078, sub_1000516E4);
    v17 = type metadata accessor for Logger(0, v3);
    v18 = sub_100030760(v17, (uint64_t)qword_100092EA8);
    v19 = Logger.logObject.getter(v18);
    v20 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = *(_QWORD *)(v0 + 64);
      v22 = (uint8_t *)swift_slowAlloc(12, -1);
      v23 = swift_slowAlloc(32, -1);
      v27 = v23;
      *(_DWORD *)v22 = 136315138;
      v24 = _typeName(_:qualified:)(v21, 0);
      v26 = v25;
      *(_QWORD *)(v0 + 40) = sub_10004DF18(v24, v25, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48, v22 + 4, v22 + 12);
      swift_bridgeObjectRelease(v26);
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "%s: Observing tip failed because self is nil", v22, 0xCu);
      swift_arrayDestroy(v23, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v23, -1, -1);
      swift_slowDealloc(v22, -1, -1);
    }

    swift_task_dealloc(*(_QWORD *)(v0 + 88));
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_100030134()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 112);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 144));
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_1000301A4, v2, v3);
}

uint64_t sub_1000301A4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v0[10];
  v1 = v0[11];
  v3 = v0[9];
  swift_release(v0[17]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return swift_task_switch(sub_100030200, 0, 0);
}

uint64_t sub_100030200()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(v0 + 88));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100030270()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  ObjectType = swift_getObjectType(v0);
  if (qword_100091078 != -1)
    swift_once(&qword_100091078, sub_1000516E4);
  v3 = type metadata accessor for Logger(0, v1);
  v4 = sub_100030760(v3, (uint64_t)qword_100092EA8);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    v8 = swift_slowAlloc(32, -1);
    v15 = v8;
    *(_DWORD *)v7 = 136315138;
    v9 = _typeName(_:qualified:)(ObjectType, 0);
    v11 = v10;
    v14 = sub_10004DF18(v9, v10, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, &v15, v7 + 4, v7 + 12);
    swift_bridgeObjectRelease(v11);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s: Stopping observation of tips", v7, 0xCu);
    swift_arrayDestroy(v8, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);
  }

  type metadata accessor for TPTipsHelper(0);
  v12 = static TPTipsHelper.taskQueue.getter();
  dispatch thunk of TaskQueue.async(_:)(&unk_100091100, 0);
  return swift_release(v12);
}

uint64_t sub_100030418()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = type metadata accessor for TPTipsHelper.Entry.Kind(0);
  v0[2] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[3] = v2;
  v0[4] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TPTipsHelper(0);
  v3 = (_QWORD *)swift_task_alloc(async function pointer to static TPTipsHelper.shared.getter[1]);
  v0[5] = v3;
  *v3 = v0;
  v3[1] = sub_100030494;
  return static TPTipsHelper.shared.getter();
}

uint64_t sub_100030494(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 40);
  *(_QWORD *)(*(_QWORD *)v1 + 48) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_1000304F0, 0, 0);
}

uint64_t sub_1000304F0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[3] + 104))(v0[4], enum case for TPTipsHelper.Entry.Kind.voicemailDetail(_:), v0[2]);
  v1 = type metadata accessor for MainActor(0);
  v0[7] = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100030574, v2, v3);
}

uint64_t sub_100030574()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void **)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 16);
  swift_release(*(_QWORD *)(v0 + 56));
  dispatch thunk of TPTipsHelper.removeEntries(_:)(v2);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void type metadata accessor for VMTranscriptConfidenceRating(uint64_t a1)
{
  sub_1000317B0(a1, &qword_100091098, (uint64_t)&unk_10007DE88);
}

uint64_t sub_100030624(uint64_t a1, uint64_t a2)
{
  return sub_100030874(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100030630(uint64_t a1, id *a2)
{
  uint64_t result;
  uint64_t v5;
  NSString v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  v5 = v8;
  if (v8)
  {
    v6 = String._bridgeToObjectiveC()();
    result = swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return result;
}

uint64_t sub_1000306A4(uint64_t a1, id *a2)
{
  char v4;
  uint64_t v5;
  NSString v6;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  v5 = v9;
  if (v9)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_100030720@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a1 = v4;
  return result;
}

uint64_t sub_100030760(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_100030778@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  NSString v4;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_1000307BC@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000307E4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1000316E0(&qword_1000911B0, (uint64_t (*)(uint64_t))type metadata accessor for Name, (uint64_t)&unk_100075A10);
  v3 = sub_1000316E0(&qword_1000911B8, (uint64_t (*)(uint64_t))type metadata accessor for Name, (uint64_t)&unk_1000759B0);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100030868(uint64_t a1, uint64_t a2)
{
  return sub_100030874(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100030874(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  v7 = v6;
  v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_1000308B0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_1000308F0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  _QWORD v8[9];

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_100030960(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    v10 = 1;
    v9 = v5;
  }
  else
  {
    v9 = v7;
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);
  }
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

uint64_t sub_1000309E8()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100030A0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc(dword_10009110C);
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_100030A5C;
  return sub_10002FC4C(v2, v3);
}

uint64_t sub_100030A5C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_100030AA4(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  __int128 *v28;
  __int128 v29;
  __int128 v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, unint64_t, uint64_t);
  unint64_t v39;
  uint64_t v40;

  v4 = type metadata accessor for TPTipsHelper.Entry.Kind(0);
  v40 = *(_QWORD *)(v4 - 8);
  result = __chkstk_darwin(v4);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = _HashTable.previousHole(before:)(a1, a2 + 64, ~v9);
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v39 = (result + 1) & v11;
      v12 = *(_QWORD *)(v40 + 72);
      v38 = *(void (**)(char *, unint64_t, uint64_t))(v40 + 16);
      v13 = v11;
      do
      {
        v14 = v8;
        v15 = v12;
        v16 = v12 * v10;
        v17 = v13;
        v38(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        v18 = *(_QWORD *)(a2 + 40);
        v19 = sub_1000316E0(&qword_100091178, (uint64_t (*)(uint64_t))&type metadata accessor for TPTipsHelper.Entry.Kind, (uint64_t)&protocol conformance descriptor for TPTipsHelper.Entry.Kind);
        v20 = dispatch thunk of Hashable._rawHashValue(seed:)(v18, v4, v19);
        result = (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v7, v4);
        v13 = v17;
        v21 = v20 & v17;
        if (a1 >= (uint64_t)v39)
        {
          if (v21 >= v39 && a1 >= (uint64_t)v21)
          {
LABEL_16:
            v24 = *(_QWORD *)(a2 + 48);
            result = v24 + v15 * a1;
            v25 = v24 + v16;
            v8 = v14;
            if (v15 * a1 < v16 || (v12 = v15, result >= v25 + v15))
            {
              result = swift_arrayInitWithTakeFrontToBack(result, v25, 1, v4);
LABEL_21:
              v13 = v17;
              v12 = v15;
            }
            else if (v15 * a1 != v16)
            {
              result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_21;
            }
            v26 = *(_QWORD *)(a2 + 56);
            v27 = v26 + 40 * a1;
            v28 = (__int128 *)(v26 + 40 * v10);
            if (a1 != v10 || (a1 = v10, v27 >= (unint64_t)v28 + 40))
            {
              v29 = *v28;
              v30 = v28[1];
              *(_QWORD *)(v27 + 32) = *((_QWORD *)v28 + 4);
              *(_OWORD *)v27 = v29;
              *(_OWORD *)(v27 + 16) = v30;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v21 >= v39 || a1 >= (uint64_t)v21)
        {
          goto LABEL_16;
        }
        v8 = v14;
        v12 = v15;
LABEL_5:
        v10 = (v10 + 1) & v13;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v31 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v32 = *v31;
    v33 = (-1 << a1) - 1;
  }
  else
  {
    v31 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v33 = *v31;
    v32 = (-1 << a1) - 1;
  }
  *v31 = v33 & v32;
  v34 = *(_QWORD *)(a2 + 16);
  v35 = __OFSUB__(v34, 1);
  v36 = v34 - 1;
  if (v35)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v36;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_100030D50(__int128 *a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t v25;

  v4 = (_QWORD **)v3;
  v8 = type metadata accessor for TPTipsHelper.Entry.Kind(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_100048540(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }
  else
  {
    v18 = v13;
    v19 = v12[3];
    if (v19 >= v17 && (a3 & 1) != 0)
    {
LABEL_7:
      v20 = *v4;
      if ((v18 & 1) != 0)
      {
LABEL_8:
        v21 = (_QWORD *)(v20[7] + 40 * v14);
        sub_100031614(v21);
        return sub_100031678(a1, (uint64_t)v21);
      }
      goto LABEL_11;
    }
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_100035B20();
      goto LABEL_7;
    }
    sub_1000354A4(v17, a3 & 1);
    v23 = sub_100048540(a2);
    if ((v18 & 1) == (v24 & 1))
    {
      v14 = v23;
      v20 = *v4;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_100030ED0(v14, (uint64_t)v11, a1, v20);
    }
  }
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v8);
  __break(1u);
  return result;
}

uint64_t sub_100030ED0(unint64_t a1, uint64_t a2, __int128 *a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = type metadata accessor for TPTipsHelper.Entry.Kind(0);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  result = sub_100031678(a3, a4[7] + 40 * a1);
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

uint64_t sub_100030F74(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2[12] = a1;
  v2[13] = v1;
  v2[14] = swift_getObjectType(v1);
  v3 = type metadata accessor for TPTipsHelper.Entry.Kind(0);
  v2[15] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[16] = v4;
  v5 = (*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[17] = swift_task_alloc(v5);
  v2[18] = swift_task_alloc(v5);
  v6 = type metadata accessor for TPTipsHelper.Entry(0);
  v2[19] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v2[20] = v7;
  v2[21] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for LiveVoicemailTip(0);
  v2[22] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v2[23] = v9;
  v10 = *(_QWORD *)(v9 + 64);
  v2[24] = v10;
  v2[25] = swift_task_alloc((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100031408(&qword_100091120);
  v2[26] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v11 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for MainActor(0);
  v2[27] = v12;
  v2[28] = static MainActor.shared.getter(v12);
  v13 = dispatch thunk of Actor.unownedExecutor.getter(v12, &protocol witness table for MainActor);
  v2[29] = v13;
  v2[30] = v14;
  return swift_task_switch(sub_1000310A0, v13, v14);
}

uint64_t sub_1000310A0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t v21;

  v1 = v0[26];
  v3 = v0[24];
  v2 = v0[25];
  v4 = v0[22];
  v5 = v0[23];
  v6 = v0[13];
  v20 = v1;
  v21 = v0[14];
  v7 = v0[12];
  v8 = type metadata accessor for TaskPriority(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v1, 1, 1, v8);
  v9 = swift_allocObject(&unk_10007DEA8, 24, 7);
  swift_unknownObjectWeakInit(v9 + 16, v6);
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v0[31] = v10;
  v10(v2, v7, v4);
  v11 = swift_retain(v9);
  v12 = static MainActor.shared.getter(v11);
  v13 = *(unsigned __int8 *)(v5 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (v3 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  v16 = (v15 + 15) & 0xFFFFFFFFFFFFFFF8;
  v17 = swift_allocObject(&unk_10007DEF8, v16 + 8, v13 | 7);
  *(_QWORD *)(v17 + 16) = v12;
  *(_QWORD *)(v17 + 24) = &protocol witness table for MainActor;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v17 + v14, v2, v4);
  *(_QWORD *)(v17 + v15) = v9;
  *(_QWORD *)(v17 + v16) = v21;
  swift_release(v9);
  v0[32] = sub_100051774(v20, (uint64_t)&unk_100091130, v17);
  type metadata accessor for TPTipsHelper(0);
  v18 = (_QWORD *)swift_task_alloc(async function pointer to static TPTipsHelper.shared.getter[1]);
  v0[33] = v18;
  *v18 = v0;
  v18[1] = sub_100031220;
  return static TPTipsHelper.shared.getter();
}

uint64_t sub_100031220(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 264);
  *(_QWORD *)(*v1 + 272) = a1;
  swift_task_dealloc(v3);
  return swift_task_switch(sub_100031278, *(_QWORD *)(v2 + 232), *(_QWORD *)(v2 + 240));
}

uint64_t sub_100031278()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v10;
  void (*v11)(_QWORD *, uint64_t, uint64_t);
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = *(_QWORD *)(v0 + 256);
  v11 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v0 + 248);
  v12 = *(void **)(v0 + 272);
  v15 = *(_QWORD *)(v0 + 208);
  v16 = *(_QWORD *)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 176);
  v4 = *(_QWORD *)(v0 + 144);
  v13 = *(_QWORD *)(v0 + 160);
  v14 = *(_QWORD *)(v0 + 152);
  v5 = *(_QWORD *)(v0 + 128);
  v10 = *(_QWORD *)(v0 + 136);
  v6 = *(_QWORD *)(v0 + 120);
  v7 = *(_QWORD *)(v0 + 96);
  swift_release(*(_QWORD *)(v0 + 224));
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v4, enum case for TPTipsHelper.Entry.Kind.voicemailDetail(_:), v6);
  *(_QWORD *)(v0 + 40) = v3;
  *(_QWORD *)(v0 + 48) = sub_1000316E0(&qword_100091138, (uint64_t (*)(uint64_t))&type metadata accessor for LiveVoicemailTip, (uint64_t)&protocol conformance descriptor for LiveVoicemailTip);
  v8 = sub_100031594((_QWORD *)(v0 + 16));
  v11(v8, v7, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v10, v4, v6);
  sub_1000315D0(v0 + 16, v0 + 56);
  swift_retain(v1);
  TPTipsHelper.Entry.init(_:tip:observationTask:)(v10, v0 + 56, v1);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  sub_100031614((_QWORD *)(v0 + 16));
  dispatch thunk of TPTipsHelper.addEntry(_:)(v2);

  swift_release(v1);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v2, v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v2);
  swift_task_dealloc(v4);
  swift_task_dealloc(v10);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100031408(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_100031448()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = type metadata accessor for LiveVoicemailTip(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(_QWORD *)(v0 + v6));
  return swift_deallocObject(v0, ((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v5);
}

uint64_t sub_1000314E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(type metadata accessor for LiveVoicemailTip(0) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = *(_QWORD *)(v1 + 16);
  v8 = *(_QWORD *)(v1 + 24);
  v9 = v1 + v5;
  v10 = *(_QWORD *)(v1 + v6);
  v11 = *(_QWORD *)(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFF8));
  v12 = (_QWORD *)swift_task_alloc(dword_10009112C);
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_100030A5C;
  return sub_10002E3E8(a1, v7, v8, v9, v10, v11);
}

_QWORD *sub_100031594(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (_QWORD *)v2;
  }
  return v1;
}

uint64_t sub_1000315D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100031614(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100031634(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_100031678(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

_QWORD *sub_100031690(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000316B4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 32, 7);
}

void sub_1000316D8(uint64_t a1)
{
  uint64_t v1;

  sub_10002F848(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1000316E0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100031720(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100031634(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100031760(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100031408(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void type metadata accessor for Name(uint64_t a1)
{
  sub_1000317B0(a1, &qword_100091190, (uint64_t)&unk_10007DF48);
}

void sub_1000317B0(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v5;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, a3);
    if (!v5)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_1000317F4()
{
  return sub_1000316E0(&qword_100091198, (uint64_t (*)(uint64_t))type metadata accessor for Name, (uint64_t)&unk_100075974);
}

uint64_t sub_100031820()
{
  return sub_1000316E0(&qword_1000911A0, (uint64_t (*)(uint64_t))type metadata accessor for Name, (uint64_t)&unk_100075948);
}

uint64_t sub_10003184C()
{
  return sub_1000316E0(&qword_1000911A8, (uint64_t (*)(uint64_t))type metadata accessor for Name, (uint64_t)&unk_1000759E4);
}

uint64_t sub_10003187C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = type metadata accessor for Logger(0, a2);
  sub_10003960C(v2, qword_100091340);
  v3 = sub_100030760(v2, (uint64_t)qword_100091340);
  if (qword_100091070 != -1)
    swift_once(&qword_100091070, sub_1000516C4);
  v4 = sub_100030760(v2, (uint64_t)qword_100092E90);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v3, v4, v2);
}

void sub_10003190C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  int64_t v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t i;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _QWORD *v19;
  unint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;

  v2 = a1 + 64;
  v3 = 1 << *(_BYTE *)(a1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v6 = (unint64_t)(v3 + 63) >> 6;
  swift_bridgeObjectRetain(a1);
  v7 = 0;
  v8 = _swiftEmptyArrayStorage;
  if (v5)
    goto LABEL_6;
LABEL_7:
  v11 = v7 + 1;
  if (!__OFADD__(v7, 1))
  {
    if (v11 < v6)
    {
      v12 = *(_QWORD *)(v2 + 8 * v11);
      ++v7;
      if (v12)
        goto LABEL_22;
      v7 = v11 + 1;
      if (v11 + 1 >= v6)
        goto LABEL_36;
      v12 = *(_QWORD *)(v2 + 8 * v7);
      if (v12)
        goto LABEL_22;
      v7 = v11 + 2;
      if (v11 + 2 >= v6)
        goto LABEL_36;
      v12 = *(_QWORD *)(v2 + 8 * v7);
      if (v12)
        goto LABEL_22;
      v7 = v11 + 3;
      if (v11 + 3 >= v6)
        goto LABEL_36;
      v12 = *(_QWORD *)(v2 + 8 * v7);
      if (v12)
      {
LABEL_22:
        v5 = (v12 - 1) & v12;
        for (i = __clz(__rbit64(v12)) + (v7 << 6); ; i = v9 | (v7 << 6))
        {
          v14 = 8 * i;
          v15 = *(void **)(*(_QWORD *)(a1 + 48) + v14);
          v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + v14);
          if ((unint64_t)v16 >> 62)
          {
            if (v16 < 0)
              v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + v14);
            else
              v24 = v16 & 0xFFFFFFFFFFFFFF8;
            swift_bridgeObjectRetain_n(v16, 2);
            v25 = v15;
            v26 = _CocoaArrayWrapper.endIndex.getter(v24);
            swift_bridgeObjectRelease(v16);
            if (v26 < 2)
            {
LABEL_5:
              swift_bridgeObjectRelease(v16);

              if (!v5)
                goto LABEL_7;
              goto LABEL_6;
            }
          }
          else
          {
            v17 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain(v16);
            v18 = v15;
            if (v17 < 2)
              goto LABEL_5;
          }
          if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0)
            v8 = sub_10003528C(0, v8[2] + 1, 1, v8);
          v19 = v8;
          v20 = v8[2];
          v21 = v19;
          v22 = v19[3];
          if (v20 >= v22 >> 1)
            v21 = sub_10003528C((_QWORD *)(v22 > 1), v20 + 1, 1, v21);
          v21[2] = v20 + 1;
          v23 = &v21[2 * v20];
          v8 = v21;
          v23[4] = v15;
          v23[5] = v16;
          if (!v5)
            goto LABEL_7;
LABEL_6:
          v9 = __clz(__rbit64(v5));
          v5 &= v5 - 1;
        }
      }
      v13 = v11 + 4;
      if (v13 < v6)
      {
        v12 = *(_QWORD *)(v2 + 8 * v13);
        if (v12)
        {
          v7 = v13;
          goto LABEL_22;
        }
        while (1)
        {
          v7 = v13 + 1;
          if (__OFADD__(v13, 1))
            goto LABEL_38;
          if (v7 >= v6)
            break;
          v12 = *(_QWORD *)(v2 + 8 * v7);
          ++v13;
          if (v12)
            goto LABEL_22;
        }
      }
    }
LABEL_36:
    swift_release(a1);
    return;
  }
  __break(1u);
LABEL_38:
  __break(1u);
}

uint64_t sub_100031B64(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  uint64_t result;
  int64_t v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t i;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  id v26;

  v2 = a1 + 64;
  v3 = 1 << *(_BYTE *)(a1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v6 = (unint64_t)(v3 + 63) >> 6;
  result = swift_bridgeObjectRetain(a1);
  v8 = 0;
  v9 = _swiftEmptyArrayStorage;
  if (v5)
    goto LABEL_6;
LABEL_7:
  v12 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v12 < v6)
    {
      v13 = *(_QWORD *)(v2 + 8 * v12);
      ++v8;
      if (v13)
        goto LABEL_22;
      v8 = v12 + 1;
      if (v12 + 1 >= v6)
        goto LABEL_40;
      v13 = *(_QWORD *)(v2 + 8 * v8);
      if (v13)
        goto LABEL_22;
      v8 = v12 + 2;
      if (v12 + 2 >= v6)
        goto LABEL_40;
      v13 = *(_QWORD *)(v2 + 8 * v8);
      if (v13)
        goto LABEL_22;
      v8 = v12 + 3;
      if (v12 + 3 >= v6)
        goto LABEL_40;
      v13 = *(_QWORD *)(v2 + 8 * v8);
      if (v13)
      {
LABEL_22:
        v5 = (v13 - 1) & v13;
        for (i = __clz(__rbit64(v13)) + (v8 << 6); ; i = v10 | (v8 << 6))
        {
          v15 = 8 * i;
          v16 = *(void **)(*(_QWORD *)(a1 + 48) + v15);
          v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + v15);
          if ((unint64_t)v17 >> 62)
          {
            if (v17 < 0)
              v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + v15);
            else
              v25 = v17 & 0xFFFFFFFFFFFFFF8;
            swift_bridgeObjectRetain_n(v17, 2);
            v26 = v16;
            result = _CocoaArrayWrapper.endIndex.getter(v25);
            if (!result)
            {
LABEL_5:

              result = swift_bridgeObjectRelease_n(v17, 2);
              if (!v5)
                goto LABEL_7;
              goto LABEL_6;
            }
          }
          else
          {
            v18 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain_n(v17, 2);
            result = v16;
            if (!v18)
              goto LABEL_5;
          }
          if ((v17 & 0xC000000000000001) != 0)
          {
            v19 = specialized _ArrayBuffer._getElementSlowPath(_:)(0, v17);
          }
          else
          {
            if (!*(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_43;
            v19 = *(_QWORD *)(v17 + 32);
            swift_unknownObjectRetain(v19);
          }
          swift_bridgeObjectRelease_n(v17, 2);
          result = swift_isUniquelyReferenced_nonNull_native(v9);
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_100035180(0, v9[2] + 1, 1, v9);
            v9 = (_QWORD *)result;
          }
          v20 = v9;
          v21 = v9[2];
          v22 = v20;
          v23 = v20[3];
          if (v21 >= v23 >> 1)
          {
            result = (uint64_t)sub_100035180((_QWORD *)(v23 > 1), v21 + 1, 1, v22);
            v22 = (_QWORD *)result;
          }
          v22[2] = v21 + 1;
          v24 = &v22[2 * v21];
          v9 = v22;
          v24[4] = v16;
          v24[5] = v19;
          if (!v5)
            goto LABEL_7;
LABEL_6:
          v10 = __clz(__rbit64(v5));
          v5 &= v5 - 1;
        }
      }
      v14 = v12 + 4;
      if (v14 < v6)
      {
        v13 = *(_QWORD *)(v2 + 8 * v14);
        if (v13)
        {
          v8 = v14;
          goto LABEL_22;
        }
        while (1)
        {
          v8 = v14 + 1;
          if (__OFADD__(v14, 1))
            goto LABEL_42;
          if (v8 >= v6)
            break;
          v13 = *(_QWORD *)(v2 + 8 * v8);
          ++v14;
          if (v13)
            goto LABEL_22;
        }
      }
    }
LABEL_40:
    swift_release(a1);
    return (uint64_t)v9;
  }
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_100031DF8(uint64_t a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = v2;
  v6 = *v2;
  v7 = v2[1];
  swift_retain(*v2);
  swift_retain(v7);
  v8 = sub_100036100((uint64_t)a2, v6, v7);
  v10 = v9;
  v12 = v11;
  swift_release(v7);
  result = swift_release(v6);
  if ((v10 & 1) != 0)
  {
    sub_1000362E8(a2, v12);
    v21 = swift_unknownObjectRetain(a1);
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v21);
    v22 = *(_QWORD *)(v3[2] + 16);
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v22);
    v20 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v22, a1);
    v17 = 0;
    goto LABEL_9;
  }
  if ((v8 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  v16 = v3[2];
  v14 = v3 + 2;
  v15 = v16;
  if (v8 >= *(_QWORD *)(v16 + 16))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v17 = *(_QWORD *)(v15 + 8 * v8 + 32);
  swift_unknownObjectRetain(v17);
  result = swift_isUniquelyReferenced_nonNull_native(v15);
  *v14 = v15;
  if ((result & 1) == 0)
  {
    result = sub_100036A18(v15);
    v15 = result;
    *v14 = result;
  }
  if (v8 < *(_QWORD *)(v15 + 16))
  {
    v18 = v15 + 8 * v8;
    v19 = *(_QWORD *)(v18 + 32);
    swift_unknownObjectRetain(a1);
    v20 = swift_unknownObjectRelease(v19);
    *(_QWORD *)(v18 + 32) = a1;
LABEL_9:
    specialized ContiguousArray._endMutation()(v20);
    return v17;
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_100031F44(uint64_t a1, id *a2, uint64_t a3, void **a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  id v15;
  void (*v16)(char *, uint64_t);
  uint64_t v18;

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v18 - v11;
  v13 = *a4;
  v14 = objc_msgSend(*a2, "date");
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  v15 = objc_msgSend(v13, "date");
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  LOBYTE(v15) = static Date.> infix(_:_:)(v12, v10);
  v16 = *(void (**)(char *, uint64_t))(v7 + 8);
  v16(v10, v6);
  v16(v12, v6);
  return v15 & 1;
}

uint64_t sub_10003205C(unint64_t a1, char a2)
{
  uint64_t *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  void *v22;
  id v23;
  char v24;
  uint64_t v25;
  char isUniquelyReferenced_nonNull_native;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char isUniquelyReferenced_native;
  uint64_t v37;
  uint64_t v38;
  id v39;
  char v40;
  id v41;
  char v42;
  id v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t result;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  unint64_t v61;
  uint64_t *v62;
  void *v63;
  char v64[24];
  char v65[32];
  uint64_t v66;
  _BYTE v67[32];

  LOBYTE(v5) = a2;
  v6 = a1;
  if (!(a1 >> 62))
  {
    v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(a1);
    if (v7)
      goto LABEL_3;
LABEL_60:
    result = swift_bridgeObjectRelease(v6);
    if ((v5 & 1) == 0)
      return result;
LABEL_61:
    v50 = v2 + 2;
    swift_beginAccess(v2 + 2, v67, 33, 0);
    v4 = v2[2];
    v3 = v2[3];
    v6 = v2[4];
    swift_retain(v4);
    swift_retain(v3);
    swift_retain(v6);
    sub_100037A34(v4, v3, v6);
    v66 = v51;
    sub_1000389F0(&v66, (uint64_t (*)(uint64_t *, uint64_t *, void **, uint64_t *))sub_100031F44);
    swift_release(v6);
    swift_release(v3);
    swift_release(v4);
    v52 = v66;
    v53 = *(_QWORD *)(v66 + 16);
    if (v53 == *(_QWORD *)(v6 + 16))
    {
      sub_100037044(v66 + 32, v53, v50);
      swift_release(v52);
      return swift_endAccess(v67);
    }
    goto LABEL_65;
  }
LABEL_56:
  if (v6 < 0)
    v49 = v6;
  else
    v49 = v6 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v6);
  v7 = _CocoaArrayWrapper.endIndex.getter(v49);
  if (!v7)
    goto LABEL_60;
LABEL_3:
  if (v7 < 1)
  {
    __break(1u);
LABEL_65:
    __break(1u);
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
    v54 = v66;
    swift_release(v6);
    swift_release(v3);
    swift_release(v4);
    result = swift_release(v54);
    __break(1u);
    return result;
  }
  v55 = (char)v5;
  v4 = 0;
  v5 = v2 + 2;
  v57 = v6 + 32;
  v58 = v6;
  v8 = v2 + 3;
  v56 = v2;
  v60 = v2 + 4;
  v61 = v6 & 0xC000000000000001;
  v59 = v7;
  v62 = v2 + 2;
  do
  {
    if (v61)
    {
      v15 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(v4, v58);
    }
    else
    {
      v15 = *(void **)(v57 + 8 * v4);
      swift_unknownObjectRetain(v15);
    }
    v16 = objc_msgSend(v15, "identifier");
    swift_beginAccess(v5, v67, 33, 0);
    v17 = *v5;
    v18 = *v8;
    v6 = *(_QWORD *)(*v8 + 16);
    v63 = v16;
    if (*v5)
    {
      swift_unknownObjectRetain(v15);
      swift_retain(v18);
      swift_retain(v17);
      v3 = sub_100036648((uint64_t)v16, v18 + 32, v6, (Swift::Int *)(v17 + 16), v17 + 32);
      v20 = v19;
      v6 = v21;
      swift_release(v18);
      swift_release(v17);
      if ((v20 & 1) != 0)
        goto LABEL_28;
      goto LABEL_20;
    }
    if (!v6)
    {
      swift_unknownObjectRetain(v15);
      swift_retain(v18);
LABEL_27:
      swift_release(v18);
      v6 = 0;
LABEL_28:
      swift_unknownObjectRetain(v15);
      v27 = v63;
      v30 = v63;
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v30);
      v31 = *(_QWORD *)(*v8 + 16);
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v31);
      v32 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v31, v30);
      specialized ContiguousArray._endMutation()(v32);
      v33 = *v8;
      v3 = *(_QWORD *)(*v8 + 16);
      v5 = v62;
      v34 = *v62;
      if (*v62)
      {
        swift_beginAccess(v34 + 16, v65, 0, 0);
        if (static _HashTable.maximumCapacity(forScale:)(*(_QWORD *)(v34 + 16) & 0x3FLL) >= (uint64_t)v3)
        {
          isUniquelyReferenced_native = swift_isUniquelyReferenced_native(*v62);
          v37 = *v62;
          if ((isUniquelyReferenced_native & 1) == 0)
          {
            if (!v37)
              goto LABEL_67;
            v37 = _HashTable.copy()(*v62);
            swift_release(*v62);
            *v62 = v37;
          }
          if (!v37)
            goto LABEL_66;
          v38 = *(_QWORD *)(*v8 + 16) + ~(*(uint64_t *)(v37 + 24) >> 6);
          _HashTable.UnsafeHandle.subscript.setter((-1 << *(_QWORD *)(v37 + 16)) ^ ~(((v38 >> 63) & ~(-1 << *(_QWORD *)(v37 + 16))) + v38), v6, v37 + 16, v37 + 32);
          goto LABEL_9;
        }
        swift_beginAccess(v34 + 16, v64, 0, 0);
        v35 = *(_QWORD *)(v34 + 24) & 0x3FLL;
        if (v3 <= 0xF && !v35)
        {
          swift_release(v34);
          *v62 = 0;
LABEL_9:
          v12 = swift_unknownObjectRetain(v15);
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v12);
          v13 = *(_QWORD *)(*v60 + 16);
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v13);
          v14 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v13, v15);
          goto LABEL_10;
        }
      }
      else
      {
        if (v3 <= 0xF)
          goto LABEL_9;
        v35 = 0;
      }
      v9 = static _HashTable.scale(forCapacity:)(v3);
      if (v35 <= v9)
        v10 = v9;
      else
        v10 = v35;
      v11 = sub_1000364B0(v33, v10, 0, v35);
      swift_release(v34);
      *v62 = v11;
      goto LABEL_9;
    }
    type metadata accessor for MessageID(0);
    v22 = *(void **)(v18 + 32);
    swift_unknownObjectRetain(v15);
    swift_retain(v18);
    v23 = v22;
    v24 = static NSObject.== infix(_:_:)();

    v3 = 0;
    if ((v24 & 1) == 0)
    {
      if (v6 == 1)
        goto LABEL_27;
      v39 = *(id *)(v18 + 40);
      v40 = static NSObject.== infix(_:_:)();

      if ((v40 & 1) != 0)
      {
        v3 = 1;
      }
      else
      {
        if (v6 == 2)
          goto LABEL_27;
        v41 = *(id *)(v18 + 48);
        v42 = static NSObject.== infix(_:_:)();

        if ((v42 & 1) != 0)
        {
          v3 = 2;
        }
        else
        {
          if (v6 == 3)
            goto LABEL_27;
          v43 = *(id *)(v18 + 56);
          v44 = static NSObject.== infix(_:_:)();

          if ((v44 & 1) == 0)
          {
            v45 = 0;
            v46 = v6 - 4;
            while (v46 != v45)
            {
              v47 = *(id *)(v18 + 64 + 8 * v45);
              v6 = static NSObject.== infix(_:_:)();

              ++v45;
              if ((v6 & 1) != 0)
              {
                v3 = v45 + 3;
                goto LABEL_19;
              }
            }
            goto LABEL_27;
          }
          v3 = 3;
        }
      }
    }
LABEL_19:
    swift_release(v18);
LABEL_20:
    v2 = v60;
    v25 = *v60;
    swift_unknownObjectRetain(v15);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v25);
    *v60 = v25;
    v5 = v62;
    v27 = v63;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v25 = sub_100036A18(v25);
      *v60 = v25;
    }
    if ((v3 & 0x8000000000000000) != 0)
    {
      __break(1u);
LABEL_55:
      __break(1u);
      goto LABEL_56;
    }
    if (v3 >= *(_QWORD *)(v25 + 16))
      goto LABEL_55;
    v28 = v25 + 8 * v3;
    v29 = *(_QWORD *)(v28 + 32);
    swift_unknownObjectRetain(v15);
    v14 = swift_unknownObjectRelease(v29);
    *(_QWORD *)(v28 + 32) = v15;
LABEL_10:
    specialized ContiguousArray._endMutation()(v14);

    ++v4;
    swift_endAccess(v67);
    swift_unknownObjectRelease_n(v15, 3);
  }
  while (v4 != v59);
  result = swift_bridgeObjectRelease(v58);
  v2 = v56;
  if ((v55 & 1) != 0)
    goto LABEL_61;
  return result;
}

uint64_t sub_100032670(unint64_t a1, char a2)
{
  Swift::Int *v2;
  Swift::Int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  id **v8;
  id v9;
  void *v10;
  id *v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  Swift::Int *v20;
  char isUniquelyReferenced_native;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  Swift::Int *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  char v43;
  Swift::Int *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  _BYTE v49[24];
  _BYTE v50[32];
  uint64_t v51;
  _BYTE v52[24];
  unint64_t v53;

  LOBYTE(v3) = a2;
  v4 = a1;
  v53 = (unint64_t)_swiftEmptyArrayStorage;
  if (a1 >> 62)
  {
LABEL_64:
    if (v4 < 0)
      v36 = v4;
    else
      v36 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v4);
    v5 = _CocoaArrayWrapper.endIndex.getter(v36);
    if (v5)
      goto LABEL_3;
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(a1);
    if (v5)
    {
LABEL_3:
      v43 = v3;
      v6 = 0;
      v7 = v2 + 2;
      v47 = v5;
      v48 = v4 & 0xC000000000000001;
      v44 = v2;
      v45 = v4 + 32;
      v8 = (id **)(v2 + 3);
      v46 = v4;
      while (1)
      {
        if (v48)
          v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, v46);
        else
          v9 = *(id *)(v45 + 8 * v6);
        v10 = v9;
        if (__OFADD__(v6++, 1))
        {
          __break(1u);
LABEL_62:
          __break(1u);
LABEL_63:
          __break(1u);
          goto LABEL_64;
        }
        swift_beginAccess(v7, v52, 33, 0);
        v2 = (Swift::Int *)*v7;
        v12 = *v8;
        v3 = (Swift::Int)(*v8 + 4);
        v13 = (uint64_t)(*v8)[2];
        if (*v7)
        {
          v4 = (uint64_t)(v2 + 2);
          swift_retain(*v7);
          v3 = sub_100036648((uint64_t)v10, v3, v13, v2 + 2, (uint64_t)(v2 + 4));
          v15 = v14;
          v17 = v16;
          swift_release(v2);
          if ((v15 & 1) == 0)
            goto LABEL_15;
        }
        else if (v13)
        {
          v2 = (Swift::Int *)type metadata accessor for MessageID(0);
          v18 = *(id *)v3;
          v4 = static NSObject.== infix(_:_:)();

          v3 = 0;
          v17 = 0;
          if ((v4 & 1) != 0)
            goto LABEL_15;
          if (v13 != 1)
          {
            v3 = (Swift::Int)v12[5];
            v4 = static NSObject.== infix(_:_:)();

            if ((v4 & 1) != 0)
            {
              v17 = 0;
              v3 = 1;
              goto LABEL_15;
            }
            if (v13 != 2)
            {
              v3 = (Swift::Int)v12[6];
              v4 = static NSObject.== infix(_:_:)();

              if ((v4 & 1) != 0)
              {
                v17 = 0;
                v3 = 2;
                goto LABEL_15;
              }
              if (v13 != 3)
              {
                v3 = (Swift::Int)v12[7];
                v4 = static NSObject.== infix(_:_:)();

                if ((v4 & 1) != 0)
                {
                  v17 = 0;
                  v3 = 3;
                  goto LABEL_15;
                }
                if (v13 != 4)
                {
                  v3 = (Swift::Int)v12[8];
                  v4 = static NSObject.== infix(_:_:)();

                  if ((v4 & 1) != 0)
                  {
                    v17 = 0;
                    v3 = 4;
LABEL_15:
                    v19 = (uint64_t)(*v8)[2];
                    v20 = (Swift::Int *)*v7;
                    if (*v7)
                    {
                      swift_beginAccess(v20 + 2, v49, 0, 0);
                      if ((v20[2] & 0x3F) == (v20[3] & 0x3F))
                      {
                        if (!v19)
                          goto LABEL_30;
                      }
                      else if (v19 <= static _HashTable.minimumCapacity(forScale:)())
                      {
                        goto LABEL_30;
                      }
                      isUniquelyReferenced_native = swift_isUniquelyReferenced_native(*v7);
                      v22 = *v7;
                      if ((isUniquelyReferenced_native & 1) == 0)
                      {
                        if (!v22)
                          goto LABEL_74;
                        v22 = _HashTable.copy()(*v7);
                        swift_release(*v7);
                        *v7 = v22;
                      }
                      if (!v22)
                        goto LABEL_73;
                      v2 = (Swift::Int *)(v22 + 16);
                      v4 = v22 + 32;
                      swift_retain(v22);
                      sub_100036A2C(v17, (Swift::Int *)(v22 + 16), v22 + 32, (uint64_t)v7);
                      if (__OFADD__(v3, 1))
                        goto LABEL_62;
                      if (v3 + 1 < v3)
                        goto LABEL_63;
                      v23 = (uint64_t)*v8;
                      swift_retain(*v8);
                      sub_100036BE0(v3, v3 + 1, v23, (Swift::Int *)(v22 + 16), v22 + 32);
                      swift_release(v22);
                      swift_release(v23);
LABEL_29:
                      v24 = (void *)sub_100036930(v3);
LABEL_43:

                      v30 = sub_100036930(v3);
                      swift_endAccess(v52);
                      swift_unknownObjectRelease(v30);
                      v31 = v10;
                      v2 = (Swift::Int *)&v53;
                      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v31);
                      v3 = *(_QWORD *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x10);
                      v32 = *(_QWORD *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x18);
                      if (v3 >= v32 >> 1)
                        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v32 > 1, v3 + 1, 1);
                      v33 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v3, v31);
                      specialized Array._endMutation()(v33);
                      goto LABEL_5;
                    }
                    if (v19)
                      goto LABEL_29;
LABEL_30:
                    v24 = (void *)sub_100036930(v3);
                    v25 = (Swift::Int *)*v7;
                    v26 = (uint64_t)*v8;
                    if (*v7)
                    {
                      swift_beginAccess(v25 + 2, v50, 0, 0);
                      v4 = v25[3] & 0x3F;
                      v27 = *(_QWORD *)(v26 + 16);
                      if (v4)
                        goto LABEL_39;
                    }
                    else
                    {
                      v4 = 0;
                      v27 = *(_QWORD *)(v26 + 16);
                    }
                    if (v27 < 0x10)
                    {
                      swift_release(v25);
                      *v7 = 0;
                      goto LABEL_43;
                    }
LABEL_39:
                    v28 = static _HashTable.scale(forCapacity:)(v27);
                    if (v4 <= v28)
                      v29 = v28;
                    else
                      v29 = v4;
                    v4 = sub_1000364B0(v26, v29, 0, v4);
                    swift_release(v25);
                    *v7 = v4;
                    goto LABEL_43;
                  }
                  v4 = 0;
                  v34 = v13 - 5;
                  v12 += 9;
                  while (v34 != v4)
                  {
                    v35 = v12[v4];
                    LOBYTE(v3) = static NSObject.== infix(_:_:)();

                    ++v4;
                    if ((v3 & 1) != 0)
                    {
                      v17 = 0;
                      v3 = v4 + 4;
                      goto LABEL_15;
                    }
                  }
                }
              }
            }
          }
        }
        swift_endAccess(v52);
LABEL_5:

        if (v6 == v47)
        {
          swift_bridgeObjectRelease(v46);
          v2 = v44;
          if ((v43 & 1) != 0)
            goto LABEL_69;
          return v53;
        }
      }
    }
  }
  swift_bridgeObjectRelease(v4);
  if ((v3 & 1) == 0)
    return v53;
LABEL_69:
  v37 = v2 + 2;
  swift_beginAccess(v2 + 2, v52, 33, 0);
  v6 = v2[2];
  v12 = (id *)v2[3];
  v4 = v2[4];
  swift_retain(v6);
  swift_retain(v12);
  swift_retain(v4);
  sub_100037A34(v6, (uint64_t)v12, v4);
  v51 = v38;
  sub_1000389F0(&v51, (uint64_t (*)(uint64_t *, uint64_t *, void **, uint64_t *))sub_100031F44);
  swift_release(v4);
  swift_release(v12);
  swift_release(v6);
  v39 = v51;
  v40 = *(_QWORD *)(v51 + 16);
  if (v40 == *(_QWORD *)(v4 + 16))
  {
    sub_100037044(v51 + 32, v40, v37);
    swift_release(v39);
    swift_endAccess(v52);
    return v53;
  }
  __break(1u);
LABEL_73:
  __break(1u);
LABEL_74:
  __break(1u);
  v42 = v51;
  swift_release(v4);
  swift_release(v12);
  swift_release(v6);
  result = swift_release(v42);
  __break(1u);
  return result;
}

uint64_t sub_100032C54()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[2];
  v2 = v0[3];
  swift_release(v0[4]);
  swift_release(v2);
  swift_release(v1);
  return swift_deallocClassInstance(v0, 40, 7);
}

uint64_t sub_100032C9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v0, &unk_100091088);
  v1 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v0, v1);
  return swift_task_switch(sub_100032D2C, v2, v3);
}

uint64_t sub_100032D2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  if (qword_100091050 != -1)
    swift_once(&qword_100091050, sub_10003187C);
  v3 = type metadata accessor for Logger(0, a2);
  v4 = sub_100030760(v3, (uint64_t)qword_100091340);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "This must be overriden, its a misuse to use this directly without overriding this property", v7, 2u);
    swift_slowDealloc(v7, -1, -1);
  }

  return (*(uint64_t (**)(_QWORD *))(v2 + 8))(_swiftEmptyArrayStorage);
}

uint64_t sub_100032E14()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1[12] = v0;
  v2 = sub_100031408(&qword_100091120);
  v1[13] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for VoicemailActor();
  v1[14] = v3;
  swift_initStaticObject(v3, &unk_100091088);
  v4 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v1[15] = v4;
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, v4);
  v1[16] = v5;
  v1[17] = v6;
  return swift_task_switch(sub_100032ED4, v5, v6);
}

uint64_t sub_100032ED4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(_QWORD **);
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t inited;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD *v44;

  if (qword_100091070 != -1)
    swift_once(&qword_100091070, sub_1000516C4);
  v3 = type metadata accessor for Logger(0, a2);
  v4 = sub_100030760(v3, (uint64_t)qword_100092E90);
  *(_QWORD *)(v2 + 144) = v4;
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    v8 = swift_slowAlloc(32, -1);
    v44 = (_QWORD *)v8;
    *(_DWORD *)v7 = 136315138;
    *(_QWORD *)(v2 + 88) = sub_10004DF18(0x73654D6863746566, 0xEF29287365676173, (uint64_t *)&v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v2 + 88, v2 + 96, v7 + 4, v7 + 12);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "CachedVoicemailManager: %s", v7, 0xCu);
    swift_arrayDestroy(v8, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);
  }

  v9 = *(_QWORD *)(v2 + 96);
  v10 = *(_QWORD *)(v9 + 16);
  *(_QWORD *)(v2 + 152) = v10;
  if (v10 >> 62)
  {
    if (v10 >> 62 == 1)
    {
      v11 = (_QWORD *)(v10 & 0x3FFFFFFFFFFFFFFFLL);
      v12 = (uint64_t *)(v9 + 24);
      swift_retain(v11);
      swift_beginAccess(v9 + 24, v2 + 16, 1, 0);
      v13 = *(_QWORD *)(v9 + 24);
      v14 = *(_QWORD *)(v13 + 16);
      if (v14)
      {
        swift_bridgeObjectRetain(*(_QWORD *)(v9 + 24));
        v15 = (uint64_t *)(v13 + 40);
        do
        {
          v17 = (void (*)(_QWORD **))*(v15 - 1);
          v16 = *v15;
          v44 = v11;
          swift_retain(v16);
          v17(&v44);
          swift_release(v16);
          v15 += 2;
          --v14;
        }
        while (v14);
        swift_bridgeObjectRelease(v13);
        v13 = *v12;
      }
      *v12 = (uint64_t)_swiftEmptyArrayStorage;
      v18 = swift_bridgeObjectRelease(v13);
      v19 = Logger.logObject.getter(v18);
      v20 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = (uint8_t *)swift_slowAlloc(12, -1);
        v22 = swift_slowAlloc(32, -1);
        v44 = (_QWORD *)v22;
        *(_DWORD *)v21 = 136315138;
        *(_QWORD *)(v2 + 72) = sub_10004DF18(0x73654D6863746566, 0xEF29287365676173, (uint64_t *)&v44);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v2 + 72, v2 + 80, v21 + 4, v21 + 12);
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "CachedVoicemailManager: %s returning voicemails", v21, 0xCu);
        swift_arrayDestroy(v22, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v22, -1, -1);
        swift_slowDealloc(v21, -1, -1);
      }

      v23 = *(_QWORD *)(v2 + 104);
      swift_beginAccess(v11 + 2, v2 + 40, 0, 0);
      v24 = v11[2];
      v25 = v11[3];
      v26 = v11[4];
      swift_retain(v24);
      swift_retain(v25);
      swift_retain(v26);
      v27 = sub_100036008(v24, v25, v26);
      swift_release(v11);
      swift_release(v26);
      swift_release(v25);
      swift_release(v24);
      swift_task_dealloc(v23);
      return (*(uint64_t (**)(_QWORD *))(v2 + 8))(v27);
    }
    else
    {
      v32 = *(_QWORD *)(v2 + 112);
      v33 = *(_QWORD *)(v2 + 120);
      v34 = *(_QWORD *)(v2 + 104);
      v35 = type metadata accessor for TaskPriority(0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v34, 1, 1, v35);
      v36 = swift_allocObject(&unk_10007E150, 24, 7);
      swift_weakInit(v36 + 16, v9);
      inited = swift_initStaticObject(v32, &unk_100091088);
      v38 = (_QWORD *)swift_allocObject(&unk_10007E178, 40, 7);
      v38[2] = inited;
      v38[3] = v33;
      v38[4] = v36;
      v39 = sub_1000518B8(v34, (uint64_t)&unk_1000915B8, (uint64_t)v38);
      *(_QWORD *)(v2 + 168) = v39;
      v40 = *(_QWORD *)(v9 + 16);
      *(_QWORD *)(v9 + 16) = v39;
      v41 = v40 & 0x3FFFFFFFFFFFFFFFLL;
      swift_retain(v39);
      swift_release(v41);
      v42 = (_QWORD *)swift_task_alloc(async function pointer to Task<>.value.getter[1]);
      *(_QWORD *)(v2 + 176) = v42;
      v43 = type metadata accessor for CachedVoicemailManager.Cache();
      *v42 = v2;
      v42[1] = sub_10003368C;
      return Task<>.value.getter(v2 + 80, v39, v43);
    }
  }
  else
  {
    v29 = async function pointer to Task<>.value.getter[1];
    swift_retain(v10);
    v30 = (_QWORD *)swift_task_alloc(v29);
    *(_QWORD *)(v2 + 160) = v30;
    v31 = type metadata accessor for CachedVoicemailManager.Cache();
    *v30 = v2;
    v30[1] = sub_1000333E8;
    return Task<>.value.getter(v2 + 64, v10, v31);
  }
}

uint64_t sub_1000333E8()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 160));
  return swift_task_switch(sub_100033434, *(_QWORD *)(v1 + 128), *(_QWORD *)(v1 + 136));
}

uint64_t sub_100033434()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void (*v7)(_QWORD **);
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v19;

  swift_release(*(_QWORD *)(v0 + 152) & 0x3FFFFFFFFFFFFFFFLL);
  v1 = *(_QWORD **)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 96) + 24;
  swift_beginAccess(v2, v0 + 16, 1, 0);
  v3 = *(_QWORD *)v2;
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain(v3);
    v5 = (uint64_t *)(v3 + 40);
    do
    {
      v7 = (void (*)(_QWORD **))*(v5 - 1);
      v6 = *v5;
      v19 = v1;
      swift_retain(v6);
      v7(&v19);
      swift_release(v6);
      v5 += 2;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease(v3);
    v3 = *(_QWORD *)v2;
  }
  *(_QWORD *)v2 = _swiftEmptyArrayStorage;
  v8 = swift_bridgeObjectRelease(v3);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(12, -1);
    v12 = swift_slowAlloc(32, -1);
    v19 = (_QWORD *)v12;
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)(v0 + 72) = sub_10004DF18(0x73654D6863746566, 0xEF29287365676173, (uint64_t *)&v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 72, v0 + 80, v11 + 4, v11 + 12);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "CachedVoicemailManager: %s returning voicemails", v11, 0xCu);
    swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);
  }

  v13 = *(_QWORD *)(v0 + 104);
  swift_beginAccess(v1 + 2, v0 + 40, 0, 0);
  v14 = v1[2];
  v15 = v1[3];
  v16 = v1[4];
  swift_retain(v14);
  swift_retain(v15);
  swift_retain(v16);
  v17 = sub_100036008(v14, v15, v16);
  swift_release(v14);
  swift_release(v15);
  swift_release(v16);
  swift_release(v1);
  swift_task_dealloc(v13);
  return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v17);
}

uint64_t sub_10003368C()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 176));
  return swift_task_switch(sub_1000336D8, *(_QWORD *)(v1 + 128), *(_QWORD *)(v1 + 136));
}

uint64_t sub_1000336D8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(_QWORD **);
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v20;

  swift_release(*(_QWORD *)(v0 + 168));
  v1 = *(_QWORD **)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 96);
  v3 = (uint64_t *)(v2 + 24);
  swift_beginAccess(v2 + 24, v0 + 16, 1, 0);
  v4 = *(_QWORD *)(v2 + 24);
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    swift_bridgeObjectRetain(*(_QWORD *)(v2 + 24));
    v6 = (uint64_t *)(v4 + 40);
    do
    {
      v8 = (void (*)(_QWORD **))*(v6 - 1);
      v7 = *v6;
      v20 = v1;
      swift_retain(v7);
      v8(&v20);
      swift_release(v7);
      v6 += 2;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease(v4);
    v4 = *v3;
  }
  *v3 = (uint64_t)_swiftEmptyArrayStorage;
  v9 = swift_bridgeObjectRelease(v4);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v13 = swift_slowAlloc(32, -1);
    v20 = (_QWORD *)v13;
    *(_DWORD *)v12 = 136315138;
    *(_QWORD *)(v0 + 72) = sub_10004DF18(0x73654D6863746566, 0xEF29287365676173, (uint64_t *)&v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 72, v0 + 80, v12 + 4, v12 + 12);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "CachedVoicemailManager: %s returning voicemails", v12, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);
  }

  v14 = *(_QWORD *)(v0 + 104);
  swift_beginAccess(v1 + 2, v0 + 40, 0, 0);
  v15 = v1[2];
  v16 = v1[3];
  v17 = v1[4];
  swift_retain(v15);
  swift_retain(v16);
  swift_retain(v17);
  v18 = sub_100036008(v15, v16, v17);
  swift_release(v15);
  swift_release(v16);
  swift_release(v17);
  swift_release(v1);
  swift_task_dealloc(v14);
  return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v18);
}

uint64_t sub_10003392C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4[7] = a1;
  v4[8] = a4;
  v5 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v5, &unk_100091088);
  v6 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v5, v6);
  v4[9] = v7;
  v4[10] = v8;
  return swift_task_switch(sub_1000339C0, v7, v8);
}

uint64_t sub_1000339C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t Strong;
  int *v11;
  _QWORD *v12;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(void);
  uint64_t v19;

  if (qword_100091070 != -1)
    swift_once(&qword_100091070, sub_1000516C4);
  v3 = type metadata accessor for Logger(0, a2);
  v4 = sub_100030760(v3, (uint64_t)qword_100092E90);
  *(_QWORD *)(v2 + 88) = v4;
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    v8 = swift_slowAlloc(32, -1);
    v19 = v8;
    *(_DWORD *)v7 = 136315138;
    *(_QWORD *)(v2 + 48) = sub_10004DF18(0x73654D6863746566, 0xEF29287365676173, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v2 + 48, v2 + 56, v7 + 4, v7 + 12);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "CachedVoicemailManager: %s inside of a task", v7, 0xCu);
    swift_arrayDestroy(v8, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);
  }

  v9 = *(_QWORD *)(v2 + 64) + 16;
  swift_beginAccess(v9, v2 + 16, 0, 0);
  Strong = swift_weakLoadStrong(v9);
  *(_QWORD *)(v2 + 96) = Strong;
  if (Strong)
  {
    v11 = *(int **)(*(_QWORD *)Strong + 144);
    v18 = (uint64_t (*)(void))((char *)v11 + *v11);
    v12 = (_QWORD *)swift_task_alloc(v11[1]);
    *(_QWORD *)(v2 + 104) = v12;
    *v12 = v2;
    v12[1] = sub_100033C04;
    return v18();
  }
  else
  {
    v14 = type metadata accessor for CachedVoicemailManager.Cache();
    v15 = (_QWORD *)swift_allocObject(v14, 40, 7);
    v15[2] = sub_100037D80((uint64_t)_swiftEmptyArrayStorage);
    v15[3] = v16;
    v15[4] = v17;
    **(_QWORD **)(v2 + 56) = v15;
    return (*(uint64_t (**)(void))(v2 + 8))();
  }
}

uint64_t sub_100033C04(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)();

  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 104);
  *(_QWORD *)(*(_QWORD *)v2 + 112) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    v6 = v4[9];
    v7 = v4[10];
    v8 = sub_100033E18;
  }
  else
  {
    v4[15] = a1;
    v6 = v4[9];
    v7 = v4[10];
    v8 = sub_100033C78;
  }
  return swift_task_switch(v8, v6, v7);
}

uint64_t sub_100033C78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = sub_100038AE8(*(_QWORD *)(v0 + 120), (_QWORD *)1);
  v3 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v1 + 16) = v2 | 0x4000000000000000;
  v4 = v3 & 0x3FFFFFFFFFFFFFFFLL;
  swift_retain(v2);
  v5 = swift_release(v4);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = *(_QWORD *)(v0 + 96);
    v9 = (uint8_t *)swift_slowAlloc(12, -1);
    v10 = swift_slowAlloc(32, -1);
    v13 = v10;
    *(_DWORD *)v9 = 136315138;
    *(_QWORD *)(v0 + 40) = sub_10004DF18(0x73654D6863746566, 0xEF29287365676173, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48, v9 + 4, v9 + 12);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "CachedVoicemailManager: %s returning cache from a task", v9, 0xCu);
    swift_arrayDestroy(v10, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1, -1);
    swift_slowDealloc(v9, -1, -1);
    swift_release(v8);

  }
  else
  {
    v11 = *(_QWORD *)(v0 + 96);

    swift_release(v11);
  }
  **(_QWORD **)(v0 + 56) = v2;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100033E18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 96);
  v3 = type metadata accessor for CachedVoicemailManager.Cache();
  v4 = (_QWORD *)swift_allocObject(v3, 40, 7);
  v4[2] = sub_100037D80((uint64_t)_swiftEmptyArrayStorage);
  v4[3] = v5;
  v4[4] = v6;
  swift_errorRelease(v1);
  swift_release(v2);
  **(_QWORD **)(v0 + 56) = v4;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100033FB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  v3 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v3, &unk_100091088);
  v4 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, v4);
  return swift_task_switch(sub_100034048, v5, v6);
}

uint64_t sub_100034048()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 32) = _Block_copy(*(const void **)(v0 + 16));
  v2 = dword_10009138C;
  swift_retain(v1);
  v3 = (_QWORD *)swift_task_alloc(v2);
  *(_QWORD *)(v0 + 40) = v3;
  *v3 = v0;
  v3[1] = sub_1000340A8;
  return sub_100032E14();
}

uint64_t sub_1000340A8(uint64_t a1)
{
  uint64_t *v1;
  void (**v3)(_QWORD, _QWORD);
  uint64_t v4;
  Class isa;
  uint64_t v7;

  v3 = *(void (***)(_QWORD, _QWORD))(*v1 + 32);
  v4 = *(_QWORD *)(*v1 + 24);
  v7 = *v1;
  swift_task_dealloc(*(_QWORD *)(*v1 + 40));
  swift_release(v4);
  sub_100031408(&qword_1000916D0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  ((void (**)(_QWORD, Class))v3)[2](v3, isa);

  _Block_release(v3);
  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t sub_100034148(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[9] = a1;
  v2[10] = v1;
  v3 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v3, &unk_100091088);
  v4 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, v4);
  v2[11] = v5;
  v2[12] = v6;
  return swift_task_switch(sub_1000341DC, v5, v6);
}

unint64_t sub_1000341DC()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  unint64_t result;
  uint64_t v9;
  char v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 80) + 16);
  *(_QWORD *)(v0 + 104) = v1;
  if (!(v1 >> 62))
  {
    v12 = async function pointer to Task<>.value.getter[1];
    swift_retain(v1);
    v13 = (_QWORD *)swift_task_alloc(v12);
    *(_QWORD *)(v0 + 112) = v13;
    v14 = type metadata accessor for CachedVoicemailManager.Cache();
    *v13 = v0;
    v13[1] = sub_100034354;
    return Task<>.value.getter(v0 + 64, v1, v14);
  }
  if (v1 >> 62 != 1)
  {
    v9 = 0;
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v9);
  }
  v2 = *(void **)(v0 + 72);
  v3 = v1 & 0x3FFFFFFFFFFFFFFFLL;
  swift_beginAccess((v1 & 0x3FFFFFFFFFFFFFFFLL) + 16, v0 + 40, 0, 0);
  v4 = *(_QWORD *)((v1 & 0x3FFFFFFFFFFFFFFFLL) + 0x10);
  v6 = *(_QWORD *)(v1 + 24);
  v5 = *(_QWORD *)(v1 + 32);
  swift_retain(*(_QWORD *)(v3 + 16));
  v7 = v2;
  swift_retain(v6);
  swift_retain(v5);
  swift_retain(v3);
  result = sub_100036100((uint64_t)v7, v4, v6);
  v9 = 0;
  if ((v10 & 1) != 0)
  {
LABEL_7:
    v11 = *(void **)(v0 + 72);
    swift_release(v6);
    swift_release(v4);
    swift_release(v3);

    swift_release(v5);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v9);
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)(v5 + 16))
  {
    v9 = *(_QWORD *)(v5 + 8 * result + 32);
    swift_unknownObjectRetain(v9);
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_100034354()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 112));
  return swift_task_switch(sub_1000343A0, *(_QWORD *)(v1 + 88), *(_QWORD *)(v1 + 96));
}

unint64_t sub_1000343A0()
{
  uint64_t v0;
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  unint64_t result;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;

  v1 = *(_QWORD **)(v0 + 64);
  v2 = *(void **)(v0 + 72);
  swift_beginAccess(v1 + 2, v0 + 16, 0, 0);
  v4 = v1[2];
  v3 = v1[3];
  v5 = v1[4];
  swift_retain(v4);
  v6 = v2;
  swift_retain(v3);
  swift_retain(v5);
  result = sub_100036100((uint64_t)v6, v4, v3);
  v8 = 0;
  if ((v9 & 1) != 0)
    goto LABEL_5;
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)(v5 + 16))
  {
    v8 = *(_QWORD *)(v5 + 8 * result + 32);
    swift_unknownObjectRetain(v8);
LABEL_5:
    v10 = *(_QWORD *)(v0 + 104);
    v11 = *(void **)(v0 + 72);
    swift_release(v5);

    swift_release(v1);
    swift_release(v4);
    swift_release(v3);
    swift_release(v10 & 0x3FFFFFFFFFFFFFFFLL);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v8);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000345CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v4 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v4, &unk_100091088);
  v5 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, v5);
  return swift_task_switch(sub_100034664, v6, v7);
}

uint64_t sub_100034664()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(void **)(v0 + 16);
  *(_QWORD *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  v3 = dword_100091394;
  v4 = v2;
  swift_retain(v1);
  v5 = (_QWORD *)swift_task_alloc(v3);
  *(_QWORD *)(v0 + 48) = v5;
  *v5 = v0;
  v5[1] = sub_1000346DC;
  return sub_100034148(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1000346DC(uint64_t a1)
{
  uint64_t *v1;
  void (**v3)(_QWORD, _QWORD);
  uint64_t v4;
  void *v5;
  uint64_t v7;

  v3 = *(void (***)(_QWORD, _QWORD))(*v1 + 40);
  v4 = *(_QWORD *)(*v1 + 32);
  v5 = *(void **)(*v1 + 16);
  v7 = *v1;
  swift_task_dealloc(*(_QWORD *)(*v1 + 48));
  swift_release(v4);

  v3[2](v3, a1);
  _Block_release(v3);
  swift_unknownObjectRelease(a1);
  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t sub_100034764(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  _BYTE v12[24];

  v2 = result;
  v3 = *(_QWORD *)(v1 + 16);
  if (v3 >> 62)
  {
    if (v3 >> 62 == 1)
    {
      v4 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      swift_retain(v3 & 0x3FFFFFFFFFFFFFFFLL);
      sub_10003205C(v2, 1);
      return swift_release(v4);
    }
  }
  else
  {
    v5 = swift_allocObject(&unk_10007E128, 24, 7);
    *(_QWORD *)(v5 + 16) = v2;
    v6 = (_QWORD *)(v1 + 24);
    swift_beginAccess(v1 + 24, v12, 33, 0);
    v7 = *(_QWORD **)(v1 + 24);
    swift_bridgeObjectRetain(v2);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v7);
    *(_QWORD *)(v1 + 24) = v7;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v7 = sub_100035398(0, v7[2] + 1, 1, v7);
      *v6 = v7;
    }
    v10 = v7[2];
    v9 = v7[3];
    if (v10 >= v9 >> 1)
    {
      v7 = sub_100035398((_QWORD *)(v9 > 1), v10 + 1, 1, v7);
      *v6 = v7;
    }
    v7[2] = v10 + 1;
    v11 = &v7[2 * v10];
    v11[4] = sub_100039678;
    v11[5] = v5;
    return swift_endAccess(v12);
  }
  return result;
}

_QWORD *sub_1000348A4(unint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  _BYTE v14[24];

  v3 = *(_QWORD *)(v1 + 16);
  if (v3 >> 62)
  {
    if (v3 >> 62 == 1)
    {
      v4 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      swift_retain(v3 & 0x3FFFFFFFFFFFFFFFLL);
      v5 = sub_100032670(a1, 1);
      swift_release(v4);
      return (_QWORD *)v5;
    }
  }
  else
  {
    v7 = swift_allocObject(&unk_10007E100, 24, 7);
    *(_QWORD *)(v7 + 16) = a1;
    v8 = (_QWORD *)(v1 + 24);
    swift_beginAccess(v1 + 24, v14, 33, 0);
    v9 = *(_QWORD **)(v1 + 24);
    swift_bridgeObjectRetain(a1);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v9);
    *(_QWORD *)(v1 + 24) = v9;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v9 = sub_100035398(0, v9[2] + 1, 1, v9);
      *v8 = v9;
    }
    v12 = v9[2];
    v11 = v9[3];
    if (v12 >= v11 >> 1)
    {
      v9 = sub_100035398((_QWORD *)(v11 > 1), v12 + 1, 1, v9);
      *v8 = v9;
    }
    v9[2] = v12 + 1;
    v13 = &v9[2 * v12];
    v13[4] = sub_10003964C;
    v13[5] = v7;
    swift_endAccess(v14);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_1000349E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  _BYTE v15[24];

  v3 = swift_allocObject(&unk_10007E0B0, 24, 7);
  *(_QWORD *)(v3 + 16) = a1;
  v4 = *(_QWORD *)(v1 + 16);
  if (v4 >> 62)
  {
    if (v4 >> 62 == 1)
    {
      v5 = v4 & 0x3FFFFFFFFFFFFFFFLL;
      swift_bridgeObjectRetain(a1);
      v6 = (_QWORD *)swift_retain(v5);
      sub_100034B74(v6, a1);
      swift_release(v3);
      return swift_release(v5);
    }
    else
    {
      swift_bridgeObjectRetain(a1);
      return swift_release(v3);
    }
  }
  else
  {
    v8 = swift_allocObject(&unk_10007E0D8, 32, 7);
    *(_QWORD *)(v8 + 16) = sub_100038A98;
    *(_QWORD *)(v8 + 24) = v3;
    v9 = (_QWORD *)(v1 + 24);
    swift_beginAccess(v1 + 24, v15, 33, 0);
    v10 = *(_QWORD **)(v1 + 24);
    swift_bridgeObjectRetain(a1);
    swift_retain(v3);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v10);
    *(_QWORD *)(v1 + 24) = v10;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v10 = sub_100035398(0, v10[2] + 1, 1, v10);
      *v9 = v10;
    }
    v13 = v10[2];
    v12 = v10[3];
    if (v13 >= v12 >> 1)
    {
      v10 = sub_100035398((_QWORD *)(v12 > 1), v13 + 1, 1, v10);
      *v9 = v10;
    }
    v10[2] = v13 + 1;
    v14 = &v10[2 * v13];
    v14[4] = sub_100038AC4;
    v14[5] = v8;
    swift_endAccess(v15);
    return swift_release(v3);
  }
}

uint64_t sub_100034B74(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  char **v9;
  __objc2_prot_list **p_prots;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t result;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41[3];

  v3 = a2;
  if ((unint64_t)a2 >> 62)
  {
    if (a2 < 0)
      v31 = a2;
    else
      v31 = a2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a2);
    v5 = _CocoaArrayWrapper.endIndex.getter(v31);
    if (v5)
      goto LABEL_3;
LABEL_21:
    swift_bridgeObjectRelease(v3);
    goto LABEL_22;
  }
  v5 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a2);
  if (!v5)
    goto LABEL_21;
LABEL_3:
  if (v5 < 1)
    goto LABEL_25;
  v6 = 0;
  v7 = v3 & 0xC000000000000001;
  v38 = a1;
  v8 = a1 + 2;
  v9 = &selRef_CGImage;
  p_prots = &OBJC_PROTOCOL___NUIContainerViewDelegate.prots;
  v39 = v8;
  do
  {
    if (v7)
    {
      v11 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, v3);
    }
    else
    {
      v11 = *(void **)(v3 + 8 * v6 + 32);
      swift_unknownObjectRetain(v11);
    }
    v12 = objc_msgSend(v11, v9[320], v38);
    swift_beginAccess(v8, v41, 33, 0);
    v13 = sub_100031DF8((uint64_t)v11, v12);
    swift_endAccess(v41);

    swift_unknownObjectRelease(v13);
    if (v13)
    {
      swift_unknownObjectRelease(v11);
    }
    else
    {
      if (p_prots[10] != (__objc2_prot_list *)-1)
        swift_once(&qword_100091050, sub_10003187C);
      v15 = type metadata accessor for Logger(0, v14);
      sub_100030760(v15, (uint64_t)qword_100091340);
      v16 = swift_unknownObjectRetain_n(v11, 2);
      v17 = Logger.logObject.getter(v16);
      v18 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v17, v18))
      {
        v19 = swift_slowAlloc(12, -1);
        v20 = swift_slowAlloc(32, -1);
        v40 = v11;
        v41[0] = v20;
        *(_DWORD *)v19 = 136315138;
        swift_unknownObjectRetain(v11);
        v21 = sub_100031408(&qword_1000916D0);
        v22 = String.init<A>(reflecting:)(&v40, v21);
        v23 = v3;
        v24 = v5;
        v25 = v7;
        v27 = v26;
        *(_QWORD *)(v19 + 4) = sub_10004DF18(v22, v26, v41);
        swift_unknownObjectRelease_n(v11, 2);
        v28 = v27;
        v7 = v25;
        v5 = v24;
        v3 = v23;
        v9 = &selRef_CGImage;
        swift_bridgeObjectRelease(v28);
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "CachedVoicemailmanager: Told to update message but no message was found with id: %s", (uint8_t *)v19, 0xCu);
        swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
        v29 = v20;
        v8 = v39;
        swift_slowDealloc(v29, -1, -1);
        v30 = v19;
        p_prots = (__objc2_prot_list **)(&OBJC_PROTOCOL___NUIContainerViewDelegate + 16);
        swift_slowDealloc(v30, -1, -1);
        swift_unknownObjectRelease(v11);

      }
      else
      {

        swift_unknownObjectRelease_n(v11, 3);
      }
    }
    ++v6;
  }
  while (v5 != v6);
  swift_bridgeObjectRelease(v3);
  a1 = v38;
LABEL_22:
  v32 = a1 + 2;
  swift_beginAccess(a1 + 2, v41, 33, 0);
  v33 = a1[2];
  v2 = a1[3];
  a1 = (_QWORD *)a1[4];
  swift_retain(v33);
  swift_retain(v2);
  swift_retain(a1);
  sub_100037A34(v33, v2, (uint64_t)a1);
  v40 = v34;
  sub_1000389F0(&v40, (uint64_t (*)(uint64_t *, uint64_t *, void **, uint64_t *))sub_100031F44);
  swift_release(a1);
  swift_release(v2);
  swift_release(v33);
  v5 = (uint64_t)v40;
  v35 = v40[2];
  if (v35 == a1[2])
  {
    sub_100037044((uint64_t)(v40 + 4), v35, v32);
    swift_release(v5);
    return swift_endAccess(v41);
  }
  __break(1u);
LABEL_25:
  __break(1u);
  v37 = v40;
  swift_release(a1);
  swift_release(v2);
  swift_release(v5);
  result = swift_release(v37);
  __break(1u);
  return result;
}

uint64_t sub_100034F40()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16) & 0x3FFFFFFFFFFFFFFFLL);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for CachedVoicemailManager()
{
  return objc_opt_self(_TtC9IntentsUI22CachedVoicemailManager);
}

uint64_t type metadata accessor for CachedVoicemailManager.Cache()
{
  return objc_opt_self(_TtCC9IntentsUI22CachedVoicemailManagerP33_EABCA2FFB3EECAA255639BB76817E3855Cache);
}

_QWORD *initializeBufferWithCopyOfBuffer for CachedVoicemailManager.Cache.State(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = *a2 & 0x3FFFFFFFFFFFFFFFLL;
  *a1 = *a2;
  swift_retain(v3);
  return a1;
}

uint64_t destroy for CachedVoicemailManager.Cache.State(_QWORD *a1)
{
  return swift_release(*a1 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t *assignWithCopy for CachedVoicemailManager.Cache.State(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a2 & 0x3FFFFFFFFFFFFFFFLL;
  v4 = *a1;
  *a1 = *a2;
  v5 = v4 & 0x3FFFFFFFFFFFFFFFLL;
  swift_retain(v3);
  swift_release(v5);
  return a1;
}

_QWORD *initializeWithTake for CachedVoicemailManager.Cache.State(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t *assignWithTake for CachedVoicemailManager.Cache.State(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a1;
  *a1 = *a2;
  swift_release(v3 & 0x3FFFFFFFFFFFFFFFLL);
  return a1;
}

uint64_t getEnumTagSinglePayload for CachedVoicemailManager.Cache.State(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7E && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 126);
  v3 = (((*(_QWORD *)a1 >> 57) >> 5) | (4 * ((*(_QWORD *)a1 >> 57) & 0x18 | *(_QWORD *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7D)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for CachedVoicemailManager.Cache.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x7D)
  {
    *(_QWORD *)result = a2 - 126;
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
    {
      v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(_QWORD *)result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_100035118(_QWORD *a1)
{
  uint64_t v1;

  v1 = *a1 >> 62;
  if (v1 <= 1)
    return v1;
  else
    return (*a1 >> 3) + 2;
}

_QWORD *sub_100035134(_QWORD *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_100035144(unint64_t *result, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  if (a2 < 2)
  {
    v2 = *result & 0xFFFFFFFFFFFFFF8;
    v3 = a2 << 62;
  }
  else
  {
    v2 = 8 * (a2 - 2);
    v3 = 0x8000000000000000;
  }
  *result = v2 | v3;
  return result;
}

ValueMetadata *type metadata accessor for CachedVoicemailManager.Cache.State()
{
  return &type metadata for CachedVoicemailManager.Cache.State;
}

_QWORD *sub_100035180(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_100031408(&qword_1000915D0);
      v11 = (_QWORD *)swift_allocObject(v10, 16 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 17;
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 4);
      v14 = v11 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = _swiftEmptyArrayStorage;
      v14 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[2 * v8 + 4])
          memmove(v14, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_100037C78(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

_QWORD *sub_10003528C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_100031408(&qword_1000915E0);
      v11 = (_QWORD *)swift_allocObject(v10, 16 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 17;
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 4);
      v14 = v11 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = _swiftEmptyArrayStorage;
      v14 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[2 * v8 + 4])
          memmove(v14, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_100037B70(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

_QWORD *sub_100035398(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_100031408(&qword_1000915A0);
      v11 = (_QWORD *)swift_allocObject(v10, 16 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 17;
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 4);
      v14 = v11 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = _swiftEmptyArrayStorage;
      v14 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[2 * v8 + 4])
          memmove(v14, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_100039504(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000354A4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t result;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  _QWORD *v42;
  int v43;
  __int128 v44[2];

  v3 = v2;
  v6 = type metadata accessor for TPTipsHelper.Entry.Kind(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v2;
  if (*(_QWORD *)(*v2 + 24) > a1)
    a1 = *(_QWORD *)(*v2 + 24);
  sub_100031408(&qword_100091628);
  v43 = a2;
  v11 = static _DictionaryStorage.resize(original:capacity:move:)(v10, a1, a2);
  v12 = v11;
  if (!*(_QWORD *)(v10 + 16))
    goto LABEL_43;
  v13 = 1 << *(_BYTE *)(v10 + 32);
  v14 = *(_QWORD *)(v10 + 64);
  v42 = (_QWORD *)(v10 + 64);
  if (v13 < 64)
    v15 = ~(-1 << v13);
  else
    v15 = -1;
  v16 = v15 & v14;
  v40 = v2;
  v41 = (unint64_t)(v13 + 63) >> 6;
  v17 = v11 + 64;
  result = swift_retain(v10);
  v19 = 0;
  while (1)
  {
    if (v16)
    {
      v21 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v22 = v21 | (v19 << 6);
      goto LABEL_24;
    }
    v23 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v23 >= v41)
      break;
    v24 = v42;
    v25 = v42[v23];
    ++v19;
    if (!v25)
    {
      v19 = v23 + 1;
      if (v23 + 1 >= v41)
        goto LABEL_36;
      v25 = v42[v19];
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v41)
        {
LABEL_36:
          swift_release(v10);
          v3 = v40;
          if ((v43 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v25 = v42[v26];
        if (!v25)
        {
          while (1)
          {
            v19 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_45;
            if (v19 >= v41)
              goto LABEL_36;
            v25 = v42[v19];
            ++v26;
            if (v25)
              goto LABEL_23;
          }
        }
        v19 = v26;
      }
    }
LABEL_23:
    v16 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v19 << 6);
LABEL_24:
    v27 = *(_QWORD *)(v7 + 72);
    v28 = *(_QWORD *)(v10 + 48) + v27 * v22;
    if ((v43 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 32))(v9, v28, v6);
      sub_100031678((__int128 *)(*(_QWORD *)(v10 + 56) + 40 * v22), (uint64_t)v44);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v9, v28, v6);
      sub_1000315D0(*(_QWORD *)(v10 + 56) + 40 * v22, (uint64_t)v44);
    }
    v29 = *(_QWORD *)(v12 + 40);
    v30 = sub_1000316E0(&qword_100091178, (uint64_t (*)(uint64_t))&type metadata accessor for TPTipsHelper.Entry.Kind, (uint64_t)&protocol conformance descriptor for TPTipsHelper.Entry.Kind);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v29, v6, v30);
    v31 = -1 << *(_BYTE *)(v12 + 32);
    v32 = result & ~v31;
    v33 = v32 >> 6;
    if (((-1 << v32) & ~*(_QWORD *)(v17 + 8 * (v32 >> 6))) != 0)
    {
      v20 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v17 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v34 = 0;
      v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v36 = v33 == v35;
        if (v33 == v35)
          v33 = 0;
        v34 |= v36;
        v37 = *(_QWORD *)(v17 + 8 * v33);
      }
      while (v37 == -1);
      v20 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(_QWORD *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(*(_QWORD *)(v12 + 48) + v27 * v20, v9, v6);
    result = sub_100031678(v44, *(_QWORD *)(v12 + 56) + 40 * v20);
    ++*(_QWORD *)(v12 + 16);
  }
  swift_release(v10);
  v3 = v40;
  v24 = v42;
  if ((v43 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v38 = 1 << *(_BYTE *)(v10 + 32);
  if (v38 >= 64)
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v38;
  *(_QWORD *)(v10 + 16) = 0;
LABEL_43:
  result = swift_release(v10);
  *v3 = v12;
  return result;
}

Swift::Int sub_10003584C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  Swift::Int result;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100031408(&qword_1000915C8);
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v3;
  v37 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v12 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 64;
  result = swift_retain(v5);
  v15 = 0;
  while (1)
  {
    if (v11)
    {
      v21 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v22 = v21 | (v15 << 6);
      goto LABEL_34;
    }
    v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v23 >= v12)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v37 + 8 * v23);
    ++v15;
    if (!v25)
    {
      v15 = v23 + 1;
      if (v23 + 1 >= v12)
        goto LABEL_36;
      v25 = *(_QWORD *)(v37 + 8 * v15);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v12)
        {
LABEL_36:
          swift_release(v5);
          v3 = v36;
          if ((a2 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v25 = *(_QWORD *)(v37 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v15 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_45;
            if (v15 >= v12)
              goto LABEL_36;
            v25 = *(_QWORD *)(v37 + 8 * v15);
            ++v26;
            if (v25)
              goto LABEL_33;
          }
        }
        v15 = v26;
      }
    }
LABEL_33:
    v11 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_34:
    v31 = 8 * v22;
    v32 = *(void **)(*(_QWORD *)(v5 + 48) + v31);
    v33 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v31);
    if ((a2 & 1) == 0)
    {
      v34 = v32;
      swift_bridgeObjectRetain(v33);
    }
    result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v8 + 40));
    v16 = -1 << *(_BYTE *)(v8 + 32);
    v17 = result & ~v16;
    v18 = v17 >> 6;
    if (((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v16) >> 6;
      do
      {
        if (++v18 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v29 = v18 == v28;
        if (v18 == v28)
          v18 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v13 + 8 * v18);
      }
      while (v30 == -1);
      v19 = __clz(__rbit64(~v30)) + (v18 << 6);
    }
    *(_QWORD *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    v20 = 8 * v19;
    *(_QWORD *)(*(_QWORD *)(v8 + 48) + v20) = v32;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + v20) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v36;
  v24 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v24, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

void *sub_100035B20()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  unint64_t v10;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  __int128 v27[2];

  v1 = v0;
  v2 = type metadata accessor for TPTipsHelper.Entry.Kind(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031408(&qword_100091628);
  v6 = *v0;
  v7 = static _DictionaryStorage.copy(original:)(*v0);
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release(v6);
LABEL_28:
    *v1 = v8;
    return result;
  }
  v25 = v1;
  result = (void *)(v7 + 64);
  v10 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10)
    result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  v26 = v6 + 64;
  v12 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v13 = 1 << *(_BYTE *)(v6 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(v6 + 64);
  v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v18 = v17 | (v12 << 6);
      goto LABEL_12;
    }
    v21 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v16)
      goto LABEL_26;
    v22 = *(_QWORD *)(v26 + 8 * v21);
    ++v12;
    if (!v22)
    {
      v12 = v21 + 1;
      if (v21 + 1 >= v16)
        goto LABEL_26;
      v22 = *(_QWORD *)(v26 + 8 * v12);
      if (!v22)
        break;
    }
LABEL_25:
    v15 = (v22 - 1) & v22;
    v18 = __clz(__rbit64(v22)) + (v12 << 6);
LABEL_12:
    v19 = *(_QWORD *)(v3 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v19, v2);
    v20 = 40 * v18;
    sub_1000315D0(*(_QWORD *)(v6 + 56) + v20, (uint64_t)v27);
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v19, v5, v2);
    result = (void *)sub_100031678(v27, *(_QWORD *)(v8 + 56) + v20);
  }
  v23 = v21 + 2;
  if (v23 >= v16)
  {
LABEL_26:
    result = (void *)swift_release(v6);
    v1 = v25;
    goto LABEL_28;
  }
  v22 = *(_QWORD *)(v26 + 8 * v23);
  if (v22)
  {
    v12 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v12 >= v16)
      goto LABEL_26;
    v22 = *(_QWORD *)(v26 + 8 * v12);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_100035D60()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  sub_100031408(&qword_1000915C8);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = (void *)swift_bridgeObjectRetain(v18);
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

_QWORD *sub_100035F08(uint64_t a1, uint64_t (*a2)(_QWORD *, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(_QWORD *, uint64_t, uint64_t);
  uint64_t v11;

  if ((unint64_t)a1 >> 62)
    goto LABEL_10;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return _swiftEmptyArrayStorage;
  while (1)
  {
    if (v4 <= 0)
    {
      v6 = _swiftEmptyArrayStorage;
    }
    else
    {
      v5 = sub_100031408((uint64_t *)&unk_100091FC0);
      v6 = (_QWORD *)swift_allocObject(v5, 8 * v4 + 32, 7);
      v7 = j__malloc_size(v6);
      v8 = v7 - 32;
      if (v7 < 32)
        v8 = v7 - 25;
      v6[2] = v4;
      v6[3] = (2 * (v8 >> 3)) | 1;
    }
    swift_bridgeObjectRetain(a1);
    v9 = a2(v6 + 4, v4, a1);
    a2 = v10;
    swift_bridgeObjectRelease(v9);
    if (a2 == (uint64_t (*)(_QWORD *, uint64_t, uint64_t))v4)
      break;
    __break(1u);
LABEL_10:
    if (a1 < 0)
      v11 = a1;
    else
      v11 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v4 = _CocoaArrayWrapper.endIndex.getter(v11);
    swift_bridgeObjectRelease(a1);
    if (!v4)
      return _swiftEmptyArrayStorage;
  }
  return v6;
}

_QWORD *sub_100036008(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  _QWORD *v8;
  int64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD v14[4];

  v3 = *(_QWORD *)(a3 + 16);
  if (!v3)
    return _swiftEmptyArrayStorage;
  v7 = sub_100031408((uint64_t *)&unk_100091FC0);
  v8 = (_QWORD *)swift_allocObject(v7, 8 * v3 + 32, 7);
  v9 = j__malloc_size(v8);
  v10 = v9 - 32;
  if (v9 < 32)
    v10 = v9 - 25;
  v8[2] = v3;
  v8[3] = (2 * (v10 >> 3)) | 1;
  v11 = sub_1000376AC(v14, (uint64_t)(v8 + 4), v3, a1, a2, a3);
  v12 = v14[0];
  swift_retain(a1);
  swift_retain(a2);
  swift_retain(a3);
  swift_release(v12);
  swift_release(v14[1]);
  swift_release(v14[2]);
  if (v11 != (_QWORD *)v3)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v8;
}

uint64_t sub_100036100(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id *v4;
  uint64_t v5;
  Swift::Int *v7;
  uint64_t v8;
  Swift::Int v9;
  id v11;
  char v12;
  id v13;
  char v14;
  id v16;
  char v17;
  id v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  char v23;

  v4 = (id *)(a3 + 32);
  v5 = *(_QWORD *)(a3 + 16);
  if (!a2)
  {
    if (v5)
    {
      type metadata accessor for MessageID(0);
      v11 = *v4;
      v12 = static NSObject.== infix(_:_:)();

      if ((v12 & 1) != 0)
        return 0;
      if (v5 == 1)
        return 0;
      v13 = *(id *)(a3 + 40);
      v14 = static NSObject.== infix(_:_:)();

      if ((v14 & 1) != 0)
        return 1;
      if (v5 != 2)
      {
        v16 = *(id *)(a3 + 48);
        v17 = static NSObject.== infix(_:_:)();

        if ((v17 & 1) != 0)
          return 2;
        if (v5 != 3)
        {
          v18 = *(id *)(a3 + 56);
          v19 = static NSObject.== infix(_:_:)();

          if ((v19 & 1) != 0)
            return 3;
          v20 = 0;
          v21 = a3 + 64;
          while (v5 - 4 != v20)
          {
            v22 = *(id *)(v21 + 8 * v20);
            v23 = static NSObject.== infix(_:_:)();

            ++v20;
            if ((v23 & 1) != 0)
              return v20 + 3;
          }
          return 0;
        }
      }
    }
    return 0;
  }
  v7 = (Swift::Int *)(a2 + 16);
  v8 = a2 + 32;
  swift_retain(a2);
  v9 = sub_100036648(a1, (uint64_t)v4, v5, v7, v8);
  swift_release(a2);
  return v9;
}

uint64_t sub_1000362E8(void *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  _QWORD *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16[24];

  v3 = v2;
  v5 = v2 + 1;
  v6 = a1;
  specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v6);
  v7 = *(_QWORD *)(v3[1] + 16);
  specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v7);
  v8 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v7, v6);
  result = specialized ContiguousArray._endMutation()(v8);
  v10 = *v3;
  v11 = *(_QWORD *)(v3[1] + 16);
  if (*v3)
  {
    swift_beginAccess(v10 + 16, v16, 0, 0);
    if (static _HashTable.maximumCapacity(forScale:)(*(_QWORD *)(v10 + 16) & 0x3FLL) >= v11)
    {
      result = swift_isUniquelyReferenced_native(*v3);
      v12 = *v3;
      if (!(_DWORD)result)
      {
        if (!v12)
        {
LABEL_12:
          __break(1u);
          return result;
        }
        v12 = _HashTable.copy()(*v3);
        result = swift_release(*v3);
        *v3 = v12;
      }
      if (v12)
      {
        v14 = *(_QWORD *)(v12 + 16);
        v13 = v12 + 16;
        v15 = *(_QWORD *)(*v5 + 16) + ~(*(uint64_t *)(v13 + 8) >> 6);
        return _HashTable.UnsafeHandle.subscript.setter((-1 << v14) ^ ~(((v15 >> 63) & ~(-1 << v14)) + v15), a2, v13, v13 + 16);
      }
      __break(1u);
      goto LABEL_12;
    }
  }
  else if ((unint64_t)v11 < 0x10)
  {
    return result;
  }
  return sub_100036410();
}

uint64_t sub_100036410()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  char v9[24];

  v1 = *v0;
  v2 = v0[1];
  if (*v0)
  {
    swift_beginAccess(v1 + 16, v9, 0, 0);
    v3 = *(_QWORD *)(v1 + 24) & 0x3FLL;
    v4 = *(_QWORD *)(v2 + 16);
    if (v3)
      goto LABEL_7;
  }
  else
  {
    v3 = 0;
    v4 = *(_QWORD *)(v2 + 16);
  }
  if (v4 < 0x10)
  {
    v5 = 0;
    goto LABEL_11;
  }
LABEL_7:
  v6 = static _HashTable.scale(forCapacity:)(v4);
  if (v3 <= v6)
    v7 = v6;
  else
    v7 = v3;
  v5 = sub_1000364B0(v2, v7, 0, v3);
LABEL_11:
  result = swift_release(v1);
  *v0 = v5;
  return result;
}

uint64_t sub_1000364B0(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = static _HashTable.scale(forCapacity:)(*(_QWORD *)(a1 + 16));
  v9 = 0;
  if ((a3 & 1) != 0)
    v10 = 0;
  else
    v10 = a2;
  if (v10 <= v8)
    v10 = v8;
  if (v10 <= a4)
    v11 = a4;
  else
    v11 = v10;
  if (v11 >= 5)
  {
    v9 = _HashTable.init(scale:reservedScale:)();
    sub_100036540(v9 + 16, v9 + 32, a1);
  }
  return v9;
}

Swift::Int sub_100036540(Swift::Int result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  Swift::Int *v5;
  uint64_t v6;
  Swift::Int v7;
  id v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = *(_QWORD *)(a3 + 16);
  if (v3)
  {
    v5 = (Swift::Int *)result;
    v6 = 0;
    v13 = a3 + 32;
    while (1)
    {
      v7 = *v5;
      v8 = *(id *)(v13 + 8 * v6);
      result = NSObject._rawHashValue(seed:)(v7);
      v9 = 1 << *v5;
      v10 = __OFSUB__(v9, 1);
      v11 = v9 - 1;
      if (v10)
        break;
      v12 = _HashTable.UnsafeHandle._startIterator(bucket:)(v11 & result, v5, a2);

      if (v12)
      {
        while (1)
          _HashTable.BucketIterator.advance()();
      }
      result = _HashTable.BucketIterator.currentValue.setter(v6++, 0);
      if (v6 == v3)
        return result;
    }
    __break(1u);
  }
  return result;
}

Swift::Int sub_100036648(uint64_t a1, uint64_t a2, uint64_t a3, Swift::Int *a4, uint64_t a5)
{
  Swift::Int result;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  id v14;
  char v15;
  char v16;

  result = NSObject._rawHashValue(seed:)(*a4);
  v9 = 1 << *a4;
  v10 = __OFSUB__(v9, 1);
  v11 = v9 - 1;
  if (v10)
  {
    __break(1u);
  }
  else
  {
    _HashTable.UnsafeHandle._startIterator(bucket:)(v11 & result, a4, a5);
    v12 = _HashTable.BucketIterator.currentValue.getter();
    if ((v13 & 1) == 0)
    {
      type metadata accessor for MessageID(0);
      do
      {
        v14 = *(id *)(a2 + 8 * v12);
        v15 = static NSObject.== infix(_:_:)();

        if ((v15 & 1) != 0)
          break;
        _HashTable.BucketIterator.advance()();
        v12 = _HashTable.BucketIterator.currentValue.getter();
      }
      while ((v16 & 1) == 0);
    }
    return v12;
  }
  return result;
}

uint64_t sub_100036788(uint64_t result, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17[24];
  char v18[24];
  char v19[24];

  if (result < 0)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v3 = v2;
  v5 = result;
  specialized ContiguousArray.reserveCapacity(_:)(result);
  v7 = *v2;
  v6 = v2[1];
  if (*v2)
  {
    swift_beginAccess(v7 + 16, v17, 0, 0);
    v8 = *(_QWORD *)(v7 + 16) & 0x3FLL;
    v9 = static _HashTable.scale(forCapacity:)(v5);
    v10 = v9;
    if ((a2 & 1) != 0)
    {
      v11 = v9;
      if (v8 >= v9)
        goto LABEL_14;
    }
    else
    {
      swift_beginAccess(v7 + 16, v18, 0, 0);
      v11 = *(_QWORD *)(v7 + 24) & 0x3FLL;
      if (v8 >= v10)
        goto LABEL_14;
    }
LABEL_10:
    if (v11 <= v10)
      v13 = v10;
    else
      v13 = v11;
    goto LABEL_23;
  }
  v12 = static _HashTable.scale(forCapacity:)(v5);
  v10 = v12;
  v8 = 0;
  if ((a2 & 1) != 0)
    v11 = v12;
  else
    v11 = 0;
  if (v12 > 0)
    goto LABEL_10;
LABEL_14:
  if (v11 > v10)
    v10 = v11;
  result = static _HashTable.scale(forCapacity:)(*(_QWORD *)(v6 + 16));
  if (result <= v10)
    v14 = v10;
  else
    v14 = result;
  if (v14 < v8)
  {
    if (v11 <= v14)
      v13 = v14;
    else
      v13 = v11;
LABEL_23:
    v15 = sub_1000364B0(v6, v13, 0, v11);
    result = swift_release(*v3);
    *v3 = v15;
    return result;
  }
  if (!v7 || (result = swift_isUniquelyReferenced_native(*v3), (_DWORD)result))
  {
    v16 = *v3;
    if (*v3)
      goto LABEL_28;
LABEL_32:
    if (!v11)
      return result;
    __break(1u);
    goto LABEL_34;
  }
  result = *v3;
  if (!*v3)
  {
LABEL_35:
    __break(1u);
    return result;
  }
  v16 = _HashTable.copy()();
  result = swift_release(*v3);
  *v3 = v16;
  if (!v16)
    goto LABEL_32;
LABEL_28:
  result = swift_beginAccess(v16 + 16, v19, 1, 0);
  if ((*(_QWORD *)(v16 + 24) & 0x3FLL) != v11)
    *(_QWORD *)(v16 + 24) = *(_QWORD *)(v16 + 24) & 0xFFFFFFFFFFFFFFC0 | v11 & 0x3F;
  return result;
}

uint64_t sub_100036930(unint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t result;

  v3 = *v1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v1);
  *v1 = v3;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v3 = sub_100036A18(v3);
    *v1 = v3;
  }
  v5 = *(_QWORD *)(v3 + 16);
  if (v5 <= a1)
  {
    __break(1u);
  }
  else
  {
    v6 = v5 - 1;
    v7 = v5 - 1 - a1;
    if (v7 >= 0)
    {
      v8 = v3 + 8 * a1;
      v9 = *(_QWORD *)(v8 + 32);
      v10 = memmove((void *)(v8 + 32), (const void *)(v8 + 40), 8 * v7);
      *(_QWORD *)(v3 + 16) = v6;
      specialized ContiguousArray._endMutation()(v10);
      return v9;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

uint64_t sub_100036A04(_QWORD *a1)
{
  return sub_1000489E8(0, a1[2], 0, a1);
}

uint64_t sub_100036A18(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(a1 + 16), 0, a1);
}

void sub_100036A2C(uint64_t a1, Swift::Int *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  Swift::Int v14;
  id v15;
  Swift::Int v16;
  uint64_t v17;
  uint64_t v18;
  Swift::Int v19;
  uint64_t v22;
  char v23;
  uint64_t v25;

  v7 = a1;
  v25 = _HashTable.UnsafeHandle._startIterator(bucket:)(a1, a2, a3);
  _HashTable.BucketIterator.advance()();
  if (!v25)
  {
    _HashTable.UnsafeHandle.subscript.setter(0, v7, a2, a3);
    return;
  }
  v8 = a1;
  v9 = _HashTable.UnsafeHandle.firstOccupiedBucketInChain(with:)(v7, a2, a3);
  while (1)
  {
    v11 = _HashTable.BucketIterator.currentValue.getter();
    if ((v12 & 1) != 0)
      break;
    if ((v11 & 0x8000000000000000) != 0)
    {
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
      break;
    }
    v13 = *(_QWORD *)(a4 + 8);
    if (v11 >= *(_QWORD *)(v13 + 16))
      goto LABEL_24;
    v14 = *a2;
    v15 = *(id *)(v13 + 8 * v11 + 32);
    v16 = NSObject._rawHashValue(seed:)(v14);

    v17 = 1 << *a2;
    v18 = v17 - 1;
    if (__OFSUB__(v17, 1))
      goto LABEL_25;
    v19 = v18 & v16;
    if (v7 >= v9)
    {
      if (v19 >= v9 && v7 >= v19)
      {
LABEL_20:
        v22 = _HashTable.BucketIterator.currentValue.getter();
        if ((v23 & 1) != 0)
          v10 = 0;
        else
          v10 = ((v18 & ((v22 - (a2[1] >> 6)) >> 63)) + v22 - (a2[1] >> 6)) ^ v18;
        _HashTable.UnsafeHandle.subscript.setter(v10, v7, a2, a3);
        v7 = v8;
      }
    }
    else if (v19 >= v9 || v7 >= v19)
    {
      goto LABEL_20;
    }
    _HashTable.BucketIterator.advance()();
    v8 = a1;
  }
  __break(1u);
}

void sub_100036BE0(uint64_t a1, uint64_t a2, uint64_t a3, Swift::Int *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Swift::Int v14;
  id v15;
  Swift::Int v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  Swift::Int v33;
  id v34;
  Swift::Int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;

  v6 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  if (v6 >= 1)
  {
    v11 = *(_QWORD *)(a3 + 16);
    v12 = v11 - v6;
    if ((uint64_t)v11 < v6)
      ++v12;
    if (a1 < v12 >> 1)
    {
      if (static _HashTable.maximumCapacity(forScale:)(*a4 & 0x3F) / 3 > a1)
      {
        if (a1 < 0)
        {
LABEL_64:
          __break(1u);
          goto LABEL_65;
        }
        if (v11 < a1)
        {
LABEL_65:
          __break(1u);
          goto LABEL_66;
        }
        if (a1)
        {
          swift_retain(a3);
          v13 = 0;
          while (1)
          {
            v14 = *a4;
            v15 = *(id *)(a3 + 32 + 8 * v13);
            v16 = NSObject._rawHashValue(seed:)(v14);
            v17 = 1 << *a4;
            v18 = __OFSUB__(v17, 1);
            v19 = v17 - 1;
            if (v18)
              break;
            if (_HashTable.UnsafeHandle._startIterator(bucket:)(v19 & v16, a4, a5))
            {
              while (1)
              {
                v20 = _HashTable.BucketIterator.currentValue.getter();
                if ((v21 & 1) == 0 && v20 == v13)
                  break;
                _HashTable.BucketIterator.advance()();
              }
            }
            v22 = v13 + v6;
            if (__OFADD__(v13, v6))
              goto LABEL_56;
            ++v13;
            _HashTable.BucketIterator.currentValue.setter(v22, 0);

            if (v13 == a1)
            {
              swift_release(a3);
              goto LABEL_20;
            }
          }
          __break(1u);
LABEL_56:
          __break(1u);
          goto LABEL_57;
        }
        goto LABEL_20;
      }
      _HashTable.UnsafeHandle._startIterator(bucket:)(0, a4, a5);
      v27 = _HashTable.BucketIterator.currentValue.getter();
      if ((v28 & 1) != 0 || v27 >= a1)
      {
LABEL_32:
        _HashTable.BucketIterator.advance()();
LABEL_20:
        v23 = a4[1];
        if (__OFSUB__(v23 >> 6, v6))
        {
LABEL_62:
          __break(1u);
          goto LABEL_63;
        }
        v24 = 1 << *a4;
        v18 = __OFSUB__(v24, 1);
        v25 = v24 - 1;
        if (v18)
        {
LABEL_63:
          __break(1u);
          goto LABEL_64;
        }
        v26 = (v25 & (((v23 >> 6) - v6) >> 63)) + (v23 >> 6) - v6;
        if (v26 < v25)
          v25 = 0;
        a4[1] = a4[1] & 0x3F | ((v26 - v25) << 6);
        return;
      }
      v18 = __OFADD__(v27, v6);
      v29 = v27 + v6;
      if (!v18)
      {
        _HashTable.BucketIterator.currentValue.setter(v29, 0);
        goto LABEL_32;
      }
      __break(1u);
LABEL_38:
      _HashTable.UnsafeHandle._startIterator(bucket:)(0, a4, a5);
      v30 = _HashTable.BucketIterator.currentValue.getter();
      if ((v31 & 1) == 0 && v30 >= v5)
      {
        v18 = __OFSUB__(v30, v6);
        v32 = v30 - v6;
        if (v18)
        {
LABEL_57:
          __break(1u);
LABEL_58:
          __break(1u);
LABEL_59:
          __break(1u);
          goto LABEL_60;
        }
        _HashTable.BucketIterator.currentValue.setter(v32, 0);
      }
      _HashTable.BucketIterator.advance()();
      return;
    }
    v5 = a2;
    if (__OFSUB__(v11, a2))
    {
LABEL_61:
      __break(1u);
      goto LABEL_62;
    }
    if ((uint64_t)(v11 - a2) >= static _HashTable.maximumCapacity(forScale:)(*a4 & 0x3F) / 3)
      goto LABEL_38;
    if ((uint64_t)v11 < v5)
    {
LABEL_66:
      __break(1u);
      goto LABEL_67;
    }
    if (v5 < 0)
    {
LABEL_67:
      __break(1u);
      goto LABEL_68;
    }
    if (v11 != v5)
    {
      if (v11 <= v5)
      {
LABEL_68:
        __break(1u);
        return;
      }
      swift_retain(a3);
      while (1)
      {
        v33 = *a4;
        v34 = *(id *)(a3 + 32 + 8 * v5);
        v35 = NSObject._rawHashValue(seed:)(v33);
        v36 = 1 << *a4;
        v18 = __OFSUB__(v36, 1);
        v37 = v36 - 1;
        if (v18)
          goto LABEL_58;
        if (_HashTable.UnsafeHandle._startIterator(bucket:)(v37 & v35, a4, a5))
        {
          while (1)
          {
            v38 = _HashTable.BucketIterator.currentValue.getter();
            if ((v39 & 1) == 0 && v38 == v5)
              break;
            _HashTable.BucketIterator.advance()();
          }
        }
        v40 = v5 - v6;
        if (__OFSUB__(v5, v6))
          goto LABEL_59;
        ++v5;
        _HashTable.BucketIterator.currentValue.setter(v40, 0);

        if (v5 == v11)
        {
          swift_release(a3);
          return;
        }
      }
    }
  }
}

uint64_t sub_100037044(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  sub_10003779C(a1, a2, (void (*)(uint64_t *__return_ptr, id *))sub_100037784, 0);
  v7 = v6;
  v8 = sub_100037100();
  v9 = sub_1000364B0(v7, 0, 1, v8);
  if (*(_QWORD *)(v7 + 16) <= 0xFuLL)
  {
    swift_release(v9);
    v9 = 0;
  }
  v11 = *a3;
  v10 = a3[1];
  *a3 = v9;
  a3[1] = v7;
  swift_release(v10);
  swift_release(v11);
  sub_10003779C(a1, a2, (void (*)(uint64_t *__return_ptr, id *))sub_100037790, 0);
  v12 = a3[2];
  a3[2] = v13;
  return swift_release(v12);
}

uint64_t sub_100037100()
{
  return 0;
}

uint64_t sub_100037108(void **__src, void **a2, unint64_t a3, void **__dst, uint64_t (*a5)(void **, void **, void **, uint64_t *))
{
  uint64_t v5;
  char *v6;
  void **v7;
  void **v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void **v18;
  void *v19;
  uint64_t v20;
  char *v21;
  id v22;
  id v23;
  char v24;
  char v25;
  void **v26;
  void **v27;
  char *v28;
  uint64_t v29;
  void **v30;
  void **v31;
  void *v32;
  char *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  char v38;
  char v39;
  void **v40;
  char *v41;
  unint64_t v42;
  uint64_t result;
  char *v44;
  unint64_t v45;
  char *v46;
  void **v47;
  void **v50;
  void **v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  char *v56;
  void **v57;
  void **v58;

  v6 = (char *)__dst;
  v7 = a2;
  v8 = __src;
  v9 = (char *)a2 - (char *)__src;
  v10 = (char *)a2 - (char *)__src + 15;
  if ((char *)a2 - (char *)__src >= 0)
    v10 = (char *)a2 - (char *)__src;
  v11 = v10 >> 4;
  v12 = a3 - (_QWORD)a2;
  v13 = a3 - (_QWORD)a2 + 15;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v13 = a3 - (_QWORD)a2;
  v14 = v13 >> 4;
  v58 = __src;
  v57 = __dst;
  if (v11 >= v13 >> 4)
  {
    if (v12 >= -15)
    {
      if (__dst != a2 || &a2[2 * v14] <= __dst)
        memmove(__dst, a2, 16 * v14);
      v28 = &v6[16 * v14];
      v56 = v28;
      v58 = v7;
      if (v8 < v7)
      {
        v29 = v5;
        if (v12 >= 16)
        {
          v30 = (void **)(a3 - 16);
          v31 = v7;
          v44 = v6;
          v51 = v8;
          while (1)
          {
            v45 = (unint64_t)v28;
            v47 = v7;
            v32 = (void *)*((_QWORD *)v28 - 2);
            v33 = v28 - 16;
            v34 = *(v31 - 2);
            v35 = (uint64_t)*(v31 - 1);
            v31 -= 2;
            v54 = (void *)*((_QWORD *)v28 - 1);
            v17 = v54;
            v55 = v32;
            v52 = v35;
            v53 = v34;
            v36 = v32;
            swift_unknownObjectRetain(v17);
            v37 = v34;
            swift_unknownObjectRetain(v35);
            v38 = a5(&v55, &v54, &v53, &v52);
            if (v29)
              break;
            v39 = v38;
            v40 = v30 + 2;

            swift_unknownObjectRelease(v35);
            swift_unknownObjectRelease(v17);
            if ((v39 & 1) != 0)
            {
              v28 = (char *)v45;
              v41 = v44;
              v42 = (unint64_t)v51;
              if (v40 != v47 || v30 >= v47)
                *(_OWORD *)v30 = *(_OWORD *)v31;
              v58 = v31;
            }
            else
            {
              v56 = v33;
              v41 = v44;
              v42 = (unint64_t)v51;
              v31 = v47;
              if ((unint64_t)v40 < v45 || (unint64_t)v30 >= v45 || v40 != (void **)v45)
                *(_OWORD *)v30 = *(_OWORD *)v33;
              v28 = v33;
            }
            v29 = 0;
            if ((unint64_t)v31 > v42)
            {
              v30 -= 2;
              v7 = v31;
              if (v28 > v41)
                continue;
            }
            goto LABEL_50;
          }

          swift_unknownObjectRelease(v35);
LABEL_49:
          swift_unknownObjectRelease(v17);
        }
      }
LABEL_50:
      sub_1000375F0((void **)&v58, (const void **)&v57, &v56);
      return 1;
    }
  }
  else if (v9 >= -15)
  {
    v15 = v5;
    if (__dst != __src || &__src[2 * v11] <= __dst)
      memmove(__dst, __src, 16 * v11);
    v46 = &v6[16 * v11];
    v56 = v46;
    if ((unint64_t)v7 < a3 && v9 >= 16)
    {
      while (1)
      {
        v50 = v8;
        v16 = *v7;
        v17 = v7[1];
        v18 = v7;
        v19 = *(void **)v6;
        v20 = *((_QWORD *)v6 + 1);
        v21 = v6;
        v54 = v17;
        v55 = v16;
        v52 = v20;
        v53 = v19;
        v22 = v16;
        swift_unknownObjectRetain(v17);
        v23 = v19;
        swift_unknownObjectRetain(v20);
        v24 = a5(&v55, &v54, &v53, &v52);
        if (v15)
        {

          swift_unknownObjectRelease(v20);
          goto LABEL_49;
        }
        v25 = v24;

        swift_unknownObjectRelease(v20);
        swift_unknownObjectRelease(v17);
        if ((v25 & 1) != 0)
        {
          v26 = v18 + 2;
          v27 = v50;
          v6 = v21;
          if (v50 >= v18 && v50 < v26)
          {
            v15 = 0;
            if (v50 != v18)
              *(_OWORD *)v50 = *(_OWORD *)v18;
            goto LABEL_23;
          }
          *(_OWORD *)v50 = *(_OWORD *)v18;
        }
        else
        {
          v27 = v50;
          if (v50 != (void **)v21)
            *(_OWORD *)v50 = *(_OWORD *)v21;
          v6 = v21 + 16;
          v57 = (void **)(v21 + 16);
          v26 = v18;
        }
        v15 = 0;
LABEL_23:
        v8 = v27 + 2;
        v58 = v8;
        if (v6 < v46)
        {
          v7 = v26;
          if ((unint64_t)v26 < a3)
            continue;
        }
        goto LABEL_50;
      }
    }
    goto LABEL_50;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

char *sub_1000374F8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100031408(&qword_100091590);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 16 * v8);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_1000375F0(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;
  char v9;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 15;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -16)
  {
    v9 = 2;
    result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v9, 1046, 0);
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
      return (char *)memmove(result, v3, 16 * v7);
  }
  return result;
}

char *sub_100037698(uint64_t a1)
{
  return sub_1000374F8(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

_QWORD *sub_1000376AC(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v7 = result;
  if (!a2)
  {
LABEL_10:
    v8 = 0;
    goto LABEL_14;
  }
  v8 = a3;
  if (!a3)
  {
LABEL_14:
    *v7 = a4;
    v7[1] = a5;
    v7[2] = a6;
    v7[3] = v8;
    return (_QWORD *)v8;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v9 = *(_QWORD *)(a6 + 16);
    if (v9)
    {
      v14 = a4;
      v15 = a5;
      v11 = 0;
      v12 = a3 - 1;
      while (1)
      {
        *(_QWORD *)(a2 + 8 * v11) = *(_QWORD *)(a6 + 32 + 8 * v11);
        if (v12 == v11)
          break;
        if (v9 - 1 == v11)
        {
          v8 = v9;
          break;
        }
        v13 = *(_QWORD *)(a6 + 16);
        swift_unknownObjectRetain();
        if (++v11 >= v13)
        {
          __break(1u);
          goto LABEL_10;
        }
      }
      swift_unknownObjectRetain();
      a4 = v14;
      a5 = v15;
    }
    else
    {
      v8 = 0;
    }
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

id sub_100037784@<X0>(void **a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;

  v2 = *a1;
  *a2 = v2;
  return v2;
}

uint64_t sub_100037790@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(a1 + 8);
  return swift_unknownObjectRetain();
}

void sub_10003779C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr, id *), uint64_t a4)
{
  uint64_t i;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v10;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  const void *v30;
  BOOL v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v36;
  id v37;
  uint64_t v38;

  v10 = a2;
  if (a2 > 0)
  {
    v12 = sub_100031408((uint64_t *)&unk_100091FC0);
    v5 = (_QWORD *)swift_allocObject(v12, 8 * v10 + 32, 7);
    v13 = j__malloc_size(v5);
    v14 = v13 - 32;
    if (v13 < 32)
      v14 = v13 - 25;
    i = v14 >> 3;
    v5[2] = v10;
    v5[3] = (2 * (v14 >> 3)) | 1;
    if (a1)
      v6 = a1 + 16 * v10;
    else
      v6 = 0;
    swift_retain(a4);
    if (!a1)
      goto LABEL_16;
    v7 = (i & 0x7FFFFFFFFFFFFFFFLL) - v10;
    v15 = v10 - 1;
    v8 = v5 + 5;
    for (i = (uint64_t)a3; a1 != v6; a1 += 16)
    {
      v10 = *(_QWORD *)(a1 + 8);
      v37 = *(id *)a1;
      v38 = v10;
      v16 = v37;
      swift_unknownObjectRetain(v10);
      a3(&v36, &v37);
      swift_unknownObjectRelease(v10);

      *(v8 - 1) = v36;
      if (!v15)
        goto LABEL_17;
      --v15;
      ++v8;
    }
    __break(1u);
  }
  if (v10 < 0)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v7 = _swiftEmptyArrayStorage[3] >> 1;
  v5 = _swiftEmptyArrayStorage;
  if (a1)
  {
    i = (uint64_t)a3;
    v6 = a1 + 16 * v10;
    swift_retain(a4);
    v8 = &_swiftEmptyArrayStorage[4];
    while (1)
    {
      if (a1 == v6)
      {
        swift_release(a4);
        goto LABEL_35;
      }
      v17 = *(_QWORD *)(a1 + 8);
      v37 = *(id *)a1;
      v38 = v17;
      v18 = v37;
      swift_unknownObjectRetain(v17);
      ((void (*)(uint64_t *__return_ptr, id *))i)(&v36, &v37);
      swift_unknownObjectRelease(v17);

      v19 = v36;
      if (!v7)
      {
        v20 = v5[3];
        if ((uint64_t)((v20 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_40;
        v21 = v20 & 0xFFFFFFFFFFFFFFFELL;
        if (v21 <= 1)
          v22 = 1;
        else
          v22 = v21;
        v23 = sub_100031408((uint64_t *)&unk_100091FC0);
        v24 = (_QWORD *)swift_allocObject(v23, 8 * v22 + 32, 7);
        v25 = j__malloc_size(v24);
        v26 = v25 - 32;
        if (v25 < 32)
          v26 = v25 - 25;
        v27 = v26 >> 3;
        v24[2] = v22;
        v24[3] = (2 * (v26 >> 3)) | 1;
        v28 = (unint64_t)(v24 + 4);
        v29 = v5[3] >> 1;
        if (v5[2])
        {
          v30 = v5 + 4;
          if (v24 != v5 || v28 >= (unint64_t)v30 + 8 * v29)
            memmove(v24 + 4, v30, 8 * v29);
          v5[2] = 0;
        }
        v8 = (_QWORD *)(v28 + 8 * v29);
        v7 = (v27 & 0x7FFFFFFFFFFFFFFFLL) - v29;
        swift_release(v5);
        v5 = v24;
        i = (uint64_t)a3;
      }
      v31 = __OFSUB__(v7--, 1);
      if (v31)
        break;
      *v8++ = v19;
LABEL_17:
      a1 += 16;
    }
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
LABEL_35:
  v32 = v5[3];
  if (v32 >= 2)
  {
    v33 = v32 >> 1;
    v31 = __OFSUB__(v33, v7);
    v34 = v33 - v7;
    if (v31)
    {
LABEL_41:
      __break(1u);
      return;
    }
    v5[2] = v34;
  }
}

void sub_100037A34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v6;
  unint64_t *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  id v18;
  id v19;
  unint64_t v20;
  unint64_t v21;
  BOOL v22;
  unint64_t v23;

  v3 = *(_QWORD *)(a3 + 16);
  if (!v3)
  {
    v11 = &_swiftEmptyArrayStorage[2];
    v20 = _swiftEmptyArrayStorage[3];
    a2 = v20 >> 1;
    if (v20 < 2)
      return;
    goto LABEL_12;
  }
  v4 = a3;
  v6 = sub_100031408(&qword_100091598);
  v7 = (unint64_t *)swift_allocObject(v6, 16 * v3 + 32, 7);
  v8 = j__malloc_size(v7);
  v9 = v8 - 32;
  if (v8 < 32)
    v9 = v8 - 17;
  v10 = v9 >> 4;
  v7[2] = v3;
  v11 = v7 + 2;
  v7[3] = 2 * v10;
  v12 = *(_QWORD *)(a2 + 16);
  if (v12)
  {
    v13 = (uint64_t *)(a2 + 32);
    v14 = (uint64_t *)(v4 + 32);
    v15 = v3 - 1;
    a2 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    v16 = 4;
    while (1)
    {
      v17 = (uint64_t *)&v7[v16];
      v10 = *v13;
      v4 = *v14;
      *v17 = *v13;
      v17[1] = v4;
      if (!v15)
        break;
      v18 = (id)v10;
      swift_unknownObjectRetain(v4);
      ++v13;
      ++v14;
      --v15;
      v16 += 2;
      --a2;
      if (!--v12)
        goto LABEL_8;
    }
  }
  else
  {
LABEL_8:
    __break(1u);
  }
  v19 = (id)v10;
  swift_unknownObjectRetain(v4);
  v20 = v7[3];
  if (v20 >= 2)
  {
LABEL_12:
    v21 = v20 >> 1;
    v22 = __OFSUB__(v21, a2);
    v23 = v21 - a2;
    if (v22)
      __break(1u);
    else
      *v11 = v23;
  }
}

uint64_t sub_100037B70(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else
  {
    if (v4 < 0)
    {
      result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v6 = a4 + 16 * a1 + 32;
    v7 = a3 + 16 * v4;
    if (v6 >= v7 || v6 + 16 * v4 <= a3)
    {
      v8 = sub_100031408(&qword_1000915E8);
      swift_arrayInitWithCopy(a3, v6, v4, v8);
      return v7;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_100037C78(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else
  {
    if (v4 < 0)
    {
      result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v6 = a4 + 16 * a1 + 32;
    v7 = a3 + 16 * v4;
    if (v6 >= v7 || v6 + 16 * v4 <= a3)
    {
      v8 = sub_100031408(&qword_1000915D8);
      swift_arrayInitWithCopy(a3, v6, v4, v8);
      return v7;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_100037D80(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t result;
  uint64_t v16;
  char v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE v29[24];
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;

  v2 = _swiftEmptyArrayStorage;
  v3 = _swiftEmptyArrayStorage;
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0)
  {
    v3 = sub_100035F08((uint64_t)_swiftEmptyArrayStorage, (uint64_t (*)(_QWORD *, uint64_t, uint64_t))sub_1000511BC);
    v2 = sub_100035F08((uint64_t)_swiftEmptyArrayStorage, (uint64_t (*)(_QWORD *, uint64_t, uint64_t))sub_100050FB4);
  }
  v31 = 0;
  v32 = v3;
  v30 = v2;
  v4 = *(_QWORD *)(a1 + 16);
  sub_100036788(v4, 0);
  specialized ContiguousArray.reserveCapacity(_:)(v4);
  if (v4)
  {
    swift_bridgeObjectRetain(a1);
    v28 = a1;
    v5 = (uint64_t *)(a1 + 40);
    while (1)
    {
      v11 = *v5;
      v12 = v31;
      v13 = (uint64_t)v32;
      v14 = (id)*(v5 - 1);
      swift_unknownObjectRetain(v11);
      result = sub_100036100((uint64_t)v14, v12, v13);
      if ((v17 & 1) == 0)
      {
        __break(1u);
        return result;
      }
      v8 = v16;
      v18 = v14;
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v18);
      v19 = v32[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v19);
      v20 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v19, v18);
      v7 = specialized ContiguousArray._endMutation()(v20);
      v21 = v31;
      v22 = (uint64_t)v32;
      v23 = v32[2];
      if (v31)
      {
        swift_beginAccess(v31 + 16, v29, 0, 0);
        if (static _HashTable.maximumCapacity(forScale:)(*(_QWORD *)(v21 + 16) & 0x3FLL) >= (uint64_t)v23)
        {
          if ((swift_isUniquelyReferenced_native(v21) & 1) == 0)
          {
            v27 = _HashTable.copy()(v21);
            swift_release(v21);
            v31 = v27;
            v21 = v27;
            if (!v27)
            {
              __break(1u);
LABEL_21:
              swift_bridgeObjectRelease(v28);
              return v8;
            }
          }
          v6 = *(_QWORD *)(v22 + 16) + ~(*(uint64_t *)(v21 + 24) >> 6);
          v7 = _HashTable.UnsafeHandle.subscript.setter((-1 << *(_QWORD *)(v21 + 16)) ^ ~(((v6 >> 63) & ~(-1 << *(_QWORD *)(v21 + 16))) + v6), v8, v21 + 16, v21 + 32);
          v8 = v21;
        }
        else
        {
          v24 = *(_QWORD *)(v21 + 24) & 0x3FLL;
          if (v23 > 0xF || v24)
          {
LABEL_14:
            v25 = static _HashTable.scale(forCapacity:)(v23);
            if (v24 <= v25)
              v26 = v25;
            else
              v26 = v24;
            v8 = sub_1000364B0(v22, v26, 0, v24);
            v7 = swift_release(v21);
            v31 = v8;
            goto LABEL_6;
          }
          v7 = swift_release(v21);
          v8 = 0;
          v31 = 0;
        }
      }
      else
      {
        v24 = 0;
        v8 = 0;
        if (v23 > 0xF)
          goto LABEL_14;
      }
LABEL_6:
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v7);
      v9 = v30[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v9);
      v10 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v9, v11);
      specialized ContiguousArray._endMutation()(v10);

      v5 += 2;
      if (!--v4)
        goto LABEL_21;
    }
  }
  return v31;
}

void sub_100038020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(uint64_t *, uint64_t *, void **, uint64_t *))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v20;
  uint64_t v21;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;

  v6 = v5;
  if (a3 != a2)
  {
    v7 = a1;
    v8 = *a4;
    v9 = *a4 + 16 * a3 - 16;
LABEL_3:
    v10 = *(_OWORD *)(v8 + 16 * a3);
    v20 = v9;
    v21 = a3;
    while (1)
    {
      v11 = *(void **)v9;
      v12 = *(_QWORD *)(v9 + 8);
      v13 = *((_QWORD *)&v10 + 1);
      v26 = *((_QWORD *)&v10 + 1);
      v27 = v10;
      v24 = v12;
      v25 = v11;
      v23 = (id)v10;
      swift_unknownObjectRetain(v13);
      v14 = v11;
      swift_unknownObjectRetain(v12);
      v15 = v6;
      v16 = a5(&v27, &v26, &v25, &v24);
      swift_unknownObjectRelease(v13);

      swift_unknownObjectRelease(v12);
      if (v15)
        break;
      if ((v16 & 1) == 0)
      {
        v17 = v21;
        v6 = 0;
LABEL_10:
        a3 = v17 + 1;
        v9 = v20 + 16;
        v7 = a1;
        if (a3 != a2)
          goto LABEL_3;
        return;
      }
      if (!v8)
      {
        __break(1u);
        return;
      }
      v10 = *(_OWORD *)(v9 + 16);
      *(_OWORD *)(v9 + 16) = *(_OWORD *)v9;
      *(_OWORD *)v9 = v10;
      v9 -= 16;
      ++v7;
      v17 = v21;
      v6 = 0;
      if (v21 == v7)
        goto LABEL_10;
    }
  }
}

void sub_100038178(uint64_t *a1, uint64_t (*a2)(uint64_t *, uint64_t *, void **, uint64_t *))
{
  uint64_t v2;
  uint64_t v3;
  Swift::Int v5;
  Swift::Int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  Swift::Int v12;
  uint64_t v13;
  Swift::Int v14;
  Swift::Int v15;
  Swift::Int v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  int v25;
  int v26;
  uint64_t *v27;
  Swift::Int v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  __int128 *v34;
  Swift::Int v35;
  Swift::Int v36;
  __int128 *v37;
  __int128 v38;
  Swift::Int v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  char *v43;
  char *v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  BOOL v56;
  unint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  BOOL v66;
  uint64_t v67;
  char v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  BOOL v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char *v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  __int128 v91;
  Swift::Int v92;
  uint64_t v93;
  Swift::Int v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  id v99;
  char v100;
  char v101;
  char *v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  unint64_t v108;
  Swift::Int v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  Swift::Int v114;
  Swift::Int v115;
  Swift::Int v116;
  _QWORD *v117;
  char *v118;
  char *v119;
  Swift::Int v120;
  Swift::Int v121;
  uint64_t v122;
  void **__dst;
  uint64_t v124;
  uint64_t v126;
  void *v127;
  _QWORD v128[2];
  id v129;

  v3 = v2;
  v5 = a1[1];
  v6 = _minimumMergeRunLength(_:)(v5);
  if (v6 >= v5)
  {
    if (v5 < 0)
      goto LABEL_138;
    if (v5)
      sub_100038020(0, v5, 1, a1, a2);
    return;
  }
  if (v5 >= 0)
    v7 = v5;
  else
    v7 = v5 + 1;
  if (v5 < -1)
    goto LABEL_147;
  v120 = v5;
  v116 = v6;
  v112 = a1;
  if (v5 < 2)
  {
    v11 = (char *)_swiftEmptyArrayStorage;
    __dst = (void **)&_swiftEmptyArrayStorage[4];
    v117 = _swiftEmptyArrayStorage;
    if (v5 != 1)
    {
      v42 = _swiftEmptyArrayStorage[2];
      goto LABEL_102;
    }
  }
  else
  {
    v8 = v7 >> 1;
    v9 = sub_100031408(&qword_100091588);
    v10 = static Array._allocateBufferUninitialized(minimumCapacity:)(v8, v9);
    *(_QWORD *)(v10 + 16) = v8;
    v117 = (_QWORD *)v10;
    __dst = (void **)(v10 + 32);
  }
  v12 = 0;
  v13 = *a1;
  v113 = *a1 + 40;
  v111 = *a1 - 16;
  v11 = (char *)_swiftEmptyArrayStorage;
  v14 = v120;
  v124 = *a1;
  while (1)
  {
    v15 = v12;
    v16 = v12 + 1;
    if (v12 + 1 < v14)
    {
      v118 = v11;
      v17 = v13 + 16 * v16;
      v18 = *(void **)v17;
      v19 = *(_QWORD *)(v17 + 8);
      v20 = v13 + 16 * v15;
      v21 = *(void **)v20;
      v22 = *(_QWORD *)(v20 + 8);
      v129 = v18;
      v127 = v21;
      v128[0] = v19;
      v126 = v22;
      v23 = v18;
      swift_unknownObjectRetain(v19);
      v24 = v21;
      swift_unknownObjectRetain(v22);
      v25 = a2((uint64_t *)&v129, v128, &v127, &v126);
      if (v3)
      {
        swift_bridgeObjectRelease(v118);
        swift_unknownObjectRelease(v19);

        swift_unknownObjectRelease(v22);
LABEL_116:
        v117[2] = 0;
        swift_bridgeObjectRelease(v117);
        return;
      }
      v26 = v25;
      swift_unknownObjectRelease(v19);

      swift_unknownObjectRelease(v22);
      v16 = v15 + 2;
      if (v15 + 2 < v120)
      {
        v114 = v15;
        v27 = (uint64_t *)(v113 + 16 * v15);
        while (1)
        {
          v28 = v16;
          v29 = *v27;
          v30 = (void *)*(v27 - 3);
          v31 = *(v27 - 2);
          v129 = (id)*(v27 - 1);
          v127 = v30;
          v128[0] = v29;
          v126 = v31;
          v32 = v129;
          swift_unknownObjectRetain(v29);
          v33 = v30;
          swift_unknownObjectRetain(v31);
          LODWORD(v30) = a2((uint64_t *)&v129, v128, &v127, &v126);
          swift_unknownObjectRelease(v29);

          swift_unknownObjectRelease(v31);
          if (((v26 ^ v30) & 1) != 0)
            break;
          v16 = v28 + 1;
          v27 += 2;
          if (v120 == v28 + 1)
          {
            v16 = v120;
            goto LABEL_21;
          }
        }
        v16 = v28;
LABEL_21:
        v15 = v114;
      }
      v13 = v124;
      if ((v26 & 1) != 0)
      {
        v11 = v118;
        if (v16 < v15)
          goto LABEL_142;
        if (v15 < v16)
        {
          v34 = (__int128 *)(v111 + 16 * v16);
          v35 = v16;
          v36 = v15;
          v37 = (__int128 *)(v124 + 16 * v15);
          do
          {
            if (v36 != --v35)
            {
              if (!v124)
                goto LABEL_145;
              v38 = *v37;
              *v37 = *v34;
              *v34 = v38;
            }
            ++v36;
            --v34;
            ++v37;
          }
          while (v36 < v35);
        }
      }
      else
      {
        v11 = v118;
      }
    }
    if (v16 >= v120)
      goto LABEL_40;
    if (__OFSUB__(v16, v15))
      goto LABEL_139;
    if (v16 - v15 >= v116)
    {
LABEL_40:
      if (v16 < v15)
        goto LABEL_137;
      goto LABEL_41;
    }
    if (__OFADD__(v15, v116))
      goto LABEL_140;
    v39 = v120;
    if (v15 + v116 < v120)
      v39 = v15 + v116;
    if (v39 < v15)
      break;
    if (v16 == v39)
      goto LABEL_40;
    v122 = v3;
    v119 = v11;
    v90 = v111 + 16 * v16;
    v115 = v15;
    v109 = v39;
    do
    {
      v91 = *(_OWORD *)(v13 + 16 * v16);
      v92 = v15;
      v110 = v90;
      v93 = v90;
      while (1)
      {
        v94 = v16;
        v95 = *(void **)v93;
        v96 = *(_QWORD *)(v93 + 8);
        v97 = *((_QWORD *)&v91 + 1);
        v128[0] = *((_QWORD *)&v91 + 1);
        v129 = (id)v91;
        v126 = v96;
        v127 = v95;
        v98 = (id)v91;
        swift_unknownObjectRetain(v97);
        v99 = v95;
        swift_unknownObjectRetain(v96);
        v100 = a2((uint64_t *)&v129, v128, &v127, &v126);
        if (v122)
        {
          swift_bridgeObjectRelease(v119);
          swift_unknownObjectRelease(v97);

          swift_unknownObjectRelease(v96);
          goto LABEL_116;
        }
        v101 = v100;
        swift_unknownObjectRelease(v97);

        swift_unknownObjectRelease(v96);
        if ((v101 & 1) == 0)
          break;
        v13 = v124;
        if (!v124)
          goto LABEL_144;
        v16 = v94;
        v91 = *(_OWORD *)(v93 + 16);
        *(_OWORD *)(v93 + 16) = *(_OWORD *)v93;
        *(_OWORD *)v93 = v91;
        v93 -= 16;
        if (v94 == ++v92)
          goto LABEL_98;
      }
      v13 = v124;
      v16 = v94;
LABEL_98:
      ++v16;
      v90 = v110 + 16;
      v15 = v115;
    }
    while (v16 != v109);
    v16 = v109;
    v11 = v119;
    v3 = 0;
    if (v109 < v115)
      goto LABEL_137;
LABEL_41:
    if ((swift_isUniquelyReferenced_nonNull_native(v11) & 1) == 0)
      v11 = sub_1000374F8(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
    v41 = *((_QWORD *)v11 + 2);
    v40 = *((_QWORD *)v11 + 3);
    v42 = v41 + 1;
    v13 = v124;
    v121 = v16;
    if (v41 >= v40 >> 1)
    {
      v102 = sub_1000374F8((char *)(v40 > 1), v41 + 1, 1, v11);
      v13 = v124;
      v11 = v102;
    }
    *((_QWORD *)v11 + 2) = v42;
    v43 = v11 + 32;
    v44 = &v11[16 * v41 + 32];
    *(_QWORD *)v44 = v15;
    *((_QWORD *)v44 + 1) = v121;
    if (v41)
    {
LABEL_46:
      v45 = v42 - 1;
      if (v42 >= 4)
      {
        v50 = &v43[16 * v42];
        v51 = *((_QWORD *)v50 - 8);
        v52 = *((_QWORD *)v50 - 7);
        v56 = __OFSUB__(v52, v51);
        v53 = v52 - v51;
        if (v56)
          goto LABEL_122;
        v55 = *((_QWORD *)v50 - 6);
        v54 = *((_QWORD *)v50 - 5);
        v56 = __OFSUB__(v54, v55);
        v48 = v54 - v55;
        v49 = v56;
        if (v56)
          goto LABEL_123;
        v57 = v42 - 2;
        v58 = &v43[16 * v42 - 32];
        v60 = *(_QWORD *)v58;
        v59 = *((_QWORD *)v58 + 1);
        v56 = __OFSUB__(v59, v60);
        v61 = v59 - v60;
        if (v56)
          goto LABEL_125;
        v56 = __OFADD__(v48, v61);
        v62 = v48 + v61;
        if (v56)
          goto LABEL_128;
        if (v62 >= v53)
        {
          v80 = &v43[16 * v45];
          v82 = *(_QWORD *)v80;
          v81 = *((_QWORD *)v80 + 1);
          v56 = __OFSUB__(v81, v82);
          v83 = v81 - v82;
          if (v56)
            goto LABEL_132;
          v73 = v48 < v83;
        }
        else
        {
LABEL_59:
          if ((v49 & 1) != 0)
            goto LABEL_124;
          v57 = v42 - 2;
          v63 = &v43[16 * v42 - 32];
          v65 = *(_QWORD *)v63;
          v64 = *((_QWORD *)v63 + 1);
          v66 = __OFSUB__(v64, v65);
          v67 = v64 - v65;
          v68 = v66;
          if (v66)
            goto LABEL_127;
          v69 = &v43[16 * v45];
          v71 = *(_QWORD *)v69;
          v70 = *((_QWORD *)v69 + 1);
          v56 = __OFSUB__(v70, v71);
          v72 = v70 - v71;
          if (v56)
            goto LABEL_130;
          if (__OFADD__(v67, v72))
            goto LABEL_131;
          if (v67 + v72 < v48)
            goto LABEL_71;
          v73 = v48 < v72;
        }
        if (v73)
          v45 = v57;
      }
      else
      {
        if (v42 == 3)
        {
          v47 = *((_QWORD *)v11 + 4);
          v46 = *((_QWORD *)v11 + 5);
          v56 = __OFSUB__(v46, v47);
          v48 = v46 - v47;
          v49 = v56;
          goto LABEL_59;
        }
        v74 = *((_QWORD *)v11 + 4);
        v75 = *((_QWORD *)v11 + 5);
        v56 = __OFSUB__(v75, v74);
        v67 = v75 - v74;
        v68 = v56;
LABEL_71:
        if ((v68 & 1) != 0)
          goto LABEL_126;
        v76 = &v43[16 * v45];
        v78 = *(_QWORD *)v76;
        v77 = *((_QWORD *)v76 + 1);
        v56 = __OFSUB__(v77, v78);
        v79 = v77 - v78;
        if (v56)
          goto LABEL_129;
        if (v79 < v67)
          goto LABEL_88;
      }
      v84 = v45 - 1;
      if (v45 - 1 >= v42)
      {
        __break(1u);
LABEL_119:
        __break(1u);
LABEL_120:
        __break(1u);
LABEL_121:
        __break(1u);
LABEL_122:
        __break(1u);
LABEL_123:
        __break(1u);
LABEL_124:
        __break(1u);
LABEL_125:
        __break(1u);
LABEL_126:
        __break(1u);
LABEL_127:
        __break(1u);
LABEL_128:
        __break(1u);
LABEL_129:
        __break(1u);
LABEL_130:
        __break(1u);
LABEL_131:
        __break(1u);
LABEL_132:
        __break(1u);
LABEL_133:
        __break(1u);
LABEL_134:
        __break(1u);
LABEL_135:
        __break(1u);
LABEL_136:
        __break(1u);
LABEL_137:
        __break(1u);
LABEL_138:
        __break(1u);
LABEL_139:
        __break(1u);
LABEL_140:
        __break(1u);
        break;
      }
      if (!v13)
        goto LABEL_143;
      v85 = &v43[16 * v84];
      v86 = *(_QWORD *)v85;
      v87 = &v43[16 * v45];
      v88 = *((_QWORD *)v87 + 1);
      sub_100037108((void **)(v13 + 16 * *(_QWORD *)v85), (void **)(v13 + 16 * *(_QWORD *)v87), v13 + 16 * v88, __dst, (uint64_t (*)(void **, void **, void **, uint64_t *))a2);
      if (v3)
        goto LABEL_113;
      if (v88 < v86)
        goto LABEL_119;
      if (v45 > *((_QWORD *)v11 + 2))
        goto LABEL_120;
      *(_QWORD *)v85 = v86;
      *(_QWORD *)&v43[16 * v84 + 8] = v88;
      v89 = *((_QWORD *)v11 + 2);
      if (v45 >= v89)
        goto LABEL_121;
      v42 = v89 - 1;
      memmove(&v43[16 * v45], v87 + 16, 16 * (v89 - 1 - v45));
      *((_QWORD *)v11 + 2) = v89 - 1;
      v13 = v124;
      if (v89 <= 2)
        goto LABEL_88;
      goto LABEL_46;
    }
    v42 = 1;
LABEL_88:
    v14 = v120;
    v12 = v121;
    if (v121 >= v120)
    {
LABEL_102:
      if (v42 >= 2)
      {
        v103 = *v112;
        do
        {
          v104 = v42 - 2;
          if (v42 < 2)
            goto LABEL_133;
          if (!v103)
            goto LABEL_146;
          v105 = *(_QWORD *)&v11[16 * v104 + 32];
          v106 = *(_QWORD *)&v11[16 * v42 + 24];
          sub_100037108((void **)(v103 + 16 * v105), (void **)(v103 + 16 * *(_QWORD *)&v11[16 * v42 + 16]), v103 + 16 * v106, __dst, (uint64_t (*)(void **, void **, void **, uint64_t *))a2);
          if (v3)
            break;
          if (v106 < v105)
            goto LABEL_134;
          if ((swift_isUniquelyReferenced_nonNull_native(v11) & 1) == 0)
            v11 = sub_100037698((uint64_t)v11);
          if (v104 >= *((_QWORD *)v11 + 2))
            goto LABEL_135;
          v107 = &v11[16 * v104 + 32];
          *(_QWORD *)v107 = v105;
          *((_QWORD *)v107 + 1) = v106;
          v108 = *((_QWORD *)v11 + 2);
          if (v42 > v108)
            goto LABEL_136;
          memmove(&v11[16 * v42 + 16], &v11[16 * v42 + 32], 16 * (v108 - v42));
          *((_QWORD *)v11 + 2) = v108 - 1;
          v42 = v108 - 1;
        }
        while (v108 > 2);
      }
LABEL_113:
      swift_bridgeObjectRelease(v11);
      goto LABEL_116;
    }
  }
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
  __break(1u);
}

void sub_1000389F0(_QWORD *a1, uint64_t (*a2)(uint64_t *, uint64_t *, void **, uint64_t *))
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6[2];

  v4 = (_QWORD *)*a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0)
    v4 = (_QWORD *)sub_100036A04(v4);
  v5 = v4[2];
  v6[0] = (uint64_t)(v4 + 4);
  v6[1] = v5;
  sub_100038178(v6, a2);
  *a1 = v4;
}

uint64_t sub_100038A74()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100038A98(_QWORD *a1)
{
  uint64_t v1;

  return sub_100034B74(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_100038AA0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100038AC4(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t sub_100038AE8(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t isUniquelyReferenced_nonNull_native;
  char v29;
  unint64_t v30;
  uint64_t v31;
  _BOOL8 v32;
  uint64_t v33;
  char v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  char v43;
  unint64_t v44;
  uint64_t v45;
  _BOOL8 v46;
  uint64_t v47;
  char v48;
  unint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  os_log_type_t v65;
  uint64_t v66;
  int64_t v67;
  _QWORD *v68;
  void **v69;
  int64_t v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  _QWORD *v79;
  unint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  unint64_t v83;
  _QWORD *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  NSObject *v88;
  os_log_type_t v89;
  uint8_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD *v102;
  _QWORD *v103;
  uint64_t *v104;
  _QWORD *v105;
  uint64_t v106;
  uint64_t result;
  uint64_t v108;
  NSObject *v109;
  uint64_t v110;
  char v111;
  os_log_type_t v112;
  _QWORD *v113;
  uint64_t v114;
  _QWORD *v115;
  uint64_t v116[4];

  v3 = a2;
  v4 = a1;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 >= 0)
      a1 &= 0xFFFFFFFFFFFFFF8uLL;
    v5 = _CocoaArrayWrapper.endIndex.getter(a1);
    v111 = (char)v3;
    if (v5)
      goto LABEL_3;
LABEL_15:
    swift_bridgeObjectRelease(v4);
    v7 = _swiftEmptyArrayStorage;
    goto LABEL_16;
  }
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  v111 = (char)a2;
  if (!v5)
    goto LABEL_15;
LABEL_3:
  v116[0] = (uint64_t)_swiftEmptyArrayStorage;
  sub_100048968(0, v5 & ~(v5 >> 63), 0);
  if (v5 < 0)
  {
LABEL_80:
    __break(1u);
LABEL_81:
    swift_once(&qword_100091050, sub_10003187C);
    goto LABEL_53;
  }
  v6 = 0;
  v7 = (_QWORD *)v116[0];
  do
  {
    if ((v4 & 0xC000000000000001) != 0)
    {
      v8 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, v4);
    }
    else
    {
      v8 = *(void **)(v4 + 8 * v6 + 32);
      swift_unknownObjectRetain(v8);
    }
    v9 = objc_msgSend(v8, "identifier");
    v116[0] = (uint64_t)v7;
    v11 = v7[2];
    v10 = v7[3];
    if (v11 >= v10 >> 1)
    {
      sub_100048968(v10 > 1, v11 + 1, 1);
      v7 = (_QWORD *)v116[0];
    }
    ++v6;
    v7[2] = v11 + 1;
    v12 = &v7[2 * v11];
    v12[4] = v9;
    v12[5] = v8;
  }
  while (v5 != v6);
  swift_bridgeObjectRelease(v4);
LABEL_16:
  v3 = (_QWORD *)sub_10003EF10((uint64_t)_swiftEmptyArrayStorage);
  v13 = v7[2];
  if (v13)
  {
    swift_bridgeObjectRetain(v7);
    v5 = (uint64_t)(v7 + 5);
    v113 = v7;
    while (1)
    {
      v2 = *(_QWORD *)v5;
      v15 = v3[2];
      v16 = *(id *)(v5 - 8);
      v17 = v16;
      if (v15)
      {
        v18 = v16;
        swift_unknownObjectRetain_n(v2, 2);
        v19 = v18;
        v20 = sub_1000485AC((uint64_t)v19);
        if ((v21 & 1) != 0)
        {
          v22 = *(_QWORD *)(v3[7] + 8 * v20);
          swift_bridgeObjectRetain(v22);

          v116[0] = v22;
          v23 = swift_unknownObjectRetain(v2);
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v23);
          v25 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
          v24 = *(_QWORD *)((v116[0] & 0xFFFFFFFFFFFFFF8) + 0x18);
          if (v25 >= v24 >> 1)
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v24 > 1, v25 + 1, 1);
          v26 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v25, v2);
          specialized Array._endMutation()(v26);
          v27 = v116[0];
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v3);
          v115 = v3;
          v30 = sub_1000485AC((uint64_t)v19);
          v31 = v3[2];
          v32 = (v29 & 1) == 0;
          v33 = v31 + v32;
          if (__OFADD__(v31, v32))
            goto LABEL_78;
          v34 = v29;
          if (v3[3] >= v33)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) != 0)
            {
              v37 = 8 * v30;
              if ((v29 & 1) == 0)
                goto LABEL_47;
            }
            else
            {
              sub_100035D60();
              v3 = v115;
              v37 = 8 * v30;
              if ((v34 & 1) == 0)
                goto LABEL_47;
            }
          }
          else
          {
            sub_10003584C(v33, isUniquelyReferenced_nonNull_native);
            v3 = v115;
            v35 = sub_1000485AC((uint64_t)v19);
            if ((v34 & 1) != (v36 & 1))
              goto LABEL_84;
            v30 = v35;
            v37 = 8 * v35;
            if ((v34 & 1) == 0)
            {
LABEL_47:
              v3[(v30 >> 6) + 8] |= 1 << v30;
              *(_QWORD *)(v3[6] + v37) = v19;
              *(_QWORD *)(v3[7] + v37) = v27;
              v57 = v3[2];
              v53 = __OFADD__(v57, 1);
              v58 = v57 + 1;
              if (v53)
                goto LABEL_79;
              v3[2] = v58;
              v59 = v19;
              goto LABEL_49;
            }
          }
          v56 = v3[7];
          swift_bridgeObjectRelease(*(_QWORD *)(v56 + v37));
          *(_QWORD *)(v56 + v37) = v116[0];
LABEL_49:
          swift_bridgeObjectRelease(0x8000000000000000);

          goto LABEL_20;
        }

      }
      else
      {
        swift_unknownObjectRetain_n(v2, 2);
        v38 = v17;
      }
      v39 = sub_100031408((uint64_t *)&unk_100091FC0);
      v40 = swift_allocObject(v39, 40, 7);
      *(_OWORD *)(v40 + 16) = xmmword_100075AB0;
      *(_QWORD *)(v40 + 32) = v2;
      v116[0] = v40;
      ((void (*)(void))specialized Array._endMutation())();
      v27 = v116[0];
      v41 = v17;
      swift_unknownObjectRetain(v2);
      v42 = swift_isUniquelyReferenced_nonNull_native(v3);
      v116[0] = (uint64_t)v3;
      v44 = sub_1000485AC((uint64_t)v41);
      v45 = v3[2];
      v46 = (v43 & 1) == 0;
      v47 = v45 + v46;
      if (__OFADD__(v45, v46))
      {
        __break(1u);
LABEL_77:
        __break(1u);
LABEL_78:
        __break(1u);
LABEL_79:
        __break(1u);
        goto LABEL_80;
      }
      v48 = v43;
      if (v3[3] >= v47)
      {
        if ((v42 & 1) != 0)
        {
          if ((v43 & 1) == 0)
            goto LABEL_39;
        }
        else
        {
          sub_100035D60();
          v3 = (_QWORD *)v116[0];
          if ((v48 & 1) == 0)
            goto LABEL_39;
        }
      }
      else
      {
        sub_10003584C(v47, v42);
        v3 = (_QWORD *)v116[0];
        v49 = sub_1000485AC((uint64_t)v41);
        if ((v48 & 1) != (v50 & 1))
        {
LABEL_84:
          v108 = type metadata accessor for MessageID(0);
          KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v108);
          __break(1u);
LABEL_85:
          swift_release(v115);
          swift_release(v2);
          swift_release(v27);
          result = swift_release(v3);
          __break(1u);
          return result;
        }
        v44 = v49;
        if ((v48 & 1) == 0)
        {
LABEL_39:
          v3[(v44 >> 6) + 8] |= 1 << v44;
          v51 = 8 * v44;
          *(_QWORD *)(v3[6] + v51) = v41;
          *(_QWORD *)(v3[7] + v51) = v27;
          v52 = v3[2];
          v53 = __OFADD__(v52, 1);
          v54 = v52 + 1;
          if (v53)
            goto LABEL_77;
          v3[2] = v54;
          v55 = v41;
          goto LABEL_19;
        }
      }
      v14 = v3[7];
      swift_bridgeObjectRelease(*(_QWORD *)(v14 + 8 * v44));
      *(_QWORD *)(v14 + 8 * v44) = v27;
LABEL_19:
      swift_bridgeObjectRelease(0x8000000000000000);

LABEL_20:
      swift_unknownObjectRelease_n(v2, 2);
      v7 = v113;
      v5 += 16;
      if (!--v13)
      {
        swift_bridgeObjectRelease(v113);
        break;
      }
    }
  }
  v5 = 0;
  sub_10003190C((uint64_t)v3);
  v2 = v60;
  if (!*(_QWORD *)(v60 + 16))
  {
    v84 = v7;
    swift_bridgeObjectRelease(v3);
    swift_bridgeObjectRelease(v2);
    if (qword_100091050 == -1)
      goto LABEL_65;
    goto LABEL_83;
  }
  swift_bridgeObjectRelease(v7);
  if (qword_100091050 != -1)
    goto LABEL_81;
LABEL_53:
  v62 = type metadata accessor for Logger(0, v61);
  sub_100030760(v62, (uint64_t)qword_100091340);
  v63 = swift_bridgeObjectRetain_n(v2, 3);
  v64 = Logger.logObject.getter(v63);
  v65 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v64, v65))
  {
    v112 = v65;
    v114 = v5;
    v66 = swift_slowAlloc(22, -1);
    v110 = swift_slowAlloc(64, -1);
    v116[0] = v110;
    *(_DWORD *)v66 = 136315394;
    v67 = *(_QWORD *)(v2 + 16);
    v68 = _swiftEmptyArrayStorage;
    if (v67)
    {
      v115 = _swiftEmptyArrayStorage;
      specialized ContiguousArray.reserveCapacity(_:)(v67);
      v69 = (void **)(v2 + 32);
      v70 = v67;
      do
      {
        v71 = *v69;
        v69 += 2;
        v72 = v71;
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v72);
        v73 = v115[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v73);
        v74 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v73, v72);
        specialized ContiguousArray._endMutation()(v74);
        --v70;
      }
      while (v70);
      v68 = v115;
    }
    v75 = type metadata accessor for MessageID(0);
    v76 = Array.description.getter(v68, v75);
    v78 = v77;
    swift_bridgeObjectRelease(v68);
    v115 = (_QWORD *)sub_10004DF18(v76, v78, v116);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v115, v116, v66 + 4, v66 + 12);
    swift_bridgeObjectRelease(v78);
    swift_bridgeObjectRelease_n(v2, 2);
    *(_WORD *)(v66 + 12) = 2080;
    v79 = _swiftEmptyArrayStorage;
    if (v67)
    {
      v109 = v64;
      v115 = _swiftEmptyArrayStorage;
      sub_100048994(0, v67, 0);
      v79 = v115;
      v80 = v115[2];
      v81 = (uint64_t *)(v2 + 40);
      do
      {
        v82 = *v81;
        v115 = v79;
        v83 = v79[3];
        swift_bridgeObjectRetain(v82);
        if (v80 >= v83 >> 1)
        {
          sub_100048994(v83 > 1, v80 + 1, 1);
          v79 = v115;
        }
        v79[2] = v80 + 1;
        v79[v80 + 4] = v82;
        v81 += 2;
        ++v80;
        --v67;
      }
      while (v67);
      v64 = v109;
    }
    v92 = sub_100031408(&qword_1000915C0);
    v93 = Array.description.getter(v79, v92);
    v95 = v94;
    swift_bridgeObjectRelease(v79);
    v115 = (_QWORD *)sub_10004DF18(v93, v95, v116);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v115, v116, v66 + 14, v66 + 22);
    swift_bridgeObjectRelease(v95);
    swift_bridgeObjectRelease_n(v2, 2);
    _os_log_impl((void *)&_mh_execute_header, v64, v112, "CachedVoicemailManager.Cache.init(voicemails:) with duplicate keys: %s, voicemails: %s", (uint8_t *)v66, 0x16u);
    swift_arrayDestroy(v110, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v110, -1, -1);
    swift_slowDealloc(v66, -1, -1);

    v5 = v114;
  }
  else
  {
    swift_bridgeObjectRelease_n(v2, 4);

  }
  v91 = sub_100031B64((uint64_t)v3);
  swift_bridgeObjectRelease(v3);
  while (1)
  {
    v96 = sub_100037D80(v91);
    v98 = v97;
    v100 = v99;
    swift_bridgeObjectRelease(v91);
    v101 = type metadata accessor for CachedVoicemailManager.Cache();
    v102 = (_QWORD *)swift_allocObject(v101, 40, 7);
    v103 = v102;
    v102[2] = v96;
    v104 = v102 + 2;
    v102[3] = v98;
    v102[4] = v100;
    if ((v111 & 1) == 0)
      return (uint64_t)v103;
    swift_beginAccess(v102 + 2, v116, 33, 0);
    v2 = v103[2];
    v27 = v103[3];
    v3 = (_QWORD *)v103[4];
    swift_retain(v2);
    swift_retain(v27);
    swift_retain(v3);
    sub_100037A34(v2, v27, (uint64_t)v3);
    v115 = v105;
    sub_1000389F0(&v115, (uint64_t (*)(uint64_t *, uint64_t *, void **, uint64_t *))sub_100031F44);
    if (v5)
      goto LABEL_85;
    swift_release(v2);
    swift_release(v27);
    swift_release(v3);
    v84 = v115;
    v106 = v115[2];
    if (v106 == v3[2])
    {
      sub_100037044((uint64_t)(v115 + 4), v106, v104);
      swift_release(v84);
      swift_endAccess(v116);
      return (uint64_t)v103;
    }
    __break(1u);
LABEL_83:
    swift_once(&qword_100091050, sub_10003187C);
LABEL_65:
    v86 = type metadata accessor for Logger(0, v85);
    v87 = sub_100030760(v86, (uint64_t)qword_100091340);
    v88 = Logger.logObject.getter(v87);
    v89 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v88, v89))
    {
      v90 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v90 = 0;
      _os_log_impl((void *)&_mh_execute_header, v88, v89, "CachedVoicemailManager.Cache.init(voicemails:) without duplicate keys", v90, 2u);
      swift_slowDealloc(v90, -1, -1);
    }

    v91 = (uint64_t)v84;
  }
}

uint64_t sub_100039504(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else
  {
    if (v4 < 0)
    {
      result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v6 = a4 + 16 * a1 + 32;
    v7 = a3 + 16 * v4;
    if (v6 >= v7 || v6 + 16 * v4 <= a3)
    {
      v8 = sub_100031408(&qword_1000915A8);
      swift_arrayInitWithCopy(a3, v6, v4, v8);
      return v7;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t *sub_10003960C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

uint64_t sub_10003964C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_100032670(*(_QWORD *)(v0 + 16), 1);
  return swift_bridgeObjectRelease(v1);
}

uint64_t sub_100039678()
{
  uint64_t v0;

  return sub_10003205C(*(_QWORD *)(v0 + 16), 1);
}

uint64_t sub_1000396A4()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000396C8()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000396F4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc(dword_1000915B4);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_100030A5C;
  return sub_10003392C(a1, v4, v5, v6);
}

uint64_t sub_100039760()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100039794()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_1000915F4);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1000399C8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1000915F0 + dword_1000915F0))(v2, v3, v4);
}

uint64_t sub_100039804()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_100091B04);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1000399C8;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100091B00 + dword_100091B00))(v2, v3, v4);
}

uint64_t sub_100039880()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000398AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc(dword_10009160C);
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1000399C8;
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)&dword_100091608 + dword_100091608))(v2, v3);
}

uint64_t sub_100039918()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100039944(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc(dword_100091B0C);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1000399C8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100091B08 + dword_100091B08))(a1, v4, v5, v6);
}

_QWORD *sub_1000399D8(uint64_t a1)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((unint64_t)a1 >> 62)
    goto LABEL_14;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = _swiftEmptyArrayStorage;
    if (!v2)
      break;
    result = (_QWORD *)specialized ContiguousArray.reserveCapacity(_:)(v2);
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v5 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)(v4, a1);
      else
        v5 = (char *)*(id *)(a1 + 8 * v4 + 32);
      v6 = v5;
      ++v4;
      v7 = *(id *)&v5[OBJC_IVAR___MPVisualMessage_vmMessage];

      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      v8 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v8);
      v9 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v8, v7);
      specialized ContiguousArray._endMutation()(v9);
      if (v2 == v4)
        return _swiftEmptyArrayStorage;
    }
    __break(1u);
LABEL_14:
    if (a1 < 0)
      v10 = a1;
    else
      v10 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(a1);
  }
  return result;
}

_QWORD *sub_100039B18(uint64_t a1)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v4;
  id v5;
  void *v6;
  objc_class *v7;
  char *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;
  _QWORD *v16;

  if ((unint64_t)a1 >> 62)
    goto LABEL_14;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = _swiftEmptyArrayStorage;
    if (!v2)
      break;
    v16 = _swiftEmptyArrayStorage;
    result = (_QWORD *)specialized ContiguousArray.reserveCapacity(_:)(v2);
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4, a1);
      else
        v5 = *(id *)(a1 + 8 * v4 + 32);
      v6 = v5;
      ++v4;
      v7 = (objc_class *)type metadata accessor for VisualMessage();
      v8 = (char *)objc_allocWithZone(v7);
      *(_QWORD *)&v8[OBJC_IVAR___MPVisualMessage_vmMessage] = v6;
      v15.receiver = v8;
      v15.super_class = v7;
      v9 = v6;
      v10 = objc_msgSendSuper2(&v15, "init");

      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v11);
      v12 = v16[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v12);
      v13 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v12, v10);
      specialized ContiguousArray._endMutation()(v13);
      if (v2 == v4)
        return v16;
    }
    __break(1u);
LABEL_14:
    if (a1 < 0)
      v14 = a1;
    else
      v14 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v14);
    swift_bridgeObjectRelease(a1);
  }
  return result;
}

char *sub_100039CBC(void *a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  objc_class *ObjectType;
  char *v8;
  id v9;
  char *v10;
  void *v11;
  char *v12;
  id v13;
  objc_super v15;

  ObjectType = (objc_class *)swift_getObjectType(v3);
  *(_QWORD *)&v3[OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager] = a1;
  v8 = &v3[OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_onVoicemailsChanged];
  *(_QWORD *)v8 = a2;
  *((_QWORD *)v8 + 1) = a3;
  v15.receiver = v3;
  v15.super_class = ObjectType;
  v9 = a1;
  swift_retain(a3);
  v10 = (char *)objc_msgSendSuper2(&v15, "init");
  v11 = *(void **)&v10[OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager];
  v12 = v10;
  v13 = v11;
  objc_msgSend(v13, "setDelegate:", v12, v15.receiver, v15.super_class);

  swift_release(a3);
  return v12;
}

uint64_t sub_100039DE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v1 + 40) = v0;
  v2 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v2, &unk_100091088);
  v3 = sub_10003D46C();
  v4 = dispatch thunk of Actor.unownedExecutor.getter(v2, v3);
  return swift_task_switch(sub_100039E54, v4, v5);
}

uint64_t sub_100039E54()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  id v8;
  id v9;
  objc_class *v10;
  char *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t *v22;
  uint8_t *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;

  v1 = v0 + 40;
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(v0 + 40) + OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager), "allVoicemails");
  v3 = sub_10003D530();
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

  if ((unint64_t)v4 >> 62)
  {
    if (v4 < 0)
      v17 = v4;
    else
      v17 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v4);
    v5 = _CocoaArrayWrapper.endIndex.getter(v17);
    swift_bridgeObjectRelease(v4);
    v34 = v0 + 40;
    if (v5)
      goto LABEL_3;
LABEL_14:
    swift_bridgeObjectRelease(v4);
    v15 = (uint64_t)_swiftEmptyArrayStorage;
    goto LABEL_15;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v34 = v0 + 40;
  if (!v5)
    goto LABEL_14;
LABEL_3:
  v35 = _swiftEmptyArrayStorage;
  result = specialized ContiguousArray.reserveCapacity(_:)(v5);
  if (v5 < 0)
  {
    __break(1u);
    return result;
  }
  v7 = 0;
  do
  {
    if ((v4 & 0xC000000000000001) != 0)
      v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v7, v4);
    else
      v8 = *(id *)(v4 + 8 * v7 + 32);
    v9 = v8;
    ++v7;
    v10 = (objc_class *)type metadata accessor for VisualMessage();
    v11 = (char *)objc_allocWithZone(v10);
    *(_QWORD *)&v11[OBJC_IVAR___MPVisualMessage_vmMessage] = v9;
    *(_QWORD *)(v0 + 16) = v11;
    *(_QWORD *)(v0 + 24) = v10;
    v12 = objc_msgSendSuper2((objc_super *)(v0 + 16), "init");
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v12);
    v13 = v35[2];
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v13);
    v14 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v13, v12);
    specialized ContiguousArray._endMutation()(v14);
  }
  while (v5 != v7);
  v15 = (uint64_t)v35;
  swift_bridgeObjectRelease(v4);
  v1 = v34;
LABEL_15:
  if (qword_100091070 != -1)
    swift_once(&qword_100091070, sub_1000516C4);
  v18 = type metadata accessor for Logger(0, v16);
  sub_100030760(v18, (uint64_t)qword_100092E90);
  v19 = swift_bridgeObjectRetain_n(v15, 2);
  v20 = Logger.logObject.getter(v19);
  v21 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint64_t *)(v1 - 8);
    v23 = (uint8_t *)swift_slowAlloc(12, -1);
    v24 = (_QWORD *)swift_slowAlloc(32, -1);
    v35 = v24;
    *(_DWORD *)v23 = 136315138;
    v25 = type metadata accessor for VisualMessage();
    v26 = swift_bridgeObjectRetain(v15);
    v27 = Array.description.getter(v26, v25);
    v29 = v28;
    swift_bridgeObjectRelease(v15);
    *v22 = sub_10004DF18(v27, v29, (uint64_t *)&v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v22, v34, v23 + 4, v23 + 12);
    swift_bridgeObjectRelease(v29);
    swift_bridgeObjectRelease_n(v15, 2);
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Fetched %s from VMD", v23, 0xCu);
    swift_arrayDestroy(v24, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v24, -1, -1);
    swift_slowDealloc(v23, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(v15, 2);
  }

  if ((unint64_t)v15 >> 62)
  {
    if (v15 < 0)
      v32 = v15;
    else
      v32 = v15 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v15);
    v33 = sub_100031408(&qword_1000916D0);
    v31 = _bridgeCocoaArray<A>(_:)(v32, v33);
    swift_bridgeObjectRelease(v15);
  }
  else
  {
    v30 = swift_bridgeObjectRetain(v15);
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v30);
    v31 = v15;
  }
  swift_bridgeObjectRelease(v15);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v31);
}

uint64_t sub_10003A320(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  v3 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v3, &unk_100091088);
  v4 = sub_10003D46C();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, v4);
  return swift_task_switch(sub_10003A38C, v5, v6);
}

uint64_t sub_10003A38C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  _QWORD *v4;

  v1 = *(void **)(v0 + 24);
  *(_QWORD *)(v0 + 32) = _Block_copy(*(const void **)(v0 + 16));
  v2 = dword_100091844;
  v3 = v1;
  v4 = (_QWORD *)swift_task_alloc(v2);
  *(_QWORD *)(v0 + 40) = v4;
  *v4 = v0;
  v4[1] = sub_10003A3E8;
  return sub_100039DE8();
}

uint64_t sub_10003A3E8(uint64_t a1)
{
  uint64_t *v1;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  Class isa;
  uint64_t v7;

  v3 = *(void (***)(_QWORD, _QWORD))(*v1 + 32);
  v4 = *(void **)(*v1 + 24);
  v7 = *v1;
  swift_task_dealloc(*(_QWORD *)(*v1 + 40));

  sub_100031408(&qword_1000916D0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  ((void (**)(_QWORD, Class))v3)[2](v3, isa);

  _Block_release(v3);
  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t sub_10003A484(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3[4] = a1;
  v3[5] = v2;
  v4 = type metadata accessor for Logger(0, a2);
  v3[6] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[7] = v5;
  v3[8] = swift_task_alloc((*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v6, &unk_100091088);
  v7 = sub_10003D46C();
  v8 = dispatch thunk of Actor.unownedExecutor.getter(v6, v7);
  return swift_task_switch(sub_10003A518, v8, v9);
}

uint64_t sub_10003A518()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  void *v3;
  _QWORD *v4;
  Class isa;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = sub_10003F130(*(_QWORD *)(v0 + 32));
  if (v1)
  {
    v2 = v1;
    v3 = *(void **)(*(_QWORD *)(v0 + 40) + OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager);
    v4 = sub_1000399D8((uint64_t)v1);
    swift_bridgeObjectRelease(v2);
    sub_10003D530();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
    v6 = objc_msgSend(v3, "deleteVoicemails:", isa);

  }
  else
  {
    if (qword_100091070 != -1)
      swift_once(&qword_100091070, sub_1000516C4);
    v8 = *(_QWORD *)(v0 + 56);
    v7 = *(_QWORD *)(v0 + 64);
    v9 = *(_QWORD *)(v0 + 48);
    v10 = *(_QWORD *)(v0 + 32);
    v11 = sub_100030760(v9, (uint64_t)qword_100092E90);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v11, v9);
    v12 = swift_bridgeObjectRetain(v10);
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.error.getter();
    v15 = os_log_type_enabled(v13, v14);
    v17 = *(_QWORD *)(v0 + 56);
    v16 = *(_QWORD *)(v0 + 64);
    v18 = *(_QWORD *)(v0 + 48);
    v19 = *(_QWORD *)(v0 + 32);
    if (v15)
    {
      v24 = *(_QWORD *)(v0 + 64);
      v23 = *(_QWORD *)(v0 + 48);
      v20 = (uint8_t *)swift_slowAlloc(12, -1);
      v21 = swift_slowAlloc(32, -1);
      v25 = v21;
      *(_DWORD *)v20 = 136446210;
      *(_QWORD *)(v0 + 16) = sub_10004DF18(0x654D3C7961727241, 0xEE003E6567617373, &v25);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v20 + 4, v20 + 12);
      swift_bridgeObjectRelease(v19);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Incorrect type passed into VisualVoicemailManager %{public}s but expected VisualMessage!", v20, 0xCu);
      swift_arrayDestroy(v21, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v21, -1, -1);
      swift_slowDealloc(v20, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v24, v23);
    }
    else
    {
      swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));

      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    }
  }
  swift_task_dealloc(*(_QWORD *)(v0 + 64));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10003A8C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v4 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v4, &unk_100091088);
  v5 = sub_10003D46C();
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, v5);
  return swift_task_switch(sub_10003A930, v6, v7);
}

uint64_t sub_10003A930()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;

  v1 = *(void **)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  v3 = sub_100031408(&qword_1000916D0);
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);
  *(_QWORD *)(v0 + 48) = v4;
  v5 = dword_100091744;
  v6 = v1;
  v7 = (_QWORD *)swift_task_alloc(v5);
  *(_QWORD *)(v0 + 56) = v7;
  *v7 = v0;
  v7[1] = sub_10003DBDC;
  return sub_10003A484(v4, v8);
}

uint64_t sub_10003A9BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3[4] = a1;
  v3[5] = v2;
  v4 = type metadata accessor for Logger(0, a2);
  v3[6] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[7] = v5;
  v3[8] = swift_task_alloc((*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v6, &unk_100091088);
  v7 = sub_10003D46C();
  v8 = dispatch thunk of Actor.unownedExecutor.getter(v6, v7);
  return swift_task_switch(sub_10003AA50, v8, v9);
}

uint64_t sub_10003AA50()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  void *v3;
  _QWORD *v4;
  Class isa;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = sub_10003F130(*(_QWORD *)(v0 + 32));
  if (v1)
  {
    v2 = v1;
    v3 = *(void **)(*(_QWORD *)(v0 + 40) + OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager);
    v4 = sub_1000399D8((uint64_t)v1);
    swift_bridgeObjectRelease(v2);
    sub_10003D530();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
    v6 = objc_msgSend(v3, "markVoicemailsAsRead:", isa);

  }
  else
  {
    if (qword_100091070 != -1)
      swift_once(&qword_100091070, sub_1000516C4);
    v8 = *(_QWORD *)(v0 + 56);
    v7 = *(_QWORD *)(v0 + 64);
    v9 = *(_QWORD *)(v0 + 48);
    v10 = *(_QWORD *)(v0 + 32);
    v11 = sub_100030760(v9, (uint64_t)qword_100092E90);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v11, v9);
    v12 = swift_bridgeObjectRetain(v10);
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.error.getter();
    v15 = os_log_type_enabled(v13, v14);
    v17 = *(_QWORD *)(v0 + 56);
    v16 = *(_QWORD *)(v0 + 64);
    v18 = *(_QWORD *)(v0 + 48);
    v19 = *(_QWORD *)(v0 + 32);
    if (v15)
    {
      v24 = *(_QWORD *)(v0 + 64);
      v23 = *(_QWORD *)(v0 + 48);
      v20 = (uint8_t *)swift_slowAlloc(12, -1);
      v21 = swift_slowAlloc(32, -1);
      v25 = v21;
      *(_DWORD *)v20 = 136446210;
      *(_QWORD *)(v0 + 16) = sub_10004DF18(0x654D3C7961727241, 0xEE003E6567617373, &v25);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v20 + 4, v20 + 12);
      swift_bridgeObjectRelease(v19);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Incorrect type passed into VisualVoicemailManager %{public}s but expected VisualMessage!", v20, 0xCu);
      swift_arrayDestroy(v21, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v21, -1, -1);
      swift_slowDealloc(v20, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v24, v23);
    }
    else
    {
      swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));

      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    }
  }
  swift_task_dealloc(*(_QWORD *)(v0 + 64));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10003ADF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v4 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v4, &unk_100091088);
  v5 = sub_10003D46C();
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, v5);
  return swift_task_switch(sub_10003AE68, v6, v7);
}

uint64_t sub_10003AE68()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;

  v1 = *(void **)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  v3 = sub_100031408(&qword_1000916D0);
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);
  *(_QWORD *)(v0 + 48) = v4;
  v5 = dword_10009172C;
  v6 = v1;
  v7 = (_QWORD *)swift_task_alloc(v5);
  *(_QWORD *)(v0 + 56) = v7;
  *v7 = v0;
  v7[1] = sub_10003AEF4;
  return sub_10003A9BC(v4, v8);
}

uint64_t sub_10003AEF4()
{
  uint64_t *v0;
  uint64_t v1;
  void (**v2)(_QWORD);
  void *v3;
  uint64_t v5;

  v1 = *(_QWORD *)(*v0 + 48);
  v3 = *(void **)(*v0 + 32);
  v2 = *(void (***)(_QWORD))(*v0 + 40);
  v5 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 56));
  swift_bridgeObjectRelease(v1);

  v2[2](v2);
  _Block_release(v2);
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_10003AF68(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3[4] = a1;
  v3[5] = v2;
  v4 = type metadata accessor for Logger(0, a2);
  v3[6] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[7] = v5;
  v3[8] = swift_task_alloc((*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v6, &unk_100091088);
  v7 = sub_10003D46C();
  v8 = dispatch thunk of Actor.unownedExecutor.getter(v6, v7);
  return swift_task_switch(sub_10003AFFC, v8, v9);
}

uint64_t sub_10003AFFC()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  void *v3;
  _QWORD *v4;
  Class isa;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = sub_10003F130(*(_QWORD *)(v0 + 32));
  if (v1)
  {
    v2 = v1;
    v3 = *(void **)(*(_QWORD *)(v0 + 40) + OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager);
    v4 = sub_1000399D8((uint64_t)v1);
    swift_bridgeObjectRelease(v2);
    sub_10003D530();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
    v6 = objc_msgSend(v3, "trashVoicemails:", isa);

  }
  else
  {
    if (qword_100091070 != -1)
      swift_once(&qword_100091070, sub_1000516C4);
    v8 = *(_QWORD *)(v0 + 56);
    v7 = *(_QWORD *)(v0 + 64);
    v9 = *(_QWORD *)(v0 + 48);
    v10 = *(_QWORD *)(v0 + 32);
    v11 = sub_100030760(v9, (uint64_t)qword_100092E90);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v11, v9);
    v12 = swift_bridgeObjectRetain(v10);
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.error.getter();
    v15 = os_log_type_enabled(v13, v14);
    v17 = *(_QWORD *)(v0 + 56);
    v16 = *(_QWORD *)(v0 + 64);
    v18 = *(_QWORD *)(v0 + 48);
    v19 = *(_QWORD *)(v0 + 32);
    if (v15)
    {
      v24 = *(_QWORD *)(v0 + 64);
      v23 = *(_QWORD *)(v0 + 48);
      v20 = (uint8_t *)swift_slowAlloc(12, -1);
      v21 = swift_slowAlloc(32, -1);
      v25 = v21;
      *(_DWORD *)v20 = 136446210;
      *(_QWORD *)(v0 + 16) = sub_10004DF18(0x654D3C7961727241, 0xEE003E6567617373, &v25);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v20 + 4, v20 + 12);
      swift_bridgeObjectRelease(v19);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Incorrect type passed into VisualVoicemailManager %{public}s but expected VisualMessage!", v20, 0xCu);
      swift_arrayDestroy(v21, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v21, -1, -1);
      swift_slowDealloc(v20, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v24, v23);
    }
    else
    {
      swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));

      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    }
  }
  swift_task_dealloc(*(_QWORD *)(v0 + 64));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10003B3A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v4 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v4, &unk_100091088);
  v5 = sub_10003D46C();
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, v5);
  return swift_task_switch(sub_10003B414, v6, v7);
}

uint64_t sub_10003B414()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;

  v1 = *(void **)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  v3 = sub_100031408(&qword_1000916D0);
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);
  *(_QWORD *)(v0 + 48) = v4;
  v5 = dword_100091714;
  v6 = v1;
  v7 = (_QWORD *)swift_task_alloc(v5);
  *(_QWORD *)(v0 + 56) = v7;
  *v7 = v0;
  v7[1] = sub_10003DBDC;
  return sub_10003AF68(v4, v8);
}

uint64_t sub_10003B4A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3[4] = a1;
  v3[5] = v2;
  v4 = type metadata accessor for Logger(0, a2);
  v3[6] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[7] = v5;
  v3[8] = swift_task_alloc((*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v6, &unk_100091088);
  v7 = sub_10003D46C();
  v8 = dispatch thunk of Actor.unownedExecutor.getter(v6, v7);
  return swift_task_switch(sub_10003B534, v8, v9);
}

uint64_t sub_10003B534()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  void *v3;
  _QWORD *v4;
  Class isa;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = sub_10003F130(*(_QWORD *)(v0 + 32));
  if (v1)
  {
    v2 = v1;
    v3 = *(void **)(*(_QWORD *)(v0 + 40) + OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager);
    v4 = sub_1000399D8((uint64_t)v1);
    swift_bridgeObjectRelease(v2);
    sub_10003D530();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
    v6 = objc_msgSend(v3, "removeVoicemailsFromTrash:", isa);

  }
  else
  {
    if (qword_100091070 != -1)
      swift_once(&qword_100091070, sub_1000516C4);
    v8 = *(_QWORD *)(v0 + 56);
    v7 = *(_QWORD *)(v0 + 64);
    v9 = *(_QWORD *)(v0 + 48);
    v10 = *(_QWORD *)(v0 + 32);
    v11 = sub_100030760(v9, (uint64_t)qword_100092E90);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v11, v9);
    v12 = swift_bridgeObjectRetain(v10);
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.error.getter();
    v15 = os_log_type_enabled(v13, v14);
    v17 = *(_QWORD *)(v0 + 56);
    v16 = *(_QWORD *)(v0 + 64);
    v18 = *(_QWORD *)(v0 + 48);
    v19 = *(_QWORD *)(v0 + 32);
    if (v15)
    {
      v24 = *(_QWORD *)(v0 + 64);
      v23 = *(_QWORD *)(v0 + 48);
      v20 = (uint8_t *)swift_slowAlloc(12, -1);
      v21 = swift_slowAlloc(32, -1);
      v25 = v21;
      *(_DWORD *)v20 = 136446210;
      *(_QWORD *)(v0 + 16) = sub_10004DF18(0x654D3C7961727241, 0xEE003E6567617373, &v25);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v20 + 4, v20 + 12);
      swift_bridgeObjectRelease(v19);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Incorrect type passed into VisualVoicemailManager %{public}s but expected VisualMessage!", v20, 0xCu);
      swift_arrayDestroy(v21, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v21, -1, -1);
      swift_slowDealloc(v20, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v24, v23);
    }
    else
    {
      swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));

      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    }
  }
  swift_task_dealloc(*(_QWORD *)(v0 + 64));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10003B8DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v4 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v4, &unk_100091088);
  v5 = sub_10003D46C();
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, v5);
  return swift_task_switch(sub_10003B94C, v6, v7);
}

uint64_t sub_10003B94C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;

  v1 = *(void **)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  v3 = sub_100031408(&qword_1000916D0);
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);
  *(_QWORD *)(v0 + 48) = v4;
  v5 = dword_1000916F4;
  v6 = v1;
  v7 = (_QWORD *)swift_task_alloc(v5);
  *(_QWORD *)(v0 + 56) = v7;
  *v7 = v0;
  v7[1] = sub_10003DBDC;
  return sub_10003B4A0(v4, v8);
}

uint64_t sub_10003B9D8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2[5] = a1;
  v2[6] = v1;
  v3 = type metadata accessor for MessageID.Value(0);
  v2[7] = v3;
  v2[8] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v4, &unk_100091088);
  v5 = sub_10003D46C();
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, v5);
  return swift_task_switch(sub_10003BA68, v6, v7);
}

uint64_t sub_10003BA68()
{
  uint64_t v0;
  void **v1;
  uint64_t v2;
  uint64_t v3;
  int EnumCaseMultiPayload;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  void *v12;
  uint8_t *v13;
  id v14;
  uint64_t v15;
  id v16;
  objc_class *v17;
  char *v18;
  _QWORD *v20;

  v1 = (void **)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  sub_10003D880(*(_QWORD *)(v0 + 40) + OBJC_IVAR___MPMessageID_value, v2);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v2, v3);
  v5 = *(_QWORD **)(v0 + 64);
  if (EnumCaseMultiPayload == 1)
  {
    sub_10003D8C4((uint64_t)v5);
    if (qword_100091070 != -1)
      swift_once(&qword_100091070, sub_1000516C4);
    v7 = *v1;
    v8 = type metadata accessor for Logger(0, v6);
    sub_100030760(v8, (uint64_t)qword_100092E90);
    v9 = Logger.logObject.getter(v7);
    v10 = static os_log_type_t.error.getter();
    v11 = os_log_type_enabled(v9, v10);
    v12 = *v1;
    if (v11)
    {
      v13 = (uint8_t *)swift_slowAlloc(12, -1);
      v20 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v13 = 138412290;
      *(_QWORD *)(v0 + 32) = v12;
      v14 = v12;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40, v13 + 4, v13 + 12);
      *v20 = v12;

      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Incorrect id passed into VisualVoicemailManager %@, privacy: .public) but expected a VisualMessage ID!", v13, 0xCu);
      v15 = sub_100031408(&qword_100091F90);
      swift_arrayDestroy(v20, 1, v15);
      swift_slowDealloc(v20, -1, -1);
      swift_slowDealloc(v13, -1, -1);
    }
    else
    {

    }
    v16 = 0;
  }
  else
  {
    v16 = objc_msgSend(*(id *)(*(_QWORD *)(v0 + 48) + OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager), "voicemailWithIdentifier:", *v5);
    if (v16)
    {
      v17 = (objc_class *)type metadata accessor for VisualMessage();
      v18 = (char *)objc_allocWithZone(v17);
      *(_QWORD *)&v18[OBJC_IVAR___MPVisualMessage_vmMessage] = v16;
      *(_QWORD *)(v0 + 16) = v18;
      *(_QWORD *)(v0 + 24) = v17;
      v16 = objc_msgSendSuper2((objc_super *)(v0 + 16), "init");
    }
  }
  swift_task_dealloc(*(_QWORD *)(v0 + 64));
  return (*(uint64_t (**)(id))(v0 + 8))(v16);
}

uint64_t sub_10003BDF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v4 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v4, &unk_100091088);
  v5 = sub_10003D46C();
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, v5);
  return swift_task_switch(sub_10003BE60, v6, v7);
}

uint64_t sub_10003BE60()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  _QWORD *v6;

  v1 = *(void **)(v0 + 32);
  v2 = *(void **)(v0 + 16);
  *(_QWORD *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  v3 = dword_100091794;
  v4 = v2;
  v5 = v1;
  v6 = (_QWORD *)swift_task_alloc(v3);
  *(_QWORD *)(v0 + 48) = v6;
  *v6 = v0;
  v6[1] = sub_10003BED4;
  return sub_10003B9D8(*(_QWORD *)(v0 + 16));
}

uint64_t sub_10003BED4(uint64_t a1)
{
  uint64_t *v1;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  uint64_t v7;

  v3 = *(void (***)(_QWORD, _QWORD))(*v1 + 40);
  v4 = *(void **)(*v1 + 32);
  v5 = *(void **)(*v1 + 16);
  v7 = *v1;
  swift_task_dealloc(*(_QWORD *)(*v1 + 48));

  v3[2](v3, a1);
  _Block_release(v3);
  swift_unknownObjectRelease(a1);
  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t sub_10003BF58(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[10] = a2;
  v3[11] = v2;
  v3[9] = a1;
  v4 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v4, &unk_100091088);
  v5 = sub_10003D46C();
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, v5);
  return swift_task_switch(sub_10003BFC8, v6, v7);
}

uint64_t sub_10003BFC8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v1 = v0[10];
  v2 = v0[9];
  v3 = *(void **)(v0[11] + OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager);
  v4 = swift_allocObject(&unk_10007E3D0, 32, 7);
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v1;
  v0[6] = sub_10003D7E8;
  v0[7] = v4;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_10003C170;
  v0[5] = &unk_10007E3E8;
  v5 = _Block_copy(v0 + 2);
  v6 = v0[7];
  swift_retain(v1);
  swift_release(v6);
  v7 = objc_msgSend(v3, "voicemailsPassingTest:", v5);
  _Block_release(v5);
  v8 = sub_10003D530();
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, v8);

  v10 = sub_100039B18(v9);
  swift_bridgeObjectRelease(v9);
  return ((uint64_t (*)(_QWORD *))v0[1])(v10);
}

uint64_t sub_10003C0EC(void *a1, uint64_t (*a2)(id, uint64_t))
{
  objc_class *v4;
  char *v5;
  id v6;
  id v7;
  uint64_t v8;
  objc_super v10;

  v4 = (objc_class *)type metadata accessor for VisualMessage();
  v5 = (char *)objc_allocWithZone(v4);
  *(_QWORD *)&v5[OBJC_IVAR___MPVisualMessage_vmMessage] = a1;
  v10.receiver = v5;
  v10.super_class = v4;
  v6 = a1;
  v7 = objc_msgSendSuper2(&v10, "init");
  LOBYTE(a2) = a2(v7, v8);

  return a2 & 1;
}

uint64_t sub_10003C170(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t (*v4)(void);
  id v5;

  v4 = *(uint64_t (**)(void))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  LOBYTE(v4) = v4();
  swift_release(v3);

  return v4 & 1;
}

uint64_t sub_10003C2F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v4 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v4, &unk_100091088);
  v5 = sub_10003D46C();
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, v5);
  return swift_task_switch(sub_10003C368, v6, v7);
}

uint64_t sub_10003C368()
{
  uint64_t v0;
  const void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;

  v1 = *(const void **)(v0 + 24);
  v2 = *(void **)(v0 + 32);
  v3 = _Block_copy(*(const void **)(v0 + 16));
  *(_QWORD *)(v0 + 40) = _Block_copy(v1);
  v4 = swift_allocObject(&unk_10007E3A8, 24, 7);
  *(_QWORD *)(v0 + 48) = v4;
  *(_QWORD *)(v4 + 16) = v3;
  v5 = dword_10009176C;
  v6 = v2;
  v7 = (_QWORD *)swift_task_alloc(v5);
  *(_QWORD *)(v0 + 56) = v7;
  *v7 = v0;
  v7[1] = sub_10003C40C;
  return sub_10003BF58((uint64_t)sub_10003D7BC, v4);
}

uint64_t sub_10003C40C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  Class isa;
  uint64_t v8;

  v3 = *(_QWORD *)(*v1 + 48);
  v5 = *(void **)(*v1 + 32);
  v4 = *(void (***)(_QWORD, _QWORD))(*v1 + 40);
  v8 = *v1;
  swift_task_dealloc(*(_QWORD *)(*v1 + 56));
  swift_release(v3);

  sub_100031408(&qword_1000916D0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  ((void (**)(_QWORD, Class))v4)[2](v4, isa);

  _Block_release(v4);
  return (*(uint64_t (**)(void))(v8 + 8))();
}

id sub_10003C4DC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for VisualVoicemailManager()
{
  return objc_opt_self(_TtC9IntentsUI22VisualVoicemailManager);
}

uint64_t sub_10003C56C(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t ObjectType;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v24;
  uint64_t v25;

  v3 = type metadata accessor for Notification(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100091070 != -1)
    swift_once(&qword_100091070, sub_1000516C4);
  v8 = type metadata accessor for Logger(0, v5);
  sub_100030760(v8, (uint64_t)qword_100092E90);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, a1, v3);
  v9 = v1;
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc(22, -1);
    v13 = swift_slowAlloc(64, -1);
    v25 = v13;
    *(_DWORD *)v12 = 136315394;
    ObjectType = swift_getObjectType(v9);
    v15 = _typeName(_:qualified:)(ObjectType, 0);
    v17 = v16;
    v24 = sub_10004DF18(v15, v16, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v12 + 4, v12 + 12);

    v18 = swift_bridgeObjectRelease(v17);
    *(_WORD *)(v12 + 12) = 2080;
    v24 = Notification.name.getter(v18);
    type metadata accessor for Name(0);
    v20 = String.init<A>(describing:)(&v24, v19);
    v22 = v21;
    v24 = sub_10004DF18(v20, v21, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v12 + 14, v12 + 22);
    swift_bridgeObjectRelease(v22);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "%s is handling %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy(v13, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }

  return (*(uint64_t (**)(void))&v9[OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_onVoicemailsChanged])();
}

uint64_t sub_10003C880(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v9;
  id v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t ObjectType;
  uint64_t v16;
  char v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;

  if (qword_100091070 != -1)
    swift_once(&qword_100091070, sub_1000516C4);
  v9 = type metadata accessor for Logger(0, a2);
  sub_100030760(v9, (uint64_t)qword_100092E90);
  swift_bridgeObjectRetain_n(a2, 2);
  v10 = v4;
  swift_bridgeObjectRetain_n(a3, 2);
  swift_bridgeObjectRetain_n(a4, 2);
  v11 = (char *)v10;
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v29 = v12;
    v31 = v13;
    v14 = swift_slowAlloc(48, -1);
    v30 = swift_slowAlloc(32, -1);
    v33 = v30;
    *(_DWORD *)v14 = 136316162;
    ObjectType = swift_getObjectType(v11);
    v16 = _typeName(_:qualified:)(ObjectType, 0);
    v17 = a1;
    v19 = v18;
    v32 = sub_10004DF18(v16, v18, &v33);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v14 + 4, v14 + 12);

    swift_bridgeObjectRelease(v19);
    *(_WORD *)(v14 + 12) = 1024;
    LODWORD(v32) = v17 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, (char *)&v32 + 4, v14 + 14, v14 + 18);
    *(_WORD *)(v14 + 18) = 2048;
    if (a3)
    {
      if ((unint64_t)a3 >> 62)
      {
        if (a3 >= 0)
          v26 = a3 & 0xFFFFFFFFFFFFFF8;
        else
          v26 = a3;
        swift_bridgeObjectRetain(a3);
        v20 = _CocoaArrayWrapper.endIndex.getter(v26);
        swift_bridgeObjectRelease(a3);
      }
      else
      {
        v20 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      v21 = v29;
      swift_bridgeObjectRelease(a3);
    }
    else
    {
      v20 = 0;
      v21 = v29;
    }
    v32 = v20;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v14 + 20, v14 + 28);
    swift_bridgeObjectRelease(a3);
    *(_WORD *)(v14 + 28) = 2048;
    if (a4)
    {
      if ((unint64_t)a4 >> 62)
      {
        if (a4 >= 0)
          v27 = a4 & 0xFFFFFFFFFFFFFF8;
        else
          v27 = a4;
        swift_bridgeObjectRetain(a4);
        v23 = _CocoaArrayWrapper.endIndex.getter(v27);
        swift_bridgeObjectRelease(a4);
      }
      else
      {
        v23 = *(_QWORD *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease(a4);
    }
    else
    {
      v23 = 0;
    }
    v32 = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v14 + 30, v14 + 38);
    swift_bridgeObjectRelease(a4);
    *(_WORD *)(v14 + 38) = 2048;
    if (a2)
    {
      if ((unint64_t)a2 >> 62)
      {
        if (a2 >= 0)
          v28 = a2 & 0xFFFFFFFFFFFFFF8;
        else
          v28 = a2;
        swift_bridgeObjectRetain(a2);
        v24 = _CocoaArrayWrapper.endIndex.getter(v28);
        swift_bridgeObjectRelease(a2);
      }
      else
      {
        v24 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease(a2);
    }
    else
    {
      v24 = 0;
    }
    v32 = v24;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v14 + 40, v14 + 48);
    swift_bridgeObjectRelease(a2);
    _os_log_impl((void *)&_mh_execute_header, v21, v31, "%s voicemailsDidChangeInitial: %{BOOL}d added: %ld, deleted: %ld, updated: %ld", (uint8_t *)v14, 0x30u);
    swift_arrayDestroy(v30, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v30, -1, -1);
    swift_slowDealloc(v14, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a3, 2);
    swift_bridgeObjectRelease_n(a4, 2);
    v22 = swift_bridgeObjectRelease_n(a2, 2);
  }
  return (*(uint64_t (**)(uint64_t))&v11[OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_onVoicemailsChanged])(v22);
}

void sub_10003CE78(const char *a1, uint64_t a2)
{
  void *v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t ObjectType;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  if (qword_100091070 != -1)
    swift_once(&qword_100091070, sub_1000516C4);
  v4 = type metadata accessor for Logger(0, a2);
  sub_100030760(v4, (uint64_t)qword_100092E90);
  v13 = v2;
  v5 = Logger.logObject.getter(v13);
  v6 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    v8 = swift_slowAlloc(32, -1);
    v15 = v8;
    *(_DWORD *)v7 = 136315138;
    ObjectType = swift_getObjectType(v13);
    v10 = _typeName(_:qualified:)(ObjectType, 0);
    v12 = v11;
    v14 = sub_10004DF18(v10, v11, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, &v15, v7 + 4, v7 + 12);

    swift_bridgeObjectRelease(v12);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, a1, v7, 0xCu);
    swift_arrayDestroy(v8, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_10003D078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  v7 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v7, &unk_100091088);
  v8 = (_QWORD *)swift_task_alloc(dword_100091744);
  *(_QWORD *)(v5 + 16) = v8;
  *v8 = v5;
  v8[1] = sub_1000399C8;
  return sub_10003A484(a5, v9);
}

uint64_t sub_10003D0F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  v7 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v7, &unk_100091088);
  v8 = (_QWORD *)swift_task_alloc(dword_10009172C);
  *(_QWORD *)(v5 + 16) = v8;
  *v8 = v5;
  v8[1] = sub_1000399C8;
  return sub_10003A9BC(a5, v9);
}

uint64_t sub_10003D170(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  v7 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v7, &unk_100091088);
  v8 = (_QWORD *)swift_task_alloc(dword_100091714);
  *(_QWORD *)(v5 + 16) = v8;
  *v8 = v5;
  v8[1] = sub_1000399C8;
  return sub_10003AF68(a5, v9);
}

uint64_t sub_10003D1EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  v7 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v7, &unk_100091088);
  v8 = (_QWORD *)swift_task_alloc(dword_1000916F4);
  *(_QWORD *)(v5 + 16) = v8;
  *v8 = v5;
  v8[1] = sub_1000399C8;
  return sub_10003B4A0(a5, v9);
}

uint64_t sub_10003D268(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t inited;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v22;

  v9 = sub_100031408(&qword_100091120);
  __chkstk_darwin(v9);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100031408(&qword_1000916D0);
  v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v12);
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = type metadata accessor for VoicemailActor();
  v16 = a1;
  swift_bridgeObjectRetain(v13);
  inited = swift_initStaticObject(v15, &unk_100091088);
  v18 = sub_10003D46C();
  v19 = (_QWORD *)swift_allocObject(a4, 48, 7);
  v19[2] = inited;
  v19[3] = v18;
  v19[4] = v16;
  v19[5] = v13;
  v20 = sub_100051774((uint64_t)v11, a5, (uint64_t)v19);

  swift_bridgeObjectRelease(v13);
  return swift_release(v20);
}

char *sub_10003D3A0(void *a1, uint64_t a2, uint64_t a3)
{
  objc_class *v6;
  char *v7;
  char *v8;
  id v9;
  char *v10;
  void *v11;
  char *v12;
  id v13;
  objc_super v15;

  v6 = (objc_class *)type metadata accessor for VisualVoicemailManager();
  v7 = (char *)objc_allocWithZone(v6);
  *(_QWORD *)&v7[OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager] = a1;
  v8 = &v7[OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_onVoicemailsChanged];
  *(_QWORD *)v8 = a2;
  *((_QWORD *)v8 + 1) = a3;
  v15.receiver = v7;
  v15.super_class = v6;
  v9 = a1;
  swift_retain(a3);
  v10 = (char *)objc_msgSendSuper2(&v15, "init");
  v11 = *(void **)&v10[OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager];
  v12 = v10;
  v13 = v11;
  objc_msgSend(v13, "setDelegate:", v12, v15.receiver, v15.super_class);

  swift_release(a3);
  return v12;
}

unint64_t sub_10003D46C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000916E0;
  if (!qword_1000916E0)
  {
    v1 = type metadata accessor for VoicemailActor();
    result = swift_getWitnessTable(&unk_100075CA8, v1);
    atomic_store(result, (unint64_t *)&qword_1000916E0);
  }
  return result;
}

uint64_t sub_10003D4B8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc(dword_1000916DC);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_1000399C8;
  return sub_10003D1EC(a1, v4, v5, v7, v6);
}

unint64_t sub_10003D530()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000916F8;
  if (!qword_1000916F8)
  {
    v1 = objc_opt_self(VMVoicemail);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, &qword_1000916F8);
  }
  return result;
}

uint64_t sub_10003D570(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc(dword_100091704);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_1000399C8;
  return sub_10003D170(a1, v4, v5, v7, v6);
}

uint64_t sub_10003D5EC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc(dword_10009171C);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_100030A5C;
  return sub_10003D0F4(a1, v4, v5, v7, v6);
}

uint64_t sub_10003D668()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10003D69C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc(dword_100091734);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_1000399C8;
  return sub_10003D078(a1, v4, v5, v7, v6);
}

uint64_t sub_10003D714()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  _Block_release(*(const void **)(v0 + 24));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10003D748()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_10009174C);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1000399C8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100091748 + dword_100091748))(v2, v3, v4);
}

uint64_t sub_10003D7BC(uint64_t a1)
{
  uint64_t v1;

  return sub_10003F4EC(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_10003D7C4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10003D7E8(void *a1)
{
  uint64_t v1;

  return sub_10003C0EC(a1, *(uint64_t (**)(id, uint64_t))(v1 + 16));
}

uint64_t sub_10003D7F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10003D800(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10003D80C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_100091774);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1000399C8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100091770 + dword_100091770))(v2, v3, v4);
}

uint64_t sub_10003D880(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MessageID.Value(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003D8C4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MessageID.Value(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10003D904()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_1000917A4);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1000399C8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1000917A0 + dword_1000917A0))(v2, v3, v4);
}

uint64_t sub_10003D97C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_1000917C4);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1000399C8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1000917C0 + dword_1000917C0))(v2, v3, v4);
}

uint64_t sub_10003D9F4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_1000917E4);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1000399C8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1000917E0 + dword_1000917E0))(v2, v3, v4);
}

uint64_t sub_10003DA6C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10003DAA0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_100091804);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1000399C8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100091800 + dword_100091800))(v2, v3, v4);
}

uint64_t sub_10003DB14()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10003DB40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc(dword_100091824);
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1000399C8;
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)&dword_100091820 + dword_100091820))(v2, v3);
}

uint64_t sub_10003DBAC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10003DBD0()
{
  uint64_t v0;

  return sub_100051F64(*(_QWORD *)(v0 + 16));
}

uint64_t sub_10003DCC8(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD v15[2];
  _QWORD *v16;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v13 = a1;
    else
      v13 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v13);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = _swiftEmptyArrayStorage;
  if (!v2)
    return (uint64_t)v3;
  v16 = _swiftEmptyArrayStorage;
  result = sub_1000489B0(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      v5 = 0;
      v3 = v16;
      do
      {
        v14 = specialized _ArrayBuffer._getElementSlowPath(_:)(v5, a1);
        v6 = sub_100031408(&qword_1000918B0);
        swift_dynamicCast(v15, &v14, v6, (char *)&type metadata for Any + 8, 7);
        if ((swift_isUniquelyReferenced_nonNull_native(v3) & 1) == 0)
        {
          sub_1000489B0(0, v3[2] + 1, 1);
          v3 = v16;
        }
        v8 = v3[2];
        v7 = v3[3];
        if (v8 >= v7 >> 1)
        {
          sub_1000489B0(v7 > 1, v8 + 1, 1);
          v3 = v16;
        }
        ++v5;
        v3[2] = v8 + 1;
        sub_10003EAD8(v15, &v3[4 * v8 + 4]);
      }
      while (v2 != v5);
    }
    else
    {
      v9 = (uint64_t *)(a1 + 32);
      v3 = v16;
      do
      {
        v14 = *v9;
        swift_unknownObjectRetain(v14);
        v10 = sub_100031408(&qword_1000918B0);
        swift_dynamicCast(v15, &v14, v10, (char *)&type metadata for Any + 8, 7);
        if ((swift_isUniquelyReferenced_nonNull_native(v3) & 1) == 0)
        {
          sub_1000489B0(0, v3[2] + 1, 1);
          v3 = v16;
        }
        v12 = v3[2];
        v11 = v3[3];
        if (v12 >= v11 >> 1)
        {
          sub_1000489B0(v11 > 1, v12 + 1, 1);
          v3 = v16;
        }
        v3[2] = v12 + 1;
        sub_10003EAD8(v15, &v3[4 * v12 + 4]);
        ++v9;
        --v2;
      }
      while (v2);
    }
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

id sub_10003E0B4()
{
  return sub_10003EA78(type metadata accessor for VisualTranscriptionMessage);
}

uint64_t type metadata accessor for VisualTranscriptionMessage()
{
  return objc_opt_self(MPVisualTranscriptionMessage);
}

id sub_10003E3B4(char *a1, uint64_t a2, SEL *a3)
{
  void *v4;
  char *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;

  v4 = *(void **)&a1[OBJC_IVAR___MPVisualMessage_vmMessage];
  v5 = a1;
  v6 = objc_msgSend(v4, *a3);
  if (v6)
  {
    v7 = v6;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
    v9 = v8;

    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  else
  {

    v10 = 0;
  }
  return v10;
}

id sub_10003E850(char *a1, uint64_t a2, void *a3, _QWORD *a4, uint64_t (*a5)(void))
{
  id v6;
  objc_super v8;

  *(_QWORD *)&a1[*a4] = a3;
  v8.receiver = a1;
  v8.super_class = (Class)a5();
  v6 = a3;
  return objc_msgSendSuper2(&v8, "init");
}

id sub_10003EA6C()
{
  return sub_10003EA78(type metadata accessor for VisualMessage);
}

id sub_10003EA78(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for VisualMessage()
{
  return objc_opt_self(MPVisualMessage);
}

_OWORD *sub_10003EAD8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

_QWORD *sub_10003EAE8(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *result;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_14;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = _swiftEmptyArrayStorage;
    if (!v2)
      break;
    result = (_QWORD *)specialized ContiguousArray.reserveCapacity(_:)(v2);
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    v4 = 0;
    v19 = v1 & 0xC000000000000001;
    v5 = v1;
    while (v2 != v4)
    {
      if (v19)
        v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4, v1);
      else
        v6 = *(id *)(v1 + 8 * v4 + 32);
      v7 = v6;
      ++v4;
      v8 = type metadata accessor for FTMessage(0);
      v9 = swift_allocObject(v8, *(unsigned int *)(v8 + 48), *(unsigned __int16 *)(v8 + 52));
      *(_QWORD *)(v9 + 24) = 0;
      *(_BYTE *)(v9 + 32) = 1;
      *(_WORD *)(v9 + 33) = 514;
      v10 = v9 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___dataURL;
      v11 = sub_100031408(&qword_1000918B8);
      v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56);
      v12(v10, 1, 1, v11);
      v12(v9 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___thumbnailURL, 1, 1, v11);
      v12(v9 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcriptURL, 1, 1, v11);
      v13 = v9 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcriptData;
      v14 = sub_100031408(&qword_100091BE0);
      v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
      *(_QWORD *)(v9 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcript) = 1;
      *(_BYTE *)(v9 + OBJC_IVAR____TtC9IntentsUI9FTMessage_didLoadTranscript) = 0;
      *(_BYTE *)(v9 + OBJC_IVAR____TtC9IntentsUI9FTMessage_isDirty) = 0;
      *(_QWORD *)(v9 + 16) = v7;
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v15);
      v16 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v16);
      v17 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v16, v9);
      specialized ContiguousArray._endMutation()(v17);
      v1 = v5;
      if (v2 == v4)
        return _swiftEmptyArrayStorage;
    }
    __break(1u);
LABEL_14:
    if (v1 < 0)
      v18 = v1;
    else
      v18 = v1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(v1);
  }
  return result;
}

uint64_t sub_10003ED20(uint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _BYTE v19[24];
  _QWORD *v20;

  v2 = v1;
  v18 = type metadata accessor for UUID(0);
  v4 = *(_QWORD *)(v18 - 8);
  __chkstk_darwin(v18);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((unint64_t)a1 >> 62)
    goto LABEL_15;
  v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v8 = _swiftEmptyArrayStorage;
    if (!v7)
      return (uint64_t)v8;
    v20 = _swiftEmptyArrayStorage;
    result = sub_1000489CC(0, v7 & ~(v7 >> 63), 0);
    if (v7 < 0)
      break;
    v10 = 0;
    v8 = v20;
    v16 = v2;
    v17 = a1 & 0xC000000000000001;
    v11 = a1;
    while (v7 != v10)
    {
      if (v17)
      {
        v12 = specialized _ArrayBuffer._getElementSlowPath(_:)(v10, a1);
      }
      else
      {
        v12 = *(_QWORD *)(a1 + 8 * v10 + 32);
        swift_retain(v12);
      }
      swift_beginAccess(v12 + 16, v19, 32, 0);
      v13 = swift_retain(v12);
      dispatch thunk of Message.recordUUID.getter(v13);
      swift_endAccess(v19);
      swift_release_n(v12, 2);
      v20 = v8;
      v2 = v8[2];
      v14 = v8[3];
      if (v2 >= v14 >> 1)
      {
        sub_1000489CC(v14 > 1, v2 + 1, 1);
        v8 = v20;
      }
      ++v10;
      v8[2] = v2 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))((unint64_t)v8+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(_QWORD *)(v4 + 72) * v2, v6, v18);
      a1 = v11;
      if (v7 == v10)
        return (uint64_t)v8;
    }
    __break(1u);
LABEL_15:
    if (a1 < 0)
      v15 = a1;
    else
      v15 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v7 = _CocoaArrayWrapper.endIndex.getter(v15);
    swift_bridgeObjectRelease(a1);
  }
  __break(1u);
  return result;
}

unint64_t sub_10003EF10(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100031408(&qword_1000915C8);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v7 = *v6;
    v8 = (id)*(v6 - 1);
    swift_bridgeObjectRetain(v7);
    result = sub_1000485AC((uint64_t)v8);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = 8 * result;
    *(_QWORD *)(v4[6] + v11) = v8;
    *(_QWORD *)(v4[7] + v11) = v7;
    v12 = v4[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v4[2] = v14;
    v6 += 2;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_10003F018(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void **v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t result;
  char v12;
  uint64_t *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100031408(&qword_100091C20);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (void **)(a1 + 48);
  while (1)
  {
    v7 = (uint64_t)*(v6 - 2);
    v8 = (uint64_t)*(v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    v10 = v9;
    result = sub_1000485DC(v7, v8);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v4[6] + 16 * result);
    *v13 = v7;
    v13[1] = v8;
    *(_QWORD *)(v4[7] + 8 * result) = v10;
    v14 = v4[2];
    v15 = __OFADD__(v14, 1);
    v16 = v14 + 1;
    if (v15)
      goto LABEL_11;
    v4[2] = v16;
    v6 += 3;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

_QWORD *sub_10003F130(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_18;
  specialized ContiguousArray.reserveCapacity(_:)(*(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10));
  v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v2)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (i = 0; ; ++i)
      {
        v4 = specialized _ArrayBuffer._getElementSlowPath(_:)(i, v1);
        v5 = i + 1;
        if (__OFADD__(i, 1))
          break;
        v6 = v4;
        v7 = type metadata accessor for VisualMessage();
        v8 = swift_dynamicCastClass(v6, v7);
        if (!v8)
        {
          swift_unknownObjectRelease(v6);
          goto LABEL_15;
        }
        v9 = v8;
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v8);
        v10 = _swiftEmptyArrayStorage[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v10);
        v11 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v10, v9);
        specialized ContiguousArray._endMutation()(v11);
        if (v5 == v2)
          return _swiftEmptyArrayStorage;
      }
      __break(1u);
    }
    else
    {
      v12 = 0;
      v13 = v1 + 32;
      while (1)
      {
        v14 = v12 + 1;
        if (__OFADD__(v12, 1))
          break;
        v15 = *(_QWORD *)(v13 + 8 * v12);
        v16 = type metadata accessor for VisualMessage();
        v17 = swift_dynamicCastClass(v15, v16);
        if (!v17)
        {
LABEL_15:
          swift_release(_swiftEmptyArrayStorage);
          return 0;
        }
        v1 = v17;
        v18 = swift_unknownObjectRetain(v15);
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v18);
        v19 = _swiftEmptyArrayStorage[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v19);
        v20 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v19, v1);
        specialized ContiguousArray._endMutation()(v20);
        ++v12;
        if (v14 == v2)
          return _swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_18:
    if (v1 < 0)
      v22 = v1;
    else
      v22 = v1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v1);
    v23 = _CocoaArrayWrapper.endIndex.getter(v22);
    swift_bridgeObjectRelease(v1);
    specialized ContiguousArray.reserveCapacity(_:)(v23);
    swift_bridgeObjectRetain(v1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v22);
    swift_bridgeObjectRelease(v1);
  }
  return _swiftEmptyArrayStorage;
}

_QWORD *sub_10003F310(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t i;
  void *v4;
  uint64_t v5;
  void *v6;
  __objc2_class *Class;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_24;
  specialized ContiguousArray.reserveCapacity(_:)(*(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10));
  v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v2)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (i = 0; ; ++i)
      {
        v4 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v1);
        v5 = i + 1;
        if (__OFADD__(i, 1))
          break;
        v6 = v4;
        Class = (__objc2_class *)object_getClass(v4);
        if (Class != _TtC9IntentsUI9FTMessage || v6 == 0)
        {
          swift_unknownObjectRelease(v6);
          goto LABEL_21;
        }
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(Class);
        v9 = _swiftEmptyArrayStorage[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v9);
        v10 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v9, v6);
        specialized ContiguousArray._endMutation()(v10);
        if (v5 == v2)
          return _swiftEmptyArrayStorage;
      }
      __break(1u);
    }
    else
    {
      v11 = 0;
      v12 = v1 + 32;
      while (1)
      {
        v13 = v11 + 1;
        if (__OFADD__(v11, 1))
          break;
        v1 = *(_QWORD *)(v12 + 8 * v11);
        if (object_getClass((id)v1) != (Class)_TtC9IntentsUI9FTMessage || v1 == 0)
        {
LABEL_21:
          swift_release(_swiftEmptyArrayStorage);
          return 0;
        }
        v15 = swift_unknownObjectRetain(v1);
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v15);
        v16 = _swiftEmptyArrayStorage[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v16);
        v17 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v16, v1);
        specialized ContiguousArray._endMutation()(v17);
        ++v11;
        if (v13 == v2)
          return _swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_24:
    if (v1 < 0)
      v19 = v1;
    else
      v19 = v1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v1);
    v20 = _CocoaArrayWrapper.endIndex.getter(v19);
    swift_bridgeObjectRelease(v1);
    specialized ContiguousArray.reserveCapacity(_:)(v20);
    swift_bridgeObjectRetain(v1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v19);
    swift_bridgeObjectRelease(v1);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_10003F4EC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

void sub_10003F510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  NSString v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t aBlock;
  _QWORD v24[4];
  uint64_t v25;

  swift_bridgeObjectRetain_n(a2, 2);
  v6 = swift_bridgeObjectRetain_n(a3, 2);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc(22, -1);
    v10 = swift_slowAlloc(64, -1);
    v22 = v10;
    aBlock = a1;
    *(_DWORD *)v9 = 136315394;
    v24[0] = a2;
    swift_bridgeObjectRetain(a2);
    v11 = String.init<A>(reflecting:)(&aBlock, &type metadata for String);
    v13 = v12;
    aBlock = sub_10004DF18(v11, v12, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v24, v9 + 4, v9 + 12);
    swift_bridgeObjectRelease_n(a2, 2);
    swift_bridgeObjectRelease(v13);
    *(_WORD *)(v9 + 12) = 2080;
    aBlock = a3;
    swift_bridgeObjectRetain(a3);
    v14 = sub_100031408(&qword_100091CC0);
    v15 = String.init<A>(reflecting:)(&aBlock, v14);
    v17 = v16;
    aBlock = sub_10004DF18(v15, v16, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v24, v9 + 14, v9 + 22);
    swift_bridgeObjectRelease_n(a3, 2);
    swift_bridgeObjectRelease(v17);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "VoiceMailAnalyticsLogger: logging core analytics for event of %s with dictionary %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy(v10, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1, -1);
    swift_slowDealloc(v9, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(a3, 2);
    swift_bridgeObjectRelease_n(a2, 2);
  }

  v18 = String._bridgeToObjectiveC()();
  v19 = swift_allocObject(&unk_10007ECE0, 24, 7);
  *(_QWORD *)(v19 + 16) = a3;
  v24[3] = sub_100049D30;
  v25 = v19;
  aBlock = (uint64_t)_NSConcreteStackBlock;
  v24[0] = 1107296256;
  v24[1] = sub_10003F7AC;
  v24[2] = &unk_10007ECF8;
  v20 = _Block_copy(&aBlock);
  v21 = v25;
  swift_bridgeObjectRetain(a3);
  swift_release(v21);
  AnalyticsSendEventLazy(v18, v20);
  _Block_release(v20);

}

Class sub_10003F7AC(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSDictionary v5;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v4 = v1(v3);
  swift_release(v2);
  if (v4)
  {
    sub_100049D50(0, &qword_100091CC8, NSObject_ptr);
    v5.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5.super.isa = 0;
  }
  return v5.super.isa;
}

id sub_10003F8E4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VoiceMailAnalyticsLogger(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10003F954()
{
  return type metadata accessor for VoiceMailAnalyticsLogger(0);
}

uint64_t type metadata accessor for VoiceMailAnalyticsLogger(uint64_t a1)
{
  return sub_10003FCA8(a1, (uint64_t *)&unk_1000918F0, (uint64_t)&nominal type descriptor for VoiceMailAnalyticsLogger);
}

uint64_t sub_10003F970(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v4;
  uint64_t v5;

  result = type metadata accessor for Logger(319, a2);
  if (v4 <= 0x3F)
  {
    v5 = *(_QWORD *)(result - 8) + 64;
    result = swift_updateClassMetadata2(a1, 256, 1, &v5, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_10003F9DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = v2;
  v6 = OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_logger;
  v7 = qword_100091070;
  swift_retain(v3);
  if (v7 != -1)
    swift_once(&qword_100091070, sub_1000516C4);
  v9 = type metadata accessor for Logger(0, v8);
  v10 = sub_100030760(v9, (uint64_t)qword_100092E90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v3 + v6, v10, v9);
  v11 = OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_analyticsReporter;
  *(_QWORD *)(v3 + v11) = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for VoiceMailAnalyticsLogger(0)), "init");
  *(_QWORD *)(v3 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageTypes) = &off_10007DD18;
  v12 = (_QWORD *)(v3 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_onVoicemailsChanged);
  *v12 = a1;
  v12[1] = a2;
  type metadata accessor for MessageStoreController(0);
  v13 = swift_retain(a2);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController) = static MessageStoreController.shared.getter(v13);
  swift_release(v3);
  *(_QWORD *)(v3 + 16) = 0x8000000000000000;
  *(_QWORD *)(v3 + 24) = _swiftEmptyArrayStorage;
  v14 = *(_QWORD *)(v3 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController);
  swift_retain(v3);
  swift_retain(v14);
  MessageStoreController.addDelegate(_:)(v3);
  swift_release(v14);
  swift_release(v3);
  swift_release(a2);
  return v3;
}

uint64_t sub_10003FB3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = v2 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_logger;
  v4 = type metadata accessor for Logger(0, a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_release(*(_QWORD *)(v2 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_onVoicemailsChanged + 8));
  swift_release(*(_QWORD *)(v2 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController));
  return swift_bridgeObjectRelease(*(_QWORD *)(v2 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageTypes));
}

uint64_t sub_10003FBBC()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = v0;
  v2 = OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController;
  v3 = *(_QWORD *)((char *)v0 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController);
  swift_retain(v3);
  MessageStoreController.removeDelegate(_:)(v1);
  swift_release(v3);
  swift_release(v1[2] & 0x3FFFFFFFFFFFFFFFLL);
  swift_bridgeObjectRelease(v1[3]);
  v4 = (char *)v1 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_logger;
  v6 = type metadata accessor for Logger(0, v5);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);

  swift_release(*(_QWORD *)((char *)v1 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_onVoicemailsChanged + 8));
  swift_release(*(_QWORD *)((char *)v1 + v2));
  swift_bridgeObjectRelease(*(_QWORD *)((char *)v1 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageTypes));
  return swift_deallocClassInstance(v1, *(unsigned int *)(*v1 + 48), *(unsigned __int16 *)(*v1 + 52));
}

uint64_t sub_10003FC8C()
{
  return type metadata accessor for FaceTimeVoicemailManager(0);
}

uint64_t type metadata accessor for FaceTimeVoicemailManager(uint64_t a1)
{
  return sub_10003FCA8(a1, (uint64_t *)&unk_100091948, (uint64_t)&nominal type descriptor for FaceTimeVoicemailManager);
}

uint64_t sub_10003FCA8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

uint64_t sub_10003FCDC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1[101] = v0;
  v2 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v2, &unk_100091088);
  v3 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v4 = dispatch thunk of Actor.unownedExecutor.getter(v2, v3);
  v1[102] = v4;
  v1[103] = v5;
  return swift_task_switch(sub_10003FD74, v4, v5);
}

uint64_t sub_10003FD74(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v1 + 832) = OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_logger;
  v2 = Logger.logObject.getter(a1);
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Fetching Messages from FTMS", v4, 2u);
    swift_slowDealloc(v4, -1, -1);
  }
  v5 = *(_QWORD *)(v1 + 808);

  swift_retain_n(v5, 2);
  v6 = sub_100031634(&qword_100091C70);
  swift_asyncLet_begin(v1 + 16, 0, v6, &unk_100091C68, v5, v1 + 696);
  return swift_asyncLet_get(v1 + 16, v1 + 696, sub_10003FE84, v1 + 704);
}

uint64_t sub_10003FE84()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = v0[87];
  v0[105] = v1;
  v2 = async function pointer to Task.value.getter[1];
  swift_retain(v1);
  v3 = (_QWORD *)swift_task_alloc(v2);
  v0[106] = v3;
  v4 = sub_100031408(&qword_100091C78);
  v5 = sub_100031408(&qword_100091C80);
  *v3 = v0;
  v3[1] = sub_10003FF24;
  return Task.value.getter(v0 + 99, v1, v4, v5, &protocol self-conformance witness table for Error);
}

uint64_t sub_10003FF24()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 848);
  *(_QWORD *)(*(_QWORD *)v1 + 856) = v0;
  swift_task_dealloc(v3);
  swift_release(v2[105]);
  if (v0)
    v4 = sub_100040164;
  else
    v4 = sub_10003FF90;
  return swift_task_switch(v4, v2[102], v2[103]);
}

uint64_t sub_10003FF90()
{
  _QWORD *v0;
  int64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v8;

  v1 = v0[99];
  v2 = swift_bridgeObjectRetain_n(v1, 2);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v5 = 134349056;
    if ((unint64_t)v1 >> 62)
    {
      if (v1 < 0)
        v8 = v1;
      else
        v8 = v1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v1);
      v6 = _CocoaArrayWrapper.endIndex.getter(v8);
      swift_bridgeObjectRelease(v1);
    }
    else
    {
      v6 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease(v1);
    v0[100] = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 100, v0 + 101, v5 + 4, v5 + 12);
    swift_bridgeObjectRelease(v1);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Fetched %{public}ld message(s) from FTMS", v5, 0xCu);
    swift_slowDealloc(v5, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(v1, 2);
  }

  v0[108] = sub_10003EAE8(v1);
  swift_bridgeObjectRelease(v1);
  return swift_asyncLet_finish(v0 + 2, v0 + 87, sub_100040114, v0 + 94);
}

uint64_t sub_100040114()
{
  uint64_t v0;

  return swift_task_switch(sub_100040128, *(_QWORD *)(v0 + 816), *(_QWORD *)(v0 + 824));
}

uint64_t sub_100040128()
{
  uint64_t v0;

  swift_release_n(*(_QWORD *)(v0 + 808), 2);
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 864));
}

uint64_t sub_100040164()
{
  uint64_t v0;

  return swift_asyncLet_finish(v0 + 16, v0 + 696, sub_10004017C, v0 + 656);
}

uint64_t sub_10004017C()
{
  uint64_t v0;

  return swift_task_switch(sub_100040190, *(_QWORD *)(v0 + 816), *(_QWORD *)(v0 + 824));
}

uint64_t sub_100040190()
{
  uint64_t v0;

  swift_release_n(*(_QWORD *)(v0 + 808), 2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000401C8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = a2;
  v3 = sub_100031408(&qword_100091120);
  v2[4] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100040224, 0, 0);
}

uint64_t sub_100040224()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(uint64_t **)(v0 + 16);
  static TaskPriority.userInitiated.getter();
  v4 = type metadata accessor for TaskPriority(0);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v2, 0, 1, v4);
  v5 = (_QWORD *)swift_allocObject(&unk_10007EBC8, 40, 7);
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = v1;
  swift_retain(v1);
  *v3 = sub_100040A78(v2, (uint64_t)&unk_100091C90, (uint64_t)v5);
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000402D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t Options;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t Request;
  uint64_t v11;

  v4[5] = a1;
  v4[6] = a4;
  Options = type metadata accessor for MessageFetchOptions(0);
  v4[7] = Options;
  v4[8] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(Options - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for MessageStoreFetchRequest.QuerySearchType(0);
  v4[9] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v4[10] = v7;
  v4[11] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for MessageStoreQuery(0);
  v4[12] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v4[13] = v9;
  v4[14] = swift_task_alloc((*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  Request = type metadata accessor for MessageStoreFetchRequest(0);
  v4[15] = Request;
  v11 = *(_QWORD *)(Request - 8);
  v4[16] = v11;
  v4[17] = swift_task_alloc((*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_1000403A8, 0, 0);
}

uint64_t sub_1000403A8()
{
  _QWORD *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t *, _QWORD, uint64_t);
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v2 = v0[13];
  v1 = (uint64_t *)v0[14];
  v3 = v0[12];
  v26 = v0[10];
  v27 = v0[11];
  v28 = v0[9];
  v4 = v0[7];
  v29 = v0[8];
  v5 = v0[6];
  v6 = swift_allocObject(&unk_10007EBF0, 24, 7);
  v7 = sub_100031408(&qword_100091C98);
  v8 = *(_QWORD *)(v2 + 72);
  v9 = *(unsigned __int8 *)(v2 + 80);
  v10 = (v9 + 32) & ~v9;
  v11 = swift_allocObject(v7, v10 + 2 * v8, v9 | 7);
  *(_OWORD *)(v11 + 16) = xmmword_100075BB0;
  v12 = (uint64_t *)(v11 + v10);
  v13 = swift_allocObject(&unk_10007EC18, 24, 7);
  *(_QWORD *)(v13 + 16) = &off_10007DD40;
  *v12 = v13;
  v14 = *(void (**)(uint64_t *, _QWORD, uint64_t))(v2 + 104);
  v14(v12, enum case for MessageStoreQuery.providers(_:), v3);
  v15 = (uint64_t *)((char *)v12 + v8);
  v16 = swift_allocObject(&unk_10007EC40, 24, 7);
  v17 = *(_QWORD *)(v5 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageTypes);
  *(_QWORD *)(v16 + 16) = v17;
  *v15 = v16;
  v14(v15, enum case for MessageStoreQuery.types(_:), v3);
  *(_QWORD *)(v6 + 16) = v11;
  *v1 = v6;
  v14(v1, enum case for MessageStoreQuery.and(_:), v3);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v26 + 104))(v27, enum case for MessageStoreFetchRequest.QuerySearchType.unsorted(_:), v28);
  v0[2] = _swiftEmptyArrayStorage;
  v18 = sub_1000316E0(&qword_100091C30, (uint64_t (*)(uint64_t))&type metadata accessor for MessageFetchOptions, (uint64_t)&protocol conformance descriptor for MessageFetchOptions);
  swift_bridgeObjectRetain(v17);
  v19 = sub_100031408(&qword_100091C38);
  v20 = sub_100049AB4();
  dispatch thunk of SetAlgebra.init<A>(_:)(v0 + 2, v19, v20, v4, v18);
  MessageStoreFetchRequest.init(query:sortType:options:pageSize:page:originatingBundleID:)(v1, v27, v29, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0);
  v0[18] = OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController;
  v21 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v21, &unk_100091088);
  v22 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v23 = dispatch thunk of Actor.unownedExecutor.getter(v21, v22);
  return swift_task_switch(sub_10004062C, v23, v24);
}

uint64_t sub_10004062C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0[6] + v0[18]);
  v0[19] = v1;
  v2 = async function pointer to MessageStoreController.getMessages(fetchRequest:)[1];
  swift_retain(v1);
  v3 = (_QWORD *)swift_task_alloc(v2);
  v0[20] = v3;
  *v3 = v0;
  v3[1] = sub_100040698;
  return MessageStoreController.getMessages(fetchRequest:)(v0[17]);
}

uint64_t sub_100040698(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *(_QWORD **)v2;
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 160);
  v3[21] = a1;
  v3[22] = v1;
  swift_task_dealloc(v4);
  swift_release(v3[19]);
  if (v1)
    v5 = sub_1000408A4;
  else
    v5 = sub_10004070C;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_10004070C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  _BOOL4 v4;
  unint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v16;
  uint64_t v17;

  v1 = swift_bridgeObjectRetain_n(*(_QWORD *)(v0 + 168), 2);
  v2 = Logger.logObject.getter(v1);
  v3 = static os_log_type_t.default.getter();
  v4 = os_log_type_enabled(v2, v3);
  v5 = *(_QWORD *)(v0 + 168);
  if (v4)
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v6 = 134349056;
    if (v5 >> 62)
    {
      v16 = *(_QWORD *)(v0 + 168);
      if (v16 < 0)
        v17 = *(_QWORD *)(v0 + 168);
      else
        v17 = v5 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(*(_QWORD *)(v0 + 168));
      v7 = _CocoaArrayWrapper.endIndex.getter(v17);
      swift_bridgeObjectRelease(v16);
    }
    else
    {
      v7 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v8 = *(_QWORD *)(v0 + 168);
    swift_bridgeObjectRelease(v8);
    *(_QWORD *)(v0 + 32) = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40, v6 + 4, v6 + 12);
    swift_bridgeObjectRelease(v8);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Loading FTMessages gave us %{public}ld message(s).", v6, 0xCu);
    swift_slowDealloc(v6, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 168), 2);
  }

  v9 = *(_QWORD *)(v0 + 168);
  v10 = *(_QWORD *)(v0 + 136);
  v11 = *(_QWORD *)(v0 + 112);
  v12 = *(_QWORD *)(v0 + 88);
  v13 = *(_QWORD *)(v0 + 64);
  v14 = *(_QWORD **)(v0 + 40);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 128) + 8))(v10, *(_QWORD *)(v0 + 120));
  *v14 = v9;
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000408A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 176);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 128) + 8))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 120));
  swift_errorRetain(v1);
  v2 = swift_errorRetain(v1);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = *(_QWORD *)(v0 + 176);
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v6 = 138412290;
    swift_errorRetain(v5);
    v8 = _swift_stdlib_bridgeErrorToNSError(v5);
    *(_QWORD *)(v0 + 24) = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v6 + 4, v6 + 12);
    *v7 = v8;
    swift_errorRelease(v5);
    swift_errorRelease(v5);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Error loading FTMessages %@", v6, 0xCu);
    v9 = sub_100031408(&qword_100091F90);
    swift_arrayDestroy(v7, 1, v9);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

  }
  else
  {
    v11 = *(_QWORD *)(v0 + 176);

    swift_errorRelease(v11);
    v10 = swift_errorRelease(v11);
  }
  v12 = *(_QWORD *)(v0 + 136);
  v13 = *(_QWORD *)(v0 + 112);
  v14 = *(_QWORD *)(v0 + 88);
  v15 = *(_QWORD *)(v0 + 64);
  swift_willThrow(v10);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100040A78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v19[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_1000492AC(a1);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v15 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v16 = sub_100031408(&qword_100091C78);
  if (v14 | v12)
  {
    v19[0] = 0;
    v19[1] = 0;
    v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }
  else
  {
    v17 = 0;
  }
  return swift_task_create(v8, v17, v16, a2, a3);
}

uint64_t sub_100040BA4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t Options;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t Request;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;

  v2[6] = a1;
  v2[7] = v1;
  v4 = sub_100031408(&qword_100091120);
  v2[8] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for MessageStoreFetchRequest.QuerySearchType(0);
  v2[9] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v2[10] = v6;
  v2[11] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  Options = type metadata accessor for MessageFetchOptions(0);
  v2[12] = Options;
  v8 = *(_QWORD *)(Options - 8);
  v2[13] = v8;
  v2[14] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for MessageStoreQuery(0);
  v2[15] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v2[16] = v10;
  v2[17] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  Request = type metadata accessor for MessageStoreFetchRequest(0);
  v2[18] = Request;
  v12 = *(_QWORD *)(Request - 8);
  v2[19] = v12;
  v2[20] = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for MessageID.Value(0);
  v2[21] = v13;
  v2[22] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v13 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for UUID(0);
  v2[23] = v14;
  v15 = *(_QWORD *)(v14 - 8);
  v2[24] = v15;
  v16 = (*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[25] = swift_task_alloc(v16);
  v2[26] = swift_task_alloc(v16);
  v17 = type metadata accessor for VoicemailActor();
  v2[27] = v17;
  v2[28] = swift_initStaticObject(v17, &unk_100091088);
  v18 = (_QWORD *)swift_task_alloc(dword_100091394);
  v2[29] = v18;
  *v18 = v2;
  v18[1] = sub_100040D38;
  return sub_100034148(a1);
}

uint64_t sub_100040D38(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 232);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 216);
  *(_QWORD *)(*(_QWORD *)v1 + 240) = a1;
  swift_task_dealloc(v3);
  v5 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v2[31] = v5;
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, v5);
  v2[32] = v6;
  v2[33] = v7;
  return swift_task_switch(sub_100040DD4, v6, v7);
}

uint64_t sub_100040DD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  void *v25;
  NSObject *v26;
  os_log_type_t v27;
  _BOOL4 v28;
  NSObject *v29;
  uint8_t *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject **v46;
  uint64_t v47;

  v1 = *(_QWORD *)(v0 + 240);
  if (!v1)
  {
    v3 = *(_QWORD *)(v0 + 168);
    v2 = *(_QWORD *)(v0 + 176);
    sub_10003D880(*(_QWORD *)(v0 + 48) + OBJC_IVAR___MPMessageID_value, v2);
    if (swift_getEnumCaseMultiPayload(v2, v3) == 1)
    {
      v4 = *(_QWORD *)(v0 + 208);
      v6 = *(_QWORD *)(v0 + 184);
      v5 = *(_QWORD *)(v0 + 192);
      v8 = *(_QWORD *)(v0 + 128);
      v7 = *(uint64_t **)(v0 + 136);
      v9 = *(_QWORD *)(v0 + 104);
      v40 = *(_QWORD *)(v0 + 120);
      v41 = *(_QWORD *)(v0 + 112);
      v44 = *(_QWORD *)(v0 + 88);
      v42 = *(_QWORD *)(v0 + 96);
      v43 = *(_QWORD *)(v0 + 80);
      v45 = *(_QWORD *)(v0 + 72);
      v47 = *(_QWORD *)(v0 + 56);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 32))(v4, *(_QWORD *)(v0 + 176), v6);
      v10 = swift_allocObject(&unk_10007E7B8, 24, 7);
      v11 = sub_100031408(&qword_100091AA0);
      v12 = *(unsigned __int8 *)(v5 + 80);
      v13 = (v12 + 32) & ~v12;
      v14 = swift_allocObject(v11, v13 + *(_QWORD *)(v5 + 72), v12 | 7);
      *(_OWORD *)(v14 + 16) = xmmword_100075BC0;
      v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
      *(_QWORD *)(v0 + 272) = v15;
      v15(v14 + v13, v4, v6);
      *(_QWORD *)(v10 + 16) = v14;
      *v7 = v10;
      (*(void (**)(uint64_t *, _QWORD, uint64_t))(v8 + 104))(v7, enum case for MessageStoreQuery.recordUUID(_:), v40);
      v16 = sub_100031408(&qword_100091C28);
      v17 = swift_allocObject(v16, ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(_QWORD *)(v9 + 72), *(unsigned __int8 *)(v9 + 80) | 7);
      *(_OWORD *)(v17 + 16) = xmmword_100075BC0;
      static MessageFetchOptions.includeProtectedApps.getter();
      *(_QWORD *)(v0 + 24) = v17;
      v18 = sub_1000316E0(&qword_100091C30, (uint64_t (*)(uint64_t))&type metadata accessor for MessageFetchOptions, (uint64_t)&protocol conformance descriptor for MessageFetchOptions);
      v19 = sub_100031408(&qword_100091C38);
      v20 = sub_100049AB4();
      dispatch thunk of SetAlgebra.init<A>(_:)(v0 + 24, v19, v20, v42, v18);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v43 + 104))(v44, enum case for MessageStoreFetchRequest.QuerySearchType.unsorted(_:), v45);
      MessageStoreFetchRequest.init(query:sortType:options:pageSize:page:originatingBundleID:)(v7, v44, v41, 1, 0, 0, 0);
      v21 = *(_QWORD *)(v47 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController);
      *(_QWORD *)(v0 + 280) = v21;
      v22 = async function pointer to MessageStoreController.getMessages(fetchRequest:)[1];
      swift_retain(v21);
      v23 = (_QWORD *)swift_task_alloc(v22);
      *(_QWORD *)(v0 + 288) = v23;
      *v23 = v0;
      v23[1] = sub_100041210;
      return MessageStoreController.getMessages(fetchRequest:)(*(_QWORD *)(v0 + 160));
    }
    v25 = *(void **)(v0 + 48);
    sub_10003D8C4(*(_QWORD *)(v0 + 176));
    v26 = Logger.logObject.getter(v25);
    v27 = static os_log_type_t.default.getter();
    v28 = os_log_type_enabled(v26, v27);
    v29 = *(NSObject **)(v0 + 48);
    if (v28)
    {
      v30 = (uint8_t *)swift_slowAlloc(12, -1);
      v46 = (NSObject **)swift_slowAlloc(8, -1);
      *(_DWORD *)v30 = 138543362;
      *(_QWORD *)(v0 + 16) = v29;
      v31 = v29;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v30 + 4, v30 + 12);
      *v46 = v29;

      _os_log_impl((void *)&_mh_execute_header, v26, v27, "FaceTimeVoicemailManager received the incorrect type %{public}@ when it expected a uuid", v30, 0xCu);
      v32 = sub_100031408(&qword_100091F90);
      swift_arrayDestroy(v46, 1, v32);
      swift_slowDealloc(v46, -1, -1);
      swift_slowDealloc(v30, -1, -1);
    }
    else
    {

      v26 = v29;
    }

  }
  v33 = *(_QWORD *)(v0 + 200);
  v34 = *(_QWORD *)(v0 + 176);
  v35 = *(_QWORD *)(v0 + 160);
  v36 = *(_QWORD *)(v0 + 136);
  v37 = *(_QWORD *)(v0 + 112);
  v38 = *(_QWORD *)(v0 + 88);
  v39 = *(_QWORD *)(v0 + 64);
  swift_task_dealloc(*(_QWORD *)(v0 + 208));
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_100041210(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v3 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 280);
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 288);
  v3[37] = a1;
  v3[38] = v1;
  swift_task_dealloc(v4);
  swift_release(v5);
  if (v1)
    v6 = sub_1000415EC;
  else
    v6 = sub_100041288;
  return swift_task_switch(v6, v3[32], v3[33]);
}

uint64_t sub_100041288()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t result;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t inited;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v1 = *(_QWORD *)(v0 + 296);
  result = (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 144));
  if (v1 >> 62)
    goto LABEL_17;
  if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
      {
        v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, *(_QWORD *)(v0 + 296));
        v3 = *(_QWORD *)(v0 + 296);
      }
      else
      {
        if (!*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return result;
        }
        v3 = *(_QWORD *)(v0 + 296);
        v4 = *(id *)(v3 + 32);
      }
      v5 = *(_QWORD *)(v0 + 56);
      swift_bridgeObjectRelease(v3);
      v6 = type metadata accessor for FTMessage(0);
      swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
      v7 = sub_10004C8F4((uint64_t)v4);
      v8 = *(_QWORD *)(v5 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageTypes);
      v1 = (unint64_t)v4;
      v9 = swift_bridgeObjectRetain(v8);
      v10 = dispatch thunk of Message.messageType.getter(v9);
      v11 = *(_QWORD *)(v8 + 16);
      if (!v11)
        goto LABEL_15;
      v12 = v10;
      v13 = *(unsigned __int16 *)(v8 + 32);
      swift_bridgeObjectRetain(v8);
      LODWORD(v13) = (unsigned __int16)MessageType.rawValue.getter(v13);
      if ((_DWORD)v13 == (unsigned __int16)MessageType.rawValue.getter(v12))
      {
LABEL_8:
        v14 = *(_QWORD *)(v0 + 248);
        v15 = *(_QWORD *)(v0 + 216);
        v16 = *(_QWORD *)(v0 + 192);
        v44 = *(_QWORD *)(v0 + 184);
        v45 = *(_QWORD *)(v0 + 208);
        v18 = *(_QWORD *)(v0 + 56);
        v17 = *(_QWORD *)(v0 + 64);
        swift_bridgeObjectRelease_n(v8, 2);
        v19 = sub_100031408((uint64_t *)&unk_100091FC0);
        v20 = swift_allocObject(v19, 40, 7);
        *(_OWORD *)(v20 + 16) = xmmword_100075AB0;
        *(_QWORD *)(v20 + 32) = v7;
        v46 = v20;
        specialized Array._endMutation()(v20);
        swift_retain(v7);
        sub_100034764(v46);
        swift_bridgeObjectRelease(v46);
        v21 = type metadata accessor for TaskPriority(0);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v17, 1, 1, v21);
        inited = swift_initStaticObject(v15, &unk_100091088);
        v23 = (_QWORD *)swift_allocObject(&unk_10007EBA0, 40, 7);
        v23[2] = inited;
        v23[3] = v14;
        v23[4] = v18;
        swift_retain(v18);
        v24 = sub_100051774(v17, (uint64_t)&unk_100091C58, (uint64_t)v23);

        swift_release(v24);
        (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v45, v44);
        goto LABEL_22;
      }
      if (v11 == 1)
      {
LABEL_14:
        swift_bridgeObjectRelease(v8);
LABEL_15:
        v28 = *(_QWORD *)(v0 + 208);
        v29 = *(_QWORD *)(v0 + 184);
        v30 = *(_QWORD *)(v0 + 192);
        swift_bridgeObjectRelease(v8);
        (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v28, v29);

        goto LABEL_22;
      }
      v25 = 17;
      while (1)
      {
        v26 = v25 - 15;
        if (__OFADD__(v25 - 16, 1))
          break;
        v27 = (unsigned __int16)MessageType.rawValue.getter(*(unsigned __int16 *)(v8 + 2 * v25));
        if (v27 == (unsigned __int16)MessageType.rawValue.getter(v12))
          goto LABEL_8;
        ++v25;
        if (v26 == v11)
          goto LABEL_14;
      }
      __break(1u);
LABEL_17:
      v31 = *(_QWORD *)(v0 + 296);
      if (v31 < 0)
        v32 = *(_QWORD *)(v0 + 296);
      else
        v32 = v1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(*(_QWORD *)(v0 + 296));
      v33 = _CocoaArrayWrapper.endIndex.getter(v32);
      result = swift_bridgeObjectRelease(v31);
    }
    while (v33);
  }
  v34 = *(_QWORD *)(v0 + 208);
  v35 = *(_QWORD *)(v0 + 184);
  v36 = *(_QWORD *)(v0 + 192);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 296));
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v34, v35);
  v7 = 0;
LABEL_22:
  v37 = *(_QWORD *)(v0 + 200);
  v38 = *(_QWORD *)(v0 + 176);
  v39 = *(_QWORD *)(v0 + 160);
  v40 = *(_QWORD *)(v0 + 136);
  v41 = *(_QWORD *)(v0 + 112);
  v42 = *(_QWORD *)(v0 + 88);
  v43 = *(_QWORD *)(v0 + 64);
  swift_task_dealloc(*(_QWORD *)(v0 + 208));
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  swift_task_dealloc(v41);
  swift_task_dealloc(v42);
  swift_task_dealloc(v43);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
}

uint64_t sub_1000415EC()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v1 = *(_QWORD *)(v0 + 304);
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 272);
  v4 = *(_QWORD *)(v0 + 200);
  v3 = *(_QWORD *)(v0 + 208);
  v5 = *(_QWORD *)(v0 + 184);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 144));
  v2(v4, v3, v5);
  swift_errorRetain(v1);
  v6 = swift_errorRetain(v1);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = *(_QWORD *)(v0 + 304);
    v10 = *(_QWORD *)(v0 + 200);
    v39 = *(_QWORD *)(v0 + 208);
    v11 = *(_QWORD *)(v0 + 184);
    v35 = *(_QWORD *)(v0 + 192);
    v12 = swift_slowAlloc(22, -1);
    v36 = (uint64_t *)swift_slowAlloc(8, -1);
    v38 = swift_slowAlloc(32, -1);
    v40 = v38;
    *(_DWORD *)v12 = 136446466;
    v13 = sub_1000316E0(&qword_100091C48, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    v37 = v11;
    v14 = dispatch thunk of CustomStringConvertible.description.getter(v11, v13);
    v16 = v15;
    *(_QWORD *)(v0 + 32) = sub_10004DF18(v14, v15, &v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40, v12 + 4, v12 + 12);
    swift_bridgeObjectRelease(v16);
    v17 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
    v17(v10, v11);
    v18 = v17;
    *(_WORD *)(v12 + 12) = 2112;
    swift_errorRetain(v9);
    v19 = _swift_stdlib_bridgeErrorToNSError(v9);
    *(_QWORD *)(v0 + 40) = v19;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48, v12 + 14, v12 + 22);
    *v36 = v19;
    swift_errorRelease(v9);
    swift_errorRelease(v9);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "FaceTimeVoiceMailManager failed to retrieve message for uuid %{public}s because the message store threw an error %@", (uint8_t *)v12, 0x16u);
    v20 = sub_100031408(&qword_100091F90);
    swift_arrayDestroy(v36, 1, v20);
    swift_slowDealloc(v36, -1, -1);
    swift_arrayDestroy(v38, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v38, -1, -1);
    swift_slowDealloc(v12, -1, -1);

    swift_errorRelease(v9);
    v18(v39, v37);
  }
  else
  {
    v21 = *(_QWORD *)(v0 + 304);
    v23 = *(_QWORD *)(v0 + 200);
    v22 = *(_QWORD *)(v0 + 208);
    v24 = *(_QWORD *)(v0 + 184);
    v25 = *(_QWORD *)(v0 + 192);
    swift_errorRelease(v21);
    v26 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
    v26(v23, v24);
    swift_errorRelease(v21);
    swift_errorRelease(v21);

    v26(v22, v24);
  }
  v27 = *(_QWORD *)(v0 + 200);
  v28 = *(_QWORD *)(v0 + 176);
  v29 = *(_QWORD *)(v0 + 160);
  v30 = *(_QWORD *)(v0 + 136);
  v31 = *(_QWORD *)(v0 + 112);
  v32 = *(_QWORD *)(v0 + 88);
  v33 = *(_QWORD *)(v0 + 64);
  swift_task_dealloc(*(_QWORD *)(v0 + 208));
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_100041908(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v4 + 16) = a4;
  v5 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v5, &unk_100091088);
  v6 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v5, v6);
  return swift_task_switch(sub_10004199C, v7, v8);
}

uint64_t sub_10004199C()
{
  uint64_t v0;

  (*(void (**)(void))(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_onVoicemailsChanged))();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100041B10(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v4;
  _QWORD v5[5];

  result = type metadata accessor for Logger(319, a2);
  if (v4 <= 0x3F)
  {
    v5[0] = *(_QWORD *)(result - 8) + 64;
    v5[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v5[2] = (char *)&value witness table for () + 64;
    v5[3] = (char *)&value witness table for Builtin.NativeObject + 64;
    v5[4] = (char *)&value witness table for Builtin.BridgeObject + 64;
    result = swift_updateClassMetadata2(a1, 256, 5, v5, a1 + 208);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_100041BB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v4 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v4, &unk_100091088);
  v5 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, v5);
  return swift_task_switch(sub_100041C4C, v6, v7);
}

uint64_t sub_100041C4C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(void **)(v0 + 16);
  *(_QWORD *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  v3 = dword_100091964;
  v4 = v2;
  swift_retain(v1);
  v5 = (_QWORD *)swift_task_alloc(v3);
  *(_QWORD *)(v0 + 48) = v5;
  *v5 = v0;
  v5[1] = sub_1000346DC;
  return sub_100040BA4(*(_QWORD *)(v0 + 16));
}

uint64_t sub_100041CC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6[26] = a5;
  v6[27] = a6;
  v6[25] = a4;
  v7 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v7, &unk_100091088);
  v8 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v9 = dispatch thunk of Actor.unownedExecutor.getter(v7, v8);
  return swift_task_switch(sub_100041D5C, v9, v10);
}

uint64_t sub_100041D5C()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t Strong;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  os_log_type_t v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t inited;
  uint64_t v43;
  uint64_t v44;
  int v45;
  Swift::Bool v46;
  NSNumber v47;
  uint64_t v48;
  int v49;
  Swift::Bool v50;
  NSNumber v51;
  unint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  _QWORD *v66;
  void (*v67)(uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82[2];

  v1 = v0 + 200;
  v2 = v0 + 176;
  v3 = *(_QWORD *)(v0 + 216);
  v4 = *(_QWORD *)(v0 + 200) + 16;
  swift_beginAccess(v4, v0 + 144, 0, 0);
  Strong = swift_weakLoadStrong(v4);
  v6 = swift_bridgeObjectRetain_n(v3, 2);
  v7 = Logger.logObject.getter(v6);
  v78 = Strong;
  if (Strong)
  {
    v8 = v0 + 192;
    v9 = static os_log_type_t.default.getter();
    v10 = v9;
    v11 = os_log_type_enabled((os_log_t)v7, v9);
    v12 = *(_QWORD *)(v0 + 216);
    v75 = v0 + 200;
    v76 = v0;
    v74 = v0 + 192;
    if (v11)
    {
      v13 = (uint8_t *)swift_slowAlloc(12, -1);
      v14 = (uint64_t *)(v0 + 192);
      v8 = swift_slowAlloc(32, -1);
      *(_DWORD *)v13 = 136315138;
      v82[0] = v8;
      v15 = type metadata accessor for Message(0);
      v16 = swift_bridgeObjectRetain(v12);
      v17 = Array.description.getter(v16, v15);
      v19 = v18;
      swift_bridgeObjectRelease(v12);
      *v14 = sub_10004DF18(v17, v19, v82);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v14, v1, v13 + 4, v13 + 12);
      v0 = v76;
      swift_bridgeObjectRelease(v19);
      swift_bridgeObjectRelease_n(v12, 2);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, (os_log_type_t)v10, "messageStoreDidAddMessages: %s", v13, 0xCu);
      swift_arrayDestroy(v8, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v8, -1, -1);
      swift_slowDealloc(v13, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v12, 2);
    }
    v7 = *(_QWORD *)(v0 + 216);
    v25 = *(_QWORD *)(v78 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageTypes);
    v82[0] = (uint64_t)_swiftEmptyArrayStorage;
    if ((unint64_t)v7 >> 62)
      goto LABEL_35;
    v26 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v25);
    v22 = v7;
    while (v26)
    {
      v10 = 0;
      v79 = v7 & 0xFFFFFFFFFFFFFF8;
      v80 = v7 & 0xC000000000000001;
      v27 = v22 + 32;
      while (1)
      {
        while (1)
        {
          if (v80)
          {
            v28 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v10, *(_QWORD *)(v76 + 216));
          }
          else
          {
            if (v10 >= *(_QWORD *)(v79 + 16))
              goto LABEL_33;
            v28 = *(id *)(v27 + 8 * v10);
          }
          v29 = v28;
          if (__OFADD__(v10++, 1))
            goto LABEL_34;
          v7 = (uint64_t)v28;
          v31 = dispatch thunk of Message.messageType.getter(v28);
          v32 = *(_QWORD *)(v25 + 16);
          if (v32)
            break;
LABEL_13:

          if (v10 == v26)
            goto LABEL_29;
        }
        v7 = v31;
        v8 = *(unsigned __int16 *)(v25 + 32);
        swift_bridgeObjectRetain(v25);
        v0 = (unsigned __int16)MessageType.rawValue.getter(v8);
        if ((_DWORD)v0 != (unsigned __int16)MessageType.rawValue.getter(v7))
          break;
LABEL_20:
        v33 = swift_bridgeObjectRelease(v25);
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v33);
        v8 = *(_QWORD *)(v82[0] + 16);
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v8);
        v34 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v8, v29);
        v7 = (uint64_t)v82;
        specialized ContiguousArray._endMutation()(v34);
        if (v10 == v26)
        {
LABEL_29:
          v20 = v82[0];
          v22 = *(_QWORD *)(v76 + 216);
          goto LABEL_40;
        }
      }
      if (v32 == 1)
      {
LABEL_12:
        swift_bridgeObjectRelease(v25);
        goto LABEL_13;
      }
      v8 = 17;
      while (1)
      {
        v0 = v8 - 15;
        if (__OFADD__(v8 - 16, 1))
          break;
        v35 = (unsigned __int16)MessageType.rawValue.getter(*(unsigned __int16 *)(v25 + 2 * v8));
        if (v35 == (unsigned __int16)MessageType.rawValue.getter(v7))
          goto LABEL_20;
        ++v8;
        if (v0 == v32)
          goto LABEL_12;
      }
      __break(1u);
LABEL_33:
      __break(1u);
LABEL_34:
      __break(1u);
LABEL_35:
      if (v7 < 0)
        v10 = v7;
      else
        v10 = v7 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v7);
      swift_bridgeObjectRetain(v25);
      v26 = _CocoaArrayWrapper.endIndex.getter(v10);
      v22 = *(_QWORD *)(v0 + 216);
    }
    v20 = (unint64_t)_swiftEmptyArrayStorage;
LABEL_40:
    swift_bridgeObjectRelease(v25);
    swift_bridgeObjectRelease(v22);
    if ((v20 & 0x8000000000000000) != 0 || (v20 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain_n(v20, 2);
      v2 = _CocoaArrayWrapper.endIndex.getter(v20);
      swift_release(v20);
      if (!v2)
        goto LABEL_52;
    }
    else
    {
      v2 = *(_QWORD *)(v20 + 16);
      swift_bridgeObjectRetain(v20);
      if (!v2)
        goto LABEL_52;
    }
    if (v2 >= 1)
    {
      v36 = 0;
      v77 = OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_analyticsReporter;
      do
      {
        if ((v20 & 0xC000000000000001) != 0)
          v37 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v36, v20);
        else
          v37 = *(id *)(v20 + 8 * v36 + 32);
        v38 = v37;
        v39 = dispatch thunk of Message.fileSize.getter(v37);
        if ((v40 & 1) == 0)
        {
          v81 = v39;
          v41 = sub_100031408(&qword_100091C08);
          inited = swift_initStackObject(v41, v75 - 184);
          *(_OWORD *)(inited + 16) = xmmword_100075BD0;
          *(_QWORD *)(inited + 32) = 0x6D766C5F7369;
          *(_QWORD *)(inited + 40) = 0xE600000000000000;
          v43 = sub_100049D50(0, &qword_100091C10, NSNumber_ptr);
          v44 = dispatch thunk of Message.messageType.getter(v43);
          v45 = (unsigned __int16)MessageType.rawValue.getter(v44);
          v46 = v45 == (unsigned __int16)MessageType.rawValue.getter(0);
          v47.super.super.isa = NSNumber.init(BOOLeanLiteral:)(v46).super.super.isa;
          *(NSNumber *)(inited + 48) = v47;
          *(_QWORD *)(inited + 56) = 0x6D76765F7369;
          *(_QWORD *)(inited + 64) = 0xE600000000000000;
          v48 = dispatch thunk of Message.messageType.getter(v47.super.super.isa);
          v49 = (unsigned __int16)MessageType.rawValue.getter(v48);
          v50 = v49 == (unsigned __int16)MessageType.rawValue.getter(1);
          v51.super.super.isa = NSNumber.init(BOOLeanLiteral:)(v50).super.super.isa;
          *(NSNumber *)(inited + 72) = v51;
          *(_QWORD *)(inited + 80) = 0x6E6F697461727564;
          *(_QWORD *)(inited + 88) = 0xE800000000000000;
          *(_QWORD *)(inited + 96) = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithDouble:", round(dispatch thunk of Message.duration.getter(v51.super.super.isa)), v74);
          *(_QWORD *)(inited + 104) = 0xD000000000000011;
          *(_QWORD *)(inited + 112) = 0x8000000100061CD0;
          *(_QWORD *)(inited + 120) = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithUnsignedLongLong:", v81);
          v52 = sub_10003F018(inited);
          v53 = *(id *)(v78 + v77);
          sub_100042810(v52);
          v55 = v54;
          swift_bridgeObjectRelease(v52);
          sub_10003F510(0xD00000000000002DLL, 0x8000000100061CF0, v55);
          swift_bridgeObjectRelease(v55);

        }
        ++v36;

      }
      while (v2 != v36);
LABEL_52:
      v0 = v76;
      swift_release(v20);
      v56 = swift_bridgeObjectRetain_n(v20, 2);
      v57 = Logger.logObject.getter(v56);
      v58 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v57, v58))
      {
        v59 = (uint8_t *)swift_slowAlloc(12, -1);
        v60 = swift_slowAlloc(32, -1);
        *(_DWORD *)v59 = 136315138;
        v82[0] = v60;
        v61 = type metadata accessor for Message(0);
        v62 = swift_bridgeObjectRetain(v20);
        v63 = Array.description.getter(v62, v61);
        v65 = v64;
        swift_release(v20);
        *(_QWORD *)(v75 - 16) = sub_10004DF18(v63, v65, v82);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v75 - 16, v74, v59 + 4, v59 + 12);
        v0 = v76;
        swift_bridgeObjectRelease(v65);
        swift_release_n(v20, 2);
        _os_log_impl((void *)&_mh_execute_header, v57, v58, "messageStoreDidAddMessages(filtered): %s", v59, 0xCu);
        swift_arrayDestroy(v60, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v60, -1, -1);
        swift_slowDealloc(v59, -1, -1);

        if (v2)
        {
LABEL_54:
          v66 = sub_10003EAE8(v20);
          swift_release(v20);
          sub_100034764((uint64_t)v66);
          swift_bridgeObjectRelease(v66);
          v67 = *(void (**)(uint64_t))(v78
                                               + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_onVoicemailsChanged);
          v68 = *(_QWORD *)(v78 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_onVoicemailsChanged + 8);
          v69 = swift_retain(v68);
          v67(v69);
          swift_release(v68);
          v70 = v78;
LABEL_57:
          swift_release(v70);
          return (*(uint64_t (**)(void))(v0 + 8))();
        }
      }
      else
      {

        swift_release_n(v20, 2);
        if (v2)
          goto LABEL_54;
      }
      swift_release(v20);
      v70 = v78;
      goto LABEL_57;
    }
    __break(1u);
LABEL_60:
    v72 = *(_QWORD *)(v0 + 216);
    if (v72 < 0)
      v73 = *(_QWORD *)(v0 + 216);
    else
      v73 = v8 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*(_QWORD *)(v0 + 216));
    v23 = _CocoaArrayWrapper.endIndex.getter(v73);
    swift_bridgeObjectRelease(v72);
    goto LABEL_7;
  }
  LOBYTE(v20) = static os_log_type_t.error.getter();
  v21 = os_log_type_enabled((os_log_t)v7, (os_log_type_t)v20);
  v8 = *(_QWORD *)(v0 + 216);
  if (!v21)
  {
    swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 216), 2);
    goto LABEL_31;
  }
  v22 = v0 + 168;
  v10 = swift_slowAlloc(12, -1);
  *(_DWORD *)v10 = 134217984;
  if (v8 >> 62)
    goto LABEL_60;
  v23 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_7:
  v24 = *(_QWORD *)(v0 + 216);
  swift_bridgeObjectRelease(v24);
  *(_QWORD *)(v0 + 168) = v23;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(v22, v2, v10 + 4, v10 + 12);
  swift_bridgeObjectRelease(v24);
  _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, (os_log_type_t)v20, "ignoring %ld added messages, no more self", (uint8_t *)v10, 0xCu);
  swift_slowDealloc(v10, -1, -1);
LABEL_31:

  return (*(uint64_t (**)(void))(v0 + 8))();
}

_QWORD *sub_10004264C(uint64_t a1, uint64_t (**a2)(_QWORD, _QWORD))
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t (**v14)(_QWORD, _QWORD);

  v4 = swift_allocObject(&unk_10007E880, 24, 7);
  *(_QWORD *)(v4 + 16) = a2;
  if ((unint64_t)a1 >> 62)
    goto LABEL_16;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  _Block_copy(a2);
  if (v5)
  {
    while (1)
    {
      v13 = v4;
      v6 = 0;
      v14 = a2;
      while ((a1 & 0xC000000000000001) != 0)
      {
        v7 = specialized _ArrayBuffer._getElementSlowPath(_:)(v6, a1);
        v4 = v6 + 1;
        if (__OFADD__(v6, 1))
        {
LABEL_13:
          __break(1u);
LABEL_14:
          v4 = v13;
          goto LABEL_20;
        }
LABEL_9:
        v8 = a2[2](a2, v7);
        if ((_DWORD)v8)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v8);
          v9 = _swiftEmptyArrayStorage[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v9);
          v10 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v9, v7);
          specialized ContiguousArray._endMutation()(v10);
          a2 = v14;
        }
        else
        {
          swift_unknownObjectRelease(v7);
        }
        ++v6;
        if (v4 == v5)
          goto LABEL_14;
      }
      if (v6 < *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        break;
      __break(1u);
LABEL_16:
      if (a1 < 0)
        v11 = a1;
      else
        v11 = a1 & 0xFFFFFFFFFFFFFF8;
      _Block_copy(a2);
      v5 = _CocoaArrayWrapper.endIndex.getter(v11);
      if (!v5)
        goto LABEL_20;
    }
    v7 = *(_QWORD *)(a1 + 8 * v6 + 32);
    swift_unknownObjectRetain(v7);
    v4 = v6 + 1;
    if (__OFADD__(v6, 1))
      goto LABEL_13;
    goto LABEL_9;
  }
LABEL_20:
  swift_release(v4);
  swift_bridgeObjectRelease(a1);
  _Block_release(a2);
  return _swiftEmptyArrayStorage;
}

void sub_100042810(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t i;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_100031408(&qword_100091C18);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }
  v29 = a1 + 64;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v28 = (unint64_t)(63 - v4) >> 6;
  swift_bridgeObjectRetain(a1);
  i = 0;
  if (v6)
    goto LABEL_10;
LABEL_11:
  v12 = i + 1;
  if (__OFADD__(i, 1))
    goto LABEL_35;
  if (v12 >= v28)
    goto LABEL_32;
  v13 = *(_QWORD *)(v29 + 8 * v12);
  v14 = i + 1;
  if (!v13)
  {
    v14 = i + 2;
    if (i + 2 >= v28)
      goto LABEL_32;
    v13 = *(_QWORD *)(v29 + 8 * v14);
    if (!v13)
    {
      v14 = i + 3;
      if (i + 3 >= v28)
        goto LABEL_32;
      v13 = *(_QWORD *)(v29 + 8 * v14);
      if (!v13)
      {
        v14 = i + 4;
        if (i + 4 >= v28)
          goto LABEL_32;
        v13 = *(_QWORD *)(v29 + 8 * v14);
        if (!v13)
        {
          v15 = i + 5;
          if (i + 5 < v28)
          {
            v13 = *(_QWORD *)(v29 + 8 * v15);
            if (v13)
            {
              v14 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              v14 = v15 + 1;
              if (__OFADD__(v15, 1))
                goto LABEL_36;
              if (v14 >= v28)
                break;
              v13 = *(_QWORD *)(v29 + 8 * v14);
              ++v15;
              if (v13)
                goto LABEL_26;
            }
          }
LABEL_32:
          sub_100049AAC(a1);
          return;
        }
      }
    }
  }
LABEL_26:
  v6 = (v13 - 1) & v13;
  v11 = __clz(__rbit64(v13)) + (v14 << 6);
  for (i = v14; ; v11 = v10 | (i << 6))
  {
    v16 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v11);
    v18 = *v16;
    v17 = v16[1];
    v19 = *(void **)(*(_QWORD *)(a1 + 56) + 8 * v11);
    swift_bridgeObjectRetain(v17);
    v20 = v19;
    v21 = sub_1000485DC(v18, v17);
    v22 = v21;
    if ((v23 & 1) != 0)
    {
      v8 = (uint64_t *)(v3[6] + 16 * v21);
      swift_bridgeObjectRelease(v8[1]);
      *v8 = v18;
      v8[1] = v17;
      v9 = v3[7];

      *(_QWORD *)(v9 + 8 * v22) = v20;
      if (!v6)
        goto LABEL_11;
      goto LABEL_10;
    }
    if (v3[2] >= v3[3])
      break;
    *(_QWORD *)((char *)v3 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v21;
    v24 = (uint64_t *)(v3[6] + 16 * v21);
    *v24 = v18;
    v24[1] = v17;
    *(_QWORD *)(v3[7] + 8 * v21) = v20;
    v25 = v3[2];
    v26 = __OFADD__(v25, 1);
    v27 = v25 + 1;
    if (v26)
      goto LABEL_34;
    v3[2] = v27;
    if (!v6)
      goto LABEL_11;
LABEL_10:
    v10 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

uint64_t sub_100042ACC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t inited;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;

  v28 = a3;
  v5 = v3;
  v7 = type metadata accessor for Logger(0, a2);
  v8 = *(_QWORD *)(v7 - 8);
  v27 = v7;
  v9 = *(_QWORD *)(v8 + 64);
  __chkstk_darwin(v7);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100031408(&qword_100091120);
  __chkstk_darwin(v11);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  v15 = v5 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_logger;
  v16 = swift_allocObject(&unk_10007EA88, 24, 7);
  swift_weakInit(v16 + 16, v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v15, v7);
  v17 = type metadata accessor for VoicemailActor();
  swift_retain(v16);
  v18 = a1;
  swift_bridgeObjectRetain(a1);
  inited = swift_initStaticObject(v17, &unk_100091088);
  v20 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v21 = *(unsigned __int8 *)(v8 + 80);
  v22 = (v21 + 40) & ~v21;
  v23 = (v9 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  v24 = (char *)swift_allocObject(a2, v23 + 8, v21 | 7);
  *((_QWORD *)v24 + 2) = inited;
  *((_QWORD *)v24 + 3) = v20;
  *((_QWORD *)v24 + 4) = v16;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v24[v22], v10, v27);
  *(_QWORD *)&v24[v23] = v18;
  swift_release(v16);
  v25 = sub_100051774((uint64_t)v13, v28, (uint64_t)v24);
  return swift_release(v25);
}

uint64_t sub_100042CB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6[8] = a5;
  v6[9] = a6;
  v6[7] = a4;
  v7 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v7, &unk_100091088);
  v8 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v9 = dispatch thunk of Actor.unownedExecutor.getter(v7, v8);
  return swift_task_switch(sub_100042D50, v9, v10);
}

uint64_t sub_100042D50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t Strong;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  uint64_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  os_log_type_t v16;
  BOOL v17;
  unint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  _QWORD *v51;
  void (*v52)(uint64_t);
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67[2];

  v64 = v0 + 48;
  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 56) + 16;
  swift_beginAccess(v2, v0 + 16, 0, 0);
  Strong = swift_weakLoadStrong(v2);
  v4 = swift_bridgeObjectRetain_n(v1, 2);
  v5 = Logger.logObject.getter(v4);
  if (Strong)
  {
    v61 = (uint64_t *)(v0 + 40);
    v6 = static os_log_type_t.default.getter();
    v7 = os_log_type_enabled(v5, v6);
    v8 = *(_QWORD *)(v0 + 72);
    v62 = Strong;
    v63 = v0;
    if (v7)
    {
      v9 = (uint8_t *)swift_slowAlloc(12, -1);
      v10 = swift_slowAlloc(32, -1);
      v67[0] = v10;
      *(_DWORD *)v9 = 136315138;
      v11 = type metadata accessor for Message(0);
      v12 = swift_bridgeObjectRetain(v8);
      v13 = Array.description.getter(v12, v11);
      v15 = v14;
      swift_bridgeObjectRelease(v8);
      *v61 = sub_10004DF18(v13, v15, v67);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v61, v64, v9 + 4, v9 + 12);
      swift_bridgeObjectRelease(v15);
      swift_bridgeObjectRelease_n(v8, 2);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "messageStoreDidUpdateMessages: %s", v9, 0xCu);
      swift_arrayDestroy(v10, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v10, -1, -1);
      swift_slowDealloc(v9, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v8, 2);
    }
    v22 = *(_QWORD *)(v0 + 72);
    v23 = *(_QWORD *)(Strong + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageTypes);
    v67[0] = (uint64_t)_swiftEmptyArrayStorage;
    if ((unint64_t)v22 >> 62)
      goto LABEL_35;
    v24 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v22);
    swift_bridgeObjectRetain(v23);
    v25 = v22;
    while (v24)
    {
      v26 = 0;
      v65 = v22 & 0xFFFFFFFFFFFFFF8;
      v66 = v22 & 0xC000000000000001;
      v27 = v25 + 32;
      while (1)
      {
        if (v66)
        {
          v28 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v26, *(_QWORD *)(v63 + 72));
        }
        else
        {
          if (v26 >= *(_QWORD *)(v65 + 16))
            goto LABEL_33;
          v28 = *(id *)(v27 + 8 * v26);
        }
        v29 = v28;
        if (__OFADD__(v26++, 1))
          goto LABEL_34;
        v22 = (uint64_t)v28;
        v31 = dispatch thunk of Message.messageType.getter(v28);
        v32 = *(_QWORD *)(v23 + 16);
        if (!v32)
          goto LABEL_13;
        v22 = v31;
        v33 = *(unsigned __int16 *)(v23 + 32);
        swift_bridgeObjectRetain(v23);
        v0 = (unsigned __int16)MessageType.rawValue.getter(v33);
        if ((_DWORD)v0 == (unsigned __int16)MessageType.rawValue.getter(v22))
        {
LABEL_21:
          v34 = swift_bridgeObjectRelease(v23);
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v34);
          v35 = *(_QWORD *)(v67[0] + 16);
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v35);
          v36 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v35, v29);
          v22 = (uint64_t)v67;
          specialized ContiguousArray._endMutation()(v36);
          goto LABEL_14;
        }
        if (v32 != 1)
          break;
LABEL_12:
        swift_bridgeObjectRelease(v23);
LABEL_13:

LABEL_14:
        if (v26 == v24)
        {
          v39 = v67[0];
          v0 = v63;
          v25 = *(_QWORD *)(v63 + 72);
          goto LABEL_40;
        }
      }
      v37 = 17;
      while (1)
      {
        v0 = v37 - 15;
        if (__OFADD__(v37 - 16, 1))
          break;
        v38 = (unsigned __int16)MessageType.rawValue.getter(*(unsigned __int16 *)(v23 + 2 * v37));
        if (v38 == (unsigned __int16)MessageType.rawValue.getter(v22))
          goto LABEL_21;
        ++v37;
        if (v0 == v32)
          goto LABEL_12;
      }
      __break(1u);
LABEL_33:
      __break(1u);
LABEL_34:
      __break(1u);
LABEL_35:
      if (v22 < 0)
        v40 = v22;
      else
        v40 = v22 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v22);
      swift_bridgeObjectRetain(v23);
      v24 = _CocoaArrayWrapper.endIndex.getter(v40);
      v25 = *(_QWORD *)(v0 + 72);
    }
    v39 = (unint64_t)_swiftEmptyArrayStorage;
LABEL_40:
    swift_bridgeObjectRelease(v23);
    swift_bridgeObjectRelease(v25);
    v41 = swift_bridgeObjectRetain_n(v39, 2);
    v42 = Logger.logObject.getter(v41);
    v43 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc(12, -1);
      v45 = swift_slowAlloc(32, -1);
      v67[0] = v45;
      *(_DWORD *)v44 = 136315138;
      v46 = type metadata accessor for Message(0);
      v47 = swift_bridgeObjectRetain(v39);
      v48 = Array.description.getter(v47, v46);
      v50 = v49;
      swift_release(v39);
      *v61 = sub_10004DF18(v48, v50, v67);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v61, v64, v44 + 4, v44 + 12);
      v0 = v63;
      swift_bridgeObjectRelease(v50);
      swift_release_n(v39, 2);
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "messageStoreDidUpdateMessages(filtered): %s", v44, 0xCu);
      swift_arrayDestroy(v45, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v45, -1, -1);
      swift_slowDealloc(v44, -1, -1);

    }
    else
    {

      swift_release_n(v39, 2);
    }
    if ((v39 & 0x8000000000000000) != 0 || (v39 & 0x4000000000000000) != 0)
    {
      v56 = swift_bridgeObjectRetain(v39);
      v57 = _CocoaArrayWrapper.endIndex.getter(v56);
      swift_release(v39);
      if (v57)
        goto LABEL_46;
    }
    else if (*(_QWORD *)(v39 + 16))
    {
LABEL_46:
      v51 = sub_10003EAE8(v39);
      swift_release(v39);
      sub_1000349E4((uint64_t)v51);
      swift_bridgeObjectRelease(v51);
      v52 = *(void (**)(uint64_t))(v62
                                           + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_onVoicemailsChanged);
      v53 = *(_QWORD *)(v62 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_onVoicemailsChanged + 8);
      v54 = swift_retain(v53);
      v52(v54);
      v55 = v53;
LABEL_49:
      swift_release(v55);
      swift_release(v62);
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    v55 = v39;
    goto LABEL_49;
  }
  v16 = static os_log_type_t.error.getter();
  v17 = os_log_type_enabled(v5, v16);
  v18 = *(_QWORD *)(v0 + 72);
  if (v17)
  {
    v19 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v19 = 134217984;
    if (v18 >> 62)
    {
      v59 = *(_QWORD *)(v0 + 72);
      if (v59 < 0)
        v60 = *(_QWORD *)(v0 + 72);
      else
        v60 = v18 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(*(_QWORD *)(v0 + 72));
      v20 = _CocoaArrayWrapper.endIndex.getter(v60);
      swift_bridgeObjectRelease(v59);
    }
    else
    {
      v20 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v21 = *(_QWORD *)(v0 + 72);
    swift_bridgeObjectRelease(v21);
    *(_QWORD *)(v0 + 40) = v20;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v64, v19 + 4, v19 + 12);
    swift_bridgeObjectRelease(v21);
    _os_log_impl((void *)&_mh_execute_header, v5, v16, "ignoring %ld updated messages, no more self", v19, 0xCu);
    swift_slowDealloc(v19, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 72), 2);
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000433F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6[8] = a5;
  v6[9] = a6;
  v6[7] = a4;
  v7 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v7, &unk_100091088);
  v8 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v9 = dispatch thunk of Actor.unownedExecutor.getter(v7, v8);
  return swift_task_switch(sub_100043488, v9, v10);
}

uint64_t sub_100043488()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t Strong;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  uint64_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  os_log_type_t v16;
  BOOL v17;
  unint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  _QWORD *v51;
  void (*v52)(uint64_t);
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67[2];

  v64 = v0 + 48;
  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 56) + 16;
  swift_beginAccess(v2, v0 + 16, 0, 0);
  Strong = swift_weakLoadStrong(v2);
  v4 = swift_bridgeObjectRetain_n(v1, 2);
  v5 = Logger.logObject.getter(v4);
  if (Strong)
  {
    v61 = (uint64_t *)(v0 + 40);
    v6 = static os_log_type_t.default.getter();
    v7 = os_log_type_enabled(v5, v6);
    v8 = *(_QWORD *)(v0 + 72);
    v62 = Strong;
    v63 = v0;
    if (v7)
    {
      v9 = (uint8_t *)swift_slowAlloc(12, -1);
      v10 = swift_slowAlloc(32, -1);
      v67[0] = v10;
      *(_DWORD *)v9 = 136315138;
      v11 = type metadata accessor for Message(0);
      v12 = swift_bridgeObjectRetain(v8);
      v13 = Array.description.getter(v12, v11);
      v15 = v14;
      swift_bridgeObjectRelease(v8);
      *v61 = sub_10004DF18(v13, v15, v67);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v61, v64, v9 + 4, v9 + 12);
      swift_bridgeObjectRelease(v15);
      swift_bridgeObjectRelease_n(v8, 2);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "messageStoreDidMoveToTrashMessages: %s", v9, 0xCu);
      swift_arrayDestroy(v10, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v10, -1, -1);
      swift_slowDealloc(v9, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v8, 2);
    }
    v22 = *(_QWORD *)(v0 + 72);
    v23 = *(_QWORD *)(Strong + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageTypes);
    v67[0] = (uint64_t)_swiftEmptyArrayStorage;
    if ((unint64_t)v22 >> 62)
      goto LABEL_35;
    v24 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v22);
    swift_bridgeObjectRetain(v23);
    v25 = v22;
    while (v24)
    {
      v26 = 0;
      v65 = v22 & 0xFFFFFFFFFFFFFF8;
      v66 = v22 & 0xC000000000000001;
      v27 = v25 + 32;
      while (1)
      {
        if (v66)
        {
          v28 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v26, *(_QWORD *)(v63 + 72));
        }
        else
        {
          if (v26 >= *(_QWORD *)(v65 + 16))
            goto LABEL_33;
          v28 = *(id *)(v27 + 8 * v26);
        }
        v29 = v28;
        if (__OFADD__(v26++, 1))
          goto LABEL_34;
        v22 = (uint64_t)v28;
        v31 = dispatch thunk of Message.messageType.getter(v28);
        v32 = *(_QWORD *)(v23 + 16);
        if (!v32)
          goto LABEL_13;
        v22 = v31;
        v33 = *(unsigned __int16 *)(v23 + 32);
        swift_bridgeObjectRetain(v23);
        v0 = (unsigned __int16)MessageType.rawValue.getter(v33);
        if ((_DWORD)v0 == (unsigned __int16)MessageType.rawValue.getter(v22))
        {
LABEL_21:
          v34 = swift_bridgeObjectRelease(v23);
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v34);
          v35 = *(_QWORD *)(v67[0] + 16);
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v35);
          v36 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v35, v29);
          v22 = (uint64_t)v67;
          specialized ContiguousArray._endMutation()(v36);
          goto LABEL_14;
        }
        if (v32 != 1)
          break;
LABEL_12:
        swift_bridgeObjectRelease(v23);
LABEL_13:

LABEL_14:
        if (v26 == v24)
        {
          v39 = v67[0];
          v0 = v63;
          v25 = *(_QWORD *)(v63 + 72);
          goto LABEL_40;
        }
      }
      v37 = 17;
      while (1)
      {
        v0 = v37 - 15;
        if (__OFADD__(v37 - 16, 1))
          break;
        v38 = (unsigned __int16)MessageType.rawValue.getter(*(unsigned __int16 *)(v23 + 2 * v37));
        if (v38 == (unsigned __int16)MessageType.rawValue.getter(v22))
          goto LABEL_21;
        ++v37;
        if (v0 == v32)
          goto LABEL_12;
      }
      __break(1u);
LABEL_33:
      __break(1u);
LABEL_34:
      __break(1u);
LABEL_35:
      if (v22 < 0)
        v40 = v22;
      else
        v40 = v22 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v22);
      swift_bridgeObjectRetain(v23);
      v24 = _CocoaArrayWrapper.endIndex.getter(v40);
      v25 = *(_QWORD *)(v0 + 72);
    }
    v39 = (unint64_t)_swiftEmptyArrayStorage;
LABEL_40:
    swift_bridgeObjectRelease(v23);
    swift_bridgeObjectRelease(v25);
    v41 = swift_bridgeObjectRetain_n(v39, 2);
    v42 = Logger.logObject.getter(v41);
    v43 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc(12, -1);
      v45 = swift_slowAlloc(32, -1);
      v67[0] = v45;
      *(_DWORD *)v44 = 136315138;
      v46 = type metadata accessor for Message(0);
      v47 = swift_bridgeObjectRetain(v39);
      v48 = Array.description.getter(v47, v46);
      v50 = v49;
      swift_release(v39);
      *v61 = sub_10004DF18(v48, v50, v67);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v61, v64, v44 + 4, v44 + 12);
      v0 = v63;
      swift_bridgeObjectRelease(v50);
      swift_release_n(v39, 2);
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "messageStoreDidMoveToTrashMessages(filtered): %s", v44, 0xCu);
      swift_arrayDestroy(v45, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v45, -1, -1);
      swift_slowDealloc(v44, -1, -1);

    }
    else
    {

      swift_release_n(v39, 2);
    }
    if ((v39 & 0x8000000000000000) != 0 || (v39 & 0x4000000000000000) != 0)
    {
      v56 = swift_bridgeObjectRetain(v39);
      v57 = _CocoaArrayWrapper.endIndex.getter(v56);
      swift_release(v39);
      if (v57)
        goto LABEL_46;
    }
    else if (*(_QWORD *)(v39 + 16))
    {
LABEL_46:
      v51 = sub_10003EAE8(v39);
      swift_release(v39);
      sub_1000349E4((uint64_t)v51);
      swift_bridgeObjectRelease(v51);
      v52 = *(void (**)(uint64_t))(v62
                                           + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_onVoicemailsChanged);
      v53 = *(_QWORD *)(v62 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_onVoicemailsChanged + 8);
      v54 = swift_retain(v53);
      v52(v54);
      v55 = v53;
LABEL_49:
      swift_release(v55);
      swift_release(v62);
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    v55 = v39;
    goto LABEL_49;
  }
  v16 = static os_log_type_t.error.getter();
  v17 = os_log_type_enabled(v5, v16);
  v18 = *(_QWORD *)(v0 + 72);
  if (v17)
  {
    v19 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v19 = 134217984;
    if (v18 >> 62)
    {
      v59 = *(_QWORD *)(v0 + 72);
      if (v59 < 0)
        v60 = *(_QWORD *)(v0 + 72);
      else
        v60 = v18 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(*(_QWORD *)(v0 + 72));
      v20 = _CocoaArrayWrapper.endIndex.getter(v60);
      swift_bridgeObjectRelease(v59);
    }
    else
    {
      v20 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v21 = *(_QWORD *)(v0 + 72);
    swift_bridgeObjectRelease(v21);
    *(_QWORD *)(v0 + 40) = v20;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v64, v19 + 4, v19 + 12);
    swift_bridgeObjectRelease(v21);
    _os_log_impl((void *)&_mh_execute_header, v5, v16, "ignoring %ld deleted messages, no more self", v19, 0xCu);
    swift_slowDealloc(v19, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 72), 2);
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100043B28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6[11] = a5;
  v6[12] = a6;
  v6[10] = a4;
  v7 = type metadata accessor for UUID(0);
  v6[13] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v6[14] = v8;
  v9 = (*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v6[15] = swift_task_alloc(v9);
  v6[16] = swift_task_alloc(v9);
  v10 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v10, &unk_100091088);
  v11 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v12 = dispatch thunk of Actor.unownedExecutor.getter(v10, v11);
  return swift_task_switch(sub_100043BF8, v12, v13);
}

uint64_t sub_100043BF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t Strong;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  objc_super *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  objc_class *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  id v36;
  void (*v37)(uint64_t, uint64_t);
  uint64_t v38;
  id receiver;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  objc_super *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  objc_super *v64;
  objc_super *v65;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 80) + 16;
  swift_beginAccess(v2, v0 + 16, 0, 0);
  Strong = swift_weakLoadStrong(v2);
  v4 = swift_bridgeObjectRetain(v1);
  if (Strong)
  {
    v61 = Strong;
    v5 = swift_bridgeObjectRetain(*(_QWORD *)(v0 + 96));
    v6 = Logger.logObject.getter(v5);
    v7 = static os_log_type_t.default.getter();
    v8 = "FaceTimeVoicemailManager failed to set messages %s as undeleted with error: %@" + 32;
    v60 = (uint64_t *)(v0 + 64);
    if (os_log_type_enabled(v6, v7))
    {
      v10 = *(_QWORD *)(v0 + 96);
      v9 = *(_QWORD *)(v0 + 104);
      v11 = (uint8_t *)swift_slowAlloc(12, -1);
      v64 = (objc_super *)swift_slowAlloc(32, -1);
      v65 = v64;
      *(_DWORD *)v11 = 136315138;
      v12 = swift_bridgeObjectRetain(v10);
      v13 = Array.description.getter(v12, v9);
      v15 = v14;
      swift_bridgeObjectRelease(v10);
      v16 = v13;
      v8 = "FaceTimeVoicemailManager failed to set messages %s as undeleted with error: %@" + 32;
      *(_QWORD *)(v0 + 72) = sub_10004DF18(v16, v15, (uint64_t *)&v65);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 72, v0 + 80, v11 + 4, v11 + 12);
      swift_bridgeObjectRelease(v15);
      swift_bridgeObjectRelease_n(v10, 2);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "messageStoreDidDeleteMessagesWithUUIDs: %s", v11, 0xCu);
      swift_arrayDestroy(v64, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v64, -1, -1);
      swift_slowDealloc(v11, -1, -1);

    }
    else
    {
      v22 = *(_QWORD *)(v0 + 96);

      swift_bridgeObjectRelease_n(v22, 2);
    }
    v23 = *(_QWORD *)(v0 + 96);
    v24 = *(_QWORD *)(v23 + 16);
    v25 = (objc_super *)_swiftEmptyArrayStorage;
    if (v24)
    {
      v65 = (objc_super *)_swiftEmptyArrayStorage;
      v26 = *(_QWORD *)(v0 + 112);
      specialized ContiguousArray.reserveCapacity(_:)(v24);
      v27 = v23 + ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80));
      v62 = *(_QWORD *)(v26 + 72);
      v63 = v26;
      v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16);
      do
      {
        v29 = *(_QWORD *)(v0 + 120);
        v30 = *(_QWORD *)(v0 + 128);
        v31 = *(_QWORD *)(v0 + 104);
        v28(v30, v27, v31);
        v28(v29, v30, v31);
        v32 = (objc_class *)type metadata accessor for MessageID(0);
        v33 = (char *)objc_allocWithZone(v32);
        v34 = &v33[OBJC_IVAR___MPMessageID_value];
        v28((uint64_t)&v33[OBJC_IVAR___MPMessageID_value], v29, v31);
        v35 = type metadata accessor for MessageID.Value(0);
        swift_storeEnumTagMultiPayload(v34, v35, 1);
        *(_QWORD *)(v0 + 40) = v33;
        *(_QWORD *)(v0 + 48) = v32;
        v36 = objc_msgSendSuper2((objc_super *)(v0 + 40), "init");
        v37 = *(void (**)(uint64_t, uint64_t))(v63 + 8);
        v37(v29, v31);
        v38 = ((uint64_t (*)(uint64_t, uint64_t))v37)(v30, v31);
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v38);
        receiver = v65[1].receiver;
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(receiver);
        v40 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(receiver, v36);
        specialized ContiguousArray._endMutation()(v40);
        v27 += v62;
        --v24;
      }
      while (v24);
      v25 = v65;
      v8 = "to set messages %s as undeleted with error: %@";
    }
    v41 = v61;
    v42 = (uint64_t)sub_1000348A4((unint64_t)v25);
    swift_bridgeObjectRelease(v25);
    v43 = swift_bridgeObjectRetain_n(v42, 2);
    v44 = Logger.logObject.getter(v43);
    v45 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = (uint8_t *)swift_slowAlloc(12, -1);
      v47 = (objc_super *)swift_slowAlloc(32, -1);
      v65 = v47;
      *(_DWORD *)v46 = *((_QWORD *)v8 + 267);
      v48 = type metadata accessor for MessageID(0);
      v49 = swift_bridgeObjectRetain(v42);
      v50 = Array.description.getter(v49, v48);
      v52 = v51;
      swift_bridgeObjectRelease(v42);
      *v60 = sub_10004DF18(v50, v52, (uint64_t *)&v65);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v60, v0 + 72, v46 + 4, v46 + 12);
      swift_bridgeObjectRelease(v52);
      swift_bridgeObjectRelease_n(v42, 2);
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "FaceTimeVoicemailManager did remove: %s", v46, 0xCu);
      swift_arrayDestroy(v47, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v47, -1, -1);
      v41 = v61;
      swift_slowDealloc(v46, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v42, 2);
    }
    if ((unint64_t)v42 >> 62)
    {
      if (v42 < 0)
        v59 = v42;
      else
        v59 = v42 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v42);
      v53 = _CocoaArrayWrapper.endIndex.getter(v59);
      swift_bridgeObjectRelease(v42);
    }
    else
    {
      v53 = *(_QWORD *)((v42 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease(v42);
    if (v53)
    {
      v54 = *(void (**)(uint64_t))(v41
                                           + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_onVoicemailsChanged);
      v55 = *(_QWORD *)(v41 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_onVoicemailsChanged + 8);
      v56 = swift_retain(v55);
      v54(v56);
      swift_release(v55);
    }
    swift_release(v41);
  }
  else
  {
    v17 = Logger.logObject.getter(v4);
    v18 = static os_log_type_t.error.getter();
    v19 = os_log_type_enabled(v17, (os_log_type_t)v18);
    v20 = *(_QWORD *)(v0 + 96);
    if (v19)
    {
      v21 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v21 = 134217984;
      *(_QWORD *)(v0 + 56) = *(_QWORD *)(v20 + 16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 56, v0 + 64, v21 + 4, v21 + 12);
      swift_bridgeObjectRelease(v20);
      _os_log_impl((void *)&_mh_execute_header, v17, (os_log_type_t)v18, "ignoring %ld deleted messageUUIDs, no more self", v21, 0xCu);
      swift_slowDealloc(v21, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease(v20);
    }
  }
  v57 = *(_QWORD *)(v0 + 120);
  swift_task_dealloc(*(_QWORD *)(v0 + 128));
  swift_task_dealloc(v57);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000441D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD), uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;

  v10 = a4(0);
  v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v10);
  swift_retain(a1);
  sub_100042ACC(v11, a5, a6);
  swift_release(a1);
  return swift_bridgeObjectRelease(v11);
}

uint64_t sub_100044250(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v5 + 40) = a4;
  *(_QWORD *)(v5 + 48) = a5;
  v6 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v6, &unk_100091088);
  v7 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v8 = dispatch thunk of Actor.unownedExecutor.getter(v6, v7);
  return swift_task_switch(sub_1000442E4, v8, v9);
}

uint64_t sub_1000442E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t Strong;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;

  v1 = *(_QWORD *)(v0 + 40) + 16;
  swift_beginAccess(v1, v0 + 16, 0, 0);
  Strong = swift_weakLoadStrong(v1);
  if (Strong)
  {
    v3 = Strong;
    v4 = *(_QWORD *)(Strong + 16);
    *(_QWORD *)(Strong + 16) = 0x8000000000000000;
    v5 = swift_release(v4 & 0x3FFFFFFFFFFFFFFFLL);
    v6 = Logger.logObject.getter(v5);
    v7 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "messageStoreDidReconnect(), triggering onVoicemailsChanged().", v8, 2u);
      swift_slowDealloc(v8, -1, -1);
    }

    v10 = *(void (**)(uint64_t))(v3 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_onVoicemailsChanged);
    v9 = *(_QWORD *)(v3 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_onVoicemailsChanged + 8);
    v11 = swift_retain(v9);
    v10(v11);
    swift_release(v9);
    swift_release(v3);
  }
  else
  {
    v12 = Logger.logObject.getter(0);
    v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "ignoring messageStoreDidReconnect(), no more self", v14, 2u);
      swift_slowDealloc(v14, -1, -1);
    }

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100044474(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t inited;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;

  v23 = a2;
  v4 = v2;
  v5 = type metadata accessor for Logger(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  __chkstk_darwin(v5);
  v8 = sub_100031408(&qword_100091120);
  __chkstk_darwin(v8);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = v4 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_logger;
  v13 = swift_allocObject(&unk_10007EA88, 24, 7);
  swift_weakInit(v13 + 16, v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v12, v5);
  v14 = type metadata accessor for VoicemailActor();
  swift_retain(v13);
  inited = swift_initStaticObject(v14, &unk_100091088);
  v16 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v17 = *(unsigned __int8 *)(v6 + 80);
  v18 = (v17 + 40) & ~v17;
  v19 = (char *)swift_allocObject(a1, v18 + v7, v17 | 7);
  *((_QWORD *)v19 + 2) = inited;
  *((_QWORD *)v19 + 3) = v16;
  *((_QWORD *)v19 + 4) = v13;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v19[v18], (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  swift_release(v13);
  v20 = sub_100051774((uint64_t)v10, v23, (uint64_t)v19);
  return swift_release(v20);
}

uint64_t sub_10004463C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v5 + 40) = a4;
  *(_QWORD *)(v5 + 48) = a5;
  v6 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v6, &unk_100091088);
  v7 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v8 = dispatch thunk of Actor.unownedExecutor.getter(v6, v7);
  return swift_task_switch(sub_1000446D0, v8, v9);
}

uint64_t sub_1000446D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t Strong;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;

  v1 = *(_QWORD *)(v0 + 40) + 16;
  swift_beginAccess(v1, v0 + 16, 0, 0);
  Strong = swift_weakLoadStrong(v1);
  if (Strong)
  {
    v3 = Strong;
    v4 = *(_QWORD *)(Strong + 16);
    *(_QWORD *)(Strong + 16) = 0x8000000000000000;
    v5 = swift_release(v4 & 0x3FFFFFFFFFFFFFFFLL);
    v6 = Logger.logObject.getter(v5);
    v7 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "messageStoreRequiresRefetch(), triggering onVoicemailsChanged().", v8, 2u);
      swift_slowDealloc(v8, -1, -1);
    }

    v10 = *(void (**)(uint64_t))(v3 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_onVoicemailsChanged);
    v9 = *(_QWORD *)(v3 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_onVoicemailsChanged + 8);
    v11 = swift_retain(v9);
    v10(v11);
    swift_release(v9);
    swift_release(v3);
  }
  else
  {
    v12 = Logger.logObject.getter(0);
    v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "ignoring messageStoreRequiresRefetch(), no more self", v14, 2u);
      swift_slowDealloc(v14, -1, -1);
    }

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100044860(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_retain(a1);
  sub_100044474(a3, a4);
  return swift_release(a1);
}

_QWORD *sub_1000448A0(unint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = sub_10003F310(a1);
  if (!result)
  {
    v3 = swift_bridgeObjectRetain_n(a1, 2);
    v4 = Logger.logObject.getter(v3);
    v5 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc(12, -1);
      v7 = swift_slowAlloc(32, -1);
      v9 = v7;
      *(_DWORD *)v6 = 136446210;
      v8 = sub_10004DF18(0x654D3C7961727241, 0xEE003E6567617373, &v9);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v8, &v9, v6 + 4, v6 + 12);
      swift_bridgeObjectRelease_n(a1, 2);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "FaceTimeVoicemailManager received the incorrect type %{public}s when it expected a FTMessage", v6, 0xCu);
      swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v7, -1, -1);
      swift_slowDealloc(v6, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n(a1, 2);
    }

    return _swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_100044A78(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2[5] = a1;
  v2[6] = v1;
  v3 = type metadata accessor for MessageStoreQuery(0);
  v2[7] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[8] = v4;
  v2[9] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v5, &unk_100091088);
  v6 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v5, v6);
  v2[10] = v7;
  v2[11] = v8;
  return swift_task_switch(sub_100044B34, v7, v8);
}

uint64_t sub_100044B34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v1 = (uint64_t)sub_1000448A0(*(_QWORD *)(v0 + 40));
  v2 = v1;
  *(_QWORD *)(v0 + 96) = v1;
  if ((unint64_t)v1 >> 62)
  {
    if (v1 < 0)
      v5 = v1;
    else
      v5 = v1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v1);
    v6 = _CocoaArrayWrapper.endIndex.getter(v5);
    swift_bridgeObjectRelease(v2);
    *(_QWORD *)(v0 + 104) = v6;
    if (v6)
      return swift_task_switch(sub_100044BE4, 0, 0);
  }
  else
  {
    v3 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    *(_QWORD *)(v0 + 104) = v3;
    if (v3)
      return swift_task_switch(sub_100044BE4, 0, 0);
  }
  swift_bridgeObjectRelease(v2);
  swift_task_dealloc(*(_QWORD *)(v0 + 72));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100044BE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 112) = static MainActor.shared.getter(v1);
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100044C4C, v2, v3);
}

uint64_t sub_100044C4C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = v0[13];
  result = swift_release(v0[14]);
  if (v1 < 1)
  {
    __break(1u);
  }
  else
  {
    v3 = v0[12];
    v4 = v3 & 0xC000000000000001;
    v5 = v3 + 32;
    swift_bridgeObjectRetain(v3);
    v6 = 0;
    do
    {
      if (v4)
        v7 = specialized _ArrayBuffer._getElementSlowPath(_:)(v6, v0[12]);
      else
        v7 = swift_retain(*(_QWORD *)(v5 + 8 * v6));
      v8 = v0[13];
      ++v6;
      *(_BYTE *)(v7 + OBJC_IVAR____TtC9IntentsUI9FTMessage_isDirty) = 1;
      *(_BYTE *)(v7 + 34) = 1;
      swift_release(v7);
    }
    while (v6 != v8);
    swift_bridgeObjectRelease(v0[12]);
    return swift_task_switch(sub_100044D04, v0[10], v0[11]);
  }
  return result;
}

uint64_t sub_100044D04()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v1 = v0[12];
  v3 = v0[8];
  v2 = (uint64_t *)v0[9];
  v5 = v0[6];
  v4 = v0[7];
  v6 = sub_10003ED20(v1);
  v0[15] = v6;
  swift_bridgeObjectRelease(v1);
  v7 = *(_QWORD *)(v5 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController);
  v0[16] = v7;
  v8 = swift_allocObject(&unk_10007E7B8, 24, 7);
  *(_QWORD *)(v8 + 16) = v6;
  *v2 = v8;
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v3 + 104))(v2, enum case for MessageStoreQuery.recordUUID(_:), v4);
  v9 = async function pointer to MessageStoreController.deleteMessages(query:)[1];
  swift_retain(v7);
  swift_bridgeObjectRetain(v6);
  v10 = (_QWORD *)swift_task_alloc(v9);
  v0[17] = v10;
  *v10 = v0;
  v10[1] = sub_100044DF4;
  return MessageStoreController.deleteMessages(query:)(v0[9]);
}

uint64_t sub_100044DF4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = *(_QWORD *)(*v1 + 136);
  v3 = *v1;
  *(_QWORD *)(v3 + 144) = v0;
  swift_task_dealloc(v2);
  v4 = *(_QWORD *)(v3 + 128);
  if (v0)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v3 + 64) + 8))(*(_QWORD *)(v3 + 72), *(_QWORD *)(v3 + 56));
    swift_release(v4);
    return swift_task_switch(sub_100044EB0, *(_QWORD *)(v3 + 80), *(_QWORD *)(v3 + 88));
  }
  else
  {
    v6 = *(_QWORD *)(v3 + 120);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v3 + 64) + 8))(*(_QWORD *)(v3 + 72), *(_QWORD *)(v3 + 56));
    swift_release(v4);
    swift_bridgeObjectRelease(v6);
    swift_task_dealloc(*(_QWORD *)(v3 + 72));
    return (*(uint64_t (**)(void))(v3 + 8))();
  }
}

uint64_t sub_100044EB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(v0 + 120);
  swift_errorRetain(v1);
  swift_bridgeObjectRetain(v2);
  v3 = swift_errorRetain(v1);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(_QWORD *)(v0 + 144);
    v7 = *(_QWORD *)(v0 + 120);
    v8 = swift_slowAlloc(22, -1);
    v9 = (uint64_t *)swift_slowAlloc(8, -1);
    v20 = swift_slowAlloc(32, -1);
    v21 = v20;
    *(_DWORD *)v8 = 136315394;
    v10 = type metadata accessor for UUID(0);
    v11 = swift_bridgeObjectRetain(v7);
    v12 = Array.description.getter(v11, v10);
    v14 = v13;
    swift_bridgeObjectRelease(v7);
    *(_QWORD *)(v0 + 24) = sub_10004DF18(v12, v14, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease(v14);
    swift_bridgeObjectRelease_n(v7, 2);
    *(_WORD *)(v8 + 12) = 2112;
    swift_errorRetain(v6);
    v15 = _swift_stdlib_bridgeErrorToNSError(v6);
    *(_QWORD *)(v0 + 32) = v15;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40, v8 + 14, v8 + 22);
    *v9 = v15;
    swift_errorRelease(v6);
    swift_errorRelease(v6);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "FaceTimeVoicemailManager failed to delete messages with recordUUIDs %s with error: %@", (uint8_t *)v8, 0x16u);
    v16 = sub_100031408(&qword_100091F90);
    swift_arrayDestroy(v9, 1, v16);
    swift_slowDealloc(v9, -1, -1);
    swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v20, -1, -1);
    swift_slowDealloc(v8, -1, -1);
    swift_errorRelease(v6);

  }
  else
  {
    v17 = *(_QWORD *)(v0 + 144);
    v18 = *(_QWORD *)(v0 + 120);
    swift_errorRelease(v17);

    swift_bridgeObjectRelease_n(v18, 2);
    swift_errorRelease(v17);
    swift_errorRelease(v17);
  }
  swift_task_dealloc(*(_QWORD *)(v0 + 72));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100045250(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v4 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v4, &unk_100091088);
  v5 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, v5);
  return swift_task_switch(sub_1000452E8, v6, v7);
}

uint64_t sub_1000452E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  v3 = sub_100031408(&qword_1000916D0);
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);
  *(_QWORD *)(v0 + 48) = v4;
  v5 = dword_100091AEC;
  swift_retain(v1);
  v6 = (_QWORD *)swift_task_alloc(v5);
  *(_QWORD *)(v0 + 56) = v6;
  *v6 = v0;
  v6[1] = sub_100049D98;
  return sub_100044A78(v4);
}

uint64_t sub_100045378(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2[4] = a1;
  v2[5] = v1;
  v3 = sub_100031408(&qword_1000918B8);
  v2[6] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (*(_QWORD *)(*(_QWORD *)(sub_100031408(&qword_100091A98) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[7] = swift_task_alloc(v4);
  v2[8] = swift_task_alloc(v4);
  v5 = type metadata accessor for UUID(0);
  v2[9] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v2[10] = v6;
  v2[11] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v7, &unk_100091088);
  v8 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v9 = dispatch thunk of Actor.unownedExecutor.getter(v7, v8);
  v2[12] = v9;
  v2[13] = v10;
  return swift_task_switch(sub_10004548C, v9, v10);
}

uint64_t sub_10004548C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = (uint64_t)sub_1000448A0(*(_QWORD *)(v0 + 32));
  v2 = v1;
  *(_QWORD *)(v0 + 112) = v1;
  if ((unint64_t)v1 >> 62)
  {
    if (v1 < 0)
      v5 = v1;
    else
      v5 = v1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v1);
    v6 = _CocoaArrayWrapper.endIndex.getter(v5);
    swift_bridgeObjectRelease(v2);
    *(_QWORD *)(v0 + 120) = v6;
    if (v6)
      return swift_task_switch(sub_100045568, 0, 0);
  }
  else
  {
    v3 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    *(_QWORD *)(v0 + 120) = v3;
    if (v3)
      return swift_task_switch(sub_100045568, 0, 0);
  }
  swift_bridgeObjectRelease(v2);
  v7 = *(_QWORD *)(v0 + 56);
  v8 = *(_QWORD *)(v0 + 64);
  v9 = *(_QWORD *)(v0 + 48);
  swift_task_dealloc(*(_QWORD *)(v0 + 88));
  swift_task_dealloc(v8);
  swift_task_dealloc(v7);
  swift_task_dealloc(v9);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100045568()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 128) = static MainActor.shared.getter(v1);
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_1000455D0, v2, v3);
}

uint64_t sub_1000455D0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = v0[15];
  result = swift_release(v0[16]);
  if (v1 < 1)
  {
    __break(1u);
  }
  else
  {
    v3 = v0[14];
    v4 = v3 & 0xC000000000000001;
    v5 = v3 + 32;
    swift_bridgeObjectRetain(v3);
    v6 = 0;
    do
    {
      if (v4)
        v7 = specialized _ArrayBuffer._getElementSlowPath(_:)(v6, v0[14]);
      else
        v7 = swift_retain(*(_QWORD *)(v5 + 8 * v6));
      v8 = v0[15];
      ++v6;
      *(_BYTE *)(v7 + OBJC_IVAR____TtC9IntentsUI9FTMessage_isDirty) = 1;
      *(_BYTE *)(v7 + 33) = 1;
      swift_release(v7);
    }
    while (v6 != v8);
    swift_bridgeObjectRelease(v0[14]);
    return swift_task_switch(sub_100045688, v0[12], v0[13]);
  }
  return result;
}

uint64_t sub_100045688()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;

  v1 = v0[14];
  if ((unint64_t)v1 >> 62)
  {
    if (v1 < 0)
      v3 = v0[14];
    else
      v3 = v1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v0[14]);
    v2 = _CocoaArrayWrapper.endIndex.getter(v3);
    swift_bridgeObjectRelease(v1);
  }
  else
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (!v2)
    goto LABEL_14;
  result = specialized ContiguousArray.reserveCapacity(_:)(v2);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v5 = 0;
    v26 = v0[10];
    do
    {
      v19 = v0[14];
      if ((v19 & 0xC000000000000001) != 0)
      {
        v6 = specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v19);
      }
      else
      {
        v6 = *(_QWORD *)(v19 + 8 * v5 + 32);
        swift_retain(v6);
      }
      v7 = v0[11];
      v8 = v0[8];
      v9 = v0[9];
      v11 = v0[6];
      v10 = v0[7];
      ++v5;
      dispatch thunk of Message.recordUUID.getter();
      v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 56);
      v12(v8, 1, 1, v9);
      v12(v10, 1, 1, v9);
      v13 = type metadata accessor for URL(0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
      v14 = objc_allocWithZone((Class)type metadata accessor for MessageUpdate(0));
      LOBYTE(v25) = 0;
      BYTE4(v24) = 2;
      LODWORD(v24) = 0x10000;
      HIDWORD(v23) = 0x10000;
      LOBYTE(v23) = 1;
      v15 = MessageUpdate.init(recordUUID:callUUID:conversationID:from:provider:isRead:duration:mailboxType:recipient:transcriptionStatus:isRTT:transcriptURL:simID:undelete:)(v7, v8, v10, 0, 0, 0, 1, 1, 0, v23, 0, 0, v24, v11, 0, 0, v25);
      v16 = swift_release(v6);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v16);
      v17 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v17);
      v18 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v17, v15);
      specialized ContiguousArray._endMutation()(v18);
    }
    while (v2 != v5);
LABEL_14:
    v0[17] = _swiftEmptyArrayStorage;
    v20 = *(_QWORD *)(v0[5] + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController);
    v0[18] = v20;
    v21 = async function pointer to MessageStoreController.updateMessages(_:)[1];
    swift_retain(v20);
    v22 = (_QWORD *)swift_task_alloc(v21);
    v0[19] = v22;
    *v22 = v0;
    v22[1] = sub_1000458E0;
    return MessageStoreController.updateMessages(_:)(_swiftEmptyArrayStorage);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000458E0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(*v1 + 152);
  v3 = *v1;
  *(_QWORD *)(v3 + 160) = v0;
  swift_task_dealloc(v2);
  if (v0)
    return swift_task_switch(sub_100045998, *(_QWORD *)(v3 + 96), *(_QWORD *)(v3 + 104));
  v5 = *(_QWORD *)(v3 + 136);
  v6 = *(_QWORD *)(v3 + 144);
  swift_bridgeObjectRelease(*(_QWORD *)(v3 + 112));
  swift_bridgeObjectRelease(v5);
  swift_release(v6);
  v7 = *(_QWORD *)(v3 + 56);
  v8 = *(_QWORD *)(v3 + 64);
  v9 = *(_QWORD *)(v3 + 48);
  swift_task_dealloc(*(_QWORD *)(v3 + 88));
  swift_task_dealloc(v8);
  swift_task_dealloc(v7);
  swift_task_dealloc(v9);
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_100045998()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;

  v1 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 112);
  swift_release(*(_QWORD *)(v0 + 144));
  swift_bridgeObjectRelease(v2);
  swift_errorRetain(v1);
  swift_bridgeObjectRetain(v3);
  v4 = swift_errorRetain(v1);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = *(_QWORD *)(v0 + 160);
    v8 = *(_QWORD *)(v0 + 112);
    v9 = swift_slowAlloc(22, -1);
    v10 = (uint64_t *)swift_slowAlloc(8, -1);
    v24 = swift_slowAlloc(32, -1);
    v25 = v24;
    *(_DWORD *)v9 = 136315394;
    v11 = type metadata accessor for FTMessage(0);
    v12 = swift_bridgeObjectRetain(v8);
    v13 = Array.description.getter(v12, v11);
    v15 = v14;
    swift_bridgeObjectRelease(v8);
    *(_QWORD *)(v0 + 16) = sub_10004DF18(v13, v15, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v9 + 4, v9 + 12);
    swift_bridgeObjectRelease(v15);
    swift_bridgeObjectRelease_n(v8, 2);
    *(_WORD *)(v9 + 12) = 2112;
    swift_errorRetain(v7);
    v16 = _swift_stdlib_bridgeErrorToNSError(v7);
    *(_QWORD *)(v0 + 24) = v16;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v9 + 14, v9 + 22);
    *v10 = v16;
    swift_errorRelease(v7);
    swift_errorRelease(v7);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "FaceTimeVoicemailManager failed to set messages %s as read with error: %@", (uint8_t *)v9, 0x16u);
    v17 = sub_100031408(&qword_100091F90);
    swift_arrayDestroy(v10, 1, v17);
    swift_slowDealloc(v10, -1, -1);
    swift_arrayDestroy(v24, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v24, -1, -1);
    swift_slowDealloc(v9, -1, -1);
    swift_errorRelease(v7);

  }
  else
  {
    v18 = *(_QWORD *)(v0 + 160);
    v19 = *(_QWORD *)(v0 + 112);
    swift_errorRelease(v18);

    swift_bridgeObjectRelease_n(v19, 2);
    swift_errorRelease(v18);
    swift_errorRelease(v18);
  }
  v20 = *(_QWORD *)(v0 + 56);
  v21 = *(_QWORD *)(v0 + 64);
  v22 = *(_QWORD *)(v0 + 48);
  swift_task_dealloc(*(_QWORD *)(v0 + 88));
  swift_task_dealloc(v21);
  swift_task_dealloc(v20);
  swift_task_dealloc(v22);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100045D68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v4 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v4, &unk_100091088);
  v5 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, v5);
  return swift_task_switch(sub_100045E00, v6, v7);
}

uint64_t sub_100045E00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  v3 = sub_100031408(&qword_1000916D0);
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);
  *(_QWORD *)(v0 + 48) = v4;
  v5 = dword_100091AD4;
  swift_retain(v1);
  v6 = (_QWORD *)swift_task_alloc(v5);
  *(_QWORD *)(v0 + 56) = v6;
  *v6 = v0;
  v6[1] = sub_100045E90;
  return sub_100045378(v4);
}

uint64_t sub_100045E90()
{
  uint64_t *v0;
  uint64_t v1;
  void (**v2)(_QWORD);
  uint64_t v3;
  uint64_t v5;

  v1 = *(_QWORD *)(*v0 + 48);
  v3 = *(_QWORD *)(*v0 + 32);
  v2 = *(void (***)(_QWORD))(*v0 + 40);
  v5 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 56));
  swift_bridgeObjectRelease(v1);
  swift_release(v3);
  v2[2](v2);
  _Block_release(v2);
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_100045F08(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2[5] = a1;
  v2[6] = v1;
  v3 = sub_100031408(&qword_1000918B8);
  v2[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (*(_QWORD *)(*(_QWORD *)(sub_100031408(&qword_100091A98) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[8] = swift_task_alloc(v4);
  v2[9] = swift_task_alloc(v4);
  v5 = type metadata accessor for UUID(0);
  v2[10] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v2[11] = v6;
  v7 = (*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[12] = swift_task_alloc(v7);
  v2[13] = swift_task_alloc(v7);
  v2[14] = swift_task_alloc(v7);
  v8 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v8, &unk_100091088);
  v9 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v10 = dispatch thunk of Actor.unownedExecutor.getter(v8, v9);
  v2[15] = v10;
  v2[16] = v11;
  return swift_task_switch(sub_100046038, v10, v11);
}

uint64_t sub_100046038()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = (uint64_t)sub_1000448A0(*(_QWORD *)(v0 + 40));
  v2 = v1;
  *(_QWORD *)(v0 + 136) = v1;
  if ((unint64_t)v1 >> 62)
  {
    if (v1 < 0)
      v5 = v1;
    else
      v5 = v1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v1);
    v6 = _CocoaArrayWrapper.endIndex.getter(v5);
    swift_bridgeObjectRelease(v2);
    *(_QWORD *)(v0 + 144) = v6;
    if (v6)
      return swift_task_switch(sub_100046134, 0, 0);
  }
  else
  {
    v3 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    *(_QWORD *)(v0 + 144) = v3;
    if (v3)
      return swift_task_switch(sub_100046134, 0, 0);
  }
  swift_bridgeObjectRelease(v2);
  v7 = *(_QWORD *)(v0 + 104);
  v8 = *(_QWORD *)(v0 + 96);
  v10 = *(_QWORD *)(v0 + 64);
  v9 = *(_QWORD *)(v0 + 72);
  v11 = *(_QWORD *)(v0 + 56);
  swift_task_dealloc(*(_QWORD *)(v0 + 112));
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100046134()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 152) = static MainActor.shared.getter(v1);
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_10004619C, v2, v3);
}

uint64_t sub_10004619C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = v0[18];
  result = swift_release(v0[19]);
  if (v1 < 1)
  {
    __break(1u);
  }
  else
  {
    v3 = v0[17];
    v4 = v3 & 0xC000000000000001;
    v5 = v3 + 32;
    swift_bridgeObjectRetain(v3);
    v6 = 0;
    do
    {
      if (v4)
        v7 = specialized _ArrayBuffer._getElementSlowPath(_:)(v6, v0[17]);
      else
        v7 = swift_retain(*(_QWORD *)(v5 + 8 * v6));
      v8 = v0[18];
      ++v6;
      *(_BYTE *)(v7 + OBJC_IVAR____TtC9IntentsUI9FTMessage_isDirty) = 1;
      *(_QWORD *)(v7 + 24) = 2;
      *(_BYTE *)(v7 + 32) = 0;
      swift_release(v7);
    }
    while (v6 != v8);
    swift_bridgeObjectRelease(v0[17]);
    return swift_task_switch(sub_100046264, v0[15], v0[16]);
  }
  return result;
}

uint64_t sub_100046264()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  _QWORD *v39;

  v1 = v0[17];
  if ((unint64_t)v1 >> 62)
  {
    if (v1 < 0)
      v20 = v0[17];
    else
      v20 = v1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v0[17]);
    v2 = _CocoaArrayWrapper.endIndex.getter(v20);
    swift_bridgeObjectRelease(v1);
    if (v2)
      goto LABEL_3;
LABEL_14:
    swift_bridgeObjectRelease(v0[17]);
    v19 = _swiftEmptyArrayStorage;
    goto LABEL_15;
  }
  v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    goto LABEL_14;
LABEL_3:
  v39 = _swiftEmptyArrayStorage;
  result = specialized ContiguousArray.reserveCapacity(_:)(v2);
  if (v2 < 0)
  {
    __break(1u);
    return result;
  }
  v4 = 0;
  v38 = v0[11];
  do
  {
    v18 = v0[17];
    if ((v18 & 0xC000000000000001) != 0)
    {
      v5 = specialized _ArrayBuffer._getElementSlowPath(_:)(v4, v18);
    }
    else
    {
      v5 = *(_QWORD *)(v18 + 8 * v4 + 32);
      swift_retain(v5);
    }
    v6 = v0[14];
    v7 = v0[9];
    v8 = v0[10];
    v10 = v0[7];
    v9 = v0[8];
    ++v4;
    dispatch thunk of Message.recordUUID.getter();
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v38 + 56);
    v11(v7, 1, 1, v8);
    v11(v9, 1, 1, v8);
    v12 = type metadata accessor for URL(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 1, 1, v12);
    v13 = objc_allocWithZone((Class)type metadata accessor for MessageUpdate(0));
    LOBYTE(v37) = 0;
    BYTE4(v36) = 2;
    LODWORD(v36) = 0x10000;
    HIDWORD(v35) = 2;
    LOBYTE(v35) = 1;
    v14 = MessageUpdate.init(recordUUID:callUUID:conversationID:from:provider:isRead:duration:mailboxType:recipient:transcriptionStatus:isRTT:transcriptURL:simID:undelete:)(v6, v7, v9, 0, 0, 0, 1, 2, 0, v35, 0, 0, v36, v10, 0, 0, v37);
    v15 = swift_release(v5);
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v15);
    v16 = v39[2];
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v16);
    v17 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v16, v14);
    specialized ContiguousArray._endMutation()(v17);
  }
  while (v2 != v4);
  v19 = v39;
  swift_bridgeObjectRelease(v0[17]);
LABEL_15:
  v21 = OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_logger;
  v0[20] = v19;
  v0[21] = v21;
  v22 = swift_bridgeObjectRetain_n(v19, 2);
  v23 = Logger.logObject.getter(v22);
  v24 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc(12, -1);
    v26 = (_QWORD *)swift_slowAlloc(32, -1);
    v39 = v26;
    *(_DWORD *)v25 = 136315138;
    v27 = type metadata accessor for MessageUpdate(0);
    v28 = swift_bridgeObjectRetain(v19);
    v29 = Array.description.getter(v28, v27);
    v31 = v30;
    swift_bridgeObjectRelease(v19);
    v0[4] = sub_10004DF18(v29, v31, (uint64_t *)&v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 4, v0 + 5, v25 + 4, v25 + 12);
    swift_bridgeObjectRelease(v31);
    swift_bridgeObjectRelease_n(v19, 2);
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "[moveToTrash] Updating messages in FaceTimeVoicemailManager - Updates: %s", v25, 0xCu);
    swift_arrayDestroy(v26, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v26, -1, -1);
    swift_slowDealloc(v25, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v19, 2);
  }
  v32 = *(_QWORD *)(v0[6] + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController);
  v0[22] = v32;
  v33 = async function pointer to MessageStoreController.updateMessages(_:)[1];
  swift_retain(v32);
  v34 = (_QWORD *)swift_task_alloc(v33);
  v0[23] = v34;
  *v34 = v0;
  v34[1] = sub_100046624;
  return MessageStoreController.updateMessages(_:)(v19);
}

uint64_t sub_100046624()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(_QWORD *)(*v1 + 184);
  v3 = *v1;
  *(_QWORD *)(v3 + 192) = v0;
  swift_task_dealloc(v2);
  if (v0)
    return swift_task_switch(sub_1000466F4, *(_QWORD *)(v3 + 120), *(_QWORD *)(v3 + 128));
  v5 = *(_QWORD *)(v3 + 176);
  swift_bridgeObjectRelease(*(_QWORD *)(v3 + 160));
  swift_release(v5);
  v6 = *(_QWORD *)(v3 + 104);
  v7 = *(_QWORD *)(v3 + 96);
  v9 = *(_QWORD *)(v3 + 64);
  v8 = *(_QWORD *)(v3 + 72);
  v10 = *(_QWORD *)(v3 + 56);
  swift_task_dealloc(*(_QWORD *)(v3 + 112));
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_1000466F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id *v22;
  id v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  os_log_type_t v43;
  uint64_t v44;
  NSObject *log;
  uint64_t v46;
  _QWORD *v47;

  v1 = *(_QWORD *)(v0 + 192);
  v2 = *(_QWORD *)(v0 + 160);
  swift_release(*(_QWORD *)(v0 + 176));
  swift_errorRetain(v1);
  swift_bridgeObjectRetain(v2);
  v3 = swift_errorRetain(v1);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v4, v5))
  {
    v19 = *(_QWORD *)(v0 + 192);
    v20 = *(_QWORD *)(v0 + 160);
    swift_errorRelease(v19);

    swift_bridgeObjectRelease_n(v20, 2);
    swift_errorRelease(v19);
    swift_errorRelease(v19);
LABEL_18:
    v35 = *(_QWORD *)(v0 + 104);
    v36 = *(_QWORD *)(v0 + 96);
    v38 = *(_QWORD *)(v0 + 64);
    v37 = *(_QWORD *)(v0 + 72);
    v39 = *(_QWORD *)(v0 + 56);
    swift_task_dealloc(*(_QWORD *)(v0 + 112));
    swift_task_dealloc(v35);
    swift_task_dealloc(v36);
    swift_task_dealloc(v37);
    swift_task_dealloc(v38);
    swift_task_dealloc(v39);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v6 = *(_QWORD *)(v0 + 160);
  v7 = swift_slowAlloc(22, -1);
  v42 = (uint64_t *)swift_slowAlloc(8, -1);
  v8 = swift_slowAlloc(32, -1);
  v46 = v8;
  *(_DWORD *)v7 = 136315394;
  if (v6 >> 62)
  {
    v40 = *(_QWORD *)(v0 + 160);
    if (v40 < 0)
      v41 = *(_QWORD *)(v0 + 160);
    else
      v41 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*(_QWORD *)(v0 + 160));
    v9 = _CocoaArrayWrapper.endIndex.getter(v41);
    swift_bridgeObjectRelease(v40);
  }
  else
  {
    v9 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v10 = _swiftEmptyArrayStorage;
  v44 = v8;
  log = v4;
  v43 = v5;
  if (!v9)
  {
LABEL_17:
    v28 = *(_QWORD *)(v0 + 192);
    v29 = *(_QWORD *)(v0 + 160);
    v30 = Array.description.getter(v10, *(_QWORD *)(v0 + 80));
    v32 = v31;
    swift_bridgeObjectRelease(v10);
    *(_QWORD *)(v0 + 16) = sub_10004DF18(v30, v32, &v46);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v7 + 4, v7 + 12);
    swift_bridgeObjectRelease(v32);
    swift_bridgeObjectRelease_n(v29, 2);
    *(_WORD *)(v7 + 12) = 2112;
    swift_errorRetain(v28);
    v33 = _swift_stdlib_bridgeErrorToNSError(v28);
    *(_QWORD *)(v0 + 24) = v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v7 + 14, v7 + 22);
    *v42 = v33;
    swift_errorRelease(v28);
    swift_errorRelease(v28);
    _os_log_impl((void *)&_mh_execute_header, log, v43, "FaceTimeVoicemailManager failed to set messages %s as deleted with error: %@", (uint8_t *)v7, 0x16u);
    v34 = sub_100031408(&qword_100091F90);
    swift_arrayDestroy(v42, 1, v34);
    swift_slowDealloc(v42, -1, -1);
    swift_arrayDestroy(v44, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v44, -1, -1);
    swift_slowDealloc(v7, -1, -1);
    swift_errorRelease(v28);

    goto LABEL_18;
  }
  v47 = _swiftEmptyArrayStorage;
  result = sub_1000489CC(0, v9 & ~(v9 >> 63), 0);
  if ((v9 & 0x8000000000000000) == 0)
  {
    v10 = v47;
    if ((v6 & 0xC000000000000001) != 0)
    {
      v12 = 0;
      v13 = *(_QWORD *)(v0 + 88);
      do
      {
        v14 = specialized _ArrayBuffer._getElementSlowPath(_:)(v12, *(_QWORD *)(v0 + 160));
        MessageUpdate.recordUUID.getter();
        swift_unknownObjectRelease(v14);
        v47 = v10;
        v16 = v10[2];
        v15 = v10[3];
        if (v16 >= v15 >> 1)
        {
          sub_1000489CC(v15 > 1, v16 + 1, 1);
          v10 = v47;
        }
        v17 = *(_QWORD *)(v0 + 104);
        v18 = *(_QWORD *)(v0 + 80);
        ++v12;
        v10[2] = v16 + 1;
        (*(void (**)(unint64_t, uint64_t, uint64_t))(v13 + 32))((unint64_t)v10+ ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))+ *(_QWORD *)(v13 + 72) * v16, v17, v18);
      }
      while (v9 != v12);
    }
    else
    {
      v21 = *(_QWORD *)(v0 + 88);
      v22 = (id *)(*(_QWORD *)(v0 + 160) + 32);
      do
      {
        v23 = *v22;
        MessageUpdate.recordUUID.getter();

        v47 = v10;
        v25 = v10[2];
        v24 = v10[3];
        if (v25 >= v24 >> 1)
        {
          sub_1000489CC(v24 > 1, v25 + 1, 1);
          v10 = v47;
        }
        v26 = *(_QWORD *)(v0 + 96);
        v27 = *(_QWORD *)(v0 + 80);
        v10[2] = v25 + 1;
        (*(void (**)(unint64_t, uint64_t, uint64_t))(v21 + 32))((unint64_t)v10+ ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80))+ *(_QWORD *)(v21 + 72) * v25, v26, v27);
        ++v22;
        --v9;
      }
      while (v9);
    }
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_100046C8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v4 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v4, &unk_100091088);
  v5 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, v5);
  return swift_task_switch(sub_100046D24, v6, v7);
}

uint64_t sub_100046D24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  v3 = sub_100031408(&qword_1000916D0);
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);
  *(_QWORD *)(v0 + 48) = v4;
  v5 = dword_100091ABC;
  swift_retain(v1);
  v6 = (_QWORD *)swift_task_alloc(v5);
  *(_QWORD *)(v0 + 56) = v6;
  *v6 = v0;
  v6[1] = sub_100049D98;
  return sub_100045F08(v4);
}

uint64_t sub_100046DB4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2[5] = a1;
  v2[6] = v1;
  v3 = sub_100031408(&qword_1000918B8);
  v2[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (*(_QWORD *)(*(_QWORD *)(sub_100031408(&qword_100091A98) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[8] = swift_task_alloc(v4);
  v2[9] = swift_task_alloc(v4);
  v5 = type metadata accessor for UUID(0);
  v2[10] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v2[11] = v6;
  v7 = (*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[12] = swift_task_alloc(v7);
  v2[13] = swift_task_alloc(v7);
  v8 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v8, &unk_100091088);
  v9 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v10 = dispatch thunk of Actor.unownedExecutor.getter(v8, v9);
  v2[14] = v10;
  v2[15] = v11;
  return swift_task_switch(sub_100046ED8, v10, v11);
}

uint64_t sub_100046ED8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = (uint64_t)sub_1000448A0(*(_QWORD *)(v0 + 40));
  v2 = v1;
  *(_QWORD *)(v0 + 128) = v1;
  if ((unint64_t)v1 >> 62)
  {
    if (v1 < 0)
      v5 = v1;
    else
      v5 = v1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v1);
    v6 = _CocoaArrayWrapper.endIndex.getter(v5);
    swift_bridgeObjectRelease(v2);
    *(_QWORD *)(v0 + 136) = v6;
    if (v6)
      return swift_task_switch(sub_100046FBC, 0, 0);
  }
  else
  {
    v3 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    *(_QWORD *)(v0 + 136) = v3;
    if (v3)
      return swift_task_switch(sub_100046FBC, 0, 0);
  }
  swift_bridgeObjectRelease(v2);
  v7 = *(_QWORD *)(v0 + 96);
  v9 = *(_QWORD *)(v0 + 64);
  v8 = *(_QWORD *)(v0 + 72);
  v10 = *(_QWORD *)(v0 + 56);
  swift_task_dealloc(*(_QWORD *)(v0 + 104));
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100046FBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 144) = static MainActor.shared.getter(v1);
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100047024, v2, v3);
}

uint64_t sub_100047024()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = v0[17];
  result = swift_release(v0[18]);
  if (v1 < 1)
  {
    __break(1u);
  }
  else
  {
    v3 = v0[16];
    v4 = v3 & 0xC000000000000001;
    v5 = v3 + 32;
    swift_bridgeObjectRetain(v3);
    v6 = 0;
    do
    {
      if (v4)
        v7 = specialized _ArrayBuffer._getElementSlowPath(_:)(v6, v0[16]);
      else
        v7 = swift_retain(*(_QWORD *)(v5 + 8 * v6));
      v8 = v0[17];
      ++v6;
      *(_BYTE *)(v7 + OBJC_IVAR____TtC9IntentsUI9FTMessage_isDirty) = 1;
      *(_QWORD *)(v7 + 24) = 1;
      *(_BYTE *)(v7 + 32) = 0;
      swift_release(v7);
    }
    while (v6 != v8);
    swift_bridgeObjectRelease(v0[16]);
    return swift_task_switch(sub_1000470E0, v0[14], v0[15]);
  }
  return result;
}

uint64_t sub_1000470E0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  _QWORD *v39;

  v1 = v0[16];
  if ((unint64_t)v1 >> 62)
  {
    if (v1 < 0)
      v3 = v0[16];
    else
      v3 = v1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v0[16]);
    v2 = _CocoaArrayWrapper.endIndex.getter(v3);
    swift_bridgeObjectRelease(v1);
  }
  else
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v0[19] = v2;
  v4 = _swiftEmptyArrayStorage;
  if (v2)
  {
    v39 = _swiftEmptyArrayStorage;
    result = specialized ContiguousArray.reserveCapacity(_:)(v2);
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    v6 = 0;
    v38 = v0[11];
    do
    {
      v20 = v0[16];
      if ((v20 & 0xC000000000000001) != 0)
      {
        v7 = specialized _ArrayBuffer._getElementSlowPath(_:)(v6, v20);
      }
      else
      {
        v7 = *(_QWORD *)(v20 + 8 * v6 + 32);
        swift_retain(v7);
      }
      v8 = v0[13];
      v9 = v0[9];
      v10 = v0[10];
      v12 = v0[7];
      v11 = v0[8];
      ++v6;
      dispatch thunk of Message.recordUUID.getter();
      v13 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v38 + 56);
      v13(v9, 1, 1, v10);
      v13(v11, 1, 1, v10);
      v14 = type metadata accessor for URL(0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v12, 1, 1, v14);
      v15 = objc_allocWithZone((Class)type metadata accessor for MessageUpdate(0));
      LOBYTE(v37) = 1;
      BYTE4(v36) = 2;
      LODWORD(v36) = 0x10000;
      HIDWORD(v35) = 0x10000;
      LOBYTE(v35) = 1;
      v16 = MessageUpdate.init(recordUUID:callUUID:conversationID:from:provider:isRead:duration:mailboxType:recipient:transcriptionStatus:isRTT:transcriptURL:simID:undelete:)(v8, v9, v11, 0, 0, 0, 1, 2, 0, v35, 0, 0, v36, v12, 0, 0, v37);
      v17 = swift_release(v7);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v17);
      v18 = v39[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v18);
      v19 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v18, v16);
      specialized ContiguousArray._endMutation()(v19);
    }
    while (v2 != v6);
    v4 = v39;
  }
  v21 = OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_logger;
  v0[20] = v4;
  v0[21] = v21;
  v22 = swift_bridgeObjectRetain_n(v4, 2);
  v23 = Logger.logObject.getter(v22);
  v24 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc(12, -1);
    v26 = (_QWORD *)swift_slowAlloc(32, -1);
    v39 = v26;
    *(_DWORD *)v25 = 136315138;
    v27 = type metadata accessor for MessageUpdate(0);
    v28 = swift_bridgeObjectRetain(v4);
    v29 = Array.description.getter(v28, v27);
    v31 = v30;
    swift_bridgeObjectRelease(v4);
    v0[4] = sub_10004DF18(v29, v31, (uint64_t *)&v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 4, v0 + 5, v25 + 4, v25 + 12);
    swift_bridgeObjectRelease(v31);
    swift_bridgeObjectRelease_n(v4, 2);
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "[removeFromTrash] Updating messages in FaceTimeVoicemailManager - Updates: %s", v25, 0xCu);
    swift_arrayDestroy(v26, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v26, -1, -1);
    swift_slowDealloc(v25, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v4, 2);
  }
  v32 = *(_QWORD *)(v0[6] + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController);
  v0[22] = v32;
  v33 = async function pointer to MessageStoreController.updateMessages(_:)[1];
  swift_retain(v32);
  v34 = (_QWORD *)swift_task_alloc(v33);
  v0[23] = v34;
  *v34 = v0;
  v34[1] = sub_100047488;
  return MessageStoreController.updateMessages(_:)(v4);
}

uint64_t sub_100047488()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(_QWORD *)(*v1 + 184);
  v3 = *v1;
  *(_QWORD *)(v3 + 192) = v0;
  swift_task_dealloc(v2);
  v4 = *(_QWORD *)(v3 + 176);
  v5 = *(_QWORD *)(v3 + 160);
  if (v0)
  {
    swift_release(*(_QWORD *)(v3 + 176));
    swift_bridgeObjectRelease(v5);
    return swift_task_switch(sub_10004755C, *(_QWORD *)(v3 + 112), *(_QWORD *)(v3 + 120));
  }
  else
  {
    swift_bridgeObjectRelease(*(_QWORD *)(v3 + 128));
    swift_bridgeObjectRelease(v5);
    swift_release(v4);
    v7 = *(_QWORD *)(v3 + 96);
    v9 = *(_QWORD *)(v3 + 64);
    v8 = *(_QWORD *)(v3 + 72);
    v10 = *(_QWORD *)(v3 + 56);
    swift_task_dealloc(*(_QWORD *)(v3 + 104));
    swift_task_dealloc(v7);
    swift_task_dealloc(v8);
    swift_task_dealloc(v9);
    swift_task_dealloc(v10);
    return (*(uint64_t (**)(void))(v3 + 8))();
  }
}

uint64_t sub_10004755C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  os_log_type_t v36;
  uint64_t v37;
  NSObject *log;
  uint64_t v39;
  _QWORD *v40;

  v1 = *(_QWORD *)(v0 + 192);
  v2 = *(_QWORD *)(v0 + 128);
  swift_errorRetain(v1);
  swift_bridgeObjectRetain(v2);
  v3 = swift_errorRetain(v1);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v4, v5))
  {
    v22 = *(_QWORD *)(v0 + 192);
    v23 = *(_QWORD *)(v0 + 128);
    swift_errorRelease(v22);

    swift_bridgeObjectRelease_n(v23, 2);
    swift_errorRelease(v22);
    swift_errorRelease(v22);
LABEL_14:
    v31 = *(_QWORD *)(v0 + 96);
    v33 = *(_QWORD *)(v0 + 64);
    v32 = *(_QWORD *)(v0 + 72);
    v34 = *(_QWORD *)(v0 + 56);
    swift_task_dealloc(*(_QWORD *)(v0 + 104));
    swift_task_dealloc(v31);
    swift_task_dealloc(v32);
    swift_task_dealloc(v33);
    swift_task_dealloc(v34);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v6 = *(_QWORD *)(v0 + 152);
  v7 = swift_slowAlloc(22, -1);
  v8 = swift_slowAlloc(8, -1);
  v9 = swift_slowAlloc(32, -1);
  v39 = v9;
  *(_DWORD *)v7 = 136315394;
  v10 = _swiftEmptyArrayStorage;
  v37 = v9;
  log = v4;
  v36 = v5;
  v35 = (_QWORD *)v8;
  if (!v6)
  {
LABEL_13:
    v24 = *(_QWORD *)(v0 + 192);
    v25 = *(_QWORD *)(v0 + 128);
    v26 = Array.description.getter(v10, *(_QWORD *)(v0 + 80));
    v28 = v27;
    swift_bridgeObjectRelease(v10);
    *(_QWORD *)(v0 + 16) = sub_10004DF18(v26, v28, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v7 + 4, v7 + 12);
    swift_bridgeObjectRelease(v28);
    swift_bridgeObjectRelease_n(v25, 2);
    *(_WORD *)(v7 + 12) = 2112;
    swift_errorRetain(v24);
    v29 = _swift_stdlib_bridgeErrorToNSError(v24);
    *(_QWORD *)(v0 + 24) = v29;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v7 + 14, v7 + 22);
    *v35 = v29;
    swift_errorRelease(v24);
    swift_errorRelease(v24);
    _os_log_impl((void *)&_mh_execute_header, log, v36, "FaceTimeVoicemailManager failed to set messages %s as undeleted with error: %@", (uint8_t *)v7, 0x16u);
    v30 = sub_100031408(&qword_100091F90);
    swift_arrayDestroy(v35, 1, v30);
    swift_slowDealloc(v35, -1, -1);
    swift_arrayDestroy(v37, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v37, -1, -1);
    swift_slowDealloc(v7, -1, -1);
    swift_errorRelease(v24);

    goto LABEL_14;
  }
  v11 = *(_QWORD *)(v0 + 152);
  v40 = _swiftEmptyArrayStorage;
  result = sub_1000489CC(0, v11 & ~(v11 >> 63), 0);
  if ((v11 & 0x8000000000000000) == 0)
  {
    v13 = 0;
    v14 = *(_QWORD *)(v0 + 88);
    v10 = v40;
    do
    {
      v15 = *(_QWORD *)(v0 + 128);
      if ((v15 & 0xC000000000000001) != 0)
      {
        v16 = specialized _ArrayBuffer._getElementSlowPath(_:)(v13, v15);
      }
      else
      {
        v16 = *(_QWORD *)(v15 + 8 * v13 + 32);
        swift_retain(v16);
      }
      dispatch thunk of Message.recordUUID.getter();
      swift_release(v16);
      v40 = v10;
      v18 = v10[2];
      v17 = v10[3];
      if (v18 >= v17 >> 1)
      {
        sub_1000489CC(v17 > 1, v18 + 1, 1);
        v10 = v40;
      }
      v19 = *(_QWORD *)(v0 + 152);
      v20 = *(_QWORD *)(v0 + 96);
      v21 = *(_QWORD *)(v0 + 80);
      ++v13;
      v10[2] = v18 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v14 + 32))((unint64_t)v10+ ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80))+ *(_QWORD *)(v14 + 72) * v18, v20, v21);
    }
    while (v13 != v19);
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

uint64_t sub_100047A24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v4 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v4, &unk_100091088);
  v5 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, v5);
  return swift_task_switch(sub_100047ABC, v6, v7);
}

uint64_t sub_100047ABC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  v3 = sub_100031408(&qword_1000916D0);
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);
  *(_QWORD *)(v0 + 48) = v4;
  v5 = dword_100091A94;
  swift_retain(v1);
  v6 = (_QWORD *)swift_task_alloc(v5);
  *(_QWORD *)(v0 + 56) = v6;
  *v6 = v0;
  v6[1] = sub_100049D98;
  return sub_100046DB4(v4);
}

uint64_t sub_100047C88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v4 = type metadata accessor for VoicemailActor();
  v3[5] = v4;
  swift_initStaticObject(v4, &unk_100091088);
  v5 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v3[6] = v5;
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, v5);
  return swift_task_switch(sub_100047D28, v6, v7);
}

uint64_t sub_100047D28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  const void *v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(const void **)(v0 + 24);
  v4 = _Block_copy(*(const void **)(v0 + 16));
  *(_QWORD *)(v0 + 56) = v4;
  *(_QWORD *)(v0 + 64) = _Block_copy(v3);
  *(_QWORD *)(v0 + 72) = swift_initStaticObject(v2, &unk_100091088);
  _Block_copy(v4);
  v5 = dword_10009138C;
  swift_retain(v1);
  v6 = (_QWORD *)swift_task_alloc(v5);
  *(_QWORD *)(v0 + 80) = v6;
  *v6 = v0;
  v6[1] = sub_100047DC0;
  return sub_100032E14();
}

uint64_t sub_100047DC0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 40);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 48);
  *(_QWORD *)(*(_QWORD *)v1 + 88) = a1;
  swift_task_dealloc(v2);
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v4, v3);
  return swift_task_switch(sub_100047E3C, v5, v6);
}

uint64_t sub_100047E3C()
{
  uint64_t v0;
  uint64_t (**v1)(_QWORD, _QWORD);
  void (**v2)(_QWORD, _QWORD);
  uint64_t v3;
  _QWORD *v4;
  Class isa;

  v1 = *(uint64_t (***)(_QWORD, _QWORD))(v0 + 56);
  v2 = *(void (***)(_QWORD, _QWORD))(v0 + 64);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = sub_10004264C(*(_QWORD *)(v0 + 88), v1);
  _Block_release(v1);
  swift_release(v3);
  sub_100031408(&qword_1000916D0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  ((void (**)(_QWORD, Class))v2)[2](v2, isa);

  _Block_release(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100047EE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  _QWORD *v8;

  v7 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v7, &unk_100091088);
  v8 = (_QWORD *)swift_task_alloc(dword_100091AEC);
  *(_QWORD *)(v5 + 16) = v8;
  *v8 = v5;
  v8[1] = sub_1000399C8;
  return sub_100044A78(a5);
}

uint64_t sub_100047F5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  _QWORD *v8;

  v7 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v7, &unk_100091088);
  v8 = (_QWORD *)swift_task_alloc(dword_100091AD4);
  *(_QWORD *)(v5 + 16) = v8;
  *v8 = v5;
  v8[1] = sub_1000399C8;
  return sub_100045378(a5);
}

uint64_t sub_100047FD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t inited;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v21;

  v9 = sub_100031408(&qword_100091120);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100031408(&qword_1000916D0);
  v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v12);
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = type metadata accessor for VoicemailActor();
  swift_retain_n(a1, 2);
  swift_bridgeObjectRetain(v13);
  inited = swift_initStaticObject(v15, &unk_100091088);
  v17 = sub_1000316E0((unint64_t *)&qword_1000916E0, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
  v18 = (_QWORD *)swift_allocObject(a4, 48, 7);
  v18[2] = inited;
  v18[3] = v17;
  v18[4] = a1;
  v18[5] = v13;
  v19 = sub_100051774((uint64_t)v11, a5, (uint64_t)v18);
  swift_release(a1);
  swift_bridgeObjectRelease(v13);
  return swift_release(v19);
}

uint64_t sub_100048130(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  _QWORD *v8;

  v7 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v7, &unk_100091088);
  v8 = (_QWORD *)swift_task_alloc(dword_100091ABC);
  *(_QWORD *)(v5 + 16) = v8;
  *v8 = v5;
  v8[1] = sub_1000399C8;
  return sub_100045F08(a5);
}

uint64_t sub_1000481AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  _QWORD *v8;

  v7 = type metadata accessor for VoicemailActor();
  swift_initStaticObject(v7, &unk_100091088);
  v8 = (_QWORD *)swift_task_alloc(dword_100091A94);
  *(_QWORD *)(v5 + 16) = v8;
  *v8 = v5;
  v8[1] = sub_1000399C8;
  return sub_100046DB4(a5);
}

uint64_t sub_10004822C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc(dword_100091A84);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_1000399C8;
  return sub_1000481AC(a1, v4, v5, v7, v6);
}

uint64_t sub_1000482A4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc(a3[1]);
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_1000399C8;
  return v6();
}

uint64_t sub_1000482F8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc(a4[1]);
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_1000399C8;
  return v7();
}

uint64_t sub_10004834C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v19[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_1000492AC(a1);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v15 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v16 = swift_allocObject(&unk_10007E858, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0;
    v19[1] = 0;
    v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }
  else
  {
    v17 = 0;
  }
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_100091B18, v16);
}

uint64_t sub_100048490(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1000484F4;
  return v6(a1);
}

uint64_t sub_1000484F4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_100048540(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = v1;
  v4 = *(_QWORD *)(v2 + 40);
  v5 = type metadata accessor for TPTipsHelper.Entry.Kind(0);
  v6 = sub_1000316E0(&qword_100091178, (uint64_t (*)(uint64_t))&type metadata accessor for TPTipsHelper.Entry.Kind, (uint64_t)&protocol conformance descriptor for TPTipsHelper.Entry.Kind);
  v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, v6);
  return sub_100048640(a1, v7);
}

unint64_t sub_1000485AC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = NSObject._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100048780(a1, v4);
}

unint64_t sub_1000485DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100048888(a1, a2, v5);
}

unint64_t sub_100048640(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  uint64_t v14;
  char v15;
  uint64_t v17;
  uint64_t v18;

  v3 = v2;
  v18 = a1;
  v5 = type metadata accessor for TPTipsHelper.Entry.Kind(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      v14 = sub_1000316E0(&qword_100091CE0, (uint64_t (*)(uint64_t))&type metadata accessor for TPTipsHelper.Entry.Kind, (uint64_t)&protocol conformance descriptor for TPTipsHelper.Entry.Kind);
      v15 = dispatch thunk of static Equatable.== infix(_:_:)(v8, v18, v5, v14);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v15 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t sub_100048780(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    type metadata accessor for MessageID(0);
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = static NSObject.== infix(_:_:)();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = static NSObject.== infix(_:_:)();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_100048888(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = v10[1];
    v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0) & 1) == 0)
    {
      v13 = ~v5;
      do
      {
        v6 = (v6 + 1) & v13;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v14 = (_QWORD *)(v9 + 16 * v6);
        v15 = v14[1];
        v16 = *v14 == a1 && v15 == a2;
      }
      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0) & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100048968(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1000489FC(a1, a2, a3, (_QWORD *)*v3, &qword_1000915D0, &qword_1000915D8);
  *v3 = result;
  return result;
}

uint64_t sub_100048994(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_100048B88(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_1000489B0(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_100048D10(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1000489CC(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_100048E7C(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_1000489E8(char a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_1000489FC(a1, a2, a3, a4, &qword_100091598, &qword_100091588);
}

uint64_t sub_1000489FC(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (v12)
  {
    v13 = sub_100031408(a5);
    v14 = (_QWORD *)swift_allocObject(v13, 16 * v12 + 32, 7);
    v15 = j__malloc_size(v14);
    v16 = v15 - 32;
    if (v15 < 32)
      v16 = v15 - 17;
    v14[2] = v11;
    v14[3] = 2 * (v16 >> 4);
  }
  else
  {
    v14 = _swiftEmptyArrayStorage;
  }
  v17 = (unint64_t)(v14 + 4);
  v18 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v14 != a4 || v17 >= v18 + 16 * v11)
      memmove(v14 + 4, a4 + 4, 16 * v11);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v18 >= v17 + 16 * v11 || v17 >= v18 + 16 * v11)
  {
    v21 = sub_100031408(a6);
    swift_arrayInitWithCopy(v14 + 4, a4 + 4, v11, v21);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v14;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100048B88(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100031408(&qword_100091CD8);
    v11 = (_QWORD *)swift_allocObject(v10, 8 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 25;
    v11[2] = v8;
    v11[3] = 2 * (v13 >> 3);
  }
  else
  {
    v11 = _swiftEmptyArrayStorage;
  }
  v14 = (unint64_t)(v11 + 4);
  v15 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= v15 + 8 * v8)
      memmove(v11 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v15 >= v14 + 8 * v8 || v14 >= v15 + 8 * v8)
  {
    v18 = sub_100031408(&qword_1000915C0);
    swift_arrayInitWithCopy(v11 + 4, a4 + 4, v8, v18);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100048D10(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100031408(&qword_100091CD0);
    v11 = (char *)swift_allocObject(v10, 32 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 1;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 5);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[32 * v8])
      memmove(v14, v15, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[32 * v8] || v14 >= &v15[32 * v8])
  {
    swift_arrayInitWithCopy(v14, v15, v8, (char *)&type metadata for Any + 8);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100048E7C(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v15 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_100031408(&qword_100091AA0);
  v11 = *(_QWORD *)(type metadata accessor for UUID(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
    goto LABEL_34;
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = type metadata accessor for UUID(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v15 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v15 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v21, v22, v8, v18);
    }
    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v8;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy(v21, v22, v8, v18);
LABEL_32:
    swift_release(a4);
    return (uint64_t)v15;
  }
LABEL_36:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100049060(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc(dword_100091AAC);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_1000399C8;
  return sub_100048130(a1, v4, v5, v7, v6);
}

uint64_t sub_1000490DC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc(dword_100091AC4);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_100030A5C;
  return sub_100047F5C(a1, v4, v5, v7, v6);
}

uint64_t sub_100049158()
{
  _QWORD *v0;

  swift_unknownObjectRelease(v0[2]);
  swift_release(v0[4]);
  swift_bridgeObjectRelease(v0[5]);
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10004918C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc(dword_100091ADC);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_1000399C8;
  return sub_100047EE0(a1, v4, v5, v7, v6);
}

uint64_t sub_100049204()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  _Block_release(*(const void **)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100049238()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_100091AF4);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1000399C8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100091AF0 + dword_100091AF0))(v2, v3, v4);
}

uint64_t sub_1000492AC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100031408(&qword_100091120);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000492EC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100049310(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100091B14);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1000399C8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100091B10 + dword_100091B10))(a1, v4);
}

uint64_t sub_100049380()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000493A8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_100091B24);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1000399C8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100091B20 + dword_100091B20))(v2, v3, v4);
}

uint64_t sub_100049420()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_100091B44);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1000399C8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100091B40 + dword_100091B40))(v2, v3, v4);
}

uint64_t sub_100049498()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_100091B64);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1000399C8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100091B60 + dword_100091B60))(v2, v3, v4);
}

uint64_t sub_100049510()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_100091B84);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1000399C8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100091B80 + dword_100091B80))(v2, v3, v4);
}

uint64_t sub_100049584()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000495AC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for Logger(0, a2) - 8) + 80);
  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = (uint64_t)v2 + ((v5 + 40) & ~v5);
  v10 = (_QWORD *)swift_task_alloc(dword_100091BA4);
  *(_QWORD *)(v3 + 16) = v10;
  *v10 = v3;
  v10[1] = sub_1000399C8;
  return sub_10004463C(a1, v6, v7, v8, v9);
}

uint64_t sub_100049644(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = type metadata accessor for Logger(0, a2);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = (v5 + 40) & ~v5;
  v7 = v6 + *(_QWORD *)(v4 + 64);
  v8 = v5 | 7;
  swift_unknownObjectRelease(*(_QWORD *)(v2 + 16));
  swift_release(*(_QWORD *)(v2 + 32));
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2 + v6, v3);
  return swift_deallocObject(v2, v7, v8);
}

uint64_t sub_1000496C0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for Logger(0, a2) - 8) + 80);
  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = (uint64_t)v2 + ((v5 + 40) & ~v5);
  v10 = (_QWORD *)swift_task_alloc(dword_100091BB4);
  *(_QWORD *)(v3 + 16) = v10;
  *v10 = v3;
  v10[1] = sub_1000399C8;
  return sub_100044250(a1, v6, v7, v8, v9);
}

uint64_t sub_100049758(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v5 = *(_QWORD *)(type metadata accessor for Logger(0, a2) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = v2[2];
  v8 = v2[3];
  v9 = v2[4];
  v10 = (uint64_t)v2 + v6;
  v11 = *(_QWORD *)((char *)v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8));
  v12 = (_QWORD *)swift_task_alloc(dword_100091BC4);
  *(_QWORD *)(v3 + 16) = v12;
  *v12 = v3;
  v12[1] = sub_1000399C8;
  return sub_100043B28(a1, v7, v8, v9, v10, v11);
}

uint64_t sub_100049808(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v5 = *(_QWORD *)(type metadata accessor for Logger(0, a2) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = v2[2];
  v8 = v2[3];
  v9 = v2[4];
  v10 = (uint64_t)v2 + v6;
  v11 = *(_QWORD *)((char *)v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8));
  v12 = (_QWORD *)swift_task_alloc(dword_100091BD4);
  *(_QWORD *)(v3 + 16) = v12;
  *v12 = v3;
  v12[1] = sub_1000399C8;
  return sub_1000433F0(a1, v7, v8, v9, v10, v11);
}

uint64_t sub_1000498B8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v5 = *(_QWORD *)(type metadata accessor for Logger(0, a2) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = v2[2];
  v8 = v2[3];
  v9 = v2[4];
  v10 = (uint64_t)v2 + v6;
  v11 = *(_QWORD *)((char *)v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8));
  v12 = (_QWORD *)swift_task_alloc(dword_100091BEC);
  *(_QWORD *)(v3 + 16) = v12;
  *v12 = v3;
  v12[1] = sub_1000399C8;
  return sub_100042CB8(a1, v7, v8, v9, v10, v11);
}

uint64_t sub_100049968(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v3 = type metadata accessor for Logger(0, a2);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = (v5 + 40) & ~v5;
  v7 = v5 | 7;
  v8 = (*(_QWORD *)(v4 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease(*(_QWORD *)(v2 + 16));
  swift_release(*(_QWORD *)(v2 + 32));
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2 + v6, v3);
  swift_bridgeObjectRelease(*(_QWORD *)(v2 + v8));
  return swift_deallocObject(v2, v8 + 8, v7);
}

uint64_t sub_100049A00(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v5 = *(_QWORD *)(type metadata accessor for Logger(0, a2) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = v2[2];
  v8 = v2[3];
  v9 = v2[4];
  v10 = (uint64_t)v2 + v6;
  v11 = *(_QWORD *)((char *)v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8));
  v12 = (_QWORD *)swift_task_alloc(dword_100091BFC);
  *(_QWORD *)(v3 + 16) = v12;
  *v12 = v3;
  v12[1] = sub_1000399C8;
  return sub_100041CC4(a1, v7, v8, v9, v10, v11);
}

uint64_t sub_100049AAC(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

unint64_t sub_100049AB4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100091C40;
  if (!qword_100091C40)
  {
    v1 = sub_100031634(&qword_100091C38);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100091C40);
  }
  return result;
}

uint64_t sub_100049B04(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc(dword_100091C54);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1000399C8;
  return sub_100041908(a1, v4, v5, v6);
}

uint64_t sub_100049B70(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc(dword_100091C64);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1000399C8;
  return sub_1000401C8(a1, v1);
}

uint64_t sub_100049BC8()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100049BF4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc(dword_100091C8C);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_100030A5C;
  return sub_1000402D4(a1, v4, v5, v6);
}

uint64_t sub_100049C60()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100049C88()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100049CBC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_100091CA4);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1000399C8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100091CA0 + dword_100091CA0))(v2, v3, v4);
}

uint64_t sub_100049D30()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(*(_QWORD *)(v0 + 16));
}

uint64_t sub_100049D38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100049D48(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100049D50(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_100049D9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t result;
  uint64_t v14;
  _QWORD *v15;

  v0 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for OS_dispatch_queue_serial.Attributes(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004A158();
  static DispatchQoS.userInteractive.getter();
  v15 = _swiftEmptyArrayStorage;
  v10 = sub_10004A194(&qword_100091DB0, 255, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue_serial.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue_serial.Attributes);
  v11 = sub_100031408(&qword_100091DB8);
  v12 = sub_10004A1D4();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v15, v11, v12, v4, v10);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v0);
  result = OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD000000000000021, 0x8000000100061E80, v9, v6, v3, 0);
  qword_100092E48 = result;
  return result;
}

uint64_t sub_100049F68()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for VoicemailActor()
{
  return objc_opt_self(_TtC9IntentsUI14VoicemailActor);
}

uint64_t sub_100049F98()
{
  if (qword_100091058 != -1)
    swift_once(&qword_100091058, sub_100049D9C);
  return OS_dispatch_queue_serial_executor.asUnownedSerialExecutor()();
}

uint64_t sub_100049FE4()
{
  uint64_t v0;

  return swift_initStaticObject(v0, &unk_100091088);
}

uint64_t sub_100049FF4()
{
  uint64_t v0;

  return static GlobalActor.sharedUnownedExecutor.getter(v0);
}

id sub_10004A038()
{
  if (qword_100091058 != -1)
    swift_once(&qword_100091058, sub_100049D9C);
  qword_100092E50 = qword_100092E48;
  return (id)qword_100092E48;
}

id sub_10004A09C(uint64_t a1, uint64_t a2, _QWORD *a3, id *a4, uint64_t a5)
{
  if (*a3 != -1)
    swift_once(a3, a5);
  return *a4;
}

id sub_10004A0D8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VoicemailQueueManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for VoicemailQueueManager()
{
  return objc_opt_self(MPVoicemailQueueManager);
}

uint64_t sub_10004A12C(uint64_t a1, uint64_t a2)
{
  return sub_10004A194((unint64_t *)&qword_1000916E0, a2, (uint64_t (*)(uint64_t))type metadata accessor for VoicemailActor, (uint64_t)&unk_100075CA8);
}

unint64_t sub_10004A158()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100091DA8;
  if (!qword_100091DA8)
  {
    v1 = objc_opt_self(OS_dispatch_queue_serial);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100091DA8);
  }
  return result;
}

uint64_t sub_10004A194(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10004A1D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100091DC0;
  if (!qword_100091DC0)
  {
    v1 = sub_100031634(&qword_100091DB8);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100091DC0);
  }
  return result;
}

uint64_t sub_10004A38C()
{
  return type metadata accessor for FTTranscriptionMessage(0);
}

uint64_t type metadata accessor for FTTranscriptionMessage(uint64_t a1)
{
  return sub_10003FCA8(a1, (uint64_t *)&unk_100091E00, (uint64_t)&nominal type descriptor for FTTranscriptionMessage);
}

uint64_t sub_10004A3A8(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v4;
  _QWORD v5[3];

  result = type metadata accessor for Transcript(319, a2);
  if (v4 <= 0x3F)
  {
    v5[0] = *(_QWORD *)(result - 8) + 64;
    v5[1] = (char *)&value witness table for Builtin.Int64 + 64;
    v5[2] = (char *)&value witness table for Builtin.Int64 + 64;
    result = swift_updateClassMetadata2(a1, 256, 3, v5, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

BOOL sub_10004A540(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10004A554()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10004A598()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10004A5C0(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_10004A8D0()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;
  Swift::String v3;
  void *object;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  LOWORD(result) = ((uint64_t (*)(void))dispatch thunk of Message.messageType.getter)();
  if ((unsigned __int16)result < 3u)
    return (unsigned __int16)result;
  _StringGuts.grow(_:)(23);
  v1 = swift_bridgeObjectRelease(0xE000000000000000);
  v6 = 0xD000000000000015;
  v7 = 0x8000000100062680;
  v2 = dispatch thunk of Message.messageType.getter(v1);
  HIWORD(v5) = MessageType.rawValue.getter(v2);
  v3._countAndFlagsBits = String.init<A>(reflecting:)((char *)&v5 + 6, &type metadata for Int16);
  object = v3._object;
  String.append(_:)(v3);
  swift_bridgeObjectRelease(object);
  LODWORD(v5) = 0;
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v6, v7, "IntentsUI/FTMessage.swift", 25, 2, 84, v5);
  __break(1u);
  return result;
}

id sub_10004AA88(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  NSString v9;

  swift_retain(a1);
  a4(a3);
  v8 = v7;
  swift_release(a1);
  if (v8)
  {
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v8);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

uint64_t sub_10004AAFC(SEL *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSString v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;

  if ((dispatch thunk of Message.isFromUnknown.getter(a1) & 1) != 0)
    return 0;
  dispatch thunk of Message.from.getter();
  v3 = v2;
  v4 = (void *)objc_opt_self(TUHandle);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  v6 = objc_msgSend(v4, "normalizedHandleWithDestinationID:", v5);

  if (!v6)
    return 0;
  v7 = objc_msgSend(v6, *a1);
  if (!v7)
  {

    return 0;
  }
  v8 = v7;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);

  return v9;
}

uint64_t sub_10004AC00(SEL *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSString v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;

  dispatch thunk of Message.recipient.getter();
  if (!v2)
    return 0;
  v3 = v2;
  v4 = (void *)objc_opt_self(TUHandle);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  v6 = objc_msgSend(v4, "normalizedHandleWithDestinationID:", v5);

  if (!v6)
    return 0;
  v7 = objc_msgSend(v6, *a1);
  if (!v7)
  {

    return 0;
  }
  v8 = v7;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);

  return v9;
}

uint64_t sub_10004AD44()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t result;

  if (*(_BYTE *)(v0 + 32) != 1)
    return *(_QWORD *)(v0 + 24);
  v1 = (unsigned __int16)dispatch thunk of Message.mailboxType.getter();
  v2 = 1;
  if (v1 == 2)
    v2 = 2;
  if (v1 == 1)
    result = 3;
  else
    result = v2;
  *(_QWORD *)(v0 + 24) = result;
  *(_BYTE *)(v0 + 32) = 0;
  return result;
}

uint64_t sub_10004ADD4()
{
  uint64_t v0;
  int v2;
  uint64_t v3;

  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC9IntentsUI9FTMessage_isDirty) == 1)
    return sub_10004AD44();
  v2 = (unsigned __int16)dispatch thunk of Message.mailboxType.getter();
  v3 = 1;
  if (v2 == 2)
    v3 = 2;
  if (v2 == 1)
    return 3;
  else
    return v3;
}

uint64_t sub_10004AE4C()
{
  uint64_t v0;
  int v1;
  char v2;

  v1 = *(unsigned __int8 *)(v0 + 33);
  if (v1 == 2)
  {
    v2 = dispatch thunk of Message.isRead.getter();
    *(_BYTE *)(v0 + 33) = v2 & 1;
  }
  else
  {
    v2 = v1 & 1;
  }
  return v2 & 1;
}

void sub_10004AFBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v1 = sub_100031408(&qword_1000918B8);
  __chkstk_darwin(v1);
  v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100031408(&qword_100091BE0);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_10004B1F4(v5);
  if (v8 == 2
    && (v8 = dispatch thunk of Message.isRTT.getter(), (v8 & 1) != 0)
    && (v8 = TUCallScreeningRTTEnabled(0, v9), (_DWORD)v8))
  {
    if (*(_BYTE *)(v0 + OBJC_IVAR____TtC9IntentsUI9FTMessage_didLoadTranscript) == 1)
    {
      v10 = sub_10004B3E0();
      if (v10)
      {
        v11 = objc_opt_self(MPRTTTranscriptionMessage);
        v12 = (void *)swift_dynamicCastObjCClass(v10, v11);
        if (v12)
        {
          v13 = objc_msgSend(v12, "conversation");
          swift_unknownObjectRelease(v10);
          if (v13)
          {
            v14 = objc_msgSend(v13, "utterances");

            if (v14)
            {
              objc_msgSend(v14, "count");

            }
            else
            {
              __break(1u);
            }
          }
        }
        else
        {
          swift_unknownObjectRelease(v10);
        }
      }
    }
  }
  else
  {
    v15 = sub_10004B1F4(v8);
    if (v15)
    {
      if (v15 == 1)
        return;
      sub_10004B44C((uint64_t)v7);
      v20 = type metadata accessor for Transcript(0, v19);
      (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 48))(v7, 1, v20);
      v17 = &qword_100091BE0;
      v18 = (uint64_t)v7;
    }
    else
    {
      sub_10004BB48(&OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcriptURL, (uint64_t (*)(uint64_t))&dispatch thunk of Message.sandboxTranscriptFile.getter, (uint64_t)v3);
      v16 = type metadata accessor for URL(0);
      (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 48))(v3, 1, v16);
      v17 = &qword_1000918B8;
      v18 = (uint64_t)v3;
    }
    sub_100031760(v18, v17);
  }
}

uint64_t sub_10004B1F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unsigned __int16 v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = v1;
  v3 = dispatch thunk of Message.messageType.getter(a1);
  if (v3 < 3u)
    return 0x10002u >> (8 * v3);
  if (qword_100091070 != -1)
    swift_once(&qword_100091070, sub_1000516C4);
  v6 = type metadata accessor for Logger(0, v4);
  sub_100030760(v6, (uint64_t)qword_100092E90);
  v7 = swift_retain_n(v1, 2);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = swift_slowAlloc(32, -1);
    v16 = v11;
    *(_DWORD *)v10 = 136446210;
    LOWORD(v15) = dispatch thunk of Message.messageType.getter(v11);
    v12 = String.init<A>(describing:)(&v15, &type metadata for MessageType);
    v14 = v13;
    v15 = sub_10004DF18(v12, v13, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v10 + 4, v10 + 12);
    swift_release_n(v2, 2);
    swift_bridgeObjectRelease(v14);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Unexpected Message type %{public}s", v10, 0xCu);
    swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);

  }
  else
  {

    swift_release_n(v1, 2);
  }
  return 0;
}

uint64_t sub_10004B3E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcript;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcript);
  v3 = v2;
  if (v2 == 1)
  {
    v3 = (uint64_t)sub_10004C1FC(v0);
    v4 = *(_QWORD *)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v3;
    swift_unknownObjectRetain(v3);
    sub_10004E594(v4);
  }
  sub_10004E5A4(v2);
  return v3;
}

uint64_t sub_10004B44C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v14[24];
  _BYTE v15[24];

  v3 = sub_100031408(&qword_100091FA8);
  v4 = __chkstk_darwin(v3);
  v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  v8 = &v14[-v7];
  v9 = v1 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcriptData;
  swift_beginAccess(v1 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcriptData, v15, 0, 0);
  sub_10004E5F8(v9, (uint64_t)v8, &qword_100091FA8);
  v10 = sub_100031408(&qword_100091BE0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
    return sub_10004E680((uint64_t)v8, a1, &qword_100091BE0);
  v12 = sub_100031760((uint64_t)v8, &qword_100091FA8);
  dispatch thunk of Message.transcript.getter(v12);
  sub_10004E5F8(a1, (uint64_t)v6, &qword_100091BE0);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  swift_beginAccess(v9, v14, 33, 0);
  sub_10004E63C((uint64_t)v6, v9, &qword_100091FA8);
  return swift_endAccess(v14);
}

uint64_t sub_10004B698()
{
  uint64_t v0;
  int v1;
  uint64_t result;

  v1 = *(unsigned __int8 *)(v0 + 34);
  if (v1 != 2)
    return v1 & 1;
  result = 0;
  *(_BYTE *)(v0 + 34) = 0;
  return result;
}

uint64_t sub_10004B7A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[24];
  char v31[24];

  v3 = sub_100031408(&qword_1000918B8);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v28 - v8;
  v10 = sub_100031408(&qword_100091FB0);
  v11 = __chkstk_darwin(v10);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v28 - v14;
  v16 = v1 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___dataURL;
  swift_beginAccess(v1 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___dataURL, v31, 0, 0);
  sub_10004E5F8(v16, (uint64_t)v15, &qword_100091FB0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v15, 1, v3) == 1)
  {
    v17 = sub_100031760((uint64_t)v15, &qword_100091FB0);
    v18 = (void *)dispatch thunk of Message.sandboxMessageFile.getter(v17);
    v19 = (void *)dispatch thunk of SandboxExtendedURL.sandboxResolvedURL.getter();

    if (v19)
    {
      v29 = a1;
      v20 = type metadata accessor for URL(0);
      v21 = *(_QWORD *)(v20 - 8);
      v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
      v22(v7, 1, 1, v20);
      v23 = sub_1000316E0(&qword_100091FB8, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
      dispatch thunk of static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:)(v19, v7, v20, v23);

      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v7, 1, v20) == 1)
      {
        v24 = v9;
        v25 = 1;
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v9, v7, v20);
        v24 = v9;
        v25 = 0;
      }
      v22(v24, v25, 1, v20);
      a1 = v29;
    }
    else
    {
      v26 = type metadata accessor for URL(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v9, 1, 1, v26);
    }
    sub_10004E5F8((uint64_t)v9, (uint64_t)v13, &qword_1000918B8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v13, 0, 1, v3);
    swift_beginAccess(v16, v30, 33, 0);
    sub_10004E63C((uint64_t)v13, v16, &qword_100091FB0);
    swift_endAccess(v30);
  }
  else
  {
    v9 = v15;
  }
  return sub_10004E680((uint64_t)v9, a1, &qword_1000918B8);
}

uint64_t sub_10004BB48@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  int v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[24];
  char v37[24];

  v35 = a3;
  v6 = sub_100031408(&qword_1000918B8);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v34 - v11;
  v13 = sub_100031408(&qword_100091FB0);
  v14 = __chkstk_darwin(v13);
  v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v18 = (char *)&v34 - v17;
  v19 = v3 + *a1;
  swift_beginAccess(v19, v37, 0, 0);
  sub_10004E5F8(v19, (uint64_t)v18, &qword_100091FB0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v18, 1, v6) == 1)
  {
    v20 = sub_100031760((uint64_t)v18, &qword_100091FB0);
    v21 = a2(v20);
    if (v21
      && (v22 = (void *)v21,
          v23 = (void *)dispatch thunk of SandboxExtendedURL.sandboxResolvedURL.getter(),
          v22,
          v23))
    {
      v24 = type metadata accessor for URL(0);
      v25 = *(_QWORD *)(v24 - 8);
      v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56);
      v26(v10, 1, 1, v24);
      v27 = sub_1000316E0(&qword_100091FB8, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
      dispatch thunk of static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:)(v23, v10, v24, v27);

      v28 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48))(v10, 1, v24);
      v29 = v35;
      if (v28 == 1)
      {
        v30 = v12;
        v31 = 1;
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v12, v10, v24);
        v30 = v12;
        v31 = 0;
      }
      v26(v30, v31, 1, v24);
    }
    else
    {
      v32 = type metadata accessor for URL(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v12, 1, 1, v32);
      v29 = v35;
    }
    sub_10004E5F8((uint64_t)v12, (uint64_t)v16, &qword_1000918B8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v16, 0, 1, v6);
    swift_beginAccess(v19, v36, 33, 0);
    sub_10004E63C((uint64_t)v16, v19, &qword_100091FB0);
    swift_endAccess(v36);
  }
  else
  {
    v12 = v18;
    v29 = v35;
  }
  return sub_10004E680((uint64_t)v12, v29, &qword_1000918B8);
}

uint64_t sub_10004BE20(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v19[24];

  v7 = sub_100031408(&qword_100091FB0);
  __chkstk_darwin(v7);
  v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v10 = sub_100031408(&qword_1000918B8);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = &v19[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v14 = type metadata accessor for URL(0);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 0, 1, v14);
  }
  else
  {
    v15 = type metadata accessor for URL(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v13, 1, 1, v15);
  }
  sub_10004E680((uint64_t)v13, (uint64_t)v9, &qword_1000918B8);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  v16 = a1 + *a4;
  swift_beginAccess(v16, v19, 33, 0);
  swift_retain(a1);
  sub_10004E63C((uint64_t)v9, v16, &qword_100091FB0);
  swift_endAccess(v19);
  return swift_release(a1);
}

uint64_t sub_10004BFAC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5;

  v5 = swift_retain(a1);
  LOBYTE(a3) = a3(v5);
  swift_release(a1);
  return a3 & 1;
}

uint64_t sub_10004BFFC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5;

  v5 = swift_retain(a1);
  LOBYTE(a3) = a3(v5);
  swift_release(a1);
  return a3 & 1;
}

id sub_10004C034()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSString v11;
  uint64_t v13;

  v0 = sub_100031408(&qword_1000918B8);
  __chkstk_darwin(v0);
  v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for URL(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004B7A4((uint64_t)v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_100031760((uint64_t)v2, &qword_1000918B8);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
    v8 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
    URL.path.getter();
    v10 = v9;
    v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v10);
    v7 = objc_msgSend(v8, "fileExistsAtPath:", v11);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return v7;
}

id sub_10004C1FC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  int v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  Class isa;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  void (*v33)(char *, char *, uint64_t);
  char *v34;
  objc_class *v35;
  char *v36;
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  objc_class *v44;
  char *v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  objc_super v53;
  objc_super v54;

  v51 = sub_100031408(&qword_1000918B8);
  v2 = __chkstk_darwin(v51);
  __chkstk_darwin(v2);
  v4 = (char *)&v46 - v3;
  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100031408(&qword_100091BE0);
  __chkstk_darwin(v9);
  v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Transcript(0, v12);
  v49 = *(_QWORD *)(v13 - 8);
  v50 = v13;
  v14 = __chkstk_darwin(v13);
  v48 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v47 = (char *)&v46 - v16;
  v17 = type metadata accessor for UUID(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = __chkstk_darwin(v17);
  v21 = (char *)&v46 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = a1;
  v22 = sub_10004B1F4(v19);
  if (v22)
  {
    v23 = 0;
    v24 = v52;
    if (v22 != 1)
    {
      if ((dispatch thunk of Message.isRTT.getter() & 1) != 0
        && (v26 = TUCallScreeningRTTEnabled(0, v25), (_DWORD)v26))
      {
        dispatch thunk of Message.callUUID.getter(v26);
        v27 = objc_allocWithZone((Class)MPRTTTranscriptionMessage);
        isa = UUID._bridgeToObjectiveC()().super.isa;
        v23 = objc_msgSend(v27, "initWithCallUUID:", isa);

        (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
      }
      else
      {
        sub_10004B44C((uint64_t)v11);
        v30 = v49;
        v29 = v50;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48))(v11, 1, v50) == 1)
        {
          sub_100031760((uint64_t)v11, &qword_100091BE0);
          v23 = 0;
        }
        else
        {
          v32 = v47;
          (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v47, v11, v29);
          v33 = *(void (**)(char *, char *, uint64_t))(v30 + 16);
          v34 = v48;
          v33(v48, v32, v29);
          v35 = (objc_class *)type metadata accessor for FTTranscriptionMessage(0);
          v36 = (char *)objc_allocWithZone(v35);
          *(_QWORD *)&v36[OBJC_IVAR____TtC9IntentsUI22FTTranscriptionMessage_confidenceRating] = 0;
          *(_QWORD *)&v36[OBJC_IVAR____TtC9IntentsUI22FTTranscriptionMessage_confidence] = 0x3FF0000000000000;
          v33(&v36[OBJC_IVAR____TtC9IntentsUI22FTTranscriptionMessage_transcriptData], v34, v29);
          v53.receiver = v36;
          v53.super_class = v35;
          v23 = objc_msgSendSuper2(&v53, "init");
          v37 = *(void (**)(char *, uint64_t))(v30 + 8);
          v37(v34, v29);
          v37(v32, v29);
        }
      }
    }
  }
  else
  {
    sub_10004BB48(&OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcriptURL, (uint64_t (*)(uint64_t))&dispatch thunk of Message.sandboxTranscriptFile.getter, (uint64_t)v4);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    {
      sub_100031760((uint64_t)v4, &qword_1000918B8);
      v23 = 0;
      v24 = v52;
    }
    else
    {
      v31 = v8;
      (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
      v38 = Data.init(contentsOf:options:)(v8, 0);
      v40 = v39;
      sub_100049D50(0, &qword_100091F98, NSKeyedUnarchiver_ptr);
      v41 = sub_100049D50(0, &qword_100091FA0, VMVoicemailTranscript_ptr);
      v42 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)(v41, v38, v40, v41);
      v24 = v52;
      v23 = (id)v42;
      if (v42)
      {
        v44 = (objc_class *)type metadata accessor for VisualTranscriptionMessage();
        v45 = (char *)objc_allocWithZone(v44);
        *(_QWORD *)&v45[OBJC_IVAR___MPVisualTranscriptionMessage_vmTranscript] = v23;
        v54.receiver = v45;
        v54.super_class = v44;
        v23 = objc_msgSendSuper2(&v54, "init");
        sub_10004E5B4(v38, v40);
        (*(void (**)(char *, uint64_t))(v6 + 8))(v31, v5);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v6 + 8))(v31, v5);
        sub_10004E5B4(v38, v40);
      }
    }
  }
  *(_BYTE *)(v24 + OBJC_IVAR____TtC9IntentsUI9FTMessage_didLoadTranscript) = 1;
  return v23;
}

uint64_t sub_10004C8F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v1 + 24) = 0;
  *(_BYTE *)(v1 + 32) = 1;
  *(_WORD *)(v1 + 33) = 514;
  v3 = v1 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___dataURL;
  v4 = sub_100031408(&qword_1000918B8);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56);
  v5(v3, 1, 1, v4);
  v5(v1 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___thumbnailURL, 1, 1, v4);
  v5(v1 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcriptURL, 1, 1, v4);
  v6 = v1 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcriptData;
  v7 = sub_100031408(&qword_100091BE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcript) = 1;
  *(_BYTE *)(v1 + OBJC_IVAR____TtC9IntentsUI9FTMessage_didLoadTranscript) = 0;
  *(_BYTE *)(v1 + OBJC_IVAR____TtC9IntentsUI9FTMessage_isDirty) = 0;
  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

uint64_t sub_10004CA04()
{
  id *v0;

  sub_100031760((uint64_t)v0 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___dataURL, &qword_100091FB0);
  sub_100031760((uint64_t)v0 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___thumbnailURL, &qword_100091FB0);
  sub_100031760((uint64_t)v0 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcriptURL, &qword_100091FB0);
  sub_100031760((uint64_t)v0 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcriptData, &qword_100091FA8);
  sub_10004E594(*(uint64_t *)((char *)v0 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcript));
  return swift_deallocClassInstance(v0, *((unsigned int *)*v0 + 12), *((unsigned __int16 *)*v0 + 26));
}

uint64_t sub_10004CAA0()
{
  return type metadata accessor for FTMessage(0);
}

uint64_t type metadata accessor for FTMessage(uint64_t a1)
{
  return sub_10003FCA8(a1, (uint64_t *)&unk_100091E70, (uint64_t)&nominal type descriptor for FTMessage);
}

void sub_10004CABC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[4];
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v6[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v6[1] = "\t";
  v6[2] = &unk_100075D50;
  v6[3] = &unk_100075D50;
  sub_10004CB9C(319, (unint64_t *)&unk_100091E80, &qword_1000918B8);
  if (v3 <= 0x3F)
  {
    v7 = *(_QWORD *)(v2 - 8) + 64;
    v8 = v7;
    v9 = v7;
    sub_10004CB9C(319, qword_100091E90, &qword_100091BE0);
    if (v5 <= 0x3F)
    {
      v10 = *(_QWORD *)(v4 - 8) + 64;
      v11 = &unk_100075D68;
      v12 = &unk_100075D80;
      v13 = &unk_100075D80;
      swift_updateClassMetadata2(a1, 256, 11, v6, a1 + 80);
    }
  }
}

void sub_10004CB9C(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v5 = sub_100031634(a3);
    v6 = type metadata accessor for Optional(a1, v5);
    if (!v7)
      atomic_store(v6, a2);
  }
}

BOOL sub_10004CBE8(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v4;

  if ((*(_BYTE *)(v2 + OBJC_IVAR____TtC9IntentsUI9FTMessage_isDirty) & 1) != 0)
  {
    v4 = sub_10004AE4C();
    if ((v4 & 1) == 0)
      return a2 > 5.0 || dispatch thunk of Message.duration.getter(v4) / 3.0 < a2;
    return 0;
  }
  v4 = dispatch thunk of Message.isRead.getter(a1);
  if ((v4 & 1) != 0)
    return 0;
  return a2 > 5.0 || dispatch thunk of Message.duration.getter(v4) / 3.0 < a2;
}

id sub_10004CCB0(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSString v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString v16;
  Class isa;
  id v18;

  if ((dispatch thunk of Message.isFromUnknown.getter(a1) & 1) != 0)
    return 0;
  ((void (*)(void))dispatch thunk of Message.from.getter)();
  v3 = v2;
  v4 = (void *)objc_opt_self(TUHandle);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  v6 = objc_msgSend(v4, "normalizedHandleWithDestinationID:", v5);

  if (!v6)
    return 0;
  v7 = objc_msgSend(v6, "normalizedValue");
  if (!v7)
  {

    return 0;
  }
  v8 = v7;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  v11 = v10;

  v12 = swift_bridgeObjectRelease(v11);
  v13 = HIBYTE(v11) & 0xF;
  if ((v11 & 0x2000000000000000) == 0)
    v13 = v9 & 0xFFFFFFFFFFFFLL;
  if (!v13)
    return 0;
  dispatch thunk of Message.from.getter(v12);
  v15 = v14;
  v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v15);
  sub_100031408(&qword_1000918B0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  v18 = objc_msgSend(a1, "contactForDestinationId:keysToFetch:", v16, isa);

  return v18;
}

uint64_t sub_10004CE94(void *a1)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;

  v2 = dispatch thunk of Message.from.getter(a1);
  v4 = v3;
  swift_bridgeObjectRelease(v3);
  v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0)
    v5 = v2 & 0xFFFFFFFFFFFFLL;
  if (!v5)
    return 0;
  v6 = sub_100031408((uint64_t *)&unk_100091FC0);
  v7 = swift_allocObject(v6, 40, 7);
  *(_OWORD *)(v7 + 16) = xmmword_100075AB0;
  v8 = (void *)objc_opt_self(CNContactFormatter);
  v9 = objc_msgSend(v8, "descriptorForRequiredKeysForStyle:", 0);
  *(_QWORD *)(v7 + 32) = v9;
  specialized Array._endMutation()(v9);
  v10 = v7;
  v11 = sub_10004CCB0(a1);
  swift_bridgeObjectRelease(v10);
  if (!v11)
    return sub_10004D010();
  if ((objc_msgSend(v11, "isSuggested") & 1) == 0)
  {
    v13 = objc_msgSend(v8, "stringFromContact:style:", v11, 0);
    if (v13)
    {
      v14 = v13;
      v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);

      return v12;
    }

    return 0;
  }
  v12 = sub_10004D010();

  return v12;
}

uint64_t sub_10004D010()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSString v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;

  v0 = (void *)objc_opt_self(TUHandle);
  dispatch thunk of Message.from.getter();
  v2 = v1;
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  v4 = objc_msgSend(v0, "normalizedHandleWithDestinationID:", v3);

  if (!v4)
    return 0;
  v5 = objc_msgSend(v4, "normalizedValue");
  v6 = objc_msgSend(v4, "isoCountryCode");
  v7 = (id)TUFormattedPhoneNumber(v5, v6);

  if (!v7)
  {

    return 0;
  }
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);

  return v8;
}

uint64_t sub_10004D190()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  Swift::String v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  objc_class *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  id v29;
  void (*v30)(char *, uint64_t);
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  Swift::String v35;
  Swift::String v36;
  uint64_t v37;
  Swift::String v38;
  void *object;
  Swift::String v40;
  uint64_t v41;
  Swift::String v42;
  void *v43;
  Swift::String v44;
  Swift::String v45;
  uint64_t v46;
  uint64_t v47;
  Swift::String v48;
  void *v49;
  Swift::String v50;
  uint64_t v51;
  Swift::String v52;
  void *v53;
  Swift::String v54;
  uint64_t v55;
  Swift::String v56;
  void *v57;
  Swift::String v58;
  uint64_t v59;
  Swift::String v60;
  void *v61;
  Swift::String v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  Swift::String v67;
  void *v68;
  Swift::String v69;
  Swift::String v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  Swift::String v75;
  char v76;
  BOOL v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  Swift::String v81;
  uint64_t v82;
  char v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;
  Swift::String v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  Swift::String v92;
  void *v93;
  Swift::String v94;
  char v95;
  BOOL v96;
  uint64_t v97;
  unint64_t v98;
  unint64_t v99;
  Swift::String v100;
  uint64_t v101;
  double v102;
  Swift::String v103;
  Swift::String v104;
  Swift::String v105;
  Swift::String v106;
  Swift::String v107;
  uint64_t v108;
  uint64_t v109;
  int v110;
  unsigned __int16 v111;
  BOOL v112;
  uint64_t v113;
  unint64_t v114;
  unint64_t v115;
  Swift::String v116;
  uint64_t v117;
  int v118;
  unsigned __int16 v119;
  BOOL v120;
  uint64_t v121;
  unint64_t v122;
  unint64_t v123;
  Swift::String v124;
  char v125;
  BOOL v126;
  uint64_t v127;
  unint64_t v128;
  unint64_t v129;
  Swift::String v130;
  char v131;
  BOOL v132;
  uint64_t v133;
  unint64_t v134;
  unint64_t v135;
  Swift::String v136;
  uint64_t v137;
  uint64_t v138;
  Swift::String v139;
  void *v140;
  Swift::String v141;
  Swift::String v142;
  void *v143;
  Swift::String v144;
  Swift::String v145;
  void *v146;
  Swift::String v147;
  uint64_t v148;
  Swift::String v149;
  void *v150;
  Swift::String v151;
  char v152;
  BOOL v153;
  uint64_t v154;
  unint64_t v155;
  unint64_t v156;
  Swift::String v157;
  unsigned __int8 v158;
  BOOL v159;
  uint64_t v160;
  unint64_t v161;
  unint64_t v162;
  Swift::String v163;
  uint64_t v164;
  Swift::String v165;
  void *v166;
  Swift::String v167;
  uint64_t v168;
  unint64_t v169;
  unint64_t v170;
  Swift::String v171;
  uint64_t v172;
  unint64_t v173;
  unint64_t v174;
  Swift::String v175;
  uint64_t v176;
  Swift::String v177;
  id v179;
  uint64_t v180;
  uint64_t v181;
  char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  objc_super v191;
  _QWORD v192[2];

  v1 = v0;
  v188 = sub_100031408(&qword_100091BE0);
  __chkstk_darwin(v188);
  v187 = (uint64_t)&v179 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v186 = sub_100031408(&qword_1000918B8);
  __chkstk_darwin(v186);
  v185 = (uint64_t)&v179 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Date(0);
  v183 = *(_QWORD *)(v4 - 8);
  v184 = v4;
  __chkstk_darwin(v4);
  v182 = (char *)&v179 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v181 = sub_100031408(&qword_100091A98);
  __chkstk_darwin(v181);
  v7 = (char *)&v179 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for UUID(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v179 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v179 - v13;
  v192[0] = 0;
  v192[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(722);
  v15._countAndFlagsBits = 0xD00000000000001ALL;
  v180 = 0xD00000000000001ALL;
  v15._object = (void *)0x80000001000621A0;
  String.append(_:)(v15);
  v16 = *(id *)(v0 + 16);
  v17 = objc_msgSend(v16, "description");
  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
  v20 = v19;

  v21._countAndFlagsBits = v18;
  v21._object = v20;
  String.append(_:)(v21);
  v179 = v16;

  swift_bridgeObjectRelease(v20);
  v22._countAndFlagsBits = 0x3A6469202020200ALL;
  v22._object = (void *)0xE900000000000020;
  String.append(_:)(v22);
  dispatch thunk of Message.recordUUID.getter(v23);
  v24 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v24(v12, v14, v8);
  v25 = (objc_class *)type metadata accessor for MessageID(0);
  v26 = (char *)objc_allocWithZone(v25);
  v27 = &v26[OBJC_IVAR___MPMessageID_value];
  v24(&v26[OBJC_IVAR___MPMessageID_value], v12, v8);
  v28 = type metadata accessor for MessageID.Value(0);
  swift_storeEnumTagMultiPayload(v27, v28, 1);
  v191.receiver = v26;
  v191.super_class = v25;
  v29 = objc_msgSendSuper2(&v191, "init");
  v30 = *(void (**)(char *, uint64_t))(v9 + 8);
  v30(v12, v8);
  v30(v14, v8);
  v31 = objc_msgSend(v29, "description");
  v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(v31);
  v34 = v33;

  v35._countAndFlagsBits = v32;
  v35._object = v34;
  String.append(_:)(v35);

  swift_bridgeObjectRelease(v34);
  v36._countAndFlagsBits = 0x6F7270202020200ALL;
  v36._object = (void *)0xEF203A7265646976;
  String.append(_:)(v36);
  v38._countAndFlagsBits = dispatch thunk of Message.provider.getter(v37);
  object = v38._object;
  String.append(_:)(v38);
  swift_bridgeObjectRelease(object);
  v40._countAndFlagsBits = 0x6C6163202020200ALL;
  v40._object = (void *)0xEF203A444955556CLL;
  String.append(_:)(v40);
  dispatch thunk of Message.callUUID.getter(v41);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
  v42._countAndFlagsBits = String.init<A>(describing:)(v7, v181);
  v43 = v42._object;
  String.append(_:)(v42);
  swift_bridgeObjectRelease(v43);
  v44._countAndFlagsBits = 0xD000000000000012;
  v44._object = (void *)0x80000001000621C0;
  String.append(_:)(v44);
  v189 = sub_10004A8D0();
  _print_unlocked<A, B>(_:_:)(&v189, v192, &type metadata for MessageType, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v45._object = (void *)0x80000001000621E0;
  v45._countAndFlagsBits = v180;
  String.append(_:)(v45);
  v189 = sub_10004AAFC((SEL *)&selRef_normalizedValue);
  v190 = v46;
  v47 = sub_100031408(&qword_100091F70);
  v48._countAndFlagsBits = String.init<A>(describing:)(&v189, v47);
  v49 = v48._object;
  String.append(_:)(v48);
  swift_bridgeObjectRelease(v49);
  v50._countAndFlagsBits = 0xD00000000000001BLL;
  v50._object = (void *)0x8000000100062200;
  String.append(_:)(v50);
  v189 = sub_10004AAFC((SEL *)&selRef_isoCountryCode);
  v190 = v51;
  v52._countAndFlagsBits = String.init<A>(describing:)(&v189, v47);
  v53 = v52._object;
  String.append(_:)(v52);
  swift_bridgeObjectRelease(v53);
  v54._object = (void *)0x8000000100062220;
  v54._countAndFlagsBits = 0xD00000000000001CLL;
  String.append(_:)(v54);
  v189 = sub_10004AC00((SEL *)&selRef_normalizedValue);
  v190 = v55;
  v56._countAndFlagsBits = String.init<A>(describing:)(&v189, v47);
  v57 = v56._object;
  String.append(_:)(v56);
  swift_bridgeObjectRelease(v57);
  v58._countAndFlagsBits = 0xD00000000000001DLL;
  v58._object = (void *)0x8000000100062240;
  String.append(_:)(v58);
  v189 = sub_10004AC00((SEL *)&selRef_isoCountryCode);
  v190 = v59;
  v60._countAndFlagsBits = String.init<A>(describing:)(&v189, v47);
  v61 = v60._object;
  String.append(_:)(v60);
  swift_bridgeObjectRelease(v61);
  v62._object = (void *)0x8000000100062260;
  v62._countAndFlagsBits = 0xD00000000000001CLL;
  String.append(_:)(v62);
  v64 = dispatch thunk of Message.isFromUnknown.getter(v63);
  v65 = 0;
  v66 = 0;
  if ((v64 & 1) == 0)
    v65 = dispatch thunk of Message.from.getter(0);
  v189 = v65;
  v190 = v66;
  v67._countAndFlagsBits = String.init<A>(describing:)(&v189, v47);
  v68 = v67._object;
  String.append(_:)(v67);
  swift_bridgeObjectRelease(v68);
  v69._countAndFlagsBits = 0xD000000000000012;
  v69._object = (void *)0x8000000100062280;
  String.append(_:)(v69);
  v189 = sub_10004AD44();
  _print_unlocked<A, B>(_:_:)(&v189, v192, &type metadata for MessageFolder, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v70._countAndFlagsBits = 0x6C6F66202020200ALL;
  v70._object = (void *)0xED0000203A726564;
  String.append(_:)(v70);
  v71 = OBJC_IVAR____TtC9IntentsUI9FTMessage_isDirty;
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC9IntentsUI9FTMessage_isDirty) == 1)
  {
    v72 = *(_QWORD *)(v1 + 24);
  }
  else
  {
    v73 = (unsigned __int16)dispatch thunk of Message.mailboxType.getter();
    v74 = 1;
    if (v73 == 2)
      v74 = 2;
    v77 = v73 == 1;
    v72 = 3;
    if (!v77)
      v72 = v74;
  }
  v189 = v72;
  _print_unlocked<A, B>(_:_:)(&v189, v192, &type metadata for MessageFolder, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v75._object = (void *)0x80000001000622A0;
  v75._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v75);
  v76 = sub_10004AE4C();
  v77 = (v76 & 1) == 0;
  if ((v76 & 1) != 0)
    v78 = 1702195828;
  else
    v78 = 0x65736C6166;
  if (v77)
    v79 = 0xE500000000000000;
  else
    v79 = 0xE400000000000000;
  v80 = v79;
  String.append(_:)(*(Swift::String *)&v78);
  swift_bridgeObjectRelease(v79);
  v81._countAndFlagsBits = 0x616572202020200ALL;
  v81._object = (void *)0xEB00000000203A64;
  String.append(_:)(v81);
  v83 = *(_BYTE *)(v1 + v71);
  v181 = v71;
  if ((v83 & 1) != 0)
  {
    if ((*(_BYTE *)(v1 + 33) & 1) != 0)
    {
LABEL_17:
      v84 = 0xE400000000000000;
      v85 = 1702195828;
      goto LABEL_20;
    }
  }
  else if ((dispatch thunk of Message.isRead.getter(v82) & 1) != 0)
  {
    goto LABEL_17;
  }
  v84 = 0xE500000000000000;
  v85 = 0x65736C6166;
LABEL_20:
  v86 = v84;
  String.append(_:)(*(Swift::String *)&v85);
  swift_bridgeObjectRelease(v84);
  v87._object = (void *)0xEB00000000203A65;
  v87._countAndFlagsBits = 0x746164202020200ALL;
  String.append(_:)(v87);
  v88 = v182;
  dispatch thunk of Message.dateCreated.getter(v89);
  v90 = sub_1000316E0(&qword_100091F78, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
  v91 = v184;
  v92._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v184, v90);
  v93 = v92._object;
  String.append(_:)(v92);
  swift_bridgeObjectRelease(v93);
  (*(void (**)(char *, uint64_t))(v183 + 8))(v88, v91);
  v94._countAndFlagsBits = 0xD00000000000001FLL;
  v94._object = (void *)0x80000001000622C0;
  String.append(_:)(v94);
  sub_10004AFBC();
  v96 = (v95 & 1) == 0;
  if ((v95 & 1) != 0)
    v97 = 1702195828;
  else
    v97 = 0x65736C6166;
  if (v96)
    v98 = 0xE500000000000000;
  else
    v98 = 0xE400000000000000;
  v99 = v98;
  String.append(_:)(*(Swift::String *)&v97);
  swift_bridgeObjectRelease(v98);
  v100._countAndFlagsBits = 0x727564202020200ALL;
  v100._object = (void *)0xEF203A6E6F697461;
  String.append(_:)(v100);
  v102 = dispatch thunk of Message.duration.getter(v101);
  Double.write<A>(to:)(v192, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation, v102);
  v103._countAndFlagsBits = 0xD00000000000001BLL;
  v103._object = (void *)0x80000001000622E0;
  String.append(_:)(v103);
  v104._countAndFlagsBits = 0x65736C6166;
  v104._object = (void *)0xE500000000000000;
  String.append(_:)(v104);
  v105._object = (void *)0x8000000100062300;
  v105._countAndFlagsBits = 0xD000000000000015;
  String.append(_:)(v105);
  v106._countAndFlagsBits = 0x65736C6166;
  v106._object = (void *)0xE500000000000000;
  String.append(_:)(v106);
  v107._countAndFlagsBits = 0xD00000000000001DLL;
  v107._object = (void *)0x8000000100062320;
  String.append(_:)(v107);
  v109 = dispatch thunk of Message.transcriptionStatus.getter(v108);
  v110 = (unsigned __int16)TranscriptionStatus.rawValue.getter(v109);
  v111 = TranscriptionStatus.rawValue.getter(0);
  v112 = v110 == v111;
  if (v110 == v111)
    v113 = 0x65736C6166;
  else
    v113 = 1702195828;
  if (v112)
    v114 = 0xE500000000000000;
  else
    v114 = 0xE400000000000000;
  v115 = v114;
  String.append(_:)(*(Swift::String *)&v113);
  swift_bridgeObjectRelease(v114);
  v116._object = (void *)0x8000000100062340;
  v116._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v116);
  v117 = dispatch thunk of Message.mailboxType.getter();
  v118 = (unsigned __int16)MailboxType.rawValue.getter(v117);
  v119 = MailboxType.rawValue.getter(1);
  v120 = v118 == v119;
  if (v118 == v119)
    v121 = 1702195828;
  else
    v121 = 0x65736C6166;
  if (v120)
    v122 = 0xE400000000000000;
  else
    v122 = 0xE500000000000000;
  v123 = v122;
  String.append(_:)(*(Swift::String *)&v121);
  swift_bridgeObjectRelease(v122);
  v124._object = (void *)0x8000000100062360;
  v124._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v124);
  v125 = sub_10004B698();
  v126 = (v125 & 1) == 0;
  if ((v125 & 1) != 0)
    v127 = 1702195828;
  else
    v127 = 0x65736C6166;
  if (v126)
    v128 = 0xE500000000000000;
  else
    v128 = 0xE400000000000000;
  v129 = v128;
  String.append(_:)(*(Swift::String *)&v127);
  swift_bridgeObjectRelease(v128);
  v130._countAndFlagsBits = 0xD000000000000012;
  v130._object = (void *)0x8000000100062380;
  String.append(_:)(v130);
  v131 = dispatch thunk of Message.isSensitive.getter();
  v132 = (v131 & 1) == 0;
  if ((v131 & 1) != 0)
    v133 = 1702195828;
  else
    v133 = 0x65736C6166;
  if (v132)
    v134 = 0xE500000000000000;
  else
    v134 = 0xE400000000000000;
  v135 = v134;
  String.append(_:)(*(Swift::String *)&v133);
  swift_bridgeObjectRelease(v134);
  v136._countAndFlagsBits = 0x746164202020200ALL;
  v136._object = (void *)0xEE00203A4C525561;
  String.append(_:)(v136);
  v137 = v185;
  sub_10004B7A4(v185);
  v138 = v186;
  v139._countAndFlagsBits = String.init<A>(describing:)(v137, v186);
  v140 = v139._object;
  String.append(_:)(v139);
  swift_bridgeObjectRelease(v140);
  v141._countAndFlagsBits = 0xD000000000000013;
  v141._object = (void *)0x80000001000623A0;
  String.append(_:)(v141);
  sub_10004BB48(&OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___thumbnailURL, (uint64_t (*)(uint64_t))&dispatch thunk of Message.sandboxThumbnailFile.getter, v137);
  v142._countAndFlagsBits = String.init<A>(describing:)(v137, v138);
  v143 = v142._object;
  String.append(_:)(v142);
  swift_bridgeObjectRelease(v143);
  v144._object = (void *)0x80000001000623C0;
  v144._countAndFlagsBits = 0xD000000000000014;
  String.append(_:)(v144);
  sub_10004BB48(&OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcriptURL, (uint64_t (*)(uint64_t))&dispatch thunk of Message.sandboxTranscriptFile.getter, v137);
  v145._countAndFlagsBits = String.init<A>(describing:)(v137, v138);
  v146 = v145._object;
  String.append(_:)(v145);
  swift_bridgeObjectRelease(v146);
  v147._object = (void *)0x80000001000623E0;
  v147._countAndFlagsBits = 0xD000000000000015;
  String.append(_:)(v147);
  v148 = v187;
  sub_10004B44C(v187);
  v149._countAndFlagsBits = String.init<A>(describing:)(v148, v188);
  v150 = v149._object;
  String.append(_:)(v149);
  swift_bridgeObjectRelease(v150);
  v151._countAndFlagsBits = 0x527369202020200ALL;
  v151._object = (void *)0xEC000000203A5454;
  String.append(_:)(v151);
  v152 = dispatch thunk of Message.isRTT.getter();
  v153 = (v152 & 1) == 0;
  if ((v152 & 1) != 0)
    v154 = 1702195828;
  else
    v154 = 0x65736C6166;
  if (v153)
    v155 = 0xE500000000000000;
  else
    v155 = 0xE400000000000000;
  v156 = v155;
  String.append(_:)(*(Swift::String *)&v154);
  swift_bridgeObjectRelease(v155);
  v157._countAndFlagsBits = 0xD000000000000016;
  v157._object = (void *)0x8000000100062400;
  String.append(_:)(v157);
  v158 = sub_10004C034();
  v159 = (v158 & 1) == 0;
  if ((v158 & 1) != 0)
    v160 = 1702195828;
  else
    v160 = 0x65736C6166;
  if (v159)
    v161 = 0xE500000000000000;
  else
    v161 = 0xE400000000000000;
  v162 = v161;
  String.append(_:)(*(Swift::String *)&v160);
  swift_bridgeObjectRelease(v161);
  v163._countAndFlagsBits = 0xD000000000000011;
  v163._object = (void *)0x8000000100062420;
  String.append(_:)(v163);
  v189 = sub_10004B3E0();
  v164 = sub_100031408(&qword_100091F80);
  v165._countAndFlagsBits = String.init<A>(describing:)(&v189, v164);
  v166 = v165._object;
  String.append(_:)(v165);
  swift_bridgeObjectRelease(v166);
  v167._countAndFlagsBits = 0xD000000000000018;
  v167._object = (void *)0x8000000100062440;
  String.append(_:)(v167);
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC9IntentsUI9FTMessage_didLoadTranscript))
    v168 = 1702195828;
  else
    v168 = 0x65736C6166;
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC9IntentsUI9FTMessage_didLoadTranscript))
    v169 = 0xE400000000000000;
  else
    v169 = 0xE500000000000000;
  v170 = v169;
  String.append(_:)(*(Swift::String *)&v168);
  swift_bridgeObjectRelease(v169);
  v171._countAndFlagsBits = 0x447369202020200ALL;
  v171._object = (void *)0xEE00203A79747269;
  String.append(_:)(v171);
  if (*(_BYTE *)(v1 + v181))
    v172 = 1702195828;
  else
    v172 = 0x65736C6166;
  if (*(_BYTE *)(v1 + v181))
    v173 = 0xE400000000000000;
  else
    v173 = 0xE500000000000000;
  v174 = v173;
  String.append(_:)(*(Swift::String *)&v172);
  swift_bridgeObjectRelease(v173);
  v175._object = (void *)0x8000000100062460;
  v175._countAndFlagsBits = 0xD000000000000014;
  String.append(_:)(v175);
  LOBYTE(v189) = sub_10004B1F4(v176);
  _print_unlocked<A, B>(_:_:)(&v189, v192, &type metadata for FTMessageSource, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v177._countAndFlagsBits = 0x202020202020200ALL;
  v177._object = (void *)0xEA00000000002920;
  String.append(_:)(v177);
  return v192[0];
}

uint64_t sub_10004DEF8()
{
  return sub_10004D190();
}

uint64_t sub_10004DF18(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10004DFE8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10004E558((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_10004E558((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100031614(v12);
  return v7;
}

uint64_t sub_10004DFE8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_10004E1A0(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
}

uint64_t sub_10004E1A0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10004E234(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_10004E40C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10004E40C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10004E234(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_10004E3A8(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return _swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return _swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_10004E3A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return _swiftEmptyArrayStorage;
  v4 = sub_100031408(&qword_100091F88);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10004E40C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100031408(&qword_100091F88);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10004E558(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10004E594(uint64_t result)
{
  if (result != 1)
    return swift_unknownObjectRelease(result);
  return result;
}

uint64_t sub_10004E5A4(uint64_t result)
{
  if (result != 1)
    return swift_unknownObjectRetain(result);
  return result;
}

uint64_t sub_10004E5B4(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10004E5F8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100031408(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10004E63C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100031408(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_10004E680(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100031408(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

_BYTE *initializeBufferWithCopyOfBuffer for FTMessageSource(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FTMessageSource(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FTMessageSource(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_10004E7B0 + 4 * byte_100075CD5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_10004E7E4 + 4 * byte_100075CD0[v4]))();
}

uint64_t sub_10004E7E4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10004E7EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10004E7F4);
  return result;
}

uint64_t sub_10004E800(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10004E808);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_10004E80C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10004E814(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10004E820(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10004E82C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FTMessageSource()
{
  return &type metadata for FTMessageSource;
}

unint64_t sub_10004E848()
{
  unint64_t result;

  result = qword_100091FD0;
  if (!qword_100091FD0)
  {
    result = swift_getWitnessTable(&unk_100075E48, &type metadata for FTMessageSource);
    atomic_store(result, (unint64_t *)&qword_100091FD0);
  }
  return result;
}

unint64_t sub_10004E894@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_10005010C(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

BOOL sub_10004E8C4(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10004E8D8()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10004E91C()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10004E944(uint64_t a1)
{
  Swift::UInt *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t *sub_10004E984@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  BOOL v3;

  v2 = *result;
  v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2)
    v2 = 0;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v3;
  return result;
}

void sub_10004E9A0(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

Swift::Int sub_10004E9AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  Swift::UInt *v8;
  uint64_t v9;
  Swift::UInt v10;
  _QWORD v13[9];

  v1 = v0;
  v2 = type metadata accessor for UUID(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v13[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for MessageID.Value(0);
  __chkstk_darwin(v6);
  v8 = (_QWORD *)((char *)&v13[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  Hasher.init(_seed:)(v13, 0);
  sub_10003D880(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload(v8, v6) == 1)
  {
    (*(void (**)(char *, Swift::UInt *, uint64_t))(v3 + 32))(v5, v8, v2);
    Hasher._combine(_:)(1uLL);
    v9 = sub_1000316E0(&qword_1000920E0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    dispatch thunk of Hashable.hash(into:)(v13, v2, v9);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    v10 = *v8;
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(v10);
  }
  return Hasher._finalize()();
}

BOOL sub_10004EB04(uint64_t a1, uint64_t a2)
{
  return (sub_10004FB94(a2, a1) & 1) == 0;
}

BOOL sub_10004EB2C(uint64_t a1, uint64_t a2)
{
  return (sub_10004FB94(a1, a2) & 1) == 0;
}

uint64_t sub_10004EB48(uint64_t a1, uint64_t a2)
{
  return sub_10004FB94(a2, a1);
}

void sub_10004EB5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  Swift::UInt *v12;
  uint64_t v13;
  Swift::UInt v14;
  uint64_t v15;

  v4 = v2;
  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (Swift::UInt *)((char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10003D880(v4, (uint64_t)v12);
  if (swift_getEnumCaseMultiPayload(v12, a2) == 1)
  {
    (*(void (**)(char *, Swift::UInt *, uint64_t))(v7 + 32))(v10, v12, v6);
    Hasher._combine(_:)(1uLL);
    v13 = sub_1000316E0(&qword_1000920E0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    dispatch thunk of Hashable.hash(into:)(a1, v6, v13);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  else
  {
    v14 = *v12;
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(v14);
  }
}

Swift::Int sub_10004EC94(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  Swift::UInt *v12;
  uint64_t v13;
  Swift::UInt v14;
  _QWORD v17[9];

  v4 = v2;
  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v17[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (_QWORD *)((char *)&v17[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  Hasher.init(_seed:)(v17, a1);
  sub_10003D880(v4, (uint64_t)v12);
  if (swift_getEnumCaseMultiPayload(v12, a2) == 1)
  {
    (*(void (**)(char *, Swift::UInt *, uint64_t))(v7 + 32))(v10, v12, v6);
    Hasher._combine(_:)(1uLL);
    v13 = sub_1000316E0(&qword_1000920E0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    dispatch thunk of Hashable.hash(into:)(v17, v6, v13);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  else
  {
    v14 = *v12;
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(v14);
  }
  return Hasher._finalize()();
}

uint64_t sub_10004EE44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];

  v1 = type metadata accessor for UUID(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for MessageID.Value(0);
  __chkstk_darwin(v5);
  v7 = (_QWORD *)((char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10003D880(v0 + OBJC_IVAR___MPMessageID_value, (uint64_t)v7);
  if (swift_getEnumCaseMultiPayload(v7, v5) == 1)
  {
    v8 = (*(uint64_t (**)(char *, _QWORD *, uint64_t))(v2 + 32))(v4, v7, v1);
    v9 = UUID.uuidString.getter(v8);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  else
  {
    v11[1] = *v7;
    return dispatch thunk of CustomStringConvertible.description.getter(&type metadata for UInt, &protocol witness table for UInt);
  }
  return v9;
}

id sub_10004F294()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessageID(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10004F2D8()
{
  return type metadata accessor for MessageID(0);
}

uint64_t type metadata accessor for MessageID(uint64_t a1)
{
  return sub_10003FCA8(a1, (uint64_t *)&unk_100092008, (uint64_t)&nominal type descriptor for MessageID);
}

uint64_t sub_10004F2F4(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = type metadata accessor for MessageID.Value(319);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8) + 64;
    result = swift_updateClassMetadata2(a1, 256, 1, &v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for MessageID.Value(uint64_t a1)
{
  return sub_10003FCA8(a1, qword_100092088, (uint64_t)&nominal type descriptor for MessageID.Value);
}

uint64_t sub_10004F3B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t ObjectType;
  void *v4;
  char v5;
  void *v7;
  _BYTE v8[24];
  uint64_t v9;

  ObjectType = swift_getObjectType(v1);
  sub_10005011C(a1, (uint64_t)v8);
  if (!v9)
  {
    sub_100031760((uint64_t)v8, &qword_1000920E8);
    goto LABEL_5;
  }
  if ((swift_dynamicCast(&v7, v8, (char *)&type metadata for Any + 8, ObjectType, 6) & 1) == 0)
  {
LABEL_5:
    v5 = 0;
    return v5 & 1;
  }
  v4 = v7;
  v5 = sub_10004F990((uint64_t)v7 + OBJC_IVAR___MPMessageID_value, v1 + OBJC_IVAR___MPMessageID_value);

  return v5 & 1;
}

uint64_t *sub_10004F4D8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain(v9);
  }
  else if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
  {
    v8 = type metadata accessor for UUID(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    swift_storeEnumTagMultiPayload(a1, a3, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  }
  return a1;
}

uint64_t sub_10004F58C(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  result = swift_getEnumCaseMultiPayload(a1, a2);
  if ((_DWORD)result == 1)
  {
    v4 = type metadata accessor for UUID(0);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  return result;
}

void *sub_10004F5D8(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
  {
    v6 = type metadata accessor for UUID(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload(a1, a3, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_10004F664(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_10003D8C4((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      v6 = type metadata accessor for UUID(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      swift_storeEnumTagMultiPayload(a1, a3, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

void *sub_10004F700(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
  {
    v6 = type metadata accessor for UUID(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload(a1, a3, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_10004F78C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_10003D8C4((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      v6 = type metadata accessor for UUID(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload(a1, a3, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10004F828(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_10004F834(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_10004F844(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_storeEnumTagMultiPayload(a1, a3, a2);
}

uint64_t sub_10004F854(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  v4[0] = (char *)&value witness table for Builtin.Int64 + 64;
  result = type metadata accessor for UUID(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    swift_initEnumMetadataMultiPayload(a1, 256, 2, v4);
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for MessageFolder()
{
  return &type metadata for MessageFolder;
}

unint64_t sub_10004F8DC()
{
  unint64_t result;

  result = qword_1000920C0;
  if (!qword_1000920C0)
  {
    result = swift_getWitnessTable(&unk_100075F10, &type metadata for MessageFolder);
    atomic_store(result, (unint64_t *)&qword_1000920C0);
  }
  return result;
}

uint64_t sub_10004F920()
{
  return sub_1000316E0(&qword_1000920C8, type metadata accessor for MessageID.Value, (uint64_t)&unk_100075F38);
}

uint64_t sub_10004F94C()
{
  return sub_1000316E0(&qword_1000920D0, type metadata accessor for MessageID, (uint64_t)&protocol conformance descriptor for NSObject);
}

uint64_t sub_10004F978(uint64_t *a1, uint64_t *a2)
{
  return sub_10004FEC4(*a1, *a2);
}

uint64_t sub_10004F990(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char v19;
  void (*v20)(char *, uint64_t);
  uint64_t v22;

  v4 = type metadata accessor for UUID(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for MessageID.Value(0);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (uint64_t *)((char *)&v22 - v12);
  v14 = sub_100031408(&qword_1000920D8);
  v15 = __chkstk_darwin(v14);
  v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = &v17[*(int *)(v15 + 48)];
  sub_10003D880(a1, (uint64_t)v17);
  sub_10003D880(a2, (uint64_t)v18);
  if (swift_getEnumCaseMultiPayload(v17, v8) != 1)
  {
    sub_10003D880((uint64_t)v17, (uint64_t)v13);
    if (swift_getEnumCaseMultiPayload(v18, v8) != 1)
    {
      v19 = *v13 == *(_QWORD *)v18;
      goto LABEL_6;
    }
LABEL_8:
    sub_100031760((uint64_t)v17, &qword_1000920D8);
    v19 = 0;
    return v19 & 1;
  }
  sub_10003D880((uint64_t)v17, (uint64_t)v11);
  if (swift_getEnumCaseMultiPayload(v18, v8) != 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    goto LABEL_8;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v18, v4);
  v19 = static UUID.== infix(_:_:)(v11, v7);
  v20 = *(void (**)(char *, uint64_t))(v5 + 8);
  v20(v7, v4);
  v20(v11, v4);
LABEL_6:
  sub_10003D8C4((uint64_t)v17);
  return v19 & 1;
}

uint64_t sub_10004FB94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  void (*v28)(char *, char *, uint64_t);
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  unint64_t v31;
  char v32;
  unint64_t v33;
  unint64_t v34;
  void (*v35)(char *, uint64_t);
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v4 = type metadata accessor for UUID(0);
  v39 = *(_QWORD *)(v4 - 8);
  v40 = v4;
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v38 = (char *)&v37 - v8;
  v9 = type metadata accessor for MessageID.Value(0);
  v10 = __chkstk_darwin(v9);
  v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v10);
  v15 = (char *)&v37 - v14;
  v16 = __chkstk_darwin(v13);
  v18 = (char *)&v37 - v17;
  __chkstk_darwin(v16);
  v20 = (unint64_t *)((char *)&v37 - v19);
  v21 = sub_100031408(&qword_1000920D8);
  v22 = __chkstk_darwin(v21);
  v24 = (char *)&v37 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = &v24[*(int *)(v22 + 48)];
  v41 = a1;
  sub_10003D880(a1, (uint64_t)v24);
  v42 = a2;
  sub_10003D880(a2, (uint64_t)v25);
  if (swift_getEnumCaseMultiPayload(v24, v9) == 1)
  {
    sub_10003D880((uint64_t)v24, (uint64_t)v18);
    if (swift_getEnumCaseMultiPayload(v25, v9) == 1)
    {
      v27 = v38;
      v26 = v39;
      v28 = *(void (**)(char *, char *, uint64_t))(v39 + 32);
      v29 = v40;
      v28(v38, v18, v40);
      v28(v7, v25, v29);
      if ((static UUID.== infix(_:_:)(v27, v7) & 1) != 0)
      {
        v30 = *(void (**)(char *, uint64_t))(v26 + 8);
        v30(v7, v29);
        v30(v27, v29);
LABEL_7:
        sub_10003D8C4((uint64_t)v24);
        v32 = 0;
        return v32 & 1;
      }
      v32 = static UUID.< infix(_:_:)(v27, v7);
      v35 = *(void (**)(char *, uint64_t))(v26 + 8);
      v35(v7, v29);
      v35(v27, v29);
LABEL_18:
      sub_10003D8C4((uint64_t)v24);
      return v32 & 1;
    }
    (*(void (**)(char *, uint64_t))(v39 + 8))(v18, v40);
  }
  else
  {
    sub_10003D880((uint64_t)v24, (uint64_t)v20);
    v31 = *v20;
    if (swift_getEnumCaseMultiPayload(v25, v9) != 1)
    {
      if (v31 == *(_QWORD *)v25)
        goto LABEL_7;
      v32 = v31 < *(_QWORD *)v25;
      goto LABEL_18;
    }
  }
  sub_10003D880(v41, (uint64_t)v15);
  if (swift_getEnumCaseMultiPayload(v15, v9) == 1)
  {
    sub_10003D8C4((uint64_t)v15);
    v33 = 1;
  }
  else
  {
    v33 = 0;
  }
  sub_10003D880(v42, (uint64_t)v12);
  if (swift_getEnumCaseMultiPayload(v12, v9) == 1)
  {
    sub_10003D8C4((uint64_t)v12);
    v34 = 1;
  }
  else
  {
    v34 = 0;
  }
  v32 = v33 < v34;
  sub_100031760((uint64_t)v24, &qword_1000920D8);
  return v32 & 1;
}

uint64_t sub_10004FEC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  void (*v24)(char *, char *, uint64_t);
  char v25;
  void (*v26)(char *, uint64_t);
  uint64_t v28;

  v4 = type metadata accessor for UUID(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v28 - v9;
  v11 = type metadata accessor for MessageID.Value(0);
  v12 = __chkstk_darwin(v11);
  v14 = (uint64_t *)((char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v12);
  v16 = (char *)&v28 - v15;
  v17 = sub_100031408(&qword_1000920D8);
  v18 = __chkstk_darwin(v17);
  v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = a1 + OBJC_IVAR___MPMessageID_value;
  v22 = a2 + OBJC_IVAR___MPMessageID_value;
  v23 = &v20[*(int *)(v18 + 48)];
  sub_10003D880(v21, (uint64_t)v20);
  sub_10003D880(v22, (uint64_t)v23);
  if (swift_getEnumCaseMultiPayload(v20, v11) == 1)
  {
    sub_10003D880((uint64_t)v20, (uint64_t)v16);
    if (swift_getEnumCaseMultiPayload(v23, v11) == 1)
    {
      v24 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
      v24(v10, v16, v4);
      v24(v8, v23, v4);
      v25 = static UUID.< infix(_:_:)(v10, v8);
      v26 = *(void (**)(char *, uint64_t))(v5 + 8);
      v26(v8, v4);
      v26(v10, v4);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v16, v4);
      sub_10003D8C4((uint64_t)v23);
      v25 = 1;
    }
  }
  else
  {
    sub_10003D880((uint64_t)v20, (uint64_t)v14);
    if (swift_getEnumCaseMultiPayload(v23, v11) == 1)
    {
      sub_10003D8C4((uint64_t)v23);
      v25 = 0;
    }
    else
    {
      v25 = *v14 < *(_QWORD *)v23;
    }
  }
  sub_10003D8C4((uint64_t)v20);
  return v25 & 1;
}

unint64_t sub_10005010C(unint64_t result)
{
  if (result > 4)
    return 0;
  return result;
}

uint64_t sub_10005011C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100031408(&qword_1000920E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for MessageType()
{
  return &type metadata for MessageType;
}

unint64_t sub_100050178()
{
  unint64_t result;

  result = qword_1000920F0;
  if (!qword_1000920F0)
  {
    result = swift_getWitnessTable(&unk_1000760B4, &type metadata for MessageType);
    atomic_store(result, (unint64_t *)&qword_1000920F0);
  }
  return result;
}

uint64_t sub_1000502F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  objc_class *v5;
  _BYTE *v6;
  _QWORD *v7;
  id v8;
  uint64_t result;
  objc_super v10;

  v0 = type metadata accessor for UUID(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  UUID.init()(v2);
  v5 = (objc_class *)type metadata accessor for LegacyVoicemail(0);
  v6 = objc_allocWithZone(v5);
  (*(void (**)(_BYTE *, char *, uint64_t))(v1 + 16))(&v6[OBJC_IVAR___MPLegacyVoicemail_accountID], v4, v0);
  v7 = &v6[OBJC_IVAR___MPLegacyVoicemail_label];
  *v7 = 0x7972616D697250;
  v7[1] = 0xE700000000000000;
  v6[OBJC_IVAR___MPLegacyVoicemail_hasUnreadMessages] = 1;
  v10.receiver = v6;
  v10.super_class = v5;
  v8 = objc_msgSendSuper2(&v10, "init");
  result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  qword_100092E70 = (uint64_t)v8;
  return result;
}

id sub_100050468()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LegacyVoicemail(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000504F0()
{
  return type metadata accessor for LegacyVoicemail(0);
}

uint64_t type metadata accessor for LegacyVoicemail(uint64_t a1)
{
  uint64_t result;

  result = qword_100092120;
  if (!qword_100092120)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for LegacyVoicemail);
  return result;
}

uint64_t sub_100050534(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  result = type metadata accessor for UUID(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = &unk_1000760F8;
    v4[2] = &unk_100076110;
    result = swift_updateClassMetadata2(a1, 256, 3, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

id sub_1000505B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  NSString v11;
  NSString v12;
  id v13;
  id v14;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;

  v18 = a1;
  swift_unknownObjectRetain(a1);
  swift_getAtKeyPath(&v16, &v18, a3);
  swift_unknownObjectRelease(a1);
  v7 = v17;
  if (!v17)
    return 0;
  v8 = HIBYTE(v17) & 0xF;
  if ((v17 & 0x2000000000000000) == 0)
    v8 = v16 & 0xFFFFFFFFFFFFLL;
  if (!v8
    || (v18 = a1,
        swift_unknownObjectRetain(a1),
        swift_getAtKeyPath(&v16, &v18, a2),
        swift_unknownObjectRelease(a1),
        (v9 = v17) == 0))
  {
    swift_bridgeObjectRelease(v7);
    return 0;
  }
  v10 = (void *)objc_opt_self(TUHandle);
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  v13 = objc_msgSend(v10, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v11, v12);

  if (!v13)
    return 0;
  v14 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v3)), "initWithHandle:", v13);

  return v14;
}

void sub_100050788(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1000507A0(a1, (SEL *)&selRef_senderISOCountryCode, a2);
}

void sub_100050794(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1000507A0(a1, (SEL *)&selRef_senderDestinationID, a2);
}

void sub_1000507A0(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = objc_msgSend(*a1, *a2);
  if (v4)
  {
    v5 = v4;
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  *a3 = v6;
  a3[1] = v8;
}

_QWORD *sub_100050800(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *result;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSString v18;
  NSString v19;
  id v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char **v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  NSString v40;
  NSString v41;
  id v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;

  v1 = a1;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v48 = a1;
    else
      v48 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    result = (_QWORD *)_CocoaArrayWrapper.endIndex.getter(v48);
    v2 = (uint64_t)result;
    if (result)
      goto LABEL_3;
LABEL_47:
    swift_bridgeObjectRelease(v1);
    sub_100050DDC((uint64_t)_swiftEmptyArrayStorage);
    return _swiftEmptyArrayStorage;
  }
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = (_QWORD *)swift_bridgeObjectRetain(a1);
  if (!v2)
    goto LABEL_47;
LABEL_3:
  if (v2 >= 1)
  {
    v4 = 0;
    v5 = v1 & 0xC000000000000001;
    v50 = v1 & 0xC000000000000001;
    v49 = v1;
    while (1)
    {
      if (v5)
      {
        v6 = specialized _ArrayBuffer._getElementSlowPath(_:)(v4, v1);
      }
      else
      {
        v6 = *(_QWORD *)(v1 + 8 * v4 + 32);
        swift_unknownObjectRetain(v6);
      }
      v7 = objc_msgSend((id)swift_unknownObjectRetain(v6), "senderDestinationID");
      if (v7)
      {
        v8 = v7;
        v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
        v11 = v10;
        swift_unknownObjectRelease(v6);

        v12 = HIBYTE(v11) & 0xF;
        if ((v11 & 0x2000000000000000) == 0)
          v12 = v9 & 0xFFFFFFFFFFFFLL;
        if (!v12)
        {
          swift_unknownObjectRelease(v6);
          swift_bridgeObjectRelease(v11);
          goto LABEL_7;
        }
        v13 = objc_msgSend((id)swift_unknownObjectRetain(v6), "senderISOCountryCode");
        if (v13)
        {
          v14 = v13;
          static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
          v16 = v15;
          swift_unknownObjectRelease(v6);

          v17 = (void *)objc_opt_self(TUHandle);
          v18 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v11);
          v19 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v16);
          v20 = objc_msgSend(v17, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v18, v19);

          if (v20)
          {
            v21 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), "initWithHandle:", v20);
            swift_unknownObjectRelease(v6);

            v5 = v50;
            v1 = v49;
            if (v21)
            {
              specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v22);
              v24 = *(_QWORD *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
              v23 = *(_QWORD *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
              if (v24 >= v23 >> 1)
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v23 > 1, v24 + 1, 1);
              v25 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v24, v21);
              specialized Array._endMutation()(v25);
            }
          }
          else
          {
            swift_unknownObjectRelease(v6);
            v5 = v50;
            v1 = v49;
          }
          goto LABEL_7;
        }
        swift_bridgeObjectRelease(v11);
      }
      swift_unknownObjectRelease_n(v6, 2);
LABEL_7:
      if (v2 == ++v4)
      {
        swift_bridgeObjectRelease(v1);
        swift_bridgeObjectRetain(v1);
        v26 = 0;
        v27 = &selRef_messageTranscriptView_didReportFeedback_;
        while (1)
        {
          if (v5)
          {
            v28 = specialized _ArrayBuffer._getElementSlowPath(_:)(v26, v1);
          }
          else
          {
            v28 = *(_QWORD *)(v1 + 8 * v26 + 32);
            swift_unknownObjectRetain(v28);
          }
          v29 = objc_msgSend((id)swift_unknownObjectRetain(v28), v27[114]);
          if (v29)
          {
            v30 = v29;
            v31 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
            v33 = v32;
            swift_unknownObjectRelease(v28);

            v34 = HIBYTE(v33) & 0xF;
            if ((v33 & 0x2000000000000000) == 0)
              v34 = v31 & 0xFFFFFFFFFFFFLL;
            if (!v34)
            {
              swift_unknownObjectRelease(v28);
              swift_bridgeObjectRelease(v33);
              goto LABEL_26;
            }
            v35 = objc_msgSend((id)swift_unknownObjectRetain(v28), "receiverISOCountryCode");
            if (v35)
            {
              v36 = v35;
              static String._unconditionallyBridgeFromObjectiveC(_:)(v35);
              v38 = v37;
              swift_unknownObjectRelease(v28);

              v39 = (void *)objc_opt_self(TUHandle);
              v40 = String._bridgeToObjectiveC()();
              swift_bridgeObjectRelease(v33);
              v41 = String._bridgeToObjectiveC()();
              swift_bridgeObjectRelease(v38);
              v42 = objc_msgSend(v39, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v40, v41);

              if (v42)
              {
                v43 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), "initWithHandle:", v42);
                swift_unknownObjectRelease(v28);

                v5 = v50;
                v27 = &selRef_messageTranscriptView_didReportFeedback_;
                if (v43)
                {
                  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v44);
                  v46 = *(_QWORD *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
                  v45 = *(_QWORD *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
                  if (v46 >= v45 >> 1)
                    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v45 > 1, v46 + 1, 1);
                  v47 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v46, v43);
                  specialized Array._endMutation()(v47);
                }
              }
              else
              {
                swift_unknownObjectRelease(v28);
                v5 = v50;
                v27 = &selRef_messageTranscriptView_didReportFeedback_;
              }
              goto LABEL_26;
            }
            swift_bridgeObjectRelease(v33);
          }
          swift_unknownObjectRelease_n(v28, 2);
LABEL_26:
          if (v2 == ++v26)
            goto LABEL_47;
        }
      }
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_100050DA0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100092130;
  if (!qword_100092130)
  {
    v1 = objc_opt_self(TUMetadataDestinationID);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100092130);
  }
  return result;
}

uint64_t sub_100050DDC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v16 = a1;
    else
      v16 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (!((unint64_t)*v1 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v4 < 0)
    v17 = *v1;
  else
    v17 = v4 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(*v1);
  v5 = _CocoaArrayWrapper.endIndex.getter(v17);
  swift_bridgeObjectRelease(v4);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_29;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v1);
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if ((unint64_t)v4 >> 62)
    goto LABEL_31;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain(v4);
    v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v5, v9, 1, v4);
    swift_bridgeObjectRelease(*v1);
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_1000511E0(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1, (uint64_t (*)(_QWORD))sub_100050DA0, &qword_100092140, &qword_100092138, (uint64_t (*)(_BYTE *, uint64_t, uint64_t, uint64_t, uint64_t))sub_100051494);
    if (v11 >= v3)
      break;
LABEL_30:
    __break(1u);
LABEL_31:
    if (v4 < 0)
      v18 = v4;
    else
      v18 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v4);
    v9 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(v4);
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    v15 = swift_bridgeObjectRelease(result);
    return specialized Array._endMutation()(v15);
  }
  __break(1u);
  return result;
}

uint64_t sub_100050FB4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t i;
  void (*v15)(_QWORD *);
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t *v20[4];

  v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v18 = a3;
    else
      v18 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v7 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(a3);
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_25;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    if (a3 < 0)
      v12 = a3;
    else
      v12 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v13 = _CocoaArrayWrapper.endIndex.getter(v12);
    swift_bridgeObjectRelease(a3);
    if (v13 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100051680(&qword_100092148, &qword_1000915C0);
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_100031408(&qword_1000915C0);
          v15 = sub_1000513E8(v20, i, a3);
          v17 = *v16;
          swift_unknownObjectRetain(*v16);
          ((void (*)(uint64_t **, _QWORD))v15)(v20, 0);
          *(_QWORD *)(a1 + 8 * i) = v17;
        }
        swift_bridgeObjectRelease(a3);
        return a3;
      }
      goto LABEL_24;
    }
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_23;
  }
  v10 = v8 + 32;
  if (v8 + 32 >= a1 + 8 * v9 || v10 + 8 * v9 <= a1)
  {
    v11 = sub_100031408(&qword_1000916D0);
    swift_arrayInitWithCopy(a1, v10, v9, v11);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_1000511BC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000511E0(a1, a2, a3, type metadata accessor for MessageID, &qword_100092158, &qword_100092150, (uint64_t (*)(_BYTE *, uint64_t, uint64_t, uint64_t, uint64_t))sub_100051440);
}

uint64_t sub_1000511E0(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD), unint64_t *a5, uint64_t *a6, uint64_t (*a7)(_BYTE *, uint64_t, uint64_t, uint64_t, uint64_t))
{
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void (*v25)(_BYTE *, _QWORD);
  id *v26;
  id v27;
  uint64_t v28;
  uint64_t result;
  _BYTE v30[32];

  v14 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v28 = a3;
    else
      v28 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v15 = _CocoaArrayWrapper.endIndex.getter(v28);
    swift_bridgeObjectRelease(a3);
    if (!v15)
      return a3;
  }
  else
  {
    v15 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v15)
      return a3;
  }
  if (!a1)
    goto LABEL_25;
  v16 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v14)
  {
    if (a3 < 0)
      v20 = a3;
    else
      v20 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v21 = _CocoaArrayWrapper.endIndex.getter(v20);
    swift_bridgeObjectRelease(a3);
    if (v21 <= a2)
    {
      if (v15 >= 1)
      {
        v22 = sub_100051680(a5, a6);
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v15; ++i)
        {
          v24 = sub_100031408(a6);
          v25 = (void (*)(_BYTE *, _QWORD))a7(v30, i, a3, v24, v22);
          v27 = *v26;
          v25(v30, 0);
          *(_QWORD *)(a1 + 8 * i) = v27;
        }
        swift_bridgeObjectRelease(a3);
        return a3;
      }
      goto LABEL_24;
    }
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v17 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v17 > a2)
  {
    __break(1u);
    goto LABEL_23;
  }
  v18 = v16 + 32;
  if (v16 + 32 >= a1 + 8 * v17 || v18 + 8 * v17 <= a1)
  {
    v19 = a4(0);
    swift_arrayInitWithCopy(a1, v18, v17, v19);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

void (*sub_1000513E8(uint64_t **a1, unint64_t a2, uint64_t a3))(_QWORD *)
{
  uint64_t *v6;

  v6 = (uint64_t *)malloc(0x28uLL);
  *a1 = v6;
  v6[4] = (uint64_t)sub_100051514(v6, a2, a3);
  return sub_10005143C;
}

void (*sub_100051440(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_100051588(v6, a2, a3);
  return sub_10005143C;
}

void (*sub_100051494(void (**a1)(id *), unint64_t a2, uint64_t a3))(_QWORD *)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_1000515FC(v6, a2, a3);
  return sub_10005143C;
}

void sub_1000514E8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t *sub_100051514(uint64_t *result, unint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = swift_unknownObjectRetain(*(_QWORD *)(a3 + 8 * a2 + 32));
LABEL_5:
    *v3 = v4;
    return (uint64_t *)sub_100051580;
  }
  __break(1u);
  return result;
}

uint64_t sub_100051580(_QWORD *a1)
{
  return swift_unknownObjectRelease(*a1);
}

void (*sub_100051588(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_1000515F4;
  }
  __break(1u);
  return result;
}

void sub_1000515F4(id *a1)
{

}

void (*sub_1000515FC(void (*result)(id *), unint64_t a2, uint64_t a3))(id *)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_1000516C0;
  }
  __break(1u);
  return result;
}

const char *sub_100051668()
{
  return "senderISOCountryCode";
}

const char *sub_100051674()
{
  return "senderDestinationID";
}

uint64_t sub_100051680(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_100031634(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000516C4(uint64_t a1)
{
  return sub_100051700(a1, qword_100092E90, 0x746C7561666544, 0xE700000000000000);
}

uint64_t sub_1000516E4(uint64_t a1)
{
  return sub_100051700(a1, qword_100092EA8, 0x74694B706954, 0xE600000000000000);
}

uint64_t sub_100051700(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = type metadata accessor for Logger(0, a2);
  sub_10003960C(v7, a2);
  sub_100030760(v7, (uint64_t)a2);
  return Logger.init(subsystem:category:)(0xD00000000000001BLL, 0x8000000100062870, a3, a4);
}

uint64_t sub_100051774(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v19[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_1000492AC(a1);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v15 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v16 = swift_allocObject(&unk_10007EF60, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0;
    v19[1] = 0;
    v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }
  else
  {
    v17 = 0;
  }
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_100092178, v16);
}

uint64_t sub_1000518B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD v20[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_1000492AC(a1);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v15 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v16 = swift_allocObject(&unk_10007EF88, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  v17 = type metadata accessor for CachedVoicemailManager.Cache();
  if (v14 | v12)
  {
    v20[0] = 0;
    v20[1] = 0;
    v18 = v20;
    v20[2] = v12;
    v20[3] = v14;
  }
  else
  {
    v18 = 0;
  }
  return swift_task_create(v8, v18, v17, &unk_100092188, v16);
}

uint64_t sub_100051A00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)(v5 + 32) = a5;
  *(_QWORD *)(v5 + 16) = a4;
  v6 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v5 + 24) = static MainActor.shared.getter(v6);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
  return swift_task_switch(sub_100051A70, v7, v8);
}

uint64_t sub_100051A70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 16);
  swift_release(*(_QWORD *)(v0 + 24));
  objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager), "requestInitialStateIfNecessaryAndSendNotifications:", v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100051BC4()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 41, 7);
}

uint64_t sub_100051BF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_BYTE *)(v1 + 40);
  v8 = (_QWORD *)swift_task_alloc(dword_100092164);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_100030A5C;
  return sub_100051A00(a1, v4, v5, v6, v7);
}

uint64_t sub_100051C6C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100051C90(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100092174);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1000399C8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100092170 + dword_100092170))(a1, v4);
}

uint64_t sub_100051D00(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 24) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 32) = v3;
  *v3 = v2;
  v3[1] = sub_100051D68;
  return v5(v2 + 16);
}

uint64_t sub_100051D68()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_QWORD **)(*v0 + 24);
  v4 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 32));
  *v2 = *(_QWORD *)(v1 + 16);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_100051DB8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100092184);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100030A5C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100092180 + dword_100092180))(a1, v4);
}

id sub_100051EF0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VisualVoicemailManagerFactory();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for VisualVoicemailManagerFactory()
{
  return objc_opt_self(PHVisualVoicemailManagerFactory);
}

uint64_t sub_100051F40()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100051F64(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t sub_100051FF4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100052018()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

void sub_100052024(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000058AC((void *)&_mh_execute_header, a1, a3, "%@", a5, a6, a7, a8, 2u);
  sub_1000058BC();
}

void sub_100052094(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000058AC((void *)&_mh_execute_header, a2, a3, "Contact fetch failed with the following error: %@", a5, a6, a7, a8, 2u);
  sub_1000058BC();
}

void sub_1000520F8(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "intent"));
  v5 = 138412290;
  v6 = v3;
  sub_10000A418((void *)&_mh_execute_header, a2, v4, "unexpected intent: %@", (uint8_t *)&v5);

  sub_10000A460();
}

void sub_100052180(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "intent"));
  sub_10000A438();
  sub_10000A424((void *)&_mh_execute_header, v2, v3, "Attempted to invoke UI extension with unsupported intent: %@ interaction: %@", v4, v5, v6, v7, v8);

}

void sub_10005220C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A450((void *)&_mh_execute_header, a1, a3, "Intent response contains no call records", a5, a6, a7, a8, 0);
}

void sub_100052240(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A450((void *)&_mh_execute_header, a1, a3, "Could not extract call records from intent response", a5, a6, a7, a8, 0);
}

void sub_100052274(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_10000A418((void *)&_mh_execute_header, a2, a3, "Could not find CHRecentCall for INCallRecord: %@", (uint8_t *)&v3);
  sub_1000058BC();
}

void sub_1000522DC(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  sub_10000A438();
  sub_10000A424((void *)&_mh_execute_header, v1, v2, "Found %ld calls matching call unique ID: %@", v3, v4, v5, v6, v7);
  sub_10000A460();
}

void sub_10005234C(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_10000A418((void *)&_mh_execute_header, a2, a3, "Could not find VMVoicemail for INCallRecord with identifier: %@", (uint8_t *)&v3);
  sub_1000058BC();
}

void sub_1000523B4(char a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;

  v3[0] = 67109378;
  v3[1] = a1 & 1;
  v4 = 2112;
  v5 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "isTranscriptionAvailable: %d voicemail: %@", (uint8_t *)v3, 0x12u);
  sub_1000058BC();
}

void sub_100052438(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "supportedHandleTypes"));
  v8 = 134218498;
  v9 = a2;
  v10 = 2112;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Could not create a dial request due to an invalid handle type (%zd). For call provider %@, the supported handle types are (%@).", (uint8_t *)&v8, 0x20u);

}

void sub_100052504(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A450((void *)&_mh_execute_header, a1, a3, "User activity does not contains a user info dictionary.", a5, a6, a7, a8, 0);
}

void sub_100052538(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A450((void *)&_mh_execute_header, a1, a3, "User activity is missing the required key TUCallUserActivityProviderIdentifierKey.", a5, a6, a7, a8, 0);
}

void sub_10005256C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not retrieve a call provider for the specified identifier %@.", (uint8_t *)&v2, 0xCu);
}

void sub_1000525E0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not retreive Dual SIM activation policy", v1, 2u);
}

void sub_100052620(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];

  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not retreive Dual SIM activation policy, mobileGestaltErrorCode: %d", (uint8_t *)v3, 8u);
}

void sub_100052698(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000058AC((void *)&_mh_execute_header, a2, a3, "Could not create a dial request for the recent call (%@).", a5, a6, a7, a8, 2u);
  sub_1000058BC();
}

void sub_100052700(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error initiating dial request %@: %@", (uint8_t *)&v4, 0x16u);
  sub_1000058BC();
}

void sub_100052784(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000058AC((void *)&_mh_execute_header, a2, a3, "Failed to fetch unified contact for identifier: %@", a5, a6, a7, a8, 2u);
  sub_1000058BC();
}

void sub_1000527E8(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not create a CNPhoneNumber for the specified telephone number (%@).", (uint8_t *)&v2, 0xCu);
}

void sub_10005285C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Multiple instances of MPVoicemailController detected in same process which is not yet supported. (existing: %@, self: %@)", (uint8_t *)&v3, 0x16u);
  sub_1000058BC();
}

void sub_1000528DC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000058AC((void *)&_mh_execute_header, a2, a3, "Unable to get subscription information: %@", a5, a6, a7, a8, 2u);
  sub_1000058BC();
}

void sub_100052940(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000058AC((void *)&_mh_execute_header, a2, a3, "Unable to get voicemail information: %@", a5, a6, a7, a8, 2u);
  sub_1000058BC();
}

void sub_1000529A4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot show transcript view due to unknown confidence value.", v1, 2u);
}

void sub_1000529E4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "-[CHRecentCall handleType] returned a value of CHHandleTypeUnknown", v1, 2u);
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGImage");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__accessibilityHigherContrastTintColorForColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessibilityHigherContrastTintColorForColor:");
}

id objc_msgSend__carScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_carScreen");
}

id objc_msgSend__currentTraitCollection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentTraitCollection");
}

id objc_msgSend__phImageNamed_inBundle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_phImageNamed:inBundle:compatibleWithTraitCollection:");
}

id objc_msgSend__preferredMaxLayoutWidth(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preferredMaxLayoutWidth");
}

id objc_msgSend__refreshAttributedText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_refreshAttributedText");
}

id objc_msgSend__requestHandlingOfIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestHandlingOfIntent:");
}

id objc_msgSend__scaledValueForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scaledValueForValue:");
}

id objc_msgSend__setIdleTimerDisabled_forReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setIdleTimerDisabled:forReason:");
}

id objc_msgSend__setPreferredMaxLayoutWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setPreferredMaxLayoutWidth:");
}

id objc_msgSend__setTouchInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setTouchInsets:");
}

id objc_msgSend__shouldShowRTTButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldShowRTTButton");
}

id objc_msgSend__tableView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tableView");
}

id objc_msgSend__telephonyClient(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_telephonyClient");
}

id objc_msgSend__thinSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_thinSystemFontOfSize:");
}

id objc_msgSend__updateButtonState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateButtonState");
}

id objc_msgSend__updateTextColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateTextColor");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_accessoryType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessoryType");
}

id objc_msgSend_accountManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountManager");
}

id objc_msgSend_accountUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountUUID");
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accounts");
}

id objc_msgSend_actionButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionButton");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_actualBackgroundColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actualBackgroundColor");
}

id objc_msgSend_actualTintColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actualTintColor");
}

id objc_msgSend_addAttribute_value_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttribute:value:range:");
}

id objc_msgSend_addAttributes_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttributes:range:");
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDelegate:queue:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addLayoutGuide_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLayoutGuide:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addOperationWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperationWithBlock:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_addTarget_action_forEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forEvents:");
}

id objc_msgSend_airplaneMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "airplaneMode");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allValues");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_alphaComponent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alphaComponent");
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anyObject");
}

id objc_msgSend_appendAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendAttributedString:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_areKeysAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "areKeysAvailable:");
}

id objc_msgSend_arrangedSubviews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrangedSubviews");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributedStringForDowntimeMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributedStringForDowntimeMessage:");
}

id objc_msgSend_attributedStringWithAttachment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributedStringWithAttachment:");
}

id objc_msgSend_attributedText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributedText");
}

id objc_msgSend_audioMessages(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "audioMessages");
}

id objc_msgSend_audioRouteButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "audioRouteButton");
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authorizationStatus");
}

id objc_msgSend_avatarViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "avatarViewController");
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundColor");
}

id objc_msgSend_badgeView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "badgeView");
}

id objc_msgSend_badgeViewTrailingToSubtitleLeadingConstrant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "badgeViewTrailingToSubtitleLeadingConstrant");
}

id objc_msgSend_beginTrackingWithTouch_withEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginTrackingWithTouch:withEvent:");
}

id objc_msgSend_bezierPathWithRoundedRect_cornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithRoundedRect:cornerRadius:");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blackColor");
}

id objc_msgSend_blockedByExtension(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blockedByExtension");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_boostQualityOfService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boostQualityOfService");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bounds");
}

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bringSubviewToFront:");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_button(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "button");
}

id objc_msgSend_buttonLayoutGuide(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonLayoutGuide");
}

id objc_msgSend_buttonWithState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonWithState:");
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonWithType:");
}

id objc_msgSend_calculatedHeightForCallRecordCellsWithWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calculatedHeightForCallRecordCellsWithWidth:");
}

id objc_msgSend_callButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callButton");
}

id objc_msgSend_callButtonImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callButtonImage");
}

id objc_msgSend_callButtonTappedHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callButtonTappedHandler");
}

id objc_msgSend_callDirectoryIdentityType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callDirectoryIdentityType");
}

id objc_msgSend_callDirectoryManagerIdentificationEntriesChangedNotificationToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callDirectoryManagerIdentificationEntriesChangedNotificationToken");
}

id objc_msgSend_callFilterController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callFilterController");
}

id objc_msgSend_callHistoryCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callHistoryCache");
}

id objc_msgSend_callHistoryController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callHistoryController");
}

id objc_msgSend_callHistoryControllerWithCoalescingStrategy_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callHistoryControllerWithCoalescingStrategy:options:");
}

id objc_msgSend_callHistoryManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callHistoryManager");
}

id objc_msgSend_callOccurrences(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callOccurrences");
}

id objc_msgSend_callProviderCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callProviderCache");
}

id objc_msgSend_callProviderIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callProviderIdentifier");
}

id objc_msgSend_callProviderManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callProviderManager");
}

id objc_msgSend_callRecordType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callRecordType");
}

id objc_msgSend_callRecords(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callRecords");
}

id objc_msgSend_callScreeningEnabledM3(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callScreeningEnabledM3");
}

id objc_msgSend_callService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callService");
}

id objc_msgSend_callStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callStatus");
}

id objc_msgSend_callTypeIconLayoutGuideLeadingAnchorLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callTypeIconLayoutGuideLeadingAnchorLayoutConstraintConstant");
}

id objc_msgSend_callTypeIconLayoutGuideLeadingAnchorLayoutConstraintConstantForContentCategorySize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callTypeIconLayoutGuideLeadingAnchorLayoutConstraintConstantForContentCategorySize:");
}

id objc_msgSend_callTypeIconLayoutGuideWidthAnchorLayoutConstraintConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callTypeIconLayoutGuideWidthAnchorLayoutConstraintConstant:");
}

id objc_msgSend_callTypeIconSizingView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callTypeIconSizingView");
}

id objc_msgSend_callTypeIconView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callTypeIconView");
}

id objc_msgSend_callerCountLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callerCountLabel");
}

id objc_msgSend_callerDateLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callerDateLabel");
}

id objc_msgSend_callerId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callerId");
}

id objc_msgSend_callerIdForDisplay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callerIdForDisplay");
}

id objc_msgSend_callerIdIsBlocked(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callerIdIsBlocked");
}

id objc_msgSend_callsWithPredicate_limit_offset_batchSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callsWithPredicate:limit:offset:batchSize:");
}

id objc_msgSend_canAttemptEmergencyCallsWithoutCellularConnectionWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canAttemptEmergencyCallsWithoutCellularConnectionWithUUID:");
}

id objc_msgSend_canExceedUnifyingThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canExceedUnifyingThreshold");
}

id objc_msgSend_canMakeEmergencyCallForSenderIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canMakeEmergencyCallForSenderIdentity:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancelTrackingWithEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelTrackingWithEvent:");
}

id objc_msgSend_canonicalHandleForISOCountryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canonicalHandleForISOCountryCode:");
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "capHeight");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "centerXAnchor");
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "centerYAnchor");
}

id objc_msgSend_circleDiameter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "circleDiameter");
}

id objc_msgSend_circleView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "circleView");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearColor");
}

id objc_msgSend_closestPositionToPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "closestPositionToPoint:");
}

id objc_msgSend_coalescedCallWithCall_usingStrategy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coalescedCallWithCall:usingStrategy:");
}

id objc_msgSend_coalescingStrategy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coalescingStrategy");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "code");
}

id objc_msgSend_collapsedBottomConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collapsedBottomConstraint");
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithAlphaComponent:");
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithRed:green:blue:alpha:");
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_commonInit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commonInit");
}

id objc_msgSend_completionDispatchQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completionDispatchQueue");
}

id objc_msgSend_confidence(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "confidence");
}

id objc_msgSend_confidenceRating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "confidenceRating");
}

id objc_msgSend_configureForCallHistory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureForCallHistory");
}

id objc_msgSend_configureForImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureForImage:");
}

id objc_msgSend_configureGridViewArrangedSubviews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureGridViewArrangedSubviews");
}

id objc_msgSend_configureRecentCallTableViewCell_forRecentCall_numberOfOccurences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureRecentCallTableViewCell:forRecentCall:numberOfOccurences:");
}

id objc_msgSend_configureViewForEmergencyCountdown(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureViewForEmergencyCountdown");
}

id objc_msgSend_configureVoicemailTableViewCell_forVoicemail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureVoicemailTableViewCell:forVoicemail:");
}

id objc_msgSend_configureWithRecentsItem_recentCall_messageIndicatorViewModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureWithRecentsItem:recentCall:messageIndicatorViewModel:");
}

id objc_msgSend_configureWithViewModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureWithViewModel:");
}

id objc_msgSend_configureWithVoicemailMessageViewModel_expanded_shouldGrayForeground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureWithVoicemailMessageViewModel:expanded:shouldGrayForeground:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_constraintEqualToSystemSpacingBelowAnchor_multiplier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToSystemSpacingBelowAnchor:multiplier:");
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:");
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:constant:");
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:");
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:constant:");
}

id objc_msgSend_constraintLessThanOrEqualToConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintLessThanOrEqualToConstant:");
}

id objc_msgSend_constraintsForLayouts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintsForLayouts");
}

id objc_msgSend_constraintsKeyForAccessibleLayout_expanded_editing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintsKeyForAccessibleLayout:expanded:editing:");
}

id objc_msgSend_constraintsLoaded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintsLoaded");
}

id objc_msgSend_contactCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactCache");
}

id objc_msgSend_contactForHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactForHandle:");
}

id objc_msgSend_contactForHandle_isoCountryCode_metadataCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactForHandle:isoCountryCode:metadataCache:");
}

id objc_msgSend_contactForRecentCall_metadataCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactForRecentCall:metadataCache:");
}

id objc_msgSend_contactFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactFormatter");
}

id objc_msgSend_contactHandlesForHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactHandlesForHandle:");
}

id objc_msgSend_contactHandlesForRecentCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactHandlesForRecentCalls:");
}

id objc_msgSend_contactKeyDescriptors(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactKeyDescriptors");
}

id objc_msgSend_contactRelations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactRelations");
}

id objc_msgSend_contactStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactStore");
}

id objc_msgSend_contactsByHandleForRecentCall_keyDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactsByHandleForRecentCall:keyDescriptors:");
}

id objc_msgSend_contactsForHandles_keyDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactsForHandles:keyDescriptors:");
}

id objc_msgSend_contactsForHandles_keyDescriptors_alwaysUnifyLabeledValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactsForHandles:keyDescriptors:alwaysUnifyLabeledValues:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsRestrictedHandle_forBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsRestrictedHandle:forBundleIdentifier:");
}

id objc_msgSend_contentLayoutGuide(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentLayoutGuide");
}

id objc_msgSend_contentScrollView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentScrollView");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentView");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "context");
}

id objc_msgSend_continueTrackingWithTouch_withEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "continueTrackingWithTouch:withEvent:");
}

id objc_msgSend_conversationForCallUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationForCallUID:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countOfExcludedHandles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfExcludedHandles");
}

id objc_msgSend_countdownCancelled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countdownCancelled");
}

id objc_msgSend_countdownLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countdownLabel");
}

id objc_msgSend_countdownTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countdownTimer");
}

id objc_msgSend_countdownView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countdownView");
}

id objc_msgSend_createConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createConstraints");
}

id objc_msgSend_createConstraintsForAccessibleExpandedLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createConstraintsForAccessibleExpandedLayout");
}

id objc_msgSend_createConstraintsForAccessibleNonExpandedLayoutForEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createConstraintsForAccessibleNonExpandedLayoutForEditing:");
}

id objc_msgSend_createConstraintsForNonAccessibleExpandedLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createConstraintsForNonAccessibleExpandedLayout");
}

id objc_msgSend_createConstraintsForNonAccessibleNonExpandedLayoutForEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createConstraintsForNonAccessibleNonExpandedLayoutForEditing:");
}

id objc_msgSend_createFixedConstraintsForAccessibleLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createFixedConstraintsForAccessibleLayout");
}

id objc_msgSend_createFixedConstraintsForNonAccessibleLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createFixedConstraintsForNonAccessibleLayout");
}

id objc_msgSend_currentActiveFixedConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentActiveFixedConstraints");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_currentRequiredConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRequiredConstraints");
}

id objc_msgSend_currentRequiredConstraintsKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRequiredConstraintsKey");
}

id objc_msgSend_currentThumbImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentThumbImage");
}

id objc_msgSend_currentViewModel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentViewModel");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_dateLabelTrailingLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateLabelTrailingLayoutConstraintConstant");
}

id objc_msgSend_deactivateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deactivateConstraints:");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_delegateToQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegateToQueue");
}

id objc_msgSend_deleteAllRecentCalls(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAllRecentCalls");
}

id objc_msgSend_deleteRecentCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteRecentCalls:");
}

id objc_msgSend_dequeueReusableCellWithIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithIdentifier:forIndexPath:");
}

id objc_msgSend_descriptorForRequiredKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptorForRequiredKeys");
}

id objc_msgSend_descriptorForRequiredKeysForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptorForRequiredKeysForStyle:");
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
}

id objc_msgSend_desiredSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "desiredSize");
}

id objc_msgSend_detailScrubController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "detailScrubController");
}

id objc_msgSend_detailSlider_didChangeElapsedTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "detailSlider:didChangeElapsedTime:");
}

id objc_msgSend_detailSliderTrackingDidBegin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "detailSliderTrackingDidBegin:");
}

id objc_msgSend_detailSliderTrackingDidCancel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "detailSliderTrackingDidCancel:");
}

id objc_msgSend_detailSliderTrackingDidEnd_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "detailSliderTrackingDidEnd:");
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceType");
}

id objc_msgSend_dialRequestButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dialRequestButton");
}

id objc_msgSend_dialRequestForCallProvider_handle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dialRequestForCallProvider:handle:");
}

id objc_msgSend_dialRequestForRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dialRequestForRecentCall:");
}

id objc_msgSend_dialType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dialType");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dimmedColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dimmedColor");
}

id objc_msgSend_directionalLayoutMargins(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "directionalLayoutMargins");
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dispatchQueue");
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doesNotRecognizeSelector:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "domain");
}

id objc_msgSend_donated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "donated");
}

id objc_msgSend_drawInRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawInRect:");
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "duration");
}

id objc_msgSend_dynamicLabelColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dynamicLabelColor");
}

id objc_msgSend_dynamicSecondaryLabelColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dynamicSecondaryLabelColor");
}

id objc_msgSend_dynamicTertiaryLabelColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dynamicTertiaryLabelColor");
}

id objc_msgSend_effectiveBaselineOffsetFromBottom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveBaselineOffsetFromBottom");
}

id objc_msgSend_effectiveBaselineOffsetFromContentBottom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveBaselineOffsetFromContentBottom");
}

id objc_msgSend_effectiveFirstBaselineOffsetFromContentTop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveFirstBaselineOffsetFromContentTop");
}

id objc_msgSend_effectiveFirstBaselineOffsetFromTop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveFirstBaselineOffsetFromTop");
}

id objc_msgSend_elapsedTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elapsedTime");
}

id objc_msgSend_elapsedTimeLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elapsedTimeLabel");
}

id objc_msgSend_elapsedTimeLabelBottomAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elapsedTimeLabelBottomAnchorLayoutConstraint");
}

id objc_msgSend_elapsedTimeLabelFirstBaselineAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elapsedTimeLabelFirstBaselineAnchorLayoutConstraint");
}

id objc_msgSend_elapsedTimeLabelFirstBaselineAnchorLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elapsedTimeLabelFirstBaselineAnchorLayoutConstraintConstant");
}

id objc_msgSend_elapsedTimeLabelLeadingAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elapsedTimeLabelLeadingAnchorLayoutConstraint");
}

id objc_msgSend_elapsedTimeLabelTrailingAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elapsedTimeLabelTrailingAnchorLayoutConstraint");
}

id objc_msgSend_emailAddresses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emailAddresses");
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_endTrackingWithTouch_withEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endTrackingWithTouch:withEvent:");
}

id objc_msgSend_enumerateAttribute_inRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_executeFetchRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeFetchRequest:error:");
}

id objc_msgSend_expandedConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expandedConstraints");
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionContext");
}

id objc_msgSend_faceTimeProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "faceTimeProvider");
}

id objc_msgSend_featureFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featureFlags");
}

id objc_msgSend_feedbackTextView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedbackTextView");
}

id objc_msgSend_fetchCallProviderForRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchCallProviderForRecentCall:");
}

id objc_msgSend_fetchCellularRadioEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchCellularRadioEnabled");
}

id objc_msgSend_fetchContactFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchContactFormatter");
}

id objc_msgSend_fetchContactsForHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchContactsForHandles:");
}

id objc_msgSend_fetchContactsForMessages_keyDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchContactsForMessages:keyDescriptors:");
}

id objc_msgSend_fetchContactsForRecentCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchContactsForRecentCalls:");
}

id objc_msgSend_fetchImageForRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchImageForRecentCall:");
}

id objc_msgSend_fetchMessagesCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchMessagesCompletion:");
}

id objc_msgSend_fetchMessagesWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchMessagesWithCompletion:");
}

id objc_msgSend_fetchMetadataForMessages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchMetadataForMessages:");
}

id objc_msgSend_fetchMetadataForRecentCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchMetadataForRecentCalls:");
}

id objc_msgSend_fetchMutableItemForRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchMutableItemForRecentCall:");
}

id objc_msgSend_fetchMutableItemForRecentCall_numberOfOccurences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchMutableItemForRecentCall:numberOfOccurences:");
}

id objc_msgSend_fetchNumberFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchNumberFormatter");
}

id objc_msgSend_fetchRTTConversationForCallUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRTTConversationForCallUUID:");
}

id objc_msgSend_fetchRecentCalls(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRecentCalls");
}

id objc_msgSend_fetchRingerSwitchEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRingerSwitchEnabled");
}

id objc_msgSend_fetchUnifiedContactForID_withDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchUnifiedContactForID:withDescriptors:");
}

id objc_msgSend_fill(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fill");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstBaselineAnchor");
}

id objc_msgSend_firstItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstItem");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "floatValue");
}

id objc_msgSend_folder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "folder");
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "font");
}

id objc_msgSend_fontDescriptor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontDescriptor");
}

id objc_msgSend_fontDescriptorByAddingAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontDescriptorByAddingAttributes:");
}

id objc_msgSend_fontName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontName");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_foregroundView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "foregroundView");
}

id objc_msgSend_foregroundViewTapGestureRecognizer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "foregroundViewTapGestureRecognizer");
}

id objc_msgSend_formattedNameForHandle_countryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formattedNameForHandle:countryCode:");
}

id objc_msgSend_frameLayoutGuide(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "frameLayoutGuide");
}

id objc_msgSend_fullDateLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fullDateLabel");
}

id objc_msgSend_gestureRecognizers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gestureRecognizers");
}

id objc_msgSend_getActiveContextsWithCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getActiveContextsWithCallback:");
}

id objc_msgSend_getFTVoiceMailOnVoicemailsChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getFTVoiceMailOnVoicemailsChanged:");
}

id objc_msgSend_getVisualVoiceMailWithVisualVoicemailManager_onVoicemailsChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getVisualVoiceMailWithVisualVoicemailManager:onVoicemailsChanged:");
}

id objc_msgSend_getVoicemailInfo_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getVoicemailInfo:completion:");
}

id objc_msgSend_gridView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gridView");
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handle");
}

id objc_msgSend_handleForCHRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleForCHRecentCall:");
}

id objc_msgSend_handleType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleType");
}

id objc_msgSend_handleWithDestinationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleWithDestinationID:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hash");
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "heightAnchor");
}

id objc_msgSend_hideAccessoryViews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hideAccessoryViews");
}

id objc_msgSend_hideUnreadIndicatorMetadataViewLeadingConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hideUnreadIndicatorMetadataViewLeadingConstraint");
}

id objc_msgSend_hostedViewMaximumAllowedSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hostedViewMaximumAllowedSize");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "image");
}

id objc_msgSend_imageNamed_inBundle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:inBundle:compatibleWithTraitCollection:");
}

id objc_msgSend_imageOrientation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageOrientation");
}

id objc_msgSend_imageURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageURL");
}

id objc_msgSend_imageWithCGImage_scale_orientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithCGImage:scale:orientation:");
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithRenderingMode:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexPathForCell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForCell:");
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForRow:inSection:");
}

id objc_msgSend_indicatorView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indicatorView");
}

id objc_msgSend_indicatorViewTopLayoutConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indicatorViewTopLayoutConstraint");
}

id objc_msgSend_indicatorViewTopLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indicatorViewTopLayoutConstraintConstant");
}

id objc_msgSend_infoButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "infoButton");
}

id objc_msgSend_initWithAccessibleLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccessibleLayout:");
}

id objc_msgSend_initWithAccountID_label_hasUnreadMessages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountID:label:hasUnreadMessages:");
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivityIndicatorStyle:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAttributedString:");
}

id objc_msgSend_initWithCallHistoryController_callProviderManager_contactStore_suggestedContactStore_metadataCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallHistoryController:callProviderManager:contactStore:suggestedContactStore:metadataCache:");
}

id objc_msgSend_initWithCallProviderManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallProviderManager:");
}

id objc_msgSend_initWithDataProviders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataProviders:");
}

id objc_msgSend_initWithDestinationID_isoCountryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDestinationID:isoCountryCode:");
}

id objc_msgSend_initWithDiameter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDiameter:");
}

id objc_msgSend_initWithDonated_transcribing_transcriptionAttempted_transcriptionAvailable_messageTranscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDonated:transcribing:transcriptionAttempted:transcriptionAvailable:messageTranscript:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:style:");
}

id objc_msgSend_initWithHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHandle:");
}

id objc_msgSend_initWithHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHandles:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithKeysToFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKeysToFetch:");
}

id objc_msgSend_initWithMPMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMPMessage:");
}

id objc_msgSend_initWithMetadataCache_callProviderManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMetadataCache:callProviderManager:");
}

id objc_msgSend_initWithProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProvider:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithRemoteMembers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRemoteMembers:");
}

id objc_msgSend_initWithScrubbingControl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithScrubbingControl:");
}

id objc_msgSend_initWithSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSize:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_initWithTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:");
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:");
}

id objc_msgSend_initWithType_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:value:");
}

id objc_msgSend_initWithUrlString_username_userIdentifier_service_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUrlString:username:userIdentifier:service:");
}

id objc_msgSend_initWithVMTranscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithVMTranscript:");
}

id objc_msgSend_initWithVMVoicemail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithVMVoicemail:");
}

id objc_msgSend_initWithValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValue:");
}

id objc_msgSend_initWithVoicemailManager_accountManager_callProviderManager_contactStore_suggestedContactStore_metadataCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithVoicemailManager:accountManager:callProviderManager:contactStore:suggestedContactStore:metadataCache:");
}

id objc_msgSend_initialConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initialConstraints");
}

id objc_msgSend_initializeCachedValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeCachedValues");
}

id objc_msgSend_insertArrangedSubview_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertArrangedSubview:atIndex:");
}

id objc_msgSend_insertAttributedString_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertAttributedString:atIndex:");
}

id objc_msgSend_insertColumnAtIndex_withArrangedSubviews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertColumnAtIndex:withArrangedSubviews:");
}

id objc_msgSend_instantMessageAddresses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instantMessageAddresses");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_intent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intent");
}

id objc_msgSend_intentResponse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intentResponse");
}

id objc_msgSend_interaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interaction");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invitationPreferencesForRecentCall(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invitationPreferencesForRecentCall");
}

id objc_msgSend_isAccessibilityConstraintsEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAccessibilityConstraintsEnabled");
}

id objc_msgSend_isAccessiblityConstraintsEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAccessiblityConstraintsEnabled");
}

id objc_msgSend_isAccountSubscribed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAccountSubscribed:");
}

id objc_msgSend_isCallVoicemailSupportedForAccountUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCallVoicemailSupportedForAccountUUID:");
}

id objc_msgSend_isContinuous(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isContinuous");
}

id objc_msgSend_isDeleted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDeleted");
}

id objc_msgSend_isDragging(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDragging");
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEditing");
}

id objc_msgSend_isEmergencyNumberForDigits_senderIdentityUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEmergencyNumberForDigits:senderIdentityUUID:");
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEnabled");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToAttributedString:");
}

id objc_msgSend_isEqualToDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDate:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isEqualToVoicemailMessageViewModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToVoicemailMessageViewModel:");
}

id objc_msgSend_isExpanded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isExpanded");
}

id objc_msgSend_isFaceTimeProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFaceTimeProvider");
}

id objc_msgSend_isGeminiCapable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isGeminiCapable");
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHidden");
}

id objc_msgSend_isInitializationBlockQueued(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInitializationBlockQueued");
}

id objc_msgSend_isJunk(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isJunk");
}

id objc_msgSend_isKeyAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isKeyAvailable:");
}

id objc_msgSend_isLikePhoneNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLikePhoneNumber:");
}

id objc_msgSend_isLocalizedSubtitleUnknown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLocalizedSubtitleUnknown:");
}

id objc_msgSend_isMe(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMe");
}

id objc_msgSend_isPreferredContentSizeCategoryAccessible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPreferredContentSizeCategoryAccessible");
}

id objc_msgSend_isRead(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRead");
}

id objc_msgSend_isReceiver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isReceiver");
}

id objc_msgSend_isRestricted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRestricted");
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSelected");
}

id objc_msgSend_isSuggested(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSuggested");
}

id objc_msgSend_isTelephonyProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTelephonyProvider");
}

id objc_msgSend_isTracking(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTracking");
}

id objc_msgSend_isTranscribing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTranscribing");
}

id objc_msgSend_isTranscription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTranscription");
}

id objc_msgSend_isTranscriptionAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTranscriptionAvailable");
}

id objc_msgSend_isTranscriptionRated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTranscriptionRated");
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValid");
}

id objc_msgSend_isoCountryCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isoCountryCode");
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "item");
}

id objc_msgSend_itemCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemCache");
}

id objc_msgSend_itemForRecentCall_numberOfOccurences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemForRecentCall:numberOfOccurences:");
}

id objc_msgSend_junkIdentificationCategory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "junkIdentificationCategory");
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "label");
}

id objc_msgSend_labelID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labelID");
}

id objc_msgSend_labeledValueForEmailAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labeledValueForEmailAddress:");
}

id objc_msgSend_labeledValueForPhoneNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labeledValueForPhoneNumber:");
}

id objc_msgSend_labeledValueForSocialProfileWithUsername_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labeledValueForSocialProfileWithUsername:");
}

id objc_msgSend_labeledValueWithLabel_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labeledValueWithLabel:value:");
}

id objc_msgSend_labelsEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labelsEnabled");
}

id objc_msgSend_largestCallTypeIconWidth(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "largestCallTypeIconWidth");
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastBaselineAnchor");
}

id objc_msgSend_launchAppForDialRequest_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchAppForDialRequest:completion:");
}

id objc_msgSend_launchAppForJoinRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchAppForJoinRequest:");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layer");
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutIfNeeded");
}

id objc_msgSend_layoutIsAccessible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutIsAccessible");
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutMarginsGuide");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leftAnchor");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_loadAccessibilityConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadAccessibilityConstraints");
}

id objc_msgSend_loadConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadConstraints");
}

id objc_msgSend_loadExpandedViewsIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadExpandedViewsIfNecessary");
}

id objc_msgSend_loadLabelConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadLabelConstraints");
}

id objc_msgSend_loadRootViewAndContentViews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadRootViewAndContentViews");
}

id objc_msgSend_loadSubviews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadSubviews");
}

id objc_msgSend_loadView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadView");
}

id objc_msgSend_loadViews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadViews");
}

id objc_msgSend_localParticipantUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localParticipantUUID");
}

id objc_msgSend_localSenderIdentityAccountUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localSenderIdentityAccountUUID");
}

id objc_msgSend_localizedAttributedFeedbackText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedAttributedFeedbackText");
}

id objc_msgSend_localizedAttributedFeedbackTextForConfidence_locale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedAttributedFeedbackTextForConfidence:locale:");
}

id objc_msgSend_localizedAttributedRestrictedAlertTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedAttributedRestrictedAlertTitle");
}

id objc_msgSend_localizedAttributedText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedAttributedText");
}

id objc_msgSend_localizedAttributedTextForConfidence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedAttributedTextForConfidence:");
}

id objc_msgSend_localizedAttributedTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedAttributedTitle");
}

id objc_msgSend_localizedBlockedByExtensionName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedBlockedByExtensionName");
}

id objc_msgSend_localizedCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedCount");
}

id objc_msgSend_localizedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDate");
}

id objc_msgSend_localizedDisplayStringForLabel_propertyName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDisplayStringForLabel:propertyName:");
}

id objc_msgSend_localizedDowntimeTitleCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDowntimeTitleCache");
}

id objc_msgSend_localizedDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDuration");
}

id objc_msgSend_localizedHandleTitleFromMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedHandleTitleFromMessage:");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedName");
}

id objc_msgSend_localizedSenderIdentityTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedSenderIdentityTitle");
}

id objc_msgSend_localizedShortName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedShortName");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringForTimeInterval_timeFormatter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForTimeInterval:timeFormatter:");
}

id objc_msgSend_localizedSubtitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedSubtitle");
}

id objc_msgSend_localizedSubtitleCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedSubtitleCache");
}

id objc_msgSend_localizedSubtitleForMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedSubtitleForMessage:");
}

id objc_msgSend_localizedSubtitleForRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedSubtitleForRecentCall:");
}

id objc_msgSend_localizedSubtitleForRecentEmergencyCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedSubtitleForRecentEmergencyCall:");
}

id objc_msgSend_localizedTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedTitle");
}

id objc_msgSend_localizedTitleCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedTitleCache");
}

id objc_msgSend_localizedTitleForMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedTitleForMessage:");
}

id objc_msgSend_localizedTranscriptionMessage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedTranscriptionMessage");
}

id objc_msgSend_localizedValidHandlesTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedValidHandlesTitle");
}

id objc_msgSend_locationInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationInView:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_markRecentAudioCallsAsRead(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markRecentAudioCallsAsRead");
}

id objc_msgSend_markRecentCallsAsRead(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markRecentCallsAsRead");
}

id objc_msgSend_maxTrackColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxTrackColor");
}

id objc_msgSend_maximumAllowedHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maximumAllowedHeight");
}

id objc_msgSend_maximumColumnsWithAccessibility(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maximumColumnsWithAccessibility");
}

id objc_msgSend_maximumColumnsWithoutAccessibility(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maximumColumnsWithoutAccessibility");
}

id objc_msgSend_maximumHeightConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maximumHeightConstraint");
}

id objc_msgSend_maximumTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maximumTime");
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaType");
}

id objc_msgSend_messageCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageCache");
}

id objc_msgSend_messageMetadataView_didTapButtonType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageMetadataView:didTapButtonType:");
}

id objc_msgSend_messageToolbar_handleActionForButtonType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageToolbar:handleActionForButtonType:");
}

id objc_msgSend_messageToolbarDidSelectRTTButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageToolbarDidSelectRTTButton:");
}

id objc_msgSend_messageToolbarShouldShowRTTButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageToolbarShouldShowRTTButton:");
}

id objc_msgSend_messageTranscriptAttributedText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageTranscriptAttributedText");
}

id objc_msgSend_messageTranscriptConfidence(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageTranscriptConfidence");
}

id objc_msgSend_messageTranscriptConfidenceRating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageTranscriptConfidenceRating");
}

id objc_msgSend_messageTranscriptView_didReceiveTapGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageTranscriptView:didReceiveTapGesture:");
}

id objc_msgSend_messageTranscriptView_didReportFeedback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageTranscriptView:didReportFeedback:");
}

id objc_msgSend_messageType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageType");
}

id objc_msgSend_messages(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messages");
}

id objc_msgSend_metadataCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataCache");
}

id objc_msgSend_metadataDestinationIDsForCHRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataDestinationIDsForCHRecentCall:");
}

id objc_msgSend_metadataDestinationIDsForCHRecentCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataDestinationIDsForCHRecentCalls:");
}

id objc_msgSend_metadataDestinationIDsForVMVoicemails_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataDestinationIDsForVMVoicemails:");
}

id objc_msgSend_metadataForDestinationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataForDestinationID:");
}

id objc_msgSend_metadataForProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataForProvider:");
}

id objc_msgSend_metadataView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataView");
}

id objc_msgSend_metadataViewLeadingConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataViewLeadingConstraint");
}

id objc_msgSend_metadataViewLeadingLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataViewLeadingLayoutConstraintConstant");
}

id objc_msgSend_metadataViewLeadingLayoutConstraintConstantForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataViewLeadingLayoutConstraintConstantForContentSizeCategory:");
}

id objc_msgSend_metadataViewTapGestureRecognizer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataViewTapGestureRecognizer");
}

id objc_msgSend_metadataViewTopConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataViewTopConstraint");
}

id objc_msgSend_metadataViewTrailingLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataViewTrailingLayoutConstraintConstant");
}

id objc_msgSend_metadataViewWithoutUnreadIndicatorImageViewLeadingLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataViewWithoutUnreadIndicatorImageViewLeadingLayoutConstraintConstant");
}

id objc_msgSend_metadataViewWithoutUnreadIndicatorImageViewLeadingLayoutConstraintConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataViewWithoutUnreadIndicatorImageViewLeadingLayoutConstraintConstant:");
}

id objc_msgSend_methodForSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "methodForSelector:");
}

id objc_msgSend_metricsCollectionValidForLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsCollectionValidForLocale:");
}

id objc_msgSend_metricsForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsForTextStyle:");
}

id objc_msgSend_minimumTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minimumTime");
}

id objc_msgSend_monospacedDigitSystemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monospacedDigitSystemFontOfSize:weight:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_negativeFeedbackURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "negativeFeedbackURL");
}

id objc_msgSend_neutralFeedbackURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "neutralFeedbackURL");
}

id objc_msgSend_newestSuggestedContactForDestinationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newestSuggestedContactForDestinationID:");
}

id objc_msgSend_normalizedHandleWithDestinationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "normalizedHandleWithDestinationID:");
}

id objc_msgSend_normalizedPhoneNumberHandleForValue_isoCountryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "normalizedPhoneNumberHandleForValue:isoCountryCode:");
}

id objc_msgSend_normalizedValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "normalizedValue");
}

id objc_msgSend_notifyDelegatesRecentsController_didChangeCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDelegatesRecentsController:didChangeCalls:");
}

id objc_msgSend_notifyDelegatesRecentsController_didChangeUnreadCallCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDelegatesRecentsController:didChangeUnreadCallCount:");
}

id objc_msgSend_notifyDelegatesRecentsController_didUpdateCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDelegatesRecentsController:didUpdateCalls:");
}

id objc_msgSend_notifyDelegatesRecentsControllerDidChangeMessages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDelegatesRecentsControllerDidChangeMessages:");
}

id objc_msgSend_numberForKey_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberForKey:defaultValue:");
}

id objc_msgSend_numberFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberFormatter");
}

id objc_msgSend_numberOfCalls(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfCalls");
}

id objc_msgSend_numberOfColumns(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfColumns");
}

id objc_msgSend_numberOfOccurrences(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfOccurrences");
}

id objc_msgSend_numberOfRows(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfRows");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "object");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openFeedbackURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openFeedbackURL:");
}

id objc_msgSend_outgoingIndicator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outgoingIndicator");
}

id objc_msgSend_outgoingLocalParticipantUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outgoingLocalParticipantUUID");
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_performDialRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performDialRequest:");
}

id objc_msgSend_performDialRequestForRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performDialRequestForRecentCall:");
}

id objc_msgSend_performJoinRequestForRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performJoinRequestForRecentCall:");
}

id objc_msgSend_performSynchronousBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSynchronousBlock:");
}

id objc_msgSend_phPathForImageNamed_inBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phPathForImageNamed:inBundle:");
}

id objc_msgSend_phPreferredFontDescriptorForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phPreferredFontDescriptorForTextStyle:");
}

id objc_msgSend_phPreferredFontDescriptorForTextStyle_addingSymbolicTraits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phPreferredFontDescriptorForTextStyle:addingSymbolicTraits:");
}

id objc_msgSend_phPreferredTightLeadingFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phPreferredTightLeadingFontForTextStyle:");
}

id objc_msgSend_ph_supportsLocalParticipantBadge(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ph_supportsLocalParticipantBadge");
}

id objc_msgSend_ph_uniqueIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ph_uniqueIDs");
}

id objc_msgSend_phoneAppVoicemailURLForRecordID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phoneAppVoicemailURLForRecordID:");
}

id objc_msgSend_phoneKit_isAuthorized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phoneKit_isAuthorized");
}

id objc_msgSend_phoneNumberWithDigits_countryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phoneNumberWithDigits:countryCode:");
}

id objc_msgSend_phoneNumberWithStringValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phoneNumberWithStringValue:");
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phoneNumbers");
}

id objc_msgSend_phoneRecentsAvatarsEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phoneRecentsAvatarsEnabled");
}

id objc_msgSend_phoneRecentsEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phoneRecentsEnabled");
}

id objc_msgSend_playPauseButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playPauseButton");
}

id objc_msgSend_playbackControls_didRequestState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackControls:didRequestState:");
}

id objc_msgSend_playerControlButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerControlButton");
}

id objc_msgSend_playerControlButtonWidthLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerControlButtonWidthLayoutConstraintConstant");
}

id objc_msgSend_playerControlsView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerControlsView");
}

id objc_msgSend_playerControlsViewRightLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerControlsViewRightLayoutConstraintConstant");
}

id objc_msgSend_playerState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerState");
}

id objc_msgSend_playerTimelineSlider_didChangeElapsedTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerTimelineSlider:didChangeElapsedTime:");
}

id objc_msgSend_playerTimelineSliderScrubbingDidBegin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerTimelineSliderScrubbingDidBegin:");
}

id objc_msgSend_playerTimelineSliderScrubbingDidCancel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerTimelineSliderScrubbingDidCancel:");
}

id objc_msgSend_playerTimelineSliderScrubbingDidEnd_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerTimelineSliderScrubbingDidEnd:");
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pointSize");
}

id objc_msgSend_populateCachesForRecentCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populateCachesForRecentCalls:");
}

id objc_msgSend_populateItemCacheForRecentCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populateItemCacheForRecentCalls:");
}

id objc_msgSend_populateMessageCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populateMessageCache");
}

id objc_msgSend_populateMessageCacheForMessages_recentCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populateMessageCacheForMessages:recentCalls:");
}

id objc_msgSend_positiveFeedbackURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "positiveFeedbackURL");
}

id objc_msgSend_postMPVoicemailControllerMessagesDidChangeNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postMPVoicemailControllerMessagesDidChangeNotification");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_postalAddresses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postalAddresses");
}

id objc_msgSend_predicateForContactsMatchingHandleStrings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForContactsMatchingHandleStrings:");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_preferencesValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferencesValueForKey:");
}

id objc_msgSend_preferencesValueForKey_domain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferencesValueForKey:domain:");
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredContentSizeCategory");
}

id objc_msgSend_preferredContentSizeCategoryAllowsMultilineTitleForDoubleLineCells(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredContentSizeCategoryAllowsMultilineTitleForDoubleLineCells");
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_presentScreenTimeShield(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentScreenTimeShield");
}

id objc_msgSend_prioritizedSenderIdentities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prioritizedSenderIdentities");
}

id objc_msgSend_prototypeRecentCallCell(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prototypeRecentCallCell");
}

id objc_msgSend_prototypeVoicemailCell(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prototypeVoicemailCell");
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provider");
}

id objc_msgSend_providerForRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerForRecentCall:");
}

id objc_msgSend_providerWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerWithIdentifier:");
}

id objc_msgSend_providerWithService_video_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerWithService:video:");
}

id objc_msgSend_providers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providers");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_receiverDestinationID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiverDestinationID");
}

id objc_msgSend_receiverISOCountryCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiverISOCountryCode");
}

id objc_msgSend_recentCallForCallRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentCallForCallRecord:");
}

id objc_msgSend_recentCalls(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentCalls");
}

id objc_msgSend_recentsController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentsController");
}

id objc_msgSend_recentsItemCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentsItemCache");
}

id objc_msgSend_recentsItemForCall_numberOfOccurences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentsItemForCall:numberOfOccurences:");
}

id objc_msgSend_recentsOutgoingAudioCallGlyphImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentsOutgoingAudioCallGlyphImage");
}

id objc_msgSend_recentsOutgoingVideoCallGlyphImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentsOutgoingVideoCallGlyphImage");
}

id objc_msgSend_recentsTTYDirectGlyphImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentsTTYDirectGlyphImage");
}

id objc_msgSend_recentsTTYRelayGlyphImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentsTTYRelayGlyphImage");
}

id objc_msgSend_recentsVerifiedCheckmarkImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentsVerifiedCheckmarkImage");
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "redColor");
}

id objc_msgSend_regionCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "regionCode");
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forCellReuseIdentifier:");
}

id objc_msgSend_registerForRingerStateNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForRingerStateNotifications");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadData");
}

id objc_msgSend_remainingTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remainingTime");
}

id objc_msgSend_remainingTimeLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remainingTimeLabel");
}

id objc_msgSend_remainingTimeLabelBottomAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remainingTimeLabelBottomAnchorLayoutConstraint");
}

id objc_msgSend_remainingTimeLabelFirstBaselineAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remainingTimeLabelFirstBaselineAnchorLayoutConstraint");
}

id objc_msgSend_remainingTimeLabelFirstBaselineAnchorLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remainingTimeLabelFirstBaselineAnchorLayoutConstraintConstant");
}

id objc_msgSend_remainingTimeLabelLeadingAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remainingTimeLabelLeadingAnchorLayoutConstraint");
}

id objc_msgSend_remainingTimeLabelTrailingAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remainingTimeLabelTrailingAnchorLayoutConstraint");
}

id objc_msgSend_remoteParticipantHandles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteParticipantHandles");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeArrangedSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeArrangedSubview:");
}

id objc_msgSend_removeAttribute_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAttribute:range:");
}

id objc_msgSend_removeConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeConstraint:");
}

id objc_msgSend_removeConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeConstraints:");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeTarget_forEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeTarget:forEvents:");
}

id objc_msgSend_replaceCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceCharactersInRange:withString:");
}

id objc_msgSend_requestInitialStateIfNecessaryAndSendNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestInitialStateIfNecessaryAndSendNotifications:");
}

id objc_msgSend_resizableImageWithCapInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resizableImageWithCapInsets:");
}

id objc_msgSend_restrictedView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restrictedView");
}

id objc_msgSend_restrictedViewBottomConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restrictedViewBottomConstraint");
}

id objc_msgSend_reuseIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reuseIdentifier");
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rightAnchor");
}

id objc_msgSend_ringerStateNotifyToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ringerStateNotifyToken");
}

id objc_msgSend_rootView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootView");
}

id objc_msgSend_rootViewLayoutMargins(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootViewLayoutMargins");
}

id objc_msgSend_routeGlyphForDeviceType_displayStyle_color_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "routeGlyphForDeviceType:displayStyle:color:");
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "row");
}

id objc_msgSend_rttButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rttButton");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scale");
}

id objc_msgSend_scaledValueForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scaledValueForValue:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:");
}

id objc_msgSend_secondItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondItem");
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondaryLabelColor");
}

id objc_msgSend_sendActionsForControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendActionsForControlEvents:");
}

id objc_msgSend_senderContactForMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "senderContactForMessage:");
}

id objc_msgSend_senderDestinationID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "senderDestinationID");
}

id objc_msgSend_senderHandle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "senderHandle");
}

id objc_msgSend_senderISOCountryCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "senderISOCountryCode");
}

id objc_msgSend_senderIdentityForAccountUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "senderIdentityForAccountUUID:");
}

id objc_msgSend_senderIdentityForHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "senderIdentityForHandle:");
}

id objc_msgSend_separatorInsetForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "separatorInsetForContentSizeCategory:");
}

id objc_msgSend_serialDispatchQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serialDispatchQueue");
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serialQueue");
}

id objc_msgSend_serviceProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceProvider");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set");
}

id objc_msgSend_setAccessibilityConstraintsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityConstraintsEnabled:");
}

id objc_msgSend_setAccessibilityIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityIdentifier:");
}

id objc_msgSend_setAccessibilityLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityLabel:");
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setAccessoryView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryView:");
}

id objc_msgSend_setAccountManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountManager:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setActualBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActualBackgroundColor:");
}

id objc_msgSend_setActualTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActualTintColor:");
}

id objc_msgSend_setAdjustsFontForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsFontForContentSizeCategory:");
}

id objc_msgSend_setAdjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsFontSizeToFitWidth:");
}

id objc_msgSend_setAdjustsImageSizeForAccessibilityContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsImageSizeForAccessibilityContentSizeCategory:");
}

id objc_msgSend_setAdjustsImageWhenDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsImageWhenDisabled:");
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlignment:");
}

id objc_msgSend_setAlignment_forView_inAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlignment:forView:inAxis:");
}

id objc_msgSend_setAllowedUnits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedUnits:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setArrangedSubviewRows_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArrangedSubviewRows:");
}

id objc_msgSend_setArrangedSubviews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArrangedSubviews:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setAttributes_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributes:range:");
}

id objc_msgSend_setAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAxis:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBadgeView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBadgeView:");
}

id objc_msgSend_setBaselineRelativeArrangement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBaselineRelativeArrangement:");
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBounds:");
}

id objc_msgSend_setButtonType_enabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonType:enabled:");
}

id objc_msgSend_setCallButtonImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallButtonImage:");
}

id objc_msgSend_setCallProviderManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallProviderManager:");
}

id objc_msgSend_setCallerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallerID:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setCollapsedBottomConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCollapsedBottomConstraint:");
}

id objc_msgSend_setColumnSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColumnSpacing:");
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConstant:");
}

id objc_msgSend_setConstraintsForLayouts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConstraintsForLayouts:");
}

id objc_msgSend_setConstraintsLoaded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConstraintsLoaded:");
}

id objc_msgSend_setContactFormatter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactFormatter:");
}

id objc_msgSend_setContactIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactIdentifier:");
}

id objc_msgSend_setContactStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactStore:");
}

id objc_msgSend_setContactType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactType:");
}

id objc_msgSend_setContentCompressionResistancePriority_forAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentCompressionResistancePriority:forAxis:");
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentHuggingPriority:forAxis:");
}

id objc_msgSend_setContentInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentInset:");
}

id objc_msgSend_setConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversation:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCountdownCancelled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountdownCancelled:");
}

id objc_msgSend_setCountdownTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountdownTimer:");
}

id objc_msgSend_setCountdownView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountdownView:");
}

id objc_msgSend_setCurrentActiveFixedConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentActiveFixedConstraints:");
}

id objc_msgSend_setCurrentRequiredConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentRequiredConstraints:");
}

id objc_msgSend_setCurrentRequiredConstraintsKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentRequiredConstraintsKey:");
}

id objc_msgSend_setCurrentViewModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentViewModel:");
}

id objc_msgSend_setCustomBaselineOffsetFromBottom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCustomBaselineOffsetFromBottom:");
}

id objc_msgSend_setCustomFirstBaselineOffsetFromTop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCustomFirstBaselineOffsetFromTop:");
}

id objc_msgSend_setDataDetectorTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataDetectorTypes:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDate:");
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateStyle:");
}

id objc_msgSend_setDebugBoundingBoxesEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDebugBoundingBoxesEnabled:");
}

id objc_msgSend_setDelaysContentTouches_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelaysContentTouches:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeliversTouchesForGesturesToSuperview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeliversTouchesForGesturesToSuperview:");
}

id objc_msgSend_setDetailedScrubbingEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDetailedScrubbingEnabled:");
}

id objc_msgSend_setDialType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDialType:");
}

id objc_msgSend_setDirectionalLayoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDirectionalLayoutMargins:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEditable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditable:");
}

id objc_msgSend_setEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditing:");
}

id objc_msgSend_setElapsedTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElapsedTime:");
}

id objc_msgSend_setElapsedTime_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElapsedTime:animated:");
}

id objc_msgSend_setElapsedTime_animated_force_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElapsedTime:animated:force:");
}

id objc_msgSend_setElapsedTimeLabelBottomAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElapsedTimeLabelBottomAnchorLayoutConstraint:");
}

id objc_msgSend_setElapsedTimeLabelFirstBaselineAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElapsedTimeLabelFirstBaselineAnchorLayoutConstraint:");
}

id objc_msgSend_setElapsedTimeLabelLeadingAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElapsedTimeLabelLeadingAnchorLayoutConstraint:");
}

id objc_msgSend_setEmailAddresses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEmailAddresses:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setExpanded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpanded:");
}

id objc_msgSend_setExpanded_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpanded:animated:");
}

id objc_msgSend_setExpandedConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpandedConstraints:");
}

id objc_msgSend_setFeedbackTextViewBottomLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFeedbackTextViewBottomLayoutConstraint:");
}

id objc_msgSend_setFeedbackTextViewLeadingLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFeedbackTextViewLeadingLayoutConstraint:");
}

id objc_msgSend_setFeedbackTextViewTopLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFeedbackTextViewTopLayoutConstraint:");
}

id objc_msgSend_setFeedbackTextViewTrailingLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFeedbackTextViewTrailingLayoutConstraint:");
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFill");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setForegroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForegroundColor:");
}

id objc_msgSend_setForegroundView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForegroundView:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandle:");
}

id objc_msgSend_setHeadIndent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeadIndent:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHideUnreadIndicatorMetadataViewLeadingConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHideUnreadIndicatorMetadataViewLeadingConstraint:");
}

id objc_msgSend_setHitTestsAsOpaque_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHitTestsAsOpaque:");
}

id objc_msgSend_setHorizontalAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHorizontalAlignment:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setImage_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:forState:");
}

id objc_msgSend_setImage_forStates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:forStates:");
}

id objc_msgSend_setIndicatorViewCenterXLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndicatorViewCenterXLayoutConstraint:");
}

id objc_msgSend_setIndicatorViewTopLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndicatorViewTopLayoutConstraint:");
}

id objc_msgSend_setInitialConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialConstraints:");
}

id objc_msgSend_setInitializationBlockQueued_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitializationBlockQueued:");
}

id objc_msgSend_setInteraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteraction:");
}

id objc_msgSend_setInvitationPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvitationPreferences:");
}

id objc_msgSend_setIsDeleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsDeleted:");
}

id objc_msgSend_setIsMissedCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsMissedCall:");
}

id objc_msgSend_setIsRead_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsRead:");
}

id objc_msgSend_setItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItem:");
}

id objc_msgSend_setLayoutIsAccessible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayoutIsAccessible:");
}

id objc_msgSend_setLayoutMarginsRelativeArrangement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayoutMarginsRelativeArrangement:");
}

id objc_msgSend_setLayoutSize_withContentPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayoutSize:withContentPriority:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setLineFragmentPadding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineFragmentPadding:");
}

id objc_msgSend_setLineHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineHeight:");
}

id objc_msgSend_setLinkTextAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLinkTextAttributes:");
}

id objc_msgSend_setLocalSenderIdentityAccountUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalSenderIdentityAccountUUID:");
}

id objc_msgSend_setLocalSenderIdentityUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalSenderIdentityUUID:");
}

id objc_msgSend_setLocalizedAttributedRestrictedAlertTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedAttributedRestrictedAlertTitle:");
}

id objc_msgSend_setLocalizedCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedCount:");
}

id objc_msgSend_setLocalizedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedDate:");
}

id objc_msgSend_setLocalizedDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedDuration:");
}

id objc_msgSend_setLocalizedSenderIdentityTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedSenderIdentityTitle:");
}

id objc_msgSend_setLocalizedSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedSubtitle:");
}

id objc_msgSend_setLocalizedTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedTitle:");
}

id objc_msgSend_setLocalizedValidHandlesTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedValidHandlesTitle:");
}

id objc_msgSend_setMasksToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMasksToBounds:");
}

id objc_msgSend_setMaximumAllowedHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumAllowedHeight:");
}

id objc_msgSend_setMaximumColumnsWithAccessibility_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumColumnsWithAccessibility:");
}

id objc_msgSend_setMaximumColumnsWithoutAccessibility_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumColumnsWithoutAccessibility:");
}

id objc_msgSend_setMaximumHeightConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumHeightConstraint:");
}

id objc_msgSend_setMaximumLayoutSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumLayoutSize:");
}

id objc_msgSend_setMaximumNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumNumberOfLines:");
}

id objc_msgSend_setMaximumTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumTime:");
}

id objc_msgSend_setMaximumTrackImage_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumTrackImage:forState:");
}

id objc_msgSend_setMessages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessages:");
}

id objc_msgSend_setMetadataCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadataCache:");
}

id objc_msgSend_setMetadataViewLeadingConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadataViewLeadingConstraint:");
}

id objc_msgSend_setMetadataViewTopConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadataViewTopConstraint:");
}

id objc_msgSend_setMinimumLayoutSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumLayoutSize:");
}

id objc_msgSend_setMinimumTrackImage_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumTrackImage:forState:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsUpdateConstraints");
}

id objc_msgSend_setNumber_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumber:forKey:");
}

id objc_msgSend_setNumberFormatter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberFormatter:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setNumberOfTouchesRequired_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfTouchesRequired:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpaque:");
}

id objc_msgSend_setOrganizationName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrganizationName:");
}

id objc_msgSend_setOriginatingUIType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginatingUIType:");
}

id objc_msgSend_setPhoneNumbers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhoneNumbers:");
}

id objc_msgSend_setPlayPauseButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayPauseButton:");
}

id objc_msgSend_setPlayerControlsView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayerControlsView:");
}

id objc_msgSend_setPlayerState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayerState:");
}

id objc_msgSend_setPlayerState_enabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayerState:enabled:");
}

id objc_msgSend_setPreFetchingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreFetchingPredicate:");
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicate:");
}

id objc_msgSend_setPreferencesValue_forKey_domain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferencesValue:forKey:domain:");
}

id objc_msgSend_setPreferredMaxLayoutWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredMaxLayoutWidth:");
}

id objc_msgSend_setPreservesSuperviewLayoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreservesSuperviewLayoutMargins:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setPriorityOfConstraints_to_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriorityOfConstraints:to:");
}

id objc_msgSend_setPrototypeRecentCallCell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrototypeRecentCallCell:");
}

id objc_msgSend_setPrototypeVoicemailCell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrototypeVoicemailCell:");
}

id objc_msgSend_setProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProvider:");
}

id objc_msgSend_setRead_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRead:");
}

id objc_msgSend_setRecentCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecentCalls:");
}

id objc_msgSend_setRecentsController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecentsController:");
}

id objc_msgSend_setRemainingTimeLabelBottomAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemainingTimeLabelBottomAnchorLayoutConstraint:");
}

id objc_msgSend_setRemainingTimeLabelFirstBaselineAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemainingTimeLabelFirstBaselineAnchorLayoutConstraint:");
}

id objc_msgSend_setRemainingTimeLabelLeadingAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemainingTimeLabelLeadingAnchorLayoutConstraint:");
}

id objc_msgSend_setRemainingTimeLabelTrailingAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemainingTimeLabelTrailingAnchorLayoutConstraint:");
}

id objc_msgSend_setRestricted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRestricted:");
}

id objc_msgSend_setRestrictedViewBottomConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRestrictedViewBottomConstraint:");
}

id objc_msgSend_setRingerSwitchEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRingerSwitchEnabled:");
}

id objc_msgSend_setRowHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRowHeight:");
}

id objc_msgSend_setRowSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRowSpacing:");
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollEnabled:");
}

id objc_msgSend_setSelectable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectable:");
}

id objc_msgSend_setSelectionStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectionStyle:");
}

id objc_msgSend_setSemanticContentAttribute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSemanticContentAttribute:");
}

id objc_msgSend_setSeparatorInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeparatorInset:");
}

id objc_msgSend_setShowsPlayerControls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsPlayerControls:");
}

id objc_msgSend_setShowsTranscriptionView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsTranscriptionView:");
}

id objc_msgSend_setSliderBottomAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSliderBottomAnchorLayoutConstraint:");
}

id objc_msgSend_setSliderLeadingAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSliderLeadingAnchorLayoutConstraint:");
}

id objc_msgSend_setSliderTopAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSliderTopAnchorLayoutConstraint:");
}

id objc_msgSend_setSliderTrailingAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSliderTrailingAnchorLayoutConstraint:");
}

id objc_msgSend_setSocialProfiles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSocialProfiles:");
}

id objc_msgSend_setSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpacing:");
}

id objc_msgSend_setStandardConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStandardConstraints:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setSuggestedContactStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuggestedContactStore:");
}

id objc_msgSend_setTableView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTableView:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTextContainerInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextContainerInset:");
}

id objc_msgSend_setTextViewBottomLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextViewBottomLayoutConstraint:");
}

id objc_msgSend_setTextViewFirstBaselineLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextViewFirstBaselineLayoutConstraint:");
}

id objc_msgSend_setTextViewFirstBaselineWithoutAccessoryViewsLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextViewFirstBaselineWithoutAccessoryViewsLayoutConstraint:");
}

id objc_msgSend_setTextViewLastBaselineLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextViewLastBaselineLayoutConstraint:");
}

id objc_msgSend_setTextViewLeadingLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextViewLeadingLayoutConstraint:");
}

id objc_msgSend_setTextViewTrailingLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextViewTrailingLayoutConstraint:");
}

id objc_msgSend_setThumbImage_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThumbImage:forState:");
}

id objc_msgSend_setThumbImageView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThumbImageView:");
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeStyle:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTintColorDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColorDelegate:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitleLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleLabel:");
}

id objc_msgSend_setTitleLabelFirstBaselineAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleLabelFirstBaselineAnchorLayoutConstraint:");
}

id objc_msgSend_setTitleLabelFirstBaselineLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleLabelFirstBaselineLayoutConstraint:");
}

id objc_msgSend_setTitleLabelLastBaselineAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleLabelLastBaselineAnchorLayoutConstraint:");
}

id objc_msgSend_setTitleLabelLeadingLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleLabelLeadingLayoutConstraint:");
}

id objc_msgSend_setTitleLabelTopLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleLabelTopLayoutConstraint:");
}

id objc_msgSend_setTitleLabelTrailingLayoutConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleLabelTrailingLayoutConstraint:");
}

id objc_msgSend_setToolbarBottomConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToolbarBottomConstraint:");
}

id objc_msgSend_setTranscriptBottomConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranscriptBottomConstraint:");
}

id objc_msgSend_setTranscriptViewModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranscriptViewModel:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUnreadCallCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnreadCallCount:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setValue_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:animated:");
}

id objc_msgSend_setVerified_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVerified:");
}

id objc_msgSend_setVerifiedBadgeView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVerifiedBadgeView:");
}

id objc_msgSend_setVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideo:");
}

id objc_msgSend_setVideoEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoEnabled:");
}

id objc_msgSend_setViewModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewModel:");
}

id objc_msgSend_setVoicemailController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVoicemailController:");
}

id objc_msgSend_setVoicemailManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVoicemailManager:");
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithCapacity:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setupCollapsedView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupCollapsedView");
}

id objc_msgSend_setupExpandedView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupExpandedView");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedUtilityProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedUtilityProvider");
}

id objc_msgSend_shortDateLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shortDateLabel");
}

id objc_msgSend_shortDurationLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shortDurationLabel");
}

id objc_msgSend_shouldRestrictDialRequest_performSynchronously_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldRestrictDialRequest:performSynchronously:");
}

id objc_msgSend_shouldRestrictJoinConversationRequest_performSynchronously_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldRestrictJoinConversationRequest:performSynchronously:");
}

id objc_msgSend_shouldShowRestrictedAlertView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldShowRestrictedAlertView");
}

id objc_msgSend_shouldShowTranscriptView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldShowTranscriptView");
}

id objc_msgSend_showsPlayerControls(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showsPlayerControls");
}

id objc_msgSend_showsRestrictedAlertView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showsRestrictedAlertView");
}

id objc_msgSend_showsTranscriptionView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showsTranscriptionView");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "size");
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeToFit");
}

id objc_msgSend_slider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "slider");
}

id objc_msgSend_sliderBottomAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sliderBottomAnchorLayoutConstraint");
}

id objc_msgSend_sliderLeadingAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sliderLeadingAnchorLayoutConstraint");
}

id objc_msgSend_sliderTopAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sliderTopAnchorLayoutConstraint");
}

id objc_msgSend_sliderTrailingAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sliderTrailingAnchorLayoutConstraint");
}

id objc_msgSend_socialProfiles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "socialProfiles");
}

id objc_msgSend_standardConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardConstraints");
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAnimating");
}

id objc_msgSend_startCountdownFromNumber_withTimeInterval_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startCountdownFromNumber:withTimeInterval:completion:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "state");
}

id objc_msgSend_stateForNotifyToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateForNotifyToken:");
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopAnimating");
}

id objc_msgSend_storeWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeWithOptions:");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringFromContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromContact:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromNumber:");
}

id objc_msgSend_stringFromSeconds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromSeconds:");
}

id objc_msgSend_stringFromTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromTimeInterval:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "style");
}

id objc_msgSend_subscriptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptions");
}

id objc_msgSend_subtitleForRecentEmergencyCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitleForRecentEmergencyCall:");
}

id objc_msgSend_subtitleLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitleLabel");
}

id objc_msgSend_subtitleLabelFirstBaselineLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitleLabelFirstBaselineLayoutConstraintConstant");
}

id objc_msgSend_subtitleLabelLastBaselineLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitleLabelLastBaselineLayoutConstraintConstant");
}

id objc_msgSend_subtitleLabelTextColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitleLabelTextColor");
}

id objc_msgSend_subtitleLeadingToLayoutMarginConstrant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitleLeadingToLayoutMarginConstrant");
}

id objc_msgSend_subtitleStackView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitleStackView");
}

id objc_msgSend_suggestedContactForHandle_isoCountryCode_metadataCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestedContactForHandle:isoCountryCode:metadataCache:");
}

id objc_msgSend_suggestedContactStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestedContactStore");
}

id objc_msgSend_suggestionsEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestionsEnabled");
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "superview");
}

id objc_msgSend_supportedHandleTypes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportedHandleTypes");
}

id objc_msgSend_supportsHandleType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsHandleType:");
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemBlueColor");
}

id objc_msgSend_systemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:weight:");
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemGrayColor");
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
}

id objc_msgSend_systemLightGrayColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemLightGrayColor");
}

id objc_msgSend_systemMidGrayColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemMidGrayColor");
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemRedColor");
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemWhiteColor");
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableView");
}

id objc_msgSend_tableView_accessoryButtonTappedForRowWithIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableView:accessoryButtonTappedForRowWithIndexPath:");
}

id objc_msgSend_tapTargets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tapTargets");
}

id objc_msgSend_telephonyProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "telephonyProvider");
}

id objc_msgSend_telephonyUIBodyShortEmphasizedFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "telephonyUIBodyShortEmphasizedFont");
}

id objc_msgSend_telephonyUIBodyShortFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "telephonyUIBodyShortFont");
}

id objc_msgSend_telephonyUIFootnoteShortFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "telephonyUIFootnoteShortFont");
}

id objc_msgSend_telephonyUIInfoButtonGlyphImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "telephonyUIInfoButtonGlyphImage");
}

id objc_msgSend_telephonyUISubheadlineShortFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "telephonyUISubheadlineShortFont");
}

id objc_msgSend_telephonyUIUnreadIndicatorGlyphImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "telephonyUIUnreadIndicatorGlyphImage");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "text");
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textColor");
}

id objc_msgSend_textContainer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textContainer");
}

id objc_msgSend_textStylingAtPosition_inDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textStylingAtPosition:inDirection:");
}

id objc_msgSend_textView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textView");
}

id objc_msgSend_textViewBottomLayoutConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textViewBottomLayoutConstraint");
}

id objc_msgSend_textViewFirstBaselineLayoutConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textViewFirstBaselineLayoutConstraint");
}

id objc_msgSend_textViewFirstBaselineLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textViewFirstBaselineLayoutConstraintConstant");
}

id objc_msgSend_textViewFirstBaselineWithoutAccessoryViewsLayoutConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textViewFirstBaselineWithoutAccessoryViewsLayoutConstraint");
}

id objc_msgSend_textViewLastBaselineLayoutConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textViewLastBaselineLayoutConstraint");
}

id objc_msgSend_textViewLastBaselineLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textViewLastBaselineLayoutConstraintConstant");
}

id objc_msgSend_textViewLineHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textViewLineHeight");
}

id objc_msgSend_thumbHitRect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thumbHitRect");
}

id objc_msgSend_thumbImageView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thumbImageView");
}

id objc_msgSend_thumbRectForBounds_trackRect_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thumbRectForBounds:trackRect:value:");
}

id objc_msgSend_timeFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeFormatter");
}

id objc_msgSend_timelineSlider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timelineSlider");
}

id objc_msgSend_timelineSliderTopAnchorConstraintAccessibilityConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timelineSliderTopAnchorConstraintAccessibilityConstant");
}

id objc_msgSend_tintColorDelegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tintColorDelegate");
}

id objc_msgSend_tintColorForColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tintColorForColor:");
}

id objc_msgSend_tipKitStartObservation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tipKitStartObservation");
}

id objc_msgSend_tipKitStopObservation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tipKitStopObservation");
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleLabel");
}

id objc_msgSend_titleLabelBaselineAnchorLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleLabelBaselineAnchorLayoutConstraintConstant");
}

id objc_msgSend_titleLabelFirstBaselineAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleLabelFirstBaselineAnchorLayoutConstraint");
}

id objc_msgSend_titleLabelFirstBaselineLayoutConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleLabelFirstBaselineLayoutConstraint");
}

id objc_msgSend_titleLabelFirstBaselineLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleLabelFirstBaselineLayoutConstraintConstant");
}

id objc_msgSend_titleLabelLastBaselineAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleLabelLastBaselineAnchorLayoutConstraint");
}

id objc_msgSend_titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize:");
}

id objc_msgSend_titleLabelLeadingLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleLabelLeadingLayoutConstraintConstant");
}

id objc_msgSend_titleLabelTopLayoutConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleLabelTopLayoutConstraint");
}

id objc_msgSend_titleLabelTrailingLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleLabelTrailingLayoutConstraintConstant");
}

id objc_msgSend_titleStackView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleStackView");
}

id objc_msgSend_toolbar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toolbar");
}

id objc_msgSend_toolbarBottomConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toolbarBottomConstraint");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_touchesBegan_withEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchesBegan:withEvent:");
}

id objc_msgSend_touchesCancelled_withEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchesCancelled:withEvent:");
}

id objc_msgSend_touchesEnded_withEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchesEnded:withEvent:");
}

id objc_msgSend_touchesMoved_withEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchesMoved:withEvent:");
}

id objc_msgSend_tpImageForSymbolType_textStyle_scale_isStaticSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tpImageForSymbolType:textStyle:scale:isStaticSize:");
}

id objc_msgSend_trackColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackColor");
}

id objc_msgSend_trackRectForBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackRectForBounds:");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_transcript(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transcript");
}

id objc_msgSend_transcriptBottomConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transcriptBottomConstraint");
}

id objc_msgSend_transcriptView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transcriptView");
}

id objc_msgSend_transcriptViewModel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transcriptViewModel");
}

id objc_msgSend_transcriptionAttempted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transcriptionAttempted");
}

id objc_msgSend_transitionWithView_duration_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transitionWithView:duration:options:animations:completion:");
}

id objc_msgSend_trashButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trashButton");
}

id objc_msgSend_ttyType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ttyType");
}

id objc_msgSend_tuHandle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tuHandle");
}

id objc_msgSend_tu_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_firstObjectPassingTest:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "type");
}

id objc_msgSend_unifiedContactWithIdentifier_keysToFetch_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unifiedContactWithIdentifier:keysToFetch:error:");
}

id objc_msgSend_uniqueId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniqueId");
}

id objc_msgSend_unknownLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unknownLabel");
}

id objc_msgSend_unloadConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unloadConstraints");
}

id objc_msgSend_unreadCallCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unreadCallCount");
}

id objc_msgSend_unreadIndicatorImageView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unreadIndicatorImageView");
}

id objc_msgSend_unreadIndicatorImageViewLeadingLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unreadIndicatorImageViewLeadingLayoutConstraintConstant");
}

id objc_msgSend_unreadIndicatorImageViewLeadingLayoutConstraintConstantForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unreadIndicatorImageViewLeadingLayoutConstraintConstantForContentSizeCategory:");
}

id objc_msgSend_unreadIndicatorImageViewTopLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unreadIndicatorImageViewTopLayoutConstraintConstant");
}

id objc_msgSend_unreadIndicatorImageViewWidthLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unreadIndicatorImageViewWidthLayoutConstraintConstant");
}

id objc_msgSend_unreadIndicatorImageViewWidthLayoutConstraintConstantForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unreadIndicatorImageViewWidthLayoutConstraintConstantForContentSizeCategory:");
}

id objc_msgSend_unregisterForRingerStateNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterForRingerStateNotifications");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_updateAudioRouteButtonWithTouchUpInsideEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAudioRouteButtonWithTouchUpInsideEnabled:");
}

id objc_msgSend_updateButtonGlyphImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateButtonGlyphImage");
}

id objc_msgSend_updateCacheWithDestinationIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCacheWithDestinationIDs:");
}

id objc_msgSend_updateCacheWithDestinationIDs_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCacheWithDestinationIDs:completion:");
}

id objc_msgSend_updateConstraintsForExpandedState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateConstraintsForExpandedState:");
}

id objc_msgSend_updateElapsedTimeLabelText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateElapsedTimeLabelText");
}

id objc_msgSend_updateExpandedViewsWithViewModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateExpandedViewsWithViewModel:");
}

id objc_msgSend_updateFonts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFonts");
}

id objc_msgSend_updateFontsAndLayoutMetrics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFontsAndLayoutMetrics");
}

id objc_msgSend_updateFontsLayoutMetricsAndSeparatorInset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFontsLayoutMetricsAndSeparatorInset");
}

id objc_msgSend_updateLabelColors(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLabelColors");
}

id objc_msgSend_updateMinimumTrackImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMinimumTrackImage");
}

id objc_msgSend_updateRecentCalls(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRecentCalls");
}

id objc_msgSend_updateRootView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRootView");
}

id objc_msgSend_updateSubviewConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSubviewConfiguration");
}

id objc_msgSend_updateTextColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTextColor");
}

id objc_msgSend_updateThumbImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateThumbImage");
}

id objc_msgSend_updateTrackImages(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTrackImages");
}

id objc_msgSend_urlAddresses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "urlAddresses");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceLayoutDirection");
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceStyle");
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "username");
}

id objc_msgSend_utterances(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "utterances");
}

id objc_msgSend_validRemoteParticipantHandles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validRemoteParticipantHandles");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "value");
}

id objc_msgSend_verificationStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verificationStatus");
}

id objc_msgSend_verified(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verified");
}

id objc_msgSend_verifiedBadgeView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifiedBadgeView");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "view");
}

id objc_msgSend_viewModel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewModel");
}

id objc_msgSend_voicemailAudioRouteGlyphImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailAudioRouteGlyphImage");
}

id objc_msgSend_voicemailCaptionRegularFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailCaptionRegularFont");
}

id objc_msgSend_voicemailCaptionRegularFontDescriptor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailCaptionRegularFontDescriptor");
}

id objc_msgSend_voicemailController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailController");
}

id objc_msgSend_voicemailDeleteGlyphImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailDeleteGlyphImage");
}

id objc_msgSend_voicemailDialRequestGlyphImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailDialRequestGlyphImage");
}

id objc_msgSend_voicemailFootnoteFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailFootnoteFont");
}

id objc_msgSend_voicemailForCallRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailForCallRecord:");
}

id objc_msgSend_voicemailHeadlineShortFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailHeadlineShortFont");
}

id objc_msgSend_voicemailHeadlineShortFontDescriptor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailHeadlineShortFontDescriptor");
}

id objc_msgSend_voicemailManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailManager");
}

id objc_msgSend_voicemailMessageCellDidTapToCollapse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailMessageCellDidTapToCollapse:");
}

id objc_msgSend_voicemailMessageTableViewCell_actionButtonTappedForRowWithIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailMessageTableViewCell:actionButtonTappedForRowWithIndexPath:");
}

id objc_msgSend_voicemailMessageTableViewCell_audioRouteButtonTappedForRowWithIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailMessageTableViewCell:audioRouteButtonTappedForRowWithIndexPath:");
}

id objc_msgSend_voicemailMessageTableViewCell_dialRequestButtonTappedForRowWithIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailMessageTableViewCell:dialRequestButtonTappedForRowWithIndexPath:");
}

id objc_msgSend_voicemailMessageTableViewCell_didChangeElapsedTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailMessageTableViewCell:didChangeElapsedTime:");
}

id objc_msgSend_voicemailMessageTableViewCell_didReceiveTranscriptFeedback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailMessageTableViewCell:didReceiveTranscriptFeedback:");
}

id objc_msgSend_voicemailMessageTableViewCell_didReceiveTranscriptTapGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailMessageTableViewCell:didReceiveTranscriptTapGesture:");
}

id objc_msgSend_voicemailMessageTableViewCell_didRequestPlayState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailMessageTableViewCell:didRequestPlayState:");
}

id objc_msgSend_voicemailMessageTableViewCell_moveButtonTappedForRowWithIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailMessageTableViewCell:moveButtonTappedForRowWithIndexPath:");
}

id objc_msgSend_voicemailMessageTableViewCell_rttButtonTappedForRowWithIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailMessageTableViewCell:rttButtonTappedForRowWithIndexPath:");
}

id objc_msgSend_voicemailMessageTableViewCell_shouldShowRTTButtonForRowWithIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailMessageTableViewCell:shouldShowRTTButtonForRowWithIndexPath:");
}

id objc_msgSend_voicemailMessageTableViewCellDidBeginScrubbing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailMessageTableViewCellDidBeginScrubbing:");
}

id objc_msgSend_voicemailMessageTableViewCellDidCancelScrubbing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailMessageTableViewCellDidCancelScrubbing:");
}

id objc_msgSend_voicemailMessageTableViewCellDidEndScrubbing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailMessageTableViewCellDidEndScrubbing:");
}

id objc_msgSend_voicemailMessageViewModelForVoicemail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailMessageViewModelForVoicemail:");
}

id objc_msgSend_voicemailPauseGlyphImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailPauseGlyphImage");
}

id objc_msgSend_voicemailPlayGlyphImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailPlayGlyphImage");
}

id objc_msgSend_voicemailReportFeedbackGlyphImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailReportFeedbackGlyphImage");
}

id objc_msgSend_voicemailSearchEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailSearchEnabled");
}

id objc_msgSend_voicemailTTYGlyphImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailTTYGlyphImage");
}

id objc_msgSend_voicemailTipView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailTipView");
}

id objc_msgSend_voicemailUndeleteGlyphImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailUndeleteGlyphImage");
}

id objc_msgSend_voicemailWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailWithIdentifier:");
}

id objc_msgSend_voicemailWithIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailWithIdentifier:completion:");
}

id objc_msgSend_wasEmergencyCall(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wasEmergencyCall");
}

id objc_msgSend_wasTranscriptionAttempted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wasTranscriptionAttempted");
}

id objc_msgSend_weakToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "weakToStrongObjectsMapTable");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whiteColor");
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "widthAnchor");
}

id objc_msgSend_withCaseSensitiveAttribute(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withCaseSensitiveAttribute");
}

id objc_msgSend_withPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withPriority:");
}
