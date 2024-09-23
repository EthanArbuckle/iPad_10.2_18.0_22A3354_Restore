@implementation MTPlaybackIdentifierUtil

- (id)playbackRequestURLWithPlayReason:(unint64_t)a3 baseRequestURLString:(id)a4
{
  uint64_t v4;
  void *v5;
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
  void *v16;
  const char *v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  _QWORD v50[4];
  id v51;

  objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], a2, (uint64_t)a4, (uint64_t)a4, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_class();
  objc_msgSend_query(v5, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___queryStringToQueryDictionary_(v6, v12, (uint64_t)v11, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  NSPersistentStringForMTPlayReason();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v15, v17, (uint64_t)v16, (uint64_t)CFSTR("playReason"), v18);

  v19 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend_scheme(v5, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setScheme_(v19, v25, (uint64_t)v24, v26, v27);

  objc_msgSend_host(v5, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHost_(v19, v33, (uint64_t)v32, v34, v35);

  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = sub_217353E14;
  v50[3] = &unk_24D744B70;
  v51 = v15;
  v36 = v15;
  objc_msgSend_mt_compactMap_(v36, v37, (uint64_t)v50, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setQueryItems_(v19, v41, (uint64_t)v40, v42, v43);

  objc_msgSend_string(v19, v44, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  return v48;
}

- (id)playbackRequestURLWithDSID:(id)a3 baseRequestURLString:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
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
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  _QWORD v63[4];
  id v64;

  v5 = a3;
  objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v6, (uint64_t)a4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_class();
  objc_msgSend_query(v9, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___queryStringToQueryDictionary_(v10, v16, (uint64_t)v15, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringValue(v5, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend_stringValue(v5, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v19, v30, (uint64_t)v29, (uint64_t)CFSTR("enqueuerDSID"), v31);

  }
  v32 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend_scheme(v9, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setScheme_(v32, v38, (uint64_t)v37, v39, v40);

  objc_msgSend_host(v9, v41, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHost_(v32, v46, (uint64_t)v45, v47, v48);

  v63[0] = MEMORY[0x24BDAC760];
  v63[1] = 3221225472;
  v63[2] = sub_217354028;
  v63[3] = &unk_24D744B70;
  v64 = v19;
  v49 = v19;
  objc_msgSend_mt_compactMap_(v49, v50, (uint64_t)v63, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setQueryItems_(v32, v54, (uint64_t)v53, v55, v56);

  objc_msgSend_string(v32, v57, v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  return v61;
}

- (BOOL)isLocalSetPlaybackQueueURLString:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], a2, (uint64_t)a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_host(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v10, v11, v12, v13, v14))
  {
    if (qword_254EEC608 != -1)
      dispatch_once(&qword_254EEC608, &unk_24D744BB0);
    v18 = objc_msgSend_containsObject_((void *)qword_254EEC600, v15, (uint64_t)v10, v16, v17);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)isSubscribeCommandURLString:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  char isEqualToString;

  objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], a2, (uint64_t)a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_host(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v10, v11, (uint64_t)CFSTR("subscribe"), v12, v13);

  return isEqualToString;
}

- (BOOL)isUniversalPlaybackIdentifierURLString:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  char isEqualToString;

  objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], a2, (uint64_t)a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_host(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v10, v11, (uint64_t)CFSTR("playItem"), v12, v13);

  return isEqualToString;
}

- (id)playbackQueueIdentifierForPlayMyPodcastsWithPlaybackOrder:(id)a3
{
  const char *v4;
  id v5;
  void *v6;

  v5 = a3;
  if (!v5)
    v5 = (id)*MEMORY[0x24BE82360];
  objc_msgSend__playbackRequestIdentifierWithHost_queryKey_value_(self, v4, (uint64_t)CFSTR("playPodcasts"), (uint64_t)CFSTR("playbackOrder"), (uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)playbackQueueIdentifierForEpisodeAdamId:(id)a3
{
  return (id)objc_msgSend__playbackRequestIdentifierWithHost_queryKey_value_(self, a2, (uint64_t)CFSTR("playPodcast"), (uint64_t)CFSTR("storeTrackId"), (uint64_t)a3);
}

- (id)localPlaybackQueueIdentifierForPodcastUuid:(id)a3 sampPlaybackOrder:(id)a4
{
  return (id)MEMORY[0x24BEDD108](self, sel_localPlaybackQueueIdentifierForPodcastUuid_episodeUuid_sampPlaybackOrder_, a3, 0, a4);
}

- (id)localPlaybackQueueIdentifierForPodcastUuid:(id)a3 episodeUuid:(id)a4 sampPlaybackOrder:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend_length(v8, v11, v12, v13, v14) || objc_msgSend_length(v9, v15, v16, v17, v18))
  {
    objc_msgSend_universalPlaybackQueueIdentifierForPodcastUuid_podcastFeedUrl_podcastStoreId_episodeUuid_episodeGuid_episodeStoreId_sampPlaybackOrder_(self, v15, (uint64_t)v8, 0, 0, v9, 0, 0, v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)universalPlaybackQueueIdentifierForPodcastFeedUrl:(id)a3 podcastStoreId:(int64_t)a4 episodeGuid:(id)a5 episodeStoreId:(int64_t)a6 sampPlaybackOrder:(id)a7
{
  return (id)objc_msgSend_universalPlaybackQueueIdentifierForPodcastUuid_podcastFeedUrl_podcastStoreId_episodeUuid_episodeGuid_episodeStoreId_sampPlaybackOrder_(self, a2, 0, (uint64_t)a3, a4, 0, a5, a6, a7);
}

- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5
{
  return (id)objc_msgSend_universalPlaybackQueueIdentifierForPodcastUuid_podcastFeedUrl_podcastStoreId_episodeUuid_episodeGuid_episodeStoreId_sampPlaybackOrder_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, 0, 0, 0, *MEMORY[0x24BE82360]);
}

- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 sampPlaybackOrder:(id)a6
{
  return (id)objc_msgSend_universalPlaybackQueueIdentifierForPodcastUuid_podcastFeedUrl_podcastStoreId_episodeUuid_episodeGuid_episodeStoreId_sampPlaybackOrder_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, 0, 0, 0, a6);
}

- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 sampPlaybackOrder:(id)a9
{
  return (id)objc_msgSend__universalPlaybackQueueIdentifierForPodcastUuid_podcastFeedUrl_podcastStoreId_episodeUuid_episodeGuid_episodeStoreId_context_contextSortType_sampPlaybackOrder_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, 0, 0, a9);
}

- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 context:(int64_t)a9 contextSortType:(int64_t)a10
{
  return (id)objc_msgSend__universalPlaybackQueueIdentifierForPodcastUuid_podcastFeedUrl_podcastStoreId_episodeUuid_episodeGuid_episodeStoreId_context_contextSortType_sampPlaybackOrder_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, a9, a10, *MEMORY[0x24BE82360]);
}

- (id)_universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 context:(int64_t)a9 contextSortType:(int64_t)a10 sampPlaybackOrder:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  void *v76;

  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  v20 = a11;
  if (!objc_msgSend_length(v20, v21, v22, v23, v24))
  {
    v29 = (id)*MEMORY[0x24BE82360];

    v20 = v29;
  }
  v30 = objc_msgSend_length(v18, v25, v26, v27, v28);
  v35 = objc_msgSend_length(v16, v31, v32, v33, v34);
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v36, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v40, v41, (uint64_t)v20, (uint64_t)CFSTR("playbackOrder"), v42);
  if (v35)
    objc_msgSend_setObject_forKey_(v40, v43, (uint64_t)v16, (uint64_t)CFSTR("uuid"), v46);
  if (v30)
    objc_msgSend_setObject_forKey_(v40, v43, (uint64_t)v18, (uint64_t)CFSTR("episodeUuid"), v46);
  if (objc_msgSend_length(v17, v43, v44, v45, v46))
  {
    v51 = (void *)objc_opt_class();
    objc_msgSend___stringWithPercentEscape_(v51, v52, (uint64_t)v17, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v40, v56, (uint64_t)v55, (uint64_t)CFSTR("podcastFeedUrl"), v57);

  }
  if (objc_msgSend_length(v19, v47, v48, v49, v50))
    objc_msgSend_setObject_forKey_(v40, v58, (uint64_t)v19, (uint64_t)CFSTR("episodeGuid"), v60);
  v61 = *MEMORY[0x24BE73A18];
  if (a5 && v61 != a5)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v58, (uint64_t)CFSTR("%llu"), v59, v60, a5);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v40, v63, (uint64_t)v62, (uint64_t)CFSTR("storeCollectionId"), v64);

  }
  if (a8 && v61 != a8)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v58, (uint64_t)CFSTR("%llu"), v59, v60, a8);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v40, v66, (uint64_t)v65, (uint64_t)CFSTR("storeTrackId"), v67);

  }
  NSPersistentStringForMTEpisodeContext();
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v40, v69, (uint64_t)v68, (uint64_t)CFSTR("context"), v70);

  NSPersistentStringForMTEpisodeContextSortType();
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v40, v72, (uint64_t)v71, (uint64_t)CFSTR("contextSortType"), v73);

  objc_msgSend__playbackRequestIdentifierWithHost_queryComponents_(self, v74, (uint64_t)CFSTR("playPodcast"), (uint64_t)v40, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  return v76;
}

- (id)playbackQueueIdentifierForPodcastAdamId:(id)a3 sampPlaybackOrder:(id)a4
{
  id v6;
  void *v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (!v6)
    v6 = (id)*MEMORY[0x24BE82360];
  v15[0] = CFSTR("storeCollectionId");
  v15[1] = CFSTR("playbackOrder");
  v16[0] = a3;
  v16[1] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = a3;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(v7, v9, (uint64_t)v16, (uint64_t)v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__playbackRequestIdentifierWithHost_queryComponents_(self, v11, (uint64_t)CFSTR("playPodcast"), (uint64_t)v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)playbackQueueIdentifierForSubscribeToPodcast:(id)a3
{
  return (id)objc_msgSend__playbackRequestIdentifierWithHost_queryKey_value_(self, a2, (uint64_t)CFSTR("subscribe"), (uint64_t)CFSTR("storeCollectionId"), (uint64_t)a3);
}

- (id)playbackQueueIdentifierForSubscribeToPodcastFeedUrl:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend___stringWithPercentEscape_(v5, v6, (uint64_t)v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__playbackRequestIdentifierWithHost_queryKey_value_(self, v10, (uint64_t)CFSTR("subscribe"), (uint64_t)CFSTR("podcastFeedUrl"), (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)localPlaybackQueueIdentifierForStationUuid:(id)a3
{
  return (id)((uint64_t (*)(MTPlaybackIdentifierUtil *, char *, id, _QWORD))MEMORY[0x24BEDD108])(self, sel_localPlaybackQueueIdentifierForStationUuid_episodeUuid_, a3, 0);
}

- (id)localPlaybackQueueIdentifierForStationUuid:(id)a3 episodeUuid:(id)a4
{
  return (id)MEMORY[0x24BEDD108](self, sel_universalPlaybackQueueIdentifierForStationUuid_episodeUuid_episodeGuid_episodeStoreId_podcastFeedUrl_, a3, a4, 0);
}

- (id)universalPlaybackQueueIdentifierForStationUuid:(id)a3 episodeGuid:(id)a4 episodeStoreId:(int64_t)a5 podcastFeedUrl:(id)a6
{
  return (id)MEMORY[0x24BEDD108](self, sel_universalPlaybackQueueIdentifierForStationUuid_episodeUuid_episodeGuid_episodeStoreId_podcastFeedUrl_, a3, 0, a4);
}

- (id)universalPlaybackQueueIdentifierForStationUuid:(id)a3 episodeUuid:(id)a4 episodeGuid:(id)a5 episodeStoreId:(int64_t)a6 podcastFeedUrl:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;

  v11 = a4;
  v12 = a5;
  v13 = a7;
  v14 = (void *)MEMORY[0x24BDBCED8];
  v15 = a3;
  objc_msgSend_dictionaryWithCapacity_(v14, v16, 5, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v19, v20, (uint64_t)v15, (uint64_t)CFSTR("uuid"), v21);

  if (objc_msgSend_length(v11, v22, v23, v24, v25))
    objc_msgSend_setObject_forKey_(v19, v26, (uint64_t)v11, (uint64_t)CFSTR("episodeUuid"), v29);
  if (objc_msgSend_length(v12, v26, v27, v28, v29))
    objc_msgSend_setObject_forKey_(v19, v30, (uint64_t)v12, (uint64_t)CFSTR("episodeGuid"), v33);
  if (objc_msgSend_length(v13, v30, v31, v32, v33))
  {
    v36 = (void *)objc_opt_class();
    objc_msgSend___stringWithPercentEscape_(v36, v37, (uint64_t)v13, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v19, v41, (uint64_t)v40, (uint64_t)CFSTR("podcastFeedUrl"), v42);

  }
  objc_msgSend__playbackRequestIdentifierWithHost_queryComponents_(self, v34, (uint64_t)CFSTR("playStation"), (uint64_t)v19, v35);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

- (_MRSystemAppPlaybackQueue)playbackQueueWithAccountInfoForIdentifiers:(id)a3
{
  id v4;
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
  const char *v15;
  uint64_t v16;
  _MRSystemAppPlaybackQueue *v17;

  v4 = a3;
  objc_msgSend_sharedInstance(MTAccountController, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activeDsid(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (_MRSystemAppPlaybackQueue *)objc_msgSend_playbackQueueWithDsid_forIdentifiers_(self, v15, (uint64_t)v14, (uint64_t)v4, v16);

  return v17;
}

- (_MRSystemAppPlaybackQueue)playbackQueueWithDsid:(id)a3 forIdentifiers:(id)a4
{
  id v5;
  _MRSystemAppPlaybackQueue *v6;
  CFDictionaryRef v7;
  id v9;
  void *keys;

  v5 = a4;
  v6 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
  MRSystemAppPlaybackQueueSetGenericTrackIdentifiers();

  if (a3)
  {
    v9 = a3;
    keys = CFSTR("enqueuerDSID");
    v7 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&v9, 1, 0, MEMORY[0x24BDBD6B0]);
    MRSystemAppPlaybackQueueSetUserInfo();
    CFRelease(v7);
  }
  return v6;
}

- (unint64_t)_playQueueTypeForRequestURL:(id)a3
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;

  v3 = qword_254EEC610;
  v8 = a3;
  if (v3 != -1)
    dispatch_once(&qword_254EEC610, &unk_24D744BD0);
  v9 = (void *)qword_254EEC618;
  objc_msgSend_host(v8, v4, v5, v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v9, v11, (uint64_t)v10, v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = &unk_24D749A60;
  if (v14)
    v16 = (void *)v14;
  v17 = v16;

  v22 = objc_msgSend_unsignedIntegerValue(v17, v18, v19, v20, v21);
  return v22;
}

- (id)_playbackRequestIdentifierWithHost:(id)a3 queryKey:(id)a4 value:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v18 = a4;
  v19[0] = a5;
  v8 = (void *)MEMORY[0x24BDBCE70];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(v8, v12, (uint64_t)v19, (uint64_t)&v18, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__playbackRequestIdentifierWithHost_queryComponents_(self, v14, (uint64_t)v11, (uint64_t)v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_playbackRequestIdentifierWithHost:(id)a3 queryComponents:(id)a4
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend_setScheme_(v7, v8, (uint64_t)CFSTR("podcasts"), v9, v10);
  v52 = v5;
  objc_msgSend_setHost_(v7, v11, (uint64_t)v5, v12, v13);
  v14 = (void *)MEMORY[0x24BDBCEB8];
  v19 = objc_msgSend_count(v6, v15, v16, v17, v18);
  objc_msgSend_arrayWithCapacity_(v14, v20, v19, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v24 = v6;
  v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v53, (uint64_t)v57, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v54;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v54 != v28)
          objc_enumerationMutation(v24);
        v30 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v29);
        v31 = objc_alloc(MEMORY[0x24BDD1838]);
        objc_msgSend_objectForKeyedSubscript_(v24, v32, v30, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)objc_msgSend_initWithName_value_(v31, v36, v30, (uint64_t)v35, v37);

        objc_msgSend_addObject_(v23, v39, (uint64_t)v38, v40, v41);
        ++v29;
      }
      while (v27 != v29);
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v42, (uint64_t)&v53, (uint64_t)v57, 16);
    }
    while (v27);
  }

  objc_msgSend_setQueryItems_(v7, v43, (uint64_t)v23, v44, v45);
  objc_msgSend_string(v7, v46, v47, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  return v50;
}

- (int64_t)_episodeOrderFromString:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, *MEMORY[0x24BE82368], v5, v6) & 1) != 0)
  {
    v10 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, *MEMORY[0x24BE82370], v8, v9))
  {
    v10 = 2;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)_playReasonFromString:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v3 = a3;
  if (objc_msgSend_length(v3, v4, v5, v6, v7))
    v8 = MTPlayReasonFromPersistentString();
  else
    v8 = 0;

  return v8;
}

- (int64_t)_episodeContextFromString:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;

  v3 = a3;
  if (objc_msgSend_length(v3, v4, v5, v6, v7))
    v8 = MTEpisodeContextFromPersistentString();
  else
    v8 = 0;

  return v8;
}

- (int64_t)_episodeContextSortFromString:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;

  v3 = a3;
  if (objc_msgSend_length(v3, v4, v5, v6, v7))
    v8 = MTEpisodeContextSortTypeFromPersistentString();
  else
    v8 = 0;

  return v8;
}

+ (id)__stringWithPercentEscape:(id)a3
{
  return (id)objc_autoreleaseReturnValue((id)CFURLCreateStringByAddingPercentEscapes(0, (CFStringRef)a3, 0, CFSTR("\uFFFC!$&'()+,/:;=?@"),
                                               0x8000100u));
}

+ (id)__stringByRemovingPercentEscapes:(id)a3
{
  return (id)(id)CFURLCreateStringByReplacingPercentEscapes((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFStringRef)a3, &stru_24D7452A8);
}

+ (id)__queryStringToQueryDictionary:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
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
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_componentsSeparatedByString_(a3, a2, (uint64_t)CFSTR("&"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v5;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v35, (uint64_t)v39, 16);
  if (v8)
  {
    v12 = v8;
    v13 = *(_QWORD *)v36;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(obj);
        objc_msgSend_componentsSeparatedByString_(*(void **)(*((_QWORD *)&v35 + 1) + 8 * v14), v9, (uint64_t)CFSTR("="), v10, v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndex_(v15, v16, 0, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_null(MEMORY[0x24BDBCEF8], v20, v21, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend_count(v15, v25, v26, v27, v28) >= 2)
        {
          objc_msgSend_objectAtIndex_(v15, v29, 1, v30, v31);
          v32 = objc_claimAutoreleasedReturnValue();

          v24 = (void *)v32;
        }
        objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)v24, (uint64_t)v19, v31);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v35, (uint64_t)v39, 16);
    }
    while (v12);
  }

  return v6;
}

@end
