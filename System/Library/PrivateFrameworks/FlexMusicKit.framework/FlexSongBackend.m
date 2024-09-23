@implementation FlexSongBackend

- (FlexSongBackend)initWithUID:(id)a3 songName:(id)a4 artistName:(id)a5 tagIDs:(id)a6 keywords:(id)a7 weightedKeywords:(id)a8 hidden:(BOOL)a9 recalled:(BOOL)a10 audioEncoderPresetName:(id)a11 metadataVersion:(int64_t)a12 songFormat:(id)a13 sampleRate:(int64_t)a14 customOptions:(id)a15
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  FlexSongBackend *v27;
  FlexSongBackend *v28;
  NSArray *assets;
  id obj;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  objc_super v38;

  v35 = a3;
  v34 = a4;
  obj = a5;
  v22 = a5;
  v32 = a6;
  v23 = a6;
  v37 = a7;
  v33 = a8;
  v36 = a8;
  v24 = a11;
  v25 = a13;
  v26 = a15;
  v38.receiver = self;
  v38.super_class = (Class)FlexSongBackend;
  v27 = -[FlexSongBackend init](&v38, sel_init);
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_uid, a3);
    objc_storeStrong((id *)&v28->_songName, a4);
    objc_storeStrong((id *)&v28->_artistName, obj);
    objc_storeStrong((id *)&v28->_tagIDs, v32);
    objc_storeStrong((id *)&v28->_keywords, a7);
    objc_storeStrong((id *)&v28->_weightedKeywords, v33);
    v28->_hidden = a9;
    v28->_recalled = a10;
    objc_storeStrong((id *)&v28->_audioEncoderPresetName, a11);
    objc_storeStrong((id *)&v28->_songFormat, a13);
    v28->_sampleRate = a14;
    v28->_metadataVersion = a12;
    objc_storeStrong((id *)&v28->_customOptions, a15);
    assets = v28->_assets;
    v28->_assets = 0;

  }
  return v28;
}

- (void)updateUID:(id)a3
{
  objc_storeStrong((id *)&self->_uid, a3);
}

- (void)updateSampleRate:(int64_t)a3
{
  self->_sampleRate = a3;
}

- (void)updateAssets:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  FlexSongBackend *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSArray *v33;
  id v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSArray *assets;
  FlexSongBackend *obj;
  _QWORD v50[5];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v4 = a3;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v55, (uint64_t)v60, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v56 != v11)
          objc_enumerationMutation(v4);
        v13 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend_uid(self, v6, v7, v8, v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setSongUID_(v13, v15, (uint64_t)v14, v16, v17);

      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v55, (uint64_t)v60, 16);
    }
    while (v10);
  }

  v18 = self;
  objc_sync_enter(v18);
  obj = v18;
  objc_msgSend_assets(v18, v19, v20, v21, v22);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    objc_msgSend_assets(v18, v23, v24, v25, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (NSArray *)objc_msgSend_mutableCopy(v28, v29, v30, v31, v32);

  }
  else
  {
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v23, v24, v25, v26);
    v33 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v34 = v4;
  v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v51, (uint64_t)v59, 16);
  if (v39)
  {
    v40 = *(_QWORD *)v52;
    v41 = MEMORY[0x24BDAC760];
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v52 != v40)
          objc_enumerationMutation(v34);
        v43 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j);
        v50[0] = v41;
        v50[1] = 3221225472;
        v50[2] = sub_20D01839C;
        v50[3] = &unk_24C5EFC50;
        v50[4] = v43;
        v45 = objc_msgSend_indexOfObjectPassingTest_(v33, v36, (uint64_t)v50, v37, v38);
        if (v45 == 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend_addObject_(v33, v44, v43, v46, v47);
        else
          objc_msgSend_replaceObjectAtIndex_withObject_(v33, v44, v45, v43, v47);
      }
      v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v36, (uint64_t)&v51, (uint64_t)v59, 16);
    }
    while (v39);
  }

  assets = obj->_assets;
  obj->_assets = v33;

  objc_sync_exit(obj);
}

- (id)existingAssetWithID:(id)a3
{
  id v4;
  FlexSongBackend *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  int isEqualToString;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend_assets(v5, v6, v7, v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v26, (uint64_t)v30, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v10);
        v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        objc_msgSend_assetID(v19, v12, v13, v14, v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v20, v21, (uint64_t)v4, v22, v23);

        if (isEqualToString)
        {
          v16 = v19;
          goto LABEL_11;
        }
      }
      v16 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v26, (uint64_t)v30, 16);
      if (v16)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v5);
  return v16;
}

- (BOOL)canPlay
{
  return 0;
}

- (BOOL)isLoaded
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)naturalDuration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x24BDC0D40];
  return self;
}

- (id)idealDurations
{
  return (id)MEMORY[0x24BDBD1A8];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumDuration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x24BDC0D40];
  return self;
}

- (id)timedMetadataItemsWithIdentifier:(id)a3 forRendition:(id)a4
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)renditionForDuration:(id *)a3 withOptions:(id)a4 testingContext:(id)a5
{
  return 0;
}

- (void)updateSongArtist:(id)a3 title:(id)a4 tags:(id)a5 keywords:(id)a6 weightedKeywords:(id)a7 hidden:(BOOL)a8 recalled:(BOOL)a9 metadataVersion:(int64_t)a10
{
  NSString *v15;
  NSString *v16;
  NSSet *v17;
  NSSet *v18;
  NSDictionary *v19;
  NSString *artistName;
  NSString *v21;
  NSString *songName;
  NSString *v23;
  NSSet *tagIDs;
  NSSet *v25;
  NSSet *keywords;
  NSSet *v27;
  NSDictionary *weightedKeywords;

  v15 = (NSString *)a3;
  v16 = (NSString *)a4;
  v17 = (NSSet *)a5;
  v18 = (NSSet *)a6;
  v19 = (NSDictionary *)a7;
  artistName = self->_artistName;
  self->_artistName = v15;
  v21 = v15;

  songName = self->_songName;
  self->_songName = v16;
  v23 = v16;

  tagIDs = self->_tagIDs;
  self->_tagIDs = v17;
  v25 = v17;

  keywords = self->_keywords;
  self->_keywords = v18;
  v27 = v18;

  weightedKeywords = self->_weightedKeywords;
  self->_weightedKeywords = v19;

  self->_hidden = a8;
  self->_recalled = a9;
  self->_metadataVersion = a10;
}

- (BOOL)verifyRendition:(id)a3 forDuration:(id *)a4 failureReason:(id *)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
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
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  int v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  char v88;
  BOOL v89;
  __CFString *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;

  v7 = a3;
  v12 = v7;
  if (!v7)
  {
    v89 = 0;
    v90 = CFSTR("no rendition! The playback algorithm could not generate a rendition for this duration or there is an issue with the authoring tool");
LABEL_13:
    *a5 = v90;
    goto LABEL_18;
  }
  objc_msgSend_trackA(v7, v8, v9, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v89 = 0;
    v90 = CFSTR("trackA is not present in rendition.");
    goto LABEL_13;
  }
  objc_msgSend_trackB(v12, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v89 = 0;
    v90 = CFSTR("trackB is not present in rendition.");
    goto LABEL_13;
  }
  v23 = objc_msgSend_durationOfMusic(v12, v19, v20, v21, v22);
  v28 = objc_msgSend_durationOfSilence(v12, v24, v25, v26, v27) + v23;
  if (v28 != objc_msgSend_duration(v12, v29, v30, v31, v32))
  {
    v91 = (void *)MEMORY[0x24BDD17C8];
    v92 = (void *)MEMORY[0x24BDD16E0];
    v93 = objc_msgSend_durationOfMusic(v12, v33, v34, v35, v36);
    objc_msgSend_numberWithLongLong_(v92, v94, v93, v95, v96);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = (void *)MEMORY[0x24BDD16E0];
    v102 = objc_msgSend_durationOfSilence(v12, v98, v99, v100, v101);
    objc_msgSend_numberWithLongLong_(v97, v103, v102, v104, v105);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = (void *)MEMORY[0x24BDD16E0];
    v111 = objc_msgSend_duration(v12, v107, v108, v109, v110);
    objc_msgSend_numberWithLongLong_(v106, v112, v111, v113, v114);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v91, v115, (uint64_t)CFSTR("rendition.durationOfMusic (%@) + rendition.durationOfSilence (%@) should equal rendition.duration %@"), v116, v117, v37, v42, v68);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  objc_msgSend_trackA(v12, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clips(v37, v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend__verifyClips_inRendition_failureReason_(self, v43, (uint64_t)v42, (uint64_t)v12, (uint64_t)a5) & 1) == 0)
  {
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend_trackB(v12, v44, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clips(v48, v49, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend__verifyClips_inRendition_failureReason_(self, v54, (uint64_t)v53, (uint64_t)v12, (uint64_t)a5);

  if (!v55)
  {
LABEL_17:
    v89 = 0;
    goto LABEL_18;
  }
  objc_msgSend_trackA(v12, v56, v57, v58, v59);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mixParameters(v37, v60, v61, v62, v63);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_volumeKeyFrames(v42, v64, v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend__verifyKeyFrames_failureReason_(self, v69, (uint64_t)v68, (uint64_t)a5, v70) & 1) == 0)
  {
LABEL_15:

    goto LABEL_16;
  }
  objc_msgSend_trackB(v12, v71, v72, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mixParameters(v75, v76, v77, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_volumeKeyFrames(v80, v81, v82, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend__verifyKeyFrames_failureReason_(self, v86, (uint64_t)v85, (uint64_t)a5, v87);

  if ((v88 & 1) == 0)
    goto LABEL_17;
  v89 = 1;
LABEL_18:

  return v89;
}

- (BOOL)_verifyClips:(id)a3 inRendition:(id)a4 failureReason:(id *)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
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
  uint64_t v43;
  uint64_t v44;
  char v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  int v101;
  void *v102;
  void *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  void *v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  __CFString *v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;

  v7 = a3;
  v8 = a4;
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_count(v7, v14, v15, v16, v17))
  {
LABEL_13:
    v101 = 2;
    goto LABEL_24;
  }
  v21 = 0;
  while (1)
  {
    objc_msgSend_objectAtIndexedSubscript_(v7, v18, v21, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_duration(v22, v23, v24, v25, v26) <= 0)
    {
      v145 = CFSTR("Found an invalid clip.duration in rendition. The duration must be > 0.");
      goto LABEL_19;
    }
    v31 = objc_msgSend_count(v7, v27, v28, v29, v30) - 1;
    objc_msgSend_url(v22, v32, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_path(v36, v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend_fileExistsAtPath_(v13, v42, (uint64_t)v41, v43, v44);

    if ((v45 & 1) != 0 || v21 != v31)
    {
      objc_msgSend_url(v22, v46, v47, v48, v49);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_path(v58, v59, v60, v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend_fileExistsAtPath_(v13, v64, (uint64_t)v63, v65, v66);

      if ((v67 & 1) == 0)
      {
        v146 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_url(v22, v55, v68, v56, v57);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_path(v69, v147, v148, v149, v150);
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v146, v152, (uint64_t)CFSTR("Clip url path %@ does not exist."), v153, v154, v151);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_21;
      }
    }
    else
    {
      v50 = objc_msgSend_duration(v22, v46, v47, v48, v49);
      if (v50 != objc_msgSend_durationOfSilence(v8, v51, v52, v53, v54))
      {
        v145 = CFSTR("Clip duration must equal the duration of silence if it is the last clip in the track.");
LABEL_19:
        *a5 = v145;
        goto LABEL_22;
      }
    }
    if (v21 == v31)
    {
      v101 = 2;
      goto LABEL_23;
    }
    objc_msgSend_objectAtIndexedSubscript_(v7, v55, ++v21, v56, v57);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend_position(v22, v70, v71, v72, v73);
    if (v74 > objc_msgSend_position(v69, v75, v76, v77, v78))
    {
      v102 = (void *)MEMORY[0x24BDD17C8];
      v103 = (void *)MEMORY[0x24BDD16E0];
      v104 = objc_msgSend_position(v22, v79, v80, v81, v82);
      objc_msgSend_numberWithLongLong_(v103, v105, v104, v106, v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = (void *)MEMORY[0x24BDD16E0];
      v114 = objc_msgSend_position(v69, v110, v111, v112, v113);
      objc_msgSend_numberWithLongLong_(v109, v115, v114, v116, v117);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v102, v119, (uint64_t)CFSTR("Current clip's position: %@ should not begin after the position: %@ of its following clip within the track."), v120, v121, v108, v118);
      goto LABEL_18;
    }
    v83 = objc_msgSend_position(v22, v79, v80, v81, v82);
    v88 = objc_msgSend_duration(v22, v84, v85, v86, v87) + v83;
    if (v88 > objc_msgSend_position(v69, v89, v90, v91, v92))
      break;

    if (v21 >= objc_msgSend_count(v7, v97, v98, v99, v100))
      goto LABEL_13;
  }
  v122 = (void *)MEMORY[0x24BDD17C8];
  v123 = (void *)MEMORY[0x24BDD16E0];
  v124 = objc_msgSend_position(v22, v93, v94, v95, v96);
  v129 = objc_msgSend_duration(v22, v125, v126, v127, v128);
  objc_msgSend_numberWithLongLong_(v123, v130, v129 + v124, v131, v132);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = (void *)MEMORY[0x24BDD16E0];
  v138 = objc_msgSend_position(v69, v134, v135, v136, v137);
  objc_msgSend_numberWithLongLong_(v133, v139, v138, v140, v141);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v122, v142, (uint64_t)CFSTR("Current clip's position + duration %@ should not exceed the position %@ of its following clip within the track."), v143, v144, v108, v118);
LABEL_18:
  *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_21:
LABEL_22:
  v101 = 1;
LABEL_23:

LABEL_24:
  return v101 == 2;
}

- (BOOL)_verifyKeyFrames:(id)a3 failureReason:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;

  v5 = a3;
  if (objc_msgSend_count(v5, v6, v7, v8, v9) == 1)
  {
LABEL_5:
    v35 = 1;
  }
  else
  {
    v13 = 0;
    while (1)
    {
      objc_msgSend_objectAtIndexedSubscript_(v5, v10, v13, v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v5, v15, ++v13, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend_sampleTime(v14, v19, v20, v21, v22);
      if (v23 >= objc_msgSend_sampleTime(v18, v24, v25, v26, v27))
        break;

      if (v13 >= objc_msgSend_count(v5, v31, v32, v33, v34) - 1)
        goto LABEL_5;
    }
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v28, (uint64_t)CFSTR("Keyframe %@ sampleTime must be less than its following keyframe %@"), v29, v30, v14, v18);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v35 = 0;
  }

  return v35;
}

- (NSString)uid
{
  return self->_uid;
}

- (void)setUid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)audioEncoderPresetName
{
  return self->_audioEncoderPresetName;
}

- (void)setAudioEncoderPresetName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)songName
{
  return self->_songName;
}

- (void)setSongName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSSet)tagIDs
{
  return self->_tagIDs;
}

- (void)setTagIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSSet)keywords
{
  return self->_keywords;
}

- (void)setKeywords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)weightedKeywords
{
  return self->_weightedKeywords;
}

- (void)setWeightedKeywords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)songFormat
{
  return self->_songFormat;
}

- (void)setSongFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(int64_t)a3
{
  self->_sampleRate = a3;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)recalled
{
  return self->_recalled;
}

- (void)setRecalled:(BOOL)a3
{
  self->_recalled = a3;
}

- (int64_t)metadataVersion
{
  return self->_metadataVersion;
}

- (void)setMetadataVersion:(int64_t)a3
{
  self->_metadataVersion = a3;
}

- (NSDictionary)customOptions
{
  return self->_customOptions;
}

- (void)setCustomOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customOptions, 0);
  objc_storeStrong((id *)&self->_songFormat, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_weightedKeywords, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_tagIDs, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_songName, 0);
  objc_storeStrong((id *)&self->_audioEncoderPresetName, 0);
  objc_storeStrong((id *)&self->_uid, 0);
}

@end
