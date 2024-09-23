@implementation FlexMLSong

+ (id)loadSongAtPath:(id)a3
{
  id v3;
  FlexMLSong *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = [FlexMLSong alloc];
  v8 = (void *)objc_msgSend_initWithFileAtPath_(v4, v5, (uint64_t)v3, v6, v7);

  return v8;
}

- (FlexMLSong)initWithFileAtPath:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  FlexMLSong *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  char isEqualToString;
  void *v30;
  const char *v31;
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
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
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
  const char *v75;
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
  uint64_t v86;
  char *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void **v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  void *v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  char v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  _BOOL8 v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  FMSongAsset *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  id v161;
  void *v162;
  objc_super v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  id v168;
  void *v169;
  _BYTE v170[128];
  uint64_t v171;

  v171 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = 0;
  objc_msgSend_contentsOfDirectoryAtPath_error_(v10, v11, (uint64_t)v5, (uint64_t)&v168, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v168;

  v166 = 0u;
  v167 = 0u;
  v164 = 0u;
  v165 = 0u;
  v15 = v13;
  v21 = (FlexMLSong *)objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v164, (uint64_t)v170, 16);
  if (v21)
  {
    v161 = v14;
    v162 = v5;
    v22 = *(_QWORD *)v165;
LABEL_3:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v165 != v22)
        objc_enumerationMutation(v15);
      v24 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * v23);
      objc_msgSend_pathExtension(v24, v17, v18, v19, v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v25, v26, (uint64_t)CFSTR("metadata"), v27, v28);

      if ((isEqualToString & 1) != 0)
        break;
      if (v21 == (FlexMLSong *)++v23)
      {
        v21 = (FlexMLSong *)objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v164, (uint64_t)v170, 16);
        if (v21)
          goto LABEL_3;
        v30 = v15;
        v14 = v161;
        v5 = v162;
        goto LABEL_32;
      }
    }
    v5 = v162;
    objc_msgSend_stringByAppendingPathComponent_(v162, v17, (uint64_t)v24, v19, v20);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      v21 = 0;
      v14 = v161;
      goto LABEL_33;
    }
    objc_storeStrong((id *)&self->_rootPath, a3);
    objc_storeStrong((id *)&self->_metadataPath, v30);
    objc_msgSend_dictionaryWithContentsOfFile_(MEMORY[0x24BDBCED8], v31, (uint64_t)v30, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v34, v35, (uint64_t)CFSTR("plistRuntimeVersion"), v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend_integerValue(v38, v39, v40, v41, v42);

    if ((unint64_t)(v43 - 1) > 1)
    {
      v21 = 0;
      v14 = v161;
LABEL_31:

      goto LABEL_32;
    }
    objc_msgSend_objectForKey_(v34, v44, (uint64_t)CFSTR("uuid"), v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v34, v48, (uint64_t)CFSTR("songName"), v49, v50);
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v34, v51, (uint64_t)CFSTR("artistName"), v52, v53);
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend_objectForKey_(v34, v55, (uint64_t)CFSTR("tagIDs"), v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v54, v59, (uint64_t)v58, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectForKey_(v34, v63, (uint64_t)CFSTR("customOptions"), v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_set(MEMORY[0x24BDBCF20], v67, v68, v69, v70);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionary(MEMORY[0x24BDBCE70], v71, v72, v73, v74);
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v34, v75, (uint64_t)CFSTR("sampleRate"), v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v34, v79, (uint64_t)CFSTR("audioEncoderPresetName"), v80, v81);
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = v78;
    if (v78)
      v86 = objc_msgSend_integerValue(v78, v82, v83, v84, v85);
    else
      v86 = 44100;
    v163.receiver = self;
    v163.super_class = (Class)FlexMLSong;
    v87 = -[FlexSongBackend initWithUID:songName:artistName:tagIDs:keywords:weightedKeywords:hidden:recalled:audioEncoderPresetName:metadataVersion:songFormat:sampleRate:customOptions:](&v163, sel_initWithUID_songName_artistName_tagIDs_keywords_weightedKeywords_hidden_recalled_audioEncoderPresetName_metadataVersion_songFormat_sampleRate_customOptions_, v47, v160, v159, v62, v158, v157, 0, v156, 0, CFSTR("ML"), v86, v66);
    v91 = (void **)v87;
    v14 = v161;
    if (!v87)
    {
LABEL_30:
      self = v91;

      v21 = self;
      goto LABEL_31;
    }
    v152 = v66;
    v153 = v62;
    v92 = MEMORY[0x24BDC0D40];
    *(_OWORD *)(v87 + 136) = *MEMORY[0x24BDC0D40];
    *((_QWORD *)v87 + 19) = *(_QWORD *)(v92 + 16);
    objc_msgSend_objectForKey_(v34, v88, (uint64_t)CFSTR("audioFileExtension"), v89, v90);
    v93 = objc_claimAutoreleasedReturnValue();
    v94 = v91[16];
    v91[16] = (void *)v93;

    objc_msgSend_objectForKey_(v34, v95, (uint64_t)CFSTR("songFile"), v96, v97);
    v98 = objc_claimAutoreleasedReturnValue();
    v102 = 0x24BDBC000uLL;
    v154 = v47;
    v151 = (void *)v98;
    if (v98)
    {
      v103 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend_stringByAppendingPathComponent_(v91[14], v99, v98, v100, v101);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_fileURLWithPath_(v103, v105, (uint64_t)v104, v106, v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v109, v110, v111, v112);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_path(v108, v114, v115, v116, v117);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = objc_msgSend_fileExistsAtPath_(v113, v119, (uint64_t)v118, v120, v121);

      if ((v122 & 1) == 0)
      {

        v108 = 0;
      }
      v102 = 0x24BDBC000;
    }
    else
    {
      v108 = 0;
    }
    objc_msgSend_objectForKey_(v34, v99, (uint64_t)CFSTR("contentVersion"), v100, v101);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v34, v124, (uint64_t)CFSTR("compatibilityVersion"), v125, v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = [FMSongAsset alloc];
    v150 = v108;
    v128 = v108 == 0;
    objc_msgSend_fileURLWithPath_(*(void **)(v102 + 3912), v129, (uint64_t)v91[14], v130, v131);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    if (v123)
    {
      v137 = objc_msgSend_integerValue(v123, v132, v133, v134, v135);
      if (v127)
      {
LABEL_26:
        v138 = objc_msgSend_integerValue(v127, v132, v133, v134, v135);
        v140 = objc_msgSend_initWithAssetID_assetStatus_localURL_contentVersion_compatibilityVersion_(v149, v139, (uint64_t)CFSTR("FMSongBundleAssetID"), v128, (uint64_t)v136, v137, v138);
LABEL_29:
        v141 = (void *)v140;

        v169 = v141;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v142, (uint64_t)&v169, 1, v143);
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__setupInitialAssets_(v91, v145, (uint64_t)v144, v146, v147);

        v5 = v162;
        v62 = v153;
        v47 = v154;
        v66 = v152;
        goto LABEL_30;
      }
    }
    else
    {
      v123 = 0;
      v137 = 1;
      if (v127)
        goto LABEL_26;
    }
    v140 = objc_msgSend_initWithAssetID_assetStatus_localURL_contentVersion_compatibilityVersion_(v149, v132, (uint64_t)CFSTR("FMSongBundleAssetID"), v128, (uint64_t)v136, v137, 4);
    goto LABEL_29;
  }
  v30 = v15;
LABEL_32:

LABEL_33:
  return v21;
}

- (BOOL)canPlay
{
  return 1;
}

- (BOOL)isLoaded
{
  return 1;
}

- (id)_summaryManager
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  FlexMLSummaryManager *v14;
  NSString *rootPath;
  NSString *metadataPath;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;

  objc_msgSend_dictionaryWithContentsOfFile_(MEMORY[0x24BDBCED8], a2, (uint64_t)self->_metadataPath, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v5, v6, (uint64_t)CFSTR("sampleRate"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v5, v10, (uint64_t)CFSTR("summaryMapping"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [FlexMLSummaryManager alloc];
  rootPath = self->_rootPath;
  metadataPath = self->_metadataPath;
  v21 = objc_msgSend_integerValue(v9, v17, v18, v19, v20);
  v23 = (void *)objc_msgSend_initWithSummaryMapping_bundlePath_metadataPath_targetTimeScale_(v14, v22, (uint64_t)v13, (uint64_t)rootPath, (uint64_t)metadataPath, v21);

  return v23;
}

- (id)renditionForDuration:(id *)a3 withOptions:(id)a4 testingContext:(id)a5
{
  id v7;
  NSObject *v8;
  Float64 Seconds;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  FlexMLSongRendition *v19;
  const char *v20;
  void *v21;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  FlexLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v23 = *a3;
    Seconds = CMTimeGetSeconds((CMTime *)&v23);
    LODWORD(v23.var0) = 134217984;
    *(Float64 *)((char *)&v23.var0 + 4) = Seconds;
    _os_log_impl(&dword_20D016000, v8, OS_LOG_TYPE_DEFAULT, "flex: Requesting ML format rendition for duration %.2f", (uint8_t *)&v23, 0xCu);
  }

  objc_msgSend__summaryManager(self, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *a3;
  objc_msgSend_summaryForDuration_(v14, v15, (uint64_t)&v23, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = [FlexMLSongRendition alloc];
  v23 = *a3;
  v21 = (void *)objc_msgSend_initWithSong_options_andSummary_forDuration_(v19, v20, (uint64_t)self, (uint64_t)v7, (uint64_t)v18, &v23);

  return v21;
}

- (id)timedMetadataItemsWithIdentifier:(id)a3 forRendition:(id)a4
{
  id v5;
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
  const char *v27;
  uint64_t v28;
  uint64_t v29;
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
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  int v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t i;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  double v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  double v115;
  double v116;
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
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  CMTimeEpoch v135;
  uint64_t v136;
  uint64_t j;
  void *v138;
  double v139;
  Float64 v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  int32_t v145;
  FMTimedMetadataItem *v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  __int128 *v175;
  double v176;
  void *v177;
  FMTimedMetadataItem *v178;
  const char *v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  id v184;
  const char *v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  CMTimeEpoch v193;
  uint64_t k;
  void *v195;
  Float64 v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  int isEqualToNumber;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  double v211;
  double v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  double v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  const char *v223;
  void *v224;
  FMTimedMetadataItem *v225;
  const char *v226;
  void *v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
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
  void *v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  char isEqualToString;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  void *v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  Float64 v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  void *v268;
  double v269;
  double v270;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  double v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  const char *v281;
  void *v282;
  FMTimedMetadataItem *v283;
  const char *v284;
  void *v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  int64_t v293;
  const char *v294;
  void *v295;
  FMTimedMetadataItem *v296;
  const char *v297;
  void *v298;
  const char *v299;
  uint64_t v300;
  uint64_t v301;
  double v302;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
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
  id v316;
  const char *v317;
  const char *v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  unint64_t v322;
  void *m;
  void *v324;
  void *v325;
  const char *v326;
  uint64_t v327;
  uint64_t v328;
  char v329;
  const char *v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  const char *v335;
  uint64_t v336;
  uint64_t v337;
  void *v338;
  const char *v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  const char *v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  void *v347;
  uint64_t v348;
  void *v349;
  const char *v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  double v354;
  double v355;
  const char *v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  double v360;
  double v361;
  Float64 v362;
  const char *v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  void *v367;
  const char *v368;
  uint64_t v369;
  uint64_t v370;
  int v371;
  const char *v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  double v376;
  void *v377;
  double v378;
  double v379;
  const char *v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  double v384;
  const char *v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  double v390;
  const char *v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  void *v395;
  const char *v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  void *v400;
  const char *v401;
  uint64_t v402;
  uint64_t v403;
  void *v404;
  const char *v405;
  void *v406;
  const char *v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  const char *v411;
  uint64_t v412;
  uint64_t v413;
  const char *v414;
  const char *v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  const char *v419;
  uint64_t v420;
  uint64_t v421;
  const char *v422;
  FMTimedMetadataItem *v423;
  const char *v424;
  void *v425;
  const char *v426;
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
  int64_t v437;
  const char *v438;
  void *v439;
  FMTimedMetadataItem *v440;
  const char *v441;
  void *v442;
  const char *v443;
  uint64_t v444;
  uint64_t v445;
  void *v446;
  const char *v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  unint64_t v451;
  const char *v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
  void *v457;
  const char *v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  void *v462;
  const char *v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  const char *v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  const char *v471;
  uint64_t v472;
  void *v473;
  double v474;
  void *v475;
  const char *v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  const char *v480;
  const char *v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  uint64_t v485;
  uint64_t v486;
  void *v487;
  void *v488;
  const char *v489;
  uint64_t v490;
  uint64_t v491;
  const char *v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t v495;
  uint64_t v496;
  const char *v497;
  uint64_t v498;
  uint64_t v499;
  void *v500;
  const char *v501;
  uint64_t v502;
  uint64_t v503;
  uint64_t v504;
  uint64_t v505;
  void *v506;
  double v507;
  double v508;
  const char *v509;
  uint64_t v510;
  uint64_t v511;
  uint64_t v512;
  const char *v513;
  uint64_t v514;
  uint64_t v515;
  uint64_t v516;
  double v517;
  void *v518;
  const char *v519;
  uint64_t v520;
  uint64_t v521;
  uint64_t v522;
  void *v523;
  const char *v524;
  uint64_t v525;
  uint64_t v526;
  const char *v527;
  uint64_t v528;
  uint64_t v529;
  void *v530;
  const char *v531;
  uint64_t v532;
  uint64_t v533;
  void *v534;
  const char *v535;
  uint64_t v536;
  uint64_t v537;
  const char *v538;
  uint64_t v539;
  uint64_t v540;
  uint64_t v541;
  uint64_t v542;
  const char *v543;
  uint64_t v544;
  uint64_t v545;
  void *v546;
  const char *v547;
  uint64_t v548;
  uint64_t v549;
  void *v550;
  const char *v551;
  id v552;
  const char *v553;
  uint64_t v554;
  uint64_t v555;
  uint64_t v556;
  Float64 v557;
  FMTimedMetadataItem *v558;
  const char *v559;
  void *v560;
  const char *v561;
  uint64_t v562;
  uint64_t v563;
  const char *v564;
  uint64_t v565;
  const char *v566;
  uint64_t v567;
  uint64_t v568;
  uint64_t v569;
  uint64_t v570;
  uint64_t v571;
  uint64_t n;
  void *v573;
  void *v574;
  const char *v575;
  uint64_t v576;
  uint64_t v577;
  void *v578;
  const char *v579;
  void *v580;
  const char *v581;
  uint64_t v582;
  uint64_t v583;
  uint64_t v584;
  Float64 v585;
  FMTimedMetadataItem *v586;
  const char *v587;
  void *v588;
  const char *v589;
  uint64_t v590;
  uint64_t v591;
  uint64_t v592;
  uint64_t v593;
  const char *v594;
  uint64_t v595;
  uint64_t v596;
  uint64_t v597;
  const char *v598;
  uint64_t v599;
  uint64_t v600;
  uint64_t v601;
  unint64_t v602;
  void *v603;
  const char *v604;
  uint64_t v605;
  uint64_t v606;
  void *v607;
  const char *v608;
  uint64_t v609;
  uint64_t v610;
  uint64_t v611;
  void *v612;
  const char *v613;
  uint64_t v614;
  uint64_t v615;
  const char *v616;
  uint64_t v617;
  uint64_t v618;
  uint64_t v619;
  void *v620;
  const char *v621;
  uint64_t v622;
  uint64_t v623;
  uint64_t v624;
  int64_t v625;
  const char *v626;
  uint64_t v627;
  uint64_t v628;
  uint64_t v629;
  const char *v630;
  uint64_t v631;
  uint64_t v632;
  void *v634;
  void *v635;
  void *v636;
  void *v637;
  void *v638;
  void *v639;
  void *v640;
  uint64_t v641;
  uint64_t v642;
  void *v643;
  void *v644;
  CMTimeEpoch v645;
  uint64_t v646;
  id obj;
  __int128 v648;
  uint64_t v649;
  id v650;
  void *v651;
  id v652;
  void *v653;
  void *v654;
  id v655;
  id v656;
  void *v657;
  void *v658;
  void *v659;
  __int128 v660;
  __int128 v661;
  uint64_t v662;
  id v664;
  id v665;
  uint64_t v666;
  int32_t preferredTimescale;
  void *v668;
  CMTime v669;
  CMTime v670;
  CMTime v671;
  __int128 v672;
  __int128 v673;
  __int128 v674;
  CMTime rhs;
  __int128 v676;
  __int128 v677;
  __int128 v678;
  CMTime lhs;
  CMTime v680;
  __int128 v681;
  __int128 v682;
  __int128 v683;
  __int128 v684;
  CMTime v685;
  _QWORD v686[4];
  id v687;
  void *v688;
  __int128 v689;
  __int128 v690;
  __int128 v691;
  __int128 v692;
  CMTime v693;
  CMTime v694;
  __int128 v695;
  __int128 v696;
  __int128 v697;
  __int128 v698;
  CMTime v699;
  CMTime v700;
  CMTime v701;
  __int128 v702;
  __int128 v703;
  __int128 v704;
  __int128 v705;
  CMTime v706;
  CMTimeRange duration;
  CMTime start;
  CMTimeRange v709;
  __int128 v710;
  __int128 v711;
  __int128 v712;
  __int128 v713;
  __int128 v714;
  __int128 v715;
  __int128 v716;
  __int128 v717;
  _QWORD v718[2];
  _QWORD v719[2];
  _BYTE v720[128];
  _QWORD v721[2];
  _QWORD v722[2];
  _BYTE v723[128];
  void *v724;
  const __CFString *v725;
  const __CFString *v726;
  _QWORD v727[4];
  _QWORD v728[4];
  _QWORD v729[4];
  _QWORD v730[4];
  _QWORD v731[5];
  _QWORD v732[5];
  _BYTE v733[128];
  const __CFString *v734;
  const __CFString *v735;
  const __CFString *v736;
  const __CFString *v737;
  _QWORD v738[2];
  _QWORD v739[2];
  const __CFString *v740;
  const __CFString *v741;
  const __CFString *v742;
  const __CFString *v743;
  _QWORD v744[2];
  _QWORD v745[2];
  _BYTE v746[128];
  const __CFString *v747;
  const __CFString *v748;
  _BYTE v749[128];
  void *v750;
  _BYTE v751[128];
  uint64_t v752;

  v752 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  v639 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_summary(v7, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_videoCues(v17, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v638 = v22;
    if (!objc_msgSend_count(v22, v23, v24, v25, v26))
    {
      v69 = (id)MEMORY[0x24BDBD1A8];
LABEL_137:

      goto LABEL_138;
    }
    preferredTimescale = objc_msgSend_sampleRate(self, v27, v28, v29, v30);
    v35 = objc_msgSend_durationOfMusic(v7, v31, v32, v33, v34);
    objc_msgSend_summary(v7, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lkfsValue(v40, v41, v42, v43, v44);
    v46 = v45;

    objc_msgSend_summary(v7, v47, v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_peakValue(v51, v52, v53, v54, v55);
    v57 = v56;

    objc_msgSend_objectForKeyedSubscript_(v22, v58, (uint64_t)CFSTR("greatCues"), v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v22, v62, (uint64_t)CFSTR("goodCues"), v63, v64);
    v68 = objc_claimAutoreleasedReturnValue();
    v635 = (void *)v68;
    v636 = v61;
    if (v61)
      objc_msgSend_arrayByAddingObjectsFromArray_(v61, v65, v68, v66, v67);
    else
      objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCE30], v65, v68, v66, v67);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sortedArrayUsingSelector_(v70, v71, (uint64_t)sel_compare_, v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_orderedSet(MEMORY[0x24BDBCEE0], v75, v76, v77, v78);
    v79 = objc_claimAutoreleasedReturnValue();
    v714 = 0u;
    v715 = 0u;
    v716 = 0u;
    v717 = 0u;
    v80 = v74;
    v81 = (void *)v79;
    obj = v80;
    v83 = objc_msgSend_countByEnumeratingWithState_objects_count_(v80, v82, (uint64_t)&v714, (uint64_t)v751, 16);
    if (v83)
    {
      v87 = v83;
      v88 = *(_QWORD *)v715;
      do
      {
        for (i = 0; i != v87; ++i)
        {
          if (*(_QWORD *)v715 != v88)
            objc_enumerationMutation(obj);
          objc_msgSend_addObject_(v81, v84, *(_QWORD *)(*((_QWORD *)&v714 + 1) + 8 * i), v85, v86);
        }
        v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v84, (uint64_t)&v714, (uint64_t)v751, 16);
      }
      while (v87);
    }

    v637 = v81;
    objc_msgSend_array(v81, v90, v91, v92, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v94, v95, v96, v97, v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v99, v100, v101, v102, v103);
    if (v107 == 0.0)
    {
      v634 = v99;
    }
    else
    {

      v634 = &unk_24C5FACF8;
      v750 = &unk_24C5FACF8;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v108, (uint64_t)&v750, 1, v109);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayByAddingObjectsFromArray_(v110, v111, (uint64_t)v94, v112, v113);
      v114 = objc_claimAutoreleasedReturnValue();

      v94 = (void *)v114;
    }
    v115 = (double)v35;
    v116 = (double)preferredTimescale;
    v643 = v5;
    v644 = v94;
    v640 = v7;
    v668 = v12;
    if (objc_msgSend_isEqualToString_(v5, v104, (uint64_t)CFSTR("FMTimedMetadataIdentifierLoopPoints"), v105, v106))
    {
      v713 = 0u;
      v712 = 0u;
      v711 = 0u;
      v710 = 0u;
      objc_msgSend_summary(v7, v117, v118, v119, v120);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_loopPoints(v121, v122, v123, v124, v125);
      v126 = (void *)objc_claimAutoreleasedReturnValue();

      v664 = v126;
      v128 = objc_msgSend_countByEnumeratingWithState_objects_count_(v126, v127, (uint64_t)&v710, (uint64_t)v749, 16);
      if (v128)
      {
        v133 = v128;
        v134 = *(_QWORD *)v711;
        v660 = *MEMORY[0x24BDC0D88];
        v135 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
        v136 = MEMORY[0x24BDBD1B8];
        do
        {
          for (j = 0; j != v133; ++j)
          {
            if (*(_QWORD *)v711 != v134)
              objc_enumerationMutation(v664);
            v138 = *(void **)(*((_QWORD *)&v710 + 1) + 8 * j);
            memset(&v709, 0, sizeof(v709));
            objc_msgSend_doubleValue(v138, v129, v130, v131, v132);
            v140 = v139;
            v145 = objc_msgSend_sampleRate(self, v141, v142, v143, v144);
            CMTimeMakeWithSeconds(&start, v140, v145);
            *(_OWORD *)&duration.start.value = v660;
            duration.start.epoch = v135;
            CMTimeRangeMake(&v709, &start, &duration.start);
            v146 = [FMTimedMetadataItem alloc];
            v147 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend_doubleValue(v138, v148, v149, v150, v151);
            objc_msgSend_stringWithFormat_(v147, v152, (uint64_t)CFSTR("loop point @%f"), v153, v154, v155);
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            duration = v709;
            v158 = (void *)objc_msgSend_initWithIdentifier_name_timeRange_values_(v146, v157, (uint64_t)CFSTR("FMTimedMetadataIdentifierOnset"), (uint64_t)v156, (uint64_t)&duration, v136);

            objc_msgSend_addObject_(v12, v159, (uint64_t)v158, v160, v161);
          }
          v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(v664, v129, (uint64_t)&v710, (uint64_t)v749, 16);
        }
        while (v133);
        v5 = v643;
        v94 = v644;
        v7 = v640;
      }
      v162 = v637;
    }
    else
    {
      v162 = v637;
      if (!objc_msgSend_isEqualToString_(v5, v117, (uint64_t)CFSTR("FMTimedMetadataIdentifierSection"), v119, v120))goto LABEL_53;
      objc_msgSend_objectForKeyedSubscript_(v638, v163, (uint64_t)CFSTR("fadeToBlack"), v164, v165);
      v664 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v636, v166, v167, v168, v169);
      v657 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v657, v170, v171, v172, v173);
      v175 = (__int128 *)MEMORY[0x24BDC0D88];
      if (v176 != 0.0)
      {
        v747 = CFSTR("SectionType");
        v748 = CFSTR("BODY");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v174, (uint64_t)&v748, (uint64_t)&v747, 1);
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        memset(&v709, 0, sizeof(v709));
        CMTimeMakeWithSeconds(&v706, 0.0, preferredTimescale);
        *(_OWORD *)&duration.start.value = *v175;
        duration.start.epoch = *((_QWORD *)v175 + 2);
        CMTimeRangeMake(&v709, &v706, &duration.start);
        v178 = [FMTimedMetadataItem alloc];
        duration = v709;
        v180 = (void *)objc_msgSend_initWithIdentifier_name_timeRange_values_(v178, v179, (uint64_t)CFSTR("FMTimedMetadataIdentifierSection"), (uint64_t)CFSTR("section"), (uint64_t)&duration, v177);
        objc_msgSend_addObject_(v668, v181, (uint64_t)v180, v182, v183);

      }
      v704 = 0u;
      v705 = 0u;
      v702 = 0u;
      v703 = 0u;
      v184 = v636;
      v186 = objc_msgSend_countByEnumeratingWithState_objects_count_(v184, v185, (uint64_t)&v702, (uint64_t)v746, 16);
      if (v186)
      {
        v191 = v186;
        v192 = *(_QWORD *)v703;
        v661 = *v175;
        v193 = *((_QWORD *)v175 + 2);
        do
        {
          for (k = 0; k != v191; ++k)
          {
            if (*(_QWORD *)v703 != v192)
              objc_enumerationMutation(v184);
            v195 = *(void **)(*((_QWORD *)&v702 + 1) + 8 * k);
            memset(&v709, 0, sizeof(v709));
            objc_msgSend_doubleValue(v195, v187, v188, v189, v190);
            CMTimeMakeWithSeconds(&v701, v196, preferredTimescale);
            *(_OWORD *)&duration.start.value = v661;
            duration.start.epoch = v193;
            CMTimeRangeMake(&v709, &v701, &duration.start);
            objc_msgSend_lastObject(v644, v197, v198, v199, v200);
            v201 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToNumber = objc_msgSend_isEqualToNumber_(v195, v202, (uint64_t)v201, v203, v204);

            if (isEqualToNumber)
            {
              if (v664)
              {
                v210 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend_doubleValue(v664, v206, v207, v208, v209);
                v212 = v211;
                objc_msgSend_doubleValue(v195, v213, v214, v215, v216);
                objc_msgSend_numberWithDouble_(v210, v218, v219, v220, v221, v212 - v217);
                v222 = objc_claimAutoreleasedReturnValue();

                v744[0] = CFSTR("SectionType");
                v744[1] = CFSTR("FadeToBlack");
                v745[0] = CFSTR("OUTRO");
                v745[1] = v222;
                objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v223, (uint64_t)v745, (uint64_t)v744, 2);
                v224 = (void *)objc_claimAutoreleasedReturnValue();
                v664 = (id)v222;
              }
              else
              {
                v742 = CFSTR("SectionType");
                v743 = CFSTR("OUTRO");
                objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v206, (uint64_t)&v743, (uint64_t)&v742, 1);
                v224 = (void *)objc_claimAutoreleasedReturnValue();
                v664 = 0;
              }
            }
            else
            {
              v740 = CFSTR("SectionType");
              v741 = CFSTR("BODY");
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v206, (uint64_t)&v741, (uint64_t)&v740, 1);
              v224 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v225 = [FMTimedMetadataItem alloc];
            duration = v709;
            v227 = (void *)objc_msgSend_initWithIdentifier_name_timeRange_values_(v225, v226, (uint64_t)CFSTR("FMTimedMetadataIdentifierSection"), (uint64_t)CFSTR("section"), (uint64_t)&duration, v224);
            objc_msgSend_addObject_(v668, v228, (uint64_t)v227, v229, v230);

          }
          v191 = objc_msgSend_countByEnumeratingWithState_objects_count_(v184, v187, (uint64_t)&v702, (uint64_t)v746, 16);
        }
        while (v191);
      }

      objc_msgSend_lastObject(v668, v231, v232, v233, v234);
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_values(v235, v236, v237, v238, v239);
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v240, v241, (uint64_t)CFSTR("SectionType"), v242, v243);
      v244 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v244, v245, (uint64_t)CFSTR("OUTRO"), v246, v247);

      if ((isEqualToString & 1) != 0)
      {
        v5 = v643;
        v94 = v644;
        v7 = v640;
        v162 = v637;
        v253 = objc_msgSend_durationOfSilence(v640, v249, v250, v251, v252);
      }
      else
      {
        v94 = v644;
        objc_msgSend_lastObject(v644, v249, v250, v251, v252);
        v258 = (void *)objc_claimAutoreleasedReturnValue();
        memset(&v709, 0, sizeof(v709));
        objc_msgSend_doubleValue(v258, v259, v260, v261, v262);
        CMTimeMakeWithSeconds(&v700, v263, preferredTimescale);
        *(_OWORD *)&duration.start.value = *MEMORY[0x24BDC0D88];
        duration.start.epoch = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
        CMTimeRangeMake(&v709, &v700, &duration.start);
        v7 = v640;
        if (v664)
        {
          v268 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend_doubleValue(v664, v264, v265, v266, v267);
          v270 = v269;
          objc_msgSend_doubleValue(v258, v271, v272, v273, v274);
          objc_msgSend_numberWithDouble_(v268, v276, v277, v278, v279, v270 - v275);
          v280 = objc_claimAutoreleasedReturnValue();

          v738[0] = CFSTR("SectionType");
          v738[1] = CFSTR("FadeToBlack");
          v739[0] = CFSTR("OUTRO");
          v739[1] = v280;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v281, (uint64_t)v739, (uint64_t)v738, 2);
          v282 = (void *)objc_claimAutoreleasedReturnValue();
          v664 = (id)v280;
        }
        else
        {
          v736 = CFSTR("SectionType");
          v737 = CFSTR("OUTRO");
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v264, (uint64_t)&v737, (uint64_t)&v736, 1);
          v282 = (void *)objc_claimAutoreleasedReturnValue();
          v664 = 0;
        }
        v162 = v637;
        v283 = [FMTimedMetadataItem alloc];
        duration = v709;
        v285 = (void *)objc_msgSend_initWithIdentifier_name_timeRange_values_(v283, v284, (uint64_t)CFSTR("FMTimedMetadataIdentifierSection"), (uint64_t)CFSTR("section"), (uint64_t)&duration, v282);
        objc_msgSend_addObject_(v668, v286, (uint64_t)v285, v287, v288);

        v5 = v643;
        v253 = objc_msgSend_durationOfSilence(v640, v289, v290, v291, v292);
      }
      if (v253)
      {
        memset(&v709, 0, sizeof(v709));
        v293 = objc_msgSend_durationOfMusic(v7, v254, v255, v256, v257);
        CMTimeMake(&v699, v293, preferredTimescale);
        *(_OWORD *)&duration.start.value = *MEMORY[0x24BDC0D88];
        duration.start.epoch = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
        CMTimeRangeMake(&v709, &v699, &duration.start);
        v734 = CFSTR("SectionType");
        v735 = CFSTR("SILENCE");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v294, (uint64_t)&v735, (uint64_t)&v734, 1);
        v295 = (void *)objc_claimAutoreleasedReturnValue();
        v296 = [FMTimedMetadataItem alloc];
        duration = v709;
        v298 = (void *)objc_msgSend_initWithIdentifier_name_timeRange_values_(v296, v297, (uint64_t)CFSTR("FMTimedMetadataIdentifierSection"), (uint64_t)CFSTR("section"), (uint64_t)&duration, v295);
        objc_msgSend_addObject_(v668, v299, (uint64_t)v298, v300, v301);

      }
      v12 = v668;
    }

LABEL_53:
    v302 = v115 / v116;
    if (objc_msgSend_isEqualToString_(v5, v163, (uint64_t)CFSTR("FMTimedMetadataIdentifierSegment"), v164, v165))
    {
      objc_msgSend_objectForKeyedSubscript_(v638, v303, (uint64_t)CFSTR("fadeToBlack"), v304, v305);
      v655 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_summary(v7, v306, v307, v308, v309);
      v310 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allBars(v310, v311, v312, v313, v314);
      v315 = (void *)objc_claimAutoreleasedReturnValue();

      v697 = 0u;
      v698 = 0u;
      v695 = 0u;
      v696 = 0u;
      v316 = v94;
      v665 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v316, v317, (uint64_t)&v695, (uint64_t)v733, 16);
      if (v665)
      {
        v322 = 0;
        v662 = *(_QWORD *)v696;
        v648 = *MEMORY[0x24BDC0D88];
        v645 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
        v658 = v315;
        v650 = v316;
        do
        {
          for (m = 0; m != v665; m = (char *)m + 1)
          {
            if (*(_QWORD *)v696 != v662)
              objc_enumerationMutation(v316);
            v324 = *(void **)(*((_QWORD *)&v695 + 1) + 8 * (_QWORD)m);
            objc_msgSend_lastObject(v316, v318, v319, v320, v321);
            v325 = (void *)objc_claimAutoreleasedReturnValue();
            v329 = objc_msgSend_isEqualToNumber_(v324, v326, (uint64_t)v325, v327, v328);

            if ((v329 & 1) != 0)
            {
              objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v330, v331, v332, v333, v302);
            }
            else
            {
              v334 = objc_msgSend_indexOfObject_(v316, v330, (uint64_t)v324, v332, v333);
              objc_msgSend_objectAtIndexedSubscript_(v316, v335, v334 + 1, v336, v337);
            }
            v338 = (void *)objc_claimAutoreleasedReturnValue();
            if (v322 >= objc_msgSend_count(v315, v339, v340, v341, v342))
            {
              v348 = 0;
            }
            else
            {
              v347 = v12;
              v348 = 0;
              while (1)
              {
                objc_msgSend_objectAtIndexedSubscript_(v315, v343, v322 + v348, v345, v346);
                v349 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_doubleValue(v349, v350, v351, v352, v353);
                v355 = v354;
                objc_msgSend_doubleValue(v338, v356, v357, v358, v359);
                v361 = v360;

                if (v355 >= v361)
                  break;
                ++v348;
                if (v322 + v348 >= objc_msgSend_count(v315, v343, v344, v345, v346))
                  goto LABEL_69;
              }
              v322 += v348;
LABEL_69:
              v12 = v347;
              v316 = v650;
            }
            memset(&v709, 0, sizeof(v709));
            objc_msgSend_doubleValue(v324, v343, v344, v345, v346);
            CMTimeMakeWithSeconds(&v694, v362, preferredTimescale);
            *(_OWORD *)&duration.start.value = v648;
            duration.start.epoch = v645;
            CMTimeRangeMake(&v709, &v694, &duration.start);
            objc_msgSend_lastObject(v316, v363, v364, v365, v366);
            v367 = (void *)objc_claimAutoreleasedReturnValue();
            v371 = objc_msgSend_isEqualToNumber_(v324, v368, (uint64_t)v367, v369, v370);

            if (v371)
            {
              if (v655)
              {
                v377 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend_doubleValue(v655, v372, v373, v374, v375);
                v379 = v378;
                objc_msgSend_doubleValue(v324, v380, v381, v382, v383);
                objc_msgSend_numberWithDouble_(v377, v385, v386, v387, v388, v379 - v384);
                v389 = objc_claimAutoreleasedReturnValue();

                v732[0] = CFSTR("OUTRO");
                v731[0] = CFSTR("SegmentType");
                v731[1] = CFSTR("PeakValue");
                LODWORD(v390) = v57;
                objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v391, v392, v393, v394, v390);
                v395 = (void *)objc_claimAutoreleasedReturnValue();
                v732[1] = v395;
                v731[2] = CFSTR("Loudness");
                objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v396, v397, v398, v399, v46);
                v400 = (void *)objc_claimAutoreleasedReturnValue();
                v732[2] = v400;
                v731[3] = CFSTR("BarsUsed");
                objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v401, v348, v402, v403);
                v404 = (void *)objc_claimAutoreleasedReturnValue();
                v731[4] = CFSTR("FadeToBlack");
                v732[3] = v404;
                v732[4] = v389;
                objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v405, (uint64_t)v732, (uint64_t)v731, 5);
                v406 = (void *)objc_claimAutoreleasedReturnValue();
                v655 = (id)v389;
                v12 = v668;
              }
              else
              {
                v730[0] = CFSTR("OUTRO");
                v729[0] = CFSTR("SegmentType");
                v729[1] = CFSTR("PeakValue");
                LODWORD(v376) = v57;
                objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v372, v373, v374, v375, v376);
                v395 = (void *)objc_claimAutoreleasedReturnValue();
                v730[1] = v395;
                v729[2] = CFSTR("Loudness");
                objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v415, v416, v417, v418, v46);
                v400 = (void *)objc_claimAutoreleasedReturnValue();
                v730[2] = v400;
                v729[3] = CFSTR("BarsUsed");
                objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v419, v348, v420, v421);
                v404 = (void *)objc_claimAutoreleasedReturnValue();
                v730[3] = v404;
                objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v422, (uint64_t)v730, (uint64_t)v729, 4);
                v406 = (void *)objc_claimAutoreleasedReturnValue();
                v655 = 0;
              }
              v316 = v650;
            }
            else
            {
              v728[0] = CFSTR("BODY");
              v727[0] = CFSTR("SegmentType");
              v727[1] = CFSTR("PeakValue");
              LODWORD(v376) = v57;
              objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v372, v373, v374, v375, v376);
              v395 = (void *)objc_claimAutoreleasedReturnValue();
              v728[1] = v395;
              v727[2] = CFSTR("Loudness");
              objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v407, v408, v409, v410, v46);
              v400 = (void *)objc_claimAutoreleasedReturnValue();
              v728[2] = v400;
              v727[3] = CFSTR("BarsUsed");
              objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v411, v348, v412, v413);
              v404 = (void *)objc_claimAutoreleasedReturnValue();
              v728[3] = v404;
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v414, (uint64_t)v728, (uint64_t)v727, 4);
              v406 = (void *)objc_claimAutoreleasedReturnValue();
            }

            v423 = [FMTimedMetadataItem alloc];
            duration = v709;
            v425 = (void *)objc_msgSend_initWithIdentifier_name_timeRange_values_(v423, v424, (uint64_t)CFSTR("FMTimedMetadataIdentifierSegment"), (uint64_t)CFSTR("segment"), (uint64_t)&duration, v406);
            objc_msgSend_addObject_(v12, v426, (uint64_t)v425, v427, v428);

            v315 = v658;
          }
          v665 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v316, v318, (uint64_t)&v695, (uint64_t)v733, 16);
        }
        while (v665);
      }

      v7 = v640;
      v162 = v637;
      if (objc_msgSend_durationOfSilence(v640, v429, v430, v431, v432))
      {
        memset(&v709, 0, sizeof(v709));
        v437 = objc_msgSend_durationOfMusic(v640, v433, v434, v435, v436);
        CMTimeMake(&v693, v437, preferredTimescale);
        *(_OWORD *)&duration.start.value = *MEMORY[0x24BDC0D88];
        duration.start.epoch = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
        CMTimeRangeMake(&v709, &v693, &duration.start);
        v725 = CFSTR("SegmentType");
        v726 = CFSTR("SILENCE");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v438, (uint64_t)&v726, (uint64_t)&v725, 1);
        v439 = (void *)objc_claimAutoreleasedReturnValue();
        v440 = [FMTimedMetadataItem alloc];
        duration = v709;
        v442 = (void *)objc_msgSend_initWithIdentifier_name_timeRange_values_(v440, v441, (uint64_t)CFSTR("FMTimedMetadataIdentifierSegment"), (uint64_t)CFSTR("segment"), (uint64_t)&duration, v439);
        objc_msgSend_addObject_(v12, v443, (uint64_t)v442, v444, v445);

      }
      v94 = v644;
      v446 = v655;
      goto LABEL_121;
    }
    if ((objc_msgSend_isEqualToString_(v5, v303, (uint64_t)CFSTR("FMTimedMetadataIdentifierBar"), v304, v305) & 1) == 0
      && !objc_msgSend_isEqualToString_(v5, v447, (uint64_t)CFSTR("FMTimedMetadataIdentifierBeat"), v449, v450))
    {
      goto LABEL_122;
    }
    v451 = objc_msgSend_count(v94, v447, v448, v449, v450);
    v456 = 0x7FFFFFFFFFFFFFFFLL;
    if (v451 > 1)
      v456 = 1;
    v649 = v456;
    objc_msgSend_summary(v7, v452, v453, v454, v455);
    v457 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allBars(v457, v458, v459, v460, v461);
    v462 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_firstObject(v462, v463, v464, v465, v466);
    v315 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v315, v467, v468, v469, v470);
    v473 = v7;
    if (v474 != 0.0)
    {
      v724 = &unk_24C5FACF8;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v471, (uint64_t)&v724, 1, v472);
      v475 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayByAddingObjectsFromArray_(v475, v476, (uint64_t)v462, v477, v478);
      v479 = objc_claimAutoreleasedReturnValue();

      v462 = (void *)v479;
    }
    v691 = 0u;
    v692 = 0u;
    v689 = 0u;
    v690 = 0u;
    v656 = v462;
    v646 = objc_msgSend_countByEnumeratingWithState_objects_count_(v656, v480, (uint64_t)&v689, (uint64_t)v723, 16);
    if (!v646)
    {
LABEL_120:
      v446 = v656;

      v162 = v637;
      v7 = v473;
LABEL_121:

      v5 = v643;
LABEL_122:
      if (objc_msgSend_count(v12, v447, v448, v449, v450))
      {
        if (objc_msgSend_count(v12, v594, v595, v596, v597) != 1)
        {
          v602 = 0;
          do
          {
            objc_msgSend_objectAtIndex_(v12, v598, v602, v600, v601);
            v603 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndex_(v12, v604, ++v602, v605, v606);
            v607 = (void *)objc_claimAutoreleasedReturnValue();
            v612 = v607;
            memset(&v709, 0, 24);
            if (v607)
            {
              objc_msgSend_timeRange(v607, v608, v609, v610, v611);
            }
            else
            {
              v677 = 0u;
              v678 = 0u;
              v676 = 0u;
            }
            *(_OWORD *)&lhs.value = v676;
            lhs.epoch = v677;
            if (v603)
            {
              objc_msgSend_timeRange(v603, v608, v609, v610, v611);
            }
            else
            {
              v673 = 0u;
              v674 = 0u;
              v672 = 0u;
            }
            *(_OWORD *)&rhs.value = v672;
            rhs.epoch = v673;
            CMTimeSubtract(&v709.start, &lhs, &rhs);
            *(_OWORD *)&duration.start.value = *(_OWORD *)&v709.start.value;
            duration.start.epoch = v709.start.epoch;
            objc_msgSend_adjustDurationTo_(v603, v613, (uint64_t)&duration, v614, v615);

          }
          while (v602 < objc_msgSend_count(v12, v616, v617, v618, v619) - 1);
        }
        objc_msgSend_lastObject(v12, v598, v599, v600, v601);
        v620 = (void *)objc_claimAutoreleasedReturnValue();
        memset(&v709, 0, 24);
        v625 = objc_msgSend_duration(v7, v621, v622, v623, v624);
        CMTimeMake(&v671, v625, preferredTimescale);
        if (v620)
          objc_msgSend_timeRange(v620, v626, v627, v628, v629);
        else
          memset(&v669, 0, sizeof(v669));
        v670 = v669;
        CMTimeSubtract(&v709.start, &v671, &v670);
        *(_OWORD *)&duration.start.value = *(_OWORD *)&v709.start.value;
        duration.start.epoch = v709.start.epoch;
        objc_msgSend_adjustDurationTo_(v620, v630, (uint64_t)&duration, v631, v632);

      }
      v69 = v12;

      goto LABEL_137;
    }
    v642 = *(_QWORD *)v690;
    v666 = -1;
    v485 = MEMORY[0x24BDC0D88];
    v659 = v315;
LABEL_89:
    v486 = 0;
    while (1)
    {
      if (*(_QWORD *)v690 != v642)
        objc_enumerationMutation(v656);
      v487 = *(void **)(*((_QWORD *)&v689 + 1) + 8 * v486);
      objc_msgSend_lastObject(v656, v481, v482, v483, v484);
      v488 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqualToNumber_(v487, v489, (uint64_t)v488, v490, v491))
      {
        objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v492, v493, v494, v495, v115 / v116);
      }
      else
      {
        v496 = objc_msgSend_indexOfObject_(v656, v492, (uint64_t)v487, v494, v495);
        objc_msgSend_objectAtIndexedSubscript_(v656, v497, v496 + 1, v498, v499);
      }
      v500 = (void *)objc_claimAutoreleasedReturnValue();

      if (v649 == 0x7FFFFFFFFFFFFFFFLL
        || (objc_msgSend_objectAtIndexedSubscript_(v94, v501, v649, v503, v504),
            (v505 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        ++v666;
      }
      else
      {
        v506 = (void *)v505;
        objc_msgSend_doubleValue(v487, v501, v502, v503, v504);
        v508 = v507;
        objc_msgSend_doubleValue(v506, v509, v510, v511, v512);
        if (v508 >= v517)
        {
          v94 = v644;
          v592 = v649 + 1 < (unint64_t)objc_msgSend_count(v644, v513, v514, v515, v516)
               ? v649 + 1
               : 0x7FFFFFFFFFFFFFFFLL;
          v649 = v592;

          v666 = 0;
        }
        else
        {
          ++v666;

        }
      }
      objc_msgSend_summary(v473, v501, v502, v503, v504);
      v518 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allBeats(v518, v519, v520, v521, v522);
      v523 = (void *)objc_claimAutoreleasedReturnValue();

      v686[0] = MEMORY[0x24BDAC760];
      v686[1] = 3221225472;
      v686[2] = sub_20D01FD90;
      v686[3] = &unk_24C5EFF70;
      v652 = v500;
      v687 = v652;
      v688 = v487;
      objc_msgSend_indexesOfObjectsPassingTest_(v523, v524, (uint64_t)v686, v525, v526);
      v653 = v523;
      v651 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectsAtIndexes_(v523, v527, (uint64_t)v651, v528, v529);
      v530 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sortedArrayUsingSelector_(v530, v531, (uint64_t)sel_compare_, v532, v533);
      v534 = (void *)objc_claimAutoreleasedReturnValue();

      v654 = v534;
      if (objc_msgSend_isEqualToString_(v643, v535, (uint64_t)CFSTR("FMTimedMetadataIdentifierBar"), v536, v537))break;
      v315 = v659;
      if (objc_msgSend_isEqualToString_(v643, v538, (uint64_t)CFSTR("FMTimedMetadataIdentifierBeat"), v540, v541))
      {
        v683 = 0u;
        v684 = 0u;
        v681 = 0u;
        v682 = 0u;
        v552 = v654;
        v565 = objc_msgSend_countByEnumeratingWithState_objects_count_(v552, v564, (uint64_t)&v681, (uint64_t)v720, 16);
        if (v565)
        {
          v569 = v565;
          v641 = v486;
          v570 = 0;
          v571 = *(_QWORD *)v682;
          do
          {
            for (n = 0; n != v569; ++n)
            {
              if (*(_QWORD *)v682 != v571)
                objc_enumerationMutation(v552);
              v573 = *(void **)(*((_QWORD *)&v681 + 1) + 8 * n);
              v718[0] = CFSTR("BarIndex");
              objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v566, v666, v567, v568);
              v574 = (void *)objc_claimAutoreleasedReturnValue();
              v719[0] = v574;
              v718[1] = CFSTR("BeatIndex");
              objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v575, v570 + n, v576, v577);
              v578 = (void *)objc_claimAutoreleasedReturnValue();
              v719[1] = v578;
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v579, (uint64_t)v719, (uint64_t)v718, 2);
              v580 = (void *)objc_claimAutoreleasedReturnValue();

              memset(&v709, 0, sizeof(v709));
              objc_msgSend_doubleValue(v573, v581, v582, v583, v584);
              CMTimeMakeWithSeconds(&v680, v585, preferredTimescale);
              *(_OWORD *)&duration.start.value = *(_OWORD *)v485;
              duration.start.epoch = *(_QWORD *)(v485 + 16);
              CMTimeRangeMake(&v709, &v680, &duration.start);
              v586 = [FMTimedMetadataItem alloc];
              duration = v709;
              v588 = (void *)objc_msgSend_initWithIdentifier_name_timeRange_values_(v586, v587, (uint64_t)CFSTR("FMTimedMetadataIdentifierBeat"), (uint64_t)CFSTR("beat"), (uint64_t)&duration, v580);
              objc_msgSend_addObject_(v668, v589, (uint64_t)v588, v590, v591);

            }
            v569 = objc_msgSend_countByEnumeratingWithState_objects_count_(v552, v566, (uint64_t)&v681, (uint64_t)v720, 16);
            v570 += n;
          }
          while (v569);
          v473 = v640;
          v486 = v641;
          v12 = v668;
          v94 = v644;
LABEL_111:
          v315 = v659;
        }

      }
      if (++v486 == v646)
      {
        v593 = objc_msgSend_countByEnumeratingWithState_objects_count_(v656, v481, (uint64_t)&v689, (uint64_t)v723, 16);
        v646 = v593;
        if (!v593)
          goto LABEL_120;
        goto LABEL_89;
      }
    }
    v542 = objc_msgSend_count(v534, v538, v539, v540, v541);
    v721[0] = CFSTR("BarIndex");
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v543, v666, v544, v545);
    v546 = (void *)objc_claimAutoreleasedReturnValue();
    v722[0] = v546;
    v721[1] = CFSTR("BeatsPerBar");
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v547, v542, v548, v549);
    v550 = (void *)objc_claimAutoreleasedReturnValue();
    v722[1] = v550;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v551, (uint64_t)v722, (uint64_t)v721, 2);
    v552 = (id)objc_claimAutoreleasedReturnValue();

    memset(&v709, 0, sizeof(v709));
    objc_msgSend_doubleValue(v487, v553, v554, v555, v556);
    CMTimeMakeWithSeconds(&v685, v557, preferredTimescale);
    *(_OWORD *)&duration.start.value = *(_OWORD *)v485;
    duration.start.epoch = *(_QWORD *)(v485 + 16);
    CMTimeRangeMake(&v709, &v685, &duration.start);
    v558 = [FMTimedMetadataItem alloc];
    duration = v709;
    v560 = (void *)objc_msgSend_initWithIdentifier_name_timeRange_values_(v558, v559, (uint64_t)CFSTR("FMTimedMetadataIdentifierBar"), (uint64_t)CFSTR("bar"), (uint64_t)&duration, v552);
    objc_msgSend_addObject_(v12, v561, (uint64_t)v560, v562, v563);

    goto LABEL_111;
  }
  v69 = (id)MEMORY[0x24BDBD1A8];
LABEL_138:

  return v69;
}

- (BOOL)verifyRendition:(id)a3 forDuration:(id *)a4 failureReason:(id *)a5
{
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
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
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
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  BOOL v82;
  void *v83;
  objc_class *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
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
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  id *v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  void *v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  CMTimeValue value;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  void *v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  void *v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  void *v232;
  const char *v233;
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
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  void *v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  void *v261;
  float v262;
  float v263;
  double v264;
  void *v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  void *v270;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  void *v278;
  id v279;
  void *v280;
  void *v281;
  const char *v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  void *v286;
  const char *v287;
  uint64_t v288;
  uint64_t v289;
  char isEqual;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  void *v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  const char *v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  const char *v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  void *v308;
  const char *v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  void *v313;
  const char *v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  void *v319;
  const char *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  const char *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  const char *v330;
  uint64_t v331;
  uint64_t v332;
  const char *v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  void *v337;
  double v338;
  const char *v339;
  uint64_t v340;
  void *v341;
  const char *v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  void *v347;
  void *v348;
  id v349;
  const char *v350;
  uint64_t v351;
  const char *v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t i;
  void *v359;
  float v360;
  float v361;
  const char *v362;
  void *v363;
  const char *v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  const char *v368;
  uint64_t v369;
  uint64_t v370;
  float v371;
  void *v372;
  void *v374;
  const char *v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  Float64 Seconds;
  Float64 v380;
  const char *v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  void *v385;
  uint64_t v386;
  void *v387;
  uint64_t v388;
  void *v389;
  uint64_t v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  id *v396;
  uint64_t v397;
  void *v398;
  __int128 v399;
  __int128 v400;
  __int128 v401;
  __int128 v402;
  __int128 v403;
  __int128 v404;
  __int128 v405;
  __int128 v406;
  CMTime v407;
  CMTime v408;
  CMTime time2;
  __int128 v410;
  __int128 v411;
  __int128 v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  __int128 v416;
  __int128 v417;
  CMTime time;
  CMTime v419;
  CMTime v420;
  objc_super v421;
  _BYTE v422[128];
  _QWORD v423[4];
  _BYTE v424[128];
  _BYTE v425[128];
  _BYTE v426[128];
  uint64_t v427;

  v427 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v421.receiver = self;
  v421.super_class = (Class)FlexMLSong;
  v420 = *(CMTime *)a4;
  if (-[FlexSongBackend verifyRendition:forDuration:failureReason:](&v421, sel_verifyRendition_forDuration_failureReason_, v8, &v420, a5))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_trackA(v8, v9, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_mixParameters(v13, v14, v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_volumeKeyFrames(v18, v19, v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lastObject(v23, v24, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend_sampleTime(v28, v29, v30, v31, v32);

      objc_msgSend_trackB(v8, v34, v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_mixParameters(v38, v39, v40, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_volumeKeyFrames(v43, v44, v45, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lastObject(v48, v49, v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend_sampleTime(v53, v54, v55, v56, v57);

      if (v33 <= v58)
        v33 = v58;
      if (v33 <= objc_msgSend_duration(v8, v59, v60, v61, v62))
      {
        v396 = a5;
        objc_msgSend_trackA(v8, v63, v64, v65, v66);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_clips(v88, v89, v90, v91, v92);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lastObject(v93, v94, v95, v96, v97);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = objc_msgSend_position(v98, v99, v100, v101, v102);
        objc_msgSend_trackA(v8, v104, v105, v106, v107);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_clips(v108, v109, v110, v111, v112);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lastObject(v113, v114, v115, v116, v117);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = objc_msgSend_duration(v118, v119, v120, v121, v122) + v103;

        objc_msgSend_trackB(v8, v124, v125, v126, v127);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_clips(v128, v129, v130, v131, v132);
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lastObject(v133, v134, v135, v136, v137);
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        v143 = objc_msgSend_position(v138, v139, v140, v141, v142);
        objc_msgSend_trackB(v8, v144, v145, v146, v147);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_clips(v148, v149, v150, v151, v152);
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lastObject(v153, v154, v155, v156, v157);
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        v163 = objc_msgSend_duration(v158, v159, v160, v161, v162) + v143;

        if (v123 <= v163)
          v168 = v163;
        else
          v168 = v123;
        if (v168 == objc_msgSend_duration(v8, v164, v165, v166, v167))
        {
          objc_msgSend_timedMetadataItemsWithIdentifier_(v8, v169, (uint64_t)CFSTR("FMTimedMetadataIdentifierLoopPoints"), v170, v171);
          v172 = (void *)objc_claimAutoreleasedReturnValue();
          v177 = v172;
          v178 = v396;
          if (v172 && objc_msgSend_count(v172, v173, v174, v175, v176))
          {
            memset(&v420, 0, sizeof(v420));
            objc_msgSend_idealDurations(self, v173, v174, v175, v176);
            v179 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_lastObject(v179, v180, v181, v182, v183);
            v184 = (void *)objc_claimAutoreleasedReturnValue();
            v189 = v184;
            if (v184)
              objc_msgSend_CMTimeValue(v184, v185, v186, v187, v188);
            else
              memset(&v420, 0, sizeof(v420));

            FlexLogForCategory(1uLL);
            v203 = (char *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled((os_log_t)v203, OS_LOG_TYPE_DEBUG))
              sub_20D0210B4(v177, v203, v204, v205, v206);

            v211 = objc_msgSend_count(v177, v207, v208, v209, v210);
            time = v420;
            CMTimeMultiply(&v419, &time, v211);
            value = v419.value;
            if (value > objc_msgSend_duration(v8, v213, v214, v215, v216))
            {
              v217 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v173, v211, v175, v176);
              v218 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_numberWithLongLong_(MEMORY[0x24BDD16E0], v219, v420.value, v220, v221);
              v222 = (void *)objc_claimAutoreleasedReturnValue();
              v223 = (void *)MEMORY[0x24BDD16E0];
              v228 = objc_msgSend_duration(v8, v224, v225, v226, v227);
              objc_msgSend_numberWithLongLong_(v223, v229, v228, v230, v231);
              v232 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_stringWithFormat_(v217, v233, (uint64_t)CFSTR("Expected that the number of loops detected (%@) * the max duration detected from the idealDurations.lastObject (%@) is <= the rendition.duration (%@)"), v234, v235, v218, v222, v232);
              *v396 = (id)objc_claimAutoreleasedReturnValue();

            }
          }
          objc_msgSend_summary(v8, v173, v174, v175, v176);
          v236 = (void *)objc_claimAutoreleasedReturnValue();
          v414 = 0u;
          v415 = 0u;
          v416 = 0u;
          v417 = 0u;
          objc_msgSend_segments(v236, v237, v238, v239, v240);
          v241 = (void *)objc_claimAutoreleasedReturnValue();
          v243 = objc_msgSend_countByEnumeratingWithState_objects_count_(v241, v242, (uint64_t)&v414, (uint64_t)v426, 16);
          v395 = v177;
          if (v243)
          {
            v248 = *(_QWORD *)v415;
            v393 = v241;
            v386 = *(_QWORD *)v415;
            do
            {
              v249 = 0;
              v388 = v243;
              do
              {
                if (*(_QWORD *)v415 != v248)
                  objc_enumerationMutation(v241);
                v390 = v249;
                v250 = *(void **)(*((_QWORD *)&v414 + 1) + 8 * v249);
                v410 = 0u;
                v411 = 0u;
                v412 = 0u;
                v413 = 0u;
                objc_msgSend_gainFunction(v250, v244, v245, v246, v247);
                v251 = (void *)objc_claimAutoreleasedReturnValue();
                v253 = objc_msgSend_countByEnumeratingWithState_objects_count_(v251, v252, (uint64_t)&v410, (uint64_t)v425, 16);
                if (!v253)
                  goto LABEL_41;
                v258 = v253;
                v259 = *(_QWORD *)v411;
                v392 = v236;
                while (2)
                {
                  v260 = 0;
                  v397 = v258;
                  do
                  {
                    if (*(_QWORD *)v411 != v259)
                      objc_enumerationMutation(v251);
                    v261 = *(void **)(*((_QWORD *)&v410 + 1) + 8 * v260);
                    objc_msgSend_gain(v261, v254, v255, v256, v257);
                    v263 = v262;
                    v264 = v262;
                    if (v262 < 1.0 && v264 > 1.0e-13)
                    {
                      objc_msgSend_gainFunction(v250, v254, v255, v256, v257);
                      v265 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_firstObject(v265, v266, v267, v268, v269);
                      v270 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend_isEqual_(v261, v271, (uint64_t)v270, v272, v273))
                      {

LABEL_53:
                        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v254, (uint64_t)CFSTR("Expected a gain value of 0.00000000000001 or 1 for the first and last object in the gainFunction but found %f"), v256, v257, *(_QWORD *)&v264);
LABEL_54:
                        v82 = 0;
                        v68 = v395;
                        *v396 = (id)objc_claimAutoreleasedReturnValue();
                        v236 = v392;
                        v308 = v393;
                        goto LABEL_84;
                      }
                      objc_msgSend_gainFunction(v250, v274, v275, v276, v277);
                      v278 = v251;
                      v279 = v8;
                      v280 = v250;
                      v281 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_lastObject(v281, v282, v283, v284, v285);
                      v286 = (void *)objc_claimAutoreleasedReturnValue();
                      isEqual = objc_msgSend_isEqual_(v261, v287, (uint64_t)v286, v288, v289);

                      v250 = v280;
                      v8 = v279;
                      v251 = v278;
                      v258 = v397;

                      if ((isEqual & 1) != 0)
                        goto LABEL_53;
                    }
                    if (v263 < 0.0)
                    {
                      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v254, (uint64_t)CFSTR("Expected a gain value of >= 0 but found: %f"), v256, v257, *(_QWORD *)&v264);
                      goto LABEL_54;
                    }
                    ++v260;
                  }
                  while (v258 != v260);
                  v258 = objc_msgSend_countByEnumeratingWithState_objects_count_(v251, v254, (uint64_t)&v410, (uint64_t)v425, 16);
                  v236 = v392;
                  if (v258)
                    continue;
                  break;
                }
LABEL_41:

                objc_msgSend_gainFunction(v250, v291, v292, v293, v294);
                v295 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_lastObject(v295, v296, v297, v298, v299);
                v251 = (void *)objc_claimAutoreleasedReturnValue();

                memset(&v420, 0, sizeof(v420));
                if (v251)
                  objc_msgSend_segmentTime(v251, v300, v301, v302, v303);
                v178 = v396;
                if (v250)
                  objc_msgSend_duration(v250, v300, v301, v302, v303);
                else
                  memset(&time2, 0, sizeof(time2));
                v68 = v395;
                time = v420;
                if (CMTimeCompare(&time, &time2))
                {
                  v374 = (void *)MEMORY[0x24BDD17C8];
                  time = v420;
                  Seconds = CMTimeGetSeconds(&time);
                  if (v250)
                    objc_msgSend_duration(v250, v375, v376, v377, v378);
                  else
                    memset(&v408, 0, sizeof(v408));
                  v308 = v393;
                  v380 = CMTimeGetSeconds(&v408);
                  objc_msgSend_stringWithFormat_(v374, v381, (uint64_t)CFSTR("The last segmentTime value (%f) in the gain function must match that of the segment duration (%f)."), v382, v383, *(_QWORD *)&Seconds, *(_QWORD *)&v380);
                  v82 = 0;
                  *v396 = (id)objc_claimAutoreleasedReturnValue();
                  goto LABEL_84;
                }

                v249 = v390 + 1;
                v241 = v393;
                v248 = v386;
              }
              while (v390 + 1 != v388);
              v243 = objc_msgSend_countByEnumeratingWithState_objects_count_(v393, v244, (uint64_t)&v414, (uint64_t)v426, 16);
            }
            while (v243);
          }

          objc_msgSend_videoCues(v236, v304, v305, v306, v307);
          v308 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_allBars(v236, v309, v310, v311, v312);
          v313 = (void *)objc_claimAutoreleasedReturnValue();

          if (v313)
          {
            objc_msgSend_allBars(v236, v314, v315, v316, v317);
            v318 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v318 = MEMORY[0x24BDBD1A8];
          }
          objc_msgSend_allBeats(v236, v314, v315, v316, v317);
          v319 = (void *)objc_claimAutoreleasedReturnValue();

          if (v319)
          {
            objc_msgSend_allBeats(v236, v320, v321, v322, v323);
            v324 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v324 = MEMORY[0x24BDBD1A8];
          }
          objc_msgSend_objectForKeyedSubscript_(v308, v320, (uint64_t)CFSTR("fadeToBlack"), v322, v323);
          v325 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v308, v326, (uint64_t)CFSTR("goodCues"), v327, v328);
          v329 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v308, v330, (uint64_t)CFSTR("greatCues"), v331, v332);
          v337 = (void *)objc_claimAutoreleasedReturnValue();
          v387 = (void *)v325;
          if (v236)
            objc_msgSend_duration(v236, v333, v334, v335, v336);
          else
            memset(&v407, 0, sizeof(v407));
          v338 = CMTimeGetSeconds(&v407);
          v403 = 0u;
          v404 = 0u;
          v405 = 0u;
          v406 = 0u;
          v389 = (void *)v324;
          v391 = (void *)v318;
          v423[0] = v318;
          v423[1] = v324;
          v398 = (void *)v329;
          v423[2] = v329;
          v423[3] = v337;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v339, (uint64_t)v423, 4, v340);
          v341 = (void *)objc_claimAutoreleasedReturnValue();
          v343 = objc_msgSend_countByEnumeratingWithState_objects_count_(v341, v342, (uint64_t)&v403, (uint64_t)v424, 16);
          if (v343)
          {
            v344 = v343;
            v345 = *(_QWORD *)v404;
            v394 = v308;
            v384 = *(_QWORD *)v404;
            v385 = v337;
            do
            {
              v346 = 0;
              do
              {
                v347 = v236;
                if (*(_QWORD *)v404 != v345)
                  objc_enumerationMutation(v341);
                v348 = *(void **)(*((_QWORD *)&v403 + 1) + 8 * v346);
                v399 = 0u;
                v400 = 0u;
                v401 = 0u;
                v402 = 0u;
                v349 = v348;
                v351 = objc_msgSend_countByEnumeratingWithState_objects_count_(v349, v350, (uint64_t)&v399, (uint64_t)v422, 16);
                if (v351)
                {
                  v356 = v351;
                  v357 = *(_QWORD *)v400;
                  while (2)
                  {
                    for (i = 0; i != v356; ++i)
                    {
                      if (*(_QWORD *)v400 != v357)
                        objc_enumerationMutation(v349);
                      v359 = *(void **)(*((_QWORD *)&v399 + 1) + 8 * i);
                      objc_msgSend_floatValue(v359, v352, v353, v354, v355);
                      if (v338 < v360)
                      {
                        objc_msgSend_floatValue(v359, v352, v353, v354, v355);
                        if (vabdd_f64(v361, v338) > 0.001)
                        {
                          objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v352, (uint64_t)CFSTR("All video cue values should be < the summary.duration (%f)."), v354, v355, *(_QWORD *)&v338);
                          *v396 = (id)objc_claimAutoreleasedReturnValue();

                          v82 = 0;
                          v236 = v347;
                          v308 = v394;
                          v68 = v395;
                          v372 = v389;
                          v251 = v391;
                          v337 = v385;
                          v363 = v387;
                          goto LABEL_83;
                        }
                      }
                    }
                    v356 = objc_msgSend_countByEnumeratingWithState_objects_count_(v349, v352, (uint64_t)&v399, (uint64_t)v422, 16);
                    if (v356)
                      continue;
                    break;
                  }
                }

                ++v346;
                v178 = v396;
                v236 = v347;
                v308 = v394;
                v345 = v384;
                v337 = v385;
              }
              while (v346 != v344);
              v344 = objc_msgSend_countByEnumeratingWithState_objects_count_(v341, v362, (uint64_t)&v403, (uint64_t)v424, 16);
            }
            while (v344);
          }

          v363 = v387;
          objc_msgSend_floatValue(v387, v364, v365, v366, v367);
          if (v338 >= v371)
          {
            v82 = 1;
          }
          else
          {
            objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v368, (uint64_t)CFSTR("Fade to black value should be < the summary.duration (%f)."), v369, v370, *(_QWORD *)&v338);
            v82 = 0;
            *v178 = (id)objc_claimAutoreleasedReturnValue();
          }
          v68 = v395;
          v372 = v389;
          v251 = v391;
LABEL_83:

LABEL_84:
          goto LABEL_85;
        }
        v190 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_numberWithLongLong_(MEMORY[0x24BDD16E0], v169, v168, v170, v171);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v191 = (void *)MEMORY[0x24BDD16E0];
        v196 = objc_msgSend_duration(v8, v192, v193, v194, v195);
        objc_msgSend_numberWithLongLong_(v191, v197, v196, v198, v199);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v190, v200, (uint64_t)CFSTR("The last clip's end time of %@ should equal the rendition's duration in seconds: %@. Here we are assuming that clips are using a timescale of 'sampleRate'."), v201, v202, v68, v78);
        *v396 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v67 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_numberWithLongLong_(MEMORY[0x24BDD16E0], v63, v33, v65, v66);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = (void *)MEMORY[0x24BDD16E0];
        v74 = objc_msgSend_duration(v8, v70, v71, v72, v73);
        objc_msgSend_numberWithLongLong_(v69, v75, v74, v76, v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v67, v79, (uint64_t)CFSTR("Final keyframe sampleTime: %@ must be less or equal to the rendition's duration: %@"), v80, v81, v68, v78);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      v82 = 0;
    }
    else
    {
      v83 = (void *)MEMORY[0x24BDD17C8];
      v84 = (objc_class *)objc_opt_class();
      NSStringFromClass(v84);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v83, v85, (uint64_t)CFSTR("Expected a FlexMLSongRendition but got a %@."), v86, v87, v68);
      v82 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_85:

    goto LABEL_86;
  }
  v82 = 0;
LABEL_86:

  return v82;
}

- (id)idealDurations
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend__summaryManager(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allSummaryDurations(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)naturalDuration
{
  uint64_t v3;
  uint64_t v4;
  int64_t *p_var3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v7;
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
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  char isEqualToString;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const __CFURL *v58;
  BOOL v59;
  double v60;
  int64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int32_t v69;
  int64_t v70;
  void *v71;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v72;
  id v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  id v79;
  int64_t v80;
  __int128 outPropertyData;
  __int128 v82;
  uint64_t v83;
  UInt32 ioPropertyDataSize;
  ExtAudioFileRef outExtAudioFile;
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  p_var3 = &self[5].var3;
  if ((self[6].var0 & 0x100000000) == 0)
  {
    v7 = self;
    objc_msgSend_existingAssetWithID_(self, a3, (uint64_t)CFSTR("FMSongBundleAssetID"), v3, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localURL(v8, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v74 = v8;
      objc_msgSend_localURL(v8, v14, v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_path(v18, v19, v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v24, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = 0;
      objc_msgSend_contentsOfDirectoryAtPath_error_(v28, v29, (uint64_t)v23, (uint64_t)&v79, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v79;

      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v33 = v31;
      v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v75, (uint64_t)v86, 16);
      v40 = v33;
      if (v35)
      {
        v41 = v35;
        v72 = retstr;
        v73 = v32;
        v71 = v23;
        v42 = *(_QWORD *)v76;
LABEL_5:
        v43 = 0;
        while (1)
        {
          if (*(_QWORD *)v76 != v42)
            objc_enumerationMutation(v33);
          v44 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v43);
          objc_msgSend_pathExtension(v44, v36, v37, v38, v39, v71);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_audioFileExtension(v7, v46, v47, v48, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v45, v51, (uint64_t)v50, v52, v53);

          if ((isEqualToString & 1) != 0)
            break;
          if (v41 == ++v43)
          {
            v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v75, (uint64_t)v86, 16);
            if (v41)
              goto LABEL_5;
            v40 = v33;
            v23 = v71;
            retstr = v72;
            v32 = v73;
            goto LABEL_21;
          }
        }
        v23 = v71;
        objc_msgSend_stringByAppendingPathComponent_(v71, v36, (uint64_t)v44, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        retstr = v72;
        v32 = v73;
        if (!v40)
          goto LABEL_22;
        objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v55, (uint64_t)v40, v56, v57);
        v58 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
        outExtAudioFile = 0;
        if (ExtAudioFileOpenURL(v58, &outExtAudioFile))
          v59 = 1;
        else
          v59 = outExtAudioFile == 0;
        if (!v59)
        {
          v83 = 0;
          outPropertyData = 0u;
          v82 = 0u;
          ioPropertyDataSize = 40;
          if (ExtAudioFileGetProperty(outExtAudioFile, 0x66666D74u, &ioPropertyDataSize, &outPropertyData)
            || (v60 = *(double *)&outPropertyData,
                v80 = 0,
                ioPropertyDataSize = 8,
                ExtAudioFileGetProperty(outExtAudioFile, 0x2366726Du, &ioPropertyDataSize, &v80)))
          {
            ExtAudioFileDispose(outExtAudioFile);
          }
          else
          {
            v61 = v80;
            ExtAudioFileDispose(outExtAudioFile);
            objc_msgSend_updateSampleRate_(v7, v62, (uint64_t)v60, v63, v64);
            v69 = objc_msgSend_sampleRate(v7, v65, v66, v67, v68);
            v70 = v61;
            v32 = v73;
            CMTimeMake((CMTime *)&outPropertyData, v70, v69);
            *(_OWORD *)p_var3 = outPropertyData;
            p_var3[2] = v82;
          }
        }

      }
LABEL_21:

LABEL_22:
      v8 = v74;
    }

  }
  *(_OWORD *)&retstr->var0 = *(_OWORD *)p_var3;
  retstr->var3 = p_var3[2];
  return self;
}

- (NSURL)audioFileURL
{
  uint64_t v2;
  uint64_t v3;
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
  void *v28;
  id v29;
  id v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  char isEqualToString;
  void *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  id v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_existingAssetWithID_(self, a2, (uint64_t)CFSTR("FMSongBundleAssetID"), v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localURL(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend_localURL(v5, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_path(v15, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0;
    objc_msgSend_contentsOfDirectoryAtPath_error_(v25, v26, (uint64_t)v20, (uint64_t)&v63, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v63;

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v30 = v28;
    v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v59, (uint64_t)v64, 16);
    if (v32)
    {
      v37 = v32;
      v57 = v29;
      v58 = v20;
      v38 = *(_QWORD *)v60;
LABEL_4:
      v39 = 0;
      while (1)
      {
        if (*(_QWORD *)v60 != v38)
          objc_enumerationMutation(v30);
        v40 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v39);
        objc_msgSend_pathExtension(v40, v33, v34, v35, v36, v57);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_audioFileExtension(self, v42, v43, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v41, v47, (uint64_t)v46, v48, v49);

        if ((isEqualToString & 1) != 0)
          break;
        if (v37 == ++v39)
        {
          v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v59, (uint64_t)v64, 16);
          if (v37)
            goto LABEL_4;
          v51 = 0;
          v52 = v30;
          v20 = v58;
          goto LABEL_13;
        }
      }
      v20 = v58;
      objc_msgSend_stringByAppendingPathComponent_(v58, v33, (uint64_t)v40, v35, v36);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (v52)
      {
        objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v53, (uint64_t)v52, v54, v55);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
        v29 = v57;
        goto LABEL_16;
      }
      v51 = 0;
      v29 = v57;
    }
    else
    {
      v51 = 0;
      v52 = v30;
LABEL_16:

    }
  }
  else
  {
    v51 = 0;
  }

  return (NSURL *)v51;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumDuration
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v22;

  objc_msgSend__summaryManager(self, a3, v3, v4, v5);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allSummaryDurations(v22, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  if (v16)
    objc_msgSend_CMTimeValue(v16, v17, v18, v19, v20);

  return result;
}

- (NSString)rootPath
{
  return self->_rootPath;
}

- (NSString)metadataPath
{
  return self->_metadataPath;
}

- (NSString)audioFileExtension
{
  return self->_audioFileExtension;
}

- (void)setAudioFileExtension:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cachedNaturalDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 136);
  return self;
}

- (void)setCachedNaturalDuration:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_cachedNaturalDuration.value = *(_OWORD *)&a3->var0;
  self->_cachedNaturalDuration.epoch = var3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioFileExtension, 0);
  objc_storeStrong((id *)&self->_metadataPath, 0);
  objc_storeStrong((id *)&self->_rootPath, 0);
}

@end
