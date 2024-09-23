@implementation ATXNotificationModeModel

- (ATXNotificationModeModel)initWithMode:(unint64_t)a3 contactStore:(id)a4
{
  id v7;
  ATXNotificationModeModel *v8;
  ATXNotificationModeModel *v9;
  uint64_t v10;
  ATXNotificationModeEntityModelWeights *notificationModeEntityModelWeights;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ATXNotificationModeModel;
  v8 = -[ATXNotificationModeModel init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_mode = a3;
    v10 = objc_opt_new();
    notificationModeEntityModelWeights = v9->_notificationModeEntityModelWeights;
    v9->_notificationModeEntityModelWeights = (ATXNotificationModeEntityModelWeights *)v10;

    objc_storeStrong((id *)&v9->_contactStore, a4);
  }

  return v9;
}

- (id)scoredEntitiesWithScoredAppEntities:(id)a3 scoredContactEntities:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  ATXModeEntityCorrelator *v41;
  ATXNotificationEventProvider *v42;
  ATXModeEntityCorrelator *v43;
  void *v44;
  ATXNotificationEventProvider *v45;
  ATXModeEntityCorrelator *v46;
  ATXNotificationEventProvider *v47;
  ATXModeEntityCorrelator *v48;
  ATXNotificationEventProvider *v49;
  ATXModeEntityCorrelator *v50;
  ATXNotificationEventProvider *v51;
  void *context;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  ATXNotificationModeModel *v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  ATXNotificationModeModel *v71;
  id v72;

  v6 = a3;
  v39 = a4;
  context = (void *)MEMORY[0x1CAA48B6C]();
  v37 = (void *)objc_opt_new();
  +[ATXModeEntityModelTrainer eventProviderForMode:](ATXModeEntityModelTrainer, "eventProviderForMode:", self->_mode);
  v7 = objc_claimAutoreleasedReturnValue();
  v51 = -[ATXNotificationEventProvider initWithEventType:contactStore:]([ATXNotificationEventProvider alloc], "initWithEventType:contactStore:", 1, self->_contactStore);
  v50 = -[ATXModeEntityCorrelator initWithModeEventProvider:entityEventProvider:]([ATXModeEntityCorrelator alloc], "initWithModeEventProvider:entityEventProvider:", v7, v51);
  -[ATXModeEntityCorrelator entityFeaturesForModeEntityScoring](v50, "entityFeaturesForModeEntityScoring");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = -[ATXNotificationEventProvider initWithEventType:contactStore:]([ATXNotificationEventProvider alloc], "initWithEventType:contactStore:", 8, self->_contactStore);
  v48 = -[ATXModeEntityCorrelator initWithModeEventProvider:entityEventProvider:]([ATXModeEntityCorrelator alloc], "initWithModeEventProvider:entityEventProvider:", v7, v49);
  -[ATXModeEntityCorrelator entityFeaturesForModeEntityScoring](v48, "entityFeaturesForModeEntityScoring");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[ATXNotificationEventProvider initWithEventType:contactStore:]([ATXNotificationEventProvider alloc], "initWithEventType:contactStore:", 6, self->_contactStore);
  v9 = (void *)v7;
  v46 = -[ATXModeEntityCorrelator initWithModeEventProvider:entityEventProvider:]([ATXModeEntityCorrelator alloc], "initWithModeEventProvider:entityEventProvider:", v7, v47);
  -[ATXModeEntityCorrelator entityFeaturesForModeEntityScoring](v46, "entityFeaturesForModeEntityScoring");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[ATXNotificationEventProvider initWithEventType:contactStore:]([ATXNotificationEventProvider alloc], "initWithEventType:contactStore:", 3, self->_contactStore);
  v44 = v9;
  v43 = -[ATXModeEntityCorrelator initWithModeEventProvider:entityEventProvider:]([ATXModeEntityCorrelator alloc], "initWithModeEventProvider:entityEventProvider:", v9, v45);
  -[ATXModeEntityCorrelator entityFeaturesForModeEntityScoring](v43, "entityFeaturesForModeEntityScoring");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[ATXNotificationEventProvider initWithEventType:contactStore:]([ATXNotificationEventProvider alloc], "initWithEventType:contactStore:", 10, self->_contactStore);
  v41 = -[ATXModeEntityCorrelator initWithModeEventProvider:entityEventProvider:]([ATXModeEntityCorrelator alloc], "initWithModeEventProvider:entityEventProvider:", v9, v42);
  -[ATXModeEntityCorrelator entityFeaturesForModeEntityScoring](v41, "entityFeaturesForModeEntityScoring");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __86__ATXNotificationModeModel_scoredEntitiesWithScoredAppEntities_scoredContactEntities___block_invoke;
  v62[3] = &unk_1E82E94D8;
  v35 = v8;
  v63 = v35;
  v15 = v10;
  v64 = v15;
  v16 = v11;
  v65 = v16;
  v17 = v12;
  v66 = v17;
  v67 = v13;
  v18 = v6;
  v68 = v18;
  v69 = v14;
  v40 = v39;
  v70 = v40;
  v71 = self;
  v19 = v37;
  v72 = v19;
  v38 = v14;
  v20 = v13;
  objc_msgSend(v36, "enumerateKeysAndObjectsUsingBlock:", v62);
  v21 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(v18, "allKeys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithArray:", v22);

  v24 = v20;
  objc_msgSend(v23, "minusSet:", v20);
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __86__ATXNotificationModeModel_scoredEntitiesWithScoredAppEntities_scoredContactEntities___block_invoke_2;
  v53[3] = &unk_1E82E9500;
  v25 = v18;
  v54 = v25;
  v55 = v36;
  v56 = v35;
  v57 = v15;
  v58 = v16;
  v59 = v17;
  v60 = self;
  v26 = v19;
  v61 = v26;
  v27 = v17;
  v28 = v16;
  v29 = v15;
  v30 = v35;
  v31 = v36;
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", v53);
  v32 = v61;
  v33 = v26;

  objc_autoreleasePoolPop(context);
  return v33;
}

void __86__ATXNotificationModeModel_scoredEntitiesWithScoredAppEntities_scoredContactEntities___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
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
  id v36;

  v36 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v6);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "entity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appEntity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "entity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contactEntity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v15 = *(void **)(a1 + 64);
    objc_msgSend(v12, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v16);

    v17 = *(void **)(a1 + 72);
    objc_msgSend(v12, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }
  v34 = v14;
  v35 = v12;
  if (v14)
  {
    v20 = *(void **)(a1 + 80);
    objc_msgSend(v14, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v21);

    v22 = *(void **)(a1 + 88);
    objc_msgSend(v14, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = 0;
  }
  objc_msgSend(*(id *)(a1 + 96), "modeEntityScoreFromEngagementFeatures:dismissalFeatures:hiddenFeatures:clearedFeatures:expiredFeatures:scoredApp:scoredContact:", v36, v7, v8, v9, v10, v19, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "entity");
  v33 = (void *)v7;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setScoreMetadata:", v25);

  v27 = *(void **)(a1 + 104);
  objc_msgSend(v36, "entity");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "entity");
  v29 = (void *)v8;
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "identifier");
  v31 = (void *)v9;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKey:", v28, v32);

}

void __86__ATXNotificationModeModel_scoredEntitiesWithScoredAppEntities_scoredContactEntities___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  id v22;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8FC0]), "initWithAppEntity:", v22);
  v4 = *(void **)(a1 + 40);
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 48);
  objc_msgSend(v3, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 56);
  objc_msgSend(v3, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *(void **)(a1 + 64);
  objc_msgSend(v3, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *(void **)(a1 + 72);
  objc_msgSend(v3, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 80), "modeEntityScoreFromEngagementFeatures:dismissalFeatures:hiddenFeatures:clearedFeatures:expiredFeatures:scoredApp:scoredContact:", v6, v9, v12, v15, v18, v22, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScoreMetadata:", v19);
  v20 = *(void **)(a1 + 88);
  objc_msgSend(v3, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", v3, v21);

}

- (id)modeEntityScoreFromEngagementFeatures:(id)a3 dismissalFeatures:(id)a4 hiddenFeatures:(id)a5 clearedFeatures:(id)a6 expiredFeatures:(id)a7 scoredApp:(id)a8 scoredContact:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  double v22;
  double v23;
  void *v24;
  ATXModeEntityScoringFeatures *v25;
  void *v26;
  void *v27;
  id v28;
  ATXModeEntityScoringFeatures *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;

  v15 = a8;
  v16 = a9;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  -[ATXNotificationModeModel scoreFromEngagementFeatures:dismissalFeatures:hiddenFeatures:clearedFeatures:expiredFeatures:scoredApp:scoredContact:](self, "scoreFromEngagementFeatures:dismissalFeatures:hiddenFeatures:clearedFeatures:expiredFeatures:scoredApp:scoredContact:", v21, v20, v19, v18, v17, v15, v16);
  v23 = v22;
  v24 = (void *)objc_opt_new();
  -[ATXNotificationModeModel addSubFeaturesToFeatureDict:subFeatures:prefix:](self, "addSubFeaturesToFeatureDict:subFeatures:prefix:", v24, v21, CFSTR("engaged"));

  -[ATXNotificationModeModel addSubFeaturesToFeatureDict:subFeatures:prefix:](self, "addSubFeaturesToFeatureDict:subFeatures:prefix:", v24, v20, CFSTR("dismissed"));
  -[ATXNotificationModeModel addSubFeaturesToFeatureDict:subFeatures:prefix:](self, "addSubFeaturesToFeatureDict:subFeatures:prefix:", v24, v19, CFSTR("hidden"));

  -[ATXNotificationModeModel addSubFeaturesToFeatureDict:subFeatures:prefix:](self, "addSubFeaturesToFeatureDict:subFeatures:prefix:", v24, v18, CFSTR("cleared"));
  -[ATXNotificationModeModel addSubFeaturesToFeatureDict:subFeatures:prefix:](self, "addSubFeaturesToFeatureDict:subFeatures:prefix:", v24, v17, CFSTR("expired"));

  if (v15)
  {
    v25 = [ATXModeEntityScoringFeatures alloc];
    objc_msgSend(v15, "scoreMetadata");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "featureVector");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[ATXModeEntityScoringFeatures initFromJSON:](v25, "initFromJSON:", v27);

    -[ATXNotificationModeModel addSubFeaturesToFeatureDict:subFeatures:prefix:](self, "addSubFeaturesToFeatureDict:subFeatures:prefix:", v24, v28, CFSTR("app"));
  }
  if (v16)
  {
    v29 = [ATXModeEntityScoringFeatures alloc];
    objc_msgSend(v16, "scoreMetadata");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "featureVector");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[ATXModeEntityScoringFeatures initFromJSON:](v29, "initFromJSON:", v31);

    -[ATXNotificationModeModel addSubFeaturesToFeatureDict:subFeatures:prefix:](self, "addSubFeaturesToFeatureDict:subFeatures:prefix:", v24, v32, CFSTR("contact"));
  }
  v33 = (void *)objc_opt_new();
  objc_msgSend(v33, "setScore:", v23);
  v34 = (void *)objc_msgSend(v24, "copy");
  objc_msgSend(v33, "setFeatureVector:", v34);

  return v33;
}

- (void)addSubFeaturesToFeatureDict:(id)a3 subFeatures:(id)a4 prefix:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a5;
  objc_msgSend(a4, "jsonRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__ATXNotificationModeModel_addSubFeaturesToFeatureDict_subFeatures_prefix___block_invoke;
  v12[3] = &unk_1E82E9528;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v12);

}

void __75__ATXNotificationModeModel_addSubFeaturesToFeatureDict_subFeatures_prefix___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v8 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __75__ATXNotificationModeModel_addSubFeaturesToFeatureDict_subFeatures_prefix___block_invoke_2;
    v9[3] = &unk_1E82E9528;
    v10 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

    v6 = v10;
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@"), *(_QWORD *)(a1 + 40), v8);
    objc_msgSend(v7, "setObject:forKey:", v5, v6);
  }

}

void __75__ATXNotificationModeModel_addSubFeaturesToFeatureDict_subFeatures_prefix___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v8 = (id)objc_msgSend(a3, "copy");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@"), *(_QWORD *)(a1 + 40), v6);

  objc_msgSend(v5, "setObject:forKey:", v8, v7);
}

- (double)scoreFromEngagementFeatures:(id)a3 dismissalFeatures:(id)a4 hiddenFeatures:(id)a5 clearedFeatures:(id)a6 expiredFeatures:(id)a7 scoredApp:(id)a8 scoredContact:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  ATXModeEntityScoringFeatures *v25;
  void *v26;
  id v27;
  void *v28;
  ATXModeEntityScoringFeatures *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  uint64_t v60;
  double v61;
  double v62;
  void *v63;
  unsigned int v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  id v150;
  void *v151;
  void *v152;
  void *v153;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v150 = v18;
  v151 = v19;
  v153 = v20;
  v22 = v17;
  v23 = v16;
  v24 = v15;
  if (v20)
  {
    v25 = [ATXModeEntityScoringFeatures alloc];
    objc_msgSend(v20, "scoreMetadata");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "featureVector");
    v27 = v21;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[ATXModeEntityScoringFeatures initFromJSON:](v25, "initFromJSON:", v28);

    v21 = v27;
  }
  v152 = v21;
  if (v21)
  {
    v29 = [ATXModeEntityScoringFeatures alloc];
    objc_msgSend(v21, "scoreMetadata");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "featureVector");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[ATXModeEntityScoringFeatures initFromJSON:](v29, "initFromJSON:", v31);

  }
  v32 = v24;
  v33 = v23;
  v34 = v22;
  v35 = v150;
  if (v20)
  {
    objc_msgSend(v20, "entitySpecificFeatures");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "appCategoryScore_v2");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "doubleValue");
    v39 = v38;

    -[ATXNotificationModeEntityModelWeights appCategoryScoreComponent](self->_notificationModeEntityModelWeights, "appCategoryScoreComponent");
    v41 = v39 * v40;
    -[ATXNotificationModeEntityModelWeights appClassConditionalProbabilityComponent](self->_notificationModeEntityModelWeights, "appClassConditionalProbabilityComponent");
    v43 = v42;
    objc_msgSend(v20, "classConditionalProbability");
    v45 = v43 * v44;
    -[ATXNotificationModeEntityModelWeights appGlobalPopularityComponent](self->_notificationModeEntityModelWeights, "appGlobalPopularityComponent");
    v47 = v46;
    objc_msgSend(v20, "globalPopularity");
    v49 = v47 * v48;
    -[ATXNotificationModeEntityModelWeights appModePopularityComponent](self->_notificationModeEntityModelWeights, "appModePopularityComponent");
    v51 = v50;
    objc_msgSend(v20, "modePopularity");
    v53 = v51 * v52;
    -[ATXNotificationModeEntityModelWeights appPosteriorProbabilityComponent](self->_notificationModeEntityModelWeights, "appPosteriorProbabilityComponent");
    v55 = v54;
    objc_msgSend(v20, "posteriorProbability");
    v57 = v55 * v56;
    -[ATXNotificationModeEntityModelWeights appGlobalOccurrencesComponent](self->_notificationModeEntityModelWeights, "appGlobalOccurrencesComponent");
    v59 = v58;
    v60 = objc_msgSend(v20, "globalOccurrences");
    v61 = 1.0;
    if (!v60)
      v61 = 0.0;
    v62 = v41 + v45 + v49 + v53 + v57 + v59 * v61 + 0.0;
    if (v21)
      goto LABEL_9;
  }
  else
  {
    v62 = 0.0;
    if (v21)
    {
LABEL_9:
      objc_msgSend(v21, "entitySpecificFeatures", v150);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "isFavoriteContact");

      objc_msgSend(v21, "entitySpecificFeatures");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v63) = objc_msgSend(v65, "isVIPContact");

      -[ATXNotificationModeEntityModelWeights contactClassConditionalProbabilityComponent](self->_notificationModeEntityModelWeights, "contactClassConditionalProbabilityComponent");
      v67 = v66;
      objc_msgSend(v21, "classConditionalProbability");
      v69 = v67 * v68;
      -[ATXNotificationModeEntityModelWeights contactGlobalPopularityComponent](self->_notificationModeEntityModelWeights, "contactGlobalPopularityComponent");
      v71 = v70;
      objc_msgSend(v21, "globalPopularity");
      v73 = v71 * v72;
      -[ATXNotificationModeEntityModelWeights contactPosteriorProbabilityComponent](self->_notificationModeEntityModelWeights, "contactPosteriorProbabilityComponent");
      v75 = v74;
      objc_msgSend(v21, "posteriorProbability");
      v77 = v75 * v76;
      -[ATXNotificationModeEntityModelWeights contactGlobalOccurrencesComponent](self->_notificationModeEntityModelWeights, "contactGlobalOccurrencesComponent");
      v79 = v78
          * (double)objc_msgSend(v21, "entityOccurredGloballyOverLastNDays:", -[ATXNotificationModeEntityModelWeights numOfDays](self->_notificationModeEntityModelWeights, "numOfDays"));
      -[ATXNotificationModeEntityModelWeights contactIsFavoriteComponent](self->_notificationModeEntityModelWeights, "contactIsFavoriteComponent");
      v81 = v80 * (double)v64;
      -[ATXNotificationModeEntityModelWeights contactIsVIPComponent](self->_notificationModeEntityModelWeights, "contactIsVIPComponent");
      v62 = v62 + v69 + v73 + v77 + v79 + v81 + v82 * (double)v63;
    }
  }
  -[ATXNotificationModeEntityModelWeights engagementGlobalPopularityComponent](self->_notificationModeEntityModelWeights, "engagementGlobalPopularityComponent", v150);
  v84 = v83;
  objc_msgSend(v32, "globalPopularity");
  v86 = v84 * v85;
  -[ATXNotificationModeEntityModelWeights engagementModePopularityComponent](self->_notificationModeEntityModelWeights, "engagementModePopularityComponent");
  v88 = v87;
  objc_msgSend(v32, "modePopularity");
  v90 = v88 * v89;
  -[ATXNotificationModeEntityModelWeights engagementClassConditionalProbabilityComponent](self->_notificationModeEntityModelWeights, "engagementClassConditionalProbabilityComponent");
  v92 = v91;
  objc_msgSend(v32, "classConditionalProbability");
  v94 = v92 * v93;
  -[ATXNotificationModeEntityModelWeights engagementPosteriorProbabilityComponent](self->_notificationModeEntityModelWeights, "engagementPosteriorProbabilityComponent");
  v96 = v95;
  objc_msgSend(v32, "posteriorProbability");
  v98 = v62 + v86 + v90 + v94 + v96 * v97;
  -[ATXNotificationModeEntityModelWeights clearGlobalPopularityComponent](self->_notificationModeEntityModelWeights, "clearGlobalPopularityComponent");
  v100 = v99;
  objc_msgSend(v35, "globalPopularity");
  v102 = v100 * v101;
  -[ATXNotificationModeEntityModelWeights clearModePopularityComponent](self->_notificationModeEntityModelWeights, "clearModePopularityComponent");
  v104 = v103;
  objc_msgSend(v35, "modePopularity");
  v106 = v104 * v105;
  -[ATXNotificationModeEntityModelWeights clearClassConditionalProbabilityComponent](self->_notificationModeEntityModelWeights, "clearClassConditionalProbabilityComponent");
  v108 = v107;
  objc_msgSend(v35, "classConditionalProbability");
  v110 = v108 * v109;
  -[ATXNotificationModeEntityModelWeights clearPosteriorProbabilityComponent](self->_notificationModeEntityModelWeights, "clearPosteriorProbabilityComponent");
  v112 = v111;
  objc_msgSend(v35, "posteriorProbability");
  v114 = v98 + v102 + v106 + v110 + v112 * v113;
  -[ATXNotificationModeEntityModelWeights hiddenGlobalPopularityComponent](self->_notificationModeEntityModelWeights, "hiddenGlobalPopularityComponent");
  v116 = v115;
  objc_msgSend(v34, "globalPopularity");
  v118 = v116 * v117;
  -[ATXNotificationModeEntityModelWeights hiddenModePopularityComponent](self->_notificationModeEntityModelWeights, "hiddenModePopularityComponent");
  v120 = v119;
  objc_msgSend(v34, "modePopularity");
  v122 = v120 * v121;
  -[ATXNotificationModeEntityModelWeights hiddenClassConditionalProbabilityComponent](self->_notificationModeEntityModelWeights, "hiddenClassConditionalProbabilityComponent");
  v124 = v123;
  objc_msgSend(v34, "classConditionalProbability");
  v126 = v124 * v125;
  -[ATXNotificationModeEntityModelWeights hiddenPosteriorProbabilityComponent](self->_notificationModeEntityModelWeights, "hiddenPosteriorProbabilityComponent");
  v128 = v127;
  objc_msgSend(v34, "posteriorProbability");
  v130 = v114 + v118 + v122 + v126 + v128 * v129;
  -[ATXNotificationModeEntityModelWeights dismissGlobalPopularityComponent](self->_notificationModeEntityModelWeights, "dismissGlobalPopularityComponent");
  v132 = v131;
  objc_msgSend(v33, "globalPopularity");
  v134 = v132 * v133;
  -[ATXNotificationModeEntityModelWeights dismissModePopularityComponent](self->_notificationModeEntityModelWeights, "dismissModePopularityComponent");
  v136 = v135;
  objc_msgSend(v33, "modePopularity");
  v138 = v136 * v137;
  -[ATXNotificationModeEntityModelWeights dismissClassConditionalProbabilityComponent](self->_notificationModeEntityModelWeights, "dismissClassConditionalProbabilityComponent");
  v140 = v139;
  objc_msgSend(v33, "classConditionalProbability");
  v142 = v140 * v141;
  -[ATXNotificationModeEntityModelWeights dismissPosteriorProbabilityComponent](self->_notificationModeEntityModelWeights, "dismissPosteriorProbabilityComponent");
  v144 = v143;
  objc_msgSend(v33, "posteriorProbability");
  v146 = v130 + v134 + v138 + v142 + v144 * v145;
  -[ATXNotificationModeEntityModelWeights bias](self->_notificationModeEntityModelWeights, "bias");
  *(float *)&v147 = v147 + v146;
  v148 = (float)(1.0 / (float)(expf(-*(float *)&v147) + 1.0));
  if (v20 && (unint64_t)objc_msgSend(v20, "uniqueOccurrencesInMode") < 3
    || v21 && (unint64_t)objc_msgSend(v21, "uniqueOccurrencesInMode") <= 2)
  {
    v148 = v148 * 0.5;
  }

  return v148;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_notificationModeEntityModelWeights, 0);
}

@end
