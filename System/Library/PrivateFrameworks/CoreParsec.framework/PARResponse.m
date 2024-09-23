@implementation PARResponse

- (PARResponse)initWithReply:(id)a3 factory:(id)a4 responseData:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  PARResponse *result;

  v7 = a3;
  swift_unknownObjectRetain();
  v8 = a5;
  v9 = sub_19A8C3E40();
  v11 = v10;

  PARResponse.init(reply:factory:responseData:)(v7, (uint64_t)a4, v9, v11);
  return result;
}

- (PARResponse)initWithReply:(id)a3
{
  id v5;
  PARResponse *v6;
  PARResponse *v7;
  uint64_t v8;
  NSArray *rawResponse;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PARResponse;
  v6 = -[PARResponse init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_reply, a3);
    objc_msgSend(v5, "rawResponse");
    v8 = objc_claimAutoreleasedReturnValue();
    rawResponse = v7->_rawResponse;
    v7->_rawResponse = (NSArray *)v8;

  }
  return v7;
}

- (PARReply)reply
{
  return self->_reply;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_prefix, a3);
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (NSArray)rawResponse
{
  return self->_rawResponse;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (NSArray)alternativeResults
{
  return self->_alternativeResults;
}

- (NSDictionary)rawSqf
{
  return self->_rawSqf;
}

- (void)setRawSqf:(id)a3
{
  objc_storeStrong((id *)&self->_rawSqf, a3);
}

- (NSDictionary)serverFeatures
{
  return self->_serverFeatures;
}

- (void)setServerFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_serverFeatures, a3);
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_suggestions, a3);
}

- (NSArray)corrections
{
  return self->_corrections;
}

- (void)setCorrections:(id)a3
{
  objc_storeStrong((id *)&self->_corrections, a3);
}

- (GEOUserSessionEntity)geoUserSessionEntity
{
  return self->_geoUserSessionEntity;
}

- (void)setGeoUserSessionEntity:(id)a3
{
  objc_storeStrong((id *)&self->_geoUserSessionEntity, a3);
}

- (BOOL)suggestionsAreBlended
{
  return self->_suggestionsAreBlended;
}

- (void)setSuggestionsAreBlended:(BOOL)a3
{
  self->_suggestionsAreBlended = a3;
}

- (SFEngagementSignal)engagementSignal
{
  return self->_engagementSignal;
}

- (NSData)legacyJSON
{
  return self->_legacyJSON;
}

- (void)setLegacyJSON:(id)a3
{
  objc_storeStrong((id *)&self->_legacyJSON, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyJSON, 0);
  objc_storeStrong((id *)&self->_engagementSignal, 0);
  objc_storeStrong((id *)&self->_geoUserSessionEntity, 0);
  objc_storeStrong((id *)&self->_corrections, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_serverFeatures, 0);
  objc_storeStrong((id *)&self->_rawSqf, 0);
  objc_storeStrong((id *)&self->_alternativeResults, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_rawResponse, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_reply, 0);
}

+ (id)responseFromData:(id)a3 session:(id)a4 request:(id)a5
{
  id v7;
  id v8;
  id v9;
  PARReply *v10;
  PARTask *v11;
  void *v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(PARReply);
  -[PARReply setData:](v10, "setData:", v9);

  v11 = objc_alloc_init(PARTask);
  -[PARTask setSession:](v11, "setSession:", v8);

  -[PARTask setRequest:](v11, "setRequest:", v7);
  -[PARReply setTask:](v10, "setTask:", v11);
  +[PARResponse responseFromReply:](PARResponse, "responseFromReply:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)responseFromJSON:(id)a3 session:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a3, 0, 0);
    a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "responseFromData:session:request:", a3, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)responseFromReply:(id)a3
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PARDefaultFactory *v12;
  PARResponse *v13;
  void *v14;
  uint64_t v15;
  NSString *prefix;
  uint64_t v17;
  NSString *query;
  uint64_t v19;
  SFEngagementSignal *engagementSignal;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  NSObject *v34;
  NSDictionary *v35;
  uint64_t v36;
  NSDictionary *rawSqf;
  uint64_t v38;
  NSDictionary *serverFeatures;
  id v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSArray *corrections;
  void *v54;
  void *v55;
  void *v56;
  NSArray *v57;
  PARResponse *v58;
  uint64_t v59;
  NSArray *results;
  void *v61;
  NSObject *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  NSArray *sections;
  NSArray *v69;
  PARResponse *v70;
  PARResponse *v71;
  NSString *v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *context;
  id obj;
  void *v92;
  PARDefaultFactory *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  id v99;
  _QWORD v100[4];
  id v101;
  PARDefaultFactory *v102;
  id v103;
  void *v104;
  id v105;
  id v106;
  NSArray *v107;
  PARResponse *v108;
  uint64_t v109;
  uint64_t v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _QWORD v115[4];
  id v116;
  _QWORD v117[6];
  id v118;
  _BYTE buf[24];
  uint64_t (*v120)(uint64_t, uint64_t);
  _BYTE v121[20];
  _BYTE v122[128];
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v97 = a3;
  objc_msgSend(v97, "task");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "request");
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v96, "scale");
  if (v4 > 0.0)
  {
    objc_msgSend(v97, "scale");
    if (v5 == 0.0)
    {
      objc_msgSend(v96, "scale");
      objc_msgSend(v97, "setScale:");
    }
  }
  objc_msgSend(v97, "scale");
  v7 = v6;
  v89 = objc_msgSend(v96, "queryId");
  objc_msgSend(v97, "task");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "session");
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  context = (void *)MEMORY[0x19AECC7EC]();
  objc_msgSend(v95, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "factory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = objc_alloc_init(PARDefaultFactory);
  v93 = v12;

  v13 = -[PARResponse initWithReply:]([PARResponse alloc], "initWithReply:", v97);
  -[PARResponse rawResponse](v13, "rawResponse");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = v14;
  if (v14)
  {
    objc_msgSend(v14, "parsec_stringForKey:", CFSTR("prefix"));
    v15 = objc_claimAutoreleasedReturnValue();
    prefix = v13->_prefix;
    v13->_prefix = (NSString *)v15;

    objc_msgSend(v99, "parsec_stringForKey:", CFSTR("query"));
    v17 = objc_claimAutoreleasedReturnValue();
    query = v13->_query;
    v13->_query = (NSString *)v17;

    objc_msgSend(v99, "parsec_dictionaryForKey:", CFSTR("engagement_scores"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "parsec_numberForKey:", CFSTR("version"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "parsec_numberForKey:", CFSTR("serverScore"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "parsec_numberForKey:", CFSTR("serverScoreConfidence"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "parsec_numberForKey:", CFSTR("localScore"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "parsec_numberForKey:", CFSTR("localScoreConfidence"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "parsec_arrayForKey:", CFSTR("domainEngagementScores"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "parsec_mapObjectsUsingBlock:", &__block_literal_global_2082);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0D8C380]), "initWithVersion:serverScore:severScoreConfidence:localScore:localScoreConfidence:domainScores:", v86, v83, v85, v82, v84, v87);
    engagementSignal = v13->_engagementSignal;
    v13->_engagementSignal = (SFEngagementSignal *)v19;

    objc_msgSend(v99, "parsec_stringForKey:", CFSTR("sqf"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "parsec_base64DecodedData");
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v77 = 0;
LABEL_32:
      objc_msgSend(v99, "parsec_dictionaryForKey:", CFSTR("l3b"));
      v38 = objc_claimAutoreleasedReturnValue();
      serverFeatures = v13->_serverFeatures;
      v13->_serverFeatures = (NSDictionary *)v38;

      objc_msgSend(v99, "parsec_arrayForKey:", CFSTR("suggestions"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v115[0] = MEMORY[0x1E0C809B0];
      v115[1] = 3221225472;
      v115[2] = __33__PARResponse_responseFromReply___block_invoke_2;
      v115[3] = &unk_1E3922950;
      v40 = v97;
      v116 = v40;
      objc_msgSend(v81, "parsec_mapObjectsUsingBlock:", v115);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = 0u;
      v114 = 0u;
      v111 = 0u;
      v112 = 0u;
      v43 = v41;
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v111, v122, 16);
      if (v44)
      {
        v45 = *(_QWORD *)v112;
        do
        {
          for (i = 0; i != v44; ++i)
          {
            if (*(_QWORD *)v112 != v45)
              objc_enumerationMutation(v43);
            v47 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * i);
            objc_msgSend(v47, "detailText");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "suggestion");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setObject:forKeyedSubscript:", v48, v49);

          }
          v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v111, v122, 16);
        }
        while (v44);
      }

      obj = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (objc_msgSend(v43, "count"))
      {
        objc_msgSend(v43, "firstObject");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obj, "insertObject:atIndex:", v50, 0);

        if ((unint64_t)objc_msgSend(v43, "count") >= 2)
        {
          objc_msgSend(v43, "subarrayWithRange:", 1, objc_msgSend(v43, "count") - 1);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obj, "addObjectsFromArray:", v51);

        }
      }
      objc_storeStrong((id *)&v13->_suggestions, obj);
      v13->_suggestionsAreBlended = objc_msgSend(v99, "parsec_BOOLForKey:", CFSTR("suggestions_are_blended"));
      objc_msgSend(v99, "parsec_arrayForKey:", CFSTR("corrections"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "parsec_mapObjectsUsingBlock:", &__block_literal_global_44);
      v52 = objc_claimAutoreleasedReturnValue();
      corrections = v13->_corrections;
      v13->_corrections = (NSArray *)v52;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "parsec_arrayForKey:", CFSTR("results"));
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v92, "count"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v100[0] = MEMORY[0x1E0C809B0];
      v100[1] = 3221225472;
      v100[2] = __33__PARResponse_responseFromReply___block_invoke_4;
      v100[3] = &unk_1E3922998;
      v101 = v40;
      v102 = v93;
      v109 = v89;
      v75 = v77;
      v103 = v75;
      v104 = v95;
      v110 = v7;
      v78 = v56;
      v105 = v78;
      v76 = v54;
      v106 = v76;
      v57 = v55;
      v107 = v57;
      v58 = v13;
      v108 = v58;
      objc_msgSend(v92, "parsec_mapObjectsUsingBlock:", v100);
      v59 = objc_claimAutoreleasedReturnValue();
      results = v58->_results;
      v58->_results = (NSArray *)v59;

      objc_storeStrong((id *)&v58->_alternativeResults, v56);
      if (PARLogHandleForCategory_onceToken_2084 != -1)
        dispatch_once(&PARLogHandleForCategory_onceToken_2084, &__block_literal_global_226);
      v61 = (void *)PARLogHandleForCategory_logHandles_2_2085;
      if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_2_2085, OS_LOG_TYPE_INFO))
      {
        v73 = v13->_prefix;
        v62 = v61;
        -[PARResponse suggestions](v58, "suggestions");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v74, "count");
        -[PARResponse results](v58, "results");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v64, "count");
        -[PARResponse alternativeResults](v58, "alternativeResults");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v66, "count");
        *(_DWORD *)buf = 134219011;
        *(_QWORD *)&buf[4] = v89;
        *(_WORD *)&buf[12] = 2117;
        *(_QWORD *)&buf[14] = v73;
        *(_WORD *)&buf[22] = 2048;
        v120 = (uint64_t (*)(uint64_t, uint64_t))v63;
        *(_WORD *)v121 = 2048;
        *(_QWORD *)&v121[2] = v65;
        *(_WORD *)&v121[10] = 2048;
        *(_QWORD *)&v121[12] = v67;
        _os_log_impl(&dword_19A825000, v62, OS_LOG_TYPE_INFO, "Response for qid:%llu[%{sensitive}@] processed with %lu suggestions, %lu results and %lu alternative results", buf, 0x34u);

      }
      sections = v58->_sections;
      v58->_sections = v57;
      v69 = v57;

      v70 = v108;
      v71 = v58;

      v14 = v99;
      goto LABEL_47;
    }
    v22 = v96;
    objc_msgSend(v22, "queryString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v79;
    v25 = v23;
    v26 = v25;
    if (v24)
    {
      if (v25)
      {
        v27 = v25;
        v118 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v24, 0, &v118);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v118;
        if (v29)
        {
          if (PARLogHandleForCategory_onceToken_2084 != -1)
            dispatch_once(&PARLogHandleForCategory_onceToken_2084, &__block_literal_global_226);
          v30 = PARLogHandleForCategory_logHandles_2_2085;
          if (!os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_2_2085, OS_LOG_TYPE_ERROR))
            goto LABEL_29;
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v29;
          v31 = "error decoding sqf: %@";
          v32 = v30;
          v33 = 12;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            v120 = __Block_byref_object_copy_;
            *(_QWORD *)v121 = __Block_byref_object_dispose_;
            *(_QWORD *)&v121[8] = 0;
            v117[0] = MEMORY[0x1E0C809B0];
            v117[1] = 3221225472;
            v117[2] = __decodeSqf_block_invoke;
            v117[3] = &unk_1E3922A00;
            v117[4] = v27;
            v117[5] = buf;
            objc_msgSend(v28, "enumerateObjectsUsingBlock:", v117);
            v35 = (NSDictionary *)*(id *)(*(_QWORD *)&buf[8] + 40);
            _Block_object_dispose(buf, 8);

LABEL_30:
            v26 = v27;
            goto LABEL_31;
          }
          if (PARLogHandleForCategory_onceToken_2084 != -1)
            dispatch_once(&PARLogHandleForCategory_onceToken_2084, &__block_literal_global_226);
          v36 = PARLogHandleForCategory_logHandles_2_2085;
          if (!os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_2_2085, OS_LOG_TYPE_ERROR))
          {
LABEL_29:
            v35 = 0;
            goto LABEL_30;
          }
          *(_WORD *)buf = 0;
          v31 = "sqf not an array";
          v32 = v36;
          v33 = 2;
        }
        _os_log_error_impl(&dword_19A825000, v32, OS_LOG_TYPE_ERROR, v31, buf, v33);
        goto LABEL_29;
      }
    }
    else
    {
      if (PARLogHandleForCategory_onceToken_2084 != -1)
        dispatch_once(&PARLogHandleForCategory_onceToken_2084, &__block_literal_global_226);
      v34 = PARLogHandleForCategory_logHandles_2_2085;
      if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_2_2085, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_19A825000, v34, OS_LOG_TYPE_DEBUG, "no sqf", buf, 2u);
      }
    }
    v35 = 0;
LABEL_31:
    v77 = v26;

    rawSqf = v13->_rawSqf;
    v13->_rawSqf = v35;

    goto LABEL_32;
  }
LABEL_47:

  objc_autoreleasePoolPop(context);
  return v13;
}

uint64_t __33__PARResponse_responseFromReply___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asSuggestion:", *(_QWORD *)(a1 + 32));
}

id __33__PARResponse_responseFromReply___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
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
  id v25;
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
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "sf_asSearchResult:factory:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQueryId:", *(_QWORD *)(a1 + 96));
  objc_msgSend(v4, "setUserInput:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v3, "parsec_stringForKey:", CFSTR("fbr"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFbr:", v5);

  objc_msgSend(v3, "parsec_stringForKey:", CFSTR("more_results_url"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "parsec_stringForKey:", CFSTR("more_results_label"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PARAsyncMoreResults moreResults:label:session:scale:queryId:clientQueryId:](PARAsyncMoreResults, "moreResults:label:session:scale:queryId:clientQueryId:", v7, v8, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 96), *(double *)(a1 + 104));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setMoreResults:", v9);

    }
  }
  if (objc_msgSend(v4, "type") == 26)
  {
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v4);
    v10 = 0;
  }
  else
  {
    objc_msgSend(v4, "sectionHeader");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = *(void **)(a1 + 72);
      objc_msgSend(v4, "sectionHeader");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v13);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v14 = objc_alloc_init(MEMORY[0x1E0D8C650]);
        objc_msgSend(v4, "sectionHeader");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setTitle:", v15);

        objc_msgSend(v4, "sectionBundleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setBundleIdentifier:", v16);

        v17 = *(void **)(a1 + 72);
        objc_msgSend(v14, "title");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v14, v18);

        objc_msgSend(*(id *)(a1 + 80), "addObject:", v14);
      }
      objc_msgSend(v14, "moreText");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        objc_msgSend(v4, "sectionHeaderMore");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setMoreText:", v20);

      }
      objc_msgSend(v14, "setIsInitiallyHidden:", objc_msgSend(v3, "parsec_BOOLForKey:", CFSTR("initially_hidden")));
      objc_msgSend(v3, "parsec_numberForKey:", CFSTR("maxInitiallyVisibleResults"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
        objc_msgSend(v14, "setMaxInitiallyVisibleResults:", objc_msgSend(v21, "unsignedIntValue"));
      objc_msgSend(v14, "results");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
      {
        v25 = v23;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v25 = (id)objc_claimAutoreleasedReturnValue();
      }
      v26 = v25;

      objc_msgSend(v26, "addObject:", v4);
      objc_msgSend(v14, "setResults:", v26);
      objc_msgSend(v4, "inlineCard");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "cardSections");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(v4, "inlineCard");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "cardSections");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "firstObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v32, "titleButtonItem");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setTitleButtonItem:", v33);

        }
      }
      objc_msgSend(v3, "parsec_stringForKey:", CFSTR("more_results_button"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "parsec_base64DecodedData");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C890]), "initWithData:", v35);
        if (v36)
        {
          v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C2A0]), "initWithProtobuf:", v36);
          objc_msgSend(v14, "setButton:", v37);
          objc_msgSend(v4, "setMoreResultsButton:", v37);

        }
      }

    }
    objc_msgSend(v4, "setIntendedQuery:", *(_QWORD *)(*(_QWORD *)(a1 + 88) + 32));
    v38 = *(void **)(*(_QWORD *)(a1 + 88) + 96);
    if (v38 && objc_msgSend(v38, "count"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 88) + 96), "firstObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "suggestion");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setCorrectedQuery:", v40);

    }
    objc_msgSend(v4, "card");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v41)
    {
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      objc_msgSend(v4, "inlineCard", 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "cardSections");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      if (v44)
      {
        v45 = v44;
        v46 = *(_QWORD *)v57;
        while (2)
        {
          for (i = 0; i != v45; ++i)
          {
            if (*(_QWORD *)v57 != v46)
              objc_enumerationMutation(v43);
            v48 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
            objc_msgSend(v48, "nextCard");
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            if (v49)
            {
              objc_msgSend(v48, "nextCard");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setCard:", v50);

              goto LABEL_40;
            }
          }
          v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
          if (v45)
            continue;
          break;
        }
      }
LABEL_40:

    }
    objc_msgSend(v4, "card");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    recursiveSetQueryId(v51, *(_QWORD *)(a1 + 96));

    objc_msgSend(v4, "inlineCard");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    recursiveSetQueryId(v52, *(_QWORD *)(a1 + 96));

    objc_msgSend(v4, "compactCard");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    recursiveSetQueryId(v53, *(_QWORD *)(a1 + 96));

    objc_msgSend(v4, "tophitCard");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    recursiveSetQueryId(v54, *(_QWORD *)(a1 + 96));

    v10 = v4;
  }

  return v10;
}

id __33__PARResponse_responseFromReply___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (objc_class *)MEMORY[0x1E0D8C6B0];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "parsec_stringForKey:", CFSTR("c"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parsec_stringForKey:", CFSTR("p"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parsec_numberForKey:", CFSTR("s"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v8 = (void *)objc_msgSend(v4, "initWithIdentifier:suggestion:query:score:type:", 0, v5, v6, 1);

  objc_msgSend(v3, "parsec_stringForKey:", CFSTR("fbr"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setFbr:", v9);
  return v8;
}

id __33__PARResponse_responseFromReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = a2;
  objc_msgSend(v2, "parsec_numberForKey:", CFSTR("domain"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "intValue");
  else
    v5 = 0;
  objc_msgSend(v2, "parsec_numberForKey:", CFSTR("score"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parsec_numberForKey:", CFSTR("scoreConfidence"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C348]), "initWithDomain:scoreConfidence:score:", v5, v7, v6);
  return v8;
}

@end
