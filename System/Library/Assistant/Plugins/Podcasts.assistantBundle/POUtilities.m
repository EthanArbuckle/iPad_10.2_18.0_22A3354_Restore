@implementation POUtilities

+ (id)identifierFromDomainObject:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_identifier(a3, a2, (uint64_t)a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastPathComponent(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)typeFromDomainObject:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_identifier(a3, a2, (uint64_t)a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_host(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (void)performPodcastsPlaybackRequestWithIdentifier:(id)a3 assetInfo:(id)a4 hashedRouteUIDs:(id)a5 startPlaying:(BOOL)a6 requesterSharedUserId:(id)a7 sharedUserIdFromPlayableITunesAccount:(id)a8 context:(id)a9 completion:(id)a10
{
  char v10;

  v10 = 1;
  objc_msgSend_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion_(a1, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, a9, v10, a10);
}

+ (void)performPodcastsPlaybackRequestWithIdentifier:(id)a3 assetInfo:(id)a4 hashedRouteUIDs:(id)a5 startPlaying:(BOOL)a6 requesterSharedUserId:(id)a7 sharedUserIdFromPlayableITunesAccount:(id)a8 context:(id)a9 allowsFallback:(BOOL)a10 completion:(id)a11
{
  objc_msgSend_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_decodedRouteUIDs_originatingOutputDeviceUID_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion_(a1, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, 0, 0, a6, a7, a8, a9, a10, a11);
}

+ (void)performPodcastsPlaybackRequestWithIdentifier:(id)a3 assetInfo:(id)a4 decodedRouteUIDs:(id)a5 originatingOutputDeviceUID:(id)a6 startPlaying:(BOOL)a7 requesterSharedUserId:(id)a8 sharedUserIdFromPlayableITunesAccount:(id)a9 context:(id)a10 allowsFallback:(BOOL)a11 completion:(id)a12
{
  objc_msgSend_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_decodedRouteUIDs_originatingOutputDeviceUID_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion_(a1, a2, (uint64_t)a3, (uint64_t)a4, 0, a5, a6, a7, a8, a9, a10, a11, a12);
}

+ (void)performPodcastsPlaybackRequestWithIdentifier:(id)a3 assetInfo:(id)a4 hashedRouteUIDs:(id)a5 decodedRouteUIDs:(id)a6 originatingOutputDeviceUID:(id)a7 startPlaying:(BOOL)a8 requesterSharedUserId:(id)a9 sharedUserIdFromPlayableITunesAccount:(id)a10 context:(id)a11 allowsFallback:(BOOL)a12 completion:(id)a13
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void (**v22)(id, uint64_t, void *);
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const char *v51;
  uint64_t PlaybackQueueFromRequestIdentifiers_startPlaying_assetInfo_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount;
  MTMPCAssistantGenericPlaybackQueue *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  id v57;
  const char *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  NSObject *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char isPodcastsInstalled;
  const char *v88;
  void *v89;
  _BOOL4 v91;
  id v92;
  id v93;
  id v94;
  _QWORD v95[4];
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  void (**v106)(id, uint64_t, void *);
  id v107;
  BOOL v108;
  BOOL v109;
  id v110;
  uint8_t buf[4];
  id v112;
  __int16 v113;
  void *v114;
  __int16 v115;
  void *v116;
  __int16 v117;
  id v118;
  uint64_t v119;

  v91 = a8;
  v119 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v93 = a4;
  v18 = a5;
  v19 = a6;
  v92 = a7;
  v20 = a9;
  v94 = a10;
  v21 = a11;
  v22 = (void (**)(id, uint64_t, void *))a13;
  if (!objc_msgSend_length(v17, v23, v24, v25, v26))
  {
    v66 = v20;
    POLogInitIfNeeded();
    if (POLogContextCommand)
      v69 = POLogContextCommand;
    else
      v69 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      sub_21735CBFC(v69, (uint64_t)v70, v71, v72, v73, v74, v75, v76);
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v70, (uint64_t)CFSTR("POUtilitiesErrorDomain"), 102, 0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2](v22, 2, v77);

    v35 = v19;
    v63 = v92;
    goto LABEL_15;
  }
  v35 = v19;
  if (!objc_msgSend_count(v18, v27, v28, v29, v30)
    && (!objc_msgSend_count(v19, v31, v32, v33, v34) || !objc_msgSend_length(v92, v78, v79, v80, v81)))
  {
    objc_msgSend_sharedInstance(PODataSource, v78, v79, v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    isPodcastsInstalled = objc_msgSend_isPodcastsInstalled(v82, v83, v84, v85, v86);

    if ((isPodcastsInstalled & 1) == 0)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v88, (uint64_t)CFSTR("POUtilitiesErrorDomain"), 103, 0);
      v66 = v20;
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v22[2](v22, 2, v89);

      v63 = v92;
LABEL_15:
      v64 = v94;
      goto LABEL_16;
    }
  }
  v36 = v20;
  POLogInitIfNeeded();
  if (POLogContextCommand)
    v37 = POLogContextCommand;
  else
    v37 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v40 = v37;
    objc_msgSend_componentsJoinedByString_(v18, v41, (uint64_t)CFSTR(", "), v42, v43);
    v44 = v18;
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsJoinedByString_(v19, v46, (uint64_t)CFSTR(", "), v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v112 = v17;
    v113 = 2112;
    v114 = v45;
    v115 = 2112;
    v116 = v49;
    v117 = 2112;
    v118 = v92;
    v35 = v19;
    _os_log_impl(&dword_217352000, v40, OS_LOG_TYPE_DEFAULT, "Will be setting playbackQueue using MediaRemote to %@ with routeUIDs %@ decodedRouteUIDs %@ originatingOutputDeviceUID %@", buf, 0x2Au);

    v18 = v44;
  }
  v110 = v17;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v38, (uint64_t)&v110, 1, v39);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  PlaybackQueueFromRequestIdentifiers_startPlaying_assetInfo_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount = objc_msgSend_createPlaybackQueueFromRequestIdentifiers_startPlaying_assetInfo_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_(a1, v51, (uint64_t)v50, v91, (uint64_t)v93, v36, v94);

  v53 = [MTMPCAssistantGenericPlaybackQueue alloc];
  v56 = (void *)objc_msgSend_initWithContextID_playbackQueueRef_(v53, v54, (uint64_t)v21, PlaybackQueueFromRequestIdentifiers_startPlaying_assetInfo_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount, v55);
  v57 = objc_alloc(MEMORY[0x24BE64D00]);
  v59 = (void *)objc_msgSend_initWithAppBundleID_playerID_origin_(v57, v58, *MEMORY[0x24BE739D8], (uint64_t)CFSTR("Podcasts"), 0);
  objc_msgSend_setSingleGroup_(v59, v60, 1, v61, v62);
  v95[0] = MEMORY[0x24BDAC760];
  v95[1] = 3221225472;
  v95[2] = sub_217355EC0;
  v95[3] = &unk_24D744C60;
  v107 = a1;
  v96 = v59;
  v97 = v18;
  v98 = v35;
  v63 = v92;
  v99 = v92;
  v106 = v22;
  v100 = v56;
  v108 = a12;
  v101 = v17;
  v109 = v91;
  v102 = v93;
  v103 = v36;
  v64 = v94;
  v104 = v94;
  v105 = v21;
  v65 = v56;
  v66 = v36;
  v67 = v65;
  v68 = v59;
  MPAssistantWatchGetCurrentAudioRoutingInfo((uint64_t)v95);

LABEL_16:
}

+ (void)_resolveWithDestination:(id)a3 hashedRouteIdentifiers:(id)a4 decodedRouteIdentifiers:(id)a5 originatingOutputDeviceUID:(id)a6 localPlaybackPermitted:(BOOL)a7 audioRoutingInfo:(id)a8 completion:(id)a9
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  id v27;

  v10 = a7;
  v27 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a9;
  if (objc_msgSend_length(v16, v18, v19, v20, v21))
    objc_msgSend_setOriginatingOutputDeviceUID_(v27, v22, (uint64_t)v16, v24, v25);
  if (objc_msgSend_count(v15, v22, v23, v24, v25))
    objc_msgSend_resolveWithQueue_routeIdentifiers_localPlaybackPermitted_audioRoutingInfo_completion_(v27, v26, 0, (uint64_t)v15, v10, *(unsigned int *)&a8, v17);
  else
    objc_msgSend_resolveWithQueue_hashedRouteIdentifiers_localPlaybackPermitted_audioRoutingInfo_completion_(v27, v26, 0, (uint64_t)v14, v10, *(unsigned int *)&a8, v17);

}

+ (void)modifyContextForAirplay:(id)a3 andPlayLocally:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a4;
  v8 = a5;
  v9 = qword_254EEC628;
  v10 = a3;
  if (v9 != -1)
    dispatch_once(&qword_254EEC628, &unk_24D744C80);
  v11 = (void *)qword_254EEC620;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_2173568C8;
  v16[3] = &unk_24D744CD0;
  v17 = v7;
  v18 = v8;
  v12 = v7;
  v13 = v8;
  objc_msgSend_modifySystemMusicContextForDestination_completion_(v11, v14, (uint64_t)v10, (uint64_t)v16, v15);

}

+ (_MRSystemAppPlaybackQueue)createPlaybackQueueFromRequestIdentifiers:(id)a3 startPlaying:(BOOL)a4 assetInfo:(id)a5 requesterSharedUserId:(id)a6 sharedUserIdFromPlayableITunesAccount:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  _MRSystemAppPlaybackQueue *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;

  v10 = a6;
  v11 = a7;
  v12 = a5;
  v13 = a3;
  v14 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
  MRSystemAppPlaybackQueueSetGenericTrackIdentifiers();

  objc_msgSend_dictionaryWithCapacity_(MEMORY[0x24BDBCED8], v15, 2, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v18;
  if (v10)
    objc_msgSend_setObject_forKey_(v18, v19, (uint64_t)v10, (uint64_t)CFSTR("requesterUserId"), v20);
  if (v11)
    objc_msgSend_setObject_forKey_(v21, v19, (uint64_t)v11, (uint64_t)CFSTR("sharedUserId"), v20);
  MRSystemAppPlaybackQueueSetUserInfo();
  MRSystemAppPlaybackQueueSetTracklistShuffleMode();
  MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
  MRSystemAppPlaybackQueueSetReplaceIntent();
  MRSystemAppPlaybackQueueSetSiriAssetInfo();

  return v14;
}

+ (id)commandStatusForRemoteStatus:(unsigned int)a3 error:(id)a4 isRemoteStorePlayback:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t *v71;
  objc_class *v72;
  id v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t *v90;

  v5 = a5;
  v7 = a4;
  objc_msgSend_domain(v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToString_(v12, v13, *MEMORY[0x24BE64CB8], v14, v15) & 1) != 0)
  {
    v20 = objc_msgSend_code(v7, v16, v17, v18, v19);
  }
  else
  {
    objc_msgSend_domain(v7, v16, v17, v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v21, v22, (uint64_t)CFSTR("POUtilitiesMRSendCommandErrorDomain"), v23, v24))v20 = objc_msgSend_code(v7, v25, v26, v27, v28);
    else
      v20 = 0;

  }
  objc_msgSend_domain(v7, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v33, v34, *MEMORY[0x24BE64CA8], v35, v36))
    v41 = objc_msgSend_code(v7, v37, v38, v39, v40);
  else
    v41 = 0;

  objc_msgSend_domain(v7, v42, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v46, v47, (uint64_t)CFSTR("POUtilitiesErrorDomain"), v48, v49))
    v54 = objc_msgSend_code(v7, v50, v51, v52, v53);
  else
    v54 = 0;

  if (!v20)
  {
    if ((int)a3 > 9)
    {
      if (a3 == 20)
      {
        v68 = (uint64_t *)MEMORY[0x24BE823A0];
        goto LABEL_28;
      }
      if (a3 == 10)
      {
        v68 = (uint64_t *)MEMORY[0x24BE82340];
        goto LABEL_28;
      }
    }
    else
    {
      if (!a3)
      {
        v69 = 0;
        goto LABEL_29;
      }
      if (a3 == 1)
      {
        if (v5)
        {
          v68 = (uint64_t *)MEMORY[0x24BE82380];
LABEL_28:
          v69 = *v68;
          goto LABEL_29;
        }
        objc_msgSend_sharedInstance(PODataSource, v55, v56, v57, v58);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_podcastCollections(v79, v80, v81, v82, v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = objc_msgSend_count(v84, v85, v86, v87, v88);
        v90 = (uint64_t *)MEMORY[0x24BE82350];
        if (!v89)
          v90 = (uint64_t *)MEMORY[0x24BE82358];
        v69 = *v90;

LABEL_29:
        switch(v54)
        {
          case 'e':
            v70 = (uint64_t *)MEMORY[0x24BE82378];
            goto LABEL_34;
          case 'g':
            v70 = (uint64_t *)MEMORY[0x24BE82348];
            goto LABEL_34;
          case 'h':
            v70 = (uint64_t *)MEMORY[0x24BE82338];
            goto LABEL_34;
          case 'i':
            v70 = (uint64_t *)MEMORY[0x24BE82330];
LABEL_34:
            v69 = *v70;
            break;
          default:
            break;
        }
        if (v69)
        {
          if (v41 != 1)
            goto LABEL_43;
          v71 = (uint64_t *)MEMORY[0x24BE82330];
        }
        else if (v41 == 6)
        {
          v71 = (uint64_t *)MEMORY[0x24BE82388];
        }
        else
        {
          if (v41 != 7)
            goto LABEL_45;
          v71 = (uint64_t *)MEMORY[0x24BE82390];
        }
        v69 = *v71;
        if (*v71)
        {
LABEL_43:
          v72 = (objc_class *)MEMORY[0x24BE811A8];
          if (v69 != -1)
          {
            v73 = objc_alloc(MEMORY[0x24BE811A8]);
            v77 = (id)objc_msgSend_initWithErrorCode_(v73, v74, v69, v75, v76);
LABEL_47:
            v67 = v77;
            goto LABEL_48;
          }
LABEL_46:
          v77 = objc_alloc_init(v72);
          goto LABEL_47;
        }
LABEL_45:
        v72 = (objc_class *)MEMORY[0x24BE811B8];
        goto LABEL_46;
      }
    }
    if (v5)
      v69 = *MEMORY[0x24BE82398];
    else
      v69 = -1;
    goto LABEL_29;
  }
  v59 = objc_alloc(MEMORY[0x24BE811A8]);
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v60, (uint64_t)CFSTR("MediaRemote error code %ld"), v61, v62, v20);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (void *)objc_msgSend_initWithReason_(v59, v64, (uint64_t)v63, v65, v66);

LABEL_48:
  return v67;
}

+ (BOOL)isPodcastsNowPlaying
{
  dispatch_semaphore_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_21735709C;
  v14 = sub_2173570AC;
  v15 = 0;
  v2 = dispatch_semaphore_create(0);
  dispatch_get_global_queue(0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = v2;
  MRMediaRemoteGetNowPlayingClient();

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v3) = objc_msgSend_isEqual_((void *)v11[5], v4, (uint64_t)CFSTR("com.apple.podcasts"), v5, v6, v8, 3221225472, sub_2173570B4, &unk_24D744CF8);

  _Block_object_dispose(&v10, 8);
  return (char)v3;
}

+ (void)setPlaybackRate:(float)a3 failureErrorCode:(int64_t)a4 completion:(id)a5
{
  id v6;
  double v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  double v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v6 = a5;
  v20[0] = *MEMORY[0x24BE65950];
  *(float *)&v7 = a3;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v8, v9, v10, v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = *MEMORY[0x24BE658F0];
  v21[0] = v12;
  v21[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v13, (uint64_t)v21, (uint64_t)v20, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  POLogInitIfNeeded();
  if (POLogContextCommand)
    v15 = POLogContextCommand;
  else
    v15 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v19 = a3;
    _os_log_impl(&dword_217352000, v15, OS_LOG_TYPE_INFO, "Will be setting currentPlaybackRate using MediaRemote to %f", buf, 0xCu);
  }
  dispatch_get_global_queue(0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v6;
  MRMediaRemoteSendCommandWithReply();

}

+ (BOOL)assistantErrorIsInformational:(id)a3
{
  return 0;
}

+ (BOOL)errorIsMaxStreamCount:(id)a3
{
  return 0;
}

+ (BOOL)errorIsNoNetwork:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;

  v3 = a3;
  objc_msgSend_domain(v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v8, v9, (uint64_t)CFSTR("MTSetPlaybackQueueUtilErrorDomain"), v10, v11))v16 = objc_msgSend_code(v3, v12, v13, v14, v15) == -433001;
  else
    v16 = 0;

  return v16;
}

+ (BOOL)errorIsApplicationRequiresPreflight:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;

  v3 = a3;
  objc_msgSend_domain(v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v8, v9, *MEMORY[0x24BE64CB8], v10, v11))
    v16 = objc_msgSend_code(v3, v12, v13, v14, v15) == 15;
  else
    v16 = 0;

  return v16;
}

@end
