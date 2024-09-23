@implementation POPlayPodcasts

- (void)performWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t started;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  _QWORD v43[4];
  void (**v44)(id, void *);

  v4 = (void (**)(id, void *))a3;
  objc_msgSend__validate(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v9;
  if (v9)
  {
    objc_msgSend_dictionary(v9, v10, v11, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v15);

  }
  else
  {
    objc_msgSend__playbackRequestIdentifier(self, v10, v11, v12, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_hashedRouteUIDs(self, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    started = objc_msgSend_startPlaying(self, v22, v23, v24, v25);
    objc_msgSend_requesterSharedUserId(self, v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharedUserIdFromPlayableITunesAccount(self, v32, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_refId(self, v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = sub_21735A59C;
    v43[3] = &unk_24D744B30;
    v44 = v4;
    objc_msgSend_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_completion_(POUtilities, v42, (uint64_t)v16, 0, (uint64_t)v21, started, v31, v36, v41, v43);

  }
}

- (id)_playbackRequestIdentifier
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  objc_msgSend_sharedInstance(MTPlaybackIdentifierUtil, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_episodePlaybackOrder(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_playbackQueueIdentifierForPlayMyPodcastsWithPlaybackOrder_(v6, v12, (uint64_t)v11, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_validate
{
  return 0;
}

@end
