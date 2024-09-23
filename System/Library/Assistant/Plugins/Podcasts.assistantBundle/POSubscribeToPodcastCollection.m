@implementation POSubscribeToPodcastCollection

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  void (**v5)(id, void *);
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  _QWORD v53[4];
  void (**v54)(id, void *);
  void *v55;
  uint8_t buf[4];
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, void *))a3;
  objc_msgSend__validate(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v10;
  if (v10)
  {
    objc_msgSend_dictionary(v10, v11, v12, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v16);

  }
  else
  {
    POLogInitIfNeeded();
    if (POLogContextCommand)
      v17 = POLogContextCommand;
    else
      v17 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v22 = v17;
      objc_msgSend__subscribeRequestIdentifier(self, v23, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v57 = v27;
      _os_log_impl(&dword_217352000, v22, OS_LOG_TYPE_INFO, "Subscribing to Podcast with adamId: %@", buf, 0xCu);

    }
    objc_msgSend_hashedRouteUID(self, v18, v19, v20, v21);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend_hashedRouteUID(self, v28, v29, v30, v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v33;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v34, (uint64_t)&v55, 1, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v36 = (void *)MEMORY[0x24BDBD1A8];
    }

    objc_msgSend__subscribeRequestIdentifier(self, v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_assetInfo(self, v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_refId(self, v47, v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = sub_217357834;
    v53[3] = &unk_24D744B30;
    v54 = v5;
    objc_msgSend_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion_(POUtilities, v52, (uint64_t)v41, (uint64_t)v46, (uint64_t)v36, 0, 0, 0, v51, 0, v53);

  }
}

- (id)_subscribeRequestIdentifier
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  objc_msgSend_podcastCollection(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifierFromDomainObject_(POUtilities, v6, (uint64_t)v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_sharedInstance(MTPlaybackIdentifierUtil, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_playbackQueueIdentifierForSubscribeToPodcast_(v14, v15, (uint64_t)v9, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_validate
{
  return 0;
}

+ (id)_commandStatusForRemoteStatus:(unsigned int)a3 assistantError:(id)a4
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
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  NSObject *v35;
  objc_class *v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  uint8_t buf[16];
  uint8_t v42[16];
  uint8_t v43[16];

  v5 = a4;
  objc_msgSend_domain(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToString_(v10, v11, *MEMORY[0x24BE64CB8], v12, v13) & 1) == 0)
  {

LABEL_5:
    if ((int)a3 <= 1)
    {
      if (!a3)
      {
        POLogInitIfNeeded();
        if (POLogContextCommand)
          v35 = POLogContextCommand;
        else
          v35 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v43 = 0;
          _os_log_impl(&dword_217352000, v35, OS_LOG_TYPE_INFO, "Subscribe command succeeded", v43, 2u);
        }
        v36 = (objc_class *)MEMORY[0x24BE811B8];
        goto LABEL_40;
      }
      if (a3 == 1)
      {
        POLogInitIfNeeded();
        if (POLogContextCommand)
          v28 = POLogContextCommand;
        else
          v28 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          sub_21735CD74(v28);
LABEL_39:
        v36 = (objc_class *)MEMORY[0x24BE811A8];
LABEL_40:
        v38 = objc_alloc_init(v36);
        goto LABEL_41;
      }
LABEL_34:
      POLogInitIfNeeded();
      if (POLogContextCommand)
        v39 = POLogContextCommand;
      else
        v39 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        sub_21735CD00(a3, v39);
      goto LABEL_39;
    }
    if (a3 == 2)
    {
      POLogInitIfNeeded();
      if (POLogContextCommand)
        v37 = POLogContextCommand;
      else
        v37 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v42 = 0;
        _os_log_impl(&dword_217352000, v37, OS_LOG_TYPE_INFO, "Subscribe command failed because user was already subscribed", v42, 2u);
      }
      v30 = objc_alloc(MEMORY[0x24BE811A8]);
      v34 = (uint64_t *)MEMORY[0x24BE82328];
    }
    else
    {
      if (a3 != 10)
        goto LABEL_34;
      POLogInitIfNeeded();
      if (POLogContextCommand)
        v29 = POLogContextCommand;
      else
        v29 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217352000, v29, OS_LOG_TYPE_INFO, "Subscribe command failed because it is not subscribeable", buf, 2u);
      }
      v30 = objc_alloc(MEMORY[0x24BE811A8]);
      v34 = (uint64_t *)MEMORY[0x24BE823A8];
    }
    v38 = (id)objc_msgSend_initWithErrorCode_(v30, v31, *v34, v32, v33);
LABEL_41:
    v27 = v38;
    goto LABEL_42;
  }
  v18 = objc_msgSend_code(v5, v14, v15, v16, v17);

  if (!v18)
    goto LABEL_5;
  v19 = objc_alloc(MEMORY[0x24BE811A8]);
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v20, (uint64_t)CFSTR("MediaRemote error code %ld"), v21, v22, v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend_initWithReason_(v19, v24, (uint64_t)v23, v25, v26);

LABEL_42:
  return v27;
}

@end
