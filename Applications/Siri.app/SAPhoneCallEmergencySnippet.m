@implementation SAPhoneCallEmergencySnippet

- (id)sr_sirilandShim
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v32;
  SAPhoneCallEmergencySnippet *v33;
  id v34;

  v3 = objc_alloc_init((Class)SFCard);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAPhoneCallEmergencySnippet title](self, "title"));
  objc_msgSend(v3, "setTitle:", v4);

  objc_msgSend(v3, "setType:", 1);
  v33 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAPhoneCallEmergencySnippet aceId](self, "aceId"));
  objc_msgSend(v3, "setCardId:", v5);

  objc_msgSend(v3, "setSource:", 2);
  v32 = objc_alloc_init((Class)SFNullCardSection);
  v34 = v32;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
  objc_msgSend(v3, "setCardSections:", v6);

  v7 = objc_msgSend(objc_alloc((Class)INStartCallIntent), "initWithCallRecordFilter:callRecordToCallBack:audioRoute:destinationType:contacts:callCapability:", 0, 0, 0, 2, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "backingStore"));
  objc_opt_class(_INPBStartCallIntent, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
  {
    v11 = v8;
    v12 = objc_alloc_init((Class)_INPBIntentMetadata);
    objc_msgSend(v12, "setLaunchId:", CFSTR("x-apple-siri-app://com.apple.InCallService"));
    objc_msgSend(v12, "setSystemExtensionBundleId:", CFSTR("com.apple.InCallService.IntentsUI"));
    objc_msgSend(v11, "setIntentMetadata:", v12);
    objc_msgSend(v7, "setBackingStore:", v11);

  }
  v13 = objc_msgSend(objc_alloc((Class)INStartCallIntentResponse), "initWithCode:userActivity:", 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "backingStore"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "data"));

  objc_msgSend(v3, "setIntentMessageData:", v15);
  objc_msgSend(v3, "setIntentMessageName:", CFSTR("sirikit.intent.call.StartCallIntent"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "backingStore"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "data"));
  objc_msgSend(v3, "setIntentResponseMessageData:", v17);

  objc_msgSend(v3, "setIntentResponseMessageName:", CFSTR("sirikit.intent.call.StartCallIntentResponse"));
  v18 = objc_alloc_init((Class)SACardSnippet);
  v19 = objc_msgSend(objc_alloc((Class)_SFPBCard), "initWithFacade:", v3);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "data"));
  objc_msgSend(v18, "setCardData:", v20);

  v21 = objc_alloc_init((Class)SAUISash);
  LODWORD(v19) = AFIsInternalInstall(v21, v22);
  v23 = sub_10005B08C(CFSTR("EMERGENCY_CALL_SASH_TITLE"));
  v24 = objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)v24;
  if ((_DWORD)v19)
    v26 = CFSTR("%@ (INTERNAL ONLY: LEGACY FLOW)");
  else
    v26 = CFSTR("%@");
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v26, v24));
  objc_msgSend(v21, "setTitle:", v27);

  v28 = objc_alloc_init((Class)SAUIColor);
  objc_msgSend(v28, "setRedValue:", 255);
  objc_msgSend(v28, "setGreenValue:", 255);
  objc_msgSend(v28, "setBlueValue:", 255);
  objc_msgSend(v28, "setAlpha:", &off_100128B30);
  objc_msgSend(v21, "setTextColor:", v28);
  v29 = objc_alloc_init((Class)SAUIColor);
  objc_msgSend(v29, "setRedValue:", 255);
  objc_msgSend(v29, "setGreenValue:", 0);
  objc_msgSend(v29, "setBlueValue:", 0);
  objc_msgSend(v29, "setAlpha:", &off_100128B30);
  objc_msgSend(v21, "setBackgroundColor:", v29);
  objc_msgSend(v18, "setSash:", v21);
  objc_msgSend(v18, "sr_applySnippetProperties:", v33);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v30, "postNotificationName:object:", AFUIDidShowEmergencyCallViewNotification, 0);

  return v18;
}

@end
