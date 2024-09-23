@implementation CHRemoveSpacesFromEnglishAndKoreanParticlesStep

- (CHRemoveSpacesFromEnglishAndKoreanParticlesStep)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CHRemoveSpacesFromEnglishAndKoreanParticlesStep *v6;
  uint64_t v7;
  NSCharacterSet *koreanParticlesCharSet;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CHRemoveSpacesFromEnglishAndKoreanParticlesStep;
  v6 = -[CHRemoveSpacesFromEnglishAndKoreanParticlesStep init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v2, (uint64_t)CFSTR("이는다고가지나요에도니라로은면을만들인네의랑래를"), v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    koreanParticlesCharSet = v6->_koreanParticlesCharSet;
    v6->_koreanParticlesCharSet = (NSCharacterSet *)v7;

  }
  return v6;
}

- (id)process:(id)a3 options:(id)a4
{
  id *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t i;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
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
  void *v63;
  __int128 v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  id v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  id v143;
  void *v145;
  void *v146;
  void *v147;
  _QWORD v148[4];
  id v149;
  CHRemoveSpacesFromEnglishAndKoreanParticlesStep *v150;
  id v151;
  uint64_t *v152;
  uint8_t *v153;
  unint64_t v154;
  uint8_t buf[8];
  uint8_t *v156;
  uint64_t v157;
  __n128 (*v158)(uint64_t, uint64_t);
  uint64_t (*v159)();
  void *v160;
  __int128 v161;
  __int128 v162;
  uint64_t v163;
  uint64_t *v164;
  uint64_t v165;
  uint64_t (*v166)(uint64_t, uint64_t);
  void (*v167)(uint64_t);
  id v168;

  v5 = (id *)a3;
  v143 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v6 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_DEBUG, "CHRemoveSpacesFromEnglishAndKoreanParticlesStep is running", buf, 2u);
  }

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8, v9, v10, v11);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v12, v13, v14, v15, v16);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    objc_msgSend_result(v5, v17, v18, v19, v20, v21, v143);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v23, v24, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend_count(v29, v30, v31, v32, v33, v34);

    if (i >= v35)
      break;
    objc_msgSend_result(v5, v36, v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v41, v42, v43, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v47, v48, i, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v53, v54, v55, v56, v57);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v58, v59, v60, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v163 = 0;
    v164 = &v163;
    v165 = 0x3032000000;
    v166 = sub_1BE8A7340;
    v167 = sub_1BE8A7350;
    v168 = 0;
    *(_QWORD *)buf = 0;
    v156 = buf;
    v157 = 0x5012000000;
    v158 = sub_1BE8B2614;
    v159 = nullsub_54;
    v160 = &unk_1BE94989A;
    v64 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v161 = *MEMORY[0x1E0C9D628];
    v162 = v64;
    objc_msgSend_result(v5, v65, v66, v67, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v5, v71, v72, v73, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend_tokenColumnCount(v76, v77, v78, v79, v80, v81);
    v148[0] = MEMORY[0x1E0C809B0];
    v148[1] = 3221225472;
    v148[2] = sub_1BE8B3314;
    v148[3] = &unk_1E77F6820;
    v83 = v63;
    v149 = v83;
    v150 = self;
    v154 = i;
    v152 = &v163;
    v84 = v147;
    v151 = v84;
    v153 = buf;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v70, v85, (uint64_t)v52, 0, v82, (uint64_t)v148);

    v90 = v164[5];
    if (v90)
      objc_msgSend_addObject_(v84, v86, v90, v87, v88, v89);
    if (objc_msgSend_count(v84, v86, v90, v87, v88, v89))
    {
      if ((objc_msgSend_isEqual_(v84, v91, (uint64_t)v83, v92, v93, v94) & 1) == 0)
      {
        objc_msgSend_addObject_(v146, v91, (uint64_t)v84, v92, v93, v94);
        objc_msgSend_result(v5, v95, v96, v97, v98, v99);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_transcriptionPathScores(v100, v101, v102, v103, v104, v105);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v106, v107, i, v108, v109, v110);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v145, v112, (uint64_t)v111, v113, v114, v115);

      }
    }
    objc_msgSend_addObject_(v146, v91, (uint64_t)v83, v92, v93, v94);
    objc_msgSend_result(v5, v116, v117, v118, v119, v120);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPathScores(v121, v122, v123, v124, v125, v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v127, v128, i, v129, v130, v131);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v145, v133, (uint64_t)v132, v134, v135, v136);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v163, 8);

  }
  objc_msgSend_result(v5, v36, v37, v38, v39, v40);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v137, v138, (uint64_t)v146, (uint64_t)v145, v139, v140);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_storeStrong(v5 + 3, v141);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_koreanParticlesCharSet, 0);
}

@end
