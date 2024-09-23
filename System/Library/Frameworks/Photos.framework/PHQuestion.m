@implementation PHQuestion

- (PHQuestion)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8;
  PHQuestion *v9;
  uint64_t v10;
  NSString *entityIdentifier;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  NSDictionary *additionalInfo;
  uint64_t v20;
  NSDate *creationDate;
  void *v22;
  objc_super v24;

  v8 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PHQuestion;
  v9 = -[PHObject initWithFetchDictionary:propertyHint:photoLibrary:](&v24, sel_initWithFetchDictionary_propertyHint_photoLibrary_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("entityIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    entityIdentifier = v9->_entityIdentifier;
    v9->_entityIdentifier = (NSString *)v10;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_type = objc_msgSend(v12, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("state"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_state = objc_msgSend(v13, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("entityType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_entityType = objc_msgSend(v14, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("displayType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_displayType = objc_msgSend(v15, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("score"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v9->_score = v17;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("additionalInfo"));
    v18 = objc_claimAutoreleasedReturnValue();
    additionalInfo = v9->_additionalInfo;
    v9->_additionalInfo = (NSDictionary *)v18;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("creationDate"));
    v20 = objc_claimAutoreleasedReturnValue();
    creationDate = v9->_creationDate;
    v9->_creationDate = (NSDate *)v20;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("questionVersion"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_questionVersion = objc_msgSend(v22, "shortValue");

  }
  return v9;
}

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PHQuestion;
  -[PHObject description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, entityIdentifier: %@ type: %hu, state: %hu, entityType: %hu, displayType: %hu, score: %f,\nadditionalInfo: %@\ncreationDate: %@"), v4, self->_entityIdentifier, self->_type, self->_state, self->_entityType, self->_displayType, *(_QWORD *)&self->_score, self->_additionalInfo, self->_creationDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)entityIdentifier
{
  return self->_entityIdentifier;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)state
{
  return self->_state;
}

- (unsigned)entityType
{
  return self->_entityType;
}

- (unsigned)displayType
{
  return self->_displayType;
}

- (double)score
{
  return self->_score;
}

- (NSDictionary)additionalInfo
{
  return self->_additionalInfo;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (signed)questionVersion
{
  return self->_questionVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  pl_dispatch_once();
  return (id)propertiesToFetchWithHint__pl_once_object_15_44236;
}

+ (id)managedEntityName
{
  return CFSTR("Question");
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHQuestion");
  return CFSTR("PHQuestion");
}

+ (id)identifierCode
{
  return CFSTR("200");
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  return (id)entityKeyMap_pl_once_object_16_44225;
}

+ (id)fetchAnsweredQuestionCountsWithOptions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(a1, "fetchAnsweredQuestionsWithOptions:validQuestionsOnly:", v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        +[PHQuestion stringForQuestionType:](PHQuestion, "stringForQuestionType:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "type"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "objectForKeyedSubscript:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "numberWithInt:", objc_msgSend(v14, "intValue") + 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v11);

        }
        else
        {
          objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E3656728, v11);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)fetchQuestionsWithOptions:(id)a3 validQuestionsOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a4;
  v6 = a3;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v6, &__block_literal_global_54);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v6, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "questionsWithValidEntitiesFromQuestions:photoLibrary:", v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }

  return v7;
}

+ (id)fetchQuestionsWithLocalIdentifiers:(id)a3 options:(id)a4 validQuestionsOnly:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__PHQuestion_fetchQuestionsWithLocalIdentifiers_options_validQuestionsOnly___block_invoke;
  v15[3] = &unk_1E35DFCC0;
  v16 = v8;
  v10 = v8;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v9, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v9, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "questionsWithValidEntitiesFromQuestions:photoLibrary:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v13;
  }

  return v11;
}

+ (id)fetchAnsweredYesOrNoQuestionsWithOptions:(id)a3 validQuestionsOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a4;
  v6 = a3;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v6, &__block_literal_global_56);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v6, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "questionsWithValidEntitiesFromQuestions:photoLibrary:", v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }

  return v7;
}

+ (id)fetchAnsweredQuestionsWithOptions:(id)a3 validQuestionsOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a4;
  v6 = a3;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v6, &__block_literal_global_57);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v6, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "questionsWithValidEntitiesFromQuestions:photoLibrary:", v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }

  return v7;
}

+ (id)fetchUnansweredQuestionsWithOptions:(id)a3 validQuestionsOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a4;
  v6 = a3;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v6, &__block_literal_global_58_44219);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v6, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "questionsWithValidEntitiesFromQuestions:photoLibrary:", v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }

  return v7;
}

+ (id)fetchInvalidatedQuestionsWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a3, &__block_literal_global_59_44217);
}

+ (id)questionsWithValidEntitiesFromQuestions:(id)a3 photoLibrary:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
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
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  char *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t k;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t m;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  BOOL v81;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t n;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t ii;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t jj;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t kk;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  id v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t mm;
  void *v134;
  void *v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t nn;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  id v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t i1;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  id v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t i2;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  id v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t i3;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  id v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t i4;
  void *v180;
  void *v181;
  PHManualFetchResult *v182;
  void *v183;
  void *v184;
  void *v185;
  PHManualFetchResult *v186;
  PHManualFetchResult *v187;
  void *v189;
  id v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  id v195;
  void *v196;
  uint64_t v197;
  id obj;
  uint64_t v199;
  void *v200;
  uint64_t v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  char *v207;
  id v208;
  id v209;
  id v210;
  void *v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  id v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  _BYTE v277[128];
  const __CFString *v278;
  _BYTE v279[128];
  _BYTE v280[128];
  _BYTE v281[128];
  _BYTE v282[128];
  _BYTE v283[128];
  const __CFString *v284;
  _BYTE v285[128];
  _BYTE v286[128];
  _BYTE v287[13];
  const __CFString *v288;
  uint8_t v289[128];
  uint8_t buf[4];
  void *v291;
  _BYTE v292[128];
  _QWORD v293[3];
  _BYTE v294[128];
  _BYTE v295[128];
  _BYTE v296[128];
  _BYTE v297[128];
  const __CFString *v298;
  _BYTE v299[128];
  uint64_t v300;

  v300 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v190 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v197 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v273 = 0u;
  v274 = 0u;
  v275 = 0u;
  v276 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v273, v299, 16);
  v194 = v6;
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v274;
LABEL_3:
    v10 = 0;
    while (2)
    {
      if (*(_QWORD *)v274 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v273 + 1) + 8 * v10);
      objc_msgSend(v11, "entityIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      switch(objc_msgSend(v11, "entityType"))
      {
        case 0u:
          if (objc_msgSend(v11, "type") != 18)
          {
            +[PHObject localIdentifierWithUUID:](PHAsset, "localIdentifierWithUUID:", v12);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v204;
            goto LABEL_25;
          }
          objc_msgSend(v196, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v196, "objectForKeyedSubscript:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v11);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v11);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v196, "setObject:forKeyedSubscript:", v14, v12);
          }
          goto LABEL_32;
        case 1u:
          +[PHObject localIdentifierWithUUID:](PHPerson, "localIdentifierWithUUID:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)v197;
LABEL_25:
          objc_msgSend(v17, "objectForKeyedSubscript:", v16);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            objc_msgSend(v17, "objectForKeyedSubscript:", v16);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v11);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v11);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v25, v16);
          }

          v6 = v194;
          goto LABEL_33;
        case 2u:
          +[PHObject localIdentifierWithUUID:](PHMemory, "localIdentifierWithUUID:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            v19 = v6;
            goto LABEL_22;
          }
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v11);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v6;
          goto LABEL_30;
        case 3u:
          +[PHObject localIdentifierWithUUID:](PHAsset, "localIdentifierWithUUID:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v193;
          goto LABEL_20;
        case 4u:
          v15 = v211;
          goto LABEL_16;
        case 5u:
          v15 = v192;
LABEL_16:
          objc_msgSend(v15, "addObject:", v11);
          goto LABEL_33;
        case 6u:
          +[PHObject localIdentifierWithUUID:](PHAssetCollection, "localIdentifierWithUUID:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v206;
          goto LABEL_20;
        case 7u:
          +[PHObject localIdentifierWithUUID:](PHMoment, "localIdentifierWithUUID:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v205;
          goto LABEL_20;
        case 8u:
          +[PHObject localIdentifierWithUUID:](PHAsset, "localIdentifierWithUUID:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v191;
LABEL_20:
          objc_msgSend(v20, "objectForKeyedSubscript:", v14);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            v19 = v20;
LABEL_22:
            objc_msgSend(v19, "objectForKeyedSubscript:", v14);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObject:", v11);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v11);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v20;
LABEL_30:
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v14);
          }

LABEL_32:
LABEL_33:

          if (v8 != ++v10)
            continue;
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v273, v299, 16);
          v8 = v26;
          if (!v26)
            goto LABEL_37;
          goto LABEL_3;
        default:
          goto LABEL_33;
      }
    }
  }
LABEL_37:

  v27 = objc_msgSend(v204, "count");
  v28 = v190;
  v29 = v196;
  if (v27)
  {
    objc_msgSend(v190, "librarySpecificFetchOptions");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v298 = CFSTR("PHAssetPropertySetIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v298, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFetchPropertySets:", v31);

    objc_msgSend(v204, "allKeys");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v189 = v30;
    +[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", v32, v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v269 = 0u;
    v270 = 0u;
    v271 = 0u;
    v272 = 0u;
    v195 = v33;
    v201 = objc_msgSend(v195, "countByEnumeratingWithState:objects:count:", &v269, v297, 16);
    if (v201)
    {
      v199 = *(_QWORD *)v270;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v270 != v199)
            objc_enumerationMutation(v195);
          v207 = v36;
          objc_msgSend(*(id *)(*((_QWORD *)&v269 + 1) + 8 * (_QWORD)v36), "localIdentifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v204, "objectForKeyedSubscript:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          v268 = 0u;
          v267 = 0u;
          v265 = 0u;
          v266 = 0u;
          v39 = v38;
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v265, v296, 16);
          if (v40)
          {
            v41 = v40;
            v42 = *(_QWORD *)v266;
            do
            {
              for (i = 0; i != v41; ++i)
              {
                if (*(_QWORD *)v266 != v42)
                  objc_enumerationMutation(v39);
                v44 = *(void **)(*((_QWORD *)&v265 + 1) + 8 * i);
                if (objc_msgSend(v44, "type") == 29)
                {
                  objc_msgSend(v44, "additionalInfo");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("momentLocalIdentifiers"));
                  v46 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v46, "allObjects");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "addObjectsFromArray:", v47);

                  objc_msgSend(v35, "addObject:", v44);
                }
                else
                {
                  objc_msgSend(v211, "addObject:", v44);
                }
              }
              v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v265, v296, 16);
            }
            while (v41);
          }

          v36 = v207 + 1;
        }
        while (v207 + 1 != (char *)v201);
        v201 = objc_msgSend(v195, "countByEnumeratingWithState:objects:count:", &v269, v297, 16);
      }
      while (v201);
    }

    if (objc_msgSend(v34, "count"))
    {
      objc_msgSend(v190, "librarySpecificFetchOptions");
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:options:](PHMoment, "fetchAssetCollectionsWithLocalIdentifiers:options:", v34);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v261 = 0u;
      v262 = 0u;
      v263 = 0u;
      v264 = 0u;
      v50 = v48;
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v261, v295, 16);
      if (v51)
      {
        v52 = v51;
        v53 = *(_QWORD *)v262;
        do
        {
          for (j = 0; j != v52; ++j)
          {
            if (*(_QWORD *)v262 != v53)
              objc_enumerationMutation(v50);
            objc_msgSend(*(id *)(*((_QWORD *)&v261 + 1) + 8 * j), "localIdentifier");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "addObject:", v55);

          }
          v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v261, v295, 16);
        }
        while (v52);
      }
      v200 = v50;

      v259 = 0u;
      v260 = 0u;
      v257 = 0u;
      v258 = 0u;
      v208 = v35;
      v56 = objc_msgSend(v208, "countByEnumeratingWithState:objects:count:", &v257, v294, 16);
      if (v56)
      {
        v57 = v56;
        v58 = *(_QWORD *)v258;
        do
        {
          for (k = 0; k != v57; ++k)
          {
            if (*(_QWORD *)v258 != v58)
              objc_enumerationMutation(v208);
            v60 = *(void **)(*((_QWORD *)&v257 + 1) + 8 * k);
            objc_msgSend(v60, "additionalInfo");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("momentLocalIdentifiers"));
            v62 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v62, "isSubsetOfSet:", v49))
              objc_msgSend(v211, "addObject:", v60);

          }
          v57 = objc_msgSend(v208, "countByEnumeratingWithState:objects:count:", &v257, v294, 16);
        }
        while (v57);
      }

    }
    v28 = v190;
    v29 = v196;
    v6 = v194;
  }
  v63 = (void *)v197;
  if (objc_msgSend(v29, "count"))
  {
    v256 = 0;
    +[PHPhotoLibrary openPhotoLibraryWithWellKnownIdentifier:error:](PHPhotoLibrary, "openPhotoLibraryWithWellKnownIdentifier:error:", 3, &v256);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v256;
    v66 = v65;
    if (v64)
    {
      v209 = v65;
      objc_msgSend(v64, "librarySpecificFetchOptions");
      v67 = objc_claimAutoreleasedReturnValue();
      v293[0] = CFSTR("PHAssetPropertySetSceneAnalysis");
      v293[1] = CFSTR("PHAssetPropertySetMediaAnalysis");
      v293[2] = CFSTR("PHAssetPropertySetCuration");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v293, 3);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setFetchPropertySets:](v67, "setFetchPropertySets:", v68);

      -[NSObject setIncludeGuestAssets:](v67, "setIncludeGuestAssets:", 1);
      objc_msgSend(v196, "allKeys");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHAsset fetchAssetsWithSyndicationIdentifiers:options:](PHAsset, "fetchAssetsWithSyndicationIdentifiers:options:", v69, v67);
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      v254 = 0u;
      v255 = 0u;
      v252 = 0u;
      v253 = 0u;
      v71 = v70;
      v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v252, v292, 16);
      if (v72)
      {
        v73 = v72;
        v74 = *(_QWORD *)v253;
        do
        {
          for (m = 0; m != v73; ++m)
          {
            if (*(_QWORD *)v253 != v74)
              objc_enumerationMutation(v71);
            v76 = *(void **)(*((_QWORD *)&v252 + 1) + 8 * m);
            objc_msgSend(v76, "curationProperties");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "syndicationIdentifier");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v196, "objectForKeyedSubscript:", v78);
            v79 = (void *)objc_claimAutoreleasedReturnValue();

            v80 = objc_msgSend(v76, "syndicationEligibility");
            if (objc_msgSend(v79, "count"))
              v81 = v80 == -6;
            else
              v81 = 1;
            if (!v81 && v80 != -5)
              objc_msgSend(v211, "addObjectsFromArray:", v79);

            v63 = (void *)v197;
          }
          v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v252, v292, 16);
        }
        while (v73);
      }

      v28 = v190;
      v6 = v194;
      v66 = v209;
    }
    else
    {
      PLBackendGetLog();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v291 = v66;
        _os_log_impl(&dword_1991EC000, v67, OS_LOG_TYPE_ERROR, "PHQuestion: Failed to open syndicated library: %@", buf, 0xCu);
      }
    }

  }
  if (objc_msgSend(v63, "count"))
  {
    objc_msgSend(v28, "librarySpecificFetchOptions");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setIncludedDetectionTypes:", &unk_1E36576D8);
    objc_msgSend(v63, "allKeys");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHPerson fetchPersonsWithLocalIdentifiers:options:](PHPerson, "fetchPersonsWithLocalIdentifiers:options:", v84, v83);
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    v250 = 0u;
    v251 = 0u;
    v248 = 0u;
    v249 = 0u;
    v86 = v85;
    v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v248, v289, 16);
    if (v87)
    {
      v88 = v87;
      v89 = *(_QWORD *)v249;
      do
      {
        for (n = 0; n != v88; ++n)
        {
          if (*(_QWORD *)v249 != v89)
            objc_enumerationMutation(v86);
          objc_msgSend(*(id *)(*((_QWORD *)&v248 + 1) + 8 * n), "localIdentifier");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "objectForKeyedSubscript:", v91);
          v92 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v92, "count"))
            objc_msgSend(v211, "addObjectsFromArray:", v92);

        }
        v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v248, v289, 16);
      }
      while (v88);
    }

    v28 = v190;
  }
  if (objc_msgSend(v192, "count"))
  {
    objc_msgSend(v28, "librarySpecificFetchOptions");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setPersonContext:", 1);
    v288 = CFSTR("PHPersonPropertySetIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v288, 1);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setFetchPropertySets:", v94);

    v210 = v93;
    +[PHPerson fetchPersonsWithOptions:](PHPerson, "fetchPersonsWithOptions:", v93);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v244 = 0u;
    v245 = 0u;
    v246 = 0u;
    v247 = 0u;
    v97 = v95;
    v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v244, v287, 16);
    if (v98)
    {
      v99 = v98;
      v100 = *(_QWORD *)v245;
      do
      {
        for (ii = 0; ii != v99; ++ii)
        {
          if (*(_QWORD *)v245 != v100)
            objc_enumerationMutation(v97);
          v102 = *(void **)(*((_QWORD *)&v244 + 1) + 8 * ii);
          objc_msgSend(v102, "uuid");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = objc_msgSend(v103, "length");

          if (v104)
          {
            objc_msgSend(v102, "uuid");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "addObject:", v105);

          }
        }
        v99 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v244, v287, 16);
      }
      while (v99);
    }
    v203 = v97;

    v242 = 0u;
    v243 = 0u;
    v240 = 0u;
    v241 = 0u;
    v106 = v192;
    v107 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v240, v286, 16);
    if (v107)
    {
      v108 = v107;
      v109 = *(_QWORD *)v241;
      do
      {
        for (jj = 0; jj != v108; ++jj)
        {
          if (*(_QWORD *)v241 != v109)
            objc_enumerationMutation(v106);
          v111 = *(void **)(*((_QWORD *)&v240 + 1) + 8 * jj);
          objc_msgSend(v111, "additionalInfo");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("personUUIDs"));
          v113 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v113);
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "intersectSet:", v96);
          v115 = objc_msgSend(v114, "count");
          if (v115 == objc_msgSend(v113, "count"))
            objc_msgSend(v211, "addObject:", v111);

        }
        v108 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v240, v286, 16);
      }
      while (v108);
    }

    v63 = (void *)v197;
    v28 = v190;
    v6 = v194;
  }
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v28, "librarySpecificFetchOptions");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAssetCollection fetchAssetCollectionsWithType:localIdentifiers:options:](PHAssetCollection, "fetchAssetCollectionsWithType:localIdentifiers:options:", 4, v117, v116);
    v118 = (void *)objc_claimAutoreleasedReturnValue();

    v238 = 0u;
    v239 = 0u;
    v236 = 0u;
    v237 = 0u;
    v119 = v118;
    v120 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v236, v285, 16);
    if (v120)
    {
      v121 = v120;
      v122 = *(_QWORD *)v237;
      do
      {
        for (kk = 0; kk != v121; ++kk)
        {
          if (*(_QWORD *)v237 != v122)
            objc_enumerationMutation(v119);
          objc_msgSend(*(id *)(*((_QWORD *)&v236 + 1) + 8 * kk), "localIdentifier");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", v124);
          v125 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v125, "count"))
            objc_msgSend(v211, "addObjectsFromArray:", v125);

        }
        v121 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v236, v285, 16);
      }
      while (v121);
    }

    v28 = v190;
  }
  if (objc_msgSend(v193, "count"))
  {
    objc_msgSend(v28, "librarySpecificFetchOptions");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v284 = CFSTR("PHAssetPropertySetIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v284, 1);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "setFetchPropertySets:", v127);

    v128 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v193, "count"));
    v232 = 0u;
    v233 = 0u;
    v234 = 0u;
    v235 = 0u;
    v129 = v193;
    v130 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v232, v283, 16);
    if (v130)
    {
      v131 = v130;
      v132 = *(_QWORD *)v233;
      do
      {
        for (mm = 0; mm != v131; ++mm)
        {
          if (*(_QWORD *)v233 != v132)
            objc_enumerationMutation(v129);
          +[PHObject uuidFromLocalIdentifier:](PHAsset, "uuidFromLocalIdentifier:", *(_QWORD *)(*((_QWORD *)&v232 + 1) + 8 * mm));
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          if (v134)
            objc_msgSend(v128, "addObject:", v134);

        }
        v131 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v232, v283, 16);
      }
      while (v131);
    }

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("highlightBeingAssets.type = %d && uuid in %@"), 5, v128);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "setInternalPredicate:", v135);

    +[PHAsset fetchAssetsWithOptions:](PHAsset, "fetchAssetsWithOptions:", v126);
    v228 = 0u;
    v229 = 0u;
    v230 = 0u;
    v231 = 0u;
    v136 = (id)objc_claimAutoreleasedReturnValue();
    v137 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v228, v282, 16);
    if (v137)
    {
      v138 = v137;
      v139 = *(_QWORD *)v229;
      do
      {
        for (nn = 0; nn != v138; ++nn)
        {
          if (*(_QWORD *)v229 != v139)
            objc_enumerationMutation(v136);
          objc_msgSend(*(id *)(*((_QWORD *)&v228 + 1) + 8 * nn), "localIdentifier");
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "objectForKeyedSubscript:", v141);
          v142 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v142, "count"))
            objc_msgSend(v211, "addObjectsFromArray:", v142);

        }
        v138 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v228, v282, 16);
      }
      while (v138);
    }

    v63 = (void *)v197;
    v6 = v194;
  }
  if (objc_msgSend(v206, "count"))
  {
    objc_msgSend(v190, "librarySpecificFetchOptions");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v206, "allKeys");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:options:](PHAssetCollection, "fetchAssetCollectionsWithLocalIdentifiers:options:", v144, v143);
    v145 = (void *)objc_claimAutoreleasedReturnValue();

    v226 = 0u;
    v227 = 0u;
    v224 = 0u;
    v225 = 0u;
    v146 = v145;
    v147 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v224, v281, 16);
    if (v147)
    {
      v148 = v147;
      v149 = *(_QWORD *)v225;
      do
      {
        for (i1 = 0; i1 != v148; ++i1)
        {
          if (*(_QWORD *)v225 != v149)
            objc_enumerationMutation(v146);
          v151 = *(void **)(*((_QWORD *)&v224 + 1) + 8 * i1);
          objc_msgSend(v151, "localIdentifier");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v206, "objectForKeyedSubscript:", v152);
          v153 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v151, "approximateCount") && objc_msgSend(v153, "count"))
            objc_msgSend(v211, "addObjectsFromArray:", v153);

        }
        v148 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v224, v281, 16);
      }
      while (v148);
    }

    v63 = (void *)v197;
  }
  if (objc_msgSend(v205, "count"))
  {
    objc_msgSend(v190, "librarySpecificFetchOptions");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v205, "allKeys");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:options:](PHMoment, "fetchAssetCollectionsWithLocalIdentifiers:options:", v155, v154);
    v156 = (void *)objc_claimAutoreleasedReturnValue();

    v222 = 0u;
    v223 = 0u;
    v220 = 0u;
    v221 = 0u;
    v157 = v156;
    v158 = objc_msgSend(v157, "countByEnumeratingWithState:objects:count:", &v220, v280, 16);
    if (v158)
    {
      v159 = v158;
      v160 = *(_QWORD *)v221;
      do
      {
        for (i2 = 0; i2 != v159; ++i2)
        {
          if (*(_QWORD *)v221 != v160)
            objc_enumerationMutation(v157);
          objc_msgSend(*(id *)(*((_QWORD *)&v220 + 1) + 8 * i2), "localIdentifier");
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v205, "objectForKeyedSubscript:", v162);
          v163 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v163, "count"))
            objc_msgSend(v211, "addObjectsFromArray:", v163);

        }
        v159 = objc_msgSend(v157, "countByEnumeratingWithState:objects:count:", &v220, v280, 16);
      }
      while (v159);
    }

  }
  v164 = v191;
  if (objc_msgSend(v191, "count"))
  {
    v165 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v191, "count"));
    v216 = 0u;
    v217 = 0u;
    v218 = 0u;
    v219 = 0u;
    v166 = v191;
    v167 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v216, v279, 16);
    if (v167)
    {
      v168 = v167;
      v169 = *(_QWORD *)v217;
      do
      {
        for (i3 = 0; i3 != v168; ++i3)
        {
          if (*(_QWORD *)v217 != v169)
            objc_enumerationMutation(v166);
          +[PHObject uuidFromLocalIdentifier:](PHAsset, "uuidFromLocalIdentifier:", *(_QWORD *)(*((_QWORD *)&v216 + 1) + 8 * i3));
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          if (v171)
            objc_msgSend(v165, "addObject:", v171);

        }
        v168 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v216, v279, 16);
      }
      while (v168);
    }

    objc_msgSend(v190, "librarySpecificFetchOptions");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    v278 = CFSTR("PHAssetPropertySetIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v278, 1);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "setFetchPropertySets:", v173);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("highlightBeingAssets.kind = %d && uuid in %@"), 0, v165);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "setInternalPredicate:", v174);

    +[PHAsset fetchAssetsWithOptions:](PHAsset, "fetchAssetsWithOptions:", v172);
    v212 = 0u;
    v213 = 0u;
    v214 = 0u;
    v215 = 0u;
    v175 = (id)objc_claimAutoreleasedReturnValue();
    v176 = objc_msgSend(v175, "countByEnumeratingWithState:objects:count:", &v212, v277, 16);
    if (v176)
    {
      v177 = v176;
      v178 = *(_QWORD *)v213;
      do
      {
        for (i4 = 0; i4 != v177; ++i4)
        {
          if (*(_QWORD *)v213 != v178)
            objc_enumerationMutation(v175);
          objc_msgSend(*(id *)(*((_QWORD *)&v212 + 1) + 8 * i4), "localIdentifier");
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v166, "objectForKeyedSubscript:", v180);
          v181 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v181, "count"))
            objc_msgSend(v211, "addObjectsFromArray:", v181);

        }
        v177 = objc_msgSend(v175, "countByEnumeratingWithState:objects:count:", &v212, v277, 16);
      }
      while (v177);
    }

    v63 = (void *)v197;
    v164 = v191;
  }
  v182 = [PHManualFetchResult alloc];
  objc_msgSend(obj, "photoLibrary");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "fetchType");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "fetchPropertySets");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v186 = -[PHManualFetchResult initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:](v182, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v211, v183, v184, v185, 0, 0);

  v187 = v186;
  return v187;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PHQuestion_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_44189 != -1)
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_44189, block);
  if (objc_msgSend((id)transformValueExpression_forKeyPath___passThroughSet_44190, "containsObject:", v7))
    v8 = v6;
  else
    v8 = 0;

  return v8;
}

+ (id)stringForQuestionType:(unsigned __int16)a3
{
  if ((a3 - 1) > 0x1D)
    return CFSTR("PHQuestionTypeNone");
  else
    return *(&off_1E35DFD68 + (unsigned __int16)(a3 - 1));
}

void __50__PHQuestion_transformValueExpression_forKeyPath___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[10];

  v4[9] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("entityIdentifier");
  v4[1] = CFSTR("type");
  v4[2] = CFSTR("state");
  v4[3] = CFSTR("entityType");
  v4[4] = CFSTR("displayType");
  v4[5] = CFSTR("score");
  v4[6] = CFSTR("additionalInfo");
  v4[7] = CFSTR("creationDate");
  v4[8] = CFSTR("questionVersion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 9);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_44190;
  transformValueExpression_forKeyPath___passThroughSet_44190 = v2;

}

id __51__PHQuestion_fetchInvalidatedQuestionsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForQuestionsWithState:options:](PHQuery, "queryForQuestionsWithState:options:", 4, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __69__PHQuestion_fetchUnansweredQuestionsWithOptions_validQuestionsOnly___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForQuestionsWithState:options:](PHQuery, "queryForQuestionsWithState:options:", 0, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __67__PHQuestion_fetchAnsweredQuestionsWithOptions_validQuestionsOnly___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForAnsweredQuestionsWithOptions:](PHQuery, "queryForAnsweredQuestionsWithOptions:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __74__PHQuestion_fetchAnsweredYesOrNoQuestionsWithOptions_validQuestionsOnly___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForAnsweredYesOrNoQuestionsWithOptions:](PHQuery, "queryForAnsweredYesOrNoQuestionsWithOptions:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __76__PHQuestion_fetchQuestionsWithLocalIdentifiers_options_validQuestionsOnly___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForQuestionsWithLocalIdentifiers:options:](PHQuery, "queryForQuestionsWithLocalIdentifiers:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __59__PHQuestion_fetchQuestionsWithOptions_validQuestionsOnly___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForQuestionsWithOptions:](PHQuery, "queryForQuestionsWithOptions:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __26__PHQuestion_entityKeyMap__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  PHEntityKeyMap *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  _QWORD v24[10];
  _QWORD v25[12];

  v25[10] = *MEMORY[0x1E0C80C00];
  v12 = [PHEntityKeyMap alloc];
  v23 = CFSTR("uuid");
  v24[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v13;
  v24[1] = CFSTR("entityIdentifier");
  v22 = CFSTR("entityIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v0;
  v24[2] = CFSTR("type");
  v21 = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v1;
  v24[3] = CFSTR("state");
  v20 = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v2;
  v24[4] = CFSTR("entityType");
  v19 = CFSTR("entityType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v3;
  v24[5] = CFSTR("displayType");
  v18 = CFSTR("displayType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v4;
  v24[6] = CFSTR("score");
  v17 = CFSTR("score");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v5;
  v24[7] = CFSTR("additionalInfo");
  v16 = CFSTR("additionalInfo");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v6;
  v24[8] = CFSTR("creationDate");
  v15 = CFSTR("creationDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v7;
  v24[9] = CFSTR("questionVersion");
  v14 = CFSTR("questionVersion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[9] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PHEntityKeyMap initWithPropertyKeysByEntityKey:](v12, "initWithPropertyKeysByEntityKey:", v9);
  v11 = (void *)entityKeyMap_pl_once_object_16_44225;
  entityKeyMap_pl_once_object_16_44225 = v10;

}

void __40__PHQuestion_propertiesToFetchWithHint___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[12];

  v4[11] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D718A8], "objectIDDescription");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  v4[1] = CFSTR("uuid");
  v4[2] = CFSTR("entityIdentifier");
  v4[3] = CFSTR("type");
  v4[4] = CFSTR("state");
  v4[5] = CFSTR("entityType");
  v4[6] = CFSTR("displayType");
  v4[7] = CFSTR("score");
  v4[8] = CFSTR("additionalInfo");
  v4[9] = CFSTR("creationDate");
  v4[10] = CFSTR("questionVersion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 11);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)propertiesToFetchWithHint__pl_once_object_15_44236;
  propertiesToFetchWithHint__pl_once_object_15_44236 = v2;

}

@end
