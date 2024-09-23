@implementation FCUserVector

- (FCUserVector)initWithWhitelistURL:(id)a3 modelURL:(id)a4 personalizationTreatment:(id)a5 bundleChannelIDs:(id)a6 bundleChannelIDsVersion:(id)a7 subscriptionController:(id)a8 sportsTagIDs:(id)a9
{
  id v16;
  id v17;
  FCUserVector *v18;
  FCUserVector *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)FCUserVector;
  v18 = -[FCUserVector init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_whitelistURL, a3);
    objc_storeStrong((id *)&v19->_modelURL, a4);
    objc_storeStrong((id *)&v19->_personalizationTreatment, a5);
    objc_storeStrong((id *)&v19->_bundleChannelIDs, a6);
    objc_storeStrong((id *)&v19->_bundleChannelIDsVersion, a7);
    objc_storeStrong((id *)&v19->_subscriptionController, a8);
    objc_storeStrong((id *)&v19->_sportsTagIDs, a9);
  }

  return v19;
}

- (FCUserVector)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCUserVector init]";
    v9 = 2080;
    v10 = "FCUserVector.m";
    v11 = 1024;
    v12 = 66;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCUserVector init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (id)computePersonalizationVectorWithAggregateVectorProvider:(id)a3 personalizationTreatment:(id)a4 tagRanker:(id)a5 options:(int64_t)a6
{
  char v6;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  FCUserVectorModel *v20;
  id *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  unint64_t v49;
  void *v50;
  FCUserVectorModelInput *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  unint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  FCUserVectorModelInput *v79;
  void *v80;
  char v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  void *v90;
  _QWORD v91[4];
  id v92;
  id v93;
  _QWORD v94[4];
  id v95;
  id v96;
  _QWORD v97[4];
  id v98;
  id v99;
  _QWORD v100[5];
  _QWORD v101[4];
  id v102;
  id v103;
  id v104;
  id v105;
  _BYTE buf[12];
  __int16 v107;
  void *v108;
  uint64_t v109;

  v6 = a6;
  v109 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc_init(MEMORY[0x1E0D628B0]);
  if ((v6 & 1) == 0)
    goto LABEL_34;
  v89 = v12;
  v14 = objc_alloc_init(MEMORY[0x1E0C9E958]);
  objc_msgSend(v14, "setComputeUnits:", 0);
  v15 = (void *)MEMORY[0x1E0C9E940];
  -[FCUserVector modelURL](self, "modelURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = 0;
  objc_msgSend(v15, "compileModelAtURL:error:", v16, &v105);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v105;

  v19 = (void *)v17;
  v20 = [FCUserVectorModel alloc];
  if (v17)
  {
    v104 = v18;
    v21 = &v104;
    v22 = -[FCUserVectorModel initWithContentsOfURL:configuration:error:](v20, "initWithContentsOfURL:configuration:error:", v19, v14, &v104);
  }
  else
  {
    v103 = v18;
    v21 = &v103;
    v22 = -[FCUserVectorModel initWithConfiguration:error:](v20, "initWithConfiguration:error:", v14, &v103);
  }
  v23 = (void *)v22;
  v24 = *v21;

  v25 = v23;
  v90 = v14;
  if (v23)
  {
    v84 = v11;
    v85 = v19;
    v86 = v10;
    v82 = v23;
    v88 = v23;
    objc_msgSend(v88, "model");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "modelDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "metadata");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "fc_safeObjectForKey:", *MEMORY[0x1E0C9E868]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "fc_safeObjectForKey:", CFSTR("version"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)MEMORY[0x1E0C99D50];
    -[FCUserVector whitelistURL](self, "whitelistURL");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "dataWithContentsOfURL:", v31);
    v32 = objc_claimAutoreleasedReturnValue();

    v83 = (void *)v32;
    if (v32)
    {
      v81 = v6;
      v99 = v24;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v32, 4, &v99);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v99;

      v19 = v85;
      v10 = v86;
      if (v33)
      {
        v78 = v34;
        v35 = v33;
        objc_msgSend(v35, "fc_safeObjectForKey:", CFSTR("tagIds"));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "fc_safeObjectForKey:", CFSTR("bins"));
        v76 = v35;
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "fc_safeObjectForKey:", CFSTR("version"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36;
        if (!v85)
          goto LABEL_10;
        if (!objc_msgSend(v36, "isEqualToString:", v87))
        {
          v62 = 1;
          v25 = v23;
          v12 = v89;
        }
        else
        {
LABEL_10:
          v74 = v33;
          v75 = v37;
          objc_msgSend(v86, "aggregateVectorForTags:", v80);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = FCPersonalizationLog;
          if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v75;
            v107 = 2112;
            v108 = v38;
            _os_log_debug_impl(&dword_1A1B90000, v39, OS_LOG_TYPE_DEBUG, "Created user aggregate input with whitelist version %@ and vector %@.", buf, 0x16u);
          }
          objc_msgSend(v88, "model");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "modelDescription");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "inputDescriptionsByName");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("aggregates"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "multiArrayConstraint");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "shape");
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          v46 = objc_msgSend(v38, "count");
          objc_msgSend(v45, "firstObject");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v41) = objc_msgSend(v47, "intValue");

          if (v46 == (int)v41)
          {
            v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E970]), "initWithShape:dataType:error:", v45, 65600, 0);
            if (objc_msgSend(v38, "count"))
            {
              v49 = 0;
              do
              {
                objc_msgSend(v38, "objectAtIndexedSubscript:", v49);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "setObject:atIndexedSubscript:", v50, v49);

                ++v49;
              }
              while (objc_msgSend(v38, "count") > v49);
            }
            v51 = -[FCUserVectorModelInput initWithAggregates:]([FCUserVectorModelInput alloc], "initWithAggregates:", v48);
            v93 = v78;
            objc_msgSend(v88, "predictionFromFeatures:error:", v51, &v93);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = v93;

            objc_msgSend(v52, "featureValueForName:", CFSTR("user_vector"));
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "multiArrayValue");
            v55 = (void *)objc_claimAutoreleasedReturnValue();

            v73 = v45;
            if (v55)
            {
              v71 = v53;
              v72 = v52;
              v79 = v51;
              -[FCUserVector findVector:closestToBins:](self, "findVector:closestToBins:");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99DF0], "data");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v56, "count"))
              {
                v58 = 0;
                do
                {
                  *(_QWORD *)buf = 0;
                  objc_msgSend(v56, "objectAtIndex:", v58);
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "doubleValue");
                  v61 = v60;

                  *(_QWORD *)buf = v61;
                  objc_msgSend(v57, "appendBytes:length:", buf, 8);
                  ++v58;
                }
                while (objc_msgSend(v56, "count") > v58);
              }
              objc_msgSend(v13, "setPersonalizationVector:", v57);
              objc_msgSend(v13, "setVersion:", v87);

              v62 = 0;
              v51 = v79;
              v63 = v71;
              v52 = v72;
            }
            else
            {
              v55 = 0;
              v91[0] = MEMORY[0x1E0C809B0];
              v91[1] = 3221225472;
              v91[2] = __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke_30;
              v91[3] = &unk_1E4643BF8;
              v92 = v53;
              __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke_30((uint64_t)v91);
              objc_claimAutoreleasedReturnValue();
              v62 = 1;
              v63 = v53;
              v56 = v92;
            }

            v78 = v63;
            v19 = v85;
            v25 = v82;
            v45 = v73;
          }
          else
          {
            v94[0] = MEMORY[0x1E0C809B0];
            v94[1] = 3221225472;
            v94[2] = __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke_27;
            v94[3] = &unk_1E4643C20;
            v95 = v45;
            v96 = v38;
            __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke_27((uint64_t)v94);
            objc_claimAutoreleasedReturnValue();

            v62 = 1;
            v48 = v95;
            v19 = v85;
            v25 = v23;
          }

          v10 = v86;
          v12 = v89;
          v33 = v74;
          v37 = v75;
        }

        v11 = v84;
        v65 = v76;
        v24 = v78;
      }
      else
      {
        v97[0] = MEMORY[0x1E0C809B0];
        v97[1] = 3221225472;
        v97[2] = __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke_25;
        v97[3] = &unk_1E4643BF8;
        v24 = v34;
        v98 = v24;
        __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke_25((uint64_t)v97);
        objc_claimAutoreleasedReturnValue();
        v62 = 1;
        v65 = v98;
        v11 = v84;
        v25 = v23;
        v12 = v89;
      }

      v6 = v81;
    }
    else
    {
      v100[0] = MEMORY[0x1E0C809B0];
      v100[1] = 3221225472;
      v100[2] = __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke_23;
      v100[3] = &unk_1E4643BF8;
      v100[4] = self;
      __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke_23((uint64_t)v100);
      objc_claimAutoreleasedReturnValue();
      v62 = 1;
      v19 = v85;
      v10 = v86;
      v11 = v84;
      v25 = v23;
      v12 = v89;
    }

    v64 = v88;
  }
  else
  {
    v101[0] = MEMORY[0x1E0C809B0];
    v101[1] = 3221225472;
    v101[2] = __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke;
    v101[3] = &unk_1E4643BF8;
    v24 = v24;
    v102 = v24;
    __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke((uint64_t)v101);
    objc_claimAutoreleasedReturnValue();
    v62 = 1;
    v64 = v102;
    v12 = v89;
  }

  if (v62)
  {
    v66 = 0;
  }
  else
  {
LABEL_34:
    if ((v6 & 2) != 0)
    {
      -[FCUserVector bundleSubscribedVector](self, "bundleSubscribedVector");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBundleSubscribedVector:", v67);

      -[FCUserVector bundleChannelIDsVersion](self, "bundleChannelIDsVersion");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBundleSubscribedVectorVersion:", v68);

    }
    -[FCUserVector subscribedSportsTagsWithPersonalizationTreatment:tagRanker:](self, "subscribedSportsTagsWithPersonalizationTreatment:tagRanker:", v11, v12);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSportsFavoritesVector:", v69);

    v66 = v13;
  }

  return v66;
}

uint64_t __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v4;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "Error in creating user vector model: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

uint64_t __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke_23(uint64_t a1)
{
  void *v2;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v2;
    objc_msgSend(v4, "whitelistURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to get data from fileURL: %@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke_25(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "Failed to serialize whitelist data: %@", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

uint64_t __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke_27(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (int)objc_msgSend(v5, "intValue");
    v7 = objc_msgSend(*(id *)(a1 + 40), "count");
    v9 = 134218240;
    v10 = v6;
    v11 = 2048;
    v12 = v7;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "Model metadata shape %lu does not match tag list count %lu, not submitting vector.", (uint8_t *)&v9, 0x16u);

  }
  return 0;
}

uint64_t __115__FCUserVector_computePersonalizationVectorWithAggregateVectorProvider_personalizationTreatment_tagRanker_options___block_invoke_30(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "Error when performing prediction using user vector model: %@", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

- (id)computePersonalizationVectorWithAggregateStore:(id)a3 personalizationTreatment:(id)a4 tagRanker:(id)a5 options:(int64_t)a6
{
  char v6;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  FCUserVectorModel *v19;
  id *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  uint64_t v44;
  FCTagIDFeature *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  unint64_t v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  unint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  id v87;
  void *v88;
  FCUserVectorModelInput *v89;
  void *v90;
  id v91;
  id v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  char v108;
  void *v109;
  FCUserVector *v110;
  _QWORD v111[4];
  id v112;
  void *v113;
  _QWORD v114[4];
  id v115;
  id v116;
  _QWORD v117[4];
  id v118;
  id v119;
  id v120;
  double v121;
  uint64_t v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _QWORD v127[4];
  id v128;
  id v129;
  _QWORD v130[5];
  _QWORD v131[4];
  id v132;
  id v133;
  id v134;
  id v135;
  _BYTE buf[12];
  __int16 v137;
  void *v138;
  _BYTE v139[128];
  uint64_t v140;

  v6 = a6;
  v140 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc_init(MEMORY[0x1E0D628B0]);
  if ((v6 & 1) == 0)
    goto LABEL_41;
  v109 = v10;
  v14 = objc_alloc_init(MEMORY[0x1E0C9E958]);
  objc_msgSend(v14, "setComputeUnits:", 0);
  v15 = (void *)MEMORY[0x1E0C9E940];
  v110 = self;
  -[FCUserVector modelURL](self, "modelURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = 0;
  objc_msgSend(v15, "compileModelAtURL:error:", v16, &v135);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v135;

  v19 = [FCUserVectorModel alloc];
  v108 = v6;
  if (v17)
  {
    v134 = v18;
    v20 = &v134;
    v21 = -[FCUserVectorModel initWithContentsOfURL:configuration:error:](v19, "initWithContentsOfURL:configuration:error:", v17, v14, &v134);
  }
  else
  {
    v133 = v18;
    v20 = &v133;
    v21 = -[FCUserVectorModel initWithConfiguration:error:](v19, "initWithConfiguration:error:", v14, &v133);
  }
  v22 = (void *)v21;
  v23 = *v20;

  v107 = v14;
  if (v22)
  {
    v106 = v17;
    v103 = v12;
    v104 = v11;
    v24 = v22;
    objc_msgSend(v24, "model");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "modelDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "metadata");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "fc_safeObjectForKey:", *MEMORY[0x1E0C9E868]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "fc_safeObjectForKey:", CFSTR("version"));
    v105 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (void *)MEMORY[0x1E0C99D50];
    -[FCUserVector whitelistURL](v110, "whitelistURL");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "dataWithContentsOfURL:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      v129 = v23;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v31, 4, &v129);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v129;

      if (v32)
      {
        v101 = v33;
        v34 = v32;
        objc_msgSend(v34, "fc_safeObjectForKey:", CFSTR("tagIds"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "fc_safeObjectForKey:", CFSTR("bins"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = v34;
        objc_msgSend(v34, "fc_safeObjectForKey:", CFSTR("version"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = v37;
        if (!v17)
          goto LABEL_10;
        if (!objc_msgSend(v37, "isEqualToString:", v105))
        {
          v79 = 1;
        }
        else
        {
LABEL_10:
          v96 = v22;
          v97 = v36;
          v94 = v32;
          v95 = v31;
          v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v123 = 0u;
          v124 = 0u;
          v125 = 0u;
          v126 = 0u;
          v98 = v35;
          v39 = v35;
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v123, v139, 16);
          if (v40)
          {
            v41 = v40;
            v42 = *(_QWORD *)v124;
            do
            {
              for (i = 0; i != v41; ++i)
              {
                if (*(_QWORD *)v124 != v42)
                  objc_enumerationMutation(v39);
                v44 = *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * i);
                v45 = -[FCTagIDFeature initWithTagID:]([FCTagIDFeature alloc], "initWithTagID:", v44);
                objc_msgSend(v38, "setObject:forKeyedSubscript:", v45, v44);

              }
              v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v123, v139, 16);
            }
            while (v41);
          }

          objc_msgSend(v109, "baselineAggregateWithConfigurableValues:", v104);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "allValues");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "aggregatesForFeatures:", v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          -[FCUserVector personalizationTreatment](v110, "personalizationTreatment");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "defaultScoringConfig");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "decayFactor");
          v52 = v51;

          objc_msgSend(v46, "personalizationValueWithBaseline:decayRate:", 0, v52);
          v54 = v53;
          v55 = MEMORY[0x1E0C809B0];
          v117[0] = MEMORY[0x1E0C809B0];
          v117[1] = 3221225472;
          v117[2] = __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_2;
          v117[3] = &unk_1E4643C48;
          v92 = v48;
          v118 = v92;
          v93 = v38;
          v119 = v93;
          v91 = v46;
          v120 = v91;
          v121 = v52;
          v122 = v54;
          objc_msgSend(v39, "fc_arrayByTransformingWithBlock:", v117);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = FCPersonalizationLog;
          if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v100;
            v137 = 2112;
            v138 = v56;
            _os_log_debug_impl(&dword_1A1B90000, v57, OS_LOG_TYPE_DEBUG, "Created user aggregate input with whitelist version %@ and vector %@.", buf, 0x16u);
          }
          objc_msgSend(v24, "model");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "modelDescription");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "inputDescriptionsByName");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("aggregates"));
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "multiArrayConstraint");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "shape");
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          v64 = objc_msgSend(v56, "count");
          objc_msgSend(v63, "firstObject");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v60) = objc_msgSend(v65, "intValue");

          if (v64 == (int)v60)
          {
            v90 = v63;
            v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E970]), "initWithShape:dataType:error:", v63, 65600, 0);
            v17 = v106;
            v35 = v98;
            if (objc_msgSend(v56, "count"))
            {
              v67 = 0;
              do
              {
                objc_msgSend(v56, "objectAtIndexedSubscript:", v67);
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "setObject:atIndexedSubscript:", v68, v67);

                ++v67;
              }
              while (objc_msgSend(v56, "count") > v67);
            }
            v113 = v101;
            v89 = -[FCUserVectorModelInput initWithAggregates:]([FCUserVectorModelInput alloc], "initWithAggregates:", v66);
            objc_msgSend(v24, "predictionFromFeatures:error:");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = v101;

            v102 = v69;
            objc_msgSend(v69, "featureValueForName:", CFSTR("user_vector"));
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "multiArrayValue");
            v72 = objc_claimAutoreleasedReturnValue();

            v22 = v96;
            v88 = (void *)v72;
            if (v72)
            {
              v87 = v70;
              -[FCUserVector findVector:closestToBins:](v110, "findVector:closestToBins:", v72, v97);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99DF0], "data");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v73, "count"))
              {
                v75 = 0;
                do
                {
                  *(_QWORD *)buf = 0;
                  objc_msgSend(v73, "objectAtIndex:", v75);
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v76, "doubleValue");
                  v78 = v77;

                  *(_QWORD *)buf = v78;
                  objc_msgSend(v74, "appendBytes:length:", buf, 8);
                  ++v75;
                }
                while (objc_msgSend(v73, "count") > v75);
              }
              objc_msgSend(v13, "setPersonalizationVector:", v74);
              objc_msgSend(v13, "setVersion:", v105);

              v79 = 0;
              v17 = v106;
              v35 = v98;
              v70 = v87;
            }
            else
            {
              v111[0] = MEMORY[0x1E0C809B0];
              v111[1] = 3221225472;
              v111[2] = __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_41;
              v111[3] = &unk_1E4643BF8;
              v112 = v70;
              __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_41((uint64_t)v111);
              objc_claimAutoreleasedReturnValue();
              v79 = 1;
              v73 = v112;
            }

            v101 = v70;
            v31 = v95;
            v81 = v90;
          }
          else
          {
            v114[0] = v55;
            v114[1] = 3221225472;
            v114[2] = __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_40;
            v114[3] = &unk_1E4643C20;
            v115 = v63;
            v116 = v56;
            __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_40((uint64_t)v114);
            objc_claimAutoreleasedReturnValue();

            v79 = 1;
            v66 = v115;
            v81 = v63;
            v17 = v106;
            v31 = v95;
            v22 = v96;
            v35 = v98;
          }

          v32 = v94;
          v36 = v97;
        }

        v12 = v103;
        v11 = v104;
        v80 = v99;
        v23 = v101;
      }
      else
      {
        v127[0] = MEMORY[0x1E0C809B0];
        v127[1] = 3221225472;
        v127[2] = __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_33;
        v127[3] = &unk_1E4643BF8;
        v23 = v33;
        v128 = v23;
        __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_33((uint64_t)v127);
        objc_claimAutoreleasedReturnValue();
        v79 = 1;
        v80 = v128;
        v12 = v103;
        v11 = v104;
      }

    }
    else
    {
      v130[0] = MEMORY[0x1E0C809B0];
      v130[1] = 3221225472;
      v130[2] = __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_32;
      v130[3] = &unk_1E4643BF8;
      v130[4] = v110;
      __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_32((uint64_t)v130);
      objc_claimAutoreleasedReturnValue();
      v79 = 1;
      v12 = v103;
      v11 = v104;
    }

  }
  else
  {
    v131[0] = MEMORY[0x1E0C809B0];
    v131[1] = 3221225472;
    v131[2] = __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke;
    v131[3] = &unk_1E4643BF8;
    v23 = v23;
    v132 = v23;
    __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke((uint64_t)v131);
    objc_claimAutoreleasedReturnValue();
    v79 = 1;
    v24 = v132;
  }

  v6 = v108;
  v10 = v109;
  self = v110;
  if (v79)
  {
    v82 = 0;
  }
  else
  {
LABEL_41:
    if ((v6 & 2) != 0)
    {
      -[FCUserVector bundleSubscribedVector](self, "bundleSubscribedVector");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBundleSubscribedVector:", v83);

      -[FCUserVector bundleChannelIDsVersion](self, "bundleChannelIDsVersion");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBundleSubscribedVectorVersion:", v84);

    }
    -[FCUserVector subscribedSportsTagsWithPersonalizationTreatment:tagRanker:](self, "subscribedSportsTagsWithPersonalizationTreatment:tagRanker:", v11, v12);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSportsFavoritesVector:", v85);

    v82 = v13;
  }

  return v82;
}

uint64_t __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v4;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "Error in creating user vector model: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

uint64_t __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_32(uint64_t a1)
{
  void *v2;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v2;
    objc_msgSend(v4, "whitelistURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to get data from fileURL: %@", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_33(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "Failed to serialize whitelist data: %@", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

id __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safeObjectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "personalizationValueWithBaseline:decayRate:", *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
    objc_msgSend(v6, "numberWithDouble:", v7 - *(double *)(a1 + 64));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &unk_1E470D580;
  }

  return v8;
}

uint64_t __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_40(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (int)objc_msgSend(v5, "intValue");
    v7 = objc_msgSend(*(id *)(a1 + 40), "count");
    v9 = 134218240;
    v10 = v6;
    v11 = 2048;
    v12 = v7;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "Model metadata shape %lu does not match tag list count %lu, not submitting vector.", (uint8_t *)&v9, 0x16u);

  }
  return 0;
}

uint64_t __106__FCUserVector_computePersonalizationVectorWithAggregateStore_personalizationTreatment_tagRanker_options___block_invoke_41(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "Error when performing prediction using user vector model: %@", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

- (id)subscribedBundleChannelIDs
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[FCUserVector bundleChannelIDs](self, "bundleChannelIDs", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        -[FCUserVector subscriptionController](self, "subscriptionController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "subscriptionForTagID:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(v3, "copy");
  return v12;
}

- (id)bundleSubscribedVector
{
  const __CFAllocator *v3;
  void *v4;
  __CFBitVector *Mutable;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  CFBit v13;
  void *v14;
  unint64_t v15;
  CFIndex Count;
  uint64_t v17;
  void *v18;
  CFIndex v19;
  id v20;
  UInt8 *v21;
  CFRange v23;

  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  -[FCUserVector bundleChannelIDs](self, "bundleChannelIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = CFBitVectorCreateMutable(v3, objc_msgSend(v4, "count"));

  -[FCUserVector bundleChannelIDs](self, "bundleChannelIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CFBitVectorSetCount(Mutable, objc_msgSend(v6, "count"));

  -[FCUserVector subscribedBundleChannelIDs](self, "subscribedBundleChannelIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserVector bundleChannelIDs](self, "bundleChannelIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = 0;
    do
    {
      -[FCUserVector bundleChannelIDs](self, "bundleChannelIDs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        v13 = objc_msgSend(v7, "containsObject:", v12);
      else
        v13 = 0;
      CFBitVectorSetBitAtIndex(Mutable, v10, v13);

      ++v10;
      -[FCUserVector bundleChannelIDs](self, "bundleChannelIDs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

    }
    while (v15 > v10);
  }
  Count = CFBitVectorGetCount(Mutable);
  v17 = Count + 7;
  if (Count < -7)
    v17 = Count + 14;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v17 >> 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = CFBitVectorGetCount(Mutable);
  v20 = objc_retainAutorelease(v18);
  v21 = (UInt8 *)objc_msgSend(v20, "mutableBytes");
  v23.location = 0;
  v23.length = v19;
  CFBitVectorGetBits(Mutable, v23, v21);

  return v20;
}

- (id)subscribedSportsTagsWithPersonalizationTreatment:(id)a3 tagRanker:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  -[FCUserVector sportsTagIDs](self, "sportsTagIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[FCUserVector sportsTagIDs](self, "sportsTagIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "personalizesSportsTagsInUserVector"))
    {
      objc_msgSend(v7, "rankTagIDsDescending:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v12;
    }
    objc_msgSend(v11, "fc_subarrayWithMaxCount:", 50);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR(","));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dataUsingEncoding:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)findVector:(id)a3 closestToBins:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v5, "count") >= 1)
  {
    v8 = 0;
    do
    {
      v9 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      objc_msgSend(v9, "numberWithDouble:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v11);

      ++v8;
    }
    while (objc_msgSend(v5, "count") > v8);
  }
  v12 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v7;
    _os_log_debug_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_DEBUG, "Computed user vector with vector %@.", buf, 0xCu);
  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __41__FCUserVector_findVector_closestToBins___block_invoke;
  v19[3] = &unk_1E463EA10;
  v13 = v7;
  v20 = v13;
  objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "valueForKeyPath:", CFSTR("@max.self"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v14, "indexOfObject:", v15));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v16;
    _os_log_debug_impl(&dword_1A1B90000, v17, OS_LOG_TYPE_DEBUG, "Selected bin with vector %@.", buf, 0xCu);
  }

  return v16;
}

uint64_t __41__FCUserVector_findVector_closestToBins___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "fc_cosineDistanceToArray:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(v2, "numberWithDouble:");
}

- (NSURL)whitelistURL
{
  return self->_whitelistURL;
}

- (void)setWhitelistURL:(id)a3
{
  objc_storeStrong((id *)&self->_whitelistURL, a3);
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setModelURL:(id)a3
{
  objc_storeStrong((id *)&self->_modelURL, a3);
}

- (FCPersonalizationTreatment)personalizationTreatment
{
  return self->_personalizationTreatment;
}

- (void)setPersonalizationTreatment:(id)a3
{
  objc_storeStrong((id *)&self->_personalizationTreatment, a3);
}

- (NSOrderedSet)bundleChannelIDs
{
  return self->_bundleChannelIDs;
}

- (void)setBundleChannelIDs:(id)a3
{
  objc_storeStrong((id *)&self->_bundleChannelIDs, a3);
}

- (NSOrderedSet)sportsTagIDs
{
  return self->_sportsTagIDs;
}

- (void)setSportsTagIDs:(id)a3
{
  objc_storeStrong((id *)&self->_sportsTagIDs, a3);
}

- (NSString)bundleChannelIDsVersion
{
  return self->_bundleChannelIDsVersion;
}

- (void)setBundleChannelIDsVersion:(id)a3
{
  objc_storeStrong((id *)&self->_bundleChannelIDsVersion, a3);
}

- (FCSubscriptionController)subscriptionController
{
  return self->_subscriptionController;
}

- (void)setSubscriptionController:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionController, 0);
  objc_storeStrong((id *)&self->_bundleChannelIDsVersion, 0);
  objc_storeStrong((id *)&self->_sportsTagIDs, 0);
  objc_storeStrong((id *)&self->_bundleChannelIDs, 0);
  objc_storeStrong((id *)&self->_personalizationTreatment, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_whitelistURL, 0);
}

@end
