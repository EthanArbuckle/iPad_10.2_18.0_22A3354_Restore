@implementation INPlayMediaIntentResponse

- (id)init
{
  return -[INPlayMediaIntentResponse initWithCode:userActivity:](self, "initWithCode:userActivity:", 0, 0);
}

- (INPlayMediaIntentResponse)initWithCode:(INPlayMediaIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  NSUserActivity *v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  INPlayMediaIntentResponse *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  INPlayMediaIntentResponseCode v17;
  __int16 v18;
  __CFString *v19;
  __int16 v20;
  NSUserActivity *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = userActivity;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    if ((unint64_t)code > INPlayMediaIntentResponseCodeFailureMaxStreamLimitReached)
      v9 = 0;
    else
      v9 = off_1E2292808[code];
    v10 = v9;
    *(_DWORD *)buf = 136315906;
    v15 = "-[INPlayMediaIntentResponse initWithCode:userActivity:]";
    v16 = 2048;
    v17 = code;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);

  }
  v13.receiver = self;
  v13.super_class = (Class)INPlayMediaIntentResponse;
  v11 = -[INIntentResponse _initWithCode:userActivity:](&v13, sel__initWithCode_userActivity_, code, v6);

  return v11;
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INPlayMediaIntentResponse;
  return -[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, a3, a4);
}

- (INPlayMediaIntentResponse)initWithBackingStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INPlayMediaIntentResponse;
  return -[INIntentResponse initWithBackingStore:](&v4, sel_initWithBackingStore_, a3);
}

- (INPlayMediaIntentResponseCode)code
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INPlayMediaIntentResponse;
  return -[INIntentResponse code](&v3, sel_code);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INPlayMediaIntentResponse;
  -[INIntentResponse encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (INPlayMediaIntentResponse)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INPlayMediaIntentResponse;
  return -[INIntentResponse initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (int64_t)_intentResponseCode
{
  INPlayMediaIntentResponseCode v2;

  v2 = -[INPlayMediaIntentResponse code](self, "code");
  if ((unint64_t)(v2 - 1) > 0xA)
    return 0;
  else
    return qword_18C311EA8[v2 - 1];
}

- (int64_t)_codeWithName:(id)a3
{
  id v3;
  uint64_t v4;
  int64_t v5;
  int v6;

  v3 = a3;
  objc_msgSend(v3, "isEqualToString:", CFSTR("INPlayMediaIntentResponseCodeUnspecified"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("INPlayMediaIntentResponseCodeReady"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INPlayMediaIntentResponseCodeContinueInApp")))
    v4 = 2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INPlayMediaIntentResponseCodeInProgress")))
    v4 = 3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INPlayMediaIntentResponseCodeSuccess")))
    v4 = 4;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INPlayMediaIntentResponseCodeHandleInApp")))
    v4 = 5;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INPlayMediaIntentResponseCodeFailure")))
    v4 = 6;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INPlayMediaIntentResponseCodeFailureRequiringAppLaunch")))v4 = 7;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INPlayMediaIntentResponseCodeFailureUnknownMediaType")))
    v4 = 8;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INPlayMediaIntentResponseCodeFailureNoUnplayedContent")))v4 = 9;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("INPlayMediaIntentResponseCodeFailureRestrictedContent")))v5 = 10;
  else
    v5 = v4;
  v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("INPlayMediaIntentResponseCodeFailureMaxStreamLimitReached"));

  if (v6)
    return 11;
  else
    return v5;
}

- (BOOL)_shouldForwardIntentToApp
{
  return -[INPlayMediaIntentResponse code](self, "code") == INPlayMediaIntentResponseCodeHandleInApp;
}

- (NSDictionary)nowPlayingInfo
{
  void *v2;
  void *v3;
  void *v4;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nowPlayingInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDictionary(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (void)setNowPlayingInfo:(NSDictionary *)nowPlayingInfo
{
  NSDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = nowPlayingInfo;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDictionary(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setNowPlayingInfo:", v6);
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v7);

}

- (id)_dictionaryRepresentation
{
  INPlayMediaIntentResponseCode v3;
  unint64_t v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("code");
  v3 = -[INPlayMediaIntentResponse code](self, "code");
  v4 = v3;
  if ((unint64_t)v3 < (INPlayMediaIntentResponseCodeFailureUnknownMediaType|INPlayMediaIntentResponseCodeSuccess))
  {
    v5 = off_1E2292808[v3];
    v6 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
  }
  v11[1] = CFSTR("nowPlayingInfo");
  v12[0] = v5;
  -[INPlayMediaIntentResponse nowPlayingInfo](self, "nowPlayingInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)

  if (v4 >= 0xC)
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5
{
  int64_t result;
  uint64_t v6;
  int64_t v7;

  result = 0;
  switch(a3)
  {
    case 0:
      result = 4;
      break;
    case 1:
      v6 = (a4 - 1);
      v7 = 6;
      if (a5)
        v7 = 7;
      if (v6 >= 4)
        result = v7;
      else
        result = v6 + 8;
      break;
    case 2:
      result = 3;
      break;
    case 4:
      result = 2;
      break;
    case 5:
      result = 1;
      break;
    default:
      return result;
  }
  return result;
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xA)
    return 3;
  else
    return dword_18C311E78[a3 - 1];
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 8) < 4)
    return a3 - 7;
  else
    return 0x7FFFFFFF;
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 7;
}

- (void)_intents_prepareResponse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[INPlayMediaIntentResponse nowPlayingInfo](self, "nowPlayingInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count") || !MediaRemoteLibrary() || !MediaPlayerLibrary())
    goto LABEL_29;
  getMPMediaItemPropertyArtwork();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", getkMRMediaRemoteNowPlayingInfoArtworkData());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      +[INImage imageWithImageData:](INImage, "imageWithImageData:", v5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", getkMRMediaRemoteNowPlayingInfoArtworkDataWidth());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", getkMRMediaRemoteNowPlayingInfoArtworkDataHeight());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 && v6)
      {
        objc_msgSend(v6, "doubleValue");
        v9 = v8;
        objc_msgSend(v7, "doubleValue");
        objc_msgSend(v23, "_setImageSize:", v9, v10);
      }

    }
    else
    {
      v23 = 0;
    }

  }
  v11 = (void *)objc_msgSend(v3, "mutableCopy");
  getMPMediaItemPropertyArtwork();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObjectForKey:", v12);

  objc_msgSend(v11, "removeObjectForKey:", getkMRMediaRemoteNowPlayingInfoArtworkData());
  objc_msgSend(v11, "removeObjectForKey:", getkMRMediaRemoteNowPlayingInfoArtworkDataHeight());
  objc_msgSend(v11, "removeObjectForKey:", getkMRMediaRemoteNowPlayingInfoArtworkDataWidth());
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v13 = (_QWORD *)getkMRMediaRemoteNowPlayingInfoArtworkMIMETypeSymbolLoc_ptr;
  v31 = (void *)getkMRMediaRemoteNowPlayingInfoArtworkMIMETypeSymbolLoc_ptr;
  if (!getkMRMediaRemoteNowPlayingInfoArtworkMIMETypeSymbolLoc_ptr)
  {
    v14 = (void *)MediaRemoteLibrary();
    v13 = dlsym(v14, "kMRMediaRemoteNowPlayingInfoArtworkMIMEType");
    v29[3] = (uint64_t)v13;
    getkMRMediaRemoteNowPlayingInfoArtworkMIMETypeSymbolLoc_ptr = (uint64_t)v13;
  }
  _Block_object_dispose(&v28, 8);
  if (!v13)
  {
    dlerror();
    abort_report_np();
    goto LABEL_32;
  }
  objc_msgSend(v11, "removeObjectForKey:", *v13);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = v3;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v19, "hasPrefix:", CFSTR("kMRMediaRemote")) & 1) != 0)
          goto LABEL_28;
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v16);
  }

  v20 = v11;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v21 = getMPNowPlayingInfoDictionaryToMRNowPlayingInfoDictionarySymbolLoc_ptr;
  v31 = getMPNowPlayingInfoDictionaryToMRNowPlayingInfoDictionarySymbolLoc_ptr;
  if (!getMPNowPlayingInfoDictionaryToMRNowPlayingInfoDictionarySymbolLoc_ptr)
  {
    v22 = (void *)MediaPlayerLibrary();
    v21 = dlsym(v22, "MPNowPlayingInfoDictionaryToMRNowPlayingInfoDictionary");
    v29[3] = (uint64_t)v21;
    getMPNowPlayingInfoDictionaryToMRNowPlayingInfoDictionarySymbolLoc_ptr = v21;
  }
  _Block_object_dispose(&v28, 8);
  if (!v21)
  {
    dlerror();
    abort_report_np();
LABEL_32:
    __break(1u);
  }
  ((void (*)(id))v21)(v20);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v15, "mutableCopy");
LABEL_28:

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, CFSTR("artwork"));
  -[INPlayMediaIntentResponse setNowPlayingInfo:](self, "setNowPlayingInfo:", v11);

LABEL_29:
}

@end
