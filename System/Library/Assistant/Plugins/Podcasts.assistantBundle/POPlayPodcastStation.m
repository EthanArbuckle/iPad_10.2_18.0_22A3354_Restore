@implementation POPlayPodcastStation

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
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t started;
  const char *v28;
  uint64_t v29;
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
  _QWORD v44[4];
  void (**v45)(id, void *);

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
    objc_msgSend__playbackRequestIdentifier(self, v11, v12, v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_hashedRouteUIDs(self, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    started = objc_msgSend_startPlaying(self, v23, v24, v25, v26);
    objc_msgSend_requesterSharedUserId(self, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharedUserIdFromPlayableITunesAccount(self, v33, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_refId(self, v38, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = sub_217353934;
    v44[3] = &unk_24D744B30;
    v45 = v5;
    objc_msgSend_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_completion_(POUtilities, v43, (uint64_t)v17, 0, (uint64_t)v22, started, v32, v37, v42, v44);

  }
}

- (id)_playbackRequestIdentifier
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
  void *v16;

  objc_msgSend_station(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifierFromDomainObject_(POUtilities, v6, (uint64_t)v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_sharedInstance(MTPlaybackIdentifierUtil, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_universalPlaybackQueueIdentifierForStationUuid_episodeGuid_episodeStoreId_podcastFeedUrl_(v14, v15, (uint64_t)v9, 0, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_validate
{
  return 0;
}

@end
