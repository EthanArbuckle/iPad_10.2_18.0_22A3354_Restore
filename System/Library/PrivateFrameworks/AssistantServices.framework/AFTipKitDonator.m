@implementation AFTipKitDonator

+ (void)_donateToTipsWithIdentifier:(id)a3 bundleID:(id)a4 context:(id)a5 userInfo:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (_AFTipKitDonatorQueue_onceToken != -1)
    dispatch_once(&_AFTipKitDonatorQueue_onceToken, &__block_literal_global_1892);
  v13 = _AFTipKitDonatorQueue_queue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __73__AFTipKitDonator__donateToTipsWithIdentifier_bundleID_context_userInfo___block_invoke;
  v18[3] = &unk_1E3A369B8;
  v19 = v9;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  v17 = v9;
  dispatch_async(v13, v18);

}

+ (void)donateAnnounceNotificationsInCarPlaySettingsChange:(int64_t)a3
{
  __CFString *v4;
  __CFString *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("AFSiriCarPlayAnnounceEnablementType");
  if ((unint64_t)a3 > 4)
    v4 = CFSTR("(unknown)");
  else
    v4 = off_1E3A34DA8[a3];
  v5 = v4;
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_donateToTipsWithIdentifier:bundleID:context:userInfo:", CFSTR("com.apple.siri.announce.carplay.settings.changed"), CFSTR("com.apple.siri"), 0, v6);

}

+ (void)donateDictationEventStartedForBundleId:(id)a3 context:(id)a4 userInfo:(id)a5
{
  objc_msgSend(a1, "_donateToTipsWithIdentifier:bundleID:context:userInfo:", CFSTR("com.apple.siri.dictation.dictation-request-started"), a3, a4, a5);
}

+ (void)donateSiriEventStartedForBundleId:(id)a3 context:(id)a4 userInfo:(id)a5
{
  objc_msgSend(a1, "_donateToTipsWithIdentifier:bundleID:context:userInfo:", CFSTR("com.apple.siri.dictation.siri-request-started"), a3, a4, a5);
}

+ (void)donateMessageSentForBundleId:(id)a3 context:(id)a4 userInfo:(id)a5
{
  objc_msgSend(a1, "_donateToTipsWithIdentifier:bundleID:context:userInfo:", CFSTR("com.apple.siri.dictation.message-sent"), a3, a4, a5);
}

+ (void)donateCallHangUpAvailabilityChanged:(BOOL)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_donateToTipsWithIdentifier:bundleID:context:userInfo:", CFSTR("com.apple.siri.call-hang-up.availability.changed"), CFSTR("com.apple.siri"), 0, v5);

}

void __73__AFTipKitDonator__donateToTipsWithIdentifier_bundleID_context_userInfo___block_invoke(_QWORD *a1)
{
  void *v1;
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc((Class)getBMDiscoverabilitySignalEventClass()), "initWithIdentifier:bundleID:context:userInfo:", a1[4], a1[5], a1[6], a1[7]);
  objc_msgSend(getBMStreamsClass(), "discoverabilitySignal");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendEvent:", v3);

}

@end
