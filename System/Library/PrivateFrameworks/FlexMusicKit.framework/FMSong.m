@implementation FMSong

- (FMSong)initWithUID:(id)a3 assets:(id)a4 metadata:(id)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  int isEqualToString;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  FlexSongProxy *v69;
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
  uint64_t v83;
  void *v84;
  const char *v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t j;
  void *v100;
  const char *v101;
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
  void *v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t k;
  void *v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  double v199;
  void *v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  double v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  void *v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  double v227;
  void *v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  void *v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  void *v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  void *v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  void *v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  void *v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  const char *v262;
  const char *v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  void *v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  char v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  NSObject *v275;
  uint64_t v276;
  uint64_t v277;
  _BYTE *v278;
  FMSong *v279;
  uint64_t v281;
  void *v282;
  void *v284;
  id v285;
  id v286;
  void *v287;
  void *v288;
  id obj;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  _BYTE v302[128];
  _BYTE v303[128];
  _BYTE v304[128];
  uint64_t v305;

  v305 = *MEMORY[0x24BDAC8D0];
  v285 = a3;
  v7 = a4;
  v286 = a5;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v8, v9, v10, v11);
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCEB8], v12, (uint64_t)v7, v13, v14);
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  v298 = 0u;
  v299 = 0u;
  v300 = 0u;
  v301 = 0u;
  obj = v7;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v298, (uint64_t)v304, 16);
  if (!v16)
  {
    v22 = 0;
    v23 = 0;
    goto LABEL_23;
  }
  v21 = v16;
  v22 = 0;
  v23 = 0;
  v24 = *(_QWORD *)v299;
  do
  {
    for (i = 0; i != v21; ++i)
    {
      if (*(_QWORD *)v299 != v24)
        objc_enumerationMutation(obj);
      v26 = *(void **)(*((_QWORD *)&v298 + 1) + 8 * i);
      if (v22
        || (objc_msgSend_assetID(*(void **)(*((_QWORD *)&v298 + 1) + 8 * i), v17, v18, v19, v20),
            v27 = v23,
            v28 = (void *)objc_claimAutoreleasedReturnValue(),
            v32 = objc_msgSend_isEqualToString_(v28, v29, (uint64_t)CFSTR("FMSongArtworkAssetID"), v30, v31),
            v28,
            v23 = v27,
            !v32))
      {
        if (v23)
          continue;
        objc_msgSend_assetID(v26, v17, v18, v19, v20);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v33, v34, (uint64_t)CFSTR("FMSongBundleAssetID"), v35, v36);

        if (isEqualToString
          && objc_msgSend_compatibilityVersion(v26, v17, v18, v19, v20) <= 4
          && objc_msgSend_compatibilityVersion(v26, v17, v18, v19, v20) >= 1)
        {
          v27 = v26;
          goto LABEL_16;
        }
        v23 = 0;
      }
      else
      {
        if (objc_msgSend_compatibilityVersion(v26, v17, v18, v19, v20) <= 4
          && objc_msgSend_compatibilityVersion(v26, v17, v18, v19, v20) > 0)
        {
          v22 = v26;
LABEL_16:
          v38 = v26;
          objc_msgSend_removeObject_(v287, v39, (uint64_t)v38, v40, v41);
          objc_msgSend_addObject_(v288, v42, (uint64_t)v38, v43, v44);
          v23 = v27;
          continue;
        }
        v22 = 0;
      }
    }
    v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v298, (uint64_t)v304, 16);
  }
  while (v21);
LABEL_23:

  v53 = v285;
  v54 = v286;
  v284 = v23;
  if (objc_msgSend_count(v287, v45, v46, v47, v48))
  {
    FlexLogForCategory(0);
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      sub_20D025AC4();

    v23 = v284;
  }
  if (!v23)
  {
    v69 = [FlexSongProxy alloc];
    objc_msgSend_set(MEMORY[0x24BDBCF20], v70, v71, v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_set(MEMORY[0x24BDBCF20], v75, v76, v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionary(MEMORY[0x24BDBCE70], v80, v81, v82, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)objc_msgSend_initWithUID_songName_artistName_tagIDs_keywords_weightedKeywords_hidden_recalled_assets_audioEncoderPresetName_metadataVersion_songFormat_(v69, v85, (uint64_t)v285, (uint64_t)&stru_24C5F0F80, (uint64_t)&stru_24C5F0F80, v74, v79, v84, 0, v288, &stru_24C5F0F80, 1, &stru_24C5F0F80);

    if (!v286)
      goto LABEL_64;
    goto LABEL_35;
  }
  objc_msgSend_localURL(v23, v49, v50, v51, v52);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_backendForSongBundleURL_(FlexUtilities, v57, (uint64_t)v56, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v60)
  {
    FlexLogForCategory(0);
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      sub_20D025A98();

  }
  objc_msgSend_updateAssets_(v60, v61, (uint64_t)v288, v62, v63);
  if (v286)
  {
LABEL_35:
    v282 = v60;
    objc_msgSend_set(MEMORY[0x24BDBCEF0], v65, v66, v67, v68);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v294 = 0u;
    v295 = 0u;
    v296 = 0u;
    v297 = 0u;
    objc_msgSend_genres(v286, v87, v88, v89, v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(v91, v92, (uint64_t)&v294, (uint64_t)v303, 16);
    if (v93)
    {
      v97 = v93;
      v98 = *(_QWORD *)v295;
      do
      {
        for (j = 0; j != v97; ++j)
        {
          if (*(_QWORD *)v295 != v98)
            objc_enumerationMutation(v91);
          objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v94, (uint64_t)CFSTR("%@%@"), v95, v96, CFSTR("Genre_"), *(_QWORD *)(*((_QWORD *)&v294 + 1) + 8 * j));
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v86, v101, (uint64_t)v100, v102, v103);

        }
        v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v91, v94, (uint64_t)&v294, (uint64_t)v303, 16);
      }
      while (v97);
    }

    objc_msgSend_mood(v286, v104, v105, v106, v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = objc_msgSend_length(v108, v109, v110, v111, v112);

    if (v113)
    {
      v118 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_mood(v286, v114, v115, v116, v117);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v118, v120, (uint64_t)CFSTR("%@%@"), v121, v122, CFSTR("Mood_"), v119);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v86, v124, (uint64_t)v123, v125, v126);

    }
    objc_msgSend_moodAlt(v286, v114, v115, v116, v117);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = objc_msgSend_length(v127, v128, v129, v130, v131);

    if (v132)
    {
      v137 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_moodAlt(v286, v133, v134, v135, v136);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v137, v139, (uint64_t)CFSTR("%@%@"), v140, v141, CFSTR("MoodAlt_"), v138);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v86, v143, (uint64_t)v142, v144, v145);

    }
    objc_msgSend_pace(v286, v133, v134, v135, v136);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = objc_msgSend_length(v146, v147, v148, v149, v150);

    if (v151)
    {
      v156 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_pace(v286, v152, v153, v154, v155);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v156, v158, (uint64_t)CFSTR("%@%@"), v159, v160, CFSTR("SongPace_"), v157);
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v86, v162, (uint64_t)v161, v163, v164);

    }
    if (objc_msgSend_style(v286, v152, v153, v154, v155) >= 1)
    {
      v169 = (void *)MEMORY[0x24BDD17C8];
      v170 = objc_msgSend_style(v286, v165, v166, v167, v168);
      objc_msgSend_stringWithFormat_(v169, v171, (uint64_t)CFSTR("%@%lld"), v172, v173, CFSTR("Style_"), v170);
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v86, v175, (uint64_t)v174, v176, v177);

    }
    v292 = 0u;
    v293 = 0u;
    v290 = 0u;
    v291 = 0u;
    objc_msgSend_regions(v286, v165, v166, v167, v168);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    v180 = objc_msgSend_countByEnumeratingWithState_objects_count_(v178, v179, (uint64_t)&v290, (uint64_t)v302, 16);
    if (v180)
    {
      v184 = v180;
      v185 = *(_QWORD *)v291;
      do
      {
        for (k = 0; k != v184; ++k)
        {
          if (*(_QWORD *)v291 != v185)
            objc_enumerationMutation(v178);
          objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v181, (uint64_t)CFSTR("%@%@"), v182, v183, CFSTR("Region_"), *(_QWORD *)(*((_QWORD *)&v290 + 1) + 8 * k));
          v187 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v86, v188, (uint64_t)v187, v189, v190);

        }
        v184 = objc_msgSend_countByEnumeratingWithState_objects_count_(v178, v181, (uint64_t)&v290, (uint64_t)v302, 16);
      }
      while (v184);
    }

    v54 = v286;
    objc_msgSend_arousal(v286, v191, v192, v193, v194);
    if (v199 > 0.0)
    {
      v200 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_arousal(v286, v195, v196, v197, v198);
      objc_msgSend_stringWithFormat_(v200, v201, (uint64_t)CFSTR("%@%g"), v202, v203, CFSTR("Arousal_"), v204);
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v86, v206, (uint64_t)v205, v207, v208);

    }
    objc_msgSend_valence(v286, v195, v196, v197, v198);
    v53 = v285;
    v60 = v282;
    if (v213 > 0.0)
    {
      v214 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_valence(v286, v209, v210, v211, v212);
      objc_msgSend_stringWithFormat_(v214, v215, (uint64_t)CFSTR("%@%g"), v216, v217, CFSTR("Valence_"), v218);
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v86, v220, (uint64_t)v219, v221, v222);

    }
    objc_msgSend_visualTempo(v286, v209, v210, v211, v212);
    if (v227 > 0.0)
    {
      v228 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_visualTempo(v286, v223, v224, v225, v226);
      objc_msgSend_stringWithFormat_(v228, v229, (uint64_t)CFSTR("%@%g"), v230, v231, CFSTR("VisualTempo_"), v232);
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v86, v234, (uint64_t)v233, v235, v236);

    }
    objc_msgSend_artistName(v286, v223, v224, v225, v226);
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_songName(v286, v238, v239, v240, v241);
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_keywords(v286, v243, v244, v245, v246);
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_weightedKeywords(v286, v248, v249, v250, v251);
    v252 = (void *)objc_claimAutoreleasedReturnValue();
    v257 = objc_msgSend_hidden(v286, v253, v254, v255, v256);
    LOBYTE(v281) = objc_msgSend_recalled(v286, v258, v259, v260, v261);
    objc_msgSend_updateSongArtist_title_tags_keywords_weightedKeywords_hidden_recalled_metadataVersion_(v282, v262, (uint64_t)v237, (uint64_t)v242, (uint64_t)v86, v247, v252, v257, v281, 1);

  }
LABEL_64:
  objc_msgSend_updateUID_(v60, v65, (uint64_t)v53, v67, v68);
  objc_msgSend_uid(v60, v263, v264, v265, v266);
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  v271 = objc_msgSend_isEqualToString_(v267, v268, (uint64_t)v53, v269, v270);

  if ((v271 & 1) == 0)
  {
    FlexLogForCategory(0);
    v275 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v275, OS_LOG_TYPE_ERROR))
      sub_20D0259E8((uint64_t)v53, v60, v275, v276, v277);

  }
  v278 = (_BYTE *)objc_msgSend_initWithBackend_(self, v272, (uint64_t)v60, v273, v274);
  if (v278)
    v278[8] = 1;
  v279 = v278;

  return v279;
}

- (FMSong)initWithBackend:(id)a3
{
  id v5;
  FMSong *v6;
  FMSong *v7;
  FMSong *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMSong;
  v6 = -[FMSong init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    if (!v5)
    {
      v8 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v6->_backend, a3);
  }
  v8 = v7;
LABEL_6:

  return v8;
}

- (void)updateBackend:(id)a3
{
  FlexSongProtocol *v4;
  FMSong *v5;
  FlexSongProtocol *backend;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = (FlexSongProtocol *)a3;
  v5 = self;
  objc_sync_enter(v5);
  backend = v5->_backend;
  v5->_backend = v4;

  objc_sync_exit(v5);
  objc_msgSend__notifySongAssetsChanged(v5, v7, v8, v9, v10);
}

- (void)_notifySongAssetsChanged
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_20D02391C;
  block[3] = &unk_24C5EFCC8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)updateAsset:(id)a3 downloadProgress:(double)a4 error:(id)a5
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
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  void *v39;
  id v40;
  _QWORD block[5];
  id v42;
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[4];
  _QWORD v46[5];

  v46[4] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (objc_msgSend_updateDownloadProgress_(v8, v10, v11, v12, v13, a4))
  {
    if (v9)
    {
      v45[0] = CFSTR("songUID");
      objc_msgSend_uid(self, v14, v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = v18;
      v45[1] = CFSTR("assetID");
      objc_msgSend_assetID(v8, v19, v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v46[1] = v23;
      v45[2] = CFSTR("progress");
      objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v24, v25, v26, v27, a4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v45[3] = CFSTR("error");
      v46[2] = v28;
      v46[3] = v9;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v29, (uint64_t)v46, (uint64_t)v45, 4);
    }
    else
    {
      v43[0] = CFSTR("songUID");
      objc_msgSend_uid(self, v14, v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v18;
      v43[1] = CFSTR("assetID");
      objc_msgSend_assetID(v8, v30, v31, v32, v33);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v44[1] = v23;
      v43[2] = CFSTR("progress");
      objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v34, v35, v36, v37, a4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v44[2] = v28;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v38, (uint64_t)v44, (uint64_t)v43, 3);
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_20D023B7C;
    block[3] = &unk_24C5F0118;
    block[4] = self;
    v42 = v39;
    v40 = v39;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

- (id)_impl
{
  FMSong *v2;
  FlexSongProtocol *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_backend;
  objc_sync_exit(v2);

  return v3;
}

- (void)_loadIfNeeded
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  FMSong *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend_isLoaded(self, a2, v2, v3, v4) & 1) == 0
    && objc_msgSend_canPlay(self, v6, v7, v8, v9)
    && (objc_msgSend__loadFlexSong(self, v10, v11, v12, v13) & 1) == 0)
  {
    FlexLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = self;
      _os_log_impl(&dword_20D016000, v14, OS_LOG_TYPE_DEFAULT, "Failed to load FlexSong _impl for song: %@", (uint8_t *)&v15, 0xCu);
    }

  }
}

- (BOOL)_loadFlexSong
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
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
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  int v28;
  FMSong *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend_isLoaded(self, a2, v2, v3, v4) & 1) != 0)
  {
    FlexLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 138412290;
      v29 = self;
      _os_log_impl(&dword_20D016000, v9, OS_LOG_TYPE_DEFAULT, "ERROR: _loadFlexSong: Attempting to load already loaded FlexSong for song: %@", (uint8_t *)&v28, 0xCu);
    }

    LOBYTE(v9) = 1;
  }
  else
  {
    objc_msgSend_existingAssetWithID_(self, v6, (uint64_t)CFSTR("FMSongBundleAssetID"), v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend_isCloudBacked(v10, v11, v12, v13, v14);
    if ((_DWORD)v9)
    {
      objc_msgSend_cloudManager(v10, v15, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_uid(self, v20, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_loadAssetWithID_forSongID_(v19, v25, (uint64_t)CFSTR("FMSongBundleAssetID"), (uint64_t)v24, v26);

    }
  }
  return (char)v9;
}

- (int64_t)metadataVersion
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;

  objc_msgSend__impl(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_metadataVersion(v5, v6, v7, v8, v9);

  return v10;
}

- (BOOL)canPlay
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char canPlay;

  objc_msgSend__impl(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  canPlay = objc_msgSend_canPlay(v5, v6, v7, v8, v9);

  return canPlay;
}

- (BOOL)isLoaded
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char isLoaded;

  objc_msgSend__impl(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isLoaded = objc_msgSend_isLoaded(v5, v6, v7, v8, v9);

  return isLoaded;
}

- (BOOL)hidden
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  objc_msgSend__impl(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_hidden(v5, v6, v7, v8, v9);

  return v10;
}

- (BOOL)recalled
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  objc_msgSend__impl(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_recalled(v5, v6, v7, v8, v9);

  return v10;
}

- (NSString)uid
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;

  objc_msgSend__impl(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uid(v6, v7, v8, v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend__impl(self, v11, v12, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_uid(v16, v17, v18, v19, v20);
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = &stru_24C5F0F80;
  }

  return (NSString *)v21;
}

- (id)songName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;

  objc_msgSend__impl(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_songName(v6, v7, v8, v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend__impl(self, v11, v12, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_songName(v16, v17, v18, v19, v20);
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = &stru_24C5F0F80;
  }

  return v21;
}

- (id)artistName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;

  objc_msgSend__impl(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_artistName(v6, v7, v8, v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend__impl(self, v11, v12, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_artistName(v16, v17, v18, v19, v20);
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = &stru_24C5F0F80;
  }

  return v21;
}

- (id)tagIDs
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  objc_msgSend__impl(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tagIDs(v6, v7, v8, v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend__impl(self, v11, v12, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tagIDs(v16, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_set(MEMORY[0x24BDBCF20], v11, v12, v13, v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

- (NSDictionary)weightedKeywords
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  objc_msgSend__impl(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_weightedKeywords(v6, v7, v8, v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend__impl(self, v11, v12, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_weightedKeywords(v16, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_dictionary(MEMORY[0x24BDBCE70], v11, v12, v13, v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSDictionary *)v21;
}

- (id)keywords
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  objc_msgSend__impl(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keywords(v6, v7, v8, v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend__impl(self, v11, v12, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_keywords(v16, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_set(MEMORY[0x24BDBCF20], v11, v12, v13, v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

- (NSString)audioEncoderPresetName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;

  objc_msgSend__impl(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_audioEncoderPresetName(v6, v7, v8, v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend__impl(self, v11, v12, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_audioEncoderPresetName(v16, v17, v18, v19, v20);
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = &stru_24C5F0F80;
  }

  return (NSString *)v21;
}

- (int64_t)sampleRate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;

  objc_msgSend__loadIfNeeded(self, a2, v2, v3, v4);
  objc_msgSend__impl(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_sampleRate(v10, v11, v12, v13, v14);

  return v15;
}

- (void)updateAssets:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  int isEqualToString;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  FMSong *v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  id v70;
  void *v71;
  const char *v72;
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
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  NSObject *v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char v122;
  unsigned int v123;
  void *v125;
  void *v126;
  id obj;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  _BYTE v136[128];
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v4, v5, v6, v7);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCEB8], v8, (uint64_t)v3, v9, v10);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  obj = v3;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v132, (uint64_t)v137, 16);
  if (!v12)
  {
    v18 = 0;
    v19 = 0;
    goto LABEL_23;
  }
  v17 = v12;
  v18 = 0;
  v19 = 0;
  v20 = *(_QWORD *)v133;
  do
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v133 != v20)
        objc_enumerationMutation(obj);
      v22 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * i);
      if (v18
        || (objc_msgSend_assetID(*(void **)(*((_QWORD *)&v132 + 1) + 8 * i), v13, v14, v15, v16),
            v23 = (void *)objc_claimAutoreleasedReturnValue(),
            v27 = objc_msgSend_isEqualToString_(v23, v24, (uint64_t)CFSTR("FMSongArtworkAssetID"), v25, v26),
            v23,
            !v27))
      {
        if (v19)
          continue;
        objc_msgSend_assetID(v22, v13, v14, v15, v16);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v28, v29, (uint64_t)CFSTR("FMSongBundleAssetID"), v30, v31);

        if (isEqualToString
          && objc_msgSend_compatibilityVersion(v22, v13, v14, v15, v16) <= 4
          && objc_msgSend_compatibilityVersion(v22, v13, v14, v15, v16) >= 1)
        {
          v19 = v22;
          goto LABEL_16;
        }
        v19 = 0;
      }
      else
      {
        if (objc_msgSend_compatibilityVersion(v22, v13, v14, v15, v16) <= 4
          && objc_msgSend_compatibilityVersion(v22, v13, v14, v15, v16) > 0)
        {
          v18 = v22;
LABEL_16:
          v33 = v22;
          objc_msgSend_removeObject_(v126, v34, (uint64_t)v33, v35, v36);
          objc_msgSend_addObject_(v125, v37, (uint64_t)v33, v38, v39);
          continue;
        }
        v18 = 0;
      }
    }
    v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v132, (uint64_t)v137, 16);
  }
  while (v17);
LABEL_23:

  v48 = self;
  if (objc_msgSend_count(v126, v40, v41, v42, v43))
  {
    FlexLogForCategory(0);
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      sub_20D025AC4();

  }
  if (objc_msgSend_isClientManaged(self, v44, v45, v46, v47))
  {
    v130 = 0u;
    v131 = 0u;
    v128 = 0u;
    v129 = 0u;
    v54 = v125;
    v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v55, (uint64_t)&v128, (uint64_t)v136, 16);
    if (v56)
    {
      v61 = v56;
      v62 = *(_QWORD *)v129;
LABEL_30:
      v63 = 0;
      while (1)
      {
        if (*(_QWORD *)v129 != v62)
          objc_enumerationMutation(v54);
        v64 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * v63);
        objc_msgSend_assetID(v64, v57, v58, v59, v60);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = objc_msgSend_isEqualToString_(v65, v66, (uint64_t)CFSTR("FMSongBundleAssetID"), v67, v68);

        if ((v69 & 1) != 0)
          break;
        if (v61 == ++v63)
        {
          v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v57, (uint64_t)&v128, (uint64_t)v136, 16);
          if (v61)
            goto LABEL_30;
          v70 = v54;
          v48 = self;
          goto LABEL_45;
        }
      }
      v70 = v64;

      v48 = self;
      if (!v70)
        goto LABEL_46;
      objc_msgSend_localURL(v70, v50, v51, v52, v53);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_backendForSongBundleURL_(FlexUtilities, v72, (uint64_t)v71, v73, v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      if (v75)
      {
        objc_msgSend_artistName(self, v76, v77, v78, v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_songName(self, v81, v82, v83, v84);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_tagIDs(self, v86, v87, v88, v89);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_keywords(self, v91, v92, v93, v94);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_weightedKeywords(self, v96, v97, v98, v99);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = objc_msgSend_hidden(self, v101, v102, v103, v104);
        v122 = objc_msgSend_recalled(self, v105, v106, v107, v108);
        objc_msgSend_updateSongArtist_title_tags_keywords_weightedKeywords_hidden_recalled_metadataVersion_(v75, v109, (uint64_t)v80, (uint64_t)v85, (uint64_t)v90, v95, v100, v123, v122, 1);

        objc_msgSend_updateBackend_(self, v110, (uint64_t)v75, v111, v112);
      }
      else
      {
        FlexLogForCategory(0);
        v113 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
          sub_20D025A98();

      }
    }
    else
    {
      v70 = v54;
    }
LABEL_45:

  }
LABEL_46:
  objc_msgSend__impl(v48, v50, v51, v52, v53);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateAssets_(v114, v115, (uint64_t)v125, v116, v117);

  objc_msgSend__notifySongAssetsChanged(v48, v118, v119, v120, v121);
}

- (id)assetWithID:(id)a3
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
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
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
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;

  v4 = a3;
  objc_msgSend__impl(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetWithID_(v9, v10, (uint64_t)v4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((!v13 || (objc_msgSend_isCloudBacked(v13, v14, v15, v16, v17) & 1) == 0)
    && objc_msgSend_isEqualToString_(v4, v14, (uint64_t)CFSTR("FMSongArtworkAssetID"), v16, v17))
  {
    objc_msgSend_existingAssetWithID_(self, v14, (uint64_t)CFSTR("FMSongBundleAssetID"), v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isCloudBacked(v19, v20, v21, v22, v23))
    {
      objc_msgSend_cloudManager(v19, v24, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_uid(self, v29, v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_loadAssetWithID_forSongID_(v28, v34, (uint64_t)v4, (uint64_t)v33, v35);

    }
  }
  objc_msgSend__impl(self, v14, v18, v16, v17);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetWithID_(v36, v37, (uint64_t)v4, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

- (id)existingAssetWithID:(id)a3
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
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  objc_msgSend__impl(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_existingAssetWithID_(v9, v10, (uint64_t)v4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_isEqualToString_(v4, v14, (uint64_t)CFSTR("FMSongBundleAssetID"), v15, v16);
  return v13;
}

- (void)requestDownloadOfAllAssetsWithIDs:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_opt_new();
  objc_msgSend_requestDownloadOfAllAssetsWithIDs_withOptions_(self, v5, (uint64_t)v4, (uint64_t)v7, v6);

}

- (void)requestDownloadOfAllAssetsWithIDs:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v9)
  {
    v13 = v9;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v6);
        objc_msgSend_assetWithID_(self, v10, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15), v11, v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_requestDownloadWithOptions_(v16, v17, (uint64_t)v7, v18, v19);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v10, (uint64_t)&v20, (uint64_t)v24, 16);
    }
    while (v13);
  }

}

- (void)cancelDownloadOfAllAssetsWithIDs:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v18, (uint64_t)v22, 16);
  if (v6)
  {
    v10 = v6;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v4);
        objc_msgSend_existingAssetWithID_(self, v7, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12), v8, v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_cancelDownload(v13, v14, v15, v16, v17);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v18, (uint64_t)v22, 16);
    }
    while (v10);
  }

}

+ (NSArray)availableTagIDs
{
  if (qword_2549A1998 != -1)
    dispatch_once(&qword_2549A1998, &unk_24C5EFBA8);
  return (NSArray *)(id)qword_2549A1990;
}

+ (id)localizedNameForTagWithID:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;

  v3 = a3;
  v4 = v3;
  if (v3)
    v5 = (__CFString *)v3;
  else
    v5 = CFSTR("?");

  return v5;
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
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v18;

  objc_msgSend__loadIfNeeded(self, a3, v3, v4, v5);
  objc_msgSend__impl(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v18 = v12;
    objc_msgSend_minimumDuration(v12, v13, v14, v15, v16);
    v12 = v18;
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)naturalDuration
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v18;

  objc_msgSend__loadIfNeeded(self, a3, v3, v4, v5);
  objc_msgSend__impl(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v18 = v12;
    objc_msgSend_naturalDuration(v12, v13, v14, v15, v16);
    v12 = v18;
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (id)idealDurations
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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

  objc_msgSend__loadIfNeeded(self, a2, v2, v3, v4);
  objc_msgSend__impl(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_idealDurations(v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)renditionForDuration:(id *)a3 withOptions:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  __int128 v15;
  int64_t var3;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  if ((a3->var2 & 1) != 0)
  {
    objc_msgSend__loadIfNeeded(self, v6, v7, v8, v9);
    v15 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    objc_msgSend_renditionForDuration_withOptions_testingContext_(self, v13, (uint64_t)&v15, (uint64_t)v10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    FlexLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v15) = 138412290;
      *(_QWORD *)((char *)&v15 + 4) = self;
      _os_log_impl(&dword_20D016000, v11, OS_LOG_TYPE_DEFAULT, "invalid duration requested in renditionForDuration for song: %@", (uint8_t *)&v15, 0xCu);
    }

    v12 = 0;
  }

  return v12;
}

- (id)renditionForDuration:(id *)a3 withOptions:(id)a4 testingContext:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18;

  v8 = a5;
  v9 = a4;
  objc_msgSend__impl(self, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *a3;
  objc_msgSend_renditionForDuration_withOptions_testingContext_(v14, v15, (uint64_t)&v18, (uint64_t)v9, (uint64_t)v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (int64_t)versionFromArtworkFilename:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
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
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v3 = a3;
  if (objc_msgSend_rangeOfString_(v3, v4, (uint64_t)CFSTR("_v"), v5, v6) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend_componentsSeparatedByString_(v3, v7, (uint64_t)CFSTR("_"), v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastObject(v11, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_decimalDigitCharacterSet(MEMORY[0x24BDD14A8], v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_invertedSet(v21, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsSeparatedByCharactersInSet_(v16, v27, (uint64_t)v26, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsJoinedByString_(v30, v31, (uint64_t)&stru_24C5F0F80, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend_integerValue(v34, v35, v36, v37, v38);
  }

  return v10;
}

+ (id)loadSongBundleAtPath:(id)a3
{
  id v3;
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
  int v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  FMSong *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
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
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
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
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  FMSongAsset *v101;
  const char *v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  _QWORD v117[3];

  v117[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_stringByAppendingPathComponent_(v3, v4, (uint64_t)CFSTR("metadata.smm"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_fileExistsAtPath_(v12, v13, (uint64_t)v7, v14, v15);

  if (v16)
    objc_msgSend_loadSongInFolderWithPath_(FlexSong, v17, (uint64_t)v3, v18, v19);
  else
    objc_msgSend_loadSongAtPath_(FlexMLSong, v17, (uint64_t)v3, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = [FMSong alloc];
    v29 = (void *)objc_msgSend_initWithBackend_(v21, v22, (uint64_t)v20, v23, v24);
    if (v29)
    {
      objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v25, v26, v27, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByDeletingLastPathComponent(v3, v31, v32, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_contentsOfDirectoryAtPath_error_(v30, v36, (uint64_t)v35, 0, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_predicateWithFormat_(MEMORY[0x24BDD1758], v39, (uint64_t)CFSTR("self ENDSWITH '.jpg'"), v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)MEMORY[0x24BDD1758];
      objc_msgSend_uid(v20, v44, v45, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_predicateWithFormat_(v43, v49, (uint64_t)CFSTR("self CONTAINS %@"), v50, v51, v48);
      v52 = objc_claimAutoreleasedReturnValue();

      v53 = (void *)MEMORY[0x24BDD14C0];
      v117[0] = v42;
      v117[1] = v52;
      v115 = (void *)v52;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v54, (uint64_t)v117, 2, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_andPredicateWithSubpredicates_(v53, v57, (uint64_t)v56, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_filteredArrayUsingPredicate_(v38, v61, (uint64_t)v60, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_count(v64, v65, v66, v67, v68))
      {
        v112 = v60;
        v113 = v42;
        objc_msgSend_stringByDeletingLastPathComponent(v3, v69, v70, v71, v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v64, v74, v75, v76, v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingPathComponent_(v73, v79, (uint64_t)v78, v80, v81);
        v82 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_lastPathComponent(v82, v83, v84, v85, v86);
        v90 = objc_claimAutoreleasedReturnValue();
        v114 = v38;
        if (v82)
        {
          objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v87, (uint64_t)v82, v88, v89);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v91 = 0;
        }
        v111 = (void *)v90;
        v92 = objc_msgSend_versionFromArtworkFilename_(FMSong, v87, v90, v88, v89);
        objc_msgSend_existingAssetWithID_(v29, v93, (uint64_t)CFSTR("FMSongBundleAssetID"), v94, v95);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = objc_msgSend_compatibilityVersionForAssetLocation_(v96, v97, 0, v98, v99);
        v101 = [FMSongAsset alloc];
        v103 = (void *)objc_msgSend_initWithAssetID_assetStatus_localURL_contentVersion_compatibilityVersion_(v101, v102, (uint64_t)CFSTR("FMSongArtworkAssetID"), 0, (uint64_t)v91, v92, v100);
        v116 = v103;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v104, (uint64_t)&v116, 1, v105);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_updateAssets_(v29, v107, (uint64_t)v106, v108, v109);

        v42 = v113;
        v38 = v114;
        v60 = v112;
      }

    }
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

+ (id)loadSongsAndArtworkInFolderAtPath:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
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
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v40 = (void *)objc_opt_new();
  if (v3)
  {
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_contentsOfDirectoryAtPath_error_(v8, v9, (uint64_t)v3, 0, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v12 = v11;
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v41, (uint64_t)v45, 16);
    if (v14)
    {
      v19 = v14;
      v20 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v42 != v20)
            objc_enumerationMutation(v12);
          v22 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend_pathExtension(v22, v15, v16, v17, v18);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_isEqualToString_(v23, v24, (uint64_t)CFSTR("smsbundle"), v25, v26))
          {
            objc_msgSend_stringByAppendingPathComponent_(v3, v27, (uint64_t)v22, v28, v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_loadSongBundleAtPath_(FMSong, v31, (uint64_t)v30, v32, v33);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (v37)
              objc_msgSend_addObject_(v40, v34, (uint64_t)v37, v35, v36);

          }
        }
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v41, (uint64_t)v45, 16);
      }
      while (v19);
    }

  }
  objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCE30], v4, (uint64_t)v40, v6, v7);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

+ (BOOL)hasValidTagIDs:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v3 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_20D025864;
  v36 = sub_20D025874;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v4, v5, v6, v7);
  v37 = (id)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_20D025864;
  v30 = sub_20D025874;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v8, v9, v10, v11);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = sub_20D02587C;
  v25[3] = &unk_24C5F0140;
  v25[4] = &v32;
  v25[5] = &v26;
  objc_msgSend_enumerateObjectsUsingBlock_(v3, v12, (uint64_t)v25, v13, v14);
  v23 = objc_msgSend_count((void *)v33[5], v15, v16, v17, v18) == 1
     && objc_msgSend_count((void *)v27[5], v19, v20, v21, v22) == 1;
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v23;
}

- (id)customOptions
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

  objc_msgSend__impl(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_customOptions(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)songFormat
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;

  objc_msgSend__impl(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_songFormat(v6, v7, v8, v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend__impl(self, v11, v12, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_songFormat(v16, v17, v18, v19, v20);
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = CFSTR("?");
  }

  return (NSString *)v21;
}

- (BOOL)isClientManaged
{
  return self->_isClientManaged;
}

- (FlexSongProtocol)backend
{
  return (FlexSongProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backend, 0);
}

@end
