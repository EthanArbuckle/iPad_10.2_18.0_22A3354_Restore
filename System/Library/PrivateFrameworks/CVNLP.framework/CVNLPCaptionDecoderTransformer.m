@implementation CVNLPCaptionDecoderTransformer

- (CVNLPCaptionDecoderTransformer)initWithOptions:(id)a3 runTimeParams:(id)a4
{
  id v6;
  id v7;
  CVNLPCaptionDecoderTransformer *v8;
  const char *v9;
  uint64_t v10;
  CVNLPCaptionDecoderTransformer *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CVNLPCaptionDecoderTransformer;
  v8 = -[CVNLPCaptionModelBase initWithOptions:runTimeParams:](&v18, sel_initWithOptions_runTimeParams_, v6, v7);
  v11 = v8;
  if (v8)
  {
    v8->_startID = 0;
    v8->_endID = 0;
    objc_msgSend_objectForKeyedSubscript_(v6, v9, (uint64_t)CVNLPCaptionModelPath, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__loadVocabFile_(v11, v13, (uint64_t)v12, v14);
    objc_msgSend__loadNetwork_options_runTimeParams_(v11, v15, (uint64_t)v12, (uint64_t)v6, v7);
    objc_msgSend__createBeamSearch_runTimeParams_(v11, v16, (uint64_t)v6, (uint64_t)v7);
    if (v11->_vocabSize != v11->_outputVocabSize)
      sub_1B036AFC8(3u, (uint64_t)"Mismatching vocab file and output vocab sizes");

  }
  return v11;
}

- (void)_loadVocabFile:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  NSDictionary *v17;
  id v18;
  NSDictionary *vocab;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v4 = a3;
  objc_msgSend_URLByAppendingPathComponent_(v4, v5, (uint64_t)CFSTR("vocab_reverse.json"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99D50];
  objc_msgSend_path(v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataWithContentsOfFile_(v8, v13, (uint64_t)v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E0CB36D8], v16, (uint64_t)v15, 0, &v23);
  v17 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v18 = v23;
  vocab = self->_vocab;
  self->_vocab = v17;

  self->_vocabSize = objc_msgSend_count(self->_vocab, v20, v21, v22) + 1;
}

- (void)_loadNetwork:(id)a3 options:(id)a4 runTimeParams:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t i;
  CVNLPCaptionDecoderBlock *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  NSArray *v26;
  unint64_t v27;
  void *decoderBlocks;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void **v59;
  unint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t *p_maxCaptionLen;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t decoderBatchSize;
  unint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void **v93;
  void **v94;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    v16 = [CVNLPCaptionDecoderBlock alloc];
    v21 = (void *)objc_msgSend_initWithOptions_modelIndex_runTimeParams_(v16, v17, (uint64_t)v9, i, v10);
    if (!v21)
      break;
    objc_msgSend_addObject_(v14, v18, (uint64_t)v21, v20);

  }
  if (!objc_msgSend_count(v14, v18, v19, v20))
  {
    v25 = (char *)operator new(0x20uLL);
    strcpy(v25, "Failed to load decoder network");
    sub_1B036AFC8(3u, (uint64_t)v25);
  }
  v26 = (NSArray *)objc_msgSend_copy(v14, v22, v23, v24);
  v27 = 0;
  decoderBlocks = self->_decoderBlocks;
  self->_decoderBlocks = v26;
  while (1)
  {

    if (v27 >= objc_msgSend_count(v14, v29, v30, v31) - 1)
      break;
    objc_msgSend_decoderBlocks(self, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v35, v36, v27, v37);
    decoderBlocks = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_decoderBlocks(self, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v41, v42, v27 + 1, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setNextBlock_(decoderBlocks, v45, (uint64_t)v44, v46);
    ++v27;
  }
  objc_msgSend_firstObject(v14, v32, v33, v34);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v14, v48, v49, v50);
  v51 = objc_claimAutoreleasedReturnValue();
  v55 = (void *)v51;
  if (!v47)
  {
    decoderBatchSize = 0;
    p_maxCaptionLen = &self->_maxCaptionLen;
    self->_maxCaptionLen = 0;
    self->_decoderBatchSize = 0;
    if (!v51)
      goto LABEL_15;
    goto LABEL_20;
  }
  objc_msgSend_decoderInputNames(v47, v52, v53, v54);
  v59 = v94;
  v60 = 0xAAAAAAAAAAAAAAABLL * (v94 - v93);
  if (!v93)
  {
LABEL_13:
    if (v60 <= 4)
      goto LABEL_14;
    goto LABEL_23;
  }
  if (v94 == v93)
  {
    operator delete(v93);
    goto LABEL_13;
  }
  do
  {
    if (*((char *)v59 - 1) < 0)
      operator delete(*(v59 - 3));
    v59 -= 3;
  }
  while (v59 != v93);
  operator delete(v93);
  if (v60 < 5)
  {
LABEL_14:
    objc_msgSend_blockInput(v47, v56, v57, v58);
    objc_msgSend_blockInput(v47, v61, v62, v63);
    p_maxCaptionLen = &self->_maxCaptionLen;
    self->_maxCaptionLen = v92 * v95;
    objc_msgSend_blockInput(v47, v65, v66, v67);
    objc_msgSend_blockInput(v47, v68, v69, v70);
    objc_msgSend_blockInput(v47, v71, v72, v73);
    decoderBatchSize = v91 * v98 * v90;
    self->_decoderBatchSize = decoderBatchSize;
    if (!v55)
    {
LABEL_15:
      v75 = 0;
LABEL_21:
      v82 = v75 / (*p_maxCaptionLen * decoderBatchSize);
      goto LABEL_26;
    }
LABEL_20:
    objc_msgSend_blockOutput(v55, v52, v53, v54);
    objc_msgSend_blockOutput(v55, v76, v77, v78);
    objc_msgSend_blockOutput(v55, v79, v80, v81);
    decoderBatchSize = self->_decoderBatchSize;
    v75 = v91 * v95 * v89;
    goto LABEL_21;
  }
LABEL_23:
  objc_msgSend_blockInput(v47, v56, v57, v58);
  self->_maxCaptionLen = v98;
  objc_msgSend_blockInput(v47, v83, v84, v85);
  self->_decoderBatchSize = v97;
  if (v55)
  {
    objc_msgSend_blockOutput(v55, v86, v87, v88);
    v82 = v96;
  }
  else
  {
    v82 = 0;
  }
LABEL_26:
  self->_outputVocabSize = v82;

}

- (void)_createBeamSearch:(id)a3 runTimeParams:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  id v50;

  v50 = a3;
  v6 = a4;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v50, v11, (uint64_t)CVNLPBeamSearchSize, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v13;
  if (v13)
    v18 = objc_msgSend_unsignedIntegerValue(v13, v14, v15, v16);
  else
    v18 = 1;
  self->_beamSize = v18;
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v14, v18, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v20, (uint64_t)v19, (uint64_t)CVNLPBeamSearchSize);

  v21 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_captionModelLengthNormalizationFactor(v6, v22, v23, v24);
  objc_msgSend_numberWithDouble_(v21, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v29, (uint64_t)v28, (uint64_t)CVNLPBeamSearchLengthNormalizationFactor);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v30, self->_endID, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v33, (uint64_t)v32, (uint64_t)CVNLPBeamEndToken);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v34, self->_vocabSize, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v37, (uint64_t)v36, (uint64_t)CVNLPBeamSearchOutputVocabSize);

  objc_msgSend_setObject_forKeyedSubscript_(v10, v38, (uint64_t)self->_vocab, (uint64_t)CVNLPBeamSearchOutputVocabMap);
  objc_msgSend_blackListRules(v6, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v43, (uint64_t)v42, (uint64_t)CVNLPBeamSearchBlacklistRules);

  objc_msgSend_setObject_forKeyedSubscript_(v10, v44, MEMORY[0x1E0C9AAB0], (uint64_t)CVNLPBeamSearchIncludeLanguageModel);
  self->_beamSearch = (CVNLPBeamSearch *)CVNLPBeamSearchCreate(v10, 0);
  objc_msgSend_genderedTokens(v6, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v49, (uint64_t)v48, (uint64_t)CVNLPBeamSearchOutputVocabFilterList);

  self->_filterBeamSearch = (CVNLPBeamSearch *)CVNLPBeamSearchCreate(v10, 0);
}

- (void)dealloc
{
  CVNLPBeamSearch *beamSearch;
  CVNLPBeamSearch *filterBeamSearch;
  objc_super v5;

  beamSearch = self->_beamSearch;
  if (beamSearch)
    CFRelease(beamSearch);
  filterBeamSearch = self->_filterBeamSearch;
  if (filterBeamSearch)
    CFRelease(filterBeamSearch);
  v5.receiver = self;
  v5.super_class = (Class)CVNLPCaptionDecoderTransformer;
  -[CVNLPCaptionDecoderTransformer dealloc](&v5, sel_dealloc);
}

- (id)computeCaptionForImageWithInputs:(id)a3 genderOption:(int)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B0391F5C;
  v23 = sub_1B0391F6C;
  v24 = 0;
  objc_msgSend_perfResults(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1B0391F74;
  v15[3] = &unk_1E60CE4A0;
  v17 = &v19;
  v15[4] = self;
  v11 = v6;
  v16 = v11;
  v18 = a4;
  objc_msgSend_run_block_(v10, v12, (uint64_t)CFSTR("Decode"), (uint64_t)v15);

  v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v13;
}

- (id)computeCaptionForImageWithInputsImpl:(id)a3 genderOption:(int)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void **v22;
  unint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  CVNLPCaptionDecoderTransformer *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
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
  unint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  size_t v61;
  const char *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t started;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  id v86;
  const char *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  id v92;
  const char *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t j;
  void *v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
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
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  unint64_t k;
  void *v129;
  const char *v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  float v142;
  float v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  double v151;
  double v152;
  const char *v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  id v169;
  uint64_t v170;
  id obj;
  void *v172;
  uint64_t v173;
  id v174;
  uint64_t v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  _QWORD v180[4];
  id v181;
  void **v182;
  uint64_t v183;
  _QWORD v184[4];
  id v185;
  id v186;
  CVNLPCaptionDecoderTransformer *v187;
  id v188;
  void **v189;
  unint64_t v190;
  void **v191;
  id v192;
  void **v193;
  id *v194;
  id *v195;
  void *__p;
  void **p_p;
  uint64_t v198;
  uint64_t (*v199)(uint64_t, uint64_t);
  void (*v200)(uint64_t);
  id v201;
  char *v202;
  char *v203;
  char *v204;
  id v205;
  id v206;
  _OWORD v207[10];
  uint64_t v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  CVNLPCaptionDecoderTransformer *v213;
  _QWORD v214[3];
  _QWORD v215[3];
  _BYTE v216[128];
  void *v217;
  _BYTE v218[128];
  uint64_t v219;

  v219 = *MEMORY[0x1E0C80C00];
  v213 = self;
  v6 = a3;
  v9 = 9;
  if (!a4)
    v9 = 10;
  v170 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR___CVNLPCaptionDecoderTransformer__startID[v9]);
  v167 = v6;
  objc_msgSend_objectAtIndexedSubscript_(v6, v7, 0, v8);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decoderBlocks(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v17;
  if (!v17)
  {

    goto LABEL_15;
  }
  objc_msgSend_decoderInputNames(v17, v18, v19, v20);
  v22 = p_p;
  v23 = 0xAAAAAAAAAAAAAAABLL * (((char *)p_p - (_BYTE *)__p) >> 3);
  if (!__p)
  {

    if (v23 >= 5)
      goto LABEL_26;
    goto LABEL_15;
  }
  v24 = __p;
  if (p_p != __p)
  {
    do
    {
      if (*((char *)v22 - 1) < 0)
        operator delete(*(v22 - 3));
      v22 -= 3;
    }
    while (v22 != __p);
    v24 = __p;
  }
  p_p = (void **)__p;
  operator delete(v24);

  if (v23 < 5)
  {
LABEL_15:
    v211 = 0u;
    v212 = 0u;
    v209 = 0u;
    v210 = 0u;
    objc_msgSend_decoderBlocks(v213, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v209, (uint64_t)v218, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v210;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v210 != v34)
            objc_enumerationMutation(v28);
          v36 = *(void **)(*((_QWORD *)&v209 + 1) + 8 * i);
          v37 = v213;
          if (v36)
          {
            objc_msgSend_attFeatsPlaceholderBlob(v36, v30, v31, v32);
          }
          else
          {
            v208 = 0;
            memset(v207, 0, sizeof(v207));
          }
          objc_msgSend__copy_data_to_blob_repeated_to_(v37, v30, (uint64_t)v172, (uint64_t)v207);
        }
        v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v30, (uint64_t)&v209, (uint64_t)v218, 16);
      }
      while (v33);
    }

  }
LABEL_26:
  objc_msgSend_decoderBlocks(v213, v25, v26, v27);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v38, v39, v40, v41);
  v206 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_decoderBlocks(v213, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v45, v46, v47, v48);
  v205 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = v52;
  v56 = objc_msgSend_maxCaptionLen(v213, v53, v54, v55);
  v60 = v56;
  v202 = 0;
  v203 = 0;
  v204 = 0;
  if (v56)
  {
    if (v56 >> 62)
      sub_1B02D7758();
    v61 = 4 * v56;
    v202 = (char *)operator new(4 * v56);
    v204 = &v202[4 * v60];
    v165 = v202;
    bzero(v202, v61);
    v203 = v204;
  }
  else
  {
    v165 = 0;
  }
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v57, v58, v59);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v52, v62, (uint64_t)v166, (uint64_t)CVNLPBeamSearchNextTokenMetaData);
  v63 = (void *)MEMORY[0x1E0CB37E8];
  started = objc_msgSend_startID(v213, v64, v65, v66);
  objc_msgSend_numberWithUnsignedInteger_(v63, v68, started, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v52, v71, (uint64_t)v70, (uint64_t)CVNLPBeamSearchNextTokenID);

  __p = 0;
  p_p = &__p;
  v198 = 0x3032000000;
  v199 = sub_1B0391F5C;
  v200 = sub_1B0391F6C;
  v217 = v52;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v72, (uint64_t)&v217, 1);
  v201 = (id)objc_claimAutoreleasedReturnValue();
  v169 = v206;
  v76 = 0;
  v77 = MEMORY[0x1E0C809B0];
  do
  {
    if (v76 >= objc_msgSend_maxCaptionLen(v213, v73, v74, v75))
      break;
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v78, v79, v80);
    v81 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_perfResults(v213, v82, v83, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v184[0] = v77;
    v184[1] = 3321888768;
    v184[2] = sub_1B0392AA0;
    v184[3] = &unk_1E60CD970;
    v185 = v206;
    v190 = v76;
    v186 = v172;
    v187 = v213;
    v189 = &__p;
    v191 = (void **)&v213;
    v192 = v169;
    v193 = (void **)&v213;
    v194 = &v205;
    v195 = &v206;
    v86 = (id)v81;
    v188 = v86;
    objc_msgSend_run_block_(v85, v87, (uint64_t)CFSTR("DecodeBlock"), (uint64_t)v184);

    objc_msgSend_perfResults(v213, v88, v89, v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v180[0] = v77;
    v180[1] = 3221225472;
    v180[2] = sub_1B0393CC0;
    v180[3] = &unk_1E60CE518;
    v182 = &__p;
    v183 = v170;
    v92 = v86;
    v181 = v92;
    objc_msgSend_run_block_(v91, v93, (uint64_t)CFSTR("OneStep"), (uint64_t)v180);

    LOBYTE(v81) = objc_msgSend_count(p_p[5], v94, v95, v96) == 0;
    ++v76;
  }
  while ((v81 & 1) == 0);
  v164 = (void *)CVNLPBeamSearchCopyTopBeams(v170);
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v97, v98, v99);
  v174 = (id)objc_claimAutoreleasedReturnValue();
  v178 = 0u;
  v179 = 0u;
  v176 = 0u;
  v177 = 0u;
  obj = v164;
  v101 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v100, (uint64_t)&v176, (uint64_t)v216, 16);
  if (v101)
  {
    v173 = *(_QWORD *)v177;
    do
    {
      v175 = v101;
      for (j = 0; j != v175; ++j)
      {
        if (*(_QWORD *)v177 != v173)
          objc_enumerationMutation(obj);
        v106 = *(void **)(*((_QWORD *)&v176 + 1) + 8 * j);
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v102, v103, v104);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v106, v108, (uint64_t)CVNLPBeamTokens, v109);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v106, v111, (uint64_t)CVNLPBeamScore, v112);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_count(v110, v114, v115, v116))
        {
          objc_msgSend_lastObject(v110, v117, v118, v119);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          v124 = objc_msgSend_unsignedIntegerValue(v120, v121, v122, v123);
          LODWORD(v124) = v124 == objc_msgSend_endID(v213, v125, v126, v127);

          if ((_DWORD)v124)
          {
            for (k = 0; k < objc_msgSend_count(v110, v117, v118, v119) - 1; ++k)
            {
              objc_msgSend_objectAtIndexedSubscript_(v110, v117, k, v119);
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v130, (uint64_t)CFSTR("%@"), v131, v129);
              v132 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_vocab(v213, v133, v134, v135);
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v136, v137, (uint64_t)v132, v138);
              v139 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v107, v140, (uint64_t)v139, v141);

            }
          }
        }
        objc_msgSend_floatValue(v113, v117, v118, v119);
        v143 = v142;
        objc_msgSend_runTimeParams(v213, v144, v145, v146);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_captionModelMinimumConfidence(v147, v148, v149, v150);
        v152 = v151;

        v214[0] = CVNLPGeneratedCaption;
        objc_msgSend_componentsJoinedByString_(v107, v153, (uint64_t)CFSTR(" "), v154);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        v215[0] = v155;
        v215[1] = v113;
        v214[1] = CVNLPGeneratedCaptionScore;
        v214[2] = CVNLPGeneratedCaptionConfidenceLow;
        objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v156, v152 >= v143, v157);
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        v215[2] = v158;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v159, (uint64_t)v215, (uint64_t)v214, 3);
        v160 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_addObject_(v174, v161, (uint64_t)v160, v162);
      }
      v101 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v102, (uint64_t)&v176, (uint64_t)v216, 16);
    }
    while (v101);
  }

  sub_1B035BD2C((_QWORD *)(v170 + 16));
  _Block_object_dispose(&__p, 8);

  if (v165)
    operator delete(v165);

  return v174;
}

- (id)performanceResults
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32.receiver = self;
  v32.super_class = (Class)CVNLPCaptionDecoderTransformer;
  -[CVNLPModelBase performanceResults](&v32, sel_performanceResults);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addEntriesFromDictionary_(v5, v7, (uint64_t)v6, v8);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend_decoderBlocks(self, v9, v10, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v28, (uint64_t)v33, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v29;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(v12);
        objc_msgSend_performanceResults(*(void **)(*((_QWORD *)&v28 + 1) + 8 * v19), v14, v15, v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addEntriesFromDictionary_(v5, v21, (uint64_t)v20, v22);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v28, (uint64_t)v33, 16);
    }
    while (v17);
  }

  v26 = (void *)objc_msgSend_copy(v5, v23, v24, v25);
  return v26;
}

- (unint64_t)startID
{
  return self->_startID;
}

- (void)setStartID:(unint64_t)a3
{
  self->_startID = a3;
}

- (unint64_t)endID
{
  return self->_endID;
}

- (void)setEndID:(unint64_t)a3
{
  self->_endID = a3;
}

- (unint64_t)decoderBatchSize
{
  return self->_decoderBatchSize;
}

- (void)setDecoderBatchSize:(unint64_t)a3
{
  self->_decoderBatchSize = a3;
}

- (unint64_t)maxCaptionLen
{
  return self->_maxCaptionLen;
}

- (void)setMaxCaptionLen:(unint64_t)a3
{
  self->_maxCaptionLen = a3;
}

- (unint64_t)vocabSize
{
  return self->_vocabSize;
}

- (void)setVocabSize:(unint64_t)a3
{
  self->_vocabSize = a3;
}

- (unint64_t)outputVocabSize
{
  return self->_outputVocabSize;
}

- (void)setOutputVocabSize:(unint64_t)a3
{
  self->_outputVocabSize = a3;
}

- (NSDictionary)vocab
{
  return self->_vocab;
}

- (void)setVocab:(id)a3
{
  objc_storeStrong((id *)&self->_vocab, a3);
}

- (NSArray)decoderBlocks
{
  return self->_decoderBlocks;
}

- (void)setDecoderBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_decoderBlocks, a3);
}

- (unint64_t)beamSize
{
  return self->_beamSize;
}

- (void)setBeamSize:(unint64_t)a3
{
  self->_beamSize = a3;
}

- (CVNLPBeamSearch)beamSearch
{
  return self->_beamSearch;
}

- (void)setBeamSearch:(CVNLPBeamSearch *)a3
{
  self->_beamSearch = a3;
}

- (CVNLPBeamSearch)filterBeamSearch
{
  return self->_filterBeamSearch;
}

- (void)setFilterBeamSearch:(CVNLPBeamSearch *)a3
{
  self->_filterBeamSearch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decoderBlocks, 0);
  objc_storeStrong((id *)&self->_vocab, 0);
}

@end
