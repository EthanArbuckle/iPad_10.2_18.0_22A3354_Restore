@implementation BCUCoverEffects

- (BCUCoverEffects)initWithRenderer:(id)a3 mode:(unint64_t)a4
{
  id v7;
  BCUCoverEffects *v8;
  BCUCoverEffects *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _BCUCoverEffectsBookBinding *v23;
  _BCUCoverEffectsBookBinding *v24;
  _BCUCoverEffectsBookBinding *v25;
  _BCUCoverEffectsBookBinding *v26;
  _BCUCoverEffectsBookBinding *v27;
  _BCUCoverEffectsBookBinding *v28;
  _BCUCoverEffectsBookBinding *v29;
  _BCUCoverEffectsBookBinding *v30;
  _BCUCoverEffectsAudiobook *v31;
  _BCUCoverEffectsAudiobook *v32;
  _BCUCoverEffectsAudiobook *v33;
  _BCUCoverEffectsAudiobook *v34;
  _BCUCoverEffectsAudiobook *v35;
  _BCUCoverEffectsAudiobook *v36;
  _BCUCoverEffectsPDF *v37;
  _BCUCoverEffectsPDF *v38;
  _BCUCoverEffectsPDF *v39;
  _BCUCoverEffectsPDF *v40;
  _BCUCoverEffectsPDF *v41;
  _BCUCoverEffectsPDF *v42;
  _BCUCoverEffectsIdentity *v43;
  uint64_t v44;
  NSArray *bookCoverEffectFilters;
  _BCUCoverEffectsSeriesStack *v46;
  _BCUCoverEffectsSeriesStack *v47;
  _BCUCoverEffectsSeriesStack *v48;
  uint64_t v49;
  NSArray *seriesCoverEffectFilters;
  _BCUCoverEffectsBookBinding *v51;
  _BCUCoverEffectsBookBinding *v52;
  _BCUCoverEffectsBookBinding *v53;
  _BCUCoverEffectsBookBinding *v54;
  _BCUCoverEffectsBookBinding *v55;
  _BCUCoverEffectsBookBinding *v56;
  _BCUCoverEffectsBookBinding *v57;
  _BCUCoverEffectsBookBinding *v58;
  _BCUCoverEffectsBookBinding *v59;
  _BCUCoverEffectsBookBinding *v60;
  _BCUCoverEffectsBookBinding *v61;
  _BCUCoverEffectsBookBinding *v62;
  _BCUCoverEffectsBookBinding *v63;
  _BCUCoverEffectsBookBinding *v64;
  _BCUCoverEffectsBookBinding *v65;
  _BCUCoverEffectsBookBinding *v66;
  _BCUCoverEffectsBookBinding *v67;
  _BCUCoverEffectsBookBinding *v68;
  _BCUCoverEffectsAudiobook *v69;
  _BCUCoverEffectsAudiobook *v70;
  _BCUCoverEffectsAudiobook *v71;
  _BCUCoverEffectsAudiobook *v72;
  _BCUCoverEffectsAudiobook *v73;
  _BCUCoverEffectsBookBinding *v74;
  _BCUCoverEffectsBookBinding *v75;
  _BCUCoverEffectsBookBinding *v76;
  _BCUCoverEffectsBookBinding *v77;
  _BCUCoverEffectsBookBinding *v78;
  _BCUCoverEffectsBookBinding *v79;
  _BCUCoverEffectsBookBinding *v80;
  _BCUCoverEffectsBookBinding *v81;
  _BCUCoverEffectsBookBinding *v82;
  _BCUCoverEffectsBookBinding *v83;
  _BCUCoverEffectsBookBinding *v84;
  _BCUCoverEffectsBookBinding *v85;
  _BCUCoverEffectsBookBinding *v86;
  _BCUCoverEffectsBookBinding *v87;
  _BCUCoverEffectsBookBinding *v88;
  _BCUCoverEffectsBookBinding *v89;
  _BCUCoverEffectsBookBinding *v90;
  _BCUCoverEffectsBookBinding *v91;
  _BCUCoverEffectsBookBinding *v92;
  _BCUCoverEffectsAudiobook *v93;
  _BCUCoverEffectsAudiobook *v94;
  _BCUCoverEffectsAudiobook *v95;
  _BCUCoverEffectsAudiobook *v96;
  _BCUCoverEffectsAudiobook *v97;
  _BCUCoverEffectsAudiobook *v98;
  _BCUCoverEffectsAudiobook *v99;
  _BCUCoverEffectsAudiobook *v100;
  _BCUCoverEffectsAudiobook *v101;
  _BCUCoverEffectsAudiobook *v102;
  uint64_t v103;
  NSArray *templateImageFilters;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  _BCUCoverEffectsBookBinding *v129;
  _BCUCoverEffectsBookBinding *v130;
  _BCUCoverEffectsBookBinding *v131;
  _BCUCoverEffectsBookBinding *v132;
  _BCUCoverEffectsBookBinding *v133;
  _BCUCoverEffectsBookBinding *v134;
  _BCUCoverEffectsBookBinding *v135;
  _BCUCoverEffectsBookBinding *v136;
  _BCUCoverEffectsBookBinding *v137;
  _BCUCoverEffectsBookBinding *v138;
  _BCUCoverEffectsBookBinding *v139;
  _BCUCoverEffectsBookBinding *v140;
  _BCUCoverEffectsBookBinding *v141;
  _BCUCoverEffectsBookBinding *v142;
  _BCUCoverEffectsBookBinding *v143;
  _BCUCoverEffectsBookBinding *v144;
  _BCUCoverEffectsBookBinding *v145;
  _BCUCoverEffectsPDF *v146;
  _BCUCoverEffectsPDF *v147;
  _BCUCoverEffectsAudiobook *v148;
  _BCUCoverEffectsAudiobook *v149;
  _BCUCoverEffectsAudiobook *v150;
  _BCUCoverEffectsAudiobook *v151;
  _BCUCoverEffectsAudiobook *v152;
  _BCUCoverEffectsBookBinding *v153;
  _BCUCoverEffectsBookBinding *v154;
  _BCUCoverEffectsAudiobook *v155;
  _BCUCoverEffectsBookBinding *v156;
  _BCUCoverEffectsAudiobook *v157;
  _BCUCoverEffectsBookBinding *v158;
  _BCUCoverEffectsAudiobook *v159;
  _BCUCoverEffectsBookBinding *v160;
  _BCUCoverEffectsAudiobook *v161;
  _BCUCoverEffectsBookBinding *v162;
  _BCUCoverEffectsBookBinding *v163;
  _BCUCoverEffectsBookBinding *v164;
  _BCUCoverEffectsBookBinding *v165;
  _BCUCoverEffectsBookBinding *v166;
  _BCUCoverEffectsBookBinding *v167;
  _BCUCoverEffectsBookBinding *v168;
  _BCUCoverEffectsBookBinding *v169;
  _BCUCoverEffectsBookBinding *v170;
  _BCUCoverEffectsBookBinding *v171;
  _BCUCoverEffectsBookBinding *v172;
  _BCUCoverEffectsBookBinding *v173;
  _BCUCoverEffectsBookBinding *v174;
  _BCUCoverEffectsBookBinding *v175;
  _BCUCoverEffectsBookBinding *v176;
  _BCUCoverEffectsBookBinding *v177;
  _BCUCoverEffectsBookBinding *v178;
  _BCUCoverEffectsBookBinding *v179;
  _BCUCoverEffectsBookBinding *v180;
  _BCUCoverEffectsBookBinding *v181;
  _BCUCoverEffectsBookBinding *v182;
  _BCUCoverEffectsBookBinding *v183;
  _BCUCoverEffectsBookBinding *v184;
  _BCUCoverEffectsBookBinding *v185;
  _BCUCoverEffectsBookBinding *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  id v192;
  void *v193;
  id v194;
  id v195;
  objc_super v196;
  _QWORD v197[48];
  _QWORD v198[3];
  _QWORD v199[27];

  v199[25] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v196.receiver = self;
  v196.super_class = (Class)BCUCoverEffects;
  v8 = -[BCUCoverEffects init](&v196, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_renderer, a3);
    v9->_mode = a4;
    if (!a4)
    {
      v192 = v7;
      if (qword_2540D9810 != -1)
        dispatch_once(&qword_2540D9810, &unk_24F114060);
      v10 = (void *)qword_2540D9818;
      v11 = (void *)qword_2540D9828;
      v12 = (void *)qword_2540D9820;
      v13 = (void *)qword_2540D9830;
      v14 = (void *)qword_2540D97D8;
      v15 = (void *)qword_2540D97E8;
      v16 = (void *)qword_2540D97E0;
      v195 = (id)qword_2540D97F0;
      v17 = v16;
      v18 = v15;
      v19 = v14;
      v194 = v13;
      v20 = v12;
      v21 = v11;
      v22 = v10;
      v185 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:]([_BCUCoverEffectsBookBinding alloc], "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("BCUCoverEffectsIdentifierBookBinding"), v9->_renderer, v19, 0, 0, 0);
      v199[0] = v185;
      v183 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:]([_BCUCoverEffectsBookBinding alloc], "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("BCUCoverEffectsIdentifierBookBindingNight"), v9->_renderer, v17, 0, 0, 0);
      v199[1] = v183;
      v23 = [_BCUCoverEffectsBookBinding alloc];
      v181 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v23, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("BCUCoverEffectsIdentifierBookBindingWithShadow"), v9->_renderer, v19, v22, qword_2540D9838, 0);
      v199[2] = v181;
      v24 = [_BCUCoverEffectsBookBinding alloc];
      v193 = v20;
      v179 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v24, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("BCUCoverEffectsIdentifierBookBindingNightWithShadow"), v9->_renderer, v17, v20, qword_2540D9840, 0);
      v199[3] = v179;
      v25 = [_BCUCoverEffectsBookBinding alloc];
      v177 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v25, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("BCUCoverEffectsIdentifierBookBindingShadowOnly"), v9->_renderer, 0, v22, qword_2540D9838, 1);
      v199[4] = v177;
      v26 = [_BCUCoverEffectsBookBinding alloc];
      v175 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v26, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("BCUCoverEffectsIdentifierBookBindingNightShadowOnly"), v9->_renderer, 0, v20, qword_2540D9840, 1);
      v199[5] = v175;
      v191 = v18;
      v173 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:]([_BCUCoverEffectsBookBinding alloc], "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("BCUCoverEffectsIdentifierBookBindingRTL"), v9->_renderer, v18, 0, 0, 0);
      v199[6] = v173;
      v171 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:]([_BCUCoverEffectsBookBinding alloc], "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("BCUCoverEffectsIdentifierBookBindingRTLNight"), v9->_renderer, v195, 0, 0, 0);
      v199[7] = v171;
      v27 = [_BCUCoverEffectsBookBinding alloc];
      v190 = v21;
      v169 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v27, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("BCUCoverEffectsIdentifierBookBindingRTLWithShadow"), v9->_renderer, v18, v21, qword_2540D9848, 0);
      v199[8] = v169;
      v28 = [_BCUCoverEffectsBookBinding alloc];
      v167 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v28, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("BCUCoverEffectsIdentifierBookBindingRTLNightWithShadow"), v9->_renderer, v195, v194, qword_2540D9850, 0);
      v199[9] = v167;
      v29 = [_BCUCoverEffectsBookBinding alloc];
      v165 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v29, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("BCUCoverEffectsIdentifierBookBindingRTLShadowOnly"), v9->_renderer, 0, v21, qword_2540D9848, 1);
      v199[10] = v165;
      v30 = [_BCUCoverEffectsBookBinding alloc];
      v163 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v30, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("BCUCoverEffectsIdentifierBookBindingRTLNightShadowOnly"), v9->_renderer, 0, v194, qword_2540D9850, 1);
      v199[11] = v163;
      v189 = v19;
      v161 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:]([_BCUCoverEffectsAudiobook alloc], "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("BCUCoverEffectsIdentifierAudiobook"), v9->_renderer, v19, 0, 0, 0);
      v199[12] = v161;
      v187 = v17;
      v159 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:]([_BCUCoverEffectsAudiobook alloc], "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("BCUCoverEffectsIdentifierAudiobookNight"), v9->_renderer, v17, 0, 0, 0);
      v199[13] = v159;
      v31 = [_BCUCoverEffectsAudiobook alloc];
      v188 = v22;
      v157 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v31, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("BCUCoverEffectsIdentifierAudiobookWithShadow"), v9->_renderer, v19, v22, qword_2540D9838, 0);
      v199[14] = v157;
      v32 = [_BCUCoverEffectsAudiobook alloc];
      v155 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v32, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("BCUCoverEffectsIdentifierAudiobookNightWithShadow"), v9->_renderer, v17, v20, qword_2540D9840, 0);
      v199[15] = v155;
      v33 = [_BCUCoverEffectsAudiobook alloc];
      v34 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v33, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("BCUCoverEffectsIdentifierAudiobookShadowOnly"), v9->_renderer, 0, v22, qword_2540D9838, 1);
      v199[16] = v34;
      v35 = [_BCUCoverEffectsAudiobook alloc];
      v36 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v35, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("BCUCoverEffectsIdentifierAudiobookNightShadowOnly"), v9->_renderer, 0, v20, qword_2540D9840, 1);
      v199[17] = v36;
      v37 = -[_BCUCoverEffectsPDF initWithIdentifier:renderer:image:shadow:night:]([_BCUCoverEffectsPDF alloc], "initWithIdentifier:renderer:image:shadow:night:", CFSTR("BCUCoverEffectsIdentifierPDF"), v9->_renderer, 1, 0, 0);
      v199[18] = v37;
      v38 = -[_BCUCoverEffectsPDF initWithIdentifier:renderer:image:shadow:night:]([_BCUCoverEffectsPDF alloc], "initWithIdentifier:renderer:image:shadow:night:", CFSTR("BCUCoverEffectsIdentifierPDFNight"), v9->_renderer, 1, 0, 1);
      v199[19] = v38;
      v39 = -[_BCUCoverEffectsPDF initWithIdentifier:renderer:image:shadow:night:]([_BCUCoverEffectsPDF alloc], "initWithIdentifier:renderer:image:shadow:night:", CFSTR("BCUCoverEffectsIdentifierPDFWithShadow"), v9->_renderer, 1, 1, 0);
      v199[20] = v39;
      v40 = -[_BCUCoverEffectsPDF initWithIdentifier:renderer:image:shadow:night:]([_BCUCoverEffectsPDF alloc], "initWithIdentifier:renderer:image:shadow:night:", CFSTR("BCUCoverEffectsIdentifierPDFNightWithShadow"), v9->_renderer, 1, 1, 1);
      v199[21] = v40;
      v41 = -[_BCUCoverEffectsPDF initWithIdentifier:renderer:image:shadow:night:]([_BCUCoverEffectsPDF alloc], "initWithIdentifier:renderer:image:shadow:night:", CFSTR("BCUCoverEffectsIdentifierPDFShadowOnly"), v9->_renderer, 0, 1, 0);
      v199[22] = v41;
      v42 = -[_BCUCoverEffectsPDF initWithIdentifier:renderer:image:shadow:night:]([_BCUCoverEffectsPDF alloc], "initWithIdentifier:renderer:image:shadow:night:", CFSTR("BCUCoverEffectsIdentifierPDFNightShadowOnly"), v9->_renderer, 0, 1, 1);
      v199[23] = v42;
      v43 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:]([_BCUCoverEffectsIdentity alloc], "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("BCUCoverEffectsIdentifierIdentity"), v9->_renderer, 0, 0, 0, 0);
      v199[24] = v43;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v199, 25);
      v44 = objc_claimAutoreleasedReturnValue();
      bookCoverEffectFilters = v9->_bookCoverEffectFilters;
      v9->_bookCoverEffectFilters = (NSArray *)v44;

      v46 = -[_BCUCoverEffectsSeriesStack initWithIdentifier:renderer:]([_BCUCoverEffectsSeriesStack alloc], "initWithIdentifier:renderer:", CFSTR("BCUCoverEffectsIdentifierSeriesStackDiagonal"), v9->_renderer);
      v198[0] = v46;
      v47 = -[_BCUCoverEffectsSeriesStack initWithIdentifier:renderer:]([_BCUCoverEffectsSeriesStack alloc], "initWithIdentifier:renderer:", CFSTR("BCUCoverEffectsIdentifierSeriesStackHorizontal"), v9->_renderer);
      v198[1] = v47;
      v48 = -[_BCUCoverEffectsSeriesStack initWithIdentifier:renderer:]([_BCUCoverEffectsSeriesStack alloc], "initWithIdentifier:renderer:", CFSTR("BCUCoverEffectsIdentifierSeriesStackHorizontalRTL"), v9->_renderer);
      v198[2] = v48;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v198, 3);
      v49 = objc_claimAutoreleasedReturnValue();
      seriesCoverEffectFilters = v9->_seriesCoverEffectFilters;
      v9->_seriesCoverEffectFilters = (NSArray *)v49;

      v51 = [_BCUCoverEffectsBookBinding alloc];
      v186 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v51, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("cover::book::binding::ltr"), v9->_renderer, qword_2540D97D8, qword_2540D9818, qword_2540D9838, 0);
      v197[0] = v186;
      v52 = [_BCUCoverEffectsBookBinding alloc];
      v184 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v52, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("cover::book::binding::rtl"), v9->_renderer, qword_2540D97E8, qword_2540D9828, qword_2540D9848, 0);
      v197[1] = v184;
      v53 = [_BCUCoverEffectsBookBinding alloc];
      v182 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v53, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("cover::book::binding::ltr::innerStack"), v9->_renderer, qword_2540D97D8, qword_2540D9818, qword_2540D9838, 1);
      v197[2] = v182;
      v54 = [_BCUCoverEffectsBookBinding alloc];
      v180 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v54, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("cover::book::binding::rtl::innerStack"), v9->_renderer, qword_2540D97E8, qword_2540D9828, qword_2540D9848, 1);
      v197[3] = v180;
      v55 = [_BCUCoverEffectsBookBinding alloc];
      v178 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v55, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("cover::book::binding::ltr::topStack"), v9->_renderer, qword_2540D97D8, qword_2540D9838, qword_2540D9838, 0);
      v197[4] = v178;
      v56 = [_BCUCoverEffectsBookBinding alloc];
      v176 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v56, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("cover::book::binding::rtl::topStack"), v9->_renderer, qword_2540D97E8, qword_2540D9848, qword_2540D9848, 0);
      v197[5] = v176;
      v57 = [_BCUCoverEffectsBookBinding alloc];
      v174 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v57, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("cover::book::binding::ltr::darkShadow"), v9->_renderer, qword_2540D97D8, qword_2540D9820, qword_2540D9840, 0);
      v197[6] = v174;
      v58 = [_BCUCoverEffectsBookBinding alloc];
      v172 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v58, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("cover::book::binding::rtl::darkShadow"), v9->_renderer, qword_2540D97E8, qword_2540D9830, qword_2540D9850, 0);
      v197[7] = v172;
      v59 = [_BCUCoverEffectsBookBinding alloc];
      v170 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v59, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("cover::book::binding::ltr::night"), v9->_renderer, qword_2540D97E0, qword_2540D9820, qword_2540D9840, 0);
      v197[8] = v170;
      v60 = [_BCUCoverEffectsBookBinding alloc];
      v168 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v60, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("cover::book::binding::rtl::night"), v9->_renderer, qword_2540D97F0, qword_2540D9830, qword_2540D9850, 0);
      v197[9] = v168;
      v61 = [_BCUCoverEffectsBookBinding alloc];
      v166 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v61, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("cover::book::binding::ltr::night::innerStack"), v9->_renderer, qword_2540D97E0, qword_2540D9820, qword_2540D9840, 1);
      v197[10] = v166;
      v62 = [_BCUCoverEffectsBookBinding alloc];
      v164 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v62, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("cover::book::binding::rtl::night::innerStack"), v9->_renderer, qword_2540D97F0, qword_2540D9820, qword_2540D9840, 1);
      v197[11] = v164;
      v63 = [_BCUCoverEffectsBookBinding alloc];
      v162 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v63, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("cover::book::binding::ltr::night::topStack"), v9->_renderer, qword_2540D97E0, qword_2540D9840, qword_2540D9840, 0);
      v197[12] = v162;
      v64 = [_BCUCoverEffectsBookBinding alloc];
      v160 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v64, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("cover::book::binding::rtl::night::topStack"), v9->_renderer, qword_2540D97F0, qword_2540D9850, qword_2540D9840, 0);
      v197[13] = v160;
      v65 = [_BCUCoverEffectsBookBinding alloc];
      v158 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v65, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("cover::book::binding::ltr::flowcase"), v9->_renderer, qword_2540D97D8, qword_2540D97F8, 0, 0);
      v197[14] = v158;
      v66 = [_BCUCoverEffectsBookBinding alloc];
      v156 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v66, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("cover::book::binding::ltr::night::flowcase"), v9->_renderer, qword_2540D97E0, qword_2540D97F8, 0, 0);
      v197[15] = v156;
      v67 = [_BCUCoverEffectsBookBinding alloc];
      v154 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v67, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("cover::book::binding::rtl::flowcase"), v9->_renderer, qword_2540D97E8, qword_2540D97F8, 0, 0);
      v197[16] = v154;
      v68 = [_BCUCoverEffectsBookBinding alloc];
      v153 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v68, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("cover::book::binding::rtl::night::flowcase"), v9->_renderer, qword_2540D97F0, qword_2540D97F8, 0, 0);
      v197[17] = v153;
      v69 = [_BCUCoverEffectsAudiobook alloc];
      v152 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v69, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("cover::audiobook"), v9->_renderer, qword_2540D97D8, qword_2540D9818, 0, 0);
      v197[18] = v152;
      v70 = [_BCUCoverEffectsAudiobook alloc];
      v151 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v70, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("cover::audiobook::darkShadow"), v9->_renderer, qword_2540D97D8, qword_2540D9820, 0, 0);
      v197[19] = v151;
      v71 = [_BCUCoverEffectsAudiobook alloc];
      v150 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v71, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("cover::audiobook::night"), v9->_renderer, qword_2540D97E0, qword_2540D9820, 0, 0);
      v197[20] = v150;
      v72 = [_BCUCoverEffectsAudiobook alloc];
      v149 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v72, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("cover::audiobook::flowcase"), v9->_renderer, qword_2540D97D8, qword_2540D97F8, 0, 0);
      v197[21] = v149;
      v73 = [_BCUCoverEffectsAudiobook alloc];
      v148 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:](v73, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", CFSTR("cover::audiobook::night::flowcase"), v9->_renderer, qword_2540D97E0, qword_2540D97F8, 0, 0);
      v197[22] = v148;
      v147 = -[_BCUCoverEffectsPDF initWithIdentifier:renderer:image:shadow:night:]([_BCUCoverEffectsPDF alloc], "initWithIdentifier:renderer:image:shadow:night:", CFSTR("cover::pdf"), v9->_renderer, 1, 1, 0);
      v197[23] = v147;
      v146 = -[_BCUCoverEffectsPDF initWithIdentifier:renderer:image:shadow:night:]([_BCUCoverEffectsPDF alloc], "initWithIdentifier:renderer:image:shadow:night:", CFSTR("cover::pdf::night"), v9->_renderer, 1, 1, 1);
      v197[24] = v146;
      v74 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v106) = 1;
      v145 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:](v74, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:", CFSTR("cover::book::binding::ltr::restricted"), v9->_renderer, qword_2540D97D8, qword_2540D9818, qword_2540D9838, 0, v106);
      v197[25] = v145;
      v75 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v107) = 1;
      v144 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:](v75, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:", CFSTR("cover::book::binding::rtl::restricted"), v9->_renderer, qword_2540D97E8, qword_2540D9828, qword_2540D9848, 0, v107);
      v197[26] = v144;
      v76 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v108) = 1;
      v143 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:](v76, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:", CFSTR("cover::book::binding::ltr::innerStack::restricted"), v9->_renderer, qword_2540D97D8, qword_2540D9818, qword_2540D9838, 1, v108);
      v197[27] = v143;
      v77 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v109) = 1;
      v142 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:](v77, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:", CFSTR("cover::book::binding::rtl::innerStack::restricted"), v9->_renderer, qword_2540D97E8, qword_2540D9828, qword_2540D9848, 1, v109);
      v197[28] = v142;
      v78 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v110) = 1;
      v141 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:](v78, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:", CFSTR("cover::book::binding::ltr::topStack::restricted"), v9->_renderer, qword_2540D97D8, qword_2540D9838, qword_2540D9838, 0, v110);
      v197[29] = v141;
      v79 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v111) = 1;
      v140 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:](v79, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:", CFSTR("cover::book::binding::rtl::topStack::restricted"), v9->_renderer, qword_2540D97E8, qword_2540D9848, qword_2540D9848, 0, v111);
      v197[30] = v140;
      v80 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v112) = 1;
      v139 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:](v80, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:", CFSTR("cover::book::binding::ltr::darkShadow::restricted"), v9->_renderer, qword_2540D97D8, qword_2540D9820, qword_2540D9840, 0, v112);
      v197[31] = v139;
      v81 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v113) = 1;
      v138 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:](v81, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:", CFSTR("cover::book::binding::rtl::darkShadow::restricted"), v9->_renderer, qword_2540D97E8, qword_2540D9830, qword_2540D9850, 0, v113);
      v197[32] = v138;
      v82 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v114) = 1;
      v137 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:](v82, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:", CFSTR("cover::book::binding::ltr::night::restricted"), v9->_renderer, qword_2540D97E0, qword_2540D9820, qword_2540D9840, 0, v114);
      v197[33] = v137;
      v83 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v115) = 1;
      v136 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:](v83, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:", CFSTR("cover::book::binding::rtl::night::restricted"), v9->_renderer, qword_2540D97F0, qword_2540D9830, qword_2540D9850, 0, v115);
      v197[34] = v136;
      v84 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v116) = 1;
      v135 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:](v84, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:", CFSTR("cover::book::binding::ltr::night::innerStack::restricted"), v9->_renderer, qword_2540D97E0, qword_2540D9820, qword_2540D9840, 1, v116);
      v197[35] = v135;
      v85 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v117) = 1;
      v134 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:](v85, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:", CFSTR("cover::book::binding::rtl::night::innerStack::restricted"), v9->_renderer, qword_2540D97F0, qword_2540D9820, qword_2540D9840, 1, v117);
      v197[36] = v134;
      v86 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v118) = 1;
      v133 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:](v86, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:", CFSTR("cover::book::binding::ltr::night::topStack::restricted"), v9->_renderer, qword_2540D97E0, qword_2540D9840, qword_2540D9840, 0, v118);
      v197[37] = v133;
      v87 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v119) = 1;
      v132 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:](v87, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:", CFSTR("cover::book::binding::rtl::night::topStack::restricted"), v9->_renderer, qword_2540D97F0, qword_2540D9850, qword_2540D9840, 0, v119);
      v197[38] = v132;
      v88 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v120) = 1;
      v131 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:](v88, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:", CFSTR("cover::book::binding::ltr::flowcase::restricted"), v9->_renderer, qword_2540D97D8, qword_2540D97F8, 0, 0, v120);
      v197[39] = v131;
      v89 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v121) = 1;
      v130 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:](v89, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:", CFSTR("cover::book::binding::ltr::night::flowcase::restricted"), v9->_renderer, qword_2540D97E0, qword_2540D97F8, 0, 0, v121);
      v197[40] = v130;
      v90 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v122) = 1;
      v129 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:](v90, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:", CFSTR("cover::book::binding::rtl::flowcase::restricted"), v9->_renderer, qword_2540D97E8, qword_2540D97F8, 0, 0, v122);
      v197[41] = v129;
      v91 = [_BCUCoverEffectsBookBinding alloc];
      LOBYTE(v123) = 1;
      v92 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:](v91, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:", CFSTR("cover::book::binding::rtl::night::flowcase::restricted"), v9->_renderer, qword_2540D97F0, qword_2540D97F8, 0, 0, v123);
      v197[42] = v92;
      v93 = [_BCUCoverEffectsAudiobook alloc];
      LOBYTE(v124) = 1;
      v94 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:](v93, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:", CFSTR("cover::audiobook::restricted"), v9->_renderer, qword_2540D97D8, qword_2540D9818, 0, 0, v124);
      v197[43] = v94;
      v95 = [_BCUCoverEffectsAudiobook alloc];
      LOBYTE(v125) = 1;
      v96 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:](v95, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:", CFSTR("cover::audiobook::darkShadow::restricted"), v9->_renderer, qword_2540D97D8, qword_2540D9820, 0, 0, v125);
      v197[44] = v96;
      v97 = [_BCUCoverEffectsAudiobook alloc];
      LOBYTE(v126) = 1;
      v98 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:](v97, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:", CFSTR("cover::audiobook::night::restricted"), v9->_renderer, qword_2540D97E0, qword_2540D9820, 0, 0, v126);
      v197[45] = v98;
      v99 = [_BCUCoverEffectsAudiobook alloc];
      LOBYTE(v127) = 1;
      v100 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:](v99, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:", CFSTR("cover::audiobook::flowcase::restricted"), v9->_renderer, qword_2540D97D8, qword_2540D97F8, 0, 0, v127);
      v197[46] = v100;
      v101 = [_BCUCoverEffectsAudiobook alloc];
      LOBYTE(v128) = 1;
      v102 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:](v101, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:restricted:", CFSTR("cover::audiobook::night::flowcase::restricted"), v9->_renderer, qword_2540D97E0, qword_2540D97F8, 0, 0, v128);
      v197[47] = v102;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v197, 48);
      v103 = objc_claimAutoreleasedReturnValue();
      templateImageFilters = v9->_templateImageFilters;
      v9->_templateImageFilters = (NSArray *)v103;

      v7 = v192;
    }
  }

  return v9;
}

- (NSArray)templateImageSetFilters
{
  return (NSArray *)MEMORY[0x24BEDD108](self, sel_seriesCoverEffectFilters);
}

- (NSArray)templateImageFilters
{
  return self->_templateImageFilters;
}

- (NSArray)seriesCoverEffectFilters
{
  return self->_seriesCoverEffectFilters;
}

- (BCUCoverEffects)initWithRenderer:(id)a3
{
  return -[BCUCoverEffects initWithRenderer:mode:](self, "initWithRenderer:mode:", a3, 0);
}

+ (id)effectIdentifierWithRTL:(BOOL)a3 style:(unint64_t)a4 content:(unint64_t)a5 nightMode:(BOOL)a6
{
  uint64_t v6;

  v6 = 6;
  if (!a3)
    v6 = 0;
  return +[BCUCoverEffects _effectIdentifierForEffectIndex:](BCUCoverEffects, "_effectIdentifierForEffectIndex:", (v6 + 12 * a4 + 2 * a5) | a6);
}

+ (id)effectIdentifierForAsset:(id)a3 withEnvironment:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "coverEffectRTLOverride");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "coverEffectRTLOverride");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

  }
  else
  {
    v9 = objc_msgSend(v5, "coverEffectRTL");
  }

  v10 = objc_msgSend(v5, "coverEffectStyle");
  v11 = objc_msgSend(v6, "coverEffectsContent");
  v12 = objc_msgSend(v6, "coverEffectsNightMode");
  v13 = 6;
  if (!v9)
    v13 = 0;
  +[BCUCoverEffects _effectIdentifierForEffectIndex:](BCUCoverEffects, "_effectIdentifierForEffectIndex:", (v13 + 12 * v10 + 2 * v11) | v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)effectIdentifierForFilterInfo:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BCUCoverEffectsFilterInfoAlternativeAppearanceKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BCUCoverEffectsFilterInfoContentRTLKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BCUCoverEffectsFilterInfoCoverEffectStyleKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "intValue");
  v9 = 6;
  if (!v6)
    v9 = 0;
  v10 = 2;
  if (v5)
    v10 = 3;
  +[BCUCoverEffects _effectIdentifierForEffectIndex:](BCUCoverEffects, "_effectIdentifierForEffectIndex:", v10 + v9 + 12 * v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_effectIdentifierForEffectIndex:(unint64_t)a3
{
  if (qword_25598AB68 != -1)
    dispatch_once(&qword_25598AB68, &unk_24F114020);
  return *((id *)&xmmword_25598A9E8 + a3);
}

+ (CGImage)restrictedImageFrom:(CGImage *)a3 size:(CGSize)a4
{
  double height;
  double width;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CGImage *v17;

  height = a4.height;
  width = a4.width;
  objc_msgSend(MEMORY[0x24BDBF660], "imageWithCGImage:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIGaussianBlur"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDBF960];
  objc_msgSend(v7, "setValue:forKey:", v6, *MEMORY[0x24BDBF960]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", width * 0.2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v9, *MEMORY[0x24BDBF978]);

  v10 = *MEMORY[0x24BDBF9C8];
  objc_msgSend(v7, "valueForKey:", *MEMORY[0x24BDBF9C8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIPixellate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forKey:", v11, v8);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", width / 6.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forKey:", v13, *MEMORY[0x24BDBF988]);

  objc_msgSend(MEMORY[0x24BDBF690], "vectorWithX:Y:", 0.0, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forKey:", v14, *MEMORY[0x24BDBF938]);

  objc_msgSend(v12, "valueForKey:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBF648], "contextWithOptions:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (CGImage *)CFAutorelease((CFTypeRef)objc_msgSend(v16, "createCGImage:fromRect:", v15, 0.0, 0.0, width, height));

  return v17;
}

- (id)bookCoverEffectFilterForEffectIdentifier:(id)a3
{
  id v4;
  void *v5;
  _BCUCoverEffectsAssets *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _BCUCoverEffectsIdentity *v10;
  uint64_t v11;
  _BCUCoverEffectsIdentity *i;
  void *v13;
  void *v14;
  int v15;
  _BCUCoverEffectsIdentity *v16;
  _BCUCoverEffectsAssets *v17;
  void *v18;
  uint64_t v19;
  _BCUCoverEffectsAssets *v20;
  __objc2_class *v21;
  id v22;
  BCULayerRenderer *renderer;
  id v24;
  _BCUCoverEffectsAssets *v25;
  _BCUCoverEffectsAssets *v26;
  uint64_t v27;
  _BCUCoverEffectsShadow *v29;
  const __CFString *v30;
  const __CFURL *v31;
  const __CFURL *v32;
  CGDataProvider *v33;
  CGDataProvider *v34;
  CGImageRef v35;
  double v36;
  _BCUCoverEffectsShadow *v37;
  CGImageRef v38;
  _BCUCoverEffectsShadow *v39;
  __objc2_class *v40;
  _BCUCoverEffectsShadow *v41;
  const __CFString *v42;
  __objc2_class *v43;
  _BCUCoverEffectsShadow *v44;
  const __CFString *v45;
  _BCUCoverEffectsAssets *v46;
  _BCUCoverEffectsShadow *v47;
  const __CFString *v48;
  _BCUCoverEffectsShadow *v49;
  const __CFString *v50;
  _BCUCoverEffectsPDF *v51;
  BCULayerRenderer *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_mode == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("BCUCoverEffectsIdentifierBookBinding")))
    {
      v6 = [_BCUCoverEffectsAssets alloc];
      v7 = v5;
      v8 = 0;
LABEL_4:
      v9 = -[_BCUCoverEffectsAssets initWithBundle:rtl:night:small:](v6, "initWithBundle:rtl:night:small:", v7, v8, 0, 1);
LABEL_19:
      v20 = (_BCUCoverEffectsAssets *)v9;
      v21 = _BCUCoverEffectsBookBinding;
LABEL_20:
      v22 = [v21 alloc];
      renderer = self->_renderer;
      v24 = v4;
      v25 = v20;
      v26 = 0;
      v27 = 0;
LABEL_21:
      v10 = (_BCUCoverEffectsIdentity *)objc_msgSend(v22, "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", v24, renderer, v25, v26, 0, v27);
LABEL_22:

      goto LABEL_23;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("BCUCoverEffectsIdentifierBookBindingNight")))
    {
      v17 = [_BCUCoverEffectsAssets alloc];
      v18 = v5;
      v19 = 0;
LABEL_18:
      v9 = -[_BCUCoverEffectsAssets initWithBundle:rtl:night:](v17, "initWithBundle:rtl:night:", v18, v19, 1);
      goto LABEL_19;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("BCUCoverEffectsIdentifierBookBindingWithShadow")))
    {
      v20 = -[_BCUCoverEffectsAssets initWithBundle:rtl:night:small:]([_BCUCoverEffectsAssets alloc], "initWithBundle:rtl:night:small:", v5, 0, 0, 1);
      v29 = [_BCUCoverEffectsShadow alloc];
      v30 = CFSTR("iBooks_Covers_Flat-S_Shadow");
      goto LABEL_28;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("BCUCoverEffectsIdentifierBookBindingNightWithShadow")))
    {
      v20 = -[_BCUCoverEffectsAssets initWithBundle:rtl:night:]([_BCUCoverEffectsAssets alloc], "initWithBundle:rtl:night:", v5, 0, 1);
      v29 = [_BCUCoverEffectsShadow alloc];
      v30 = CFSTR("iBooks_Covers_Flat-L_Shadow~Night");
LABEL_28:
      objc_msgSend(v5, "URLForResource:withExtension:", v30, CFSTR("png"));
      v31 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v31 && (v33 = CGDataProviderCreateWithURL(v31)) != 0)
      {
        v34 = v33;
        v35 = CGImageCreateWithPNGDataProvider(v33, 0, 1, kCGRenderingIntentDefault);
        CFRelease(v34);
      }
      else
      {
        v35 = 0;
      }

      v36 = 22.0;
      v37 = v29;
      v38 = v35;
      goto LABEL_33;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("BCUCoverEffectsIdentifierBookBindingShadowOnly")))
    {
      v41 = [_BCUCoverEffectsShadow alloc];
      v42 = CFSTR("iBooks_Covers_Flat-S_Shadow");
LABEL_39:
      v20 = -[_BCUCoverEffectsShadow initWithImage:insets:](v41, "initWithImage:insets:", sub_2285802E0((uint64_t)v42, v5), 22.0, 32.0, 59.0, 32.0);
      v43 = _BCUCoverEffectsBookBinding;
LABEL_40:
      v22 = [v43 alloc];
      renderer = self->_renderer;
      v24 = v4;
      v25 = 0;
      v26 = v20;
      v27 = 1;
      goto LABEL_21;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("BCUCoverEffectsIdentifierBookBindingNightShadowOnly")))
    {
      v41 = [_BCUCoverEffectsShadow alloc];
      v42 = CFSTR("iBooks_Covers_Flat-L_Shadow~Night");
      goto LABEL_39;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("BCUCoverEffectsIdentifierBookBindingRTL")))
    {
      v6 = [_BCUCoverEffectsAssets alloc];
      v7 = v5;
      v8 = 1;
      goto LABEL_4;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("BCUCoverEffectsIdentifierBookBindingRTLNight")))
    {
      v17 = [_BCUCoverEffectsAssets alloc];
      v18 = v5;
      v19 = 1;
      goto LABEL_18;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("BCUCoverEffectsIdentifierBookBindingRTLWithShadow")))
    {
      v20 = -[_BCUCoverEffectsAssets initWithBundle:rtl:night:small:]([_BCUCoverEffectsAssets alloc], "initWithBundle:rtl:night:small:", v5, 1, 0, 1);
      v44 = [_BCUCoverEffectsShadow alloc];
      v45 = CFSTR("iBooks_Covers_RTL_Flat-S_Shadow");
LABEL_49:
      v38 = sub_2285802E0((uint64_t)v45, v5);
      v36 = 22.0;
      v37 = v44;
LABEL_33:
      v39 = -[_BCUCoverEffectsShadow initWithImage:insets:](v37, "initWithImage:insets:", v38, v36, 32.0, 59.0, 32.0);
      v40 = _BCUCoverEffectsBookBinding;
LABEL_34:
      v10 = (_BCUCoverEffectsIdentity *)objc_msgSend([v40 alloc], "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", v4, self->_renderer, v20, v39, 0, 0);

      goto LABEL_22;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("BCUCoverEffectsIdentifierBookBindingRTLNightWithShadow")))
    {
      v20 = -[_BCUCoverEffectsAssets initWithBundle:rtl:night:]([_BCUCoverEffectsAssets alloc], "initWithBundle:rtl:night:", v5, 1, 1);
      v44 = [_BCUCoverEffectsShadow alloc];
      v45 = CFSTR("iBooks_Covers_RTL_Flat-L_Shadow~Night");
      goto LABEL_49;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("BCUCoverEffectsIdentifierBookBindingRTLShadowOnly")))
    {
      v41 = [_BCUCoverEffectsShadow alloc];
      v42 = CFSTR("iBooks_Covers_RTL_Flat-S_Shadow");
      goto LABEL_39;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("BCUCoverEffectsIdentifierBookBindingRTLNightShadowOnly")))
    {
      v41 = [_BCUCoverEffectsShadow alloc];
      v42 = CFSTR("iBooks_Covers_RTL_Flat-L_Shadow~Night");
      goto LABEL_39;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("BCUCoverEffectsIdentifierAudiobook")))
    {
      v46 = -[_BCUCoverEffectsAssets initWithBundle:rtl:night:small:]([_BCUCoverEffectsAssets alloc], "initWithBundle:rtl:night:small:", v5, 0, 0, 1);
LABEL_58:
      v20 = v46;
      v21 = _BCUCoverEffectsAudiobook;
      goto LABEL_20;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("BCUCoverEffectsIdentifierAudiobookNight")))
    {
      v46 = -[_BCUCoverEffectsAssets initWithBundle:rtl:night:]([_BCUCoverEffectsAssets alloc], "initWithBundle:rtl:night:", v5, 0, 1);
      goto LABEL_58;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("BCUCoverEffectsIdentifierAudiobookWithShadow")))
    {
      v20 = -[_BCUCoverEffectsAssets initWithBundle:rtl:night:small:]([_BCUCoverEffectsAssets alloc], "initWithBundle:rtl:night:small:", v5, 0, 0, 1);
      v47 = [_BCUCoverEffectsShadow alloc];
      v48 = CFSTR("iBooks_Covers_Flat-S_Shadow");
LABEL_63:
      v39 = -[_BCUCoverEffectsShadow initWithImage:insets:](v47, "initWithImage:insets:", sub_2285802E0((uint64_t)v48, v5), 22.0, 32.0, 59.0, 32.0);
      v40 = _BCUCoverEffectsAudiobook;
      goto LABEL_34;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("BCUCoverEffectsIdentifierAudiobookNightWithShadow")))
    {
      v20 = -[_BCUCoverEffectsAssets initWithBundle:rtl:night:]([_BCUCoverEffectsAssets alloc], "initWithBundle:rtl:night:", v5, 0, 1);
      v47 = [_BCUCoverEffectsShadow alloc];
      v48 = CFSTR("iBooks_Covers_Flat-L_Shadow~Night");
      goto LABEL_63;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("BCUCoverEffectsIdentifierAudiobookShadowOnly")))
    {
      v49 = [_BCUCoverEffectsShadow alloc];
      v50 = CFSTR("iBooks_Covers_Flat-S_Shadow");
LABEL_68:
      v20 = -[_BCUCoverEffectsShadow initWithImage:insets:](v49, "initWithImage:insets:", sub_2285802E0((uint64_t)v50, v5), 22.0, 32.0, 59.0, 32.0);
      v43 = _BCUCoverEffectsAudiobook;
      goto LABEL_40;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("BCUCoverEffectsIdentifierAudiobookNightShadowOnly")))
    {
      v49 = [_BCUCoverEffectsShadow alloc];
      v50 = CFSTR("iBooks_Covers_Flat-L_Shadow~Night");
      goto LABEL_68;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("BCUCoverEffectsIdentifierPDF")))
    {
      v51 = [_BCUCoverEffectsPDF alloc];
      v52 = self->_renderer;
      v53 = v4;
      v54 = 1;
      v55 = 0;
LABEL_80:
      v56 = 0;
LABEL_85:
      v16 = -[_BCUCoverEffectsPDF initWithIdentifier:renderer:image:shadow:night:](v51, "initWithIdentifier:renderer:image:shadow:night:", v53, v52, v54, v55, v56);
LABEL_15:
      v10 = v16;
      goto LABEL_23;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("BCUCoverEffectsIdentifierPDFNight")))
    {
      v51 = [_BCUCoverEffectsPDF alloc];
      v52 = self->_renderer;
      v53 = v4;
      v54 = 1;
      v55 = 0;
LABEL_84:
      v56 = 1;
      goto LABEL_85;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("BCUCoverEffectsIdentifierPDFWithShadow")))
    {
      v51 = [_BCUCoverEffectsPDF alloc];
      v52 = self->_renderer;
      v53 = v4;
      v54 = 1;
LABEL_79:
      v55 = 1;
      goto LABEL_80;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("BCUCoverEffectsIdentifierPDFNightWithShadow")))
    {
      v51 = [_BCUCoverEffectsPDF alloc];
      v52 = self->_renderer;
      v53 = v4;
      v54 = 1;
LABEL_83:
      v55 = 1;
      goto LABEL_84;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("BCUCoverEffectsIdentifierPDFShadowOnly")))
    {
      v51 = [_BCUCoverEffectsPDF alloc];
      v52 = self->_renderer;
      v53 = v4;
      v54 = 0;
      goto LABEL_79;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("BCUCoverEffectsIdentifierPDFNightShadowOnly")))
    {
      v51 = [_BCUCoverEffectsPDF alloc];
      v52 = self->_renderer;
      v53 = v4;
      v54 = 0;
      goto LABEL_83;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("BCUCoverEffectsIdentifierIdentity")))
    {
      v16 = -[_BCUCoverEffectsBase initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:]([_BCUCoverEffectsIdentity alloc], "initWithIdentifier:renderer:assets:shadow:seriesShadow:shadowOnly:", v4, self->_renderer, 0, 0, 0, 0);
      goto LABEL_15;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_228584430((uint64_t)v4);
    v10 = 0;
  }
  else
  {
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    -[BCUCoverEffects bookCoverEffectFilters](self, "bookCoverEffectFilters", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (_BCUCoverEffectsIdentity *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v58;
      while (2)
      {
        for (i = 0; i != v10; i = (_BCUCoverEffectsIdentity *)((char *)i + 1))
        {
          if (*(_QWORD *)v58 != v11)
            objc_enumerationMutation(v5);
          v13 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v13, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v4);

          if (v15)
          {
            v16 = v13;
            goto LABEL_15;
          }
        }
        v10 = (_BCUCoverEffectsIdentity *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
        if (v10)
          continue;
        break;
      }
    }
  }
LABEL_23:

  return v10;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (NSArray)bookCoverEffectFilters
{
  return self->_bookCoverEffectFilters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateImageFilters, 0);
  objc_storeStrong((id *)&self->_seriesCoverEffectFilters, 0);
  objc_storeStrong((id *)&self->_bookCoverEffectFilters, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
}

@end
