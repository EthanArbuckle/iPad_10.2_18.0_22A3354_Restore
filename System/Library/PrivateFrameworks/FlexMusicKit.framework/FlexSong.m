@implementation FlexSong

- (id)initCommonWithUID:(id)a3 songName:(id)a4 artistName:(id)a5 tagIDs:(id)a6 keywords:(id)a7 weightedKeywords:(id)a8 hidden:(BOOL)a9 sampleRate:(int64_t)a10 mainSegments:(id)a11 crossFadeSegments:(id)a12 audioFileExtension:(id)a13 audioEncoderPresetName:(id)a14 metadataVersion:(int64_t)a15 customOptions:(id)a16
{
  id v21;
  id v22;
  id v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  objc_super v48;

  v45 = a3;
  v44 = a4;
  v47 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v43 = a11;
  v42 = a12;
  v24 = v21;
  v41 = a13;
  v46 = a14;
  v29 = a16;
  v30 = v21;
  if (!v21)
  {
    objc_msgSend_set(MEMORY[0x24BDBCF20], v25, v26, v27, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = v22;
  if (!v22)
  {
    objc_msgSend_set(MEMORY[0x24BDBCF20], v25, v26, v27, v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32 = v23;
  if (!v23)
  {
    objc_msgSend_dictionary(MEMORY[0x24BDBCE70], v25, v26, v27, v28);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v48.receiver = self;
  v48.super_class = (Class)FlexSong;
  v33 = -[FlexSongBackend initWithUID:songName:artistName:tagIDs:keywords:weightedKeywords:hidden:recalled:audioEncoderPresetName:metadataVersion:songFormat:sampleRate:customOptions:](&v48, sel_initWithUID_songName_artistName_tagIDs_keywords_weightedKeywords_hidden_recalled_audioEncoderPresetName_metadataVersion_songFormat_sampleRate_customOptions_, v45, v44, v47, v30, v31, v32, a9, v46, a15, CFSTR("LG"), a10, v29);
  if (v23)
  {
    if (v22)
      goto LABEL_9;
LABEL_15:

    if (v24)
      goto LABEL_10;
LABEL_16:

    goto LABEL_10;
  }

  if (!v22)
    goto LABEL_15;
LABEL_9:
  if (!v24)
    goto LABEL_16;
LABEL_10:
  if (v33)
  {
    objc_storeStrong((id *)v33 + 19, a13);
    v38 = MEMORY[0x24BDC0D40];
    *(_OWORD *)(v33 + 120) = *MEMORY[0x24BDC0D40];
    *((_QWORD *)v33 + 17) = *(_QWORD *)(v38 + 16);
    if (v43)
      objc_msgSend__cacheSegmentsByType(v33, v34, v35, v36, v37);
  }

  return v33;
}

- (FlexSong)initWithUID:(id)a3 songName:(id)a4 artistName:(id)a5 tagIDs:(id)a6 keywords:(id)a7 weightedKeywords:(id)a8 hidden:(BOOL)a9 sampleRate:(int64_t)a10 mainSegments:(id)a11 crossFadeSegments:(id)a12 assets:(id)a13 audioFileExtension:(id)a14 audioEncoderPresetName:(id)a15 metadataVersion:(int64_t)a16 customOptions:(id)a17
{
  id v22;
  const char *v23;
  FlexSong *inited;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  FlexSong *v28;

  v22 = a13;
  inited = (FlexSong *)objc_msgSend_initCommonWithUID_songName_artistName_tagIDs_keywords_weightedKeywords_hidden_sampleRate_mainSegments_crossFadeSegments_audioFileExtension_audioEncoderPresetName_metadataVersion_customOptions_(self, v23, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, a9, a10, a11, a12, a14, a15, a16, a17);
  v28 = inited;
  if (inited)
    objc_msgSend__setupInitialAssets_(inited, v25, (uint64_t)v22, v26, v27);

  return v28;
}

- (FlexSong)initWithDictionary:(id)a3 assets:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
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
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  FlexSong *inited;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  FlexSong *v59;
  id v62;
  void *v63;
  void *v64;
  void *v65;

  v5 = a3;
  v62 = a4;
  objc_msgSend_objectForKey_(v5, v6, (uint64_t)CFSTR("uuid"), v7, v8);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v5, v9, (uint64_t)CFSTR("songName"), v10, v11);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v5, v12, (uint64_t)CFSTR("artistName"), v13, v14);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v5, v15, (uint64_t)CFSTR("sampleRate"), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (int)objc_msgSend_intValue(v18, v19, v20, v21, v22);

  objc_msgSend_objectForKey_(v5, v24, (uint64_t)CFSTR("tagIDs"), v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v27, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], v33, (uint64_t)v27, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }
  objc_msgSend_objectForKey_(v5, v33, (uint64_t)CFSTR("audioEncoderPresetName"), v34, v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v5, v38, (uint64_t)CFSTR("audioFileExtension"), v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v5, v42, (uint64_t)CFSTR("customOptions"), v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v5, v46, (uint64_t)CFSTR("crossFadeSegments"), v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_opt_class();
  objc_msgSend_decodeItemsInArray_asClass_(FlexUtilities, v51, (uint64_t)v49, v50, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  inited = (FlexSong *)objc_msgSend_initCommonWithUID_songName_artistName_tagIDs_keywords_weightedKeywords_hidden_sampleRate_mainSegments_crossFadeSegments_audioFileExtension_audioEncoderPresetName_metadataVersion_customOptions_(self, v54, (uint64_t)v65, (uint64_t)v64, (uint64_t)v63, v36, 0, 0, 0, v23, 0, v53, v41, v37, 0, v45);
  v59 = inited;
  if (inited)
    objc_msgSend__setupInitialAssets_(inited, v56, (uint64_t)v62, v57, v58);

  return v59;
}

- (void)_setupInitialAssets:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  FlexSongAssetProvider_V2 *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  FlexSongAssetProviderProtocol *v29;
  FlexSongAssetProviderProtocol *assetProvider;
  id v31;

  objc_msgSend_updateAssets_(self, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_existingAssetWithID_(self, v6, (uint64_t)CFSTR("FMSongBundleAssetID"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v9;
  if (v9)
  {
    objc_msgSend_localURL(v9, v10, v11, v12, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend_audioFileExtension(self, v14, v15, v16, v17);
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
        v20 = (__CFString *)v19;
      else
        v20 = CFSTR("m4a");
      v21 = [FlexSongAssetProvider_V2 alloc];
      objc_msgSend_path(v18, v22, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (FlexSongAssetProviderProtocol *)objc_msgSend_initWithFolderPath_audioFileExtension_(v21, v27, (uint64_t)v26, (uint64_t)v20, v28);

    }
    else
    {
      v29 = 0;
    }

  }
  else
  {
    v29 = 0;
  }
  assetProvider = self->_assetProvider;
  self->_assetProvider = v29;

}

- (void)_loadAnalysisData
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  BOOL v71;
  const char *v72;
  uint64_t v73;
  NSDictionary *analysisData;
  void *v75;
  NSDictionary *v76;
  void *v77;
  FlexSong *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  id obj;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v76 = (NSDictionary *)objc_opt_new();
  v78 = self;
  objc_msgSend_existingAssetWithID_(self, v3, (uint64_t)CFSTR("FMSongBundleAssetID"), v4, v5);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localURL(v79, v6, v7, v8, v9);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v77, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v14, v15, (uint64_t)CFSTR("ANALYSIS"), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = v18;
  objc_msgSend_stringByAppendingPathComponent_(v18, v19, (uint64_t)CFSTR("ONSET"), v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contentsOfDirectoryAtPath_error_(v27, v28, (uint64_t)v22, 0, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v80 = (void *)objc_opt_new();
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  obj = v30;
  v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v85, (uint64_t)v89, 16);
  if (v32)
  {
    v36 = v32;
    v37 = *(_QWORD *)v86;
    v81 = *(_QWORD *)v86;
    do
    {
      v38 = 0;
      v82 = v36;
      do
      {
        if (*(_QWORD *)v86 != v37)
          objc_enumerationMutation(obj);
        v39 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v38);
        objc_msgSend_stringByAppendingPathComponent_(v22, v33, (uint64_t)v39, v34, v35);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = 0;
        objc_msgSend_stringWithContentsOfFile_encoding_error_(MEMORY[0x24BDD17C8], v41, (uint64_t)v40, 4, (uint64_t)&v84);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v84;
        if (!v46)
        {
          v47 = v22;
          objc_msgSend_componentsSeparatedByString_(v42, v43, (uint64_t)CFSTR("\n"), v44, v45);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = (void *)objc_msgSend_mutableCopy(v48, v49, v50, v51, v52);

          objc_msgSend_indexesOfObjectsPassingTest_(v53, v54, (uint64_t)&unk_24C5EFC08, v55, v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObjectsAtIndexes_(v53, v58, (uint64_t)v57, v59, v60);
          objc_msgSend_stringByDeletingPathExtension(v39, v61, v62, v63, v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v65, v66, (uint64_t)CFSTR("_onset"), (uint64_t)&stru_24C5F0F80, v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          if (v53)
            v71 = v68 == 0;
          else
            v71 = 1;
          if (!v71)
            objc_msgSend_setObject_forKey_(v80, v69, (uint64_t)v53, (uint64_t)v68, v70);

          v22 = v47;
          v37 = v81;
          v36 = v82;
        }

        ++v38;
      }
      while (v36 != v38);
      v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v85, (uint64_t)v89, 16);
    }
    while (v36);
  }

  objc_msgSend_setObject_forKey_(v76, v72, (uint64_t)v80, (uint64_t)CFSTR("onsets"), v73);
  analysisData = v78->_analysisData;
  v78->_analysisData = v76;

}

- (id)analysisData
{
  FlexSong *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_analysisData)
    objc_msgSend__loadAnalysisData(v2, v3, v4, v5, v6);
  objc_sync_exit(v2);

  return v2->_analysisData;
}

- (BOOL)canPlay
{
  return 1;
}

- (BOOL)isLoaded
{
  return 1;
}

- (id)encodeAsDictionary
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
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
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
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  void *v117;

  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uid(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v6, v12, (uint64_t)v11, (uint64_t)CFSTR("uuid"), v13);

  objc_msgSend_songName(self, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v6, v19, (uint64_t)v18, (uint64_t)CFSTR("songName"), v20);

  objc_msgSend_artistName(self, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v6, v26, (uint64_t)v25, (uint64_t)CFSTR("artistName"), v27);

  v28 = (void *)MEMORY[0x24BDD16E0];
  v33 = objc_msgSend_sampleRate(self, v29, v30, v31, v32);
  objc_msgSend_numberWithInteger_(v28, v34, v33, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v6, v38, (uint64_t)v37, (uint64_t)CFSTR("sampleRate"), v39);

  objc_msgSend__decodedMainSegmentsFromCache(self, v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeItemsInArray_(FlexUtilities, v45, (uint64_t)v44, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__destroyCache(self, v49, v50, v51, v52);
  if (v48)
    objc_msgSend_setValue_forKey_(v6, v53, (uint64_t)v48, (uint64_t)CFSTR("mainSegments"), v56);
  objc_msgSend_tagIDs(self, v53, v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_anyObject(v57, v58, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    objc_msgSend_tagIDs(self, v63, v64, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allObjects(v67, v68, v69, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v6, v73, (uint64_t)v72, (uint64_t)CFSTR("tagIDs"), v74);

  }
  objc_msgSend_assetProvider(self, v63, v64, v65, v66);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_audioFileExtension(v75, v76, v77, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  if (v80)
    objc_msgSend_setValue_forKey_(v6, v81, (uint64_t)v80, (uint64_t)CFSTR("audioFileExtension"), v84);
  objc_msgSend_audioEncoderPresetName(self, v81, v82, v83, v84);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  if (v88)
    objc_msgSend_setValue_forKey_(v6, v85, (uint64_t)v88, (uint64_t)CFSTR("audioEncoderPresetName"), v87);
  objc_msgSend_existingAssetWithID_(self, v85, (uint64_t)CFSTR("FMSongBundleAssetID"), v86, v87);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = v89;
  if (v89)
  {
    v95 = (void *)MEMORY[0x24BDD16E0];
    v96 = objc_msgSend_contentVersion(v89, v90, v91, v92, v93);
    objc_msgSend_numberWithInteger_(v95, v97, v96, v98, v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v6, v101, (uint64_t)v100, (uint64_t)CFSTR("contentVersion"), v102);

    v103 = (void *)MEMORY[0x24BDD16E0];
    v108 = objc_msgSend_compatibilityVersion(v94, v104, v105, v106, v107);
    objc_msgSend_numberWithInteger_(v103, v109, v108, v110, v111);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v6, v113, (uint64_t)v112, (uint64_t)CFSTR("compatibilityVersion"), v114);

  }
  objc_msgSend_customOptions(self, v90, v91, v92, v93);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  if (v117)
    objc_msgSend_setValue_forKey_(v6, v115, (uint64_t)v117, (uint64_t)CFSTR("customOptions"), v116);

  return v6;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
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

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_songName(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_artistName(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v13, (uint64_t)CFSTR("%@ by %@"), v14, v15, v7, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumDuration
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int32_t v13;

  v8 = 6 * objc_msgSend_sampleRate(self, a3, v3, v4, v5);
  v13 = objc_msgSend_sampleRate(self, v9, v10, v11, v12);
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, v8, v13);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)naturalDuration
{
  FlexSong *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  $95D729B680665BEAEFA1D6FCA8238556 *p_cachedNaturalDuration;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int32_t v19;
  __int128 v20;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CMTime v22;

  v4 = self;
  objc_sync_enter(v4);
  p_cachedNaturalDuration = &v4->_cachedNaturalDuration;
  if ((v4->_cachedNaturalDuration.flags & 1) == 0)
  {
    objc_msgSend__naturalDurationAssemblyList(v4, v5, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend__sampleDurationOfClipPlaylist_(v4, v11, (uint64_t)v10, v12, v13);

    v19 = objc_msgSend_sampleRate(v4, v15, v16, v17, v18);
    CMTimeMake(&v22, 9600 * vcvtpd_s64_f64((double)v14 / 9600.0), v19);
    v20 = *(_OWORD *)&v22.value;
    v4->_cachedNaturalDuration.epoch = v22.epoch;
    *(_OWORD *)&p_cachedNaturalDuration->value = v20;
  }
  objc_sync_exit(v4);

  *(_OWORD *)&retstr->var0 = *(_OWORD *)&p_cachedNaturalDuration->value;
  retstr->var3 = v4->_cachedNaturalDuration.epoch;
  return result;
}

- (id)idealDurations
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (void)_populateCache
{
  void *v3;
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
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  id v43;

  v3 = (void *)MEMORY[0x212B9B7A0](self, a2);
  objc_msgSend_existingAssetWithID_(self, v4, (uint64_t)CFSTR("FMSongBundleAssetID"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localURL(v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v17, v18, (uint64_t)CFSTR("metadata.smm"), v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_dataWithContentsOfFile_(MEMORY[0x24BDBCE50], v22, (uint64_t)v21, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x24BDD1608], v26, (uint64_t)v25, 0, (uint64_t)&v43);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v43;
  if (!v31)
  {
    objc_msgSend_objectForKey_(v27, v28, (uint64_t)CFSTR("mainSegments"), v29, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_opt_class();
    objc_msgSend_decodeItemsInArray_asClass_(FlexUtilities, v34, (uint64_t)v32, v33, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(self->_segmentCache, v37, (uint64_t)v27, (uint64_t)CFSTR("metadataDict"), v38);
    objc_msgSend_setObject_forKey_(self->_segmentCache, v39, (uint64_t)v36, (uint64_t)CFSTR("decodedMainSegments"), v40);
    objc_msgSend_setObject_forKey_(self->_segmentCache, v41, (uint64_t)v32, (uint64_t)CFSTR("mainSegments"), v42);

  }
  objc_autoreleasePoolPop(v3);
}

- (id)_cacheObjectForKey:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSMutableDictionary *segmentCache;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;

  v7 = a3;
  segmentCache = self->_segmentCache;
  if (!segmentCache)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v10 = self->_segmentCache;
    self->_segmentCache = v9;

    objc_msgSend__populateCache(self, v11, v12, v13, v14);
    segmentCache = self->_segmentCache;
  }
  objc_msgSend_objectForKey_(segmentCache, v4, (uint64_t)v7, v5, v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    objc_msgSend__populateCache(self, v15, v16, v17, v18);
    objc_msgSend_objectForKey_(self->_segmentCache, v20, (uint64_t)v7, v21, v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (id)_metadataDictFromCache
{
  return (id)((uint64_t (*)(FlexSong *, char *, const __CFString *))MEMORY[0x24BEDD108])(self, sel__cacheObjectForKey_, CFSTR("metadataDict"));
}

- (id)_decodedMainSegmentsFromCache
{
  return (id)((uint64_t (*)(FlexSong *, char *, const __CFString *))MEMORY[0x24BEDD108])(self, sel__cacheObjectForKey_, CFSTR("decodedMainSegments"));
}

- (id)_mainSegmentsFromCache
{
  return (id)((uint64_t (*)(FlexSong *, char *, const __CFString *))MEMORY[0x24BEDD108])(self, sel__cacheObjectForKey_, CFSTR("mainSegments"));
}

- (void)_destroyCache
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSMutableDictionary *segmentCache;

  objc_msgSend_removeAllObjects(self->_segmentCache, a2, v2, v3, v4);
  segmentCache = self->_segmentCache;
  self->_segmentCache = 0;

}

- (id)_segmentsforType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint8_t v19[16];
  uint8_t buf[16];

  objc_msgSend__metadataDictFromCache(self, a2, a3, v3, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    FlexLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D016000, v12, OS_LOG_TYPE_DEFAULT, "flex: missing metadataDict!", buf, 2u);
    }

  }
  objc_msgSend__decodedMainSegmentsFromCache(self, v7, v8, v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    FlexLogForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_20D016000, v16, OS_LOG_TYPE_DEFAULT, "flex: missing decodedMainSegments!", v19, 2u);
    }

  }
  if (a3 - 1 > 3)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend_segmentsWithType_inSegments_(FlexSegment, v13, a3, (uint64_t)v15, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)_segmentsForIndex:(unint64_t)a3 andType:(unint64_t)a4
{
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend__segmentsforType_(self, a2, a4, a4, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v12 = v6;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v14)
  {
    v19 = v14;
    v20 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v12);
        v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend_nameIndex(v22, v15, v16, v17, v18, (_QWORD)v30);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend_integerValue(v23, v24, v25, v26, v27);

        if (v28 == a3)
          objc_msgSend_addObject_(v11, v15, (uint64_t)v22, v17, v18);
      }
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v30, (uint64_t)v34, 16);
    }
    while (v19);
  }

  return v11;
}

- (id)_shortestSegmentsForType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
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
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, a3, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend__highestIndexForSegmentType_(self, v8, a3, v9, v10);
  v14 = 0;
  do
  {
    objc_msgSend__segmentsForIndex_andType_(self, v11, v14, a3, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__sortFlexSegmentsShortestToLongest_(self, v16, (uint64_t)v15, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_count(v19, v20, v21, v22, v23))
    {
      objc_msgSend_firstObject(v19, v24, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v7, v29, (uint64_t)v28, v30, v31);

    }
    ++v14;
  }
  while (v14 <= v13);
  if (a3 == 2)
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend__segmentsforType_(self, v11, 2, v32, v12, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v45, (uint64_t)v49, 16);
    if (v35)
    {
      v40 = v35;
      v41 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v46 != v41)
            objc_enumerationMutation(v33);
          v43 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          if (objc_msgSend_sliceable(v43, v36, v37, v38, v39))
            objc_msgSend_addObject_(v7, v36, (uint64_t)v43, v38, v39);
        }
        v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v45, (uint64_t)v49, 16);
      }
      while (v40);
    }

  }
  return v7;
}

- (id)_shortestSegmentForType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  objc_msgSend__shortestSegmentsForType_(self, a2, a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__sortFlexSegmentsShortestToLongest_(self, v7, (uint64_t)v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_firstObject(v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_longestSegmentsForType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
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

  objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, a3, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend__highestIndexForSegmentType_(self, v8, a3, v9, v10);
  v14 = 0;
  do
  {
    objc_msgSend__segmentsForIndex_andType_(self, v11, v14, a3, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__sortFlexSegmentsShortestToLongest_(self, v16, (uint64_t)v15, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_count(v19, v20, v21, v22, v23))
    {
      objc_msgSend_lastObject(v19, v24, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v7, v29, (uint64_t)v28, v30, v31);

    }
    ++v14;
  }
  while (v14 <= v13);
  return v7;
}

- (id)_longestSegmentForType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  objc_msgSend__segmentsforType_(self, a2, a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__sortFlexSegmentsShortestToLongest_(self, v7, (uint64_t)v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_lastObject(v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (unint64_t)_highestIndexForSegmentType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend__segmentsforType_(self, a2, a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v32, (uint64_t)v36, 16);
  if (v7)
  {
    v12 = v7;
    v13 = 0;
    v14 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(v5);
        v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend_nameIndex(v16, v8, v9, v10, v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_integerValue(v17, v18, v19, v20, v21) > v13)
        {
          objc_msgSend_nameIndex(v16, v22, v23, v24, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend_integerValue(v26, v27, v28, v29, v30);

        }
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v32, (uint64_t)v36, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_sortFlexSegmentsShortestToLongest:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_sortedArrayUsingComparator_(a3, a2, (uint64_t)&unk_24C5F0750, v3, v4);
}

- (id)_transitionSegmentForSegmentInfo:(id)a3 fromBarIndex:(int64_t)a4 inSegmentList:(id)a5
{
  return (id)objc_msgSend__transitionSegmentForSegmentInfo_toSegmentInfo_fromBarIndex_inSegmentList_(self, a2, (uint64_t)a3, 0, a4, a5);
}

- (id)_transitionSegmentForSegmentInfo:(id)a3 toSegmentInfo:(id)a4 fromBarIndex:(int64_t)a5 inSegmentList:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
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
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t i;
  void *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  int isEqualToString;
  id v75;
  id v77;
  id v78;
  void *v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16 = objc_msgSend_indexOfObject_(v12, v13, (uint64_t)v10, v14, v15);
  if (v16 == 0x7FFFFFFFFFFFFFFFLL || (v21 = v16, v16 >= objc_msgSend_count(v12, v17, v18, v19, v20) - 1))
  {
    v30 = 0;
  }
  else
  {
    v80 = v11;
    if (v11)
    {
      v25 = v11;
    }
    else
    {
      objc_msgSend_objectAtIndexedSubscript_(v12, v22, v21 + 1, v23, v24);
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    v31 = v25;
    objc_msgSend_segment(v10, v26, v27, v28, v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v31;
    objc_msgSend_segment(v31, v33, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v37, v38, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transitionToSegmentNamed_fromBarIndex_(v32, v43, (uint64_t)v42, a5, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_transitionSegmentName(v45, v46, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      v77 = v12;
      v78 = v10;
      objc_msgSend__segmentsforType_(self, v51, 3, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v55, (uint64_t)&v81, (uint64_t)v85, 16);
      if (v56)
      {
        v61 = v56;
        v30 = 0;
        v62 = *(_QWORD *)v82;
        do
        {
          for (i = 0; i != v61; ++i)
          {
            if (*(_QWORD *)v82 != v62)
              objc_enumerationMutation(v54);
            v64 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
            objc_msgSend_name(v64, v57, v58, v59, v60);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_transitionSegmentName(v45, v66, v67, v68, v69);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToString = objc_msgSend_isEqualToString_(v65, v71, (uint64_t)v70, v72, v73);

            if (isEqualToString)
            {
              v75 = v64;

              v30 = v75;
            }
          }
          v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v57, (uint64_t)&v81, (uint64_t)v85, 16);
        }
        while (v61);
      }
      else
      {
        v30 = 0;
      }

      v12 = v77;
      v10 = v78;
    }
    else
    {
      v30 = 0;
    }

    v11 = v80;
  }

  return v30;
}

- (int64_t)_sampleDurationOfClipPlaylist:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v15, (uint64_t)v19, 16);
  if (v5)
  {
    v10 = v5;
    v11 = 0;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v3);
        v11 += objc_msgSend_duration(*(void **)(*((_QWORD *)&v15 + 1) + 8 * i), v6, v7, v8, v9);
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v15, (uint64_t)v19, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (int64_t)_minBodySegmentDuration
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend__shortestSegmentForType_(self, a2, 2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_sampleCount(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)_maxIntroDuration
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend__longestSegmentForType_(self, a2, 1, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_sampleCount(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)_minIntroDuration
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend__shortestSegmentForType_(self, a2, 1, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_sampleCount(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)_maxOutroDuration
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend__longestSegmentForType_(self, a2, 4, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_sampleCount(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)_minOutroDuration
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend__shortestSegmentForType_(self, a2, 4, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_sampleCount(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)_actualOutroDurationForAssemblyList:(id)a3 currentDuration:(int64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[5];
  _QWORD v69[5];
  id v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend_indexOfObjectPassingTest_(v6, v7, (uint64_t)&unk_24C5F0790, v8, v9) == 0x7FFFFFFFFFFFFFFFLL)
  {
    FlexLogForCategory(1uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_20D03F040(v13, v14, v15);
    v16 = 0;
  }
  else
  {
    objc_msgSend__segmentsforType_(self, v10, 4, v11, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v17, v18, v19, v20, v21) == 1)
    {
      objc_msgSend_lastObject(v17, v22, v23, v24, v25);
      v13 = objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend_sampleCount(v13, v26, v27, v28, v29);
    }
    else
    {
      v69[0] = 0;
      v69[1] = v69;
      v69[2] = 0x3032000000;
      v69[3] = sub_20D034F74;
      v69[4] = sub_20D034F84;
      objc_msgSend_lastObject(v6, v22, v23, v24, v25);
      v70 = (id)objc_claimAutoreleasedReturnValue();
      v68[0] = MEMORY[0x24BDAC760];
      v68[1] = 3221225472;
      v68[2] = sub_20D034F8C;
      v68[3] = &unk_24C5F07B8;
      v68[4] = v69;
      objc_msgSend_indexesOfObjectsPassingTest_(v17, v31, (uint64_t)v68, v32, v33);
      v34 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectsAtIndexes_(v17, v35, v34, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = (void *)v34;
      if (objc_msgSend_count(v38, v39, v40, v41, v42) == 1)
      {
        objc_msgSend_firstObject(v38, v43, v44, v45, v46);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend__sortFlexSegmentsShortestToLongest_(self, v43, (uint64_t)v38, v45, v46);
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v47 = (id)objc_claimAutoreleasedReturnValue();
        v13 = 0;
        v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v48, (uint64_t)&v64, (uint64_t)v71, 16);
        if (v53)
        {
          v54 = *(_QWORD *)v65;
          while (2)
          {
            v55 = 0;
            v56 = v13;
            do
            {
              if (*(_QWORD *)v65 != v54)
                objc_enumerationMutation(v47);
              v57 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v55);
              if (objc_msgSend_sampleCount(v57, v49, v50, v51, v52) > a4)
              {
                v13 = v56;
                goto LABEL_19;
              }
              v13 = v57;

              ++v55;
              v56 = v13;
            }
            while (v53 != v55);
            v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v49, (uint64_t)&v64, (uint64_t)v71, 16);
            if (v53)
              continue;
            break;
          }
        }
LABEL_19:

      }
      _Block_object_dispose(v69, 8);

      v30 = objc_msgSend_sampleCount(v13, v58, v59, v60, v61);
    }
    v16 = v30;

  }
  return v16;
}

- (int64_t)_minimumPermittedIntroAndOutroDuration
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id obj;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend__shortestSegmentsForType_(self, a2, 1, v2, v3);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v39, (uint64_t)v44, 16);
  if (v33)
  {
    v31 = *(_QWORD *)v40;
    v8 = -1;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v40 != v31)
          objc_enumerationMutation(obj);
        v34 = v9;
        v10 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v9);
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        objc_msgSend__shortestSegmentsForType_(self, v5, 4, v6, v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v35, (uint64_t)v43, 16);
        if (v13)
        {
          v15 = v13;
          v16 = *(_QWORD *)v36;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v36 != v16)
                objc_enumerationMutation(v11);
              v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
              if (objc_msgSend_canTransitionFromSegment_toSegment_fromBarIndex_checkIfPrevented_(FlexSegment, v14, (uint64_t)v10, (uint64_t)v18, 0, 1))
              {
                v22 = objc_msgSend_sampleCount(v10, v14, v19, v20, v21);
                v27 = objc_msgSend_sampleCount(v18, v23, v24, v25, v26);
                if (v27 + v22 < v8 || v8 == -1)
                  v8 = v27 + v22;
              }
            }
            v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v35, (uint64_t)v43, 16);
          }
          while (v15);
        }

        v9 = v34 + 1;
      }
      while (v34 + 1 != v33);
      v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v39, (uint64_t)v44, 16);
    }
    while (v33);
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

+ (id)numberToString:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (qword_253E5D808 != -1)
    dispatch_once(&qword_253E5D808, &unk_24C5F07D8);
  if ((unint64_t)a3 > 0x63)
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%ld"), v3, v4, a3);
  else
    objc_msgSend_objectAtIndexedSubscript_((void *)qword_253E5D810, a2, a3, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_naturalDurationAssemblyList
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  FlexSegmentAssemblyInfo *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  const char *v51;
  id obj;
  CMTime v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  objc_msgSend__segmentsforType_(self, v4, 2, v5, v6);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v55, (uint64_t)v59, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v56;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v56 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v12);
        v14 = objc_alloc_init(FlexSegmentAssemblyInfo);
        objc_msgSend_setSegment_(v14, v15, (uint64_t)v13, v16, v17);
        objc_msgSend_assetProvider(self, v18, v19, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_urlToAudioForSegment_(v22, v23, (uint64_t)v13, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setUrl_(v14, v27, (uint64_t)v26, v28, v29);

        v34 = objc_msgSend_sampleCount(v13, v30, v31, v32, v33);
        objc_msgSend_setDuration_(v14, v35, v34, v36, v37);
        v42 = objc_msgSend_bars(v13, v38, v39, v40, v41);
        objc_msgSend_setBarsUsed_(v14, v43, v42, v44, v45);
        objc_msgSend_addObject_(v3, v46, (uint64_t)v14, v47, v48);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v49, (uint64_t)&v55, (uint64_t)v59, 16);
    }
    while (v10);
  }
  if (objc_msgSend__updateTransitionBodySegmentsForAssemblyList_usingNewSegment_indexOfNewTransitionSegment_(self, v9, (uint64_t)v3, 0, 0))
  {
    memset(&v54, 0, sizeof(v54));
    CMTimeMakeWithSeconds(&v54, 30.0, 48000);
    if (objc_msgSend__addOutroSegmentsToAssemblyList_forDuration_allowTrim_testingContext_(self, v50, (uint64_t)v3, v54.value, 0, 0))objc_msgSend__addIntroSegmentsToAssemblyList_forDuration_testingContext_(self, v51, (uint64_t)v3, v54.value, 0);
  }

  return v3;
}

- (void)_sequenceBodySegmentList:(id)a3 forIndexes:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char v102;
  uint64_t v103;
  uint64_t j;
  void *v105;
  id v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  id v116;
  const char *v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  int isEqualToString;
  uint64_t v125;
  uint64_t v126;
  char v127;
  void *v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  unint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  id v158;
  const char *v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t k;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t m;
  uint64_t v184;
  id v185;
  const char *v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  int v205;
  id v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  const char *v210;
  void *v211;
  unint64_t v212;
  id v213;
  const char *v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t n;
  void *v220;
  void *v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  void *v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  void *v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  void *v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  void *v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  void *v262;
  const char *v263;
  uint64_t v264;
  uint64_t v265;
  void *v266;
  id v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  unint64_t v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  const char *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  void *v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  void *v287;
  const char *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  const char *v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  void *v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  void *v301;
  const char *v302;
  uint64_t v303;
  void *v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  void *v309;
  const char *v310;
  uint64_t v311;
  void *v312;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  const char *v316;
  uint64_t v317;
  void *v318;
  const char *v319;
  uint64_t v320;
  uint64_t v321;
  const char *v322;
  uint64_t v323;
  uint64_t v324;
  void *v325;
  unint64_t v326;
  void *v327;
  const char *v328;
  uint64_t v329;
  uint64_t v330;
  void *v331;
  const char *v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  const char *v336;
  uint64_t v337;
  uint64_t v338;
  unint64_t v339;
  id v340;
  void *v341;
  char v342;
  id v343;
  void *v344;
  uint64_t v345;
  void *v346;
  unint64_t v347;
  void *v348;
  uint64_t v349;
  void *v350;
  void *v351;
  uint64_t v352;
  void *v353;
  id obj;
  id obja;
  void *v356;
  uint64_t v357;
  id v358;
  uint64_t v359;
  uint64_t v360;
  void *v361;
  unint64_t v362;
  uint64_t v363;
  _QWORD v364[4];
  id v365;
  id v366;
  void *v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  __int128 v371;
  __int128 v372;
  __int128 v373;
  __int128 v374;
  __int128 v375;
  __int128 v376;
  __int128 v377;
  __int128 v378;
  __int128 v379;
  __int128 v380;
  __int128 v381;
  __int128 v382;
  __int128 v383;
  _QWORD v384[5];
  __int128 v385;
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  __int128 v393;
  __int128 v394;
  __int128 v395;
  __int128 v396;
  _BYTE v397[128];
  _BYTE v398[128];
  _BYTE v399[128];
  _BYTE v400[128];
  _BYTE v401[128];
  _BYTE v402[128];
  _BYTE v403[128];
  uint64_t v404;

  v404 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v340 = a4;
  if ((unint64_t)objc_msgSend_count(v6, v7, v8, v9, v10) >= 2)
  {
    v339 = objc_msgSend__highestIndexForSegmentType_(self, v11, 2, v12, v13);
    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v14, v15, v16, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v341 = v6;
    v346 = v21;
    while (1)
    {
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v18, v22, v19, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend_containsObject_(v340, v24, (uint64_t)v23, v25, v26);

      if ((v27 & 1) == 0)
      {
        v111 = v22;
        objc_msgSend_numberToString_(FlexSong, v28, v22, v30, v31);
        v361 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_array(MEMORY[0x24BDBCEB8], v112, v113, v114, v115);
        v351 = (void *)objc_claimAutoreleasedReturnValue();
        v393 = 0u;
        v394 = 0u;
        v395 = 0u;
        v396 = 0u;
        v116 = v6;
        v118 = objc_msgSend_countByEnumeratingWithState_objects_count_(v116, v117, (uint64_t)&v393, (uint64_t)v403, 16);
        if (v118)
        {
          v123 = v118;
          LOBYTE(isEqualToString) = 0;
          v125 = *(_QWORD *)v394;
          do
          {
            v126 = 0;
            v127 = isEqualToString;
            do
            {
              if (*(_QWORD *)v394 != v125)
                objc_enumerationMutation(v116);
              v128 = *(void **)(*((_QWORD *)&v393 + 1) + 8 * v126);
              objc_msgSend_segment(v128, v119, v120, v121, v122);
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_nameIndex(v129, v130, v131, v132, v133);
              v134 = (void *)objc_claimAutoreleasedReturnValue();
              isEqualToString = objc_msgSend_isEqualToString_(v134, v135, (uint64_t)v361, v136, v137);

              if (isEqualToString)
              {
                objc_msgSend_addObject_(v351, v119, (uint64_t)v128, v121, v122);
                v21 = v346;
              }
              else
              {
                v21 = v346;
                if ((v127 & 1) != 0)
                  goto LABEL_37;
              }
              ++v126;
              v127 = isEqualToString;
            }
            while (v123 != v126);
            v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(v116, v119, (uint64_t)&v393, (uint64_t)v403, 16);
          }
          while (v123);
        }
LABEL_37:

        if (objc_msgSend_count(v351, v138, v139, v140, v141))
          objc_msgSend_setObject_forKey_(v21, v142, (uint64_t)v351, (uint64_t)v361, v143);
        v6 = v341;
        v144 = v339;
        v145 = v111;
        goto LABEL_93;
      }
      v352 = v22;
      objc_msgSend_array(MEMORY[0x24BDBCEB8], v28, v29, v30, v31);
      v361 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v32, v33, v34, v35);
      v351 = (void *)objc_claimAutoreleasedReturnValue();
      v389 = 0u;
      v390 = 0u;
      v391 = 0u;
      v392 = 0u;
      v36 = v6;
      v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v389, (uint64_t)v402, 16);
      if (v38)
      {
        v43 = v38;
        v44 = *(_QWORD *)v390;
        do
        {
          for (i = 0; i != v43; ++i)
          {
            if (*(_QWORD *)v390 != v44)
              objc_enumerationMutation(v36);
            v46 = *(void **)(*((_QWORD *)&v389 + 1) + 8 * i);
            objc_msgSend_segment(v46, v39, v40, v41, v42);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_nameIndex(v47, v48, v49, v50, v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_numberToString_(FlexSong, v53, v352, v54, v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_isEqualToString_(v52, v57, (uint64_t)v56, v58, v59))
            {
              objc_msgSend_addObject_(v361, v60, (uint64_t)v46, v61, v62);
              objc_msgSend_segment(v46, v63, v64, v65, v66);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_nameSuffix(v67, v68, v69, v70, v71);
              v72 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_objectForKeyedSubscript_(v351, v73, (uint64_t)v72, v74, v75);
              v76 = (void *)objc_claimAutoreleasedReturnValue();

              if (v76)
              {
                objc_msgSend_objectForKeyedSubscript_(v351, v77, (uint64_t)v72, v78, v79);
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                v81 = (void *)MEMORY[0x24BDD16E0];
                v86 = objc_msgSend_intValue(v80, v82, v83, v84, v85);
                objc_msgSend_numberWithInt_(v81, v87, (v86 + 1), v88, v89);
                v90 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v90 = &unk_24C5FAD88;
              }
              objc_msgSend_setObject_forKey_(v351, v77, (uint64_t)v90, (uint64_t)v72, v79);

            }
          }
          v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v39, (uint64_t)&v389, (uint64_t)v402, 16);
        }
        while (v43);
      }

      v387 = 0u;
      v388 = 0u;
      v385 = 0u;
      v386 = 0u;
      objc_msgSend_allKeys(v351, v91, v92, v93, v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v95, v96, (uint64_t)&v385, (uint64_t)v401, 16);
      if (v97)
      {
        v101 = v97;
        v353 = 0;
        v102 = 0;
        v103 = *(_QWORD *)v386;
        do
        {
          for (j = 0; j != v101; ++j)
          {
            if (*(_QWORD *)v386 != v103)
              objc_enumerationMutation(v95);
            v105 = *(void **)(*((_QWORD *)&v385 + 1) + 8 * j);
            if (objc_msgSend_localizedCaseInsensitiveContainsString_(v105, v98, (uint64_t)CFSTR("to"), v99, v100))
            {
              v106 = v105;

              v102 = 1;
              v353 = v106;
            }
          }
          v101 = objc_msgSend_countByEnumeratingWithState_objects_count_(v95, v98, (uint64_t)&v385, (uint64_t)v401, 16);
        }
        while (v101);

        v110 = (uint64_t)v353;
        if (v353)
        {
          objc_msgSend_removeObjectForKey_(v351, v107, (uint64_t)v353, v108, v109);
          goto LABEL_42;
        }
      }
      else
      {

        v102 = 0;
      }
      v353 = 0;
LABEL_42:
      objc_msgSend_array(MEMORY[0x24BDBCEB8], v107, v110, v108, v109);
      v344 = (void *)objc_claimAutoreleasedReturnValue();
      v342 = v102;
      if ((v102 & 1) != 0)
      {
        v384[0] = MEMORY[0x24BDAC760];
        v384[1] = 3221225472;
        v384[2] = sub_20D0361D4;
        v384[3] = &unk_24C5F07F8;
        v384[4] = v352;
        objc_msgSend_indexesOfObjectsPassingTest_(v36, v146, (uint64_t)v384, v148, v149);
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectsAtIndexes_(v36, v151, (uint64_t)v150, v152, v153);
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v344, v155, (uint64_t)v154, v156, v157);

        v382 = 0u;
        v383 = 0u;
        v380 = 0u;
        v381 = 0u;
        v158 = v344;
        v160 = objc_msgSend_countByEnumeratingWithState_objects_count_(v158, v159, (uint64_t)&v380, (uint64_t)v400, 16);
        if (v160)
        {
          v164 = v160;
          v165 = *(_QWORD *)v381;
          do
          {
            for (k = 0; k != v164; ++k)
            {
              if (*(_QWORD *)v381 != v165)
                objc_enumerationMutation(v158);
              objc_msgSend_removeObject_(v361, v161, *(_QWORD *)(*((_QWORD *)&v380 + 1) + 8 * k), v162, v163);
            }
            v164 = objc_msgSend_countByEnumeratingWithState_objects_count_(v158, v161, (uint64_t)&v380, (uint64_t)v400, 16);
          }
          while (v164);
        }

      }
      objc_msgSend_array(MEMORY[0x24BDBCEB8], v146, v147, v148, v149);
      v356 = (void *)objc_claimAutoreleasedReturnValue();
      v347 = objc_msgSend_count(v361, v167, v168, v169, v170);
      v362 = 0;
      v175 = 1;
      do
      {
        if (!objc_msgSend_count(v361, v171, v172, v173, v174) || v362 >= v347)
          break;
        v349 = v175;
        objc_msgSend_allKeys(v351, v171, v176, v173, v174);
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sortedArrayUsingSelector_(v177, v178, (uint64_t)sel_localizedCaseInsensitiveCompare_, v179, v180);
        v181 = (void *)objc_claimAutoreleasedReturnValue();

        v378 = 0u;
        v379 = 0u;
        v376 = 0u;
        v377 = 0u;
        obj = v181;
        v359 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v182, (uint64_t)&v376, (uint64_t)v399, 16);
        if (v359)
        {
          v357 = *(_QWORD *)v377;
          do
          {
            for (m = 0; m != v359; ++m)
            {
              if (*(_QWORD *)v377 != v357)
                objc_enumerationMutation(obj);
              v184 = *(_QWORD *)(*((_QWORD *)&v376 + 1) + 8 * m);
              v372 = 0u;
              v373 = 0u;
              v374 = 0u;
              v375 = 0u;
              v185 = v361;
              v187 = objc_msgSend_countByEnumeratingWithState_objects_count_(v185, v186, (uint64_t)&v372, (uint64_t)v398, 16);
              if (!v187)
              {
LABEL_67:
                v206 = 0;
                goto LABEL_69;
              }
              v192 = v187;
              v193 = *(_QWORD *)v373;
LABEL_61:
              v194 = 0;
              while (1)
              {
                if (*(_QWORD *)v373 != v193)
                  objc_enumerationMutation(v185);
                v195 = *(void **)(*((_QWORD *)&v372 + 1) + 8 * v194);
                objc_msgSend_segment(v195, v188, v189, v190, v191);
                v196 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_nameSuffix(v196, v197, v198, v199, v200);
                v201 = (void *)objc_claimAutoreleasedReturnValue();
                v205 = objc_msgSend_isEqualToString_(v201, v202, v184, v203, v204);

                if (v205)
                  break;
                if (v192 == ++v194)
                {
                  v192 = objc_msgSend_countByEnumeratingWithState_objects_count_(v185, v188, (uint64_t)&v372, (uint64_t)v398, 16);
                  if (!v192)
                    goto LABEL_67;
                  goto LABEL_61;
                }
              }
              objc_msgSend_addObject_(v356, v188, (uint64_t)v195, v190, v191);
              v206 = v195;
              ++v362;
LABEL_69:

              objc_msgSend_removeObject_(v185, v207, (uint64_t)v206, v208, v209);
            }
            v359 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v210, (uint64_t)&v376, (uint64_t)v399, 16);
          }
          while (v359);
        }

        v175 = v349 + 1;
      }
      while (v349 != 1000);
      v211 = v344;
      v6 = v341;
      v21 = v346;
      v212 = 0x24C5EF000;
      if ((v342 & (v344 != 0)) != 1)
        goto LABEL_92;
      v370 = 0u;
      v371 = 0u;
      v368 = 0u;
      v369 = 0u;
      v213 = v344;
      v363 = objc_msgSend_countByEnumeratingWithState_objects_count_(v213, v214, (uint64_t)&v368, (uint64_t)v397, 16);
      if (!v363)
        goto LABEL_91;
      v360 = *(_QWORD *)v369;
      v343 = v213;
      do
      {
        for (n = 0; n != v363; ++n)
        {
          if (*(_QWORD *)v369 != v360)
            objc_enumerationMutation(v213);
          v220 = *(void **)(*((_QWORD *)&v368 + 1) + 8 * n);
          objc_msgSend_segment(v220, v215, v216, v217, v218);
          v221 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_nameSuffix(v221, v222, v223, v224, v225);
          v226 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_segment(v220, v227, v228, v229, v230);
          v231 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_nameIndex(v231, v232, v233, v234, v235);
          v236 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_lowercaseString(v226, v237, v238, v239, v240);
          v241 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_lowercaseString(CFSTR("to"), v242, v243, v244, v245);
          v246 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_hasPrefix_(v241, v247, (uint64_t)v246, v248, v249))
          {
            v254 = objc_msgSend_count(v213, v250, v251, v252, v253);

            if (v254 == 1)
            {
              objc_msgSend_addObject_(v356, v255, (uint64_t)v220, v257, v258);
              goto LABEL_88;
            }
          }
          else
          {

          }
          v212 = 0x24C5EF000;
          if ((unint64_t)objc_msgSend_length(v226, v255, v256, v257, v258) < 2)
            goto LABEL_89;
          objc_msgSend_substringToIndex_(v226, v259, 1, v260, v261);
          v262 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v263, (uint64_t)CFSTR("%@%@"), v264, v265, v236, v262);
          v266 = (void *)objc_claimAutoreleasedReturnValue();
          v364[0] = MEMORY[0x24BDAC760];
          v364[1] = 3221225472;
          v364[2] = sub_20D03627C;
          v364[3] = &unk_24C5F0820;
          v267 = v356;
          v365 = v267;
          v358 = v266;
          v366 = v358;
          v367 = v220;
          v271 = objc_msgSend_indexOfObjectPassingTest_(v267, v268, (uint64_t)v364, v269, v270);
          if (v271 < objc_msgSend_count(v267, v272, v273, v274, v275) - 1)
          {
            obja = v262;
            v345 = v271 + 1;
            objc_msgSend_objectAtIndexedSubscript_(v267, v276, v271 + 1, v277, v278);
            v350 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_segment(v350, v279, v280, v281, v282);
            v283 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_componentsSeparatedByString_(v226, v284, (uint64_t)CFSTR("to"), v285, v286);
            v287 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_lastObject(v287, v288, v289, v290, v291);
            v348 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_name(v283, v292, v293, v294, v295);
            v296 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_namePrefix(v283, v297, v298, v299, v300);
            v301 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v296, v302, (uint64_t)v301, (uint64_t)&stru_24C5F0F80, v303);
            v304 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_nameStem(v283, v305, v306, v307, v308);
            v309 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v304, v310, (uint64_t)v309, (uint64_t)&stru_24C5F0F80, v311);
            v312 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend_isEqualToString_(v348, v313, (uint64_t)v312, v314, v315))
              objc_msgSend_insertObject_atIndex_(v267, v316, (uint64_t)v220, v345, v317);

            v21 = v346;
            v213 = v343;
            v211 = v344;
            v262 = obja;
          }

LABEL_88:
          v212 = 0x24C5EF000uLL;
LABEL_89:

        }
        v363 = objc_msgSend_countByEnumeratingWithState_objects_count_(v213, v215, (uint64_t)&v368, (uint64_t)v397, 16);
      }
      while (v363);
LABEL_91:

      v6 = v341;
LABEL_92:
      v145 = v352;
      objc_msgSend_numberToString_(*(void **)(v212 + 1744), v171, v352, v173, v174);
      v318 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v21, v319, (uint64_t)v356, (uint64_t)v318, v320);

      v144 = v339;
LABEL_93:

      v22 = v145 + 1;
      if (v145 + 1 > v144)
      {
        objc_msgSend_array(MEMORY[0x24BDBCEB8], v18, v321, v19, v20);
        v325 = (void *)objc_claimAutoreleasedReturnValue();
        v326 = 0;
        do
        {
          objc_msgSend_numberToString_(FlexSong, v322, v326, v323, v324);
          v327 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v21, v328, (uint64_t)v327, v329, v330);
          v331 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObjectsFromArray_(v325, v332, (uint64_t)v331, v333, v334);

          ++v326;
        }
        while (v326 <= v339);
        v6 = v341;
        objc_msgSend_removeAllObjects(v341, v322, v335, v323, v324);
        objc_msgSend_addObjectsFromArray_(v341, v336, (uint64_t)v325, v337, v338);

        break;
      }
    }
  }

}

- (BOOL)_addSegment:(id)a3 withDuration:(int64_t)a4 toAssemblyList:(id)a5 indexOfNewSegment:(int64_t *)a6
{
  return objc_msgSend__addSegment_withDuration_toAssemblyList_timeRemaining_reusedSegment_indexofNewSegment_(self, a2, (uint64_t)a3, a4, (uint64_t)a5, 0, 0, a6);
}

- (BOOL)_addSegment:(id)a3 withDuration:(int64_t)a4 toAssemblyList:(id)a5 timeRemaining:(int64_t)a6 reusedSegment:(id *)a7 indexofNewSegment:(int64_t *)a8
{
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  int v92;
  FlexSegmentAssemblyInfo *v93;
  BOOL v94;
  FlexSegmentAssemblyInfo *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  FlexSegmentAssemblyInfo *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  int64_t v176;
  id v177;
  void *v178;
  int64_t *v179;
  id *v180;
  void *v181;
  id obj;
  uint64_t v185;
  int v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  _QWORD v191[4];
  id v192;
  void *v193;
  _BYTE v194[128];
  uint64_t v195;

  v195 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v18 = v13;
  if (v12 && a4 && v13)
  {
    objc_msgSend_assetProvider(self, v14, v15, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_urlToAudioForSegment_(v19, v20, (uint64_t)v12, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      v92 = 0;
LABEL_46:

      v94 = v92 != 0;
      goto LABEL_47;
    }
    v180 = a7;
    v28 = 0;
    v29 = 1;
    do
    {
      v30 = v29;
      if (v28 > a4)
        break;
      if (objc_msgSend_bars(v12, v24, v25, v26, v27) <= v29)
        break;
      v28 += objc_msgSend_barDurationForBarIndex_(v12, v24, v30 - 1, v26, v27);
      v29 = v30 + 1;
    }
    while (v28 < a4);
    if (objc_msgSend_sliceable(v12, v24, v25, v26, v27))
    {
      v178 = v23;
      v179 = a8;
      v191[0] = MEMORY[0x24BDAC760];
      v191[1] = 3221225472;
      v191[2] = sub_20D036A90;
      v191[3] = &unk_24C5F0848;
      v192 = v12;
      objc_msgSend_indexesOfObjectsPassingTest_(v18, v31, (uint64_t)v191, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectsAtIndexes_(v18, v35, (uint64_t)v34, v36, v37);
      v187 = 0u;
      v188 = 0u;
      v189 = 0u;
      v190 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v38, (uint64_t)&v187, (uint64_t)v194, 16);
      if (v39)
      {
        v44 = v39;
        v175 = v34;
        v176 = a4;
        v177 = v12;
        v185 = *(_QWORD *)v188;
        v181 = v18;
        while (2)
        {
          for (i = 0; i != v44; ++i)
          {
            if (*(_QWORD *)v188 != v185)
              objc_enumerationMutation(obj);
            v46 = *(void **)(*((_QWORD *)&v187 + 1) + 8 * i);
            v47 = objc_msgSend_barsUsed(v46, v40, v41, v42, v43, v175, v176);
            objc_msgSend_segment(v46, v48, v49, v50, v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_msgSend_bars(v52, v53, v54, v55, v56);

            v62 = objc_msgSend_barsUsed(v46, v58, v59, v60, v61);
            objc_msgSend_segment(v46, v63, v64, v65, v66);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = objc_msgSend_bars(v67, v68, v69, v70, v71);

            if (v47 != v57 && v62 + v30 <= v72)
            {
              if (objc_msgSend_barsUsed(v46, v40, v41, v42, v43) <= -(uint64_t)v30)
              {
                v79 = 0;
              }
              else
              {
                v78 = 0;
                v79 = 0;
                do
                {
                  objc_msgSend_segment(v46, v74, v75, v76, v77);
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  v79 += objc_msgSend_barDurationForBarIndex_(v80, v81, v78, v82, v83);

                  ++v78;
                }
                while (objc_msgSend_barsUsed(v46, v84, v85, v86, v87) + v30 > v78);
              }
              objc_msgSend__sampleDurationOfClipPlaylist_(self, v74, (uint64_t)v181, v76, v77);
              if (v79 - objc_msgSend_duration(v46, v88, v89, v90, v91) <= a6)
              {
                v111 = objc_msgSend_barsUsed(v46, v40, v41, v42, v43);
                objc_msgSend_setBarsUsed_(v46, v112, v111 + v30, v113, v114);
                v93 = v46;
                objc_msgSend_setDuration_(v93, v115, v79, v116, v117);
                if (v180)
                {
                  objc_msgSend_segment(v93, v118, v119, v120, v121);
                  *v180 = (id)objc_claimAutoreleasedReturnValue();
                }
                v18 = v181;
                v186 = 0;
                a8 = v179;
                *v179 = objc_msgSend_indexOfObject_(v181, v118, (uint64_t)v93, v120, v121);
                v92 = 1;
                v12 = v177;
                goto LABEL_38;
              }
            }
          }
          v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v40, (uint64_t)&v187, (uint64_t)v194, 16);
          if (v44)
            continue;
          break;
        }
        v92 = 0;
        v93 = 0;
        v186 = 1;
        v12 = v177;
        v18 = v181;
        a8 = v179;
LABEL_38:
        v23 = v178;
        v34 = v175;
        a4 = v176;
      }
      else
      {
        v92 = 0;
        v93 = 0;
        v186 = 1;
      }

      if (!v186)
        goto LABEL_45;
    }
    else
    {
      v93 = 0;
    }
    v122 = v93;
    v93 = objc_alloc_init(FlexSegmentAssemblyInfo);

    objc_msgSend_setSegment_(v93, v123, (uint64_t)v12, v124, v125);
    objc_msgSend_setUrl_(v93, v126, (uint64_t)v23, v127, v128);
    objc_msgSend_setDuration_(v93, v129, a4, v130, v131);
    objc_msgSend_setBarsUsed_(v93, v132, v30, v133, v134);
    if (objc_msgSend_type(v12, v135, v136, v137, v138) == 2 || objc_msgSend_type(v12, v139, v140, v141, v142) == 3)
    {
      objc_msgSend_addObject_(v18, v139, (uint64_t)v93, v141, v142);
      v144 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend_nameIndex(v12, v145, v146, v147, v148);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      v154 = objc_msgSend_integerValue(v149, v150, v151, v152, v153);
      objc_msgSend_numberWithInteger_(v144, v155, v154, v156, v157);
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      v193 = v158;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v159, (uint64_t)&v193, 1, v160);
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__sequenceBodySegmentList_forIndexes_(self, v162, (uint64_t)v18, (uint64_t)v161, v163);

    }
    else if (objc_msgSend_type(v12, v139, v143, v141, v142) == 1)
    {
      objc_msgSend_insertObject_atIndex_(v18, v168, (uint64_t)v93, 0, v171);
    }
    else
    {
      if (objc_msgSend_type(v12, v168, v169, v170, v171) != 4)
      {
        v92 = 0;
        goto LABEL_45;
      }
      objc_msgSend_addObject_(v18, v172, (uint64_t)v93, v173, v174);
    }
    *a8 = objc_msgSend_indexOfObject_(v18, v164, (uint64_t)v93, v165, v166);
    v92 = 1;
LABEL_45:

    goto LABEL_46;
  }
  v94 = 0;
  if (!v12 && a4 && v13)
  {
    v95 = objc_alloc_init(FlexSegmentAssemblyInfo);
    objc_msgSend_setSegment_(v95, v96, 0, v97, v98);
    objc_msgSend_setUrl_(v95, v99, 0, v100, v101);
    objc_msgSend_setDuration_(v95, v102, a4, v103, v104);
    v94 = 1;
    objc_msgSend_setBarsUsed_(v95, v105, 1, v106, v107);
    objc_msgSend_addObject_(v18, v108, (uint64_t)v95, v109, v110);

  }
LABEL_47:

  return v94;
}

- (void)_removeSegmentInfo:(id)a3 fromAssemblyList:(id)a4
{
  uint64_t v4;

  if (a3)
    objc_msgSend_removeObject_(a4, a2, (uint64_t)a3, (uint64_t)a4, v4);
}

- (BOOL)_updateTransitionBodySegmentsForAssemblyList:(id)a3 usingNewSegment:(id)a4 indexOfNewTransitionSegment:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  char v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  void *v47;
  unint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  id v171;
  const char *v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t i;
  void *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  const char *v187;
  int v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  BOOL v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  id v201;
  const char *v202;
  uint64_t v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t j;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  void *v219;
  void *v220;
  id v221;
  const char *v222;
  uint64_t v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  void *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t k;
  uint64_t v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  id v236;
  id v237;
  char isEqualToString;
  int v239;
  void *v240;
  void *v241;
  char *v242;
  void *v243;
  void *v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  uint64_t v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  _BYTE v258[128];
  _BYTE v259[128];
  _BYTE v260[128];
  uint64_t v261;

  v261 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v237 = a5;
  if (!objc_msgSend_count(v8, v10, v11, v12, v13))
  {
    v33 = 1;
    v227 = v237;
    goto LABEL_67;
  }
  v236 = v9;
  objc_msgSend_set(MEMORY[0x24BDBCEF0], v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x24BDBCEF0], v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x24BDBCEF0], v24, v25, v26, v27);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v239 = 0;
  v33 = 1;
  v240 = v23;
  v241 = v18;
  do
  {
LABEL_3:
    objc_msgSend_removeAllObjects(v23, v28, v29, v30, v31);
    objc_msgSend_removeAllObjects(v18, v34, v35, v36, v37);
    if (!objc_msgSend_count(v8, v38, v39, v40, v41))
      goto LABEL_26;
    v46 = 0;
    while (1)
    {
      objc_msgSend_objectAtIndexedSubscript_(v8, v42, (uint64_t)v46, v44, v45);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (unint64_t)(v46 + 1);
      if ((unint64_t)(v46 + 1) < objc_msgSend_count(v8, v49, v50, v51, v52))
        break;
      if (v48 != objc_msgSend_count(v8, v53, v54, v55, v56))
        goto LABEL_24;
      objc_msgSend_segment(v47, v98, v99, v100, v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = objc_msgSend_type(v102, v103, v104, v105, v106);

      if (v107 == 3)
        objc_msgSend_addObject_(v241, v108, (uint64_t)v47, v109, v110);
LABEL_21:

      v46 = (char *)v48;
      if (v48 >= objc_msgSend_count(v8, v163, v164, v165, v166))
        goto LABEL_25;
    }
    v242 = v46 + 1;
    objc_msgSend_objectAtIndexedSubscript_(v8, v53, (uint64_t)(v46 + 1), v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_segment(v47, v58, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v244 = v57;
    objc_msgSend_segment(v57, v63, v64, v65, v66);
    v67 = v47;
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v68, v69, v70, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend_barsUsed(v67, v74, v75, v76, v77);
    objc_msgSend_transitionToSegmentNamed_fromBarIndex_(v62, v79, (uint64_t)v73, v78 - 1, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    v243 = v81;
    objc_msgSend_transitionSegmentName(v81, v82, v83, v84, v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v86)
    {
      objc_msgSend_segment(v67, v87, v88, v89, v90);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = objc_msgSend_type(v111, v112, v113, v114, v115);

      v47 = v67;
      v92 = v244;
      if (v116 != 3)
      {
LABEL_20:

        v48 = (unint64_t)v242;
        goto LABEL_21;
      }
      if (v46)
      {
        objc_msgSend_objectAtIndexedSubscript_(v8, v117, (uint64_t)(v46 - 1), v119, v120);
        v46 = (char *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend_segment(v46, v117, v118, v119, v120);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_segment(v244, v122, v123, v124, v125);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v126, v127, v128, v129, v130);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      v136 = objc_msgSend_barsUsed(v46, v132, v133, v134, v135);
      objc_msgSend_transitionToSegmentNamed_fromBarIndex_(v121, v137, (uint64_t)v131, v136 - 1, v138);
      v139 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_transitionSegmentName(v139, v140, v141, v142, v143);
      v144 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = v67;
      if (!v144)
        goto LABEL_17;
      objc_msgSend_transitionSegmentName(v139, v145, v146, v147, v148);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_segment(v67, v150, v151, v152, v153);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v154, v155, v156, v157, v158);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v149, v160, (uint64_t)v159, v161, v162);

      v47 = v67;
      if ((isEqualToString & 1) == 0)
LABEL_17:
        objc_msgSend_addObject_(v241, v145, (uint64_t)v47, v147, v148);

      v92 = v244;
LABEL_19:

      goto LABEL_20;
    }
    v91 = objc_msgSend_barsUsed(v67, v87, v88, v89, v90);
    v92 = v244;
    objc_msgSend__transitionSegmentForSegmentInfo_toSegmentInfo_fromBarIndex_inSegmentList_(self, v93, (uint64_t)v67, (uint64_t)v244, v91 - 1, v8);
    v94 = objc_claimAutoreleasedReturnValue();
    v47 = v67;
    if (v94)
    {
      v46 = (char *)v94;
      objc_msgSend_addObject_(v240, v95, v94, v96, v97);
      goto LABEL_19;
    }

    v33 = 0;
LABEL_24:

LABEL_25:
    v23 = v240;
    v18 = v241;
LABEL_26:
    if (objc_msgSend_count(v23, v42, v43, v44, v45))
    {
      v256 = 0u;
      v257 = 0u;
      v254 = 0u;
      v255 = 0u;
      v171 = v23;
      v173 = objc_msgSend_countByEnumeratingWithState_objects_count_(v171, v172, (uint64_t)&v254, (uint64_t)v260, 16);
      if (v173)
      {
        v178 = v173;
        v179 = *(_QWORD *)v255;
        do
        {
          for (i = 0; i != v178; ++i)
          {
            if (*(_QWORD *)v255 != v179)
              objc_enumerationMutation(v171);
            v181 = (void *)objc_msgSend_copy(*(void **)(*((_QWORD *)&v254 + 1) + 8 * i), v174, v175, v176, v177);
            v253 = 0x7FFFFFFFFFFFFFFFLL;
            v186 = objc_msgSend_sampleCount(v181, v182, v183, v184, v185);
            v188 = objc_msgSend__addSegment_withDuration_toAssemblyList_indexOfNewSegment_(self, v187, (uint64_t)v181, v186, (uint64_t)v8, &v253);
            v33 = v188;
            if (v188)
              v192 = v253 == 0x7FFFFFFFFFFFFFFFLL;
            else
              v192 = 1;
            if (!v192)
            {
              objc_msgSend_objectAtIndex_(v8, v189, v253, v190, v191);
              v196 = (void *)objc_claimAutoreleasedReturnValue();
              if (v196)
                objc_msgSend_addObject_(v32, v193, (uint64_t)v196, v194, v195);

            }
          }
          v178 = objc_msgSend_countByEnumeratingWithState_objects_count_(v171, v174, (uint64_t)&v254, (uint64_t)v260, 16);
        }
        while (v178);
        v23 = v240;
        v18 = v241;
      }

    }
    if (objc_msgSend_count(v18, v167, v168, v169, v170))
    {
      v251 = 0u;
      v252 = 0u;
      v249 = 0u;
      v250 = 0u;
      v201 = v18;
      v203 = objc_msgSend_countByEnumeratingWithState_objects_count_(v201, v202, (uint64_t)&v249, (uint64_t)v259, 16);
      if (v203)
      {
        v206 = v203;
        v207 = *(_QWORD *)v250;
        do
        {
          for (j = 0; j != v206; ++j)
          {
            if (*(_QWORD *)v250 != v207)
              objc_enumerationMutation(v201);
            v209 = *(_QWORD *)(*((_QWORD *)&v249 + 1) + 8 * j);
            objc_msgSend__removeSegmentInfo_fromAssemblyList_(self, v204, v209, (uint64_t)v8, v205);
            if (objc_msgSend_containsObject_(v32, v210, v209, v211, v212))
              objc_msgSend_removeObject_(v32, v204, v209, v213, v205);
          }
          v206 = objc_msgSend_countByEnumeratingWithState_objects_count_(v201, v204, (uint64_t)&v249, (uint64_t)v259, 16);
        }
        while (v206);
      }

      v18 = v241;
    }
    if (v239 == 10)
      break;
    ++v239;
    objc_msgSend_anyObject(v23, v197, v198, v199, v200);
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    if (v214)
    {

      goto LABEL_3;
    }
    objc_msgSend_anyObject(v18, v215, v216, v217, v218);
    v219 = (void *)objc_claimAutoreleasedReturnValue();

  }
  while (v219);
  v220 = v18;
  v247 = 0u;
  v248 = 0u;
  v245 = 0u;
  v246 = 0u;
  v221 = v32;
  v223 = objc_msgSend_countByEnumeratingWithState_objects_count_(v221, v222, (uint64_t)&v245, (uint64_t)v258, 16);
  v9 = v236;
  v227 = v237;
  if (v223)
  {
    v228 = v223;
    v229 = *(_QWORD *)v246;
    do
    {
      for (k = 0; k != v228; ++k)
      {
        if (*(_QWORD *)v246 != v229)
          objc_enumerationMutation(v221);
        v231 = objc_msgSend_indexOfObject_(v8, v224, *(_QWORD *)(*((_QWORD *)&v245 + 1) + 8 * k), v225, v226);
        objc_msgSend_addIndex_(v237, v232, v231, v233, v234);
      }
      v228 = objc_msgSend_countByEnumeratingWithState_objects_count_(v221, v224, (uint64_t)&v245, (uint64_t)v258, 16);
    }
    while (v228);
  }

LABEL_67:
  return v33 & 1;
}

- (BOOL)_removeUnpermittedTransitionsInAssemblyList:(id)a3 final:(BOOL)a4 testingContext:(id)a5 removedIndexes:(id)a6
{
  return objc_msgSend__removeUnpermittedTransitionsInAssemblyList_final_testingContext_removedIndexes_conflictList_(self, a2, (uint64_t)a3, a4, (uint64_t)a5, a6, 0);
}

- (BOOL)_removeUnpermittedTransitionsInAssemblyList:(id)a3 final:(BOOL)a4 testingContext:(id)a5 removedIndexes:(id)a6 conflictList:(id)a7
{
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  BOOL v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
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
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  int v134;
  id v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  id v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  id v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  id v208;
  void *v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  void *v214;
  void *v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  void *v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  void *v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  void *v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  void *v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  int v244;
  void *v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  void *v250;
  const char *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  void *v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  _BOOL4 v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  void *v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  const char *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  void *v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  _BOOL4 v294;
  uint64_t v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  const char *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  void *v306;
  BOOL v307;
  uint64_t v308;
  const char *v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  void *v314;
  void *v315;
  const char *v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  void *v325;
  const char *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  void *v330;
  void *v331;
  const char *v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  const char *v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  void *v341;
  void *v342;
  const char *v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  void *v347;
  const char *v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  void *v352;
  const char *v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  void *v357;
  const char *v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  void *v362;
  const char *v363;
  uint64_t v364;
  uint64_t v365;
  void *v366;
  const char *v367;
  uint64_t v368;
  uint64_t v369;
  void *v370;
  const char *v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  void *v375;
  const char *v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  void *v380;
  const char *v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  void *v385;
  const char *v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  void *v390;
  const char *v391;
  uint64_t v392;
  uint64_t v393;
  void *v394;
  const char *v395;
  uint64_t v396;
  uint64_t v397;
  const char *v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  id v402;
  const char *v403;
  uint64_t v404;
  const char *v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t i;
  void *v410;
  void *v411;
  const char *v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  void *v416;
  const char *v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  void *v421;
  const char *v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  const char *v427;
  uint64_t v428;
  uint64_t v429;
  void *v430;
  const char *v431;
  uint64_t v432;
  uint64_t v433;
  const char *v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  _BOOL4 v439;
  id v440;
  id v441;
  void *v442;
  BOOL v443;
  void *v444;
  int v445;
  int v446;
  id v447;
  void *v448;
  uint64_t v449;
  int isEqualToString;
  id v451;
  unint64_t v452;
  void *v453;
  id objb;
  id obj;
  id obja;
  uint64_t v457;
  void *v458;
  void *v459;
  void *v460;
  uint64_t v461;
  id v462;
  __int128 v463;
  __int128 v464;
  __int128 v465;
  __int128 v466;
  __int128 v467;
  __int128 v468;
  __int128 v469;
  __int128 v470;
  _BYTE v471[128];
  _BYTE v472[128];
  uint64_t v473;

  v439 = a4;
  v473 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v441 = a5;
  v12 = a6;
  v440 = a7;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v13, v14, v15, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = 0;
  v447 = v12;
  v444 = v21;
  do
  {
    v443 = v23;
    if (v23)
      break;
    v445 = v22;
    v24 = objc_msgSend_count(v11, v17, v18, v19, v20);
    if (!v24)
      goto LABEL_79;
    v29 = v24;
    v30 = 0;
    v31 = v24 - 1;
    v457 = 1;
    v449 = v24 - 1;
    while (1)
    {
      objc_msgSend_objectAtIndexedSubscript_(v11, v25, v30, v27, v28);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_segment(v32, v33, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend_type(v37, v38, v39, v40, v41);

      if (v42 != 3)
        break;
LABEL_35:

      ++v30;
      ++v457;
      if (v30 == v29)
        goto LABEL_79;
    }
    if (v30 >= v31)
    {
      v55 = 0;
      if (v30 != v31)
      {
LABEL_34:

        goto LABEL_35;
      }
      v452 = v30;
      v448 = 0;
      v446 = 0;
LABEL_22:
      objc_msgSend__segmentsforType_(self, v43, 4, v44, v45);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v467 = 0u;
      v468 = 0u;
      v469 = 0u;
      v470 = 0u;
      obj = v106;
      v108 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v107, (uint64_t)&v467, (uint64_t)v472, 16);
      if (v108)
      {
        v113 = v108;
        v461 = *(_QWORD *)v468;
LABEL_24:
        v114 = 0;
        while (1)
        {
          if (*(_QWORD *)v468 != v461)
            objc_enumerationMutation(obj);
          v115 = *(void **)(*((_QWORD *)&v467 + 1) + 8 * v114);
          objc_msgSend_segment(v32, v109, v110, v111, v112);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_name(v115, v117, v118, v119, v120);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          v126 = objc_msgSend_barsUsed(v32, v122, v123, v124, v125);
          objc_msgSend_transitionToSegmentNamed_fromBarIndex_(v116, v127, (uint64_t)v121, v126 - 1, v128);
          v129 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v129)
            break;
          v134 = objc_msgSend_prevented(v129, v130, v131, v132, v133);

          if (!v134)
            break;
          if (v113 == ++v114)
          {
            v113 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v109, (uint64_t)&v467, (uint64_t)v472, 16);
            if (v113)
              goto LABEL_24;

            v135 = v32;
            objc_msgSend_removedConflicts(v441, v136, v137, v138, v139);
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            v141 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend_segment(v135, v142, v143, v144, v145);
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_name(v146, v147, v148, v149, v150);
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringWithFormat_(v141, v152, (uint64_t)CFSTR("supply an outro for %@"), v153, v154, v151);
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v140, v156, (uint64_t)v155, v157, v158);

            v159 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend_segment(v135, v160, v161, v162, v163);
            v164 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_name(v164, v165, v166, v167, v168);
            v169 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringWithFormat_(v159, v170, (uint64_t)CFSTR("supply an outro for %@"), v171, v172, v169);
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v440, v174, (uint64_t)v173, v175, v176);

            v177 = v135;
            v12 = v447;
            v55 = v448;
            v105 = v446;
            if (v135)
              goto LABEL_77;
            goto LABEL_39;
          }
        }
      }

      v12 = v447;
      v55 = v448;
      v31 = v449;
      v30 = v452;
      goto LABEL_34;
    }
    v452 = v30;
    objc_msgSend_objectAtIndexedSubscript_(v11, v43, v30 + 1, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_segment(v46, v47, v48, v49, v50);
    v459 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v457;
    while (1)
    {
      objc_msgSend_objectAtIndexedSubscript_(v11, v51, v54, v52, v53);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_segment(v55, v56, v57, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend_type(v60, v61, v62, v63, v64);

      if (v65 == 2)
        break;

      if (v29 == ++v54)
      {
        v55 = v46;
        v71 = v459;
        goto LABEL_14;
      }
    }
    objc_msgSend_segment(v55, v66, v67, v68, v69);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
    objc_msgSend_segment(v32, v51, v70, v52, v53);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend_sliceable(v72, v73, v74, v75, v76);

    if (v77)
      v82 = objc_msgSend_barsUsed(v32, v78, v79, v80, v81) - 1;
    else
      v82 = 0;
    objc_msgSend_lastObject(v11, v78, v79, v80, v81);
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    objb = (id)objc_msgSend_type(v71, v84, v85, v86, v87);
    objc_msgSend_segment(v32, v88, v89, v90, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v460 = v71;
    objc_msgSend_name(v71, v93, v94, v95, v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transitionToSegmentNamed_fromBarIndex_(v92, v98, (uint64_t)v97, v82, v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    if (objb == (id)3 && v55 == v83)
    {

LABEL_40:
      v181 = v55;
      goto LABEL_41;
    }
    v105 = objc_msgSend_prevented(v100, v101, v102, v103, v104);

    v31 = v449;
    v30 = v452;
    if (v452 == v449 && (v105 & 1) == 0)
    {
      v446 = v105;
      v448 = v55;
      goto LABEL_22;
    }
    if ((v105 & 1) == 0)
      goto LABEL_34;
LABEL_39:
    if (v105)
      goto LABEL_40;
    v181 = 0;
LABEL_41:
    v182 = v181;
    objc_msgSend__segmentsforType_(self, v183, 2, v184, v185);
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_indexesOfObjectsPassingTest_(v186, v187, (uint64_t)&unk_24C5F0888, v188, v189);
    v190 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectsAtIndexes_(v186, v191, v190, v192, v193);
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    obja = (id)v190;
    v458 = v186;
    v453 = v194;
    if (objc_msgSend_count(v194, v195, v196, v197, v198) == 1)
    {
      objc_msgSend_firstObject(v194, v199, v200, v201, v202);
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v203, v204, v205, v206, v207);
      v208 = v182;
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_segment(v32, v210, v211, v212, v213);
      v214 = v55;
      v215 = v32;
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v216, v217, v218, v219, v220);
      v221 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v209, v222, (uint64_t)v221, v223, v224);

      v32 = v215;
      v55 = v214;

      v182 = v208;
    }
    else
    {
      isEqualToString = 0;
    }
    v462 = v182;
    v442 = v32;
    objc_msgSend_segment(v32, v199, v200, v201, v202);
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v225, v226, v227, v228, v229);
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_segment(v182, v231, v232, v233, v234);
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v235, v236, v237, v238, v239);
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    v244 = objc_msgSend_isEqualToString_(v230, v241, (uint64_t)v240, v242, v243);

    v245 = v182;
    v32 = v442;
    if (!v244)
      goto LABEL_70;
    objc_msgSend_segment(v442, v246, v247, v248, v249);
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_sliceable(v250, v251, v252, v253, v254))
    {
      v259 = objc_msgSend_barsUsed(v442, v255, v256, v257, v258);
      objc_msgSend_segment(v442, v260, v261, v262, v263);
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      v269 = v259 != objc_msgSend_bars(v264, v265, v266, v267, v268);

    }
    else
    {
      v269 = 0;
    }

    objc_msgSend_segment(v245, v270, v271, v272, v273);
    v274 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_sliceable(v274, v275, v276, v277, v278) & 1) != 0)
    {
      v283 = objc_msgSend_barsUsed(v245, v279, v280, v281, v282);
      objc_msgSend_segment(v245, v284, v285, v286, v287);
      v288 = (void *)objc_claimAutoreleasedReturnValue();
      v293 = objc_msgSend_bars(v288, v289, v290, v291, v292);

      v294 = v283 != v293;
      if (v283 != v293 && v269)
      {
        v296 = objc_msgSend_barsUsed(v442, v246, v247, v248, v249);
        v301 = objc_msgSend_barsUsed(v245, v297, v298, v299, v300);
        v306 = v442;
        v307 = v296 < v301;
        v32 = v442;
        if (v307)
          goto LABEL_69;
        v308 = objc_msgSend_barsUsed(v442, v302, v303, v304, v305);
        v313 = objc_msgSend_barsUsed(v245, v309, v310, v311, v312);
        v306 = v245;
        v307 = v308 <= v313;
        v32 = v442;
        if (!v307)
          goto LABEL_69;
        goto LABEL_70;
      }
    }
    else
    {

      v294 = 0;
    }
    v32 = v442;
    if (!v269 && !v294)
      goto LABEL_70;
    if (v269)
      v306 = v442;
    else
      v306 = v245;
    if (!v439)
      v306 = v442;
    if (v269)
      v314 = v245;
    else
      v314 = v442;
    if (isEqualToString)
      v306 = v314;
LABEL_69:
    v177 = v306;
    if (!v177)
    {
LABEL_70:
      objc_msgSend_segment(v32, v246, v247, v248, v249);
      v315 = (void *)objc_claimAutoreleasedReturnValue();
      v320 = objc_msgSend_priority(v315, v316, v317, v318, v319);
      objc_msgSend_segment(v245, v321, v322, v323, v324);
      v325 = (void *)objc_claimAutoreleasedReturnValue();
      v307 = v320 <= objc_msgSend_priority(v325, v326, v327, v328, v329);
      v32 = v442;
      if (v307)
        v330 = v442;
      else
        v330 = v245;
      v177 = v330;

    }
    objc_msgSend_segment(v245, v246, v247, v248, v249);
    v331 = (void *)objc_claimAutoreleasedReturnValue();
    v336 = objc_msgSend_type(v331, v332, v333, v334, v335);

    if (v336 != 3)
    {
      objc_msgSend_removedConflicts(v441, v337, v338, v339, v340);
      v341 = (void *)objc_claimAutoreleasedReturnValue();
      v342 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_segment(v32, v343, v344, v345, v346);
      v347 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v347, v348, v349, v350, v351);
      v352 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_segment(v55, v353, v354, v355, v356);
      v451 = v177;
      v357 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v357, v358, v359, v360, v361);
      v362 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v342, v363, (uint64_t)CFSTR("%@ -> %@"), v364, v365, v352, v362);
      v366 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v341, v367, (uint64_t)v366, v368, v369);

      v245 = v462;
      v370 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_segment(v442, v371, v372, v373, v374);
      v375 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v375, v376, v377, v378, v379);
      v380 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_segment(v55, v381, v382, v383, v384);
      v385 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v385, v386, v387, v388, v389);
      v390 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v370, v391, (uint64_t)CFSTR("%@ -> %@"), v392, v393, v380, v390);
      v394 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v440, v395, (uint64_t)v394, v396, v397);

      v32 = v442;
      v177 = v451;

    }
    if (v177)
    {
LABEL_77:
      objc_msgSend_addObject_(v444, v178, (uint64_t)v177, v179, v180);

    }
LABEL_79:
    v21 = v444;
    if (objc_msgSend_count(v444, v25, v26, v27, v28))
    {
      v465 = 0u;
      v466 = 0u;
      v463 = 0u;
      v464 = 0u;
      v402 = v444;
      v404 = objc_msgSend_countByEnumeratingWithState_objects_count_(v402, v403, (uint64_t)&v463, (uint64_t)v471, 16);
      if (v404)
      {
        v407 = v404;
        v408 = *(_QWORD *)v464;
        do
        {
          for (i = 0; i != v407; ++i)
          {
            if (*(_QWORD *)v464 != v408)
              objc_enumerationMutation(v402);
            v410 = *(void **)(*((_QWORD *)&v463 + 1) + 8 * i);
            objc_msgSend__removeSegmentInfo_fromAssemblyList_(self, v405, (uint64_t)v410, (uint64_t)v11, v406);
            v411 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend_segment(v410, v412, v413, v414, v415);
            v416 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_nameIndex(v416, v417, v418, v419, v420);
            v421 = (void *)objc_claimAutoreleasedReturnValue();
            v426 = objc_msgSend_integerValue(v421, v422, v423, v424, v425);
            objc_msgSend_numberWithInteger_(v411, v427, v426, v428, v429);
            v430 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v12, v431, (uint64_t)v430, v432, v433);

          }
          v407 = objc_msgSend_countByEnumeratingWithState_objects_count_(v402, v405, (uint64_t)&v463, (uint64_t)v471, 16);
        }
        while (v407);
      }

      objc_msgSend_removeAllObjects(v402, v434, v435, v436, v437);
      v23 = 0;
      v21 = v444;
    }
    else
    {
      v23 = objc_msgSend_count(v444, v398, v399, v400, v401) == 0;
    }
    v22 = v445 + 1;
  }
  while (v445 != 100);
  objc_msgSend_addObject_(v440, v17, (uint64_t)CFSTR("-"), v19, v20);

  return v443;
}

- (BOOL)_addBodySegmentsForAssemblyList:(id)a3 forDuration:(int64_t)a4 unusedDuration:(int64_t *)a5 testingContext:(id)a6 timedOut:(BOOL *)a7
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
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
  unsigned int v68;
  int64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t j;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  char isEqualToArray;
  id v133;
  const char *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  int v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  int64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  int isEqualToString;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  void *v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  BOOL v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  char v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  const char *v234;
  uint64_t v235;
  int64_t v236;
  int v237;
  id v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  void *v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  unint64_t v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  unint64_t v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  void *v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  void *v265;
  const char *v266;
  int v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  void *v276;
  const char *v277;
  uint64_t v278;
  const char *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  id v283;
  const char *v284;
  const char *v285;
  uint64_t v286;
  uint64_t v287;
  const char *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  void *v292;
  const char *v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t Index;
  const char *v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t k;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
  const char *v306;
  uint64_t v307;
  uint64_t v308;
  const char *v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  void *v313;
  const char *v314;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  const char *v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  int64_t v322;
  const char *v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  void *v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  const char *v334;
  uint64_t v335;
  uint64_t v336;
  const char *v337;
  uint64_t v338;
  uint64_t v339;
  const char *v340;
  uint64_t v341;
  uint64_t v342;
  void *v343;
  const char *v344;
  uint64_t v345;
  const char *v346;
  uint64_t v347;
  const char *v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t m;
  const char *v353;
  const char *v354;
  uint64_t v355;
  uint64_t v356;
  const char *v357;
  const char *v358;
  uint64_t v359;
  uint64_t v360;
  const char *v361;
  uint64_t v362;
  int64_t v363;
  const char *v364;
  const char *v365;
  const char *v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  const char *v370;
  const char *v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  const char *v376;
  uint64_t v377;
  uint64_t v378;
  void *v380;
  int64_t v383;
  void *v384;
  void *v385;
  unint64_t v386;
  void *v387;
  void *context;
  unsigned int v389;
  void *v390;
  char v391;
  void *v392;
  id v393;
  void *v394;
  char updated;
  int64_t v396;
  uint64_t v397;
  void *v398;
  id obj;
  uint64_t v400;
  uint64_t v401;
  void *v402;
  void *v403;
  id v404;
  id v405;
  uint64_t v406;
  void *v407;
  void *v408;
  int64_t v409;
  uint64_t v410;
  FlexSong *v411;
  __int128 v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  _QWORD v416[5];
  id v417;
  uint64_t v418;
  __int128 v419;
  __int128 v420;
  __int128 v421;
  __int128 v422;
  __int128 v423;
  __int128 v424;
  __int128 v425;
  __int128 v426;
  _BYTE v427[128];
  _BYTE v428[128];
  _BYTE v429[128];
  uint64_t v430;

  v430 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  objc_msgSend__segmentsforType_(self, v12, 2, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingComparator_(v15, v16, (uint64_t)&unk_24C5F08A8, v17, v18);
  v385 = (void *)objc_claimAutoreleasedReturnValue();
  updated = objc_msgSend_count(v385, v19, v20, v21, v22) != 0;
  objc_msgSend__sortFlexSegmentsShortestToLongest_(self, v23, (uint64_t)v15, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v26, v27, v28, v29, v30);
  v384 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_indexesOfObjectsPassingTest_(v15, v31, (uint64_t)&unk_24C5F08C8, v32, v33);
  v394 = v15;
  v380 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectsAtIndexes_(v15, v34, (uint64_t)v380, v35, v36);
  v423 = 0u;
  v424 = 0u;
  v425 = 0u;
  v426 = 0u;
  v37 = (id)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v423, (uint64_t)v429, 16);
  v411 = self;
  obj = v37;
  if (v39)
  {
    v44 = v39;
    v45 = *(_QWORD *)v424;
    v46 = -1;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v424 != v45)
          objc_enumerationMutation(obj);
        v48 = *(void **)(*((_QWORD *)&v423 + 1) + 8 * i);
        if (objc_msgSend_bars(v48, v40, v41, v42, v43) >= 2)
        {
          v49 = 0;
          do
          {
            v50 = objc_msgSend_barDurationForBarIndex_(v48, v40, v49, v42, v43);
            if (v50 < v46 || v46 == -1)
              v46 = v50;
            ++v49;
          }
          while (objc_msgSend_bars(v48, v51, v52, v53, v54) - 1 > v49);
        }
      }
      v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v40, (uint64_t)&v423, (uint64_t)v429, 16);
    }
    while (v44);

    self = v411;
    if (v46 != -1 && v46 < objc_msgSend_sampleCount(v384, v56, v57, v58, v59))
      goto LABEL_21;
  }
  else
  {

  }
  v46 = objc_msgSend_sampleCount(v384, v56, v57, v58, v59);
LABEL_21:
  *a7 = 0;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v56, v57, v58, v59);
  v407 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v60, v61, v62, v63);
  v392 = (void *)objc_claimAutoreleasedReturnValue();
  v386 = 0;
  v68 = 0;
  v383 = a4 + 1;
  v69 = a4;
  v396 = a4;
  v397 = (uint64_t)v11;
  v393 = v10;
  do
  {
    v389 = v68;
    if ((updated & 1) == 0 || v46 > v69)
      goto LABEL_143;
    context = (void *)MEMORY[0x212B9B7A0]();
    if (objc_msgSend_count(v392, v70, v71, v72, v73))
    {
      objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCE30], v74, (uint64_t)v392, v76, v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v407, v79, (uint64_t)v78, v80, v81);

    }
    objc_msgSend_removeAllObjects(v392, v74, v75, v76, v77);
    objc_msgSend_lastObject(v407, v82, v83, v84, v85);
    v398 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = objc_msgSend_count(v407, v86, v87, v88, v89);
    v94 = v90 - 2;
    if (v90 - 2 >= 0)
    {
      v95 = v90 - 1;
      v409 = v69;
      while (1)
      {
        objc_msgSend_objectAtIndexedSubscript_(v407, v91, v94, v92, v93);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqualToArray_(v96, v97, (uint64_t)v398, v98, v99))
        {
          objc_msgSend_array(MEMORY[0x24BDBCEB8], v100, v101, v102, v103);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          for (j = objc_msgSend_count(v407, v105, v106, v107, v108) - 1; j > v94; --j)
          {
            objc_msgSend_objectAtIndexedSubscript_(v407, v109, j, v111, v112);
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v104, v115, (uint64_t)v114, v116, v117);

          }
          v122 = v94 - objc_msgSend_count(v104, v109, v110, v111, v112) + 1;
          if (v122 >= 0)
          {
            objc_msgSend_array(MEMORY[0x24BDBCEB8], v118, v119, v120, v121);
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            v127 = v95;
            if (v94 >= v122)
            {
              do
              {
                objc_msgSend_objectAtIndexedSubscript_(v407, v123, --v127, v124, v125);
                v128 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v126, v129, (uint64_t)v128, v130, v131);

              }
              while (v127 > v122);
            }
            isEqualToArray = objc_msgSend_isEqualToArray_(v126, v123, (uint64_t)v104, v124, v125);

            v10 = v393;
            v69 = v409;
            if ((isEqualToArray & 1) != 0)
            {
              ++v386;

              a4 = v396;
              self = v411;
              break;
            }
          }

          self = v411;
        }

        --v95;
        v225 = v94-- <= 0;
        if (v225)
        {
          a4 = v396;
          break;
        }
      }
    }
    v421 = 0u;
    v422 = 0u;
    v419 = 0u;
    v420 = 0u;
    v133 = v385;
    v406 = objc_msgSend_countByEnumeratingWithState_objects_count_(v133, v134, (uint64_t)&v419, (uint64_t)v428, 16);
    if (!v406)
    {
      v391 = 0;
      updated = 1;
      goto LABEL_139;
    }
    v391 = 0;
    v401 = *(_QWORD *)v420;
    updated = 1;
    v408 = v133;
    do
    {
      v139 = 0;
      do
      {
        if (*(_QWORD *)v420 != v401)
          objc_enumerationMutation(v133);
        v410 = v139;
        v140 = *(void **)(*((_QWORD *)&v419 + 1) + 8 * v139);
        v141 = objc_msgSend_sampleCount(v140, v135, v136, v137, v138);
        objc_msgSend_name(v140, v142, v143, v144, v145);
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        v150 = objc_msgSend_containsString_(v146, v147, (uint64_t)CFSTR("drm_"), v148, v149);

        if (!v150)
        {
          isEqualToString = 1;
          goto LABEL_59;
        }
        v400 = v141;
        v155 = v69;
        objc_msgSend_lastObject(v10, v151, v152, v153, v154);
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lastObject(v394, v157, v158, v159, v160);
        v402 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v394, v161, v162, v163, v164);
        v404 = (id)objc_claimAutoreleasedReturnValue();
        v165 = v156;
        objc_msgSend_segment(v156, v166, v167, v168, v169);
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_nameSuffix(v170, v171, v172, v173, v174);
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_nameSuffix(v140, v176, v177, v178, v179);
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = 1;
        v184 = objc_msgSend_compare_options_(v175, v182, (uint64_t)v180, 1, v183);

        if (v184 == -1)
        {
          a4 = v396;
          v69 = v155;
LABEL_56:
          v141 = v400;
          goto LABEL_57;
        }
        a4 = v396;
        v69 = v155;
        if (!objc_msgSend_count(v10, v185, v186, v187, v188))
        {
          isEqualToString = 1;
          goto LABEL_56;
        }
        v141 = v400;
        if (v184)
        {
          if (v184 == 1)
          {
            objc_msgSend_segment(v165, v189, v190, v191, v192);
            v193 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_name(v193, v194, v195, v196, v197);
            v198 = (void *)objc_claimAutoreleasedReturnValue();
            v199 = v402;
            objc_msgSend_name(v402, v200, v201, v202, v203);
            v390 = v198;
            v204 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_isEqualToString_(v198, v205, (uint64_t)v204, v206, v207))
            {
              objc_msgSend_name(v140, v208, v209, v210, v211);
              v387 = v193;
              v212 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_name(v404, v213, v214, v215, v216);
              v217 = (void *)objc_claimAutoreleasedReturnValue();
              isEqualToString = objc_msgSend_isEqualToString_(v212, v218, (uint64_t)v217, v219, v220);

              v199 = v402;
              v193 = v387;
            }
            else
            {
              isEqualToString = 0;
            }

            a4 = v396;
            goto LABEL_58;
          }
          isEqualToString = 1;
        }
        else
        {
          isEqualToString = 0;
        }
LABEL_57:
        v199 = v402;
LABEL_58:

LABEL_59:
        if (v141 <= v69 && isEqualToString != 0)
        {
          v235 = objc_msgSend_sampleCount(v140, v151, v152, v153, v154);
LABEL_74:
          v417 = 0;
          v418 = 0x7FFFFFFFFFFFFFFFLL;
          self = v411;
          v236 = v69;
          v237 = objc_msgSend__addSegment_withDuration_toAssemblyList_timeRemaining_reusedSegment_indexofNewSegment_(v411, v234, (uint64_t)v140, v235, (uint64_t)v10, v69, &v417, &v418);
          v238 = v417;
          if (v237)
          {
            v405 = v238;
            objc_msgSend_objectAtIndex_(v10, v239, v418, v240, v241);
            v242 = (void *)objc_claimAutoreleasedReturnValue();
            v416[0] = MEMORY[0x24BDAC760];
            v416[1] = 3221225472;
            v416[2] = sub_20D038AF0;
            v416[3] = &unk_24C5F08F0;
            v416[4] = v140;
            v246 = objc_msgSend_indexOfObjectPassingTest_(v408, v243, (uint64_t)v416, v244, v245);
            if (v246 == 0x7FFFFFFFFFFFFFFFLL)
            {

              updated = 0;
              v133 = v408;
LABEL_138:

              v69 = v236;
              goto LABEL_139;
            }
            v251 = v246;
            if (v246 < objc_msgSend_count(v408, v247, v248, v249, v250) - 1)
              objc_msgSend_objectAtIndexedSubscript_(v408, v252, v251 + 1, v253, v254);
            else
              objc_msgSend_objectAtIndexedSubscript_(v408, v252, 0, v253, v254);
            v255 = (void *)objc_claimAutoreleasedReturnValue();
            v260 = v236 - objc_msgSend_sampleCount(v140, v256, v257, v258, v259);
            if (v260 > objc_msgSend_sampleCount(v255, v261, v262, v263, v264))
              goto LABEL_95;
            v403 = v255;
            v265 = (void *)objc_opt_new();
            v267 = objc_msgSend__removeUnpermittedTransitionsInAssemblyList_final_testingContext_removedIndexes_conflictList_(v411, v266, (uint64_t)v10, 0, v397, v265, v392);
            if (objc_msgSend_count(v265, v268, v269, v270, v271))
            {
              objc_msgSend_allObjects(v265, v272, v273, v274, v275);
              v276 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend__sequenceBodySegmentList_forIndexes_(v411, v277, (uint64_t)v10, (uint64_t)v276, v278);

            }
            if (objc_msgSend_indexOfObject_(v10, v272, (uint64_t)v242, v274, v275) == 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend_indexSet(MEMORY[0x24BDD1698], v279, v280, v281, v282);
              v283 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend__updateTransitionBodySegmentsForAssemblyList_usingNewSegment_indexOfNewTransitionSegment_(v411, v284, (uint64_t)v10, 0, (uint64_t)v283);
              v236 = a4 - objc_msgSend__sampleDurationOfClipPlaylist_(v411, v285, (uint64_t)v10, v286, v287);
              if (v236 < 0)
              {
                objc_msgSend_indexSet(MEMORY[0x24BDD1698], v288, v289, v290, v291);
                v292 = (void *)objc_claimAutoreleasedReturnValue();
                Index = objc_msgSend_firstIndex(v283, v293, v294, v295, v296);
                if (Index != 0x7FFFFFFFFFFFFFFFLL)
                {
                  for (k = Index;
                        k != 0x7FFFFFFFFFFFFFFFLL;
                        k = objc_msgSend_indexGreaterThanIndex_(v283, v303, k, v304, v305))
                  {
                    if (k + 1 <= (unint64_t)(objc_msgSend_count(v10, v298, v299, v300, v301) - 1))
                      objc_msgSend_addIndex_(v292, v303, k + 1, v304, v305);
                  }
                }
                objc_msgSend_addIndexes_(v292, v298, (uint64_t)v283, v300, v301);
                objc_msgSend_removeObjectsAtIndexes_(v10, v306, (uint64_t)v292, v307, v308);
                self = v411;
                v236 = a4 - objc_msgSend__sampleDurationOfClipPlaylist_(v411, v309, (uint64_t)v10, v310, v311);

              }
              goto LABEL_122;
            }

            v255 = v403;
            if (v267)
            {
LABEL_95:
              v313 = (void *)objc_opt_new();
              if (objc_msgSend__updateTransitionBodySegmentsForAssemblyList_usingNewSegment_indexOfNewTransitionSegment_(v411, v314, (uint64_t)v10, (uint64_t)v140, (uint64_t)v313))
              {
                v322 = a4 - objc_msgSend__sampleDurationOfClipPlaylist_(v411, v315, (uint64_t)v10, v316, v317);
                if (v322 < 0)
                {
                  v403 = v255;
                  v265 = v313;
                  if (objc_msgSend_sliceable(v140, v318, v319, v320, v321)
                    && objc_msgSend_barsUsed(v242, v323, v324, v325, v326) >= 2)
                  {
                    v327 = objc_msgSend_barsUsed(v242, v323, v324, v325, v326);
                    while (1)
                    {
                      v225 = v327-- <= 1;
                      if (v225)
                        break;
                      v328 = 0;
                      v329 = 0;
                      do
                      {
                        objc_msgSend_segment(v242, v323, v324, v325, v326);
                        v330 = (void *)objc_claimAutoreleasedReturnValue();
                        v329 += objc_msgSend_barDurationForBarIndex_(v330, v331, v328, v332, v333);

                        ++v328;
                      }
                      while (v327 != v328);
                      self = v411;
                      if (v322 - v329 + objc_msgSend_duration(v242, v323, v324, v325, v326) >= 1)
                      {
                        objc_msgSend_setBarsUsed_(v242, v323, v327, v325, v326);
                        objc_msgSend_setDuration_(v242, v334, v329, v335, v336);
                        v46 = v383 - objc_msgSend__sampleDurationOfClipPlaylist_(v411, v337, (uint64_t)v10, v338, v339);
                        v133 = v408;
                        v313 = v265;
                        v255 = v403;
                        goto LABEL_98;
                      }
                    }
                  }
                  v313 = v265;
                  a4 = v396;
                  if (objc_msgSend_count(v265, v323, v324, v325, v326))
                  {
                    objc_msgSend_objectsAtIndexes_(v10, v340, (uint64_t)v265, v341, v342);
                    v343 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend__removeSegmentInfo_fromAssemblyList_(self, v344, (uint64_t)v242, (uint64_t)v10, v345);
                    v414 = 0u;
                    v415 = 0u;
                    v412 = 0u;
                    v413 = 0u;
                    v283 = v343;
                    v347 = objc_msgSend_countByEnumeratingWithState_objects_count_(v283, v346, (uint64_t)&v412, (uint64_t)v427, 16);
                    if (v347)
                    {
                      v350 = v347;
                      v351 = *(_QWORD *)v413;
                      do
                      {
                        for (m = 0; m != v350; ++m)
                        {
                          if (*(_QWORD *)v413 != v351)
                            objc_enumerationMutation(v283);
                          objc_msgSend__removeSegmentInfo_fromAssemblyList_(v411, v348, *(_QWORD *)(*((_QWORD *)&v412 + 1) + 8 * m), (uint64_t)v10, v349);
                        }
                        v350 = objc_msgSend_countByEnumeratingWithState_objects_count_(v283, v348, (uint64_t)&v412, (uint64_t)v427, 16);
                      }
                      while (v350);
                    }

                    self = v411;
                    objc_msgSend__updateTransitionBodySegmentsForAssemblyList_usingNewSegment_indexOfNewTransitionSegment_(v411, v353, (uint64_t)v10, 0, 0);
                    v236 = v396 - objc_msgSend__sampleDurationOfClipPlaylist_(v411, v354, (uint64_t)v10, v355, v356);
LABEL_122:

                    v133 = v408;
                    v312 = v410;
                    v313 = v265;
                  }
                  else
                  {
                    objc_msgSend__removeSegmentInfo_fromAssemblyList_(self, v340, (uint64_t)v242, (uint64_t)v10, v342);
                    v133 = v408;
                    v312 = v410;
                  }
                  v255 = v403;
                }
                else
                {
                  v133 = v408;
LABEL_98:
                  a4 = v396;
                  v236 = v396 - objc_msgSend__sampleDurationOfClipPlaylist_(self, v318, (uint64_t)v10, v320, v321);
                  v391 = 1;
                  updated = 1;
                  v312 = v410;
                }
              }
              else
              {
                v133 = v408;
                v312 = v410;
              }

            }
            else
            {
              v133 = v408;
              v312 = v410;
            }

            v238 = v405;
          }
          else
          {
            v242 = 0;
            v133 = v408;
            v312 = v410;
          }

          goto LABEL_127;
        }
        v225 = (objc_msgSend_sliceable(v140, v151, v152, v153, v154) & isEqualToString) != 1 || v69 < 1;
        if (!v225)
        {
          if (objc_msgSend_bars(v140, v234, v222, v223, v224) < 1)
          {
            v230 = 0;
            v229 = 1;
          }
          else
          {
            v235 = 0;
            v228 = 0;
            v229 = 1;
            do
            {
              v230 = v235;
              v235 += objc_msgSend_barDurationForBarIndex_(v140, v234, v228, v226, v227);
              if (v235 > v69)
                break;
              if (v235 >= v69)
                goto LABEL_74;
              ++v228;
              v229 = 0;
              v230 = v235;
            }
            while (objc_msgSend_bars(v140, v234, v231, v232, v233) > v228);
          }
          v235 = v230;
          if ((v229 & 1) == 0)
            goto LABEL_74;
        }
        v236 = v69;
        v242 = 0;
        v312 = v410;
        self = v411;
        v133 = v408;
LABEL_127:
        if (v236 < v46)
        {
          objc_msgSend__removeUnpermittedTransitionsInAssemblyList_final_testingContext_removedIndexes_(self, v234, (uint64_t)v10, 1, v397, 0);
          updated = objc_msgSend__updateTransitionBodySegmentsForAssemblyList_usingNewSegment_indexOfNewTransitionSegment_(self, v357, (uint64_t)v10, 0, 0);
          v363 = a4 - objc_msgSend__sampleDurationOfClipPlaylist_(self, v358, (uint64_t)v10, v359, v360);
          if (v363 < 0)
          {
            objc_msgSend__removeSegmentInfo_fromAssemblyList_(self, v361, (uint64_t)v242, (uint64_t)v10, v362);
            objc_msgSend__updateTransitionBodySegmentsForAssemblyList_usingNewSegment_indexOfNewTransitionSegment_(self, v364, (uint64_t)v10, 0, 0);
            objc_msgSend__removeUnpermittedTransitionsInAssemblyList_final_testingContext_removedIndexes_(self, v365, (uint64_t)v10, 1, v397, 0);
            v363 = a4 - objc_msgSend__sampleDurationOfClipPlaylist_(self, v366, (uint64_t)v10, v367, v368);
          }
          v236 = v363;
          if (v363 < v46)
            goto LABEL_138;
        }

        v139 = v312 + 1;
        v69 = v236;
      }
      while (v139 != v406);
      v369 = objc_msgSend_countByEnumeratingWithState_objects_count_(v133, v135, (uint64_t)&v419, (uint64_t)v428, 16);
      v406 = v369;
    }
    while (v369);
LABEL_139:

    objc_autoreleasePoolPop(context);
    v11 = (id)v397;
    if (v386 > 1)
      break;
    v68 = v389 + 1;
  }
  while ((v391 & 1) != 0);
  if (v386 >= 2)
  {
    *a7 = 1;
    objc_msgSend__removeUnpermittedTransitionsInAssemblyList_final_testingContext_removedIndexes_(self, v64, (uint64_t)v10, 1, v397, 0);
    objc_msgSend__updateTransitionBodySegmentsForAssemblyList_usingNewSegment_indexOfNewTransitionSegment_(self, v370, (uint64_t)v10, 0, 0);
  }
LABEL_143:
  if (objc_msgSend_maxPassesToFit(v11, v64, v65, v66, v67) >= v389)
    v375 = objc_msgSend_maxPassesToFit(v11, v371, v372, v373, v374);
  else
    v375 = v389;
  objc_msgSend_setMaxPassesToFit_(v11, v371, v375, v373, v374);
  *a5 = a4 - objc_msgSend__sampleDurationOfClipPlaylist_(self, v376, (uint64_t)v10, v377, v378);

  return updated & 1;
}

- (BOOL)_addIntroSegmentsToAssemblyList:(id)a3 forDuration:(int64_t)a4 testingContext:(id)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  void *v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend__segmentsforType_(self, v8, 1, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingComparator_(v11, v12, (uint64_t)&unk_24C5F0910, v13, v14);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v43, (uint64_t)v47, 16);
  if (v17)
  {
    v22 = v17;
    v41 = v11;
    v23 = *(_QWORD *)v44;
    while (2)
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v44 != v23)
          objc_enumerationMutation(v15);
        v25 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        if (objc_msgSend_sampleCount(v25, v18, v19, v20, v21) <= a4)
        {
          objc_msgSend_firstObject(v7, v18, v19, v20, v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_segment(v26, v27, v28, v29, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v31
            || (objc_msgSend_canTransitionFromSegment_toSegment_fromBarIndex_checkIfPrevented_(FlexSegment, v32, (uint64_t)v25, (uint64_t)v31, 0, 1) & 1) != 0)
          {
            v33 = v25;

            if (v33)
            {
              v42 = 0x7FFFFFFFFFFFFFFFLL;
              v38 = objc_msgSend_sampleCount(v33, v34, v35, v36, v37);
              objc_msgSend__addSegment_withDuration_toAssemblyList_indexOfNewSegment_(self, v39, (uint64_t)v33, v38, (uint64_t)v7, &v42);
            }
            goto LABEL_15;
          }

        }
      }
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v43, (uint64_t)v47, 16);
      if (v22)
        continue;
      break;
    }

    v33 = 0;
LABEL_15:
    v11 = v41;
  }
  else
  {

    v33 = 0;
  }

  return 1;
}

- (BOOL)_addOutroSegmentsToAssemblyList:(id)a3 forDuration:(int64_t)a4 allowTrim:(BOOL)a5 testingContext:(id)a6
{
  id v9;
  const char *v10;
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
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  int v33;
  BOOL v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
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
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  id v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  const char *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int64_t v94;
  const char *v95;
  int64_t v96;
  void *v98;
  void *v99;
  _BOOL4 v100;
  id v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _QWORD v110[5];
  _QWORD v111[5];
  id v112;
  _BYTE v113[128];
  _BYTE v114[128];
  uint64_t v115;

  v100 = a5;
  v115 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v101 = a6;
  objc_msgSend__segmentsforType_(self, v10, 4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v13, v14, v15, v16, v17))
  {
    if (objc_msgSend_count(v13, v18, v19, v20, v21) == 1)
    {
      objc_msgSend_firstObject(v13, v22, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v26;
      if (v100 || objc_msgSend_sampleCount(v26, v27, v28, v29, v30) <= a4)
      {
        objc_msgSend_lastObject(v13, v27, v28, v29, v30);
        v32 = (id)objc_claimAutoreleasedReturnValue();
        v33 = 1;
      }
      else
      {
        v32 = 0;
        v33 = 0;
      }

    }
    else
    {
      if (objc_msgSend_count(v9, v22, v23, v24, v25))
      {
        v111[0] = 0;
        v111[1] = v111;
        v111[2] = 0x3032000000;
        v111[3] = sub_20D034F74;
        v111[4] = sub_20D034F84;
        objc_msgSend_lastObject(v9, v35, v36, v37, v38);
        v112 = (id)objc_claimAutoreleasedReturnValue();
        v110[0] = MEMORY[0x24BDAC760];
        v110[1] = 3221225472;
        v110[2] = sub_20D039258;
        v110[3] = &unk_24C5F07B8;
        v110[4] = v111;
        objc_msgSend_indexesOfObjectsPassingTest_(v13, v39, (uint64_t)v110, v40, v41);
        v42 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectsAtIndexes_(v13, v43, v42, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = (void *)v42;
        if (objc_msgSend_count(v46, v47, v48, v49, v50) == 1)
        {
          objc_msgSend_firstObject(v46, v51, v52, v53, v54);
          v32 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v98 = v46;
          objc_msgSend__sortFlexSegmentsShortestToLongest_(self, v51, (uint64_t)v46, v53, v54);
          v108 = 0u;
          v109 = 0u;
          v106 = 0u;
          v107 = 0u;
          v79 = (id)objc_claimAutoreleasedReturnValue();
          v32 = 0;
          v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v79, v80, (uint64_t)&v106, (uint64_t)v114, 16);
          if (v85)
          {
            v86 = *(_QWORD *)v107;
            while (2)
            {
              v87 = 0;
              v88 = v32;
              do
              {
                if (*(_QWORD *)v107 != v86)
                  objc_enumerationMutation(v79);
                v89 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v87);
                if (objc_msgSend_sampleCount(v89, v81, v82, v83, v84) > a4)
                {
                  if (!v100 || v88 && objc_msgSend_sampleCount(v88, v90, v91, v92, v93) >= a4)
                  {
                    v32 = v88;
                  }
                  else
                  {
                    v32 = v89;

                  }
                  goto LABEL_41;
                }
                v32 = v89;

                ++v87;
                v88 = v32;
              }
              while (v85 != v87);
              v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v79, v81, (uint64_t)&v106, (uint64_t)v114, 16);
              if (v85)
                continue;
              break;
            }
          }
LABEL_41:

          v46 = v98;
        }

        _Block_object_dispose(v111, 8);
      }
      else
      {
        objc_msgSend__segmentsforType_(self, v35, 4, v37, v38);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__sortFlexSegmentsShortestToLongest_(self, v60, (uint64_t)v59, v61, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        v104 = 0u;
        v105 = 0u;
        v102 = 0u;
        v103 = 0u;
        v64 = v63;
        v32 = 0;
        v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v65, (uint64_t)&v102, (uint64_t)v113, 16);
        if (v70)
        {
          v71 = *(_QWORD *)v103;
          while (2)
          {
            v72 = 0;
            v73 = v32;
            do
            {
              if (*(_QWORD *)v103 != v71)
                objc_enumerationMutation(v64);
              v74 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * v72);
              if (objc_msgSend_sampleCount(v74, v66, v67, v68, v69) > a4)
              {
                if (!v100 || v73 && objc_msgSend_sampleCount(v73, v75, v76, v77, v78) >= a4)
                {
                  v32 = v73;
                }
                else
                {
                  v32 = v74;

                }
                goto LABEL_39;
              }
              v32 = v74;

              ++v72;
              v73 = v32;
            }
            while (v70 != v72);
            v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v66, (uint64_t)&v102, (uint64_t)v113, 16);
            if (v70)
              continue;
            break;
          }
        }
LABEL_39:

      }
      v33 = 1;
    }
    v34 = v32 != 0;
    if (v33 && v32)
    {
      v94 = objc_msgSend_sampleCount(v32, v55, v56, v57, v58);
      if (v94 >= a4)
        v96 = a4;
      else
        v96 = v94;
      v111[0] = 0x7FFFFFFFFFFFFFFFLL;
      LOBYTE(v33) = objc_msgSend__addSegment_withDuration_toAssemblyList_indexOfNewSegment_(self, v95, (uint64_t)v32, v96, (uint64_t)v9, v111);
      v34 = 1;
    }
  }
  else
  {
    v34 = 0;
    v32 = 0;
    LOBYTE(v33) = 0;
  }

  return v34 & v33;
}

- (BOOL)_rebuildBodySegmentsInAssemblyList:(id)a3 forDuration:(int64_t)a4 unusedDuration:(int64_t *)a5 testingContext:(id)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  char v18;

  v10 = a6;
  v11 = a3;
  objc_msgSend_removeAllObjects(v11, v12, v13, v14, v15);
  v18 = 0;
  LOBYTE(a5) = objc_msgSend__addBodySegmentsForAssemblyList_forDuration_unusedDuration_testingContext_timedOut_(self, v16, (uint64_t)v11, a4, (uint64_t)a5, v10, &v18);

  return (char)a5;
}

- (BOOL)_buildIntroAndOutroOnlySegmentAssemblyList:(id)a3 forDuration:(int64_t)a4 testingContext:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  const char *v16;

  v8 = a3;
  v9 = a5;
  v14 = 0;
  if (objc_msgSend__addOutroSegmentsToAssemblyList_forDuration_allowTrim_testingContext_(self, v10, (uint64_t)v8, a4, 0, v9))
  {
    v15 = objc_msgSend__sampleDurationOfClipPlaylist_(self, v11, (uint64_t)v8, v12, v13);
    v14 = objc_msgSend__addIntroSegmentsToAssemblyList_forDuration_testingContext_(self, v16, (uint64_t)v8, a4 - v15, (uint64_t)v9);
  }

  return v14;
}

+ (int64_t)_findMaxLengthInSamplesToReserveForOutroSegment:(id)a3 withOptions:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
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
  float v29;
  int64_t v30;

  v5 = a3;
  v6 = a4;
  objc_msgSend_objectForKey_(v6, v7, (uint64_t)CFSTR("OutroCanBeShortened"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_BOOLValue(v10, v11, v12, v13, v14);

  if (v15)
  {
    objc_msgSend_objectForKey_(v6, v16, (uint64_t)CFSTR("MaxOutroLengthToReserve"), v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v19;
    if (v19 && (objc_msgSend_floatValue(v19, v20, v21, v22, v23), v29 >= 0.0))
      v30 = (uint64_t)(float)(v29 * (float)objc_msgSend_sampleRate(v5, v25, v26, v27, v28));
    else
      v30 = 0;

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

+ (int64_t)_findMinLengthInSamplesForEarlyFadeOutForOutroSegment:(id)a3 withOptions:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  float v24;

  v5 = a3;
  v6 = a4;
  v11 = objc_msgSend_sampleRate(v5, v7, v8, v9, v10);
  objc_msgSend_objectForKey_(v6, v12, (uint64_t)CFSTR("MinLengthForEarlyFade"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend_floatValue(v15, v16, v17, v18, v19);
    if (v24 > 0.0)
      v11 = (uint64_t)(float)(v24 * (float)objc_msgSend_sampleRate(v5, v20, v21, v22, v23));
  }

  return v11;
}

+ (int64_t)_findEarlyFadeStartOffsetInSamplesForOutroSegment:(id)a3 withOptions:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  float v75;

  v5 = a3;
  v6 = a4;
  objc_msgSend_objectForKey_(v6, v7, (uint64_t)CFSTR("IgnoreEarlyFadeMarker"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_BOOLValue(v10, v11, v12, v13, v14);

  if ((v15 & 1) == 0)
  {
    objc_msgSend_markers(v5, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v20, v21, (uint64_t)CFSTR("OUTRO_EARLY_FADE"), v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v29 = objc_msgSend_integerValue(v24, v25, v26, v27, v28);
      if ((v29 & 0x8000000000000000) == 0)
      {
        v34 = v29;
        if (v29 < objc_msgSend_sampleCount(v5, v30, v31, v32, v33))
          goto LABEL_22;
      }
    }

  }
  objc_msgSend_objectForKey_(v6, v16, (uint64_t)CFSTR("IgnoreStingerMarkerForShortening"), v18, v19);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend_BOOLValue(v35, v36, v37, v38, v39);

  if ((v40 & 1) != 0)
  {
    v45 = 0;
  }
  else
  {
    objc_msgSend_markers(v5, v41, v42, v43, v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v46, v47, (uint64_t)CFSTR("OUTRO_STINGER"), v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v50 || (v55 = objc_msgSend_integerValue(v50, v51, v52, v53, v54), v55 < 0))
    {
      v45 = 0;
    }
    else
    {
      v45 = v55;
      if (v55 >= objc_msgSend_sampleCount(v5, v56, v57, v58, v59))
        v45 = 0;
    }

  }
  v60 = objc_msgSend_sampleRate(v5, v41, v42, v43, v44);
  if (v60 >= 0)
    v64 = v60;
  else
    v64 = v60 + 1;
  v65 = v64 >> 1;
  objc_msgSend_objectForKey_(v6, v61, (uint64_t)CFSTR("DefaultEarlyFadeStartFromStinger"), v62, v63);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v66;
  if (v66)
  {
    objc_msgSend_floatValue(v66, v67, v68, v69, v70);
    if (v75 >= 0.0)
      v65 = (uint64_t)(float)(v75 * (float)objc_msgSend_sampleRate(v5, v71, v72, v73, v74));
  }
  v34 = v65 + v45;
LABEL_22:

  return v34;
}

+ (int64_t)_durationInSamplesToReserveForOutroSegment:(id)a3 withOptions:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  const char *v12;
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
  uint64_t MaxLengthInSamplesToReserveForOutroSegment_withOptions;
  const char *v24;
  uint64_t v25;
  int64_t v26;
  uint64_t EarlyFadeStartOffsetInSamplesForOutroSegment_withOptions;
  const char *v28;
  uint64_t v29;
  uint64_t MinLengthInSamplesForEarlyFadeOutForOutroSegment_withOptions;

  v5 = a3;
  v6 = a4;
  v11 = objc_msgSend_sampleCount(v5, v7, v8, v9, v10);
  objc_msgSend_objectForKey_(v6, v12, (uint64_t)CFSTR("OutroCanBeShortened"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_BOOLValue(v15, v16, v17, v18, v19);

  if (v20)
  {
    MaxLengthInSamplesToReserveForOutroSegment_withOptions = objc_msgSend__findMaxLengthInSamplesToReserveForOutroSegment_withOptions_(FlexSong, v21, (uint64_t)v5, (uint64_t)v6, v22);
    if (v11 >= MaxLengthInSamplesToReserveForOutroSegment_withOptions)
      v26 = MaxLengthInSamplesToReserveForOutroSegment_withOptions;
    else
      v26 = v11;
    if (MaxLengthInSamplesToReserveForOutroSegment_withOptions <= 0)
    {
      EarlyFadeStartOffsetInSamplesForOutroSegment_withOptions = objc_msgSend__findEarlyFadeStartOffsetInSamplesForOutroSegment_withOptions_(FlexSong, v24, (uint64_t)v5, (uint64_t)v6, v25);
      MinLengthInSamplesForEarlyFadeOutForOutroSegment_withOptions = objc_msgSend__findMinLengthInSamplesForEarlyFadeOutForOutroSegment_withOptions_(FlexSong, v28, (uint64_t)v5, (uint64_t)v6, v29);
      if (MinLengthInSamplesForEarlyFadeOutForOutroSegment_withOptions
         + EarlyFadeStartOffsetInSamplesForOutroSegment_withOptions < v11)
        v11 = MinLengthInSamplesForEarlyFadeOutForOutroSegment_withOptions
            + EarlyFadeStartOffsetInSamplesForOutroSegment_withOptions;
    }
    else
    {
      v11 = v26;
    }
  }

  return v11;
}

- (BOOL)_buildSegmentAssemblyList:(id)a3 forDuration:(int64_t)a4 withOptions:(id)a5 testingContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  const char *v31;
  uint64_t v32;
  char v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  BOOL v60;
  uint64_t v61;
  int v62;
  const char *v63;
  BOOL v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  int64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  id v133;
  unsigned int v134;
  uint64_t v135;
  char v136;
  uint64_t v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  uint64_t v142;
  _BYTE v143[128];
  uint64_t v144;

  v144 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = 9600 * (a4 / 9600);
  if (v13 >= objc_msgSend__minOutroDuration(self, v14, v15, v16, v17))
  {
    objc_msgSend_naturalDuration(self, v18, v19, v20, v21);
    if (v142 == a4)
    {
      objc_msgSend__naturalDurationAssemblyList(self, v22, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObjectsFromArray_(v10, v27, (uint64_t)v26, v28, v29);

      goto LABEL_4;
    }
    objc_msgSend_objectForKey_(v11, v22, (uint64_t)CFSTR("OutroCanBeShortened"), v24, v25);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend_BOOLValue(v34, v35, v36, v37, v38);

    v135 = 9600 * (a4 / 9600);
    v134 = v39;
    if (v39)
    {
      v133 = v12;
      objc_msgSend__segmentsforType_(self, v40, 4, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v138 = 0u;
      v139 = 0u;
      v140 = 0u;
      v141 = 0u;
      v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v45, (uint64_t)&v138, (uint64_t)v143, 16);
      if (v46)
      {
        v49 = v46;
        v50 = 0;
        v51 = *(_QWORD *)v139;
        do
        {
          for (i = 0; i != v49; ++i)
          {
            if (*(_QWORD *)v139 != v51)
              objc_enumerationMutation(v44);
            v53 = objc_msgSend__durationInSamplesToReserveForOutroSegment_withOptions_(FlexSong, v47, *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * i), (uint64_t)v11, v48);
            if (v53 > v50)
              v50 = v53;
          }
          v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v47, (uint64_t)&v138, (uint64_t)v143, 16);
        }
        while (v49);
      }
      else
      {
        v50 = 0;
      }

      v12 = v133;
      v13 = 9600 * (a4 / 9600);
    }
    else
    {
      v50 = objc_msgSend__maxOutroDuration(self, v40, v41, v42, v43);
    }
    v57 = v13 - v50;
    v137 = 0;
    v136 = 0;
    if (v13 - v50 < 1)
    {
      v59 = 0;
      v60 = 0;
      v58 = 0;
    }
    else
    {
      v58 = objc_msgSend__addBodySegmentsForAssemblyList_forDuration_unusedDuration_testingContext_timedOut_(self, v54, (uint64_t)v10, v57, (uint64_t)&v137, v12, &v136);
      v59 = v137;
      v60 = v136 != 0;
    }
    if (v60 || v59 > 192000)
    {
      v61 = -v50 - 48000 + v135;
      v62 = 6;
      do
      {
        objc_msgSend_removeAllObjects(v10, v54, v55, v57, v56);
        v58 = objc_msgSend__addBodySegmentsForAssemblyList_forDuration_unusedDuration_testingContext_timedOut_(self, v63, (uint64_t)v10, v61, (uint64_t)&v137, v12, &v136);
        if (!--v62)
          break;
        v61 -= 48000;
        v64 = !v136 && v137 <= 192000;
      }
      while (!v64);
    }
    if (objc_msgSend_count(v10, v54, v55, v57, v56))
    {
      if (!v58)
        goto LABEL_36;
      v68 = objc_msgSend__sampleDurationOfClipPlaylist_(self, v65, (uint64_t)v10, v66, v67);
      if ((objc_msgSend__addOutroSegmentsToAssemblyList_forDuration_allowTrim_testingContext_(self, v69, (uint64_t)v10, v135 - v68, v134, v12) & 1) == 0)goto LABEL_36;
      v73 = objc_msgSend__sampleDurationOfClipPlaylist_(self, v70, (uint64_t)v10, v71, v72);
      if (!objc_msgSend__addIntroSegmentsToAssemblyList_forDuration_testingContext_(self, v74, (uint64_t)v10, v135 - v73, (uint64_t)v12))goto LABEL_36;
    }
    else if ((objc_msgSend__buildIntroAndOutroOnlySegmentAssemblyList_forDuration_testingContext_(self, v65, (uint64_t)v10, v135, (uint64_t)v12) & 1) == 0)
    {
LABEL_36:
      v33 = 0;
      goto LABEL_47;
    }
    v78 = objc_msgSend__sampleDurationOfClipPlaylist_(self, v75, (uint64_t)v10, v76, v77);
    v64 = a4 <= v78;
    v32 = a4 - v78;
    if (!v64)
    {
      if (!v134)
        goto LABEL_5;
      objc_msgSend_outroInfoForClipPlaylist_(FlexSong, v31, (uint64_t)v10, v79, v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = v81;
      if (!v81)
        goto LABEL_48;
      v87 = objc_msgSend_offset(v81, v82, v83, v84, v85);
      v92 = v12;
      v93 = objc_msgSend_duration(v86, v88, v89, v90, v91) + v87;
      objc_msgSend_segment(v86, v94, v95, v96, v97);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = objc_msgSend_sampleCount(v98, v99, v100, v101, v102);

      v64 = v93 < v103;
      v12 = v92;
      if (!v64)
      {
LABEL_48:

        goto LABEL_5;
      }
      objc_msgSend_segment(v86, v104, v105, v106, v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = objc_msgSend_sampleCount(v108, v109, v110, v111, v112);
      v118 = objc_msgSend_offset(v86, v114, v115, v116, v117);
      v123 = v113 - (v118 + objc_msgSend_duration(v86, v119, v120, v121, v122));

      if (v123 >= v32)
        v123 = v32;
      v128 = objc_msgSend_duration(v86, v124, v125, v126, v127);
      objc_msgSend_setDuration_(v86, v129, v128 + v123, v130, v131);
      v32 -= v123;
      v12 = v92;

      if (v32 >= 1)
        goto LABEL_5;
    }
LABEL_46:
    v33 = 1;
    goto LABEL_47;
  }
LABEL_4:
  v30 = objc_msgSend__sampleDurationOfClipPlaylist_(self, v18, (uint64_t)v10, v20, v21);
  v64 = a4 <= v30;
  v32 = a4 - v30;
  if (v64)
    goto LABEL_46;
LABEL_5:
  v137 = 0x7FFFFFFFFFFFFFFFLL;
  v33 = objc_msgSend__addSegment_withDuration_toAssemblyList_indexOfNewSegment_(self, v31, 0, v32, (uint64_t)v10, &v137);
LABEL_47:

  return v33;
}

- (id)_fullSongLoopedClipPlaylistForDuration:(id *)a3 withOptions:(id)a4 testingContext:(id)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int32_t v16;
  CMTimeValue value;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  double v26;
  int v27;
  double v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  int32_t v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  int32_t v63;
  const char *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  int64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int32_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  int64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  int32_t v107;
  const char *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  void *v128;
  CMTimeValue v129;
  void *v130;
  id v131;
  CMTime v132;
  CMTime v133;
  CMTime v134;
  CMTime v135;
  CMTime time;
  CMTime v137;
  _QWORD v138[2];
  _QWORD v139[4];

  v139[2] = *MEMORY[0x24BDAC8D0];
  v131 = a4;
  v8 = a5;
  objc_msgSend_setSequencingLongSong_(v8, v9, 1, v10, v11);
  v16 = objc_msgSend_sampleRate(self, v12, v13, v14, v15);
  time = *(CMTime *)a3;
  CMTimeConvertScale(&v137, &time, v16, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  value = v137.value;
  v18 = (void *)objc_opt_new();
  v19 = (void *)objc_opt_new();
  v20 = (void *)objc_opt_new();
  memset(&time, 0, sizeof(time));
  objc_msgSend_naturalDuration(self, v21, v22, v23, v24);
  v129 = value;
  v25 = time.value;
  v26 = (double)value / (double)time.value;
  v27 = vcvtmd_s64_f64(v26);
  v28 = (v26 - (double)v27) * 1.5;
  v138[0] = CFSTR("IgnoreStingerMarkerForShortening");
  v138[1] = CFSTR("IgnoreEarlyFadeMarker");
  v139[0] = MEMORY[0x24BDBD1C8];
  v139[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v29, (uint64_t)v139, (uint64_t)v138, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v130 = v20;
  if (v27 >= 2)
  {
    v128 = v18;
    v35 = 0;
    v36 = v27 - 1;
    do
    {
      v37 = v35;
      v42 = v34;
      if (v36 == 1 && v28 < 0.25)
      {
        v43 = v131;

        v42 = v43;
      }
      v44 = objc_msgSend_sampleRate(self, v38, v39, v40, v41, v128);
      CMTimeMake(&v135, v25, v44);
      objc_msgSend__clipPlaylistForDuration_withOptions_testingContext_(self, v45, (uint64_t)&v135, (uint64_t)v42, (uint64_t)v8);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_addObjectsFromArray_(v19, v46, (uint64_t)v35, v47, v48);
      --v36;
    }
    while (v36);
    objc_msgSend_indexesOfObjectsPassingTest_(v19, v49, (uint64_t)&unk_24C5F0930, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectsAtIndexes_(v19, v53, (uint64_t)v52, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectsAtIndexes_(v19, v57, (uint64_t)v52, v58, v59);
    objc_msgSend__sampleDurationOfClipPlaylist_(self, v60, (uint64_t)v56, v61, v62);

    v18 = v128;
    v20 = v130;
  }
  if (v28 < 0.25)
  {
    v102 = v129 - objc_msgSend__sampleDurationOfClipPlaylist_(self, v30, (uint64_t)v19, v32, v33);
    v107 = objc_msgSend_sampleRate(self, v103, v104, v105, v106);
    CMTimeMake(&v134, v102, v107);
    objc_msgSend__clipPlaylistForDuration_withOptions_testingContext_(self, v108, (uint64_t)&v134, (uint64_t)v34, (uint64_t)v8);
    v101 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_addObjectsFromArray_(v20, v109, (uint64_t)v101, v110, v111);
    objc_msgSend_indexesOfObjectsPassingTest_(v20, v112, (uint64_t)&unk_24C5F0950, v113, v114);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectsAtIndexes_(v20, v115, (uint64_t)v72, v116, v117);
    v97 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectsAtIndexes_(v20, v118, (uint64_t)v72, v119, v120);
    objc_msgSend_addObjectsFromArray_(v18, v121, (uint64_t)v20, v122, v123);
    objc_msgSend_addObjectsFromArray_(v18, v124, (uint64_t)v19, v125, v126);
    v76 = (void *)v97;
    v95 = v131;
  }
  else
  {
    v63 = objc_msgSend_sampleRate(self, v30, v31, v32, v33);
    CMTimeMake(&v133, v25, v63);
    objc_msgSend__clipPlaylistForDuration_withOptions_testingContext_(self, v64, (uint64_t)&v133, (uint64_t)v34, (uint64_t)v8);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_addObjectsFromArray_(v18, v66, (uint64_t)v65, v67, v68);
    objc_msgSend_indexesOfObjectsPassingTest_(v18, v69, (uint64_t)&unk_24C5F0970, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectsAtIndexes_(v18, v73, (uint64_t)v72, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectsAtIndexes_(v18, v77, (uint64_t)v72, v78, v79);
    objc_msgSend__sampleDurationOfClipPlaylist_(self, v80, (uint64_t)v76, v81, v82);
    objc_msgSend_addObjectsFromArray_(v18, v83, (uint64_t)v19, v84, v85);
    v89 = v129 - objc_msgSend__sampleDurationOfClipPlaylist_(self, v86, (uint64_t)v18, v87, v88);
    v94 = objc_msgSend_sampleRate(self, v90, v91, v92, v93);
    CMTimeMake(&v132, v89, v94);
    v95 = v131;
    objc_msgSend__clipPlaylistForDuration_withOptions_testingContext_(self, v96, (uint64_t)&v132, (uint64_t)v131, (uint64_t)v8);
    v97 = objc_claimAutoreleasedReturnValue();

    v20 = v130;
    v101 = (void *)v97;
  }
  objc_msgSend_addObjectsFromArray_(v18, v98, v97, v99, v100);

  return v18;
}

- (id)renditionForDuration:(id *)a3 withOptions:(id)a4 testingContext:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  Float64 Seconds;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
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
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  id v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unsigned int v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  void *v81;
  FlexLegacySongRendition *v82;
  const char *v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v90;
  id v91;
  void *v92;
  FlexSong *v93;
  CMTime time2;
  CMTime time1;
  CMTime v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  CMTime time;
  uint64_t v103;

  v103 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  FlexLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    time = (CMTime)*a3;
    Seconds = CMTimeGetSeconds(&time);
    LODWORD(time.value) = 134217984;
    *(Float64 *)((char *)&time.value + 4) = Seconds;
    _os_log_impl(&dword_20D016000, v10, OS_LOG_TYPE_DEFAULT, "flex: Requesting legacy format rendition for duration %.2f", (uint8_t *)&time, 0xCu);
  }

  v12 = v8;
  objc_msgSend_customOptions(self, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v12;
  if (v17)
  {
    v90 = a3;
    v91 = v9;
    v92 = (void *)objc_msgSend_mutableCopy(v12, v18, v19, v20, v21);
    v93 = self;
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    objc_msgSend_customOptions(self, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v27, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v97, (uint64_t)v101, 16);
    if (v34)
    {
      v38 = v34;
      v39 = *(_QWORD *)v98;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v98 != v39)
            objc_enumerationMutation(v32);
          if (objc_msgSend_isEqualToString_(*(void **)(*((_QWORD *)&v97 + 1) + 8 * i), v35, (uint64_t)CFSTR("OutroCanBeShortened"), v36, v37))
          {
            objc_msgSend_objectForKeyedSubscript_(v12, v35, (uint64_t)CFSTR("OutroCanBeShortened"), v36, v37);
            v41 = v12;
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend_BOOLValue(v42, v43, v44, v45, v46);

            objc_msgSend_customOptions(v93, v48, v49, v50, v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v52, v53, (uint64_t)CFSTR("OutroCanBeShortened"), v54, v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = objc_msgSend_BOOLValue(v56, v57, v58, v59, v60);

            v12 = v41;
            objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v62, v47 & v61, v63, v64);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v92, v66, (uint64_t)v65, (uint64_t)CFSTR("OutroCanBeShortened"), v67);

          }
        }
        v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v97, (uint64_t)v101, 16);
      }
      while (v38);
    }

    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCE70], v68, (uint64_t)v92, v69, v70);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    a3 = v90;
    v9 = v91;
    self = v93;
  }
  memset(&time, 0, sizeof(time));
  objc_msgSend_naturalDuration(self, v18, v19, v20, v21);
  CMTimeMultiplyByFloat64(&time, &v96, 1.5);
  time1 = (CMTime)*a3;
  time2 = time;
  if (CMTimeCompare(&time1, &time2) < 0
    || (objc_msgSend_objectForKeyedSubscript_(v22, v71, (uint64_t)CFSTR("LoopSongForLongDurations"), v72, v73),
        v74 = (void *)objc_claimAutoreleasedReturnValue(),
        v79 = objc_msgSend_BOOLValue(v74, v75, v76, v77, v78),
        v74,
        !v79))
  {
    time1 = (CMTime)*a3;
    objc_msgSend__clipPlaylistForDuration_withOptions_testingContext_(self, v71, (uint64_t)&time1, (uint64_t)v22, (uint64_t)v9);
    v80 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    time1 = (CMTime)*a3;
    objc_msgSend__fullSongLoopedClipPlaylistForDuration_withOptions_testingContext_(self, v71, (uint64_t)&time1, (uint64_t)v22, (uint64_t)v9);
    v80 = objc_claimAutoreleasedReturnValue();
  }
  v81 = (void *)v80;
  if (v80)
  {
    v82 = [FlexLegacySongRendition alloc];
    v84 = (void *)objc_msgSend_initWithSong_segments_withOptions_(v82, v83, (uint64_t)self, (uint64_t)v81, (uint64_t)v22);
    objc_msgSend__destroyCache(self, v85, v86, v87, v88);
  }
  else
  {
    v84 = 0;
  }

  return v84;
}

- (id)_clipPlaylistForDuration:(id *)a3 withOptions:(id)a4 testingContext:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int32_t v19;
  const char *v20;
  CMTime v22;
  CMTime time2;
  CMTime time1;

  v8 = a4;
  v9 = a5;
  if ((a3->var2 & 1) != 0
    && (time1 = (CMTime)*a3, time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88], CMTimeCompare(&time1, &time2)))
  {
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_sampleRate(self, v15, v16, v17, v18);
    time1 = (CMTime)*a3;
    CMTimeConvertScale(&v22, &time1, v19, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    objc_msgSend__buildSegmentAssemblyList_forDuration_withOptions_testingContext_(self, v20, (uint64_t)v14, v22.value, (uint64_t)v8, v9);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)_validateStructureForRendition:(id)a3 failureReason:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
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
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  char v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  _BOOL4 v171;
  _BOOL4 v172;
  int v173;
  uint64_t v174;
  uint64_t v175;
  __CFString *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  __CFString *v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  void *v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  const __CFString *v233;
  uint64_t v235;
  const __CFString *v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  void *v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  void *v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  void *v266;
  const char *v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  void *v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  void *v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  void *v290;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  void *v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  void *v305;
  const char *v306;
  uint64_t v307;
  uint64_t v308;
  void *v309;
  const char *v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  int v314;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  int64_t v319;
  uint64_t v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  void *v329;
  const char *v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  void *v334;
  const char *v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  const char *v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  const char *v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  const char *v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  void *v352;
  const char *v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  const char *v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  void *v367;
  const char *v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  void *v372;
  const char *v373;
  uint64_t v374;
  uint64_t v375;
  const char *v376;
  uint64_t v377;
  uint64_t v378;
  void *v379;
  FlexSong *v380;
  _BOOL4 v381;
  id *v382;
  void *v383;
  id obj;
  CMTime time2;
  CMTime time1;
  CMTime time;
  CMTime v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  __int128 v393;
  __int128 v394;
  __int128 v395;
  __int128 v396;
  _QWORD v397[5];
  __int128 v398;
  __int128 v399;
  __int128 v400;
  __int128 v401;
  uint64_t v402;
  _BYTE v403[128];
  _BYTE v404[128];
  _BYTE v405[128];
  uint64_t v406;

  v406 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend_segments(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v381 = v16 != 0;

  if (!v16)
    *a4 = CFSTR("empty playlist!");
  v382 = a4;
  v21 = objc_msgSend_duration(v6, v17, v18, v19, v20);
  objc_msgSend_naturalDuration(self, v22, v23, v24, v25);
  v383 = v6;
  v380 = self;
  if (v21 == v402)
  {
    v379 = v16;
    v26 = (void *)objc_opt_new();
    objc_msgSend__segmentsforType_(self, v27, 2, v28, v29);
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v26, v30, (uint64_t)obj, v31, v32);
    v400 = 0u;
    v401 = 0u;
    v398 = 0u;
    v399 = 0u;
    objc_msgSend__naturalDurationAssemblyList(self, v33, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v398, (uint64_t)v405, 16);
    if (v39)
    {
      v44 = v39;
      v45 = *(_QWORD *)v399;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v399 != v45)
            objc_enumerationMutation(v37);
          v47 = *(void **)(*((_QWORD *)&v398 + 1) + 8 * i);
          objc_msgSend_segment(v47, v40, v41, v42, v43);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend_type(v48, v49, v50, v51, v52);

          if (v53 == 2)
          {
            v397[0] = MEMORY[0x24BDAC760];
            v397[1] = 3221225472;
            v397[2] = sub_20D03B368;
            v397[3] = &unk_24C5F08F0;
            v397[4] = v47;
            v54 = objc_msgSend_indexOfObjectPassingTest_(v26, v40, (uint64_t)v397, v42, v43);
            if (v54 == 0x7FFFFFFFFFFFFFFFLL)
            {

LABEL_41:
              v142 = 0;
              v141 = v383;
              *v382 = CFSTR("invalid default duration playlist. there's a bug in the sequencer");
              goto LABEL_83;
            }
            objc_msgSend_removeObjectAtIndex_(v26, v55, v54, v56, v57);
          }
        }
        v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v40, (uint64_t)&v398, (uint64_t)v405, 16);
      }
      while (v44);
    }

    if (!v379 || objc_msgSend_count(v26, v58, v59, v60, v61))
      goto LABEL_41;

  }
  v26 = (void *)objc_opt_new();
  v393 = 0u;
  v394 = 0u;
  v395 = 0u;
  v396 = 0u;
  objc_msgSend_segments(v6, v62, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v67, (uint64_t)&v393, (uint64_t)v404, 16);
  if (!v68)
    goto LABEL_34;
  v73 = v68;
  v74 = *(_QWORD *)v394;
  do
  {
    v75 = 0;
    do
    {
      if (*(_QWORD *)v394 != v74)
        objc_enumerationMutation(v66);
      v76 = *(void **)(*((_QWORD *)&v393 + 1) + 8 * v75);
      objc_msgSend_segment(v76, v69, v70, v71, v72);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_type(v77, v78, v79, v80, v81) == 1)
        goto LABEL_27;
      objc_msgSend_segment(v76, v82, v83, v84, v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_type(v86, v87, v88, v89, v90) == 2)
        goto LABEL_26;
      objc_msgSend_segment(v76, v91, v92, v93, v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_type(v95, v96, v97, v98, v99) == 4)
      {

LABEL_26:
LABEL_27:

LABEL_28:
        objc_msgSend_addObject_(v26, v69, (uint64_t)v76, v71, v72);
        goto LABEL_29;
      }
      objc_msgSend_segment(v76, v100, v101, v102, v103);
      v104 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v104)
        goto LABEL_28;
LABEL_29:
      ++v75;
    }
    while (v73 != v75);
    v105 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v69, (uint64_t)&v393, (uint64_t)v404, 16);
    v73 = v105;
  }
  while (v105);
LABEL_34:

  if (objc_msgSend_count(v26, v106, v107, v108, v109) == 1)
  {
    objc_msgSend_lastObject(v26, v110, v111, v112, v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_segment(v114, v115, v116, v117, v118);
    v119 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v119)
    {
      objc_msgSend_lastObject(v26, v110, v111, v112, v113);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      v148 = objc_msgSend_duration(v143, v144, v145, v146, v147);
      if (v148 > objc_msgSend__minOutroDuration(v380, v149, v150, v151, v152))
      {
        v157 = (void *)MEMORY[0x24BDD17C8];
        v158 = objc_msgSend_sampleRate(v380, v153, v154, v155, v156);
        objc_msgSend_stringWithFormat_(v157, v159, (uint64_t)CFSTR("excessive silence: %fs - check allowed transitions, priorities and which segments are sliceable."), v160, v161, (float)((float)v148 / (float)v158));
        v381 = 0;
        *v382 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_45;
    }
  }
  if (objc_msgSend_count(v26, v110, v111, v112, v113) != 1
    || (objc_msgSend_lastObject(v26, v120, v121, v122, v123),
        v124 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_segment(v124, v125, v126, v127, v128),
        v129 = (void *)objc_claimAutoreleasedReturnValue(),
        v129,
        v124,
        !v129))
  {
LABEL_45:
    v141 = v383;
    goto LABEL_46;
  }
  objc_msgSend_lastObject(v26, v120, v121, v122, v123);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_segment(v130, v131, v132, v133, v134);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = objc_msgSend_type(v135, v136, v137, v138, v139);

  v141 = v383;
  if (v140 == 4)
  {
    v142 = 1;
    goto LABEL_84;
  }
LABEL_46:
  v391 = 0u;
  v392 = 0u;
  v389 = 0u;
  v390 = 0u;
  objc_msgSend_segments(v141, v120, v121, v122, v123);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v163 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v162, (uint64_t)&v389, (uint64_t)v403, 16);
  if (!v163)
  {
    v169 = 0;
    v170 = 0;
    v171 = 0;
    v172 = 0;
    v173 = 0;
    goto LABEL_66;
  }
  v168 = v163;
  v169 = 0;
  v170 = 0;
  v171 = 0;
  v172 = 0;
  v173 = 0;
  v174 = *(_QWORD *)v390;
  while (2)
  {
    v175 = 0;
    while (2)
    {
      if (*(_QWORD *)v390 != v174)
        objc_enumerationMutation(obj);
      objc_msgSend_segment(*(void **)(*((_QWORD *)&v389 + 1) + 8 * v175), v164, v165, v166, v167);
      v176 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_type(v176, v177, v178, v179, v180) == 1)
      {
        v171 = v169 == 0;
        if ((objc_msgSend_sliceable(v176, v181, v182, v183, v184) & 1) == 0)
        {
          ++v169;
          goto LABEL_62;
        }
        v233 = CFSTR("Intro Segments cannot be marked as sliceable");
LABEL_80:
        v142 = 0;
        *v382 = (id)v233;
        goto LABEL_81;
      }
      if (objc_msgSend_type(v176, v181, v182, v183, v184) == 4)
      {
        v172 = v170 == 0;
        if ((objc_msgSend_sliceable(v176, v185, v186, v187, v188) & 1) != 0)
        {
          v233 = CFSTR("Outro Segments cannot be marked as sliceable");
          goto LABEL_80;
        }
        ++v170;
      }
      else if (objc_msgSend_type(v176, v185, v186, v187, v188) == 3)
      {
        if ((objc_msgSend_sliceable(v176, v189, v190, v191, v192) & 1) != 0)
        {
          v233 = CFSTR("Transitions cannot be marked as sliceable");
          goto LABEL_80;
        }
      }
      else if (objc_msgSend_type(v176, v189, v190, v191, v192) == 2)
      {
        objc_msgSend_sliceable(v176, v193, v194, v195, v196);
        v173 = 1;
      }
LABEL_62:

      if (v168 != ++v175)
        continue;
      break;
    }
    v168 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v164, (uint64_t)&v389, (uint64_t)v403, 16);
    if (v168)
      continue;
    break;
  }
LABEL_66:

  if (!v381)
  {
    v142 = 0;
    v141 = v383;
    goto LABEL_84;
  }
  v141 = v383;
  v201 = objc_msgSend_duration(v383, v197, v198, v199, v200);
  objc_msgSend_lastObject(v26, v202, v203, v204, v205);
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_segment(obj, v206, v207, v208, v209);
  v210 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v210)
    v201 -= objc_msgSend_duration(obj, v211, v212, v213, v214);
  if (v201 < objc_msgSend__minOutroDuration(v380, v211, v212, v213, v214))
  {
    if (v171)
    {
      objc_msgSend_stringByAppendingString_(&stru_24C5F0F80, v215, (uint64_t)CFSTR("intro added when we should have silence\n"), v217, v218);
      v219 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_87;
    }
    if (((v172 | v173) & 1) != 0)
    {
      v219 = &stru_24C5F0F80;
LABEL_87:
      if (v172)
      {
        objc_msgSend_stringByAppendingString_(v219, v215, (uint64_t)CFSTR("outro added when we should have silence\n"), v217, v218);
        v235 = objc_claimAutoreleasedReturnValue();

        v219 = (__CFString *)v235;
      }
      if ((v173 & 1) != 0)
      {
        objc_msgSend_stringByAppendingString_(v219, v215, (uint64_t)CFSTR("body added when we should have silence\n"), v217, v218);
        v236 = (const __CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_103;
      }
    }
    else
    {
      objc_msgSend_firstObject(v26, v215, v216, v217, v218);
      v219 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_segment(v219, v281, v282, v283, v284);
      v285 = (void *)objc_claimAutoreleasedReturnValue();
      if (v285)
      {

        v236 = &stru_24C5F0F80;
LABEL_103:

        v219 = (__CFString *)v236;
      }
      else
      {
        v358 = objc_msgSend_count(v26, v286, v287, v288, v289);

        if (v358 == 1)
        {
          v142 = 1;
          goto LABEL_83;
        }
        v219 = &stru_24C5F0F80;
      }
    }
    objc_msgSend_firstObject(v26, v215, v216, v217, v218);
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_segment(v290, v291, v292, v293, v294);
    v295 = (void *)objc_claimAutoreleasedReturnValue();

    if (v295)
    {
      objc_msgSend_stringByAppendingString_(v219, v296, (uint64_t)CFSTR("unexpected first object - should be nil segment\n"), v298, v299);
      v300 = objc_claimAutoreleasedReturnValue();

      v219 = (__CFString *)v300;
    }
    if (objc_msgSend_count(v26, v296, v297, v298, v299) != 1)
    {
      objc_msgSend_stringByAppendingString_(v219, v301, (uint64_t)CFSTR("too many playlist items - there's a bug in the playback sequencing algorithm \n"), v302, v303);
      goto LABEL_108;
    }
LABEL_109:
    v176 = objc_retainAutorelease(v219);
    v142 = 0;
    *v382 = v176;
    goto LABEL_82;
  }
  if (objc_msgSend_count(v26, v215, v216, v217, v218) == 2)
  {
    objc_msgSend_lastObject(v26, v220, v221, v222, v223);
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_segment(v224, v225, v226, v227, v228);
    v229 = (void *)objc_claimAutoreleasedReturnValue();

    if (v229)
    {
      v142 = (v173 | v171) & v172;
      if ((v142 & 1) == 0)
      {
        if (v171)
        {
          v219 = &stru_24C5F0F80;
        }
        else
        {
          objc_msgSend_stringByAppendingString_(&stru_24C5F0F80, v230, (uint64_t)CFSTR("intro expected but not found\n"), v231, v232);
          v219 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        if (!v172)
        {
          objc_msgSend_stringByAppendingString_(v219, v230, (uint64_t)CFSTR("outro expected but not found\n"), v231, v232);
          v359 = objc_claimAutoreleasedReturnValue();

          v219 = (__CFString *)v359;
        }
        if ((v173 & 1) == 0)
          goto LABEL_109;
        objc_msgSend_stringByAppendingString_(v219, v230, (uint64_t)CFSTR("body added when we should have only intro and outro segments\n"), v231, v232);
LABEL_108:
        v304 = objc_claimAutoreleasedReturnValue();

        v219 = (__CFString *)v304;
        goto LABEL_109;
      }
    }
    else
    {
      v142 = v172 & (v173 ^ 1);
      if ((v142 & 1) == 0)
      {
        if (v172)
        {
          v219 = &stru_24C5F0F80;
        }
        else
        {
          objc_msgSend_stringByAppendingString_(&stru_24C5F0F80, v230, (uint64_t)CFSTR("outro expected but not found\n"), v231, v232);
          v219 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        if ((v173 & 1) == 0)
          goto LABEL_109;
        objc_msgSend_stringByAppendingString_(v219, v230, (uint64_t)CFSTR("body added when we should have only outro and silent segments\n"), v231, v232);
        goto LABEL_108;
      }
    }
LABEL_132:
    v176 = &stru_24C5F0F80;
    goto LABEL_82;
  }
  if (objc_msgSend_count(v26, v220, v221, v222, v223) == 3)
  {
    if (((v173 | v171) & v172 & 1) != 0)
    {
      v241 = objc_msgSend_count(v26, v237, v238, v239, v240);
      if (v241 - 1 >= 1)
      {
        v245 = v241;
        v176 = &stru_24C5F0F80;
        v142 = 1;
        while (1)
        {
          objc_msgSend_objectAtIndexedSubscript_(v26, v242, --v245, v243, v244);
          v246 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_segment(v246, v247, v248, v249, v250);
          v251 = (void *)objc_claimAutoreleasedReturnValue();

          if (v251)
          {
            objc_msgSend_segment(v246, v252, v253, v254, v255);
            v256 = (void *)objc_claimAutoreleasedReturnValue();
            v261 = objc_msgSend_type(v256, v257, v258, v259, v260);

            if (v261 == 4)
              goto LABEL_162;
            objc_msgSend_segment(v246, v262, v263, v264, v265);
            v266 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_type(v266, v267, v268, v269, v270) == 2)
              goto LABEL_163;
            objc_msgSend_segment(v246, v271, v272, v273, v274);
            v275 = (void *)objc_claimAutoreleasedReturnValue();
            v280 = objc_msgSend_type(v275, v276, v277, v278, v279);

            if (v280 == 1)
              goto LABEL_164;
          }

          if (v245 <= 1)
            goto LABEL_81;
        }
      }
      goto LABEL_131;
    }
    if (v171)
    {
      v219 = &stru_24C5F0F80;
    }
    else
    {
      objc_msgSend_stringByAppendingString_(&stru_24C5F0F80, v237, (uint64_t)CFSTR("intro expected but not found\n"), v239, v240);
      v219 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (!v172)
    {
      objc_msgSend_stringByAppendingString_(v219, v237, (uint64_t)CFSTR("outro expected but not found\n"), v239, v240);
      v361 = objc_claimAutoreleasedReturnValue();

      v219 = (__CFString *)v361;
    }
    if ((v173 & 1) != 0)
    {
      objc_msgSend_stringByAppendingString_(v219, v237, (uint64_t)CFSTR("body added when we should have only intro and outro segments\n"), v239, v240);
LABEL_154:
      v362 = objc_claimAutoreleasedReturnValue();

      v219 = (__CFString *)v362;
    }
    goto LABEL_155;
  }
  objc_msgSend_options(v383, v237, v238, v239, v240);
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v305, v306, (uint64_t)CFSTR("LoopSongForLongDurations"), v307, v308);
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  v314 = objc_msgSend_BOOLValue(v309, v310, v311, v312, v313);

  if (v314)
  {
    memset(&v388, 0, sizeof(v388));
    objc_msgSend_naturalDuration(v380, v237, v238, v239, v240);
    CMTimeMultiplyByFloat64(&v388, &time, 1.5);
    v319 = objc_msgSend_duration(v383, v315, v316, v317, v318);
    CMTimeMake(&time1, v319, 48000);
    time2 = v388;
    v141 = v383;
    if (CMTimeCompare(&time1, &time2) < 0 && (v172 & v173 & 1) == 0)
    {
LABEL_113:
      if (v171)
      {
        v219 = &stru_24C5F0F80;
      }
      else
      {
        if (v169)
          objc_msgSend_stringByAppendingString_(&stru_24C5F0F80, v237, (uint64_t)CFSTR("Too many intros added\n"), v239, v240);
        else
          objc_msgSend_stringByAppendingString_(&stru_24C5F0F80, v237, (uint64_t)CFSTR("No intro segments\n"), v239, v240);
        v219 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      if (!v172)
      {
        if (v170)
          objc_msgSend_stringByAppendingString_(v219, v237, (uint64_t)CFSTR("Too many outros added\n"), v239, v240);
        else
          objc_msgSend_stringByAppendingString_(v219, v237, (uint64_t)CFSTR("No outro segments\n"), v239, v240);
        v360 = objc_claimAutoreleasedReturnValue();

        v219 = (__CFString *)v360;
      }
      if ((v173 & 1) == 0)
      {
        objc_msgSend_stringByAppendingString_(v219, v237, (uint64_t)CFSTR("expected a body segment\n"), v239, v240);
        goto LABEL_154;
      }
LABEL_155:
      if (objc_msgSend_count(v26, v237, v238, v239, v240) != 1)
        goto LABEL_109;
      objc_msgSend_firstObject(v26, v363, v364, v365, v366);
      v367 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_segment(v367, v368, v369, v370, v371);
      v372 = (void *)objc_claimAutoreleasedReturnValue();

      if (v372)
        goto LABEL_109;
      objc_msgSend_stringByAppendingString_(v219, v373, (uint64_t)CFSTR("There is a bug in the smart song or playback sequencing algorithm!\n"), v374, v375);
      goto LABEL_108;
    }
  }
  else
  {
    v141 = v383;
    if ((v172 & v173 & 1) == 0)
      goto LABEL_113;
  }
  v320 = objc_msgSend_count(v26, v237, v238, v239, v240);
  if (v320 - 1 < 1)
  {
LABEL_131:
    v142 = 1;
    goto LABEL_132;
  }
  v324 = v320;
  v176 = &stru_24C5F0F80;
  v142 = 1;
  while (2)
  {
    objc_msgSend_objectAtIndexedSubscript_(v26, v321, --v324, v322, v323);
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_segment(v246, v325, v326, v327, v328);
    v329 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v329)
    {
LABEL_127:

      if (v324 <= 1)
        goto LABEL_81;
      continue;
    }
    break;
  }
  objc_msgSend_segment(v246, v330, v331, v332, v333);
  v334 = (void *)objc_claimAutoreleasedReturnValue();
  v339 = objc_msgSend_type(v334, v335, v336, v337, v338);

  if (v339 == 4)
  {
LABEL_162:

    v142 = 1;
    v176 = &stru_24C5F0F80;
    goto LABEL_81;
  }
  objc_msgSend_segment(v246, v340, v341, v342, v343);
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_type(v266, v344, v345, v346, v347) != 2)
  {
    objc_msgSend_segment(v246, v348, v349, v350, v351);
    v352 = (void *)objc_claimAutoreleasedReturnValue();
    v357 = objc_msgSend_type(v352, v353, v354, v355, v356);

    if (v357 == 1)
      goto LABEL_164;
    goto LABEL_127;
  }
LABEL_163:

LABEL_164:
  v176 = &stru_24C5F0F80;
  objc_msgSend_stringByAppendingString_(&stru_24C5F0F80, v376, (uint64_t)CFSTR("Outro segment is not after all Intro & Body segments"), v377, v378);
  v142 = 0;
  *v382 = (id)objc_claimAutoreleasedReturnValue();
LABEL_81:
  v141 = v383;
LABEL_82:

LABEL_83:
LABEL_84:

  return v142 & 1;
}

+ (id)outroInfoForClipPlaylist:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_20D034F74;
  v13 = sub_20D034F84;
  v14 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_20D03B4AC;
  v8[3] = &unk_24C5F0998;
  v8[4] = &v9;
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v3, v4, 2, (uint64_t)v8, v5);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (BOOL)_validateTransitionsInRendition:(id)a3 failureReason:(id *)a4
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
  unint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
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
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  int v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  int isEqualToString;
  uint64_t v182;
  void *v183;
  void *v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  int v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  int v207;
  void *v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  int v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  void *v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  void *v227;
  id v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  void *v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  void *v250;
  id v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  void *v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  void *v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  void *v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  void *v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  void *v279;
  uint64_t v280;
  void *v281;
  const char *v282;
  uint64_t v283;
  uint64_t v284;
  const char *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  void *v289;
  const char *v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  void *v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  void *v305;
  const char *v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  void *v310;
  const char *v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  void *v315;
  const char *v316;
  uint64_t v317;
  uint64_t v318;
  char v319;
  const char *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  void *v324;
  void *v325;
  const char *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  void *v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  const char *v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  const char *v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  void *v342;
  const char *v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  void *v347;
  const char *v348;
  uint64_t v349;
  uint64_t v350;
  int v351;
  const char *v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  const char *v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  void *v360;
  const char *v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  void *v365;
  const char *v366;
  uint64_t v367;
  uint64_t v368;
  const char *v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  const char *v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  const char *v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  void *v381;
  const char *v382;
  uint64_t v383;
  uint64_t v384;
  const char *v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  const char *v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  void *v393;
  const char *v394;
  uint64_t v395;
  uint64_t v396;
  const char *v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  void *v401;
  const char *v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  const char *v406;
  uint64_t v407;
  uint64_t v408;
  void *v410;
  void *v411;
  unint64_t v412;
  id *v413;
  char v414;
  void *v415;
  void *v416;
  char v417;
  void *v418;
  void *v419;
  unint64_t v420;
  void *v421;
  uint64_t v422;
  void *v423;
  void *v424;
  uint8_t v425;
  _BYTE v426[15];
  _QWORD v427[4];
  id v428;

  v5 = a3;
  objc_msgSend_segments(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_count(v10, v11, v12, v13, v14);

  if (v15 >= 3)
  {
    v413 = a4;
    objc_msgSend_segments(v5, v16, v17, v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_outroInfoForClipPlaylist_(FlexSong, v22, (uint64_t)v21, v23, v24);
    v411 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0;
    v420 = v15 - 1;
    v30 = v15 - 2;
    v31 = 1;
    v32 = 2;
    v414 = 1;
    v412 = v15;
    while (1)
    {
      objc_msgSend_segments(v5, v25, v26, v27, v28);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v33, v34, v29, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_segment(v37, v38, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v42;
      if (!v42)
        goto LABEL_25;
      if (objc_msgSend_type(v42, v43, v44, v45, v46) != 2)
        break;
      v422 = v32;
      if (v29 >= v420)
      {
LABEL_11:
        v62 = 0;
        objc_msgSend_name(0, v48, v49, v50, v51);
      }
      else
      {
        v52 = v31;
        while (1)
        {
          objc_msgSend_segments(v5, v48, v49, v50, v51);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v53, v54, v52, v55, v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_segment(v57, v58, v59, v60, v61);
          v62 = objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_type(v62, v63, v64, v65, v66) == 2 || objc_msgSend_type(v62, v67, v68, v69, v70) == 4)
            break;

          if (v15 == ++v52)
            goto LABEL_11;
        }

        objc_msgSend_name(v62, v150, v151, v152, v153);
      }
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      v424 = v37;
      v159 = objc_msgSend_barsUsed(v37, v155, v156, v157, v158);
      objc_msgSend_transitionToSegmentNamed_fromBarIndex_(v47, v160, (uint64_t)v154, v159 - 1, v161);
      v162 = (void *)objc_claimAutoreleasedReturnValue();

      v421 = v162;
      v167 = objc_msgSend_prevented(v162, v163, v164, v165, v166);
      if (v62)
      {
        if (v167)
        {
          objc_msgSend_nameIndex(v47, v168, v169, v170, v171);
          v172 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_nameIndex(v62, v173, v174, v175, v176);
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v172, v178, (uint64_t)v177, v179, v180);

          if (isEqualToString)
          {
            objc_msgSend_nameSuffix(v47, v168, v169, v170, v171);
            v182 = objc_claimAutoreleasedReturnValue();
            if (v182)
            {
              v183 = (void *)v182;
              objc_msgSend_nameSuffix(v62, v168, v169, v170, v171);
              v184 = (void *)objc_claimAutoreleasedReturnValue();

              if (v184)
              {
                objc_msgSend_nameSuffix(v47, v168, v169, v170, v171);
                v185 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_nameSuffix(v62, v186, v187, v188, v189);
                v190 = (void *)objc_claimAutoreleasedReturnValue();
                v193 = objc_msgSend_compare_options_(v185, v191, (uint64_t)v190, 1, v192);

                if (v193)
                {
                  if (v193 == -1)
                  {
                    objc_msgSend_nameSuffix(v47, v168, v169, v170, v171);
                    v194 = (void *)objc_claimAutoreleasedReturnValue();
                    v198 = objc_msgSend_characterAtIndex_(v194, v195, 0, v196, v197);

                    objc_msgSend_nameSuffix(v62, v199, v200, v201, v202);
                    v203 = (void *)objc_claimAutoreleasedReturnValue();
                    v207 = objc_msgSend_characterAtIndex_(v203, v204, 0, v205, v206);

                    if (v207 - v198 == 1)
                    {
                      objc_msgSend_name(v62, v168, v169, v170, v171);
                      v208 = (void *)objc_claimAutoreleasedReturnValue();
                      v212 = objc_msgSend_linkedPerBarTransitionsToSegmentNamed_(v47, v209, (uint64_t)v208, v210, v211);

                      if (v212)
                        v217 = objc_msgSend_bars(v62, v213, v214, v215, v216) - 1;
                      else
                        v217 = 0;
                      v37 = v424;
                      if (v217 < objc_msgSend_bars(v62, v213, v214, v215, v216))
                      {
                        while ((objc_msgSend_canTransitionFromSegment_toSegment_fromBarIndex_checkIfPrevented_(FlexSegment, v369, (uint64_t)v47, (uint64_t)v62, v217, 1) & 1) == 0)
                        {
                          if (++v217 >= objc_msgSend_bars(v62, v373, v374, v375, v376))
                            goto LABEL_88;
                        }
                        v414 = 1;
                        goto LABEL_76;
                      }
LABEL_88:
                      objc_msgSend_song(v5, v369, v370, v371, v372);
                      v251 = (id)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_uid(v251, v377, v378, v379, v380);
                      v381 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend_isEqualToString_(v381, v382, (uint64_t)CFSTR("89EE9F2B-CEB7-4B06-8388-D12A7BFF78A8"), v383, v384))
                      {

                        v414 = 1;
                        goto LABEL_74;
                      }
                      objc_msgSend_song(v5, v385, v386, v387, v388);
                      v410 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_uid(v410, v389, v390, v391, v392);
                      v393 = (void *)objc_claimAutoreleasedReturnValue();
                      v417 = objc_msgSend_isEqualToString_(v393, v394, (uint64_t)CFSTR("0B84454E-B24A-44BC-9068-F88B899EDD2F"), v395, v396);

                      if ((v417 & 1) != 0)
                      {
                        v414 = 1;
                        goto LABEL_75;
                      }
                      v401 = (void *)MEMORY[0x24BDD17C8];
                      objc_msgSend_name(v47, v397, v398, v399, v400);
                      v251 = (id)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_name(v62, v402, v403, v404, v405);
                      v256 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_stringWithFormat_(v401, v406, (uint64_t)CFSTR("transition from %@ to %@ should be permitted but is not. successive segments in the clipPlaylist should transition into another."), v407, v408, v251, v256);
LABEL_55:
                      *v413 = (id)objc_claimAutoreleasedReturnValue();

                      v414 = 0;
                      goto LABEL_74;
                    }
                  }
                }
                else
                {
                  objc_msgSend_segments(v5, v168, v169, v170, v171);
                  v227 = (void *)objc_claimAutoreleasedReturnValue();
                  v427[0] = MEMORY[0x24BDAC760];
                  v427[1] = 3221225472;
                  v427[2] = sub_20D03C0C0;
                  v427[3] = &unk_24C5F0848;
                  v228 = v47;
                  v428 = v228;
                  objc_msgSend_indexesOfObjectsPassingTest_(v227, v229, (uint64_t)v427, v230, v231);
                  v232 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend_sliceable(v62, v233, v234, v235, v236))
                  {
                    objc_msgSend_count(v232, v237, v238, v239, v240);
                  }
                  else
                  {
                    v351 = objc_msgSend_sliceable(v228, v237, v238, v239, v240);
                    if (objc_msgSend_count(v232, v352, v353, v354, v355) && !v351)
                    {
                      v416 = (void *)MEMORY[0x24BDD17C8];
                      objc_msgSend_name(v228, v356, v357, v358, v359);
                      v360 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_name(v62, v361, v362, v363, v364);
                      v365 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_stringWithFormat_(v416, v366, (uint64_t)CFSTR("transition from %@ to %@ should not occur. there is a problem with the playback sequencing algorithm."), v367, v368, v360, v365);
                      *v413 = (id)objc_claimAutoreleasedReturnValue();

                      v414 = 0;
                      v251 = v428;
                      goto LABEL_74;
                    }
                  }

                }
              }
            }
          }
        }
      }
      v241 = v421;
      if (objc_msgSend_fadeOut(v421, v168, v169, v170, v171) < 1
        || (objc_msgSend_prevented(v421, v242, v243, v244, v245) & 1) != 0)
      {
        if (objc_msgSend_fadeOut(v421, v242, v243, v244, v245) >= 1
          && objc_msgSend_prevented(v421, v246, v247, v248, v249))
        {
          v250 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend_name(v47, v246, v247, v248, v249);
          v251 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_name(v62, v252, v253, v254, v255);
          v256 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v250, v257, (uint64_t)CFSTR("transition sequenced from %@ to %@ but not allowed. algorithm bug? "), v258, v259, v251, v256);
          goto LABEL_55;
        }
      }
      else
      {
        objc_msgSend_segments(v5, v242, v243, v244, v245);
        v260 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v260, v261, v29 + 1, v262, v263);
        v251 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend_segment(v251, v264, v265, v266, v267);
        v268 = (void *)objc_claimAutoreleasedReturnValue();
        v273 = objc_msgSend_type(v268, v269, v270, v271, v272);

        if (v273 == 5)
        {
          v414 = 0;
          *v413 = CFSTR("there should be no crossfade segments when using real-time crossfades.");
          goto LABEL_74;
        }

        v241 = v421;
      }
      objc_msgSend_transitionSegmentName(v241, v246, v247, v248, v249);
      v274 = (void *)objc_claimAutoreleasedReturnValue();

      if (v274)
      {
        if (v29 + 1 >= v420)
        {
          v251 = 0;
        }
        else
        {
          v279 = v47;
          v280 = 0;
          while (1)
          {
            objc_msgSend_segments(v5, v275, v276, v277, v278);
            v281 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v281, v282, v31 + v280, v283, v284);
            v251 = (id)objc_claimAutoreleasedReturnValue();

            objc_msgSend_segment(v251, v285, v286, v287, v288);
            v289 = (void *)objc_claimAutoreleasedReturnValue();
            v294 = objc_msgSend_type(v289, v290, v291, v292, v293);

            if (v294 == 3)
              break;

            if (v30 == ++v280)
            {
              v251 = 0;
              break;
            }
          }
          v47 = v279;
        }
        objc_msgSend_segment(v251, v275, v276, v277, v278);
        v295 = (void *)objc_claimAutoreleasedReturnValue();
        v300 = objc_msgSend_type(v295, v296, v297, v298, v299);

        if (v300 != 3)
        {
          v324 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend_name(v47, v301, v302, v303, v304);
          v325 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_name(v62, v326, v327, v328, v329);
          v330 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v324, v331, (uint64_t)CFSTR("transition segment specified for %@ to %@ but not found"), v332, v333, v325, v330);
          *v413 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_73;
        }
        v419 = v47;
        objc_msgSend_segment(v251, v301, v302, v303, v304);
        v305 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v305, v306, v307, v308, v309);
        v310 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_transitionSegmentName(v421, v311, v312, v313, v314);
        v315 = (void *)objc_claimAutoreleasedReturnValue();
        v319 = objc_msgSend_isEqualToString_(v310, v316, (uint64_t)v315, v317, v318);

        if ((v319 & 1) == 0)
        {
          v415 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend_name(v419, v320, v321, v322, v323);
          v325 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_name(v62, v334, v335, v336, v337);
          v330 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_segment(v251, v338, v339, v340, v341);
          v342 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_name(v342, v343, v344, v345, v346);
          v347 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v415, v348, (uint64_t)CFSTR("transition segment specified for %@ to %@ but incorrect segment %@ was found instead. playback sequencing algorithm issue?"), v349, v350, v325, v330, v347);
          *v413 = (id)objc_claimAutoreleasedReturnValue();

          v47 = v419;
LABEL_73:

          v414 = 0;
          v15 = v412;
LABEL_74:

LABEL_75:
          v37 = v424;
LABEL_76:

          LODWORD(v138) = 0;
          goto LABEL_77;
        }

        v15 = v412;
        v47 = v419;
        v241 = v421;
      }

      LODWORD(v138) = 1;
      v37 = v424;
LABEL_77:

      v32 = v422;
LABEL_78:

      if ((_DWORD)v138)
      {
        ++v29;
        ++v32;
        ++v31;
        --v30;
        if (v29 != v15)
          continue;
      }

      v20 = v414;
      goto LABEL_95;
    }
    if (objc_msgSend_type(v47, v48, v49, v50, v51) == 3)
    {
      v423 = v37;
      v418 = v47;
      if ((uint64_t)(v29 - 1) < 0)
      {
LABEL_17:
        v76 = 0;
      }
      else
      {
        v71 = v29;
        while (1)
        {
          --v71;
          objc_msgSend_segments(v5, v43, v44, v45, v46);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v72, v73, v71, v74, v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_segment(v76, v77, v78, v79, v80);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = objc_msgSend_type(v81, v82, v83, v84, v85);

          if (v86 == 2)
            break;

          if (v71 <= 0)
            goto LABEL_17;
        }
      }
      v422 = v32;
      if (v29 + 1 >= v420)
      {
LABEL_22:
        v62 = 0;
      }
      else
      {
        v87 = v32;
        while (1)
        {
          objc_msgSend_segments(v5, v43, v44, v45, v46);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v88, v89, v87 - 1, v90, v91);
          v62 = objc_claimAutoreleasedReturnValue();

          objc_msgSend_segment(v62, v92, v93, v94, v95);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = objc_msgSend_type(v96, v97, v98, v99, v100);

          if (v101 == 2)
            break;

          if (v15 == ++v87)
            goto LABEL_22;
        }
      }
      objc_msgSend_segment(v76, v43, v44, v45, v46);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_segment(v62, v103, v104, v105, v106);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v107, v108, v109, v110, v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = objc_msgSend_barsUsed(v423, v113, v114, v115, v116);
      objc_msgSend_transitionToSegmentNamed_fromBarIndex_(v102, v118, (uint64_t)v112, v117 - 1, v119);
      v120 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_transitionSegmentName(v120, v121, v122, v123, v124);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v418, v126, v127, v128, v129);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v112) = objc_msgSend_isEqualToString_(v125, v131, (uint64_t)v130, v132, v133);

      if ((_DWORD)v112)
      {

        LODWORD(v138) = 1;
      }
      else
      {
        v138 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_segment(v76, v134, v135, v136, v137);
        v218 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v218, v219, v220, v221, v222);
        v223 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v138, v224, (uint64_t)CFSTR("incorrect transition segment found after %@. Bug in sequencing algorithm"), v225, v226, v223);
        *v413 = (id)objc_claimAutoreleasedReturnValue();

        LODWORD(v138) = 0;
        v414 = 0;
      }
      v15 = v412;
      v37 = v423;
      v47 = v418;
      goto LABEL_77;
    }
LABEL_25:
    v139 = v47;
    objc_msgSend_segments(v5, v43, v44, v45, v46);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastObject(v140, v141, v142, v143, v144);
    v145 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37 != v145)
    {
      LODWORD(v138) = 1;
      v47 = v139;
      goto LABEL_78;
    }
    v47 = v139;
    if (v37 == v411)
    {
      LODWORD(v138) = 0;
LABEL_46:
      v414 = 1;
      goto LABEL_78;
    }
    objc_msgSend_segment(v37, v146, v147, v148, v149);
    v138 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v138)
      goto LABEL_46;
    v422 = v32;
    FlexLogForCategory(1uLL);
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      sub_20D03F078(&v425, v426, v62);
    LODWORD(v138) = 0;
    v414 = 0;
    goto LABEL_77;
  }
  v20 = 1;
LABEL_95:

  return v20 & 1;
}

+ (BOOL)_transitionIsPossibleFromSegment:(id)a3 toSegment:(id)a4 forBodyClipPlaylist:(id)a5
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  BOOL v31;
  id v32;
  unint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  unint64_t v60;
  id v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  BOOL v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  _QWORD v104[4];
  id v105;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend_sortedArrayUsingComparator_(v9, v10, (uint64_t)&unk_24C5F09B8, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_indexOfObject_(v13, v14, (uint64_t)v7, v15, v16);
  v21 = objc_msgSend_indexOfObject_(v13, v18, (uint64_t)v8, v19, v20);
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v26;
  v31 = 0;
  if (v17 != 0x7FFFFFFFFFFFFFFFLL && v21 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v17 >= v21)
    {
      if (v17 <= v21)
      {
        if (v17 == v21)
          objc_msgSend_addObject_(v26, v27, (uint64_t)v8, v28, v29);
        v65 = 1;
      }
      else
      {
        v102 = v8;
        v103 = v26;
        v100 = v9;
        v66 = v17 - 1;
        while (1)
        {
          v67 = v66;
          v68 = v66-- < 1;
          v65 = v68;
          if (v68)
            break;
          objc_msgSend_objectAtIndexedSubscript_(v13, v27, v67, v28, v29);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_name(v7, v70, v71, v72, v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_name(v69, v75, v76, v77, v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = objc_msgSend_compare_options_(v74, v80, (uint64_t)v79, 65, v81);

          objc_msgSend_name(v102, v83, v84, v85, v86);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_name(v69, v88, v89, v90, v91);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = objc_msgSend_compare_options_(v87, v93, (uint64_t)v92, 65, v94);

          if (v82 == -1 && v95 == 1)
          {
            if (v67 > 0)
            {
              v8 = v102;
              goto LABEL_12;
            }
            break;
          }
        }
        v8 = v102;
        v30 = v103;
        objc_msgSend_addObject_(v103, v27, (uint64_t)v102, v28, v29, v100);
        v9 = v101;
      }
    }
    else
    {
      v103 = v26;
      v100 = v9;
      v32 = 0;
      v33 = v17 + 1;
      do
      {
        objc_msgSend_objectAtIndexedSubscript_(v13, v27, v33, v28, v29, v100);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v7, v35, v36, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v34, v40, v41, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend_compare_options_(v39, v45, (uint64_t)v44, 65, v46);

        if (v47 == -1)
        {
          if (!v32)
            v32 = v34;
          objc_msgSend_name(v32, v48, v49, v50, v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_name(v34, v53, v54, v55, v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend_compare_options_(v52, v58, (uint64_t)v57, 65, v59);

          if (v60 <= 1)
          {
            v61 = v34;

            objc_msgSend_addObject_(v103, v62, (uint64_t)v61, v63, v64);
            v32 = v61;
          }
        }

        ++v33;
      }
      while (v33 <= v21);

      v65 = 1;
LABEL_12:
      v9 = v100;
      v30 = v103;
    }
    v104[0] = MEMORY[0x24BDAC760];
    v104[1] = 3221225472;
    v104[2] = sub_20D03C52C;
    v104[3] = &unk_24C5F08F0;
    v105 = v8;
    if (objc_msgSend_indexOfObjectPassingTest_(v30, v96, (uint64_t)v104, v97, v98) == 0x7FFFFFFFFFFFFFFFLL)
      v31 = 0;
    else
      v31 = v65;

  }
  return v31;
}

- (BOOL)_validateAuthoringIssuesInRendition:(id)a3 failureReason:(id *)a4
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
  void *v15;
  BOOL v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
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
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
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
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
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
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const __CFString *v156;
  void *v158;
  void *v159;
  id v160;
  id *v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  _BYTE v166[128];
  uint64_t v167;

  v167 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend_segments(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 != 0;

  if (!v15)
    *a4 = CFSTR("empty playlist!");
  objc_msgSend_segments(v5, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_segment(v26, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v31;
  if (v31)
    v37 = objc_msgSend_sampleRate(v31, v32, v33, v34, v35);
  else
    v37 = -1;
  objc_msgSend_segments(v5, v32, v33, v34, v35);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend_count(v38, v39, v40, v41, v42);

  if (v36 || v43 != 1)
  {
    v159 = v26;
    v160 = v5;
    v161 = a4;
    v164 = 0u;
    v165 = 0u;
    v162 = 0u;
    v163 = 0u;
    objc_msgSend_segments(v5, v44, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v162, (uint64_t)v166, 16);
    if (!v50)
      goto LABEL_45;
    v55 = v50;
    v56 = *(_QWORD *)v163;
    while (1)
    {
      v57 = 0;
      do
      {
        if (*(_QWORD *)v163 != v56)
          objc_enumerationMutation(v48);
        objc_msgSend_segment(*(void **)(*((_QWORD *)&v162 + 1) + 8 * v57), v51, v52, v53, v54);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = v58;
        if (!v58)
          goto LABEL_33;
        if (objc_msgSend_samplesPerBar(v58, v59, v60, v61, v62) == -1)
        {
          objc_msgSend_customBarMarkers(v63, v64, v65, v66, v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = objc_msgSend_count(v68, v69, v70, v71, v72);

          if (!v73)
          {
            v147 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend_name(v63, v74, v75, v76, v77);
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringWithFormat_(v147, v148, (uint64_t)CFSTR("samplesPerBar is -1, customBarMarkers.count should be > 0 please fix %@"), v149, v150, v155);
            goto LABEL_44;
          }
          objc_msgSend_customBarMarkers(v63, v74, v75, v76, v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = objc_msgSend_count(v78, v79, v80, v81, v82);
          v88 = objc_msgSend_bars(v63, v84, v85, v86, v87);

          if (v83 != v88)
          {
            v151 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend_name(v63, v89, v90, v91, v92);
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            v158 = v155;
            v156 = CFSTR("samplesPerBar is -1, customBarMarkers.count should equal segment.bars please fix %@");
            goto LABEL_43;
          }
          objc_msgSend_customBarMarkers(v63, v89, v90, v91, v92);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v98 = objc_msgSend_count(v93, v94, v95, v96, v97);

          if (v98)
          {
            v103 = 0;
            while (1)
            {
              v104 = objc_msgSend_barDurationForBarIndex_(v63, v99, v103, v101, v102);
              if (v104 >= objc_msgSend_sampleCount(v63, v105, v106, v107, v108))
                break;
              ++v103;
              objc_msgSend_customBarMarkers(v63, v109, v110, v111, v112);
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              v118 = objc_msgSend_count(v113, v114, v115, v116, v117);

              if (v103 >= v118)
                goto LABEL_27;
            }
            v141 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend_name(v63, v109, v110, v111, v112);
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringWithFormat_(v141, v143, (uint64_t)CFSTR("custom barDuration should be less than sampleCount. please fix %@"), v144, v145, v142);
            *v161 = (id)objc_claimAutoreleasedReturnValue();

            v16 = 0;
            goto LABEL_33;
          }
          goto LABEL_27;
        }
        if (objc_msgSend_bars(v63, v64, v65, v66, v67) >= 2)
        {
          v123 = objc_msgSend_samplesPerBar(v63, v119, v120, v121, v122);
          if (v123 >= objc_msgSend_sampleCount(v63, v124, v125, v126, v127))
          {
            v151 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend_name(v63, v99, v100, v101, v102);
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            v158 = v155;
            v156 = CFSTR("samplesPerBar should be less than sampleCount if we have more than one bar. please fix %@");
            goto LABEL_43;
          }
LABEL_27:
          v16 = 1;
          goto LABEL_28;
        }
        if (objc_msgSend_bars(v63, v119, v120, v121, v122) == 1)
        {
          v132 = objc_msgSend_samplesPerBar(v63, v128, v129, v130, v131);
          if (v132 != objc_msgSend_sampleCount(v63, v133, v134, v135, v136))
          {
            v151 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend_name(v63, v99, v100, v101, v102);
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            v158 = v155;
            v156 = CFSTR("samplesPerBar should equal sampleCount if we only have one bar. please fix %@");
LABEL_43:
            objc_msgSend_stringWithFormat_(v151, v152, (uint64_t)v156, v153, v154, v158);
LABEL_44:
            *v161 = (id)objc_claimAutoreleasedReturnValue();

            v16 = 0;
            goto LABEL_45;
          }
          goto LABEL_27;
        }
        if (!objc_msgSend_bars(v63, v128, v129, v130, v131))
        {
          v151 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend_name(v63, v99, v100, v101, v102);
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          v158 = v155;
          v156 = CFSTR("samplesPerBar should not be 0. please fix %@");
          goto LABEL_43;
        }
LABEL_28:
        if (v16 && v37 >= 1)
        {
          if (objc_msgSend_sampleRate(v63, v99, v100, v101, v102) != v37)
          {
            v151 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend_name(v63, v137, v138, v139, v140);
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            v158 = v155;
            v156 = CFSTR("sample rates must be the same for all segments. please fix %@");
            goto LABEL_43;
          }
          v16 = 1;
        }
LABEL_33:

        ++v57;
      }
      while (v57 != v55);
      v146 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v51, (uint64_t)&v162, (uint64_t)v166, 16);
      v55 = v146;
      if (!v146)
      {
LABEL_45:

        v26 = v159;
        v5 = v160;
        break;
      }
    }
  }

  return v16;
}

- (int64_t)_samplesForDuration:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  int32_t v6;
  CMTime v8;
  CMTime v9;

  v6 = objc_msgSend_sampleRate(self, a2, (uint64_t)a3, v3, v4);
  v8 = *(CMTime *)a3;
  CMTimeConvertScale(&v9, &v8, v6, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  return v9.value;
}

- (BOOL)verifyRendition:(id)a3 forDuration:(id *)a4 failureReason:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  char v36;
  void *v37;
  objc_class *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  double v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v56;
  int64_t var3;
  objc_super v58;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    v58.receiver = self;
    v58.super_class = (Class)FlexSong;
    v56 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    if (!-[FlexSongBackend verifyRendition:forDuration:failureReason:](&v58, sel_verifyRendition_forDuration_failureReason_, v9, &v56, a5))goto LABEL_9;
    objc_msgSend_segments(v9, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v36 = 0;
      *a5 = CFSTR("no playlist! The playback algorithm could not generate a playlist for this duration or there is an issue with the authoring tool");
      goto LABEL_12;
    }
    v56 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v18 = objc_msgSend__samplesForDuration_(self, v15, (uint64_t)&v56, v16, v17);
    objc_msgSend_segments(v9, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend__sampleDurationOfClipPlaylist_(self, v24, (uint64_t)v23, v25, v26);

    if (v18 != v27)
    {
      v45 = (void *)MEMORY[0x24BDD17C8];
      v46 = (double)v18 / (double)objc_msgSend_sampleRate(self, v28, v29, v30, v31);
      v51 = objc_msgSend_sampleRate(self, v47, v48, v49, v50);
      objc_msgSend_stringWithFormat_(v45, v52, (uint64_t)CFSTR("expected duration (%.2fs, %lld) does not match duration (%.2fs, %lld) of clipPlaylist! Possibly no valid intro or outro valid for this duration?"), v53, v54, *(_QWORD *)&v46, v18, (double)v27 / (double)v51, v27);
      v36 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (objc_msgSend__validateAuthoringIssuesInRendition_failureReason_(self, v28, (uint64_t)v9, (uint64_t)a5, v31)&& objc_msgSend__validateStructureForRendition_failureReason_(self, v32, (uint64_t)v9, (uint64_t)a5, v33))
    {
      v36 = objc_msgSend__validateTransitionsInRendition_failureReason_(self, v34, (uint64_t)v9, (uint64_t)a5, v35);
    }
    else
    {
LABEL_9:
      v36 = 0;
    }
LABEL_12:

    goto LABEL_13;
  }
  v37 = (void *)MEMORY[0x24BDD17C8];
  v38 = (objc_class *)objc_opt_class();
  NSStringFromClass(v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (objc_class *)objc_opt_class();
  NSStringFromClass(v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v37, v42, (uint64_t)CFSTR("Expected a %@ class but found a %@"), v43, v44, v39, v41);
  *a5 = (id)objc_claimAutoreleasedReturnValue();

  v36 = 0;
LABEL_13:

  return v36;
}

- (BOOL)_verifyAssetsForSegment:(id)a3 withFailureReason:(id *)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  int isDirectory;
  int v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  dispatch_semaphore_t v78;
  NSObject *v79;
  const char *v80;
  uint64_t v81;
  dispatch_time_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  BOOL v92;
  void *v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  int32_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  NSObject *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  CMTimeValue value;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  CMTimeValue v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v171;
  CMTime time;
  CMTime v173;
  _QWORD v174[4];
  NSObject *v175;
  unsigned __int8 v176;
  uint8_t buf[4];
  void *v178;
  __int16 v179;
  CMTimeValue v180;
  __int16 v181;
  uint64_t v182;
  uint64_t v183;
  _QWORD v184[3];

  v184[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  if (v10)
  {
    objc_msgSend_assetProvider(self, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_urlToAudioForSegment_(v11, v12, (uint64_t)v10, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v176 = 0;
      objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v16, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_path(v15, v21, v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v20, v26, (uint64_t)v25, (uint64_t)&v176, v27);
      v29 = v176;

      if (isDirectory && !v29)
      {
        objc_msgSend_path(v15, v30, v31, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_readInfoFromAudioFileAtPath_(FlexSegment, v35, (uint64_t)v34, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          v43 = objc_msgSend_sampleRate(v10, v39, v40, v41, v42);
          if (v43 == objc_msgSend_sampleRate(v38, v44, v45, v46, v47))
          {
            v52 = objc_msgSend_sampleCount(v10, v48, v49, v50, v51);
            if (v52 == objc_msgSend_sampleCount(v38, v53, v54, v55, v56))
              goto LABEL_12;
            v61 = objc_msgSend_sampleCount(v10, v57, v58, v59, v60);
            if (v61 == objc_msgSend_sampleCount(v38, v62, v63, v64, v65) - 1)
            {
              FlexLogForCategory(1uLL);
              v70 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
                sub_20D03F0AC(v15, (char *)v10, v70, v71, v72);

LABEL_12:
              v73 = (void *)MEMORY[0x24BDB26C8];
              v183 = *MEMORY[0x24BDB21C0];
              v184[0] = MEMORY[0x24BDBD1C8];
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v57, (uint64_t)v184, (uint64_t)&v183, 1);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_URLAssetWithURL_options_(v73, v75, (uint64_t)v15, (uint64_t)v74, v76);
              v77 = (void *)objc_claimAutoreleasedReturnValue();

              v78 = dispatch_semaphore_create(0);
              v174[0] = MEMORY[0x24BDAC760];
              v174[1] = 3221225472;
              v174[2] = sub_20D03D26C;
              v174[3] = &unk_24C5EFCC8;
              v79 = v78;
              v175 = v79;
              objc_msgSend_loadValuesAsynchronouslyForKeys_completionHandler_(v77, v80, (uint64_t)&unk_24C5FACE0, (uint64_t)v174, v81);
              v82 = dispatch_time(0, 20000000000);
              if (dispatch_semaphore_wait(v79, v82))
              {
                if (a4)
                {
                  v87 = (void *)MEMORY[0x24BDD17C8];
                  objc_msgSend_lastPathComponent(v15, v83, v84, v85, v86);
                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_stringWithFormat_(v87, v89, (uint64_t)CFSTR("Timed out waiting for %@ to load"), v90, v91, v88);
                  *a4 = (id)objc_claimAutoreleasedReturnValue();

                }
                goto LABEL_15;
              }
              memset(&v173, 0, sizeof(v173));
              if (v77)
                objc_msgSend_duration(v77, v83, v84, v85, v86);
              else
                memset(&time, 0, sizeof(time));
              v133 = objc_msgSend_sampleRate(v10, v83, v84, v85, v86);
              v92 = 1;
              CMTimeConvertScale(&v173, &time, v133, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
              v138 = objc_msgSend_sampleCount(v10, v134, v135, v136, v137);
              if (v138 == v173.value)
                goto LABEL_40;
              v143 = objc_msgSend_sampleCount(v10, v139, v140, v141, v142);
              v92 = v143 == v173.value - 1;
              if (v143 == v173.value - 1)
              {
                FlexLogForCategory(1uLL);
                v148 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v148, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend_lastPathComponent(v15, v149, v150, v151, v152);
                  v153 = (void *)objc_claimAutoreleasedReturnValue();
                  value = v173.value;
                  v159 = objc_msgSend_sampleCount(v10, v155, v156, v157, v158);
                  *(_DWORD *)buf = 138412802;
                  v178 = v153;
                  v179 = 2048;
                  v180 = value;
                  v181 = 2048;
                  v182 = v159;
                  _os_log_debug_impl(&dword_20D016000, v148, OS_LOG_TYPE_DEBUG, "%@: asset.duration %lld is 1 sample longer than segment.sampleCount %lld", buf, 0x20u);

                }
              }
              else
              {
                if (!a4)
                {
LABEL_15:
                  v92 = 0;
LABEL_40:

                  goto LABEL_41;
                }
                v160 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend_lastPathComponent(v15, v144, v145, v146, v147);
                v148 = objc_claimAutoreleasedReturnValue();
                v161 = v173.value;
                v166 = objc_msgSend_sampleCount(v10, v162, v163, v164, v165);
                objc_msgSend_stringWithFormat_(v160, v167, (uint64_t)CFSTR("%@: asset.duration (%lld) does not match segment.sampleCount (%lld)"), v168, v169, v148, v161, v166);
                *a4 = (id)objc_claimAutoreleasedReturnValue();
              }

              goto LABEL_40;
            }
            if (a4)
            {
              v120 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend_lastPathComponent(v15, v66, v67, v68, v69);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              v125 = objc_msgSend_sampleCount(v38, v121, v122, v123, v124);
              v171 = objc_msgSend_sampleCount(v10, v126, v127, v128, v129);
              objc_msgSend_stringWithFormat_(v120, v130, (uint64_t)CFSTR("%@: kExtAudioFileProperty_FileLengthFrames (%lld) does not match segment.sampleCount (%lld)"), v131, v132, v77, v125, v171);
              goto LABEL_30;
            }
            goto LABEL_31;
          }
          if (a4)
          {
            v106 = (void *)MEMORY[0x24BDD17C8];
            v107 = objc_msgSend_sampleRate(v38, v48, v49, v50, v51);
            v112 = objc_msgSend_sampleRate(v10, v108, v109, v110, v111);
            objc_msgSend_lastPathComponent(v15, v113, v114, v115, v116);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringWithFormat_(v106, v117, (uint64_t)CFSTR("audio file sample rate (%ld) does not match sample rate (%ld) of \"%@\"), v118, v119, v107, v112, v77);
            goto LABEL_30;
          }
        }
        else if (a4)
        {
          v102 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend_path(v15, v39, v40, v41, v42);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v102, v103, (uint64_t)CFSTR("could not read info for audio file: \"%@\"), v104, v105, v77);
LABEL_30:
          v92 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_41:

          goto LABEL_42;
        }
LABEL_31:
        v92 = 0;
        goto LABEL_42;
      }
      if (a4)
      {
        v98 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_name(v10, v30, v31, v32, v33);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v98, v99, (uint64_t)CFSTR("audio file does not exist for segment \"%@\"), v100, v101, v38);
        v92 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:

        goto LABEL_43;
      }
    }
    else if (a4)
    {
      v93 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_name(v10, v16, v17, v18, v19);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v93, v95, (uint64_t)CFSTR("could not determine url for segment \"%@\"), v96, v97, v94);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v92 = 0;
LABEL_43:

    goto LABEL_44;
  }
  v92 = 1;
LABEL_44:

  return v92;
}

- (BOOL)verifyAssetsWithFailureReason:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  BOOL v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[8];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend__metadataDictFromCache(self, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    FlexLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D016000, v12, OS_LOG_TYPE_DEFAULT, "flex: missing metadataDict!", buf, 2u);
    }

  }
  objc_msgSend__decodedMainSegmentsFromCache(self, v7, v8, v9, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    FlexLogForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D016000, v18, OS_LOG_TYPE_DEFAULT, "flex: missing decodedMainSegments!", buf, 2u);
    }

  }
  objc_msgSend__destroyCache(self, v13, v14, v15, v16);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v19 = v17;
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v29, (uint64_t)v34, 16);
  if (v21)
  {
    v24 = v21;
    v25 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(v19);
        if (!objc_msgSend__verifyAssetsForSegment_withFailureReason_(self, v22, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), (uint64_t)a3, v23, (_QWORD)v29))
        {
          v27 = 0;
          goto LABEL_19;
        }
      }
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v29, (uint64_t)v34, 16);
      if (v24)
        continue;
      break;
    }
  }
  v27 = 1;
LABEL_19:

  return v27;
}

- (id)timedMetadataItemsWithIdentifier:(id)a3 forRendition:(id)a4
{
  id v6;
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
  int isEqualToString;
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
  id v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  int64_t v40;
  const __CFString *v41;
  unint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  __CFString *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  id v67;
  const __CFString *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t MaxLengthInSamplesToReserveForOutroSegment_withOptions;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  void *v132;
  uint64_t MinLengthInSamplesForEarlyFadeOutForOutroSegment_withOptions;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t EarlyFadeStartOffsetInSamplesForOutroSegment_withOptions;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;
  void *v153;
  void *v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  unint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  int v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  int64_t v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  int64_t v203;
  int32_t v204;
  int32_t v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  void *v214;
  uint64_t v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  void *v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  void *v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  void *v234;
  double v235;
  double v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  double v241;
  double v242;
  double v243;
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  double v253;
  double v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  FMTimedMetadataItem *v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  void *v269;
  const char *v270;
  void *v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  id v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  void *v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  void *v285;
  uint64_t v286;
  const char *v287;
  uint64_t v288;
  uint64_t v289;
  void *v290;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  void *v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  void *v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  const char *v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  void *v315;
  id v316;
  const char *v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  const char *v321;
  const char *v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  int64_t v326;
  uint64_t v327;
  void *v328;
  const char *v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  void *v333;
  int64_t v334;
  uint64_t v335;
  const char *v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  const char *v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  void *v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  const char *v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  const char *v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  int64_t v359;
  int32_t v361;
  void *v362;
  const char *v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  void *v367;
  const char *v368;
  uint64_t v369;
  uint64_t v370;
  void *v371;
  uint64_t v372;
  const char *v373;
  uint64_t v374;
  uint64_t v375;
  void *v376;
  const char *v377;
  uint64_t v378;
  uint64_t v379;
  void *v380;
  const char *v381;
  int64_t v382;
  void *v383;
  FMTimedMetadataItem *v384;
  const char *v385;
  void *v386;
  const char *v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  const char *v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  const char *v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  const char *v399;
  const char *v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  int64_t v404;
  uint64_t v405;
  void *v406;
  void *v407;
  void *v408;
  const char *v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  void *v413;
  const char *v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  void *v418;
  int64_t v419;
  uint64_t v420;
  const char *v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  void *v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  const char *v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  const char *v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  const char *v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  int64_t v444;
  uint64_t v445;
  int32_t v446;
  void *v447;
  const char *v448;
  uint64_t v449;
  uint64_t v450;
  uint64_t v451;
  void *v452;
  const char *v453;
  uint64_t v454;
  uint64_t v455;
  void *v456;
  int64_t v457;
  void *v458;
  const char *v459;
  uint64_t v460;
  uint64_t v461;
  void *v462;
  const char *v463;
  uint64_t v464;
  uint64_t v465;
  void *v466;
  const char *v467;
  void *v468;
  FMTimedMetadataItem *v469;
  const char *v470;
  void *v471;
  const char *v472;
  uint64_t v473;
  uint64_t v474;
  const char *v475;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  const char *v479;
  uint64_t v480;
  uint64_t v481;
  uint64_t v482;
  const char *v483;
  uint64_t v484;
  const char *v485;
  uint64_t v486;
  uint64_t v487;
  uint64_t v488;
  uint64_t v489;
  int64_t v490;
  uint64_t v491;
  uint64_t v492;
  uint64_t v493;
  uint64_t v494;
  void *v495;
  const char *v496;
  uint64_t v497;
  uint64_t v498;
  uint64_t v499;
  const char *v500;
  uint64_t v501;
  uint64_t v502;
  uint64_t v503;
  void *v504;
  const char *v505;
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  void *v509;
  const char *v510;
  uint64_t v511;
  uint64_t v512;
  void *v513;
  id v514;
  const char *v515;
  uint64_t v516;
  const char *v517;
  uint64_t v518;
  uint64_t v519;
  uint64_t v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t i;
  void *v524;
  int32_t v525;
  float Seconds;
  const char *v527;
  uint64_t v528;
  uint64_t v529;
  uint64_t v530;
  float v531;
  Float64 v532;
  const char *v533;
  uint64_t v534;
  uint64_t v535;
  uint64_t v536;
  int32_t v537;
  FMTimedMetadataItem *v538;
  const char *v539;
  uint64_t v540;
  uint64_t v541;
  void *v542;
  const char *v543;
  void *v544;
  const char *v545;
  uint64_t v546;
  uint64_t v547;
  const char *v548;
  uint64_t v549;
  uint64_t v550;
  uint64_t v551;
  void *v552;
  const char *v553;
  uint64_t v554;
  const char *v555;
  uint64_t v556;
  uint64_t v557;
  uint64_t v558;
  uint64_t v559;
  int64_t v560;
  uint64_t v561;
  uint64_t v562;
  uint64_t j;
  void *v564;
  void *v565;
  const char *v566;
  uint64_t v567;
  uint64_t v568;
  uint64_t v569;
  const char *v570;
  uint64_t v571;
  uint64_t v572;
  uint64_t v573;
  int64_t v574;
  const char *v575;
  uint64_t v576;
  uint64_t v577;
  uint64_t v578;
  int32_t v579;
  const char *v580;
  uint64_t v581;
  uint64_t v582;
  uint64_t v583;
  int32_t v584;
  float v585;
  Float64 v586;
  const char *v587;
  uint64_t v588;
  uint64_t v589;
  uint64_t v590;
  int32_t v591;
  FMTimedMetadataItem *v592;
  const char *v593;
  uint64_t v594;
  uint64_t v595;
  void *v596;
  const char *v597;
  void *v598;
  const char *v599;
  uint64_t v600;
  uint64_t v601;
  const char *v602;
  uint64_t v603;
  uint64_t v604;
  uint64_t v605;
  const char *v606;
  uint64_t v607;
  uint64_t v608;
  uint64_t v609;
  const char *v610;
  uint64_t v611;
  uint64_t v612;
  unint64_t v613;
  void *v614;
  const char *v615;
  uint64_t v616;
  uint64_t v617;
  void *v618;
  const char *v619;
  uint64_t v620;
  uint64_t v621;
  uint64_t v622;
  void *v623;
  const char *v624;
  uint64_t v625;
  uint64_t v626;
  const char *v627;
  uint64_t v628;
  uint64_t v629;
  uint64_t v630;
  void *v632;
  id v633;
  __CFString *v634;
  id obj;
  int v636;
  id v637;
  id v638;
  uint64_t v639;
  uint64_t v640;
  uint64_t v641;
  uint64_t v642;
  uint64_t v643;
  uint64_t v644;
  void *v645;
  void *v646;
  void *v647;
  void *v648;
  void *v649;
  int64_t v650;
  void *v651;
  uint64_t v652;
  uint64_t v653;
  void *v654;
  uint64_t v655;
  uint64_t v656;
  void *v657;
  void *v658;
  uint64_t v659;
  uint64_t v660;
  void *v661;
  uint64_t v662;
  uint64_t v663;
  uint64_t v664;
  id v665;
  id v666;
  __CFString *v667;
  void *v668;
  void *v669;
  uint64_t v670;
  id v671;
  int64_t v672;
  uint64_t v673;
  void *v674;
  void *v675;
  void *v676;
  int64_t v677;
  FlexSong *v678;
  void *v679;
  CMTime v680;
  CMTime rhs;
  __int128 v682;
  __int128 v683;
  __int128 v684;
  CMTime lhs;
  CMTime v686;
  CMTime v687;
  CMTime v688;
  __int128 v689;
  __int128 v690;
  __int128 v691;
  __int128 v692;
  CMTime v693;
  __int128 v694;
  __int128 v695;
  __int128 v696;
  __int128 v697;
  __int128 v698;
  __int128 v699;
  __int128 v700;
  __int128 v701;
  CMTime v702;
  __int128 v703;
  __int128 v704;
  __int128 v705;
  __int128 v706;
  CMTime v707;
  __int128 v708;
  __int128 v709;
  __int128 v710;
  __int128 v711;
  CMTimeRange duration;
  CMTime start;
  CMTimeRange v714;
  CMTime v715;
  __int128 v716;
  __int128 v717;
  __int128 v718;
  __int128 v719;
  _BYTE v720[128];
  _BYTE v721[128];
  _BYTE v722[128];
  _QWORD v723[2];
  _QWORD v724[2];
  _BYTE v725[128];
  _QWORD v726[2];
  _QWORD v727[2];
  _BYTE v728[128];
  _BYTE v729[128];
  uint64_t v730;

  v730 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  v632 = v7;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v316 = (id)MEMORY[0x24BDBD1A8];
    goto LABEL_227;
  }
  v633 = v7;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v644 = (uint64_t)v6;
  v678 = self;
  v679 = v12;
  if ((objc_msgSend_isEqualToString_(v6, v13, (uint64_t)CFSTR("FMTimedMetadataIdentifierSection"), v14, v15) & 1) != 0
    || objc_msgSend_isEqualToString_(v6, v16, (uint64_t)CFSTR("FMTimedMetadataIdentifierSegment"), v17, v18))
  {
    isEqualToString = objc_msgSend_isEqualToString_(v6, v16, (uint64_t)CFSTR("FMTimedMetadataIdentifierSection"), v17, v18);
    objc_msgSend_segments(v633, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastObject(v24, v25, v26, v27, v28);
    v637 = (id)objc_claimAutoreleasedReturnValue();

    v719 = 0u;
    v718 = 0u;
    v717 = 0u;
    v716 = 0u;
    objc_msgSend_segments(v633, v29, v30, v31, v32);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    v640 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v716, (uint64_t)v729, 16);
    if (v640)
    {
      v645 = 0;
      v39 = 0;
      v40 = 0;
      v639 = *(_QWORD *)v717;
      if (isEqualToString)
        v41 = CFSTR("SILENCE");
      else
        v41 = CFSTR("silence");
      v634 = (__CFString *)v41;
      v42 = 0x24C5EF000uLL;
      v636 = isEqualToString;
      obj = v33;
      while (1)
      {
        v43 = 0;
        v44 = v39;
        do
        {
          if (*(_QWORD *)v717 != v639)
            objc_enumerationMutation(obj);
          v45 = *(id *)(*((_QWORD *)&v716 + 1) + 8 * v43);
          objc_msgSend_segment(v45, v35, v36, v37, v38);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v46;
          v657 = v44;
          v661 = v45;
          if (!v46)
          {
            v61 = v634;
            if ((isEqualToString & 1) != 0)
            {
              v66 = 0;
              v67 = 0;
              v675 = 0;
              v647 = 0;
              v649 = 0;
              v651 = 0;
              v654 = 0;
              v665 = 0;
              v68 = CFSTR("SILENCE");
              v667 = CFSTR("SILENCE");
              v669 = 0;
            }
            else
            {
              objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v62, 1, v64, v65);
              v647 = 0;
              v649 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = 0;
              v67 = 0;
              v675 = 0;
              v651 = 0;
              v654 = 0;
              v665 = 0;
              v667 = CFSTR("SILENCE");
              v669 = 0;
              v68 = CFSTR("silence");
            }
            v671 = (id)v68;
            goto LABEL_51;
          }
          if (objc_msgSend_type(v46, v47, v48, v49, v50) == 1
            || objc_msgSend_type(v51, v52, v53, v54, v55) == 4
            || objc_msgSend_type(v51, v52, v53, v54, v55) == 3)
          {
            if ((isEqualToString & 1) != 0)
            {
              v56 = *(void **)(v42 + 1720);
              v57 = objc_msgSend_type(v51, v52, v53, v54, v55);
              objc_msgSend_longLabelForSegmentType_(v56, v58, v57, v59, v60);
            }
            else
            {
              objc_msgSend_name(v51, v52, v53, v54, v55);
            }
            v671 = (id)objc_claimAutoreleasedReturnValue();

            v69 = *(void **)(v42 + 1720);
            v74 = objc_msgSend_type(v51, v70, v71, v72, v73);
            objc_msgSend_longLabelForSegmentType_(v69, v75, v74, v76, v77);
            v667 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_type(v51, v78, v79, v80, v81) == 4)
            {
              v86 = objc_msgSend_offset(v45, v82, v83, v84, v85);
              v91 = objc_msgSend_duration(v45, v87, v88, v89, v90);
              v96 = objc_msgSend_sampleCount(v51, v92, v93, v94, v95);
              objc_msgSend_markers(v51, v97, v98, v99, v100);
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKey_(v101, v102, (uint64_t)CFSTR("OUTRO_STINGER"), v103, v104);
              v105 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v105 || (v110 = objc_msgSend_integerValue(v105, v106, v107, v108, v109), v110 < 0))
              {
                v112 = 0;
              }
              else
              {
                v111 = v110;
                if (v110 >= objc_msgSend_sampleCount(v51, v106, v107, v108, v109))
                  v112 = 0;
                else
                  v112 = v111;
              }
              isEqualToString = v636;
              v113 = v91 + v86;
              v114 = v40 - objc_msgSend_offset(v661, v106, v107, v108, v109);
              objc_msgSend_numberWithLongLong_(MEMORY[0x24BDD16E0], v115, v114 + v112, v116, v117);
              v669 = (void *)objc_claimAutoreleasedReturnValue();
              if (v113 >= v96)
              {
                v675 = 0;
              }
              else
              {
                objc_msgSend_options(v633, v118, v119, v120, v121);
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                MaxLengthInSamplesToReserveForOutroSegment_withOptions = objc_msgSend__findMaxLengthInSamplesToReserveForOutroSegment_withOptions_(FlexSong, v123, (uint64_t)v51, (uint64_t)v122, v124);

                objc_msgSend_options(v633, v126, v127, v128, v129);
                v132 = (void *)objc_claimAutoreleasedReturnValue();
                if (MaxLengthInSamplesToReserveForOutroSegment_withOptions < 1)
                {
                  EarlyFadeStartOffsetInSamplesForOutroSegment_withOptions = objc_msgSend__findEarlyFadeStartOffsetInSamplesForOutroSegment_withOptions_(FlexSong, v130, (uint64_t)v51, (uint64_t)v132, v131);

                }
                else
                {
                  MinLengthInSamplesForEarlyFadeOutForOutroSegment_withOptions = objc_msgSend__findMinLengthInSamplesForEarlyFadeOutForOutroSegment_withOptions_(FlexSong, v130, (uint64_t)v51, (uint64_t)v132, v131);

                  v138 = objc_msgSend_offset(v661, v134, v135, v136, v137);
                  EarlyFadeStartOffsetInSamplesForOutroSegment_withOptions = v138
                                                                           - MinLengthInSamplesForEarlyFadeOutForOutroSegment_withOptions
                                                                           + objc_msgSend_duration(v661, v139, v140, v141, v142);
                }
                v172 = EarlyFadeStartOffsetInSamplesForOutroSegment_withOptions & ~(EarlyFadeStartOffsetInSamplesForOutroSegment_withOptions >> 63);
                objc_msgSend_numberWithLongLong_(MEMORY[0x24BDD16E0], v143, v172 + v114, v144, v145);
                v675 = (void *)objc_claimAutoreleasedReturnValue();
                self = v678;
                isEqualToString = v636;
                if (v112 >= v172)
                {
                  objc_msgSend_numberWithLongLong_(MEMORY[0x24BDD16E0], v173, v114, v174, v175);
                  v176 = objc_claimAutoreleasedReturnValue();

                  v669 = (void *)v176;
                }
              }
              v45 = v661;

            }
            else
            {
              v675 = 0;
              v669 = 0;
            }
            v651 = 0;
            v654 = 0;
            v665 = 0;
          }
          else
          {
            if (objc_msgSend_type(v51, v52, v53, v54, v55) != 2)
            {
              objc_msgSend_type(v51, v147, v148, v149, v150);
LABEL_108:
              v671 = 0;
              v675 = 0;
              v667 = 0;
              v669 = 0;
              v651 = 0;
              v654 = 0;
              v665 = 0;
              v177 = 0;
              goto LABEL_45;
            }
            if (isEqualToString)
            {
              objc_msgSend_nameIndex(v51, v147, v148, v149, v150);
              v151 = (void *)objc_claimAutoreleasedReturnValue();

              if (v151 == v645)
                goto LABEL_108;
              v153 = (void *)MEMORY[0x24BDD17C8];
              v154 = *(void **)(v42 + 1720);
              v155 = objc_msgSend_type(v51, v82, v152, v84, v85);
              objc_msgSend_longLabelForSegmentType_(v154, v156, v155, v157, v158);
              v159 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_nameIndex(v51, v160, v161, v162, v163);
              v164 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_stringWithFormat_(v153, v165, (uint64_t)CFSTR("%@ %@"), v166, v167, v159, v164);
              v671 = (id)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              objc_msgSend_name(v51, v147, v148, v149, v150);
              v671 = (id)objc_claimAutoreleasedReturnValue();
            }
            v285 = *(void **)(v42 + 1720);
            v286 = objc_msgSend_type(v51, v168, v169, v170, v171);
            objc_msgSend_longLabelForSegmentType_(v285, v287, v286, v288, v289);
            v667 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v290 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend_nameIndex(v51, v291, v292, v293, v294);
            v295 = (void *)objc_claimAutoreleasedReturnValue();
            v300 = objc_msgSend_intValue(v295, v296, v297, v298, v299);
            objc_msgSend_numberWithInt_(v290, v301, v300, v302, v303);
            v665 = (id)objc_claimAutoreleasedReturnValue();

            v304 = (void *)MEMORY[0x24BDD16E0];
            v45 = v661;
            v309 = objc_msgSend_barsUsed(v661, v305, v306, v307, v308);
            objc_msgSend_numberWithInteger_(v304, v310, v309, v311, v312);
            v654 = (void *)objc_claimAutoreleasedReturnValue();
            if ((isEqualToString & 1) != 0)
            {
              v675 = 0;
              v669 = 0;
              v651 = 0;
            }
            else
            {
              objc_msgSend_nameSuffix(v51, v82, v313, v84, v85);
              v651 = (void *)objc_claimAutoreleasedReturnValue();
              v675 = 0;
              v669 = 0;
            }
          }
          v177 = 1;
LABEL_45:
          objc_msgSend_metadataValueForKey_(v51, v82, (uint64_t)CFSTR("PeakValue"), v84, v85);
          v67 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_metadataValueForKey_(v51, v178, (uint64_t)CFSTR("Loudness"), v179, v180);
          v66 = (id)objc_claimAutoreleasedReturnValue();
          if (!v177)
          {
            v647 = 0;
            v649 = 0;
            goto LABEL_100;
          }
          if ((isEqualToString & 1) != 0)
          {
            v647 = 0;
            v649 = 0;
          }
          else
          {
            v181 = (void *)MEMORY[0x24BDD16E0];
            v182 = objc_msgSend_priority(v51, v62, v63, v64, v65);
            objc_msgSend_numberWithInteger_(v181, v183, v182, v184, v185);
            v649 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_analysisData(self, v186, v187, v188, v189);
            v190 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v190, v191, (uint64_t)CFSTR("energy"), v192, v193);
            v194 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKey_(v194, v195, (uint64_t)v671, v196, v197);
            v647 = (void *)objc_claimAutoreleasedReturnValue();

            v45 = v661;
          }
          v44 = v657;
LABEL_51:
          v198 = v40;
          if (v44)
            v198 = v40 - objc_msgSend_duration(v44, v62, v63, v64, v65);
          memset(&v715, 0, sizeof(v715));
          if (v45 == v637)
          {
            v203 = objc_msgSend_duration(v637, v62, v63, v64, v65);
            if (v44)
              v203 += objc_msgSend_duration(v44, v199, v200, v201, v202);
            v204 = objc_msgSend_sampleRate(self, v199, v200, v201, v202);
            CMTimeMake(&v715, v203, v204);
          }
          else
          {
            v715 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
          }
          memset(&v714, 0, sizeof(v714));
          v205 = objc_msgSend_sampleRate(self, v62, v63, v64, v65);
          CMTimeMake(&start, v198, v205);
          duration.start = v715;
          CMTimeRangeMake(&v714, &start, &duration.start);
          objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v206, v207, v208, v209);
          v210 = (void *)objc_claimAutoreleasedReturnValue();
          v214 = v210;
          if (isEqualToString)
          {
            if (v667)
              objc_msgSend_setObject_forKey_(v210, v211, (uint64_t)v667, (uint64_t)CFSTR("SectionType"), v213);
            if (v665)
              objc_msgSend_setObject_forKey_(v214, v211, (uint64_t)v665, (uint64_t)CFSTR("BodyNumber"), v213);
            if (v669)
              objc_msgSend_setObject_forKey_(v214, v211, (uint64_t)v669, (uint64_t)CFSTR("OutroStinger"), v213);
            if (v675)
              objc_msgSend_setObject_forKey_(v214, v211, (uint64_t)v675, (uint64_t)CFSTR("OutroEarlyFade"), v213);
          }
          else
          {
            if (v667)
              objc_msgSend_setObject_forKey_(v210, v211, (uint64_t)v667, (uint64_t)CFSTR("SegmentType"), v213);
            if (v649)
              objc_msgSend_setObject_forKey_(v214, v211, (uint64_t)v649, (uint64_t)CFSTR("Priority"), v213);
            if (v665)
              objc_msgSend_setObject_forKey_(v214, v211, (uint64_t)v665, (uint64_t)CFSTR("BodyNumber"), v213);
            if (v651)
              objc_msgSend_setObject_forKey_(v214, v211, (uint64_t)v651, (uint64_t)CFSTR("BodyLetter"), v213);
            if (v654)
              objc_msgSend_setObject_forKey_(v214, v211, (uint64_t)v654, (uint64_t)CFSTR("BarsUsed"), v213);
            if (v647)
              objc_msgSend_setObject_forKey_(v214, v211, (uint64_t)v647, (uint64_t)CFSTR("Energy"), v213);
            v215 = (uint64_t)v669;
            if (v669)
              objc_msgSend_setObject_forKey_(v214, v211, (uint64_t)v669, (uint64_t)CFSTR("OutroStinger"), v213);
            if (v675)
              objc_msgSend_setObject_forKey_(v214, v211, (uint64_t)v675, (uint64_t)CFSTR("OutroEarlyFade"), v213);
            if (v44)
            {
              objc_msgSend_segment(v44, v211, v215, v212, v213);
              v216 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_metadataValueForKey_(v216, v217, (uint64_t)CFSTR("PeakValue"), v218, v219);
              v220 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_segment(v44, v221, v222, v223, v224);
              v225 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_metadataValueForKey_(v225, v226, (uint64_t)CFSTR("Loudness"), v227, v228);
              v229 = (void *)objc_claimAutoreleasedReturnValue();

              if (v220)
              {
                if (v67)
                {
                  v234 = v67;
                  objc_msgSend_doubleValue(v220, v230, v231, v232, v233);
                  v236 = v235;
                  objc_msgSend_doubleValue(v67, v237, v238, v239, v240);
                  if (v236 > v241)
                  {
                    v67 = v220;

                  }
                }
                else
                {
                  v67 = v220;
                }
              }
              if (v229)
              {
                if (v66)
                {
                  objc_msgSend_doubleValue(v229, v230, v231, v232, v233);
                  v243 = v242;
                  v248 = objc_msgSend_duration(v657, v244, v245, v246, v247);
                  objc_msgSend_doubleValue(v66, v249, v250, v251, v252);
                  v254 = v253;
                  v259 = objc_msgSend_duration(v661, v255, v256, v257, v258);
                  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v260, v261, v262, v263, (v254 * (double)v259 + v243 * (double)v248) / (double)(v259 + v248));
                  v264 = objc_claimAutoreleasedReturnValue();

                  v66 = (id)v264;
                }
                else
                {
                  v66 = v229;
                }
              }

              isEqualToString = v636;
            }
            if (v67)
              objc_msgSend_setObject_forKey_(v214, v211, (uint64_t)v67, (uint64_t)CFSTR("PeakValue"), v213);
            if (v66)
              objc_msgSend_setObject_forKey_(v214, v211, (uint64_t)v66, (uint64_t)CFSTR("Loudness"), v213);
          }
          v265 = [FMTimedMetadataItem alloc];
          objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCE70], v266, (uint64_t)v214, v267, v268);
          v269 = (void *)objc_claimAutoreleasedReturnValue();
          duration = v714;
          v271 = (void *)objc_msgSend_initWithIdentifier_name_timeRange_values_(v265, v270, v644, (uint64_t)v671, (uint64_t)&duration, v269);

          objc_msgSend_addObject_(v679, v272, (uint64_t)v271, v273, v274);
          if (!v51)
          {

            v645 = 0;
            v280 = 0;
            v45 = v661;
            goto LABEL_105;
          }
          v45 = v661;
LABEL_100:
          objc_msgSend_nameIndex(v51, v62, v63, v64, v65);
          v275 = (id)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend_type(v51, v276, v277, v278, v279) == 5)
            v280 = v45;
          else
            v280 = 0;
          v645 = v275;
LABEL_105:
          v39 = v280;

          v40 += objc_msgSend_duration(v45, v281, v282, v283, v284);
          ++v43;
          v44 = v39;
          v42 = 0x24C5EF000;
        }
        while (v640 != v43);
        v33 = obj;
        v314 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v716, (uint64_t)v729, 16);
        v640 = v314;
        if (!v314)
        {

          v12 = v679;
          v315 = v637;
          v6 = (id)v644;
          goto LABEL_185;
        }
      }
    }
LABEL_184:
    v315 = v637;
LABEL_185:

    goto LABEL_186;
  }
  if (objc_msgSend_isEqualToString_(v6, v16, (uint64_t)CFSTR("FMTimedMetadataIdentifierBar"), v17, v18))
  {
    v710 = 0u;
    v711 = 0u;
    v708 = 0u;
    v709 = 0u;
    objc_msgSend_segments(v633, v317, v318, v319, v320);
    v315 = (void *)objc_claimAutoreleasedReturnValue();
    v655 = objc_msgSend_countByEnumeratingWithState_objects_count_(v315, v321, (uint64_t)&v708, (uint64_t)v728, 16);
    if (v655)
    {
      v33 = 0;
      v326 = 0;
      v652 = *(_QWORD *)v709;
      v638 = v315;
      while (1)
      {
        v327 = 0;
        v328 = v33;
        do
        {
          if (*(_QWORD *)v709 != v652)
            objc_enumerationMutation(v315);
          v676 = *(void **)(*((_QWORD *)&v708 + 1) + 8 * v327);
          objc_msgSend_segment(v676, v322, v323, v324, v325);
          v333 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v333)
          {
            v345 = 0;
            goto LABEL_146;
          }
          v662 = v327;
          v334 = v326;
          if (v328)
            v334 = v326 - objc_msgSend_duration(v328, v329, v330, v331, v332);
          v658 = v328;
          v335 = objc_msgSend_duration(v676, v329, v330, v331, v332);
          if (objc_msgSend_type(v333, v336, v337, v338, v339) == 2
            || objc_msgSend_type(v333, v340, v341, v342, v343) == 3
            || objc_msgSend_type(v333, v340, v341, v342, v343) == 4)
          {
            if (objc_msgSend_type(v333, v340, v341, v342, v343) == 4)
            {
              v344 = 1;
LABEL_132:
              v346 = 0;
              v347 = 0;
              v672 = v334;
              do
              {
                v348 = objc_msgSend_offset(v676, v340, v341, v342, v343);
                if (objc_msgSend_type(v333, v349, v350, v351, v352) == 4)
                  v357 = 1;
                else
                  v357 = objc_msgSend_beatsPerBar(v333, v353, v354, v355, v356);
                v358 = v347 - v348;
                v359 = v347 - v348 + v326;
                if (v359 >= v334 && v358 < v335)
                {
                  memset(&v714, 0, sizeof(v714));
                  v361 = objc_msgSend_sampleRate(v678, v353, v354, v355, v356);
                  CMTimeMake(&v707, v359, v361);
                  *(_OWORD *)&duration.start.value = *MEMORY[0x24BDC0D88];
                  duration.start.epoch = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
                  CMTimeRangeMake(&v714, &v707, &duration.start);
                  v362 = (void *)MEMORY[0x24BDD17C8];
                  objc_msgSend_name(v333, v363, v364, v365, v366);
                  v367 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_stringWithFormat_(v362, v368, (uint64_t)CFSTR("%@ BarIndex %d"), v369, v370, v367, v346);
                  v371 = (void *)objc_claimAutoreleasedReturnValue();

                  v726[0] = CFSTR("BarIndex");
                  v372 = v335;
                  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v373, v346, v374, v375);
                  v376 = (void *)objc_claimAutoreleasedReturnValue();
                  v727[0] = v376;
                  v726[1] = CFSTR("BeatsPerBar");
                  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v377, v357, v378, v379);
                  v380 = (void *)objc_claimAutoreleasedReturnValue();
                  v727[1] = v380;
                  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v381, (uint64_t)v727, (uint64_t)v726, 2);
                  v382 = v326;
                  v383 = (void *)objc_claimAutoreleasedReturnValue();

                  v384 = [FMTimedMetadataItem alloc];
                  duration = v714;
                  v386 = (void *)objc_msgSend_initWithIdentifier_name_timeRange_values_(v384, v385, (uint64_t)CFSTR("FMTimedMetadataIdentifierBar"), (uint64_t)v371, (uint64_t)&duration, v383);
                  objc_msgSend_addObject_(v679, v387, (uint64_t)v386, v388, v389);

                  v334 = v672;
                  v326 = v382;
                  v335 = v372;

                }
                v347 += objc_msgSend_barDurationForBarIndex_(v333, v353, v346++, v355, v356);
              }
              while (v344 != v346);
              goto LABEL_143;
            }
            v344 = objc_msgSend_bars(v333, v340, v341, v342, v343);
            if (v344 >= 1)
              goto LABEL_132;
          }
LABEL_143:
          v390 = objc_msgSend_type(v333, v340, v341, v342, v343);
          v345 = v676;
          if (v390 != 5)
            v345 = 0;
          v6 = (id)v644;
          v315 = v638;
          v328 = v658;
          v327 = v662;
LABEL_146:
          v33 = v345;

          v326 += objc_msgSend_duration(v676, v391, v392, v393, v394);
          ++v327;
          v328 = v33;
        }
        while (v327 != v655);
        v655 = objc_msgSend_countByEnumeratingWithState_objects_count_(v315, v322, (uint64_t)&v708, (uint64_t)v728, 16);
        if (!v655)
        {
          v12 = v679;
          goto LABEL_185;
        }
      }
    }
LABEL_186:

    goto LABEL_187;
  }
  if (objc_msgSend_isEqualToString_(v6, v317, (uint64_t)CFSTR("FMTimedMetadataIdentifierBeat"), v319, v320))
  {
    v705 = 0u;
    v706 = 0u;
    v703 = 0u;
    v704 = 0u;
    objc_msgSend_segments(v633, v395, v396, v397, v398);
    v637 = (id)objc_claimAutoreleasedReturnValue();
    v642 = objc_msgSend_countByEnumeratingWithState_objects_count_(v637, v399, (uint64_t)&v703, (uint64_t)v725, 16);
    if (v642)
    {
      v33 = 0;
      v404 = 0;
      v641 = *(_QWORD *)v704;
      while (1)
      {
        v405 = 0;
        v406 = v33;
        do
        {
          if (*(_QWORD *)v704 != v641)
            objc_enumerationMutation(v637);
          v407 = *(void **)(*((_QWORD *)&v703 + 1) + 8 * v405);
          objc_msgSend_segment(v407, v400, v401, v402, v403);
          v408 = (void *)objc_claimAutoreleasedReturnValue();
          v413 = v408;
          if (v408)
          {
            v646 = v406;
            v643 = v405;
            v418 = v408;
            if (objc_msgSend_beatsPerBar(v408, v409, v410, v411, v412) >= 1)
            {
              v419 = v404;
              if (v646)
                v419 = v404 - objc_msgSend_duration(v646, v414, v415, v416, v417);
              v420 = objc_msgSend_duration(v407, v414, v415, v416, v417);
              if (objc_msgSend_type(v413, v421, v422, v423, v424) == 2
                || objc_msgSend_type(v413, v414, v415, v416, v417) == 3
                || objc_msgSend_type(v413, v414, v415, v416, v417) == 4)
              {
                if (objc_msgSend_type(v413, v414, v415, v416, v417) == 4)
                {
                  v653 = 1;
LABEL_166:
                  v426 = 0;
                  v427 = 0;
                  v677 = v420 + v404;
                  v648 = v407;
                  v650 = v404;
                  while (2)
                  {
                    v428 = objc_msgSend_offset(v407, v414, v415, v416, v417);
                    if (objc_msgSend_type(v418, v429, v430, v431, v432) == 4)
                    {
                      v437 = objc_msgSend_barDurationForBarIndex_(v418, v433, v426, v435, v436);
                      v656 = v437;
                      v438 = 1;
LABEL_171:
                      v443 = 0;
                      v659 = v427;
                      v663 = v426;
                      v444 = v427 + v404 - v428;
                      v673 = v426;
                      do
                      {
                        if (v444 >= v419 && v444 < v677)
                        {
                          memset(&v714, 0, sizeof(v714));
                          v445 = v437;
                          v446 = objc_msgSend_sampleRate(self, v414, v415, v416, v417);
                          CMTimeMake(&v702, v444, v446);
                          *(_OWORD *)&duration.start.value = *MEMORY[0x24BDC0D88];
                          duration.start.epoch = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
                          CMTimeRangeMake(&v714, &v702, &duration.start);
                          v447 = (void *)MEMORY[0x24BDD17C8];
                          objc_msgSend_name(v418, v448, v449, v450, v451);
                          v452 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_stringWithFormat_(v447, v453, (uint64_t)CFSTR("%@ BarIndex %d BeatIndex %d"), v454, v455, v452, v673, v443, v632);
                          v456 = (void *)objc_claimAutoreleasedReturnValue();

                          v723[0] = CFSTR("BarIndex");
                          v457 = v419;
                          v458 = v418;
                          objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v459, v673, v460, v461);
                          v462 = (void *)objc_claimAutoreleasedReturnValue();
                          v724[0] = v462;
                          v723[1] = CFSTR("BeatIndex");
                          objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v463, v443, v464, v465);
                          v466 = (void *)objc_claimAutoreleasedReturnValue();
                          v724[1] = v466;
                          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v467, (uint64_t)v724, (uint64_t)v723, 2);
                          v468 = (void *)objc_claimAutoreleasedReturnValue();

                          v12 = v679;
                          v469 = [FMTimedMetadataItem alloc];
                          duration = v714;
                          v471 = (void *)objc_msgSend_initWithIdentifier_name_timeRange_values_(v469, v470, (uint64_t)CFSTR("FMTimedMetadataIdentifierBeat"), (uint64_t)v456, (uint64_t)&duration, v468);
                          objc_msgSend_addObject_(v679, v472, (uint64_t)v471, v473, v474);

                          self = v678;
                          v418 = v458;
                          v419 = v457;

                          v437 = v445;
                        }
                        ++v443;
                        v444 += v437;
                      }
                      while (v438 != v443);
                      v407 = v648;
                      v404 = v650;
                      v427 = v659;
                      v426 = v663;
                      v442 = v656;
                    }
                    else
                    {
                      v438 = objc_msgSend_beatsPerBar(v418, v433, v434, v435, v436);
                      v442 = objc_msgSend_barDurationForBarIndex_(v418, v439, v426, v440, v441);
                      if (v438 >= 1)
                      {
                        v656 = v442;
                        v437 = v442 / v438;
                        goto LABEL_171;
                      }
                    }
                    v427 += v442;
                    if (++v426 == v653)
                      goto LABEL_178;
                    continue;
                  }
                }
                v653 = objc_msgSend_bars(v413, v414, v415, v416, v417);
                if (v653 >= 1)
                  goto LABEL_166;
              }
            }
LABEL_178:
            if (objc_msgSend_type(v418, v414, v415, v416, v417) == 5)
              v425 = v407;
            else
              v425 = 0;
            v413 = v418;
            v405 = v643;
            v6 = (id)v644;
            v406 = v646;
          }
          else
          {
            v425 = 0;
          }
          v33 = v425;

          v404 += objc_msgSend_duration(v407, v475, v476, v477, v478);
          ++v405;
          v406 = v33;
        }
        while (v405 != v642);
        v642 = objc_msgSend_countByEnumeratingWithState_objects_count_(v637, v400, (uint64_t)&v703, (uint64_t)v725, 16);
        if (!v642)
          goto LABEL_184;
      }
    }
    v315 = v637;
    goto LABEL_186;
  }
LABEL_187:
  if (objc_msgSend_isEqualToString_(v6, v395, (uint64_t)CFSTR("FMTimedMetadataIdentifierOnset"), v397, v398))
  {
    v700 = 0u;
    v701 = 0u;
    v698 = 0u;
    v699 = 0u;
    objc_msgSend_segments(v633, v479, v480, v481, v482);
    v666 = (id)objc_claimAutoreleasedReturnValue();
    v484 = objc_msgSend_countByEnumeratingWithState_objects_count_(v666, v483, (uint64_t)&v698, (uint64_t)v722, 16);
    if (v484)
    {
      v489 = v484;
      v490 = 0;
      v491 = *(_QWORD *)v699;
      v492 = MEMORY[0x24BDC0D88];
      v493 = MEMORY[0x24BDBD1B8];
      v660 = *(_QWORD *)v699;
      do
      {
        v494 = 0;
        v664 = v489;
        do
        {
          if (*(_QWORD *)v699 != v491)
            objc_enumerationMutation(v666);
          v674 = *(void **)(*((_QWORD *)&v698 + 1) + 8 * v494);
          objc_msgSend_segment(v674, v485, v486, v487, v488);
          v495 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_type(v495, v496, v497, v498, v499) == 2)
          {
            v670 = v494;
            objc_msgSend_objectForKeyedSubscript_(v678->_analysisData, v500, (uint64_t)CFSTR("onsets"), v502, v503);
            v504 = (void *)objc_claimAutoreleasedReturnValue();
            v668 = v495;
            objc_msgSend_name(v495, v505, v506, v507, v508);
            v509 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKey_(v504, v510, (uint64_t)v509, v511, v512);
            v513 = (void *)objc_claimAutoreleasedReturnValue();

            v696 = 0u;
            v697 = 0u;
            v694 = 0u;
            v695 = 0u;
            v514 = v513;
            v516 = objc_msgSend_countByEnumeratingWithState_objects_count_(v514, v515, (uint64_t)&v694, (uint64_t)v721, 16);
            if (v516)
            {
              v521 = v516;
              v522 = *(_QWORD *)v695;
              do
              {
                for (i = 0; i != v521; ++i)
                {
                  if (*(_QWORD *)v695 != v522)
                    objc_enumerationMutation(v514);
                  v524 = *(void **)(*((_QWORD *)&v694 + 1) + 8 * i);
                  memset(&v715, 0, sizeof(v715));
                  v525 = objc_msgSend_sampleRate(v678, v517, v518, v519, v520);
                  CMTimeMake(&v715, v490, v525);
                  v714.start = v715;
                  Seconds = CMTimeGetSeconds(&v714.start);
                  objc_msgSend_floatValue(v524, v527, v528, v529, v530);
                  memset(&v714, 0, sizeof(v714));
                  v532 = (float)(v531 + Seconds);
                  v537 = objc_msgSend_sampleRate(v678, v533, v534, v535, v536);
                  CMTimeMakeWithSeconds(&v693, v532, v537);
                  *(_OWORD *)&duration.start.value = *(_OWORD *)v492;
                  duration.start.epoch = *(_QWORD *)(v492 + 16);
                  CMTimeRangeMake(&v714, &v693, &duration.start);
                  v538 = [FMTimedMetadataItem alloc];
                  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v539, (uint64_t)CFSTR("onset @ %f"), v540, v541, *(_QWORD *)&v532);
                  v542 = (void *)objc_claimAutoreleasedReturnValue();
                  duration = v714;
                  v544 = (void *)objc_msgSend_initWithIdentifier_name_timeRange_values_(v538, v543, (uint64_t)CFSTR("FMTimedMetadataIdentifierOnset"), (uint64_t)v542, (uint64_t)&duration, v493);

                  v12 = v679;
                  objc_msgSend_addObject_(v679, v545, (uint64_t)v544, v546, v547);

                }
                v521 = objc_msgSend_countByEnumeratingWithState_objects_count_(v514, v517, (uint64_t)&v694, (uint64_t)v721, 16);
              }
              while (v521);
            }

            v6 = (id)v644;
            v491 = v660;
            v489 = v664;
            v495 = v668;
            v494 = v670;
          }
          v490 += objc_msgSend_duration(v674, v500, v501, v502, v503);

          ++v494;
        }
        while (v494 != v489);
        v489 = objc_msgSend_countByEnumeratingWithState_objects_count_(v666, v485, (uint64_t)&v698, (uint64_t)v722, 16);
      }
      while (v489);
    }

  }
  else if (objc_msgSend_isEqualToString_(v6, v479, (uint64_t)CFSTR("FMTimedMetadataIdentifierLoopPoints"), v481, v482))
  {
    v691 = 0u;
    v692 = 0u;
    v689 = 0u;
    v690 = 0u;
    objc_msgSend_segments(v633, v548, v549, v550, v551);
    v552 = (void *)objc_claimAutoreleasedReturnValue();
    v554 = objc_msgSend_countByEnumeratingWithState_objects_count_(v552, v553, (uint64_t)&v689, (uint64_t)v720, 16);
    if (v554)
    {
      v559 = v554;
      v560 = 0;
      v561 = *(_QWORD *)v690;
      v562 = MEMORY[0x24BDC0D88];
      do
      {
        for (j = 0; j != v559; ++j)
        {
          if (*(_QWORD *)v690 != v561)
            objc_enumerationMutation(v552);
          v564 = *(void **)(*((_QWORD *)&v689 + 1) + 8 * j);
          objc_msgSend_segment(v564, v555, v556, v557, v558);
          v565 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_type(v565, v566, v567, v568, v569) == 4)
          {
            memset(&v715, 0, sizeof(v715));
            v574 = objc_msgSend_duration(v564, v570, v571, v572, v573);
            v579 = objc_msgSend_sampleRate(v678, v575, v576, v577, v578);
            CMTimeMake(&v715, v574, v579);
            memset(&v688, 0, sizeof(v688));
            v584 = objc_msgSend_sampleRate(v678, v580, v581, v582, v583);
            CMTimeMake(&v688, v560, v584);
            memset(&v687, 0, sizeof(v687));
            v714.start = v688;
            duration.start = v715;
            CMTimeAdd(&v687, &v714.start, &duration.start);
            v714.start = v687;
            v585 = CMTimeGetSeconds(&v714.start);
            memset(&v714, 0, sizeof(v714));
            v586 = v585;
            v591 = objc_msgSend_sampleRate(v678, v587, v588, v589, v590);
            CMTimeMakeWithSeconds(&v686, v586, v591);
            *(_OWORD *)&duration.start.value = *(_OWORD *)v562;
            duration.start.epoch = *(_QWORD *)(v562 + 16);
            CMTimeRangeMake(&v714, &v686, &duration.start);
            v592 = [FMTimedMetadataItem alloc];
            objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v593, (uint64_t)CFSTR("loop point @ %f"), v594, v595, *(_QWORD *)&v586);
            v596 = (void *)objc_claimAutoreleasedReturnValue();
            duration = v714;
            v598 = (void *)objc_msgSend_initWithIdentifier_name_timeRange_values_(v592, v597, (uint64_t)CFSTR("FMTimedMetadataIdentifierOnset"), (uint64_t)v596, (uint64_t)&duration, MEMORY[0x24BDBD1B8]);

            v12 = v679;
            objc_msgSend_addObject_(v679, v599, (uint64_t)v598, v600, v601);

          }
          v560 += objc_msgSend_duration(v564, v570, v571, v572, v573);

        }
        v559 = objc_msgSend_countByEnumeratingWithState_objects_count_(v552, v555, (uint64_t)&v689, (uint64_t)v720, 16);
      }
      while (v559);
    }

    objc_msgSend_removeLastObject(v12, v602, v603, v604, v605);
    v6 = (id)v644;
  }
  if (objc_msgSend_count(v12, v548, v549, v550, v551) && objc_msgSend_count(v12, v606, v607, v608, v609) != 1)
  {
    v613 = 0;
    do
    {
      objc_msgSend_objectAtIndex_(v12, v610, v613, v611, v612);
      v614 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v12, v615, ++v613, v616, v617);
      v618 = (void *)objc_claimAutoreleasedReturnValue();
      v623 = v618;
      memset(&v714, 0, 24);
      if (v618)
      {
        objc_msgSend_timeRange(v618, v619, v620, v621, v622);
      }
      else
      {
        v683 = 0u;
        v684 = 0u;
        v682 = 0u;
      }
      *(_OWORD *)&lhs.value = v682;
      lhs.epoch = v683;
      if (v614)
        objc_msgSend_timeRange(v614, v619, v620, v621, v622);
      else
        memset(&v680, 0, sizeof(v680));
      rhs = v680;
      CMTimeSubtract(&v714.start, &lhs, &rhs);
      *(_OWORD *)&duration.start.value = *(_OWORD *)&v714.start.value;
      duration.start.epoch = v714.start.epoch;
      objc_msgSend_adjustDurationTo_(v614, v624, (uint64_t)&duration, v625, v626);

    }
    while (v613 < objc_msgSend_count(v12, v627, v628, v629, v630) - 1);
  }
  v316 = v12;

LABEL_227:
  return v316;
}

+ (id)loadSongInFolderWithPath:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  int isDirectory;
  int v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  unsigned __int8 v19;

  v7 = a3;
  if (!v7
    || ((v19 = 0,
         objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v3, v4, v5, v6),
         v8 = (void *)objc_claimAutoreleasedReturnValue(),
         isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v8, v9, (uint64_t)v7, (uint64_t)&v19, v10),
         v12 = v19,
         v8,
         isDirectory)
      ? (v16 = v12 == 0)
      : (v16 = 1),
        v16))
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend_songAtPath_(FlexSongMetaDataReader_V2, v13, (uint64_t)v7, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (NSArray)crossFadeSegments
{
  uint64_t v2;
  uint64_t v3;

  return (NSArray *)objc_msgSend__segmentsforType_(self, a2, 5, v2, v3);
}

- (NSArray)introSegments
{
  uint64_t v2;
  uint64_t v3;

  return (NSArray *)objc_msgSend__segmentsforType_(self, a2, 1, v2, v3);
}

- (NSArray)outroSegments
{
  uint64_t v2;
  uint64_t v3;

  return (NSArray *)objc_msgSend__segmentsforType_(self, a2, 4, v2, v3);
}

- (NSArray)transSegments
{
  uint64_t v2;
  uint64_t v3;

  return (NSArray *)objc_msgSend__segmentsforType_(self, a2, 3, v2, v3);
}

- (NSString)audioFileExtension
{
  return self->_audioFileExtension;
}

- (FlexSongAssetProviderProtocol)assetProvider
{
  return self->_assetProvider;
}

- (NSArray)bodySegments
{
  return self->_bodySegments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodySegments, 0);
  objc_storeStrong((id *)&self->_assetProvider, 0);
  objc_storeStrong((id *)&self->_audioFileExtension, 0);
  objc_storeStrong((id *)&self->_segmentCache, 0);
  objc_storeStrong((id *)&self->_analysisData, 0);
}

@end
