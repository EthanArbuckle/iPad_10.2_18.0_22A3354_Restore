@implementation POPlayPodcastCollection

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  void (**v5)(id, void *);
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t started;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  _QWORD v47[4];
  void (**v48)(id, void *);
  char v49;
  uint64_t v50;
  char v51;

  v5 = (void (**)(id, void *))a3;
  v51 = 0;
  v50 = 0;
  objc_msgSend__playbackQueueIdentifiers_queueStatus_(self, v6, (uint64_t)&v51, (uint64_t)&v50, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__validate(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v13;
  if (v13)
  {
    objc_msgSend_dictionary(v13, v14, v15, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v19);
  }
  else
  {
    objc_msgSend_assetInfo(self, v14, v15, v16, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_hashedRouteUIDs(self, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    started = objc_msgSend_startPlaying(self, v26, v27, v28, v29);
    objc_msgSend_requesterSharedUserId(self, v31, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharedUserIdFromPlayableITunesAccount(self, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_refId(self, v41, v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = sub_21735B784;
    v47[3] = &unk_24D744F08;
    v49 = v51;
    v48 = v5;
    objc_msgSend_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_completion_(POUtilities, v46, (uint64_t)v8, (uint64_t)v20, (uint64_t)v25, started, v35, v40, v45, v47);

    v19 = v48;
  }

}

- (id)_playbackQueueIdentifiers:(BOOL *)a3 queueStatus:(unint64_t *)a4
{
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
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
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  NSObject *v62;

  objc_msgSend_podcastCollection(self, a2, (uint64_t)a3, (uint64_t)a4, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_typeFromDomainObject_(POUtilities, v8, (uint64_t)v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_podcastCollection(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifierFromDomainObject_(POUtilities, v17, (uint64_t)v16, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_isEqualToString_(v11, v21, (uint64_t)CFSTR("device"), v22, v23))
  {
    objc_msgSend_sharedInstance(PODataSource, v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_podcastCollectionWithUUID_(v28, v29, (uint64_t)v20, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_feedUrl(v32, v33, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_sharedInstance(MTPlaybackIdentifierUtil, v38, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_episodePlaybackOrder(self, v43, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_universalPlaybackQueueIdentifierForPodcastUuid_podcastFeedUrl_podcastStoreId_sampPlaybackOrder_(v42, v48, (uint64_t)v20, (uint64_t)v37, 0, v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (objc_msgSend_isEqualToString_(v11, v24, (uint64_t)CFSTR("store"), v26, v27))
  {
    objc_msgSend_sharedInstance(MTPlaybackIdentifierUtil, v50, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_episodePlaybackOrder(self, v55, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_playbackQueueIdentifierForPodcastAdamId_sampPlaybackOrder_(v54, v60, (uint64_t)v20, (uint64_t)v59, v61);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
      *a3 = 1;
  }
  else
  {
    POLogInitIfNeeded();
    if (POLogContextCommand)
      v62 = POLogContextCommand;
    else
      v62 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      sub_21735D140(v62, self);
    v49 = 0;
  }

  return v49;
}

- (id)_validate
{
  return 0;
}

@end
