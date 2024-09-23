@implementation CKFaceTimeUtilities

+ (void)initializeCachedValues
{
  objc_msgSend(MEMORY[0x1E0DBD1B8], "initializeCachedValues");
}

+ (BOOL)isTelephonyAvailable
{
  return objc_msgSend(MEMORY[0x1E0DBD1B8], "supportsTelephonyCalls");
}

+ (BOOL)isDirectTelephonyAvailable
{
  return objc_msgSend(MEMORY[0x1E0DBD1B8], "isDirectTelephonyCallingCurrentlyAvailable");
}

+ (BOOL)isFaceTimeVideoAvailable:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v4 = a3;
  if (objc_msgSend(v4, "isGroupConversation"))
  {
    if (!objc_msgSend(a1, "isGroupFaceTimeSupported"))
    {
      v7 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v4, "recipients");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    v7 = v6 <= +[CKFaceTimeUtilities faceTimeMaxParticipants](CKFaceTimeUtilities, "faceTimeMaxParticipants");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "faceTimeSupported"))
    {
      objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "faceTimeAvailable");

    }
    else
    {
      v7 = 0;
    }
  }

LABEL_9:
  objc_msgSend(MEMORY[0x1E0D20BE8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "availabilityForListenerID:forService:", CKFaceTimeServiceAvailabilityKey, 0);

  if (v10)
    v11 = v7;
  else
    v11 = 0;

  return v11;
}

+ (BOOL)isFaceTimeAudioAvailable:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;

  v4 = a3;
  if (objc_msgSend(v4, "isGroupConversation"))
  {
    if (!objc_msgSend(a1, "isGroupFaceTimeSupported"))
    {
      LOBYTE(v7) = 0;
      goto LABEL_12;
    }
    objc_msgSend(v4, "recipients");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    LOBYTE(v7) = v6 <= +[CKFaceTimeUtilities faceTimeMaxParticipants](CKFaceTimeUtilities, "faceTimeMaxParticipants");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "faceTimeSupported"))
    {
      objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "callingSupported"))
      {
        objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v9, "faceTimeBlocked") ^ 1;

      }
      else
      {
        LOBYTE(v7) = 0;
      }

    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }

LABEL_12:
  objc_msgSend(MEMORY[0x1E0D20BE8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "availabilityForListenerID:forService:", CKFaceTimeServiceAvailabilityKey, 2);

  if (v11)
    v12 = v7;
  else
    v12 = 0;

  return v12;
}

+ (BOOL)isGroupFaceTimeSupported
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "faceTimeSupported"))
  {
    objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "multiwayAvailable"))
    {
      objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isGreenTea") ^ 1;

    }
    else
    {
      LOBYTE(v5) = 0;
    }

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (BOOL)isModernScreenSharingAvailable:(id)a3
{
  id v3;
  void *v4;
  char v5;
  BOOL v6;
  void *v8;
  int v9;
  void *v10;
  int v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isModernScreenSharingEnabled");

  if ((v5 & 1) == 0)
  {
    if ((_IMWillLog() & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (!objc_msgSend(v3, "isGroupConversation"))
  {
    objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isGreenTea");

    if (v9)
    {
      if ((_IMWillLog() & 1) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
    objc_msgSend(v3, "chat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isSMS");

    if (!v11)
    {
      v6 = 1;
      goto LABEL_8;
    }
    if (!_IMWillLog())
      goto LABEL_7;
LABEL_6:
    _IMAlwaysLog();
    goto LABEL_7;
  }
  if ((_IMWillLog() & 1) != 0)
    goto LABEL_6;
LABEL_7:
  v6 = 0;
LABEL_8:

  return v6;
}

+ (void)showCallControlsForConversation:(id)a3
{
  id v3;

  if (objc_msgSend(MEMORY[0x1E0D35818], "conversationIsVideoCall:", a3))
    objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeShowInCallUIURL");
  else
    objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeShowSystemCallControlsURL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  TUOpenURL();

}

+ (int64_t)faceTimeMaxParticipants
{
  return objc_msgSend(MEMORY[0x1E0DBD298], "maximumNumberOfInvitedMembers") + 1;
}

+ (void)queryModernScreenSharingCapabilities:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0D39880];
  v7 = *MEMORY[0x1E0D34210];
  v8 = CKFaceTimeServiceAvailabilityKey;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__CKFaceTimeUtilities_queryModernScreenSharingCapabilities_completion___block_invoke;
  v10[3] = &unk_1E275A660;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v6, "currentRemoteDevicesForDestinations:service:listenerID:queue:completionBlock:", a3, v7, v8, MEMORY[0x1E0C80D38], v10);

}

void __71__CKFaceTimeUtilities_queryModernScreenSharingCapabilities_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v3 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__80;
  v10 = __Block_byref_object_dispose__80;
  v11 = 0;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__CKFaceTimeUtilities_queryModernScreenSharingCapabilities_completion___block_invoke_46;
  v5[3] = &unk_1E275A638;
  v5[4] = &v6;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v7[5]);
  _Block_object_dispose(&v6, 8);

}

void __71__CKFaceTimeUtilities_queryModernScreenSharingCapabilities_completion___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v5 = a2;
  v6 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__CKFaceTimeUtilities_queryModernScreenSharingCapabilities_completion___block_invoke_2;
  v9[3] = &unk_1E275A610;
  v9[4] = &v10;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v11 + 24));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, v5);

  _Block_object_dispose(&v10, 8);
}

void __71__CKFaceTimeUtilities_queryModernScreenSharingCapabilities_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  objc_msgSend(a2, "capabilities");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "valueForCapability:", *MEMORY[0x1E0D34B60])
    && !objc_msgSend(v6, "valueForCapability:", *MEMORY[0x1E0D34B20]))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }

}

+ (BOOL)isModernScreenSharingAvailableForEntity:(id)a3 capabilities:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v5 = a4;
  objc_msgSend(a3, "IDSCanonicalAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (_IMWillLog())
  {
    v10 = v6;
    _IMAlwaysLog();
  }
  objc_msgSend(v5, "objectForKey:", v6, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v8, "BOOLValue");

  }
  if (_IMWillLog())
    _IMAlwaysLog();

  return (char)v7;
}

@end
