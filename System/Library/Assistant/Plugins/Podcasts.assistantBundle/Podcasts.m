void sub_217353934(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend_commandStatusForRemoteStatus_error_isRemoteStorePlayback_(POUtilities, a2, (uint64_t)a2, a3, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend_dictionary(v10, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v9);

}

void sub_217353BB0(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend_commandStatusForRemoteStatus_error_isRemoteStorePlayback_(POUtilities, a2, (uint64_t)a2, a3, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend_dictionary(v10, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v9);

}

id sub_217353E14(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;

  v3 = (objc_class *)MEMORY[0x24BDD1838];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v6, (uint64_t)v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithName_value_(v5, v10, (uint64_t)v4, (uint64_t)v9, v11);

  return v12;
}

id sub_217354028(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;

  v3 = (objc_class *)MEMORY[0x24BDD1838];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v6, (uint64_t)v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithName_value_(v5, v10, (uint64_t)v4, (uint64_t)v9, v11);

  return v12;
}

void sub_217354134(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void *v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("playPodcast");
  v7[1] = CFSTR("playPodcasts");
  v7[2] = CFSTR("playStation");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], a2, (uint64_t)v7, 3, a5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_254EEC600;
  qword_254EEC600 = v5;

}

void sub_217354BF4(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x24BDAC8D0];
  v4[0] = CFSTR("playPodcasts");
  v4[1] = CFSTR("playPodcast");
  v5[0] = &unk_24D749A18;
  v5[1] = &unk_24D749A30;
  v4[2] = CFSTR("playStation");
  v5[2] = &unk_24D749A48;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v5, (uint64_t)v4, 3);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_254EEC618;
  qword_254EEC618 = v2;

}

void sub_217355EC0(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  const char *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  char v21;
  char v22;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_217356000;
  v12[3] = &unk_24D744C38;
  v8 = *(void **)(a1 + 120);
  v19 = *(id *)(a1 + 112);
  v9 = *(id *)(a1 + 64);
  v21 = *(_BYTE *)(a1 + 128);
  v10 = *(_QWORD *)(a1 + 120);
  v13 = v9;
  v20 = v10;
  v14 = *(id *)(a1 + 72);
  v22 = *(_BYTE *)(a1 + 129);
  v15 = *(id *)(a1 + 80);
  v16 = *(id *)(a1 + 88);
  v17 = *(id *)(a1 + 96);
  v18 = *(id *)(a1 + 104);
  objc_msgSend__resolveWithDestination_hashedRouteIdentifiers_decodedRouteIdentifiers_originatingOutputDeviceUID_localPlaybackPermitted_audioRoutingInfo_completion_(v8, v11, v4, v5, v6, v7, 1, a2, v12);

}

void sub_217356000(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  const char *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v23 = *MEMORY[0x24BE658A8];
  v24[0] = &unk_24D749A78;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v4, (uint64_t)v24, (uint64_t)&v23, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BE64CD8]);
  v7 = *(_QWORD *)(a1 + 32);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_2173561A4;
  v12[3] = &unk_24D744C10;
  v8 = *(id *)(a1 + 80);
  v21 = *(_BYTE *)(a1 + 96);
  v13 = v3;
  v9 = *(_QWORD *)(a1 + 88);
  v19 = v8;
  v20 = v9;
  v14 = *(id *)(a1 + 40);
  v22 = *(_BYTE *)(a1 + 97);
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  v17 = *(id *)(a1 + 64);
  v18 = *(id *)(a1 + 72);
  v10 = v3;
  objc_msgSend_sendPlaybackQueueWithResult_toDestination_withOptions_completion_(v6, v11, v7, (uint64_t)v10, (uint64_t)v5, v12);

}

void sub_2173561A4(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  NSObject *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  const char *v63;
  uint64_t PlaybackQueueFromRequestIdentifiers_startPlaying_assetInfo_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount;
  MTMPCAssistantGenericPlaybackQueue *v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(void);
  NSObject *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  NSObject *v108;
  NSObject *v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  uint8_t buf[4];
  _BYTE v115[14];
  __int16 v116;
  uint64_t v117;
  uint64_t v118;
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v8 = v3;
  v9 = MEMORY[0x24BDACB70];
  if (v3)
  {
    objc_msgSend_returnStatuses(v3, v4, v5, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v10, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_unsignedIntValue(v15, v16, v17, v18, v19);

    objc_msgSend_error(v8, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    POLogInitIfNeeded();
    if (POLogContextCommand)
      v26 = POLogContextCommand;
    else
      v26 = v9;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      objc_msgSend_localizedDescription(v25, v28, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v115 = v32;
      _os_log_impl(&dword_217352000, v27, OS_LOG_TYPE_DEFAULT, "sendPlaybackQueueWithResult Error: %@", buf, 0xCu);

    }
    POLogInitIfNeeded();
    if (POLogContextCommand)
      v33 = POLogContextCommand;
    else
      v33 = v9;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v115 = v20;
      _os_log_impl(&dword_217352000, v33, OS_LOG_TYPE_DEFAULT, "sendPlaybackQueueWithResult Status: %d", buf, 8u);
    }
    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    objc_msgSend_underlyingErrors(v25, v34, v35, v36, v37, 0);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v110, (uint64_t)v119, 16);
    if (v40)
    {
      v44 = v40;
      v45 = *(_QWORD *)v111;
      while (2)
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v111 != v45)
            objc_enumerationMutation(v38);
          if (objc_msgSend_errorIsNoNetwork_(POUtilities, v41, *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * i), v42, v43))
          {
            POLogInitIfNeeded();
            if (POLogContextCommand)
              v69 = POLogContextCommand;
            else
              v69 = MEMORY[0x24BDACB70];
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
              sub_21735CCD0(v69, v70, v71, v72, v73, v74, v75, v76);
            v77 = *(void (**)(void))(*(_QWORD *)(a1 + 80) + 16);
            goto LABEL_63;
          }
        }
        v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v41, (uint64_t)&v110, (uint64_t)v119, 16);
        if (v44)
          continue;
        break;
      }
    }

    v51 = v20;
    v52 = MEMORY[0x24BDACB70];
    if (*(_BYTE *)(a1 + 96))
    {
      objc_msgSend_outputDeviceUIDs(*(void **)(a1 + 32), v47, v48, v49, v50);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_count(v53, v54, v55, v56, v57))
      {

        if ((v51 - 1) <= 1)
        {
          POLogInitIfNeeded();
          if (POLogContextCommand)
            v58 = POLogContextCommand;
          else
            v58 = v52;
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v115 = v51;
            _os_log_impl(&dword_217352000, v58, OS_LOG_TYPE_DEFAULT, "Falling back to airplay after status: %d", buf, 8u);
          }
          v61 = *(void **)(a1 + 88);
          v118 = *(_QWORD *)(a1 + 40);
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v59, (uint64_t)&v118, 1, v60);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          PlaybackQueueFromRequestIdentifiers_startPlaying_assetInfo_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount = objc_msgSend_createPlaybackQueueFromRequestIdentifiers_startPlaying_assetInfo_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_(v61, v63, (uint64_t)v62, *(unsigned __int8 *)(a1 + 97), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

          v65 = [MTMPCAssistantGenericPlaybackQueue alloc];
          v38 = (id)objc_msgSend_initWithContextID_playbackQueueRef_(v65, v66, *(_QWORD *)(a1 + 72), PlaybackQueueFromRequestIdentifiers_startPlaying_assetInfo_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount, v67);
          objc_msgSend_modifyContextForAirplay_andPlayLocally_completion_(*(void **)(a1 + 88), v68, *(_QWORD *)(a1 + 32), (uint64_t)v38, *(_QWORD *)(a1 + 80));
          goto LABEL_64;
        }
      }
      else
      {

      }
    }
    if (!*(_QWORD *)(a1 + 80))
    {
LABEL_65:

      goto LABEL_66;
    }
    objc_msgSend_domain(v25, v47, v48, v49, v50);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v86, v87, *MEMORY[0x24BE64CB8], v88, v89))
      v94 = objc_msgSend_code(v25, v90, v91, v92, v93);
    else
      v94 = 0;

    objc_msgSend_domain(v25, v95, v96, v97, v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v99, v100, *MEMORY[0x24BE64CA8], v101, v102))
      v107 = objc_msgSend_code(v25, v103, v104, v105, v106);
    else
      v107 = 0;

    POLogInitIfNeeded();
    if (POLogContextCommand)
      v108 = POLogContextCommand;
    else
      v108 = v52;
    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v115 = v51;
      *(_WORD *)&v115[4] = 2048;
      *(_QWORD *)&v115[6] = v94;
      v116 = 2048;
      v117 = v107;
      _os_log_impl(&dword_217352000, v108, OS_LOG_TYPE_DEFAULT, "Completed sendPlaybackQueueWithResult with MR status: %d, remote error: %ld, assistant error: %ld", buf, 0x1Cu);
    }
    if (v25 && (MPCAssistantErrorIsInformational() & 1) == 0)
    {
      v38 = v25;
      POLogInitIfNeeded();
      if (POLogContextCommand)
        v109 = POLogContextCommand;
      else
        v109 = v52;
      if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
        sub_21735CC5C((uint64_t)v38, v109);
    }
    else
    {
      v38 = 0;
    }
    v77 = *(void (**)(void))(*(_QWORD *)(a1 + 80) + 16);
LABEL_63:
    v77();
LABEL_64:

    goto LABEL_65;
  }
  POLogInitIfNeeded();
  if (POLogContextCommand)
    v78 = POLogContextCommand;
  else
    v78 = v9;
  if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    sub_21735CC2C(v78, v79, v80, v81, v82, v83, v84, v85);
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
LABEL_66:

}

void sub_2173568A0()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BE64CF8]);
  v1 = (void *)qword_254EEC620;
  qword_254EEC620 = (uint64_t)v0;

}

void sub_2173568C8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, 2, v3);
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x24BE64CD8]);
    v6 = objc_alloc(MEMORY[0x24BE64D28]);
    v8 = (void *)objc_msgSend_initWithAppBundleID_playerID_origin_(v6, v7, *MEMORY[0x24BE739D8], (uint64_t)CFSTR("Podcasts"), 0);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = sub_2173569C0;
    v11[3] = &unk_24D744CA8;
    v9 = *(_QWORD *)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    objc_msgSend_sendPlaybackQueue_toDestination_completion_(v5, v10, v9, (uint64_t)v8, (uint64_t)v11);

  }
}

void sub_2173569C0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
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
  NSObject *v42;
  uint64_t v43;
  _DWORD v44[2];
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend_firstObject(a3, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_unsignedIntValue(v10, v11, v12, v13, v14);

  objc_msgSend_domain(v5, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v20, v21, *MEMORY[0x24BE64CB8], v22, v23))
    v28 = objc_msgSend_code(v5, v24, v25, v26, v27);
  else
    v28 = 0;

  objc_msgSend_domain(v5, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v33, v34, *MEMORY[0x24BE64CA8], v35, v36))
    v41 = objc_msgSend_code(v5, v37, v38, v39, v40);
  else
    v41 = 0;

  POLogInitIfNeeded();
  if (POLogContextCommand)
    v42 = POLogContextCommand;
  else
    v42 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    v44[0] = 67109632;
    v44[1] = v15;
    v45 = 2048;
    v46 = v28;
    v47 = 2048;
    v48 = v41;
    _os_log_impl(&dword_217352000, v42, OS_LOG_TYPE_DEFAULT, "Completed Airplay fallback with MR status: %d, remote error: %ld, assistant error: %ld", (uint8_t *)v44, 0x1Cu);
  }
  v43 = *(_QWORD *)(a1 + 32);
  if (v43)
    (*(void (**)(uint64_t, uint64_t, id))(v43 + 16))(v43, v15, v5);

}

void sub_217357084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21735709C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2173570AC(uint64_t a1)
{

}

void sub_2173570B4(uint64_t a1)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;

  v16 = (id)MRNowPlayingClientCopyBundleIdentifierHierarchy();
  MRNowPlayingClientGetParentAppBundleIdentifier();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v16, v3, v4, v5, v6))
  {
    objc_msgSend_lastObject(v16, v7, v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;
  }
  else
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = v2;
    v13 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v15;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_217357304(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  int v17;
  BOOL v18;
  NSObject *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  int v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v3 = a2;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v28, (uint64_t)v34, 16);
  if (!v5)
  {

LABEL_26:
    v12 = objc_alloc_init(MEMORY[0x24BE811B8]);
    goto LABEL_27;
  }
  v11 = v5;
  v12 = 0;
  v13 = *(_QWORD *)v29;
  v14 = MEMORY[0x24BDACB70];
  *(_QWORD *)&v10 = 67109120;
  v27 = v10;
LABEL_3:
  v15 = 0;
  while (1)
  {
    if (*(_QWORD *)v29 != v13)
      objc_enumerationMutation(v3);
    v16 = objc_msgSend_integerValue(*(void **)(*((_QWORD *)&v28 + 1) + 8 * v15), v6, v7, v8, v9, v27, (_QWORD)v28);
    v17 = v16;
    if (v16)
      v18 = v16 == 3;
    else
      v18 = 1;
    if (!v18)
    {
      POLogInitIfNeeded();
      if (POLogContextCommand)
        v19 = POLogContextCommand;
      else
        v19 = v14;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v27;
        v33 = v17;
        _os_log_error_impl(&dword_217352000, v19, OS_LOG_TYPE_ERROR, "MediaRemote command failed with status %u", buf, 8u);
      }
      v20 = objc_alloc(MEMORY[0x24BE811A8]);
      v24 = objc_msgSend_initWithErrorCode_(v20, v21, *(_QWORD *)(a1 + 40), v22, v23);

      v12 = (id)v24;
    }
    if (v17 != 3 && v17 != 0)
      break;
    if (v11 == ++v15)
    {
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v28, (uint64_t)v34, 16);
      if (v11)
        goto LABEL_3;
      break;
    }
  }

  if (!v12)
    goto LABEL_26;
LABEL_27:
  v26 = *(_QWORD *)(a1 + 32);
  if (v26)
    (*(void (**)(uint64_t, id))(v26 + 16))(v26, v12);

}

void sub_2173575D8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_217357834(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend__commandStatusForRemoteStatus_assistantError_(POSubscribeToPodcastCollection, a2, (uint64_t)a2, a3, a5);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend_dictionary(v12, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v11);

}

void sub_217357C4C()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)qword_253E64738;
  qword_253E64738 = (uint64_t)v0;

}

void sub_21735814C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v5 = a3;
  v6 = a2;
  objc_msgSend_URLByAppendingPathComponent_(v6, v7, (uint64_t)CFSTR("Documents/PodcastsDB.plist"), v8, v9);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByAppendingPathComponent_(v6, v10, (uint64_t)CFSTR("Documents/PodcastsDiff.plist"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_217358258(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_2173582E0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_217358848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217358860(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;

  v5 = a2;
  v10 = a3;
  if (v5)
  {
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_path(v5, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_attributesOfItemAtPath_error_(v11, v17, (uint64_t)v16, 0, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileModificationDate(v19, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_revisionsDataPlistLastModified(*(void **)(a1 + 32), v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend_isEqual_(v24, v30, (uint64_t)v29, v31, v32) ^ 1;

  }
  else
  {
    POLogInitIfNeeded();
    if (POLogContextSync)
      v33 = POLogContextSync;
    else
      v33 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      sub_21735CE94();
  }

}

void sub_217358A0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217358A24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;

  v5 = a2;
  v10 = a3;
  if (v5)
  {
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_path(v5, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_attributesOfItemAtPath_error_(v11, v17, (uint64_t)v16, 0, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileModificationDate(v19, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_podcastDataPlistLastModified(*(void **)(a1 + 32), v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend_isEqual_(v24, v30, (uint64_t)v29, v31, v32) ^ 1;

  }
  else
  {
    POLogInitIfNeeded();
    if (POLogContextSync)
      v33 = POLogContextSync;
    else
      v33 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      sub_21735CEF4();
  }

}

void sub_217358C08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217358CE0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217358E30(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217358F00(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  const char *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;

  v9 = a4;
  if (v9)
  {
    POLogInitIfNeeded();
    if (POLogContextSync)
      v10 = POLogContextSync;
    else
      v10 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_21735CF8C();
  }
  else
  {
    objc_msgSend__withExtensionParseDataDictionary_revisionDictionary_(*(void **)(a1 + 32), v7, a2, a3, v8);
  }

}

void sub_21735A3E8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_21735A424(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void sub_21735A59C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend_commandStatusForRemoteStatus_error_isRemoteStorePlayback_(POUtilities, a2, (uint64_t)a2, a3, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend_dictionary(v10, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v9);

}

uint64_t sub_21735A8B8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21735A8C8(uint64_t a1)
{

}

void sub_21735A8D0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  if (!v2)
    v2 = *(void **)(v1 + 56);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void sub_21735A984(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _MTLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_217352000, v2, OS_LOG_TYPE_DEFAULT, "MTAccountController: Setting active account: %@", (uint8_t *)&v4, 0xCu);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 56), *(id *)(a1 + 32));
}

void sub_21735AB4C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;

  if ((objc_msgSend_hasFetchedInitialAccount(*(void **)(a1 + 32), a2, a3, a4, a5) & 1) == 0)
    objc_msgSend__updateActiveAccount(*(void **)(a1 + 32), v6, v7, v8, v9);
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_21735ABE4;
    block[3] = &unk_24D744E98;
    v13 = v10;
    dispatch_async(v11, block);

  }
}

uint64_t sub_21735ABE4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_21735AEA8(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t v25[16];

  _MTLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_217352000, v2, OS_LOG_TYPE_DEFAULT, "MTAccountController: updating active account", v25, 2u);
  }

  objc_msgSend__activeAccountBlocking(*(void **)(a1 + 32), v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ams_DSID(v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringValue(v12, v13, v14, v15, v16);
  v17 = objc_claimAutoreleasedReturnValue();

  v21 = *(_QWORD *)(a1 + 40);
  if (v21 | v17 && (objc_msgSend_isEqualToString_((void *)v21, v18, v17, v19, v20) & 1) == 0)
    dispatch_async(MEMORY[0x24BDAC9B8], &unk_24D744EE0);
  objc_msgSend_setActiveAccount_(*(void **)(a1 + 32), v18, (uint64_t)v7, v19, v20);
  objc_msgSend_setHasFetchedInitialAccount_(*(void **)(a1 + 32), v22, 1, v23, v24);

}

void sub_21735AF90(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v5;
  uint64_t v6;
  id v7;

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_(v7, v5, (uint64_t)CFSTR("AccountDSIDChangedNotification"), 0, v6);

}

void sub_21735B784(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend_commandStatusForRemoteStatus_error_isRemoteStorePlayback_(POUtilities, a2, (uint64_t)a2, a3, *(unsigned __int8 *)(a1 + 40));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend_dictionary(v10, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v9);

}

void POLogInitIfNeeded()
{
  if (qword_253E64728 != -1)
    dispatch_once(&qword_253E64728, &unk_24D744F28);
}

void sub_21735BA00()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create((const char *)POLoggingSubsystem, (const char *)POLoggingContextCommand);
  v1 = (void *)POLogContextCommand;
  POLogContextCommand = (uint64_t)v0;

  v2 = os_log_create((const char *)POLoggingSubsystem, (const char *)POLoggingContextCommand);
  v3 = (void *)POLogContextSync;
  POLogContextSync = (uint64_t)v2;

}

id POAssistantDecodeHashedRouteUIDs(void *a1)
{
  id v1;
  id v2;
  id v3;
  NSObject *v4;
  dispatch_queue_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  dispatch_time_t v18;
  id obj;
  _QWORD v21[4];
  NSObject *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = objc_alloc_init((Class)MSVWeakLinkClass());
  v4 = dispatch_group_create();
  v5 = dispatch_queue_create("DecodeSerialQueue", 0);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v1;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v26, (uint64_t)v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v10);
        v12 = objc_alloc(MEMORY[0x24BDBCE50]);
        v15 = (void *)objc_msgSend_initWithBase64EncodedString_options_(v12, v13, v11, 0, v14);
        dispatch_group_enter(v4);
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = sub_21735BF5C;
        v21[3] = &unk_24D744F78;
        v22 = v5;
        v23 = v11;
        v24 = v2;
        v25 = v4;
        objc_msgSend_processData_usingProcedure_completion_(v3, v16, (uint64_t)v15, 2, (uint64_t)v21);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v26, (uint64_t)v30, 16);
    }
    while (v8);
  }

  v18 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v4, v18);

  return v2;
}

void sub_21735BF5C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    POLogInitIfNeeded();
    if (POLogContextCommand)
      v7 = POLogContextCommand;
    else
      v7 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_21735D1FC((uint64_t)v6, v7);
  }
  else
  {
    v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_21735C050;
    block[3] = &unk_24D744F50;
    v9 = v5;
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(a1 + 48);
    v13 = v9;
    v14 = v10;
    v15 = v11;
    dispatch_sync(v8, block);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void sub_21735C050(uint64_t a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;

  v2 = objc_alloc(MEMORY[0x24BDD17C8]);
  v5 = (void *)objc_msgSend_initWithData_encoding_(v2, v3, *(_QWORD *)(a1 + 32), 4, v4);
  POLogInitIfNeeded();
  if (POLogContextCommand)
    v6 = POLogContextCommand;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    sub_21735D270(a1, (uint64_t)v5, v6);
    if (!v5)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (v5)
LABEL_6:
    objc_msgSend_setObject_forKey_(*(void **)(a1 + 48), v7, *(_QWORD *)(a1 + 40), (uint64_t)v5, v8);
LABEL_7:

}

uint64_t sub_21735C920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](a2, sel_compare_options_, a3, 64, a5);
}

uint64_t MPAssistantWatchIsConnectedToCompanion()
{
  return 0;
}

uint64_t MPAssistantWatchGetCompanionOriginUniqueIdentifier()
{
  return 1129140302;
}

uint64_t MPAssistantWatchGetCurrentAudioRoutingInfo(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 16))(a1, 0);
}

void sub_21735CBFC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2173575D8(&dword_217352000, a1, a3, "Unable to play an empty URL", a5, a6, a7, a8, 0);
  sub_2173575E8();
}

void sub_21735CC2C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2173575D8(&dword_217352000, a1, a3, "No result from sendPlaybackQueueWithResult.", a5, a6, a7, a8, 0);
  sub_2173575E8();
}

void sub_21735CC5C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_217352000, a2, OS_LOG_TYPE_ERROR, "sendPlaybackQueueWithResult encountered error %@", (uint8_t *)&v2, 0xCu);
}

void sub_21735CCD0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2173575D8(&dword_217352000, a1, a3, "sendPlaybackQueueWithResult encountered a network error -- Network connection needed but there is no network connection.", a5, a6, a7, a8, 0);
  sub_2173575E8();
}

void sub_21735CD00(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_217352000, a2, OS_LOG_TYPE_ERROR, "Subscribe command failed with an unexpected error code: %u", (uint8_t *)v2, 8u);
}

void sub_21735CD74(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_217352000, log, OS_LOG_TYPE_ERROR, "Subscribe command failed because we could not find the podcast at this time", v1, 2u);
}

void sub_21735CDB4()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  sub_21735A40C();
  _os_log_fault_impl(&dword_217352000, v0, OS_LOG_TYPE_FAULT, "Error reading plist from path: %@ - with error: %@", v1, 0x16u);
  sub_21735A3F8();
}

void sub_21735CE24()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  sub_21735A40C();
  _os_log_error_impl(&dword_217352000, v0, OS_LOG_TYPE_ERROR, "Error reading plist at %@: %@", v1, 0x16u);
  sub_21735A3F8();
}

void sub_21735CE94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_21735A400();
  sub_21735A3E8(&dword_217352000, v0, v1, "Failed to get revision URL for PODataSource with error: %@", v2, v3, v4, v5, v6);
  sub_21735A3F8();
}

void sub_21735CEF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_21735A400();
  sub_21735A3E8(&dword_217352000, v0, v1, "Failed to get database URL for PODataSource with error: %@", v2, v3, v4, v5, v6);
  sub_21735A3F8();
}

void sub_21735CF54(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_21735A424(&dword_217352000, a1, a3, "Recursive call to initializeData while constructing. This is a programming error.  Please fix.", v3);
}

void sub_21735CF8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_21735A400();
  sub_21735A3E8(&dword_217352000, v0, v1, "Failed to get plist URLs for PODataSource with error: %@", v2, v3, v4, v5, v6);
  sub_21735A3F8();
}

void sub_21735CFEC(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_21735A424(&dword_217352000, a3, (uint64_t)a3, "Unable to get UUID for first revision.", a1);
}

void sub_21735D020()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_21735A400();
  sub_21735A3E8(&dword_217352000, v0, v1, "Unable to get UUID for root object, sync data will not have proper validity.  Dictionary at URL %@ is malformed.", v2, v3, v4, v5, v6);
  sub_21735A3F8();
}

void sub_21735D080()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_21735A400();
  sub_21735A3E8(&dword_217352000, v0, v1, "Unable to locate root child array.  Dictionary at URL %@ is malformed.", v2, v3, v4, v5, v6);
  sub_21735A3F8();
}

void sub_21735D0E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_21735A400();
  sub_21735A3E8(&dword_217352000, v0, v1, "First child's children isn't of length 2.  Dictionary at URL %@ is malformed.", v2, v3, v4, v5, v6);
  sub_21735A3F8();
}

void sub_21735D140(void *a1, void *a2)
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend_podcastCollection(a2, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 138412290;
  v15 = v13;
  _os_log_error_impl(&dword_217352000, v3, OS_LOG_TYPE_ERROR, "unable to create a play queue for identifier: %@", (uint8_t *)&v14, 0xCu);

}

void sub_21735D1FC(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_217352000, a2, OS_LOG_TYPE_DEBUG, "Error decoding route UID: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_21735D270(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_217352000, log, OS_LOG_TYPE_DEBUG, "%@ => %@", (uint8_t *)&v4, 0x16u);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC838](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(_QWORD *)&encoding);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x24BDBC840](allocator, originalString, charactersToLeaveEscaped);
}

uint64_t MPCAssistantErrorIsInformational()
{
  return MEMORY[0x24BE64CB0]();
}

uint64_t MRMediaRemoteGetNowPlayingClient()
{
  return MEMORY[0x24BE65180]();
}

uint64_t MRMediaRemoteSendCommandWithReply()
{
  return MEMORY[0x24BE65248]();
}

uint64_t MRNowPlayingClientCopyBundleIdentifierHierarchy()
{
  return MEMORY[0x24BE65290]();
}

uint64_t MRNowPlayingClientGetParentAppBundleIdentifier()
{
  return MEMORY[0x24BE652B0]();
}

uint64_t MRSystemAppPlaybackQueueCreate()
{
  return MEMORY[0x24BE653F8]();
}

uint64_t MRSystemAppPlaybackQueueSetGenericTrackIdentifiers()
{
  return MEMORY[0x24BE65438]();
}

uint64_t MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback()
{
  return MEMORY[0x24BE65440]();
}

uint64_t MRSystemAppPlaybackQueueSetReplaceIntent()
{
  return MEMORY[0x24BE65468]();
}

uint64_t MRSystemAppPlaybackQueueSetSiriAssetInfo()
{
  return MEMORY[0x24BE65478]();
}

uint64_t MRSystemAppPlaybackQueueSetTracklistShuffleMode()
{
  return MEMORY[0x24BE654A0]();
}

uint64_t MRSystemAppPlaybackQueueSetUserInfo()
{
  return MEMORY[0x24BE654B0]();
}

uint64_t MSVWeakLinkClass()
{
  return MEMORY[0x24BE65C18]();
}

uint64_t MTEpisodeContextFromPersistentString()
{
  return MEMORY[0x24BE73778]();
}

uint64_t MTEpisodeContextSortTypeFromPersistentString()
{
  return MEMORY[0x24BE73780]();
}

uint64_t MTPlayReasonFromPersistentString()
{
  return MEMORY[0x24BE73788]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

uint64_t NSPersistentStringForMTEpisodeContext()
{
  return MEMORY[0x24BE737A0]();
}

uint64_t NSPersistentStringForMTEpisodeContextSortType()
{
  return MEMORY[0x24BE737A8]();
}

uint64_t NSPersistentStringForMTPlayReason()
{
  return MEMORY[0x24BE737B0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _MTLogCategoryDefault()
{
  return MEMORY[0x24BE73870]();
}

uint64_t _MTLogCategorySiri()
{
  return MEMORY[0x24BE73890]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t container_copy_sandbox_token()
{
  return MEMORY[0x24BDADA40]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x24BDADA88]();
}

uint64_t container_get_path()
{
  return MEMORY[0x24BDADAC0]();
}

uint64_t container_query_create()
{
  return MEMORY[0x24BDADB18]();
}

uint64_t container_query_free()
{
  return MEMORY[0x24BDADB20]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x24BDADB28]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x24BDADB30]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x24BDADB48]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x24BDADB58]();
}

uint64_t container_query_set_identifiers()
{
  return MEMORY[0x24BDADB68]();
}

uint64_t container_query_set_include_other_owners()
{
  return MEMORY[0x24BDADB70]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x24BDAFC00]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x24BDAFC20]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

