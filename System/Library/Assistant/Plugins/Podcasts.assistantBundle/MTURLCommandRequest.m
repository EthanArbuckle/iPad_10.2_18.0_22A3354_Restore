@implementation MTURLCommandRequest

- (MTURLCommandRequest)initWithURLString:(id)a3
{
  id v5;
  MTURLCommandRequest *v6;
  MTURLCommandRequest *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTURLCommandRequest;
  v6 = -[MTURLCommandRequest init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_urlString, a3);
    objc_msgSend__loadQueryParameterValuesFromString_(v7, v8, (uint64_t)v5, v9, v10);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;

  objc_opt_class();
  v4 = (_QWORD *)objc_opt_new();
  v9 = objc_msgSend_copy(self->_urlString, v5, v6, v7, v8);
  v10 = (void *)v4[1];
  v4[1] = v9;

  v4[2] = self->_commandType;
  v4[3] = self->_playQueueType;
  v4[4] = self->_playReason;
  v4[5] = self->_playbackOrder;
  v4[6] = self->_playContext;
  v4[7] = self->_playContextSortType;
  v15 = objc_msgSend_copy(self->_podcastUuid, v11, v12, v13, v14);
  v16 = (void *)v4[8];
  v4[8] = v15;

  v21 = objc_msgSend_copy(self->_podcastFeedUrl, v17, v18, v19, v20);
  v22 = (void *)v4[9];
  v4[9] = v21;

  v27 = objc_msgSend_copy(self->_episodeUuid, v23, v24, v25, v26);
  v28 = (void *)v4[10];
  v4[10] = v27;

  v33 = objc_msgSend_copy(self->_podcastAdamId, v29, v30, v31, v32);
  v34 = (void *)v4[11];
  v4[11] = v33;

  v39 = objc_msgSend_copy(self->_episodeAdamId, v35, v36, v37, v38);
  v40 = (void *)v4[12];
  v4[12] = v39;

  v45 = objc_msgSend_copy(self->_stationUuid, v41, v42, v43, v44);
  v46 = (void *)v4[13];
  v4[13] = v45;

  v51 = objc_msgSend_copy(self->_requesterDsid, v47, v48, v49, v50);
  v52 = (void *)v4[14];
  v4[14] = v51;

  return v4;
}

- (id)copyWithPlayReason:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  id result;

  result = (id)objc_msgSend_copy(self, a2, a3, v3, v4);
  *((_QWORD *)result + 4) = a3;
  return result;
}

- (void)_loadQueryParameterValuesFromString:(id)a3
{
  const char *v4;
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
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  char isSubscribeCommandURLString;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  char isLocalSetPlaybackQueueURLString;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  int isUniversalPlaybackIdentifierURLString;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
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
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t playQueueType;
  NSString *v97;
  NSString *podcastUuid;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  NSString *v102;
  NSString *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  NSString *v110;
  NSString *stationUuid;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  NSString *v115;
  NSString *episodeUuid;
  NSString *v117;
  NSString *podcastAdamId;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  NSString *v122;
  NSString *episodeAdamId;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  NSString *v135;
  NSString *podcastFeedUrl;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  NSString *v140;
  NSString *requesterDsid;
  id v142;

  v142 = a3;
  objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v4, (uint64_t)v142, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_query(v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___queryStringToQueryDictionary_(MTPlaybackIdentifierUtil, v13, (uint64_t)v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_sharedInstance(MTPlaybackIdentifierUtil, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  isSubscribeCommandURLString = objc_msgSend_isSubscribeCommandURLString_(v21, v22, (uint64_t)v142, v23, v24);

  if ((isSubscribeCommandURLString & 1) != 0)
  {
    v30 = 1;
  }
  else
  {
    objc_msgSend_sharedInstance(MTPlaybackIdentifierUtil, v26, v27, v28, v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    isLocalSetPlaybackQueueURLString = objc_msgSend_isLocalSetPlaybackQueueURLString_(v31, v32, (uint64_t)v142, v33, v34);

    if ((isLocalSetPlaybackQueueURLString & 1) != 0)
    {
      v30 = 2;
    }
    else
    {
      objc_msgSend_sharedInstance(MTPlaybackIdentifierUtil, v26, v27, v28, v29);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      isUniversalPlaybackIdentifierURLString = objc_msgSend_isUniversalPlaybackIdentifierURLString_(v36, v37, (uint64_t)v142, v38, v39);

      if (!isUniversalPlaybackIdentifierURLString)
        goto LABEL_8;
      v30 = 3;
    }
  }
  self->_commandType = v30;
LABEL_8:
  objc_msgSend_sharedInstance(MTPlaybackIdentifierUtil, v26, v27, v28, v29);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  self->_playQueueType = objc_msgSend__playQueueTypeForRequestURL_(v41, v42, (uint64_t)v7, v43, v44);

  objc_msgSend_sharedInstance(MTPlaybackIdentifierUtil, v45, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v16, v50, (uint64_t)CFSTR("playbackOrder"), v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  self->_playbackOrder = objc_msgSend__episodeOrderFromString_(v49, v54, (uint64_t)v53, v55, v56);

  objc_msgSend_sharedInstance(MTPlaybackIdentifierUtil, v57, v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v16, v62, (uint64_t)CFSTR("playReason"), v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  self->_playReason = objc_msgSend__playReasonFromString_(v61, v66, (uint64_t)v65, v67, v68);

  objc_msgSend_sharedInstance(MTPlaybackIdentifierUtil, v69, v70, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v16, v74, (uint64_t)CFSTR("context"), v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  self->_playContext = objc_msgSend__episodeContextFromString_(v73, v78, (uint64_t)v77, v79, v80);

  objc_msgSend_sharedInstance(MTPlaybackIdentifierUtil, v81, v82, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v16, v86, (uint64_t)CFSTR("contextSortType"), v87, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  self->_playContextSortType = objc_msgSend__episodeContextSortFromString_(v85, v90, (uint64_t)v89, v91, v92);

  playQueueType = self->_playQueueType;
  if (playQueueType == 3)
  {
    objc_msgSend_objectForKeyedSubscript_(v16, v93, (uint64_t)CFSTR("uuid"), v94, v95);
    v110 = (NSString *)objc_claimAutoreleasedReturnValue();
    stationUuid = self->_stationUuid;
    self->_stationUuid = v110;

    objc_msgSend_objectForKeyedSubscript_(v16, v112, (uint64_t)CFSTR("episodeUuid"), v113, v114);
    v115 = (NSString *)objc_claimAutoreleasedReturnValue();
    episodeUuid = self->_episodeUuid;
    self->_episodeUuid = v115;

    goto LABEL_12;
  }
  if (playQueueType == 2)
  {
    objc_msgSend_objectForKeyedSubscript_(v16, v93, (uint64_t)CFSTR("uuid"), v94, v95);
    v97 = (NSString *)objc_claimAutoreleasedReturnValue();
    podcastUuid = self->_podcastUuid;
    self->_podcastUuid = v97;

    objc_msgSend_objectForKeyedSubscript_(v16, v99, (uint64_t)CFSTR("episodeUuid"), v100, v101);
    v102 = (NSString *)objc_claimAutoreleasedReturnValue();
    v103 = self->_episodeUuid;
    self->_episodeUuid = v102;

    objc_msgSend__lookupPodcastUuidIfNecessaryFromURLString_(self, v104, (uint64_t)v142, v105, v106);
LABEL_12:
    objc_msgSend__lookupEpisodeUuidIfNecessaryFromURLString_(self, v107, (uint64_t)v142, v108, v109);
  }
  objc_msgSend_objectForKeyedSubscript_(v16, v93, (uint64_t)CFSTR("storeCollectionId"), v94, v95);
  v117 = (NSString *)objc_claimAutoreleasedReturnValue();
  podcastAdamId = self->_podcastAdamId;
  self->_podcastAdamId = v117;

  objc_msgSend_objectForKeyedSubscript_(v16, v119, (uint64_t)CFSTR("storeTrackId"), v120, v121);
  v122 = (NSString *)objc_claimAutoreleasedReturnValue();
  episodeAdamId = self->_episodeAdamId;
  self->_episodeAdamId = v122;

  objc_msgSend_objectForKeyedSubscript_(v16, v124, (uint64_t)CFSTR("podcastFeedUrl"), v125, v126);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___stringByRemovingPercentEscapes_(MTPlaybackIdentifierUtil, v128, (uint64_t)v127, v129, v130);
  v131 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend___stringByRemovingPercentEscapes_(MTPlaybackIdentifierUtil, v132, (uint64_t)v131, v133, v134);
  v135 = (NSString *)objc_claimAutoreleasedReturnValue();
  podcastFeedUrl = self->_podcastFeedUrl;
  self->_podcastFeedUrl = v135;

  objc_msgSend_objectForKeyedSubscript_(v16, v137, (uint64_t)CFSTR("enqueuerDSID"), v138, v139);
  v140 = (NSString *)objc_claimAutoreleasedReturnValue();
  requesterDsid = self->_requesterDsid;
  self->_requesterDsid = v140;

}

- (NSString)urlString
{
  return self->_urlString;
}

- (unint64_t)commandType
{
  return self->_commandType;
}

- (unint64_t)playQueueType
{
  return self->_playQueueType;
}

- (unint64_t)playReason
{
  return self->_playReason;
}

- (int64_t)playbackOrder
{
  return self->_playbackOrder;
}

- (int64_t)playContext
{
  return self->_playContext;
}

- (int64_t)playContextSortType
{
  return self->_playContextSortType;
}

- (NSString)podcastUuid
{
  return self->_podcastUuid;
}

- (NSString)podcastFeedUrl
{
  return self->_podcastFeedUrl;
}

- (NSString)episodeUuid
{
  return self->_episodeUuid;
}

- (NSString)podcastAdamId
{
  return self->_podcastAdamId;
}

- (NSString)episodeAdamId
{
  return self->_episodeAdamId;
}

- (NSString)stationUuid
{
  return self->_stationUuid;
}

- (NSString)requesterDsid
{
  return self->_requesterDsid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requesterDsid, 0);
  objc_storeStrong((id *)&self->_stationUuid, 0);
  objc_storeStrong((id *)&self->_episodeAdamId, 0);
  objc_storeStrong((id *)&self->_podcastAdamId, 0);
  objc_storeStrong((id *)&self->_episodeUuid, 0);
  objc_storeStrong((id *)&self->_podcastFeedUrl, 0);
  objc_storeStrong((id *)&self->_podcastUuid, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end
