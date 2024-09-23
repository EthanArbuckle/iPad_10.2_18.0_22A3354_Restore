@implementation SGMIFeatureVector

- (SGMIFeatureVector)initWithMessageId:(id)a3 hasHashedMessageId:(BOOL)a4 simpleMailMessage:(id)a5 spotlightIdentifier:(id)a6 senderConnectionScore:(id)a7 biomeMessageSummary:(id)a8 mailClientUtil:(id)a9 store:(id)a10 preLoadedFeatureNames:(id)a11
{
  id v18;
  SGMIFeatureVector *v19;
  SGMIFeatureVector *v20;
  uint64_t v21;
  NSMutableDictionary *features;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  id v28;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v35 = a5;
  v34 = a6;
  v33 = a7;
  v32 = a8;
  v31 = a9;
  v30 = a10;
  v18 = a11;
  v41.receiver = self;
  v41.super_class = (Class)SGMIFeatureVector;
  v19 = -[SGMIFeatureVector init](&v41, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_messageId, a3);
    v20->_hasHashedMessageId = a4;
    objc_storeStrong((id *)&v20->_mailMessage, a5);
    v21 = objc_opt_new();
    features = v20->_features;
    v20->_features = (NSMutableDictionary *)v21;

    objc_storeStrong((id *)&v20->_store, a10);
    objc_storeStrong((id *)&v20->_mailClientUtil, a9);
    objc_storeStrong((id *)&v20->_biomeMessageSummary, a8);
    objc_storeStrong((id *)&v20->_senderConnectionScore, a7);
    v20->_filledWithInformationRetrievedThroughMaild = 0;
    objc_storeStrong((id *)&v20->_spotlightIdentifier, a6);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v23 = v18;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v38 != v26)
            objc_enumerationMutation(v23);
          v28 = -[SGMIFeatureVector feature:](v20, "feature:", objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "integerValue"));
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v25);
    }

  }
  return v20;
}

- (SGMIFeatureVector)initWithMessageId:(id)a3 hasHashedMessageId:(BOOL)a4 simpleMailMessage:(id)a5 spotlightIdentifier:(id)a6 senderConnectionScore:(id)a7 biomeMessageSummary:(id)a8 store:(id)a9 preLoadedFeatureNames:(id)a10
{
  _BOOL8 v14;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  SGMIFeatureVector *v25;

  v14 = a4;
  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a3;
  +[SGMailClientUtil sharedInstance](SGMailClientUtil, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[SGMIFeatureVector initWithMessageId:hasHashedMessageId:simpleMailMessage:spotlightIdentifier:senderConnectionScore:biomeMessageSummary:mailClientUtil:store:preLoadedFeatureNames:](self, "initWithMessageId:hasHashedMessageId:simpleMailMessage:spotlightIdentifier:senderConnectionScore:biomeMessageSummary:mailClientUtil:store:preLoadedFeatureNames:", v23, v14, v22, v21, v20, v19, v24, v18, v17);

  return v25;
}

- (SGMIFeatureVector)initWithMessageId:(id)a3 hasHashedMessageId:(BOOL)a4 simpleMailMessage:(id)a5 senderConnectionScore:(id)a6 biomeMessageSummary:(id)a7 mailClientUtil:(id)a8 store:(id)a9 preLoadedFeatureNames:(id)a10
{
  return -[SGMIFeatureVector initWithMessageId:hasHashedMessageId:simpleMailMessage:spotlightIdentifier:senderConnectionScore:biomeMessageSummary:mailClientUtil:store:preLoadedFeatureNames:](self, "initWithMessageId:hasHashedMessageId:simpleMailMessage:spotlightIdentifier:senderConnectionScore:biomeMessageSummary:mailClientUtil:store:preLoadedFeatureNames:", a3, a4, a5, 0, a6, a7, a8, a9, a10);
}

- (SGMIFeatureVector)initWithMessageId:(id)a3 hasHashedMessageId:(BOOL)a4 simpleMailMessage:(id)a5 senderConnectionScore:(id)a6 biomeMessageSummary:(id)a7 store:(id)a8 preLoadedFeatureNames:(id)a9
{
  _BOOL8 v13;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  SGMIFeatureVector *v23;

  v13 = a4;
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a3;
  +[SGMailClientUtil sharedInstance](SGMailClientUtil, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[SGMIFeatureVector initWithMessageId:hasHashedMessageId:simpleMailMessage:senderConnectionScore:biomeMessageSummary:mailClientUtil:store:preLoadedFeatureNames:](self, "initWithMessageId:hasHashedMessageId:simpleMailMessage:senderConnectionScore:biomeMessageSummary:mailClientUtil:store:preLoadedFeatureNames:", v21, v13, v20, v19, v18, v22, v17, v16);

  return v23;
}

- (id)flatVectorForFeatureNames:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  SEL v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v23 = a2;
    v10 = 0;
    v11 = *(_QWORD *)v25;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        v13 = v10;
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v7);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "integerValue");
        v15 = +[SGMIFeature featureTypeForName:](SGMIFeature, "featureTypeForName:", v14);
        if ((unint64_t)(v15 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", v23, self, CFSTR("SGMIFeatureVector.m"), 210, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("featureType == SGMIFeatureType_Number || featureType == SGMIFeatureType_NumberArray"));

        }
        -[SGMIFeatureVector feature:](self, "feature:", v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
          goto LABEL_12;
        if (v15 == 1)
        {
          objc_msgSend(v10, "numberValue");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v17 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v10, "numberValue");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "doubleValue");
            objc_msgSend(v17, "numberWithDouble:");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v19);

            continue;
          }
LABEL_12:
          objc_msgSend(v6, "addObject:", &unk_1E7E0C950);
          continue;
        }
        objc_msgSend(v10, "numberArrayValue");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v20);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (!v9)
      {

        break;
      }
    }
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("FeatureVector for messageId %@: (%ld features)"), self->_messageId, -[NSMutableDictionary count](self->_features, "count"));
  objc_msgSend(v3, "appendString:", v4);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allValues](self->_features, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v10, "description");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("\n%@"), v12);
        objc_msgSend(v3, "appendString:", v13);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)features
{
  return (id)-[NSMutableDictionary allValues](self->_features, "allValues");
}

- (id)cachedFeature:(int64_t)a3
{
  NSMutableDictionary *features;
  void *v4;
  void *v5;

  features = self->_features;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](features, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)feature:(int64_t)a3
{
  SGMIFeatureVector *v4;
  void *v5;
  SGMIFeature *v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  void *v9;
  SGMIFeature *v10;
  SGMIBiomeReducedMessageEvents *biomeMessageSummary;
  void (**v12)(_QWORD);
  SGMIFeature *v13;
  NSNumber *senderConnectionScore;
  SGMIFeature *v15;
  void *v16;
  __CFString *v17;
  SGSqlEntityStore *store;
  void *v19;
  void *v20;
  void *v21;
  SGMIFeature *v22;
  void *v23;
  SGMIFeature *v24;
  uint64_t v25;
  SGSimpleMailMessage *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  SGMIFeature *v32;
  id v33;
  SGMIFeature *v34;
  SGMIFeature *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  BOOL v50;
  unsigned int v51;
  BOOL v52;
  uint64_t v53;
  void *v54;
  void *v55;
  SGMIFeature *v56;
  SGSimpleMailMessage *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  unint64_t v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  SGSimpleMailMessage *v69;
  void *v70;
  void *v71;
  SGMIFeature *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  SGMIFeature *v83;
  uint64_t v84;
  void (**v85)(_QWORD);
  SGSimpleMailMessage *v86;
  void *v87;
  void *v88;
  void *v89;
  SGMIFeature *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  __CFString *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  __CFString *v107;
  __CFString *v108;
  void (**v109)(_QWORD);
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  __CFString *v120;
  uint64_t m;
  void *v122;
  void *v123;
  int v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  __CFString *v128;
  const __CFString *v129;
  SGMIBiomeReducedMessageEvents *v130;
  SGMIFeature *v131;
  SGMIBiomeReducedMessageEvents *v132;
  SGMIFeature *v133;
  void *v134;
  SGMIFeature *v135;
  uint64_t v136;
  SGMIBiomeReducedMessageEvents *v137;
  void (**v138)(_QWORD);
  SGMIFeature *v139;
  void *v140;
  SGMIFeature *v141;
  uint64_t v142;
  SGMIBiomeReducedMessageEvents *v143;
  SGMIFeature *v144;
  SGMIBiomeReducedMessageEvents *v145;
  void (**v146)(_QWORD);
  SGMIFeature *v147;
  void *v148;
  SGMIBiomeReducedMessageEvents *v149;
  void (**v150)(_QWORD);
  SGMIFeature *v151;
  void *v152;
  SGMIBiomeReducedMessageEvents *v153;
  void (**v154)(_QWORD);
  SGMIFeature *v155;
  SGMIBiomeReducedMessageEvents *v156;
  void (**v157)(_QWORD);
  SGMIFeature *v158;
  SGMIBiomeReducedMessageEvents *v159;
  SGMIFeature *v160;
  SGMIBiomeReducedMessageEvents *v161;
  SGMIFeature *v162;
  SGMIBiomeReducedMessageEvents *v163;
  SGMIFeature *v164;
  SGMIBiomeReducedMessageEvents *v165;
  SGMIFeature *v166;
  SGMIBiomeReducedMessageEvents *v167;
  SGMIFeature *v168;
  SGMIBiomeReducedMessageEvents *v169;
  SGMIFeature *v170;
  SGMIBiomeReducedMessageEvents *v171;
  SGMIFeature *v172;
  void (**v173)(_QWORD);
  void *v174;
  void *v175;
  void *v176;
  SGMIFeature *v177;
  void *v178;
  void *v179;
  SGMIFeature *v180;
  uint64_t v181;
  void *v182;
  void *v183;
  SGMIFeature *v184;
  void *v185;
  SGMIFeature *v186;
  void *v187;
  void *v188;
  void *v189;
  SGSqlEntityStore *v190;
  void *v191;
  SGMIFeature *v192;
  void *v193;
  SGSqlEntityStore *v194;
  void *v195;
  SGMIFeature *v196;
  void (**v197)(_QWORD);
  void *v198;
  void *v199;
  SGMIFeature *v200;
  void *v201;
  void *v202;
  SGSqlEntityStore *v203;
  void *v204;
  SGMIFeature *v205;
  void *v206;
  SGSqlEntityStore *v207;
  void *v208;
  SGMIFeature *v209;
  SGMIFeature *v210;
  void *v211;
  void *v212;
  unint64_t v213;
  unint64_t v214;
  SGMIFeature *v215;
  void *v216;
  void *v217;
  void *v218;
  uint64_t v219;
  SGMIFeature *v220;
  uint64_t v221;
  void *v222;
  void (**v223)(_QWORD);
  void *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t i;
  void *v229;
  SGMIFeature *v230;
  void *v231;
  SGMIFeature *v232;
  uint64_t v233;
  void *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t j;
  void *v239;
  SGMIFeature *v240;
  void *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t k;
  void *v246;
  SGMIFeature *v247;
  uint64_t v248;
  SGSimpleMailMessage *mailMessage;
  void (**v250)(_QWORD);
  void *v251;
  void *v252;
  void *v253;
  double v254;
  void *v255;
  NSMutableDictionary *features;
  void *v257;
  SGMIFeature *v258;
  SGMIFeature *v259;
  uint64_t v260;
  SGMIFeatureVector *v262;
  void (**v263)(_QWORD);
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  unint64_t v268;
  unint64_t v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  _QWORD v286[5];
  _BYTE v287[128];
  _BYTE v288[128];
  _BYTE v289[128];
  __CFString *v290;
  __CFString *v291;
  _BYTE v292[128];
  __CFString *v293;
  __CFString *v294;
  _QWORD v295[3];

  v4 = self;
  v295[1] = *MEMORY[0x1E0C80C00];
  -[SGMIFeatureVector cachedFeature:](self, "cachedFeature:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    v286[0] = MEMORY[0x1E0C809B0];
    v286[1] = 3221225472;
    v286[2] = __29__SGMIFeatureVector_feature___block_invoke;
    v286[3] = &unk_1E7DB56F0;
    v286[4] = v4;
    v7 = (void (**)(_QWORD))MEMORY[0x1C3BD5158](v286);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = 0;
    if (a3 <= 1999)
    {
      switch(a3)
      {
        case 0:
          v32 = -[SGMIFeature initWithFeatureName:]([SGMIFeature alloc], "initWithFeatureName:", 0);
          goto LABEL_229;
        case 1:
          -[SGMIFeatureVector feature:](v4, "feature:", 2000);
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v210 = [SGMIFeature alloc];
          v211 = (void *)MEMORY[0x1E0CB37E8];
          -[__CFString stringValue](v17, "stringValue");
          v20 = v9;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v211, "numberWithUnsignedInteger:", objc_msgSend(v21, "length"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v210;
          v25 = 1;
LABEL_149:
          v10 = -[SGMIFeature initWithFeatureName:numberValue:](v24, "initWithFeatureName:numberValue:", v25, v23);

          goto LABEL_150;
        case 2:
          -[SGMIFeatureVector feature:](v4, "feature:", 2001);
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringArrayValue](v17, "stringArrayValue");
          v212 = (void *)objc_claimAutoreleasedReturnValue();
          v213 = objc_msgSend(v212, "count");

          v214 = (v213 & 1) + (v213 >> 1);
          v215 = [SGMIFeature alloc];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v214);
          v20 = v9;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = -[SGMIFeature initWithFeatureName:numberValue:](v215, "initWithFeatureName:numberValue:", 2, v21);
LABEL_150:

          v9 = v20;
          goto LABEL_243;
        case 3:
          -[SGMIFeatureVector feature:](v4, "feature:", 2003);
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          -[SGMailClientUtil allVIPEmailAddresses](v4->_mailClientUtil, "allVIPEmailAddresses");
          v216 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringValue](v17, "stringValue");
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          v218 = v9;
          v219 = objc_msgSend(v216, "containsObject:", v217);

          v220 = [SGMIFeature alloc];
          v221 = v219;
          v9 = v218;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v221);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = -[SGMIFeature initWithFeatureName:numberValue:](v220, "initWithFeatureName:numberValue:", 3, v58);
LABEL_153:
          v10 = (SGMIFeature *)v59;
LABEL_154:

          goto LABEL_243;
        case 4:
          v100 = (void *)v8;
          v222 = (void *)objc_opt_new();
          v223 = v7;
          v7[2](v7);
          v276 = 0u;
          v277 = 0u;
          v274 = 0u;
          v275 = 0u;
          -[SGMessage attachments](v4->_mailMessage, "attachments");
          v224 = (void *)objc_claimAutoreleasedReturnValue();
          v225 = objc_msgSend(v224, "countByEnumeratingWithState:objects:count:", &v274, v288, 16);
          if (v225)
          {
            v226 = v225;
            v227 = *(_QWORD *)v275;
            do
            {
              for (i = 0; i != v226; ++i)
              {
                if (*(_QWORD *)v275 != v227)
                  objc_enumerationMutation(v224);
                v229 = *(void **)(*((_QWORD *)&v274 + 1) + 8 * i);
                if (objc_msgSend(v229, "isMediaMimeType"))
                  objc_msgSend(v222, "bucketizeWithSize:", objc_msgSend(v229, "size"));
              }
              v226 = objc_msgSend(v224, "countByEnumeratingWithState:objects:count:", &v274, v288, 16);
            }
            while (v226);
          }

          v230 = [SGMIFeature alloc];
          objc_msgSend(v222, "numberArray");
          v231 = (void *)objc_claimAutoreleasedReturnValue();
          v232 = v230;
          v233 = 4;
          goto LABEL_185;
        case 5:
          v100 = (void *)v8;
          v222 = (void *)objc_opt_new();
          v223 = v7;
          v7[2](v7);
          v280 = 0u;
          v281 = 0u;
          v278 = 0u;
          v279 = 0u;
          -[SGMessage attachments](v4->_mailMessage, "attachments");
          v234 = (void *)objc_claimAutoreleasedReturnValue();
          v235 = objc_msgSend(v234, "countByEnumeratingWithState:objects:count:", &v278, v289, 16);
          if (v235)
          {
            v236 = v235;
            v237 = *(_QWORD *)v279;
            do
            {
              for (j = 0; j != v236; ++j)
              {
                if (*(_QWORD *)v279 != v237)
                  objc_enumerationMutation(v234);
                v239 = *(void **)(*((_QWORD *)&v278 + 1) + 8 * j);
                if (objc_msgSend(v239, "isApplicationMimeType"))
                  objc_msgSend(v222, "bucketizeWithSize:", objc_msgSend(v239, "size"));
              }
              v236 = objc_msgSend(v234, "countByEnumeratingWithState:objects:count:", &v278, v289, 16);
            }
            while (v236);
          }

          v240 = [SGMIFeature alloc];
          objc_msgSend(v222, "numberArray");
          v231 = (void *)objc_claimAutoreleasedReturnValue();
          v232 = v240;
          v233 = 5;
          goto LABEL_185;
        case 6:
          v100 = (void *)v8;
          v222 = (void *)objc_opt_new();
          v223 = v7;
          v7[2](v7);
          v272 = 0u;
          v273 = 0u;
          v270 = 0u;
          v271 = 0u;
          -[SGMessage attachments](v4->_mailMessage, "attachments");
          v241 = (void *)objc_claimAutoreleasedReturnValue();
          v242 = objc_msgSend(v241, "countByEnumeratingWithState:objects:count:", &v270, v287, 16);
          if (v242)
          {
            v243 = v242;
            v244 = *(_QWORD *)v271;
            do
            {
              for (k = 0; k != v243; ++k)
              {
                if (*(_QWORD *)v271 != v244)
                  objc_enumerationMutation(v241);
                v246 = *(void **)(*((_QWORD *)&v270 + 1) + 8 * k);
                if (objc_msgSend(v246, "isOthersMimeType"))
                  objc_msgSend(v222, "bucketizeWithSize:", objc_msgSend(v246, "size"));
              }
              v243 = objc_msgSend(v241, "countByEnumeratingWithState:objects:count:", &v270, v287, 16);
            }
            while (v243);
          }

          v247 = [SGMIFeature alloc];
          objc_msgSend(v222, "numberArray");
          v231 = (void *)objc_claimAutoreleasedReturnValue();
          v232 = v247;
          v233 = 6;
LABEL_185:
          v10 = -[SGMIFeature initWithFeatureName:numberArrayValue:](v232, "initWithFeatureName:numberArrayValue:", v233, v231);

          v7 = v223;
LABEL_186:
          v9 = v100;
          goto LABEL_244;
        case 7:
          v15 = [SGMIFeature alloc];
          senderConnectionScore = v4->_senderConnectionScore;
          v248 = 7;
          goto LABEL_228;
        case 8:
          mailMessage = v4->_mailMessage;
          if (mailMessage)
          {
            v250 = v7;
            -[SGMessage date](mailMessage, "date");
            v251 = (void *)objc_claimAutoreleasedReturnValue();

            if (v251)
            {
              v252 = (void *)MEMORY[0x1E0CB37E8];
              -[SGMessage date](v4->_mailMessage, "date");
              v253 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v253, "timeIntervalSinceNow");
              objc_msgSend(v252, "numberWithDouble:", v254 / -86400.0);
              v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v17 = (__CFString *)&unk_1E7E0C938;
            }
            v7 = v250;
          }
          else
          {
            v17 = (__CFString *)&unk_1E7E0C938;
          }
          v141 = [SGMIFeature alloc];
          v142 = 8;
LABEL_241:
          v260 = -[SGMIFeature initWithFeatureName:numberValue:](v141, "initWithFeatureName:numberValue:", v142, v17);
          goto LABEL_242;
        default:
          switch(a3)
          {
            case 1000:
              -[SGMIFeatureVector feature:](v4, "feature:", 2003);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "stringValue");
              v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

              store = v4->_store;
              v295[0] = v17;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v295, 1);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[SGSqlEntityStore naiveBayesModelQueryResultForFeature:unigramTokens:bigramTokens:](store, "naiveBayesModelQueryResultForFeature:unigramTokens:bigramTokens:", 1000, v19, MEMORY[0x1E0C9AA60]);
              v20 = v9;
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              v22 = [SGMIFeature alloc];
              objc_msgSend(v21, "inferProbability");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = v22;
              v25 = 1000;
              goto LABEL_149;
            case 1001:
              -[SGMIFeatureVector feature:](v4, "feature:", 2004);
              v173 = v7;
              v174 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v174, "stringArrayValue");
              v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

              -[SGMIFeatureVector feature:](v4, "feature:", 2005);
              v175 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v175, "stringArrayValue");
              v58 = (void *)objc_claimAutoreleasedReturnValue();

              -[SGSqlEntityStore naiveBayesModelQueryResultForFeature:unigramTokens:bigramTokens:](v4->_store, "naiveBayesModelQueryResultForFeature:unigramTokens:bigramTokens:", 1001, v17, v58);
              v176 = (void *)objc_claimAutoreleasedReturnValue();
              v177 = [SGMIFeature alloc];
              objc_msgSend(v176, "inferProbability");
              v178 = v9;
              v179 = (void *)objc_claimAutoreleasedReturnValue();
              v180 = v177;
              v181 = 1001;
              goto LABEL_141;
            case 1002:
              -[SGMIFeatureVector feature:](v4, "feature:", 2006);
              v173 = v7;
              v182 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v182, "stringArrayValue");
              v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

              -[SGMIFeatureVector feature:](v4, "feature:", 2007);
              v183 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v183, "stringArrayValue");
              v58 = (void *)objc_claimAutoreleasedReturnValue();

              -[SGSqlEntityStore naiveBayesModelQueryResultForFeature:unigramTokens:bigramTokens:](v4->_store, "naiveBayesModelQueryResultForFeature:unigramTokens:bigramTokens:", 1002, v17, v58);
              v176 = (void *)objc_claimAutoreleasedReturnValue();
              v184 = [SGMIFeature alloc];
              objc_msgSend(v176, "inferProbability");
              v178 = v9;
              v179 = (void *)objc_claimAutoreleasedReturnValue();
              v180 = v184;
              v181 = 1002;
LABEL_141:
              v10 = -[SGMIFeature initWithFeatureName:numberValue:](v180, "initWithFeatureName:numberValue:", v181, v179);

              v9 = v178;
              v7 = v173;
              goto LABEL_154;
            case 1003:
              -[SGMIFeatureVector feature:](v4, "feature:", 2001);
              v185 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v185, "stringArrayValue");
              v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

              -[SGSqlEntityStore naiveBayesModelQueryResultForFeature:unigramTokens:bigramTokens:](v4->_store, "naiveBayesModelQueryResultForFeature:unigramTokens:bigramTokens:", 1003, v17, MEMORY[0x1E0C9AA60]);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v186 = [SGMIFeature alloc];
              objc_msgSend(v58, "inferProbability");
              v187 = v9;
              v188 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = -[SGMIFeature initWithFeatureName:numberValue:](v186, "initWithFeatureName:numberValue:", 1003, v188);

              v9 = v187;
              goto LABEL_154;
            case 1004:
              -[SGMIFeatureVector feature:](v4, "feature:", 2010);
              v189 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v189, "stringValue");
              v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

              v190 = v4->_store;
              v291 = v17;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v291, 1);
              v191 = (void *)objc_claimAutoreleasedReturnValue();
              -[SGSqlEntityStore naiveBayesModelQueryResultForFeature:unigramTokens:bigramTokens:](v190, "naiveBayesModelQueryResultForFeature:unigramTokens:bigramTokens:", 1004, v191, MEMORY[0x1E0C9AA60]);
              v20 = v9;
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              v192 = [SGMIFeature alloc];
              objc_msgSend(v21, "inferProbability");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = v192;
              v25 = 1004;
              goto LABEL_149;
            case 1005:
              -[SGMIFeatureVector feature:](v4, "feature:", 2011);
              v193 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v193, "stringValue");
              v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

              v194 = v4->_store;
              v290 = v17;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v290, 1);
              v195 = (void *)objc_claimAutoreleasedReturnValue();
              -[SGSqlEntityStore naiveBayesModelQueryResultForFeature:unigramTokens:bigramTokens:](v194, "naiveBayesModelQueryResultForFeature:unigramTokens:bigramTokens:", 1005, v195, MEMORY[0x1E0C9AA60]);
              v20 = v9;
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              v196 = [SGMIFeature alloc];
              objc_msgSend(v21, "inferProbability");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = v196;
              v25 = 1005;
              goto LABEL_149;
            case 1006:
              -[SGMIFeatureVector feature:](v4, "feature:", 2012);
              v197 = v7;
              v198 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v198, "stringArrayValue");
              v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

              -[SGSqlEntityStore naiveBayesModelQueryResultForFeature:unigramTokens:bigramTokens:](v4->_store, "naiveBayesModelQueryResultForFeature:unigramTokens:bigramTokens:", 1006, v17, MEMORY[0x1E0C9AA60]);
              v199 = (void *)objc_claimAutoreleasedReturnValue();
              v200 = [SGMIFeature alloc];
              objc_msgSend(v199, "inferProbability");
              v201 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = -[SGMIFeature initWithFeatureName:numberValue:](v200, "initWithFeatureName:numberValue:", 1006, v201);

              v7 = v197;
              goto LABEL_243;
            case 1007:
              -[SGMIFeatureVector feature:](v4, "feature:", 2015);
              v202 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v202, "stringValue");
              v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

              v203 = v4->_store;
              v293 = v17;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v293, 1);
              v204 = (void *)objc_claimAutoreleasedReturnValue();
              -[SGSqlEntityStore naiveBayesModelQueryResultForFeature:unigramTokens:bigramTokens:](v203, "naiveBayesModelQueryResultForFeature:unigramTokens:bigramTokens:", 1007, v204, MEMORY[0x1E0C9AA60]);
              v20 = v9;
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              v205 = [SGMIFeature alloc];
              objc_msgSend(v21, "inferProbability");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = v205;
              v25 = 1007;
              goto LABEL_149;
            case 1008:
              -[SGMIFeatureVector feature:](v4, "feature:", 2016);
              v206 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v206, "stringValue");
              v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

              v207 = v4->_store;
              v294 = v17;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v294, 1);
              v208 = (void *)objc_claimAutoreleasedReturnValue();
              -[SGSqlEntityStore naiveBayesModelQueryResultForFeature:unigramTokens:bigramTokens:](v207, "naiveBayesModelQueryResultForFeature:unigramTokens:bigramTokens:", 1008, v208, MEMORY[0x1E0C9AA60]);
              v20 = v9;
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              v209 = [SGMIFeature alloc];
              objc_msgSend(v21, "inferProbability");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = v209;
              v25 = 1008;
              goto LABEL_149;
            default:
              if (a3 == 1100)
              {
                v263 = v7;
                v264 = (void *)v8;
                -[SGMIFeatureVector feature:](v4, "feature:", 2000);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "stringValue");
                v38 = (void *)objc_claimAutoreleasedReturnValue();

                -[SGMIFeatureVector feature:](v4, "feature:", 2101);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "stringValue");
                v40 = (void *)objc_claimAutoreleasedReturnValue();

                -[SGMIFeatureVector feature:](v4, "feature:", 2102);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "stringValue");
                v42 = objc_claimAutoreleasedReturnValue();

                +[SGMIConfig defaultConfig](SGMIConfig, "defaultConfig");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v266 = (void *)v42;
                objc_msgSend(v43, "objectForKeyedSubscript:", v42);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v44)
                {
                  objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("en"));
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(v44, "attachment");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "body");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "subject");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = objc_msgSend(v46, "rangeOfFirstMatchInString:options:range:", v40, 0, 0, objc_msgSend(v40, "length"));
                v49 = objc_msgSend(v47, "rangeOfFirstMatchInString:options:range:", v38, 0, 0, objc_msgSend(v38, "length"));
                if (v46)
                  v50 = v48 == 0x7FFFFFFFFFFFFFFFLL;
                else
                  v50 = 1;
                v51 = !v50;
                if (v47)
                  v52 = v49 == 0x7FFFFFFFFFFFFFFFLL;
                else
                  v52 = 1;
                if (v52)
                  v53 = v51;
                else
                  v53 = 1;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v53);
                v54 = v38;
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                v10 = -[SGMIFeature initWithFeatureName:numberValue:]([SGMIFeature alloc], "initWithFeatureName:numberValue:", 1100, v55);

LABEL_209:
                v7 = v263;
                v9 = v264;
              }
              goto LABEL_244;
          }
      }
    }
    if (a3 <= 2999)
    {
      switch(a3)
      {
        case 2000:
          v56 = [SGMIFeature alloc];
          v57 = v4->_mailMessage;
          if (!v57)
          {
            v32 = -[SGMIFeature initWithFeatureName:stringValue:](v56, "initWithFeatureName:stringValue:", 2000, &stru_1E7DB83A8);
            goto LABEL_229;
          }
          -[SGMessage subject](v57, "subject");
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            -[SGMessage subject](v4->_mailMessage, "subject");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = -[SGMIFeature initWithFeatureName:stringValue:](v56, "initWithFeatureName:stringValue:", 2000, v58);
            goto LABEL_153;
          }
          v129 = &stru_1E7DB83A8;
          v35 = v56;
          v36 = 2000;
          goto LABEL_237;
        case 2001:
          v265 = (void *)v8;
          -[SGMIFeatureVector feature:](v4, "feature:", 2000);
          v267 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v267, "stringValue");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGTokenizer tokenize:](SGTokenizer, "tokenize:", v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          v62 = (void *)objc_opt_new();
          if ((unint64_t)objc_msgSend(v61, "count") >= 2)
          {
            v63 = 1;
            do
            {
              v64 = objc_alloc(MEMORY[0x1E0CB3940]);
              objc_msgSend(v61, "objectAtIndexedSubscript:", v63 - 1);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "objectAtIndexedSubscript:", v63);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = (void *)objc_msgSend(v64, "initWithFormat:", CFSTR("%@_%@"), v65, v66);
              objc_msgSend(v62, "addObject:", v67);

              ++v63;
            }
            while (objc_msgSend(v61, "count") > v63);
          }
          objc_msgSend(v61, "arrayByAddingObjectsFromArray:", v62);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = -[SGMIFeature initWithFeatureName:stringArrayValue:]([SGMIFeature alloc], "initWithFeatureName:stringArrayValue:", 2001, v68);

          v9 = v265;
          goto LABEL_244;
        case 2002:
        case 2008:
        case 2009:
        case 2013:
        case 2014:
          goto LABEL_244;
        case 2003:
        case 2010:
          v26 = v4->_mailMessage;
          if (v26)
          {
            v27 = v9;
            -[SGSimpleMailMessage from](v26, "from");
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28)
            {
              -[SGSimpleMailMessage from](v4->_mailMessage, "from");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "emailAddress");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "lowercaseString");
              v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

              goto LABEL_195;
            }
          }
          else
          {
            v27 = v9;
          }
          v31 = CFSTR("nil@nil.invalid");
LABEL_195:
          -[SGMIFeatureVector setFeatureToStringValue:forName:](v4, "setFeatureToStringValue:forName:", v31, 2003);
          emailAddressDomain(v31);
          v255 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGMIFeatureVector setFeatureToStringValue:forName:](v4, "setFeatureToStringValue:forName:", v255, 2010);
          features = v4->_features;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
          v257 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](features, "objectForKeyedSubscript:", v257);
          v10 = (SGMIFeature *)objc_claimAutoreleasedReturnValue();

          v9 = v27;
          goto LABEL_244;
        case 2004:
          v69 = v4->_mailMessage;
          if (v69)
          {
            -[SGSimpleMailMessage to](v69, "to");
            v70 = (void *)objc_claimAutoreleasedReturnValue();

            if (v70)
            {
              -[SGSimpleMailMessage to](v4->_mailMessage, "to");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "_pas_mappedArrayWithTransform:", &__block_literal_global_24300);
              v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

              v72 = [SGMIFeature alloc];
              -[__CFString sortedArrayUsingSelector:](v17, "sortedArrayUsingSelector:", sel_compare_);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v59 = -[SGMIFeature initWithFeatureName:stringArrayValue:](v72, "initWithFeatureName:stringArrayValue:", 2004, v58);
              goto LABEL_153;
            }
          }
          v258 = [SGMIFeature alloc];
          v32 = -[SGMIFeature initWithFeatureName:stringArrayValue:](v258, "initWithFeatureName:stringArrayValue:", 2004, MEMORY[0x1E0C9AA60]);
          goto LABEL_229;
        case 2005:
          v263 = v7;
          v264 = (void *)v8;
          v262 = v4;
          -[SGMIFeatureVector feature:](v4, "feature:", 2004);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "stringArrayValue");
          v74 = (void *)objc_claimAutoreleasedReturnValue();

          v75 = (void *)objc_opt_new();
          if (objc_msgSend(v74, "count"))
          {
            v76 = 0;
            v77 = 1;
            do
            {
              v268 = v76 + 1;
              if (objc_msgSend(v74, "count") > (unint64_t)(v76 + 1))
              {
                v78 = v77;
                do
                {
                  v79 = objc_alloc(MEMORY[0x1E0CB3940]);
                  objc_msgSend(v74, "objectAtIndexedSubscript:", v76);
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "objectAtIndexedSubscript:", v78);
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  v82 = (void *)objc_msgSend(v79, "initWithFormat:", CFSTR("%@_%@"), v80, v81);
                  objc_msgSend(v75, "addObject:", v82);

                  ++v78;
                }
                while (objc_msgSend(v74, "count") > v78);
              }
              ++v77;
              ++v76;
            }
            while (objc_msgSend(v74, "count") > v268);
          }
          v83 = [SGMIFeature alloc];
          v84 = 2005;
          goto LABEL_67;
        case 2006:
          v85 = v7;
          v86 = v4->_mailMessage;
          if (v86
            && (-[SGSimpleMailMessage cc](v86, "cc"),
                v87 = (void *)objc_claimAutoreleasedReturnValue(),
                v87,
                v87))
          {
            -[SGSimpleMailMessage cc](v4->_mailMessage, "cc");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "_pas_mappedArrayWithTransform:", &__block_literal_global_52_24301);
            v89 = (void *)objc_claimAutoreleasedReturnValue();

            v90 = [SGMIFeature alloc];
            objc_msgSend(v89, "sortedArrayUsingSelector:", sel_compare_);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = -[SGMIFeature initWithFeatureName:stringArrayValue:](v90, "initWithFeatureName:stringArrayValue:", 2006, v91);

          }
          else
          {
            v259 = [SGMIFeature alloc];
            v10 = -[SGMIFeature initWithFeatureName:stringArrayValue:](v259, "initWithFeatureName:stringArrayValue:", 2006, MEMORY[0x1E0C9AA60]);
          }
LABEL_198:
          v7 = v85;
          goto LABEL_244;
        case 2007:
          v263 = v7;
          v264 = (void *)v8;
          v262 = v4;
          -[SGMIFeatureVector feature:](v4, "feature:", 2006);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "stringArrayValue");
          v74 = (void *)objc_claimAutoreleasedReturnValue();

          v75 = (void *)objc_opt_new();
          if (objc_msgSend(v74, "count"))
          {
            v93 = 0;
            v94 = 1;
            do
            {
              v269 = v93 + 1;
              if (objc_msgSend(v74, "count") > (unint64_t)(v93 + 1))
              {
                v95 = v94;
                do
                {
                  v96 = objc_alloc(MEMORY[0x1E0CB3940]);
                  objc_msgSend(v74, "objectAtIndexedSubscript:", v93);
                  v97 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "objectAtIndexedSubscript:", v95);
                  v98 = (void *)objc_claimAutoreleasedReturnValue();
                  v99 = (void *)objc_msgSend(v96, "initWithFormat:", CFSTR("%@_%@"), v97, v98);
                  objc_msgSend(v75, "addObject:", v99);

                  ++v95;
                }
                while (objc_msgSend(v74, "count") > v95);
              }
              ++v94;
              ++v93;
            }
            while (objc_msgSend(v74, "count") > v269);
          }
          v83 = [SGMIFeature alloc];
          v84 = 2007;
LABEL_67:
          v10 = -[SGMIFeature initWithFeatureName:stringArrayValue:](v83, "initWithFeatureName:stringArrayValue:", v84, v75);

          v4 = v262;
          goto LABEL_209;
        case 2011:
          v100 = (void *)v8;
          -[SGMIFeatureVector feature:](v4, "feature:", 2003);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "stringValue");
          v102 = (__CFString *)objc_claimAutoreleasedReturnValue();

          -[SGMIFeatureVector feature:](v4, "feature:", 2004);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "stringArrayValue");
          v104 = (void *)objc_claimAutoreleasedReturnValue();

          -[SGMIFeatureVector feature:](v4, "feature:", 2006);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "stringArrayValue");
          v106 = (void *)objc_claimAutoreleasedReturnValue();

          v107 = CFSTR("<non_dyadic_conversation>");
          if (objc_msgSend(v104, "count") == 1 && !objc_msgSend(v106, "count"))
            v107 = v102;
          v108 = v107;
          v10 = -[SGMIFeature initWithFeatureName:stringValue:]([SGMIFeature alloc], "initWithFeatureName:stringValue:", 2011, v108);

          goto LABEL_186;
        case 2012:
          -[SGMIFeatureVector feature:](v4, "feature:", 5);
          v109 = v7;
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "numberArrayValue");
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

          -[SGMIFeatureVector feature:](v4, "feature:", 4);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "numberArrayValue");
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          -[SGMIFeatureVector feature:](v4, "feature:", 6);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "numberArrayValue");
          v113 = v9;
          v114 = (void *)objc_claimAutoreleasedReturnValue();

          v115 = (void *)objc_opt_new();
          __29__SGMIFeatureVector_feature___block_invoke_4(v17, CFSTR("App"), v115);
          __29__SGMIFeatureVector_feature___block_invoke_4(v58, CFSTR("Media"), v115);
          __29__SGMIFeatureVector_feature___block_invoke_4(v114, CFSTR("Others"), v115);
          v10 = -[SGMIFeature initWithFeatureName:stringArrayValue:]([SGMIFeature alloc], "initWithFeatureName:stringArrayValue:", 2012, v115);

          v7 = v109;
          v9 = v113;
          goto LABEL_154;
        case 2015:
          v263 = v7;
          v264 = (void *)v8;
          v284 = 0u;
          v285 = 0u;
          v282 = 0u;
          v283 = 0u;
          -[SGSimpleMailMessage headers](v4->_mailMessage, "headers");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v282, v292, 16);
          if (v117)
          {
            v118 = v117;
            v119 = *(_QWORD *)v283;
            v120 = &stru_1E7DB83A8;
            do
            {
              for (m = 0; m != v118; ++m)
              {
                if (*(_QWORD *)v283 != v119)
                  objc_enumerationMutation(v116);
                v122 = *(void **)(*((_QWORD *)&v282 + 1) + 8 * m);
                objc_msgSend(v122, "key");
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                v124 = objc_msgSend(v123, "isEqualToString:", CFSTR("list-id"));

                if (v124)
                {
                  objc_msgSend(v122, "value");
                  v125 = objc_claimAutoreleasedReturnValue();

                  v120 = (__CFString *)v125;
                }
              }
              v118 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v282, v292, 16);
            }
            while (v118);
          }
          else
          {
            v120 = &stru_1E7DB83A8;
          }

          v10 = -[SGMIFeature initWithFeatureName:stringValue:]([SGMIFeature alloc], "initWithFeatureName:stringValue:", 2015, v120);
          goto LABEL_209;
        case 2016:
          -[SGMessage mailConversationIdentifier](v4->_mailMessage, "mailConversationIdentifier");
          v126 = objc_claimAutoreleasedReturnValue();
          v127 = (void *)v126;
          v128 = &stru_1E7DB83A8;
          if (v126)
            v128 = (__CFString *)v126;
          v17 = v128;

          v35 = [SGMIFeature alloc];
          v36 = 2016;
          goto LABEL_86;
        default:
          if (a3 == 2101)
          {
            if (v4->_mailMessage)
            {
              v7[2](v7);
              -[SGSimpleMailMessage textContent](v4->_mailMessage, "textContent");
              v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v17 = 0;
            }
            v35 = [SGMIFeature alloc];
            if (v17)
              v129 = v17;
            else
              v129 = &stru_1E7DB83A8;
            v36 = 2101;
          }
          else
          {
            if (a3 != 2102)
              goto LABEL_244;
            v33 = -[SGMIFeatureVector feature:](v4, "feature:", 2101);
            v34 = [SGMIFeature alloc];
            -[SGMessage textContentLanguageIdentifier](v4->_mailMessage, "textContentLanguageIdentifier");
            v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v35 = v34;
            v36 = 2102;
LABEL_86:
            v129 = v17;
          }
LABEL_237:
          v260 = -[SGMIFeature initWithFeatureName:stringValue:](v35, "initWithFeatureName:stringValue:", v36, v129);
          break;
      }
LABEL_242:
      v10 = (SGMIFeature *)v260;
LABEL_243:

    }
    else
    {
      switch(a3)
      {
        case 3000:
          biomeMessageSummary = v4->_biomeMessageSummary;
          if (biomeMessageSummary
            && -[SGMIBiomeReducedMessageEvents messageViewCount](biomeMessageSummary, "messageViewCount"))
          {
            v12 = v7;
            v13 = [SGMIFeature alloc];
            if (-[SGMIBiomeReducedMessageEvents scrolledToEnd](v4->_biomeMessageSummary, "scrolledToEnd"))
              senderConnectionScore = (NSNumber *)&unk_1E7E0C968;
            else
              senderConnectionScore = (NSNumber *)&unk_1E7E0C950;
            v15 = v13;
            v7 = v12;
          }
          else
          {
            v15 = [SGMIFeature alloc];
            senderConnectionScore = (NSNumber *)MEMORY[0x1E0C9AAA0];
          }
          v248 = 3000;
          break;
        case 3001:
          v130 = v4->_biomeMessageSummary;
          v131 = [SGMIFeature alloc];
          if (v130)
          {
            if (-[SGMIBiomeReducedMessageEvents userReplied](v4->_biomeMessageSummary, "userReplied"))
              senderConnectionScore = (NSNumber *)&unk_1E7E0C968;
            else
              senderConnectionScore = (NSNumber *)&unk_1E7E0C950;
          }
          else
          {
            senderConnectionScore = (NSNumber *)MEMORY[0x1E0C9AAA0];
          }
          v15 = v131;
          v248 = 3001;
          break;
        case 3002:
          v132 = v4->_biomeMessageSummary;
          v15 = [SGMIFeature alloc];
          v133 = v15;
          if (v132)
          {
            v85 = v7;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SGMIBiomeReducedMessageEvents numberOfMailsViewedBeforeSinceAvailable](v4->_biomeMessageSummary, "numberOfMailsViewedBeforeSinceAvailable"));
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            v135 = v133;
            v136 = 3002;
            goto LABEL_98;
          }
          senderConnectionScore = (NSNumber *)&unk_1E7E0C920;
          v248 = 3002;
          break;
        case 3003:
          v137 = v4->_biomeMessageSummary;
          if (v137 && -[SGMIBiomeReducedMessageEvents messageViewCount](v137, "messageViewCount"))
          {
            v138 = v7;
            v139 = [SGMIFeature alloc];
            v140 = (void *)MEMORY[0x1E0CB37E8];
            -[SGMIBiomeReducedMessageEvents timeBeforeViewStartSinceAvailable](v4->_biomeMessageSummary, "timeBeforeViewStartSinceAvailable");
            objc_msgSend(v140, "numberWithDouble:");
            v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v141 = v139;
            v7 = v138;
            v142 = 3003;
            goto LABEL_241;
          }
          v15 = [SGMIFeature alloc];
          senderConnectionScore = (NSNumber *)&unk_1E7E0C920;
          v248 = 3003;
          break;
        case 3004:
          v143 = v4->_biomeMessageSummary;
          v15 = [SGMIFeature alloc];
          v144 = v15;
          if (!v143)
          {
            senderConnectionScore = (NSNumber *)&unk_1E7E0C950;
            v248 = 3004;
            break;
          }
          v85 = v7;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SGMIBiomeReducedMessageEvents messageViewCount](v4->_biomeMessageSummary, "messageViewCount"));
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          v135 = v144;
          v136 = 3004;
LABEL_98:
          v10 = -[SGMIFeature initWithFeatureName:numberValue:](v135, "initWithFeatureName:numberValue:", v136, v134);

          goto LABEL_198;
        case 3005:
          v145 = v4->_biomeMessageSummary;
          if (v145 && -[SGMIBiomeReducedMessageEvents messageViewCount](v145, "messageViewCount"))
          {
            v146 = v7;
            v147 = [SGMIFeature alloc];
            v148 = (void *)MEMORY[0x1E0CB37E8];
            -[SGMIBiomeReducedMessageEvents messageViewMaxDwellTime](v4->_biomeMessageSummary, "messageViewMaxDwellTime");
            objc_msgSend(v148, "numberWithDouble:");
            v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v141 = v147;
            v7 = v146;
            v142 = 3005;
            goto LABEL_241;
          }
          v15 = [SGMIFeature alloc];
          senderConnectionScore = (NSNumber *)&unk_1E7E0C920;
          v248 = 3005;
          break;
        case 3006:
          v149 = v4->_biomeMessageSummary;
          if (v149 && -[SGMIBiomeReducedMessageEvents messageViewCount](v149, "messageViewCount"))
          {
            v150 = v7;
            v151 = [SGMIFeature alloc];
            v152 = (void *)MEMORY[0x1E0CB37E8];
            -[SGMIBiomeReducedMessageEvents messageViewTotalDwellTime](v4->_biomeMessageSummary, "messageViewTotalDwellTime");
            objc_msgSend(v152, "numberWithDouble:");
            v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v141 = v151;
            v7 = v150;
            v142 = 3006;
            goto LABEL_241;
          }
          v15 = [SGMIFeature alloc];
          senderConnectionScore = (NSNumber *)&unk_1E7E0C920;
          v248 = 3006;
          break;
        case 3007:
          v153 = v4->_biomeMessageSummary;
          if (v153 && -[SGMIBiomeReducedMessageEvents messageViewCount](v153, "messageViewCount"))
          {
            v154 = v7;
            v155 = [SGMIFeature alloc];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SGMIBiomeReducedMessageEvents numberOfUnreadMessageAtFirstViewTime](v4->_biomeMessageSummary, "numberOfUnreadMessageAtFirstViewTime"));
            v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v141 = v155;
            v7 = v154;
            v142 = 3007;
            goto LABEL_241;
          }
          v15 = [SGMIFeature alloc];
          senderConnectionScore = (NSNumber *)&unk_1E7E0C920;
          v248 = 3007;
          break;
        case 3008:
          v156 = v4->_biomeMessageSummary;
          if (v156 && -[SGMIBiomeReducedMessageEvents messageViewCount](v156, "messageViewCount"))
          {
            v157 = v7;
            v158 = [SGMIFeature alloc];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SGMIBiomeReducedMessageEvents numberOfMoreRecentUnreadMessageAtFirstViewTime](v4->_biomeMessageSummary, "numberOfMoreRecentUnreadMessageAtFirstViewTime"));
            v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v141 = v158;
            v7 = v157;
            v142 = 3008;
            goto LABEL_241;
          }
          v15 = [SGMIFeature alloc];
          senderConnectionScore = (NSNumber *)&unk_1E7E0C920;
          v248 = 3008;
          break;
        case 3009:
          v159 = v4->_biomeMessageSummary;
          v160 = [SGMIFeature alloc];
          if (v159)
          {
            if (-[SGMIBiomeReducedMessageEvents markedAsRead](v4->_biomeMessageSummary, "markedAsRead"))
              senderConnectionScore = (NSNumber *)&unk_1E7E0C968;
            else
              senderConnectionScore = (NSNumber *)&unk_1E7E0C950;
          }
          else
          {
            senderConnectionScore = (NSNumber *)MEMORY[0x1E0C9AAA0];
          }
          v15 = v160;
          v248 = 3009;
          break;
        case 3010:
          v161 = v4->_biomeMessageSummary;
          v162 = [SGMIFeature alloc];
          if (v161)
          {
            if (-[SGMIBiomeReducedMessageEvents markedAsUnread](v4->_biomeMessageSummary, "markedAsUnread"))
              senderConnectionScore = (NSNumber *)&unk_1E7E0C968;
            else
              senderConnectionScore = (NSNumber *)&unk_1E7E0C950;
          }
          else
          {
            senderConnectionScore = (NSNumber *)MEMORY[0x1E0C9AAA0];
          }
          v15 = v162;
          v248 = 3010;
          break;
        case 3011:
          v163 = v4->_biomeMessageSummary;
          v164 = [SGMIFeature alloc];
          if (v163)
          {
            if (-[SGMIBiomeReducedMessageEvents mailGotFlagged](v4->_biomeMessageSummary, "mailGotFlagged"))
              senderConnectionScore = (NSNumber *)&unk_1E7E0C968;
            else
              senderConnectionScore = (NSNumber *)&unk_1E7E0C950;
          }
          else
          {
            senderConnectionScore = (NSNumber *)MEMORY[0x1E0C9AAA0];
          }
          v15 = v164;
          v248 = 3011;
          break;
        case 3012:
          v165 = v4->_biomeMessageSummary;
          v166 = [SGMIFeature alloc];
          if (v165)
          {
            if (-[SGMIBiomeReducedMessageEvents replyDraftStarted](v4->_biomeMessageSummary, "replyDraftStarted"))
              senderConnectionScore = (NSNumber *)&unk_1E7E0C968;
            else
              senderConnectionScore = (NSNumber *)&unk_1E7E0C950;
          }
          else
          {
            senderConnectionScore = (NSNumber *)MEMORY[0x1E0C9AAA0];
          }
          v15 = v166;
          v248 = 3012;
          break;
        case 3013:
          v167 = v4->_biomeMessageSummary;
          v168 = [SGMIFeature alloc];
          if (v167)
          {
            if (-[SGMIBiomeReducedMessageEvents forwardDraftStarted](v4->_biomeMessageSummary, "forwardDraftStarted"))
              senderConnectionScore = (NSNumber *)&unk_1E7E0C968;
            else
              senderConnectionScore = (NSNumber *)&unk_1E7E0C950;
          }
          else
          {
            senderConnectionScore = (NSNumber *)MEMORY[0x1E0C9AAA0];
          }
          v15 = v168;
          v248 = 3013;
          break;
        case 3014:
          v169 = v4->_biomeMessageSummary;
          v170 = [SGMIFeature alloc];
          if (v169)
          {
            if (-[SGMIBiomeReducedMessageEvents markedAsJunk](v4->_biomeMessageSummary, "markedAsJunk"))
              senderConnectionScore = (NSNumber *)&unk_1E7E0C968;
            else
              senderConnectionScore = (NSNumber *)&unk_1E7E0C950;
          }
          else
          {
            senderConnectionScore = (NSNumber *)MEMORY[0x1E0C9AAA0];
          }
          v15 = v170;
          v248 = 3014;
          break;
        case 3015:
          v171 = v4->_biomeMessageSummary;
          v172 = [SGMIFeature alloc];
          if (v171)
          {
            if (-[SGMIBiomeReducedMessageEvents linkClicked](v4->_biomeMessageSummary, "linkClicked"))
              senderConnectionScore = (NSNumber *)&unk_1E7E0C968;
            else
              senderConnectionScore = (NSNumber *)&unk_1E7E0C950;
          }
          else
          {
            senderConnectionScore = (NSNumber *)MEMORY[0x1E0C9AAA0];
          }
          v15 = v172;
          v248 = 3015;
          break;
        default:
          goto LABEL_244;
      }
LABEL_228:
      v32 = -[SGMIFeature initWithFeatureName:numberValue:](v15, "initWithFeatureName:numberValue:", v248, senderConnectionScore);
LABEL_229:
      v10 = v32;
    }
LABEL_244:
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_features, "setObject:forKeyedSubscript:", v10, v9);
    v6 = v10;

  }
  return v6;
}

- (void)setFeatureToStringValue:(id)a3 forName:(int64_t)a4
{
  id v6;
  NSMutableDictionary *features;
  void *v8;
  SGMIFeature *v9;

  v6 = a3;
  v9 = -[SGMIFeature initWithFeatureName:stringValue:]([SGMIFeature alloc], "initWithFeatureName:stringValue:", a4, v6);

  features = self->_features;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](features, "setObject:forKeyedSubscript:", v9, v8);

}

- (void)setFeatureToStringArrayValue:(id)a3 forName:(int64_t)a4
{
  id v6;
  NSMutableDictionary *features;
  void *v8;
  SGMIFeature *v9;

  v6 = a3;
  v9 = -[SGMIFeature initWithFeatureName:stringArrayValue:]([SGMIFeature alloc], "initWithFeatureName:stringArrayValue:", a4, v6);

  features = self->_features;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](features, "setObject:forKeyedSubscript:", v9, v8);

}

- (void)setFeatureToNumberValue:(id)a3 forName:(int64_t)a4
{
  id v6;
  NSMutableDictionary *features;
  void *v8;
  SGMIFeature *v9;

  v6 = a3;
  v9 = -[SGMIFeature initWithFeatureName:numberValue:]([SGMIFeature alloc], "initWithFeatureName:numberValue:", a4, v6);

  features = self->_features;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](features, "setObject:forKeyedSubscript:", v9, v8);

}

- (void)setFeatureToNumberArrayValue:(id)a3 forName:(int64_t)a4
{
  id v6;
  NSMutableDictionary *features;
  void *v8;
  SGMIFeature *v9;

  v6 = a3;
  v9 = -[SGMIFeature initWithFeatureName:numberArrayValue:]([SGMIFeature alloc], "initWithFeatureName:numberArrayValue:", a4, v6);

  features = self->_features;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](features, "setObject:forKeyedSubscript:", v9, v8);

}

- (void)ingestFeatures:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableDictionary *features;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        features = self->_features;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "featureName"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](features, "setObject:forKeyedSubscript:", v9, v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (int64_t)evaluateFirstMatchAmong:(id)a3 defaultValue:(int64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v11, "featureName", (_QWORD)v23);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SGMIFeatureVector feature:](self, "feature:", (int)objc_msgSend(v12, "intValue"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValue");
        v15 = v14;

        objc_msgSend(v11, "strictLowerBound");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        if (v17 >= v15)
        {

        }
        else
        {
          objc_msgSend(v11, "strictUpperBound");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "doubleValue");
          v20 = v19;

          if (v15 < v20)
          {
            objc_msgSend(v11, "output");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            a4 = objc_msgSend(v21, "BOOLValue");

            goto LABEL_12;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }
LABEL_12:

  return a4;
}

- (int64_t)estimateGroundTruth
{
  void *v3;
  int64_t v4;

  +[SGMISaliencyModelConfig defaultConfig](SGMISaliencyModelConfig, "defaultConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SGMIFeatureVector estimateGroundTruthWithConfig:](self, "estimateGroundTruthWithConfig:", v3);

  return v4;
}

- (int64_t)estimateGroundTruthWithConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v4, "groundTruthEstimatorRules", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      v10 = 2;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "featureName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGMIFeatureVector cachedFeature:](self, "cachedFeature:", (int)objc_msgSend(v12, "intValue"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {

            objc_msgSend(v5, "groundTruthEstimatorRules");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = -[SGMIFeatureVector evaluateFirstMatchAmong:defaultValue:](self, "evaluateFirstMatchAmong:defaultValue:", v6, 0);
            goto LABEL_14;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
    else
    {
      v10 = 2;
    }
LABEL_14:

  }
  else
  {
    v10 = 2;
  }

  return v10;
}

- (NSString)mailboxId
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SGSimpleMailMessage mailboxIdentifiers](self->_mailMessage, "mailboxIdentifiers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = CFSTR("<unassigned_mailbox>");
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "containsString:", CFSTR("://")))
        {
          v6 = v8;
          goto LABEL_12;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v6 = CFSTR("<unassigned_mailbox>");
  }
LABEL_12:

  return (NSString *)v6;
}

- (id)defaultSaliencyOnError
{
  return -[SGMIFeatureVector saliencyWithScore:isSalient:](self, "saliencyWithScore:isSalient:", &unk_1E7E0CDF0, 0);
}

- (id)defaultSaliencyOnOverrideFor:(int64_t)a3
{
  void *v3;
  uint64_t v4;

  if (a3 == 1)
  {
    v3 = &unk_1E7E0CE00;
    v4 = 1;
  }
  else
  {
    v3 = &unk_1E7E0CDF0;
    v4 = 0;
  }
  -[SGMIFeatureVector saliencyWithScore:isSalient:](self, "saliencyWithScore:isSalient:", v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)saliencyWithScore:(id)a3 isSalient:(BOOL)a4
{
  return -[SGMIFeatureVector saliencyWithScore:isSalient:gteSaliency:isCounted:](self, "saliencyWithScore:isSalient:gteSaliency:isCounted:", a3, a4, 2, 0);
}

- (id)saliencyWithScore:(id)a3 isSalient:(BOOL)a4 gteSaliency:(int64_t)a5 isCounted:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v8;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  SGSimpleMailMessage *mailMessage;
  void *v16;
  void *v17;

  v6 = a6;
  v8 = a4;
  v10 = (objc_class *)MEMORY[0x1E0D19880];
  v11 = a3;
  v12 = [v10 alloc];
  -[SGMIFeatureVector messageId](self, "messageId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMIFeatureVector mailboxId](self, "mailboxId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  mailMessage = self->_mailMessage;
  if (mailMessage)
    -[SGMessage date](mailMessage, "date");
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v12, "initWithMessageId:mailboxId:score:isSalient:gteSaliency:isCounted:creationDate:", v13, v14, v11, v8, a5, v6, v16);

  return v17;
}

- (void)logOrStageWithSaliency:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[8];

  v4 = a3;
  if (self->_hasHashedMessageId)
  {
    sgMailIntelligenceLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "SGMIFeatureVector: PET logging skipped (hashed messageId)", buf, 2u);
    }
  }
  else
  {
    dispatch_get_global_queue(9, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __44__SGMIFeatureVector_logOrStageWithSaliency___block_invoke;
    v6[3] = &unk_1E7DB10C8;
    objc_copyWeak(&v8, (id *)buf);
    v7 = v4;
    dispatch_async(v5, v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }

}

- (NSString)messageId
{
  return self->_messageId;
}

- (BOOL)hasHashedMessageId
{
  return self->_hasHashedMessageId;
}

- (SGSimpleMailMessage)mailMessage
{
  return self->_mailMessage;
}

- (SGSqlEntityStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_spotlightIdentifier, 0);
  objc_storeStrong((id *)&self->_senderConnectionScore, 0);
  objc_storeStrong((id *)&self->_biomeMessageSummary, 0);
  objc_storeStrong((id *)&self->_mailClientUtil, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_mailMessage, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
}

void __44__SGMIFeatureVector_logOrStageWithSaliency___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  int v41;
  int v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _BOOL8 v58;
  void *v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  id *v68;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v68 = WeakRetained;
    objc_msgSend(WeakRetained[10], "mailIntelligenceStagedLogsForMessageId:", WeakRetained[1]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isLogged") & 1) == 0)
    {
      objc_msgSend(v4, "log");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(*(id *)(a1 + 32), "gteSaliency");
      if ((objc_msgSend(v5, "hasLocale") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localeIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setLocale:", v8);

        v9 = v68;
        v10 = v68[2];
        if (v10)
        {
          objc_msgSend(v10, "date");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v9 = v68;
          if (v11)
          {
            objc_msgSend(v68[2], "date");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "timeIntervalSinceNow");
            objc_msgSend(v5, "setTimeDifferenceFromReceptionToSaliencyInferenceInSeconds:", -v13);

            v9 = v68;
          }
        }
        objc_msgSend(v9[6], "floatValue");
        objc_msgSend(v5, "setSenderConnectionScore:");
      }
      objc_msgSend(v5, "active");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "submodelsProbabilities");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v15, "hasPersonFromSenderProbability") & 1) == 0)
      {
        objc_msgSend(v68[3], "objectForKeyedSubscript:", &unk_1E7E0C980);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16 || v6 != 2)
        {
          objc_msgSend(v68, "feature:", 1000);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "floatValue");
          objc_msgSend(v15, "setPersonFromSenderProbability:");

        }
      }
      if ((objc_msgSend(v15, "hasPersonFromSenderInDyadicConversationProbability") & 1) == 0)
      {
        objc_msgSend(v68[3], "objectForKeyedSubscript:", &unk_1E7E0C998);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18 || v6 != 2)
        {
          objc_msgSend(v68, "feature:", 1005);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "floatValue");
          objc_msgSend(v15, "setPersonFromSenderInDyadicConversationProbability:");

        }
      }
      if ((objc_msgSend(v15, "hasSubjectContentProbability") & 1) == 0)
      {
        objc_msgSend(v68[3], "objectForKeyedSubscript:", &unk_1E7E0C9B0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20 || v6 != 2)
        {
          objc_msgSend(v68, "feature:", 1003);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "floatValue");
          objc_msgSend(v15, "setSubjectContentProbability:");

        }
      }
      if ((objc_msgSend(v15, "hasPersonToRecipientsProbability") & 1) == 0)
      {
        objc_msgSend(v68[3], "objectForKeyedSubscript:", &unk_1E7E0C9C8);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22 || v6 != 2)
        {
          objc_msgSend(v68, "feature:", 1001);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "floatValue");
          objc_msgSend(v15, "setPersonToRecipientsProbability:");

        }
      }
      if ((objc_msgSend(v15, "hasPersonCCRecipientsProbability") & 1) == 0)
      {
        objc_msgSend(v68[3], "objectForKeyedSubscript:", &unk_1E7E0C9E0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24 || v6 != 2)
        {
          objc_msgSend(v68, "feature:", 1002);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "floatValue");
          objc_msgSend(v15, "setPersonCCRecipientsProbability:");

        }
      }
      if ((objc_msgSend(v15, "hasDomainFromSenderProbability") & 1) == 0)
      {
        objc_msgSend(v68[3], "objectForKeyedSubscript:", &unk_1E7E0C9F8);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26 || v6 != 2)
        {
          objc_msgSend(v68, "feature:", 1004);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "floatValue");
          objc_msgSend(v15, "setDomainFromSenderProbability:");

        }
      }
      if ((objc_msgSend(v15, "hasConversationProbability") & 1) == 0)
      {
        objc_msgSend(v68[3], "objectForKeyedSubscript:", &unk_1E7E0CA10);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28 || v6 != 2)
        {
          objc_msgSend(v68, "feature:", 1008);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "floatValue");
          objc_msgSend(v15, "setConversationProbability:");

        }
      }
      if ((objc_msgSend(v15, "hasListIdProbability") & 1) == 0)
      {
        objc_msgSend(v68[3], "objectForKeyedSubscript:", &unk_1E7E0CA28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30 || v6 != 2)
        {
          objc_msgSend(v68, "feature:", 1007);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "floatValue");
          objc_msgSend(v15, "setListIdProbability:");

        }
      }
      if ((objc_msgSend(v5, "hasNbCharactersInMailSubject") & 1) == 0)
      {
        objc_msgSend(v68[3], "objectForKeyedSubscript:", &unk_1E7E0CA40);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32 || v6 != 2)
        {
          objc_msgSend(v68, "feature:", 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setNbCharactersInMailSubject:", objc_msgSend(v33, "intValue"));

        }
      }
      if ((objc_msgSend(v5, "hasNbTokensInMailSubject") & 1) == 0)
      {
        objc_msgSend(v68[3], "objectForKeyedSubscript:", &unk_1E7E0CA40);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34 || v6 != 2)
        {
          objc_msgSend(v68, "feature:", 2);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setNbTokensInMailSubject:", objc_msgSend(v35, "intValue"));

        }
      }
      if ((objc_msgSend(v5, "hasNbTokensInMailSubject") & 1) == 0)
      {
        objc_msgSend(v68[3], "objectForKeyedSubscript:", &unk_1E7E0CA40);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36 || v6 != 2)
        {
          objc_msgSend(v68, "feature:", 2);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setNbTokensInMailSubject:", objc_msgSend(v37, "intValue"));

        }
      }
      if (objc_msgSend(*(id *)(a1 + 32), "isSalient"))
        v38 = 1;
      else
        v38 = 3;
      objc_msgSend(v5, "active");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setPredictedSaliency:", v38);

      objc_msgSend(*(id *)(a1 + 32), "score");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "floatValue");
      v42 = v41;
      objc_msgSend(v5, "active");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v44) = v42;
      objc_msgSend(v43, "setPredictedSaliencyScore:", v44);

      objc_msgSend(v5, "active");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "missingAttachments");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "count");

      if (v6 == 2)
      {
        if (!v47)
        {
          objc_msgSend(v68, "feature:", 2012);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = (void *)objc_opt_new();
          LODWORD(v64) = -1.0;
          objc_msgSend(v63, "setPredictedMissingElementScore:", v64);
          objc_msgSend(v62, "stringArrayValue");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "setFoundMatchingElement:", objc_msgSend(v65, "count") != 0);

          objc_msgSend(v5, "active");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "missingAttachments");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "addObject:", v63);

        }
        objc_msgSend(v68[10], "setMailIntelligenceStagedLogs:forMessageId:", v5, v68[1]);
      }
      else
      {
        if (v47)
        {
          +[SGMIConfig defaultConfig](SGMIConfig, "defaultConfig");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v48, "shouldAnalyzeBody"))
          {
            objc_msgSend(v68, "feature:", 2102);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "stringValue");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setLang:", v50);

            objc_msgSend(v5, "active");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "missingAttachments");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "firstObject");
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v68, "feature:", 1100);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "floatValue");
            objc_msgSend(v53, "setPredictedMissingElementScore:");

          }
        }
        v55 = (void *)objc_opt_new();
        objc_msgSend(v55, "trialMetadata");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "active");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setTrialMetadata:", v56);

        v58 = objc_msgSend(*(id *)(a1 + 32), "gteSaliency") == 1;
        objc_msgSend(v5, "active");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setEstimatedGroundTruth:", v58);

        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        objc_msgSend(v5, "setHoursSinceReference:", (v60 / 3600.0));
        objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "logMessage:", v5);

        objc_msgSend(v68[10], "markMailIntelligenceStagedLogsAsLoggedAndClearLogPayloadForMessageId:", v68[1]);
      }

    }
    v3 = v68;
  }

}

void __29__SGMIFeatureVector_feature___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  dispatch_semaphore_t v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  SGSimpleMailMessage *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  _QWORD v43[4];
  NSObject *v44;
  _BYTE *v45;
  uint8_t v46[128];
  _BYTE v47[24];
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _BYTE buf[24];
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 56))
  {
    v3 = *(void **)(v1 + 64);
    if (v3)
    {
      v4 = v3;
      v5 = *(void **)(v1 + 64);
      *(_QWORD *)(v1 + 64) = v4;
    }
    else
    {
      objc_msgSend(*(id *)(v1 + 80), "spotlightUniqueIdentifierForBundleIdentifier:messageId:", *MEMORY[0x1E0D19A28], *(_QWORD *)(v1 + 8));
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v7 + 64);
      *(_QWORD *)(v7 + 64) = v6;
    }

    v1 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v1 + 64))
    {
      +[SGMailClientUtil sharedInstance](SGMailClientUtil, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "emailDaemon");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "messageRepository");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v37, "messageForSearchableItemIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "result");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      sgMailIntelligenceLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        *(_DWORD *)buf = 138740227;
        *(_QWORD *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v13;
        _os_log_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEFAULT, "Follow Up. [SGMIFeatureVector] emMessage %{sensitive}@ loaded for messageId %@.", buf, 0x16u);
      }

      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0D1E130], "optionsWithRequestedRepresentationType:networkUsage:includeSuggestions:", *MEMORY[0x1E0D1DBE0], 0, 2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = dispatch_semaphore_create(0);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v52 = __Block_byref_object_copy__24308;
        v53 = __Block_byref_object_dispose__24309;
        v15 = MEMORY[0x1E0C809B0];
        v54 = 0;
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __29__SGMIFeatureVector_feature___block_invoke_32;
        v43[3] = &unk_1E7DB0FF0;
        v45 = buf;
        v16 = v14;
        v44 = v16;
        v17 = (id)objc_msgSend(v11, "requestRepresentationWithOptions:completionHandler:", v36, v43);
        v35 = v16;
        dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "searchableItem");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        sgMailIntelligenceLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          *(_DWORD *)v47 = 138412546;
          *(_QWORD *)&v47[4] = v18;
          *(_WORD *)&v47[12] = 2112;
          *(_QWORD *)&v47[14] = v20;
          _os_log_impl(&dword_1C3607000, v19, OS_LOG_TYPE_DEFAULT, "Follow Up. [SGMIFeatureVector] searchableItem %@ loaded for messageId %@.", v47, 0x16u);
        }

        if (v18)
        {
          v21 = -[SGSimpleMailMessage initWithSearchableItem:]([SGSimpleMailMessage alloc], "initWithSearchableItem:", v18);
          v22 = *(_QWORD *)(a1 + 32);
          v23 = *(void **)(v22 + 16);
          *(_QWORD *)(v22 + 16) = v21;

          *(_QWORD *)v47 = 0;
          *(_QWORD *)&v47[8] = v47;
          *(_QWORD *)&v47[16] = 0x3032000000;
          v48 = __Block_byref_object_copy__24308;
          v49 = __Block_byref_object_dispose__24309;
          v50 = 0;
          v50 = (id)objc_opt_new();
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "relatedContentItems");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v42[0] = v15;
          v42[1] = 3221225472;
          v42[2] = __29__SGMIFeatureVector_feature___block_invoke_35;
          v42[3] = &unk_1E7DB1018;
          v42[4] = v47;
          objc_msgSend(v24, "enumerateObjectsUsingBlock:", v42);

          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "attachments");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          if (v26)
          {
            v27 = *(_QWORD *)v39;
            do
            {
              for (i = 0; i != v26; ++i)
              {
                if (*(_QWORD *)v39 != v27)
                  objc_enumerationMutation(v25);
                v29 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
                v30 = *(void **)(*(_QWORD *)&v47[8] + 40);
                objc_msgSend(v29, "filename");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "objectForKeyedSubscript:", v31);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "setSize:", objc_msgSend(v32, "integerValue"));

              }
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
            }
            while (v26);
          }

          _Block_object_dispose(v47, 8);
        }
        else
        {
          sgMailIntelligenceLogHandle();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
          {
            v34 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
            *(_DWORD *)v47 = 138412290;
            *(_QWORD *)&v47[4] = v34;
            _os_log_fault_impl(&dword_1C3607000, v33, OS_LOG_TYPE_FAULT, "Error accessing the searchable item associated with messageId: %@", v47, 0xCu);
          }

        }
        _Block_object_dispose(buf, 8);

      }
      v1 = *(_QWORD *)(a1 + 32);
    }
  }
  *(_BYTE *)(v1 + 56) = 1;
}

void __29__SGMIFeatureVector_feature___block_invoke_4(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[5];
  id v15;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__24308;
  v14[4] = __Block_byref_object_dispose__24309;
  v15 = 0;
  +[SGMIAttachmentSizeHistogram bucketsNames](SGMIAttachmentSizeHistogram, "bucketsNames");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __29__SGMIFeatureVector_feature___block_invoke_5;
  v10[3] = &unk_1E7DB10A0;
  v8 = v7;
  v11 = v8;
  v9 = v6;
  v12 = v9;
  v13 = v14;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

  _Block_object_dispose(v14, 8);
}

void __29__SGMIFeatureVector_feature___block_invoke_5(_QWORD *a1, void *a2, uint64_t a3)
{
  int v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  id v17;

  v17 = a2;
  v5 = objc_msgSend(v17, "intValue");
  if ((v5 - 5) < 5)
  {
    v12 = (void *)a1[4];
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    v14 = a1[5];
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "objectAtIndexedSubscript:", a3);
    v15 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v15;
    v16 = CFSTR("5to9");
LABEL_5:
    v10 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@-size%@-count%@"), v14, v15, v16);
    objc_msgSend(v12, "addObject:", v10);
    goto LABEL_6;
  }
  if ((v5 - 1) >= 4)
  {
    if (!v5)
      goto LABEL_7;
    v12 = (void *)a1[4];
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    v14 = a1[5];
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "objectAtIndexedSubscript:", a3);
    v15 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v15;
    v16 = CFSTR("10+");
    goto LABEL_5;
  }
  v6 = (void *)a1[4];
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8 = a1[5];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@-size%@-count%@"), v8, v9, v10);
  objc_msgSend(v6, "addObject:", v11);

LABEL_6:
LABEL_7:

}

id __29__SGMIFeatureVector_feature___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "emailAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __29__SGMIFeatureVector_feature___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "emailAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __29__SGMIFeatureVector_feature___block_invoke_32(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __29__SGMIFeatureVector_feature___block_invoke_35(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v7, "dataTransferByteCount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v7, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  }
}

@end
