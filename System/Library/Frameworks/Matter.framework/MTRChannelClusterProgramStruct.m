@implementation MTRChannelClusterProgramStruct

- (MTRChannelClusterProgramStruct)init
{
  MTRChannelClusterProgramStruct *v2;
  MTRChannelClusterProgramStruct *v3;
  NSString *identifier;
  uint64_t v5;
  MTRChannelClusterChannelInfoStruct *channel;
  NSNumber *startTime;
  NSNumber *endTime;
  NSString *title;
  NSString *subtitle;
  NSString *descriptionString;
  NSArray *audioLanguages;
  NSArray *ratings;
  NSString *thumbnailUrl;
  NSString *posterArtUrl;
  NSString *dvbiUrl;
  NSString *releaseDate;
  NSString *parentalGuidanceText;
  NSNumber *recordingFlag;
  MTRChannelClusterSeriesInfoStruct *seriesInfo;
  NSArray *categoryList;
  NSArray *castList;
  NSArray *externalIDList;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)MTRChannelClusterProgramStruct;
  v2 = -[MTRChannelClusterProgramStruct init](&v25, sel_init);
  v3 = v2;
  if (v2)
  {
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)&stru_2505249E8;

    v5 = objc_opt_new();
    channel = v3->_channel;
    v3->_channel = (MTRChannelClusterChannelInfoStruct *)v5;

    startTime = v3->_startTime;
    v3->_startTime = (NSNumber *)&unk_250591B18;

    endTime = v3->_endTime;
    v3->_endTime = (NSNumber *)&unk_250591B18;

    title = v3->_title;
    v3->_title = (NSString *)&stru_2505249E8;

    subtitle = v3->_subtitle;
    v3->_subtitle = 0;

    descriptionString = v3->_descriptionString;
    v3->_descriptionString = 0;

    audioLanguages = v3->_audioLanguages;
    v3->_audioLanguages = 0;

    ratings = v3->_ratings;
    v3->_ratings = 0;

    thumbnailUrl = v3->_thumbnailUrl;
    v3->_thumbnailUrl = 0;

    posterArtUrl = v3->_posterArtUrl;
    v3->_posterArtUrl = 0;

    dvbiUrl = v3->_dvbiUrl;
    v3->_dvbiUrl = 0;

    releaseDate = v3->_releaseDate;
    v3->_releaseDate = 0;

    parentalGuidanceText = v3->_parentalGuidanceText;
    v3->_parentalGuidanceText = 0;

    recordingFlag = v3->_recordingFlag;
    v3->_recordingFlag = 0;

    seriesInfo = v3->_seriesInfo;
    v3->_seriesInfo = 0;

    categoryList = v3->_categoryList;
    v3->_categoryList = 0;

    castList = v3->_castList;
    v3->_castList = 0;

    externalIDList = v3->_externalIDList;
    v3->_externalIDList = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRChannelClusterProgramStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;

  v4 = objc_alloc_init(MTRChannelClusterProgramStruct);
  objc_msgSend_identifier(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIdentifier_(v4, v8, (uint64_t)v7);

  objc_msgSend_channel(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setChannel_(v4, v12, (uint64_t)v11);

  objc_msgSend_startTime(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStartTime_(v4, v16, (uint64_t)v15);

  objc_msgSend_endTime(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEndTime_(v4, v20, (uint64_t)v19);

  objc_msgSend_title(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTitle_(v4, v24, (uint64_t)v23);

  objc_msgSend_subtitle(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSubtitle_(v4, v28, (uint64_t)v27);

  objc_msgSend_descriptionString(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDescriptionString_(v4, v32, (uint64_t)v31);

  objc_msgSend_audioLanguages(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAudioLanguages_(v4, v36, (uint64_t)v35);

  objc_msgSend_ratings(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRatings_(v4, v40, (uint64_t)v39);

  objc_msgSend_thumbnailUrl(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setThumbnailUrl_(v4, v44, (uint64_t)v43);

  objc_msgSend_posterArtUrl(self, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPosterArtUrl_(v4, v48, (uint64_t)v47);

  objc_msgSend_dvbiUrl(self, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDvbiUrl_(v4, v52, (uint64_t)v51);

  objc_msgSend_releaseDate(self, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setReleaseDate_(v4, v56, (uint64_t)v55);

  objc_msgSend_parentalGuidanceText(self, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setParentalGuidanceText_(v4, v60, (uint64_t)v59);

  objc_msgSend_recordingFlag(self, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordingFlag_(v4, v64, (uint64_t)v63);

  objc_msgSend_seriesInfo(self, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSeriesInfo_(v4, v68, (uint64_t)v67);

  objc_msgSend_categoryList(self, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCategoryList_(v4, v72, (uint64_t)v71);

  objc_msgSend_castList(self, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCastList_(v4, v76, (uint64_t)v75);

  objc_msgSend_externalIDList(self, v77, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExternalIDList_(v4, v80, (uint64_t)v79);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: identifier:%@; channel:%@; startTime:%@; endTime:%@; title:%@; subtitle:%@; descriptionString:%@; audioLanguages:%@; ratings:%@; thumbnailUrl:%@; posterArtUrl:%@; dvbiUrl:%@; releaseDate:%@; parentalGuidanceText:%@; recordingFlag:%@; seriesInfo:%@; categoryList:%@; castList:%@; externalIDList:%@; >"),
    v5,
    self->_identifier,
    self->_channel,
    self->_startTime,
    self->_endTime,
    self->_title,
    self->_subtitle,
    self->_descriptionString,
    self->_audioLanguages,
    self->_ratings,
    self->_thumbnailUrl,
    self->_posterArtUrl,
    self->_dvbiUrl,
    self->_releaseDate,
    self->_parentalGuidanceText,
    self->_recordingFlag,
    self->_seriesInfo,
    self->_categoryList,
    self->_castList,
    self->_externalIDList);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (MTRChannelClusterChannelInfoStruct)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)descriptionString
{
  return self->_descriptionString;
}

- (void)setDescriptionString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)audioLanguages
{
  return self->_audioLanguages;
}

- (void)setAudioLanguages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)ratings
{
  return self->_ratings;
}

- (void)setRatings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)thumbnailUrl
{
  return self->_thumbnailUrl;
}

- (void)setThumbnailUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)posterArtUrl
{
  return self->_posterArtUrl;
}

- (void)setPosterArtUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)dvbiUrl
{
  return self->_dvbiUrl;
}

- (void)setDvbiUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)parentalGuidanceText
{
  return self->_parentalGuidanceText;
}

- (void)setParentalGuidanceText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)recordingFlag
{
  return self->_recordingFlag;
}

- (void)setRecordingFlag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (MTRChannelClusterSeriesInfoStruct)seriesInfo
{
  return self->_seriesInfo;
}

- (void)setSeriesInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSArray)categoryList
{
  return self->_categoryList;
}

- (void)setCategoryList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSArray)castList
{
  return self->_castList;
}

- (void)setCastList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSArray)externalIDList
{
  return self->_externalIDList;
}

- (void)setExternalIDList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalIDList, 0);
  objc_storeStrong((id *)&self->_castList, 0);
  objc_storeStrong((id *)&self->_categoryList, 0);
  objc_storeStrong((id *)&self->_seriesInfo, 0);
  objc_storeStrong((id *)&self->_recordingFlag, 0);
  objc_storeStrong((id *)&self->_parentalGuidanceText, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_dvbiUrl, 0);
  objc_storeStrong((id *)&self->_posterArtUrl, 0);
  objc_storeStrong((id *)&self->_thumbnailUrl, 0);
  objc_storeStrong((id *)&self->_ratings, 0);
  objc_storeStrong((id *)&self->_audioLanguages, 0);
  objc_storeStrong((id *)&self->_descriptionString, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
