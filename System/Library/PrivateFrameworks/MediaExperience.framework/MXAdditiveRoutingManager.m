@implementation MXAdditiveRoutingManager

- (id)copyActiveVoiceOverSessionPlayingToOnDemandVAD
{
  NSPointerArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[MXSessionManager mxCoreSessionListBeginIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListBeginIteration");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = -[MXSessionManager mxCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance", 0), "mxCoreSessionList");
  v3 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v7, "hasAudioCategory:", CFSTR("VoiceOver"))
          && objc_msgSend(v7, "isActive")
          && -[__CFString containsString:](CMSUtility_GetCurrentAudioDestination(v7), "containsString:", 0x1E30A4CA8))
        {
          v8 = v7;
          goto LABEL_13;
        }
      }
      v4 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_13:
  -[MXSessionManager mxCoreSessionListEndIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListEndIteration");
  return v8;
}

- (id)copyAndUpdateSessionInformation:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSArray *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  NSObject *v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  _BOOL4 v35;
  NSObject *v36;
  unsigned int v37;
  unsigned int v38;
  uint64_t v39;
  const __CFString *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  unsigned int v44;
  _BOOL4 v45;
  unsigned int v46;
  uint64_t v47;
  NSObject *v48;
  unsigned int v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t m;
  void *v54;
  NSObject *v55;
  uint64_t v57;
  int *v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  uint64_t v69;
  uint64_t v70;
  id v71;
  id obj;
  id obja;
  _QWORD v74[4];
  id v75;
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
  __int128 v87;
  os_log_type_t type;
  unsigned int v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  int v97;
  const char *v98;
  __int16 v99;
  uint64_t v100;
  __int16 v101;
  id v102;
  id location[16];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v71 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v63 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v65 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  obj = a3;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v90, v104, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v91;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v91 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
        v8 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", 0x1E30A87C8, v57, v59), "unsignedIntValue");
        if ((_DWORD)v8)
        {
          v9 = -[MXAdditiveRoutingManager copySessionWithAudioSessionID:](self, "copySessionWithAudioSessionID:", v8);
          if (v9)
          {
            if (dword_1EE2B3F38)
            {
              v89 = 0;
              type = OS_LOG_TYPE_DEFAULT;
              os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            if (objc_msgSend(v9, "updateAudioBehaviourFromVARouteConfig:", v7, v57, v59))
              objc_msgSend(v65, "addObject:", v9);
            v12 = (void *)objc_msgSend(v7, "objectForKey:", 0x1E30A87A8);
            v13 = objc_msgSend(v7, "objectForKey:", 0x1E30A87E8);
            if (v12 && (v14 = v13) != 0)
            {
              objc_msgSend(v71, "setObject:forKey:", v13, v12);
              objc_msgSend(v63, "setObject:forKey:", v12, v14);
              if (dword_1EE2B3F38)
              {
                v89 = 0;
                type = OS_LOG_TYPE_DEFAULT;
                v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              -[MXAdditiveRoutingManager updateDetailedRouteDescription:](self, "updateDetailedRouteDescription:", objc_msgSend(v12, "unsignedIntValue", v57, v59));
            }
            else
            {
              v89 = 0;
              type = OS_LOG_TYPE_DEFAULT;
              v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }

          }
          else
          {
            v89 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v104, 16);
    }
    while (v4);
  }
  v17 = -[NSDictionary allKeys](-[MXAdditiveRoutingManager vadIDToName](self, "vadIDToName", v57, v59), "allKeys");
  v18 = (void *)objc_msgSend(v71, "allKeys");
  obja = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v17)
  {
    v19 = (void *)-[NSDictionary mutableCopy](-[MXAdditiveRoutingManager detailedRoutesDescription](self, "detailedRoutesDescription"), "mutableCopy");
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v20 = (void *)objc_msgSend((id)objc_msgSend(v18, "differenceFromArray:", v17), "removals");
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v85;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v85 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * j);
          if (dword_1EE2B3F38)
          {
            v89 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            v25 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v26 = v89;
            if (os_log_type_enabled(v25, type))
              v27 = v26;
            else
              v27 = v26 & 0xFFFFFFFE;
            if (v27)
            {
              v28 = objc_msgSend(v24, "object");
              v97 = 136315394;
              v98 = "-[MXAdditiveRoutingManager copyAndUpdateSessionInformation:]";
              v99 = 2114;
              v100 = v28;
              LODWORD(v60) = 22;
              v58 = &v97;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          objc_msgSend(obja, "addObject:", objc_msgSend(v24, "object", v58, v60));
          objc_msgSend(v19, "removeObjectForKey:", objc_msgSend(v24, "object"));
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
      }
      while (v21);
    }
    -[MXAdditiveRoutingManager setDetailedRoutesDescription:](self, "setDetailedRoutesDescription:", v19);

  }
  v67 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v62 = -[MXSessionManager copyMXCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "copyMXCoreSessionList");
  v61 = -[MXSessionManagerSecure copyMXCoreSessionSecureList](+[MXSessionManagerSecure sharedInstance](MXSessionManagerSecure, "sharedInstance"), "copyMXCoreSessionSecureList");
  v66 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v66, "addObjectsFromArray:", v62);
  objc_msgSend(v66, "addObjectsFromArray:", v61);
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v70 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
  if (v70)
  {
    v69 = *(_QWORD *)v81;
    do
    {
      for (k = 0; k != v70; ++k)
      {
        if (*(_QWORD *)v81 != v69)
          objc_enumerationMutation(v66);
        v30 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * k);
        if (!-[MXSessionManager isSpeechDetectCategory:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "isSpeechDetectCategory:", objc_msgSend(v30, "audioCategory")))
        {
          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", CMSUtility_GetCurrentOutputVADID(v30));
          v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", CMSUtility_GetCurrentInputVADID(v30));
          v33 = objc_msgSend(v71, "objectForKey:", v31);
          v34 = objc_msgSend(v71, "objectForKey:", v32);
          if (v34)
            v35 = 0;
          else
            v35 = v33 == 0;
          if (v35)
          {
            if ((objc_msgSend(obja, "containsObject:", v31) & 1) != 0
              || objc_msgSend(obja, "containsObject:", v32))
            {
              if (dword_1EE2B3F38)
              {
                v89 = 0;
                type = OS_LOG_TYPE_DEFAULT;
                v36 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                v37 = v89;
                if (os_log_type_enabled(v36, type))
                  v38 = v37;
                else
                  v38 = v37 & 0xFFFFFFFE;
                if (v38)
                {
                  v39 = objc_msgSend(v30, "clientName");
                  v97 = 136315394;
                  v98 = "-[MXAdditiveRoutingManager copyAndUpdateSessionInformation:]";
                  v99 = 2114;
                  v100 = v39;
                  LODWORD(v60) = 22;
                  v58 = &v97;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              objc_msgSend(v30, "setAudioBehaviour:", 0, v58, v60);
              objc_msgSend(v30, "setAudioDestinationPriority:", 0);
              cmsUpdateAudioBehavior(v30);
              objc_msgSend(v67, "addObject:", v30);
              objc_msgSend(v65, "addObject:", v30);
              if (objc_msgSend(v30, "isMemberOfClass:", objc_opt_class()))
                CMSMNotificationUtility_PostSessionRouteControlFeaturesDidChange(v30, 0);
              goto LABEL_80;
            }
          }
          else if (v33 && v34)
          {
LABEL_80:

            continue;
          }
          if ((objc_msgSend(obja, "containsObject:", v31) & 1) != 0
            || objc_msgSend(obja, "containsObject:", v32))
          {
            if (v33)
              v40 = CFSTR("AudioBehaviour_Source");
            else
              v40 = CFSTR("AudioBehaviour_Destination");
            v64 = CMSUtility_CopySessionAudioBehaviour(v30);
            v41 = (void *)objc_msgSend((id)objc_msgSend(v30, "audioBehaviour"), "mutableCopy");
            objc_msgSend(v41, "removeObjectForKey:", v40);
            v42 = objc_msgSend(v64, "objectForKey:", v40);
            if (v42)
            {
              if (dword_1EE2B3F38)
              {
                v89 = 0;
                type = OS_LOG_TYPE_DEFAULT;
                v43 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                v44 = v89;
                v45 = os_log_type_enabled(v43, type);
                v46 = v44 & 0xFFFFFFFE;
                if (v45)
                  v46 = v44;
                if (v46)
                {
                  v47 = objc_msgSend(v30, "clientName");
                  v97 = 136315650;
                  v98 = "-[MXAdditiveRoutingManager copyAndUpdateSessionInformation:]";
                  v99 = 2114;
                  v100 = v47;
                  v101 = 2114;
                  v102 = v41;
                  LODWORD(v60) = 32;
                  v58 = &v97;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              objc_msgSend(v41, "setObject:forKey:", v42, v40);
              objc_msgSend(v30, "setAudioBehaviour:", v41);
              if (!v33)
                objc_msgSend(v30, "setAudioDestinationPriority:", v42);
              CMSMNotificationUtility_PostSessionAudioBehaviourDidChange(v30);
              if (objc_msgSend(v30, "isMemberOfClass:", objc_opt_class()))
                CMSMNotificationUtility_PostSessionRouteControlFeaturesDidChange(v30, 0);
              objc_msgSend(v67, "addObject:", v30, v58, v60);
              objc_msgSend(v65, "addObject:", v30);
            }

          }
          goto LABEL_80;
        }
      }
      v70 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
    }
    while (v70);
  }

  if (dword_1EE2B3F38)
  {
    v89 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v48 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v49 = v89;
    if (os_log_type_enabled(v48, type))
      v50 = v49;
    else
      v50 = v49 & 0xFFFFFFFE;
    if (v50)
    {
      v97 = 136315650;
      v98 = "-[MXAdditiveRoutingManager copyAndUpdateSessionInformation:]";
      v99 = 2114;
      v100 = (uint64_t)v71;
      v101 = 2114;
      v102 = v63;
      LODWORD(v60) = 32;
      v58 = &v97;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[MXAdditiveRoutingManager setVadIDToName:](self, "setVadIDToName:", v71, v58, v60);
  -[MXAdditiveRoutingManager setVadNameToID:](self, "setVadNameToID:", v63);

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v51 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
  if (v51)
  {
    v52 = *(_QWORD *)v77;
    do
    {
      for (m = 0; m != v51; ++m)
      {
        if (*(_QWORD *)v77 != v52)
          objc_enumerationMutation(v67);
        v54 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * m);
        if (objc_msgSend(v54, "isActive"))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_initWeak(location, v54);
            v55 = MXGetSerialQueue();
            v74[0] = MEMORY[0x1E0C809B0];
            v74[1] = 3221225472;
            v74[2] = __60__MXAdditiveRoutingManager_copyAndUpdateSessionInformation___block_invoke;
            v74[3] = &unk_1E309EC60;
            objc_copyWeak(&v75, location);
            MXDispatchAsync((uint64_t)"-[MXAdditiveRoutingManager copyAndUpdateSessionInformation:]", (uint64_t)"MXAdditiveRoutingManager.m", 380, 0, 0, v55, (uint64_t)v74);
            objc_destroyWeak(&v75);
            objc_destroyWeak(location);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              MXSimulateCrash((uint64_t)"Active MXCoreSessionSecure has lost an on-demand VAD! Please file a radar against"
                                       " 'MediaExperience Session | All'");
          }
        }
      }
      v51 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
    }
    while (v51);
  }

  return v65;
}

- (NSDictionary)vadNameToID
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (id)copyActiveSessionsInfo
{
  id v2;
  id v3;
  id v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = -[MXSessionManager copyActiveSessionsInfoForAdditiveRouting](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "copyActiveSessionsInfoForAdditiveRouting");
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  v4 = -[MXSessionManagerSecure copyActiveSessionsInfoForAdditiveRouting](+[MXSessionManagerSecure sharedInstance](MXSessionManagerSecure, "sharedInstance"), "copyActiveSessionsInfoForAdditiveRouting");
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  return v2;
}

- (id)copyDetailedRouteDescription:(unsigned int)a3
{
  uint64_t v3;
  NSDictionary *v4;
  id v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v3 = *(_QWORD *)&a3;
  v4 = -[MXAdditiveRoutingManager detailedRoutesDescription](self, "detailedRoutesDescription");
  v5 = -[NSDictionary objectForKey:](v4, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3));
  if (!v5)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v5;
}

- (NSDictionary)vadIDToName
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setVadNameToID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setVadIDToName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_12 != -1)
    dispatch_once(&sharedInstance_onceToken_12, &__block_literal_global_72);
  return (id)sharedInstance_sSharedInstance_10;
}

- (void)updateDetailedRouteDescription:(unsigned int)a3
{
  uint64_t v3;
  CFMutableDictionaryRef v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v7;

  if (a3)
  {
    v3 = *(_QWORD *)&a3;
    v5 = vaemCopyDetailedRouteDescription(a3);
    if (!v5)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", -[MXAdditiveRoutingManager detailedRoutesDescription](self, "detailedRoutesDescription"));
    objc_msgSend(v7, "setObject:forKey:", v5, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3));
    -[MXAdditiveRoutingManager setDetailedRoutesDescription:](self, "setDetailedRoutesDescription:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v7));

  }
}

- (NSDictionary)detailedRoutesDescription
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDetailedRoutesDescription:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (int)sendActiveSessionsInfoToVA
{
  int result;
  id v4;
  id v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  result = CMSMVAUtility_IsAdditiveRoutingEnabled();
  if (result)
  {
    v11 = 0;
    v4 = -[MXAdditiveRoutingManager copyActiveSessionsInfo](self, "copyActiveSessionsInfo");
    if ((objc_msgSend(v4, "isEqual:", -[MXAdditiveRoutingManager mostRecentActiveSessions](self, "mostRecentActiveSessions")) & 1) == 0)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v5, "setObject:forKey:", v4, 0x1E30A8268);
      v10 = 0;
      if (dword_1EE2B3F38)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v11 = vaemSetRouteConfigurationDictionaryOnVAD((const __CFDictionary *)v5, 0, 0, &v10);
      if (v11)
      {
        v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      -[MXAdditiveRoutingManager setMostRecentActiveSessions:](self, "setMostRecentActiveSessions:", v4, v8, v9);

    }
    return v11;
  }
  return result;
}

- (NSArray)mostRecentActiveSessions
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMostRecentActiveSessions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

MXAdditiveRoutingManager *__42__MXAdditiveRoutingManager_sharedInstance__block_invoke()
{
  MXAdditiveRoutingManager *result;

  result = objc_alloc_init(MXAdditiveRoutingManager);
  sharedInstance_sSharedInstance_10 = (uint64_t)result;
  return result;
}

- (MXAdditiveRoutingManager)init
{
  MXAdditiveRoutingManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MXAdditiveRoutingManager;
  v2 = -[MXAdditiveRoutingManager init](&v4, sel_init);
  if (v2)
  {
    v2->_detailedRoutesDescription = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    v2->_mostRecentActiveSessions = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_detailedRoutesDescription = 0;
  self->_mostRecentActiveSessions = 0;

  self->_vadIDToName = 0;
  self->_vadNameToID = 0;
  v3.receiver = self;
  v3.super_class = (Class)MXAdditiveRoutingManager;
  -[MXAdditiveRoutingManager dealloc](&v3, sel_dealloc);
}

- (id)copySessionWithAudioSessionID:(unsigned int)a3
{
  uint64_t v3;
  id result;

  v3 = *(_QWORD *)&a3;
  result = -[MXSessionManager copySessionWithAudioSessionID:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "copySessionWithAudioSessionID:", *(_QWORD *)&a3);
  if (!result)
    return -[MXSessionManagerSecure copySessionWithAudioSessionID:](+[MXSessionManagerSecure sharedInstance](MXSessionManagerSecure, "sharedInstance"), "copySessionWithAudioSessionID:", v3);
  return result;
}

void __60__MXAdditiveRoutingManager_copyAndUpdateSessionInformation___block_invoke(uint64_t a1)
{
  id Weak;
  void *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v4;

  Weak = objc_loadWeak((id *)(a1 + 32));
  if (Weak)
  {
    v2 = Weak;
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (cmsBeginInterruptionGuts(v2, 0, 2))
    {
      if (dword_1EE2B3F38)
      {
        v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      CMSUtilityApplier_PostNotification_StopCommand(v2, 0);
    }
  }
}

@end
