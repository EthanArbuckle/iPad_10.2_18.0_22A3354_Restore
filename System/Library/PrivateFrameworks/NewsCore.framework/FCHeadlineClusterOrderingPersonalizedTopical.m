@implementation FCHeadlineClusterOrderingPersonalizedTopical

- (id)orderTopicsWithClusteredHeadlines:(id)a3 additionalHeadlines:(id)a4 subscribedTagIDs:(id)a5 scoresByArticleID:(id)a6 personalizer:(id)a7 tagNameProvider:(id)a8 personalizationTreatment:(id)a9 translationProvider:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v44;
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  _QWORD aBlock[4];
  id v60;
  id v61;
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  char *v65;
  __int16 v66;
  int v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  v21 = a10;
  v22 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke;
  aBlock[3] = &unk_1E463C2E0;
  v47 = v21;
  v60 = v47;
  v23 = v15;
  v61 = v23;
  v24 = a8;
  v25 = _Block_copy(aBlock);
  v55[0] = v22;
  v55[1] = 3221225472;
  v55[2] = __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_3;
  v55[3] = &unk_1E463C330;
  v46 = v18;
  v56 = v46;
  v26 = v25;
  v58 = v26;
  v27 = v23;
  v57 = v27;
  objc_msgSend(v27, "fc_dictionaryByTransformingValuesWithBlock:", v55);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x1E0C99D20];
  v52[0] = v22;
  v52[1] = 3221225472;
  v52[2] = __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_233;
  v52[3] = &unk_1E463C380;
  v45 = v16;
  v53 = v45;
  v30 = v26;
  v54 = v30;
  objc_msgSend(v29, "fc_array:", v52);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("WARNING: Bad access to personalization treatment from FCHeadlineClusterOrdering. Please file a radar with a sysdiagnose."));
    *(_DWORD *)buf = 136315906;
    v63 = "-[FCHeadlineClusterOrderingPersonalizedTopical orderTopicsWithClusteredHeadlines:additionalHeadlines:subscribe"
          "dTagIDs:scoresByArticleID:personalizer:tagNameProvider:personalizationTreatment:translationProvider:]";
    v64 = 2080;
    v65 = "FCHeadlineClusterOrdering.m";
    v66 = 1024;
    v67 = 874;
    v68 = 2114;
    v69 = v44;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_239;
  v48[3] = &unk_1E463C3D0;
  v49 = v19;
  v50 = v17;
  v51 = v20;
  v32 = v20;
  v33 = v17;
  v34 = v19;
  objc_msgSend(v32, "metaGroupingRelatednessThreshold");
  v36 = v35;
  objc_msgSend(v32, "metaGroupingRelatednessKWeight");
  v38 = v37;
  objc_msgSend(v32, "metaGroupingTopicScoreWeight");
  v40 = v39;
  objc_msgSend(v32, "metaGroupingHighestScoringRelativeScoreMultiplier");
  FCTopicallyOrderGroups(v28, v31, v48, v24, v36, v38, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

id __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id v13;

  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "topicIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_2;
  v11 = &unk_1E463C2B8;
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5, v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "topicTranslationForTagID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tagID");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = v4;
  v9 = v8;

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = v9;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

id __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_3(id *a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_4;
  v8[3] = &unk_1E463C308;
  v9 = a1[4];
  v11 = a1[6];
  v10 = a1[5];
  objc_msgSend(a2, "fc_arrayByTransformingWithBlock:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

FCTopicalNodeElement *__211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  FCTopicalNodeElement *v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  id v13;
  FCTopicalNodeElement *v14;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _BYTE v21[22];
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("score should not be nil."));
    *(_DWORD *)v21 = 136315906;
    *(_QWORD *)&v21[4] = "-[FCHeadlineClusterOrderingPersonalizedTopical orderTopicsWithClusteredHeadlines:additionalHead"
                         "lines:subscribedTagIDs:scoresByArticleID:personalizer:tagNameProvider:personalizationTreatment:"
                         "translationProvider:]_block_invoke_4";
    *(_WORD *)&v21[12] = 2080;
    *(_QWORD *)&v21[14] = "FCHeadlineClusterOrdering.m";
    v22 = 1024;
    v23 = 851;
    v24 = 2114;
    v25 = v16;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v21, 0x26u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v17 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 40), "allKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "topicIDs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("Expected to find a grouped topic in the topic ids. Group topics are %@ and topicIDs are %@"), v18, v19);
    *(_DWORD *)v21 = 136315906;
    *(_QWORD *)&v21[4] = "-[FCHeadlineClusterOrderingPersonalizedTopical orderTopicsWithClusteredHeadlines:additionalHead"
                         "lines:subscribedTagIDs:scoresByArticleID:personalizer:tagNameProvider:personalizationTreatment:"
                         "translationProvider:]_block_invoke";
    *(_WORD *)&v21[12] = 2080;
    *(_QWORD *)&v21[14] = "FCHeadlineClusterOrdering.m";
    v22 = 1024;
    v23 = 856;
    v24 = 2114;
    v25 = v20;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v21, 0x26u);

  }
  v8 = [FCTopicalNodeElement alloc];
  objc_msgSend(v3, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v11 = v10;
  v12 = v9;
  v13 = v7;
  if (v8)
  {
    *(_QWORD *)v21 = v8;
    *(_QWORD *)&v21[8] = FCTopicalNodeElement;
    v14 = (FCTopicalNodeElement *)objc_msgSendSuper2((objc_super *)v21, sel_init);
    v8 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_identifier, v9);
      objc_storeStrong((id *)&v8->_topics, v7);
      v8->_score = v11;
    }
  }

  return v8;
}

void __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_233(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_2_234;
  v6[3] = &unk_1E463C358;
  v3 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "fc_arrayByTransformingWithBlock:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

}

id __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_2_234(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count"))
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

double __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_239(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scoresForTagIDs:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v14 = 0;
    v15 = (double *)&v14;
    v16 = 0x2020000000;
    v17 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_2_240;
    v10[3] = &unk_1E463C3A8;
    v11 = *(id *)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    v13 = &v14;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);
    v7 = v15[3];
    v8 = v7 / (double)(unint64_t)objc_msgSend(v6, "count");

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

void __211__FCHeadlineClusterOrderingPersonalizedTopical_orderTopicsWithClusteredHeadlines_additionalHeadlines_subscribedTagIDs_scoresByArticleID_personalizer_tagNameProvider_personalizationTreatment_translationProvider___block_invoke_2_240(uint64_t a1, uint64_t a2, void *a3)
{
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  v5 = 1.0;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2))
  {
    objc_msgSend(*(id *)(a1 + 40), "metaGroupingSubscribedTopicMultiplier");
    v5 = v6;
  }
  objc_msgSend(v8, "doubleValue");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 24)
                                                              + v7 * v5;

}

@end
