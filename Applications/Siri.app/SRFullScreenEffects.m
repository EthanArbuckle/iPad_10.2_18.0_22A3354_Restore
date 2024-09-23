@implementation SRFullScreenEffects

- (id)effectForAceObject:(id)a3
{
  void *v4;
  const __CFString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "fullScreenEffectType"));
  if ((objc_msgSend(v4, "isEqualToString:", SAUIShowFullScreenEffectEffectTypeCONFETTIValue) & 1) != 0)
  {
    v5 = CFSTR("com.apple.messages.effect.CKConfettiEffect");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", SAUIShowFullScreenEffectEffectTypeLASERSValue) & 1) != 0)
  {
    v5 = CFSTR("com.apple.messages.effect.CKLasersEffect");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", SAUIShowFullScreenEffectEffectTypeFIREWORKSValue) & 1) != 0)
  {
    v5 = CFSTR("com.apple.messages.effect.CKFireworksEffect");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", SAUIShowFullScreenEffectEffectTypeSHOOTINGSTARValue) & 1) != 0)
  {
    v5 = CFSTR("com.apple.messages.effect.CKShootingStarEffect");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", SAUIShowFullScreenEffectEffectTypeBALLOONSValue) & 1) != 0)
  {
    v5 = CFSTR("com.apple.messages.effect.CKHappyBirthdayEffect");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", SAUIShowFullScreenEffectEffectTypeSPARKLESValue) & 1) != 0)
  {
    v5 = CFSTR("com.apple.messages.effect.CKSparklesEffect");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", SAUIShowFullScreenEffectEffectTypeLOVEValue) & 1) != 0)
  {
    v5 = CFSTR("com.apple.messages.effect.CKHeartEffect");
  }
  else if (objc_msgSend(v4, "isEqualToString:", SAUIShowFullScreenEffectEffectTypeSPOTLIGHTValue))
  {
    v5 = CFSTR("com.apple.messages.effect.CKSpotlightEffect");
  }
  else
  {
    v5 = 0;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRFullScreenEffects _effectForIdentifier:](self, "_effectForIdentifier:", v5));

  return v6;
}

- (id)_effectForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRFullScreenEffects _fullscreenEffectMap](self, "_fullscreenEffectMap"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

    if (v6)
    {
      if ((objc_msgSend(v6, "isLoaded") & 1) == 0)
        objc_msgSend(v6, "load");
      v7 = objc_alloc_init((Class)objc_msgSend(v6, "principalClass"));
      objc_msgSend(v7, "setIdentifier:", v4);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_fullscreenEffectMap
{
  NSDictionary *fullscreenEffectMapInternal;
  NSDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSDictionary *v16;
  SRFullScreenEffects *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];

  fullscreenEffectMapInternal = self->_fullscreenEffectMapInternal;
  if (!fullscreenEffectMapInternal)
  {
    v18 = self;
    v4 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/System/Library/Messages/iMessageEffects")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v6, 0, 7, &stru_100123100));

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = objc_msgSend(objc_alloc((Class)NSBundle), "initWithURL:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v12));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleIdentifier"));
          if (v14)
          {
            -[NSDictionary setObject:forKey:](v4, "setObject:forKey:", v13, v14);
          }
          else
          {
            v15 = AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v24 = "-[SRFullScreenEffects _fullscreenEffectMap]";
              v25 = 2112;
              v26 = v13;
              _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Failed to get bundle identifier for %@", buf, 0x16u);
            }
          }

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v10);
    }

    v16 = v18->_fullscreenEffectMapInternal;
    v18->_fullscreenEffectMapInternal = v4;

    fullscreenEffectMapInternal = v18->_fullscreenEffectMapInternal;
  }
  return fullscreenEffectMapInternal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullscreenEffectMapInternal, 0);
}

@end
