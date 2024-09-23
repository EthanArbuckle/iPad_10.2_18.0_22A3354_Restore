@implementation HRERecommendationEngine

- (HRERecommendationEngine)init
{
  HRERecommendationEngine *v2;
  void *v3;
  void *v4;
  HRETemplateRecommendationGenerator *v5;
  void *v6;
  void *v7;
  void *v8;
  HREActionSetDerivingRecommendationGenerator *v9;
  HRERankConfidenceController *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HRERecommendationEngine;
  v2 = -[HRERecommendationEngine init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRERecommendationEngine setRecommendationSources:](v2, "setRecommendationSources:", v3);

    +[HRETemplateRecommendationGenerator allAvailableTemplates](HRETemplateRecommendationGenerator, "allAvailableTemplates");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[HRETemplateRecommendationGenerator initWithTemplates:]([HRETemplateRecommendationGenerator alloc], "initWithTemplates:", v4);
    -[HRERecommendationEngine setTemplateSource:](v2, "setTemplateSource:", v5);

    -[HRERecommendationEngine recommendationSources](v2, "recommendationSources");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRERecommendationEngine templateSource](v2, "templateSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    -[HRERecommendationEngine recommendationSources](v2, "recommendationSources");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(HREActionSetDerivingRecommendationGenerator);
    objc_msgSend(v8, "addObject:", v9);

    v10 = objc_alloc_init(HRERankConfidenceController);
    -[HRERecommendationEngine setRankingController:](v2, "setRankingController:", v10);

  }
  return v2;
}

- (id)generateRecommendationsForHome:(id)a3 options:(unint64_t)a4
{
  return -[HRERecommendationEngine generateRecommendationsForServiceLikeItems:inHome:options:](self, "generateRecommendationsForServiceLikeItems:inHome:options:", 0, a3, a4);
}

- (id)recommendationsForAccessoryTypeGroup:(id)a3 inHome:(id)a4 options:(unint64_t)a5
{
  return -[HRERecommendationEngine generateRecommendationsForServiceLikeItems:accessoryTypeGroup:inHome:options:](self, "generateRecommendationsForServiceLikeItems:accessoryTypeGroup:inHome:options:", 0, a3, a4, a5);
}

- (id)generateRecommendationsForServiceLikeItems:(id)a3 inHome:(id)a4 options:(unint64_t)a5
{
  return -[HRERecommendationEngine generateRecommendationsForServiceLikeItems:accessoryTypeGroup:inHome:options:](self, "generateRecommendationsForServiceLikeItems:accessoryTypeGroup:inHome:options:", a3, 0, a4, a5);
}

- (id)generateRecommendationsForServiceLikeItems:(id)a3 accessoryTypeGroup:(id)a4 inHome:(id)a5 options:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  char *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v30[5];
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  unint64_t v35;
  _QWORD v36[4];
  id v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  unint64_t v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v12, "name");
    v14 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v39 = v14;
    v40 = 2112;
    v41 = v15;
    v42 = 2048;
    v43 = a6;
    v44 = 2112;
    v45 = v10;
    _os_log_impl(&dword_229430000, v13, OS_LOG_TYPE_DEFAULT, "Generating recommendations in home: <%@, %@>, options: %lu, serviceLikeItems: %@", buf, 0x2Au);

  }
  if (_os_feature_enabled_impl() && objc_msgSend(v12, "hf_currentUserIsRestrictedGuest"))
  {
    HFLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "currentUser");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "hf_prettyDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v39 = "-[HRERecommendationEngine generateRecommendationsForServiceLikeItems:accessoryTypeGroup:inHome:options:]";
      v40 = 2112;
      v41 = v18;
      _os_log_impl(&dword_229430000, v16, OS_LOG_TYPE_DEFAULT, "(%s) Restricted guest should NOT get any recommendations. currentUser = %@", buf, 0x16u);

    }
    v19 = (void *)MEMORY[0x24BE6B608];
    v20 = (id)objc_opt_new();
    objc_msgSend(v19, "futureWithResult:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HRERecommendationEngine _sourcesEnabledWithOptions:](self, "_sourcesEnabledWithOptions:", a6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRERecommendationEngine recommendationSources](self, "recommendationSources");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x24BDAC760];
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __104__HRERecommendationEngine_generateRecommendationsForServiceLikeItems_accessoryTypeGroup_inHome_options___block_invoke;
    v36[3] = &unk_24F218438;
    v37 = v22;
    v20 = v22;
    objc_msgSend(v23, "na_each:", v36);

    v31[0] = v24;
    v31[1] = 3221225472;
    v31[2] = __104__HRERecommendationEngine_generateRecommendationsForServiceLikeItems_accessoryTypeGroup_inHome_options___block_invoke_8;
    v31[3] = &unk_24F218460;
    v32 = v12;
    v33 = v10;
    v34 = v11;
    v35 = a6;
    objc_msgSend(v20, "na_map:", v31);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE6B608], "combineAllFutures:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "flatMap:", &__block_literal_global_11);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v30[0] = v24;
    v30[1] = 3221225472;
    v30[2] = __104__HRERecommendationEngine_generateRecommendationsForServiceLikeItems_accessoryTypeGroup_inHome_options___block_invoke_3;
    v30[3] = &unk_24F2184C8;
    v30[4] = self;
    objc_msgSend(v27, "flatMap:", v30);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (id)objc_msgSend(v21, "addCompletionBlock:", &__block_literal_global_14_0);

  }
  return v21;
}

void __104__HRERecommendationEngine_generateRecommendationsForServiceLikeItems_accessoryTypeGroup_inHome_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0)
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_229430000, v4, OS_LOG_TYPE_DEFAULT, "%@ is disabled", (uint8_t *)&v5, 0xCu);
    }

  }
}

uint64_t __104__HRERecommendationEngine_generateRecommendationsForServiceLikeItems_accessoryTypeGroup_inHome_options___block_invoke_8(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "recommendationsForHome:withServiceLikeItems:accessoryTypeGroup:options:", a1[4], a1[5], a1[6], a1[7]);
}

id __104__HRERecommendationEngine_generateRecommendationsForServiceLikeItems_accessoryTypeGroup_inHome_options___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BE6B608];
  objc_msgSend(v2, "na_setByFlattening");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __104__HRERecommendationEngine_generateRecommendationsForServiceLikeItems_accessoryTypeGroup_inHome_options___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BE6B608];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "rankingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rankRecommendationsFromSet:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "futureWithResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __104__HRERecommendationEngine_generateRecommendationsForServiceLikeItems_accessoryTypeGroup_inHome_options___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  v6 = v5;
  if (v4)
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_229430000, v7, OS_LOG_TYPE_DEFAULT, "Generated recommendations:", (uint8_t *)&v12, 2u);
    }

    objc_msgSend(v4, "na_each:", &__block_literal_global_17_1);
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    LOWORD(v12) = 0;
    v9 = "Finished generating recommendations";
    v10 = v8;
    v11 = 2;
    goto LABEL_9;
  }
  if (v5)
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_10:

      goto LABEL_11;
    }
    v12 = 138412290;
    v13 = v6;
    v9 = "Failed to generate recommendations with error: %@";
    v10 = v8;
    v11 = 12;
LABEL_9:
    _os_log_impl(&dword_229430000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, v11);
    goto LABEL_10;
  }
LABEL_11:

}

void __104__HRERecommendationEngine_generateRecommendationsForServiceLikeItems_accessoryTypeGroup_inHome_options___block_invoke_15(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_229430000, v3, OS_LOG_TYPE_DEFAULT, "\t\t%@", (uint8_t *)&v4, 0xCu);
  }

}

- (NSArray)templates
{
  void *v2;
  void *v3;

  -[HRERecommendationEngine templateSource](self, "templateSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "templates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setTemplates:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HRERecommendationEngine templateSource](self, "templateSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTemplates:", v4);

}

- (id)_sourcesEnabledWithOptions:(unint64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HRERecommendationEngine recommendationSources](self, "recommendationSources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__HRERecommendationEngine__sourcesEnabledWithOptions___block_invoke;
  v7[3] = &__block_descriptor_40_e35_B16__0___HRERecommendationSource__8l;
  v7[4] = a3;
  objc_msgSend(v4, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL __54__HRERecommendationEngine__sourcesEnabledWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  return (objc_msgSend(a2, "disablingOptions") & v2) == 0;
}

- (NSMutableArray)recommendationSources
{
  return self->_recommendationSources;
}

- (void)setRecommendationSources:(id)a3
{
  objc_storeStrong((id *)&self->_recommendationSources, a3);
}

- (HRERankConfidenceController)rankingController
{
  return self->_rankingController;
}

- (void)setRankingController:(id)a3
{
  objc_storeStrong((id *)&self->_rankingController, a3);
}

- (HRETemplateRecommendationGenerator)templateSource
{
  return self->_templateSource;
}

- (void)setTemplateSource:(id)a3
{
  objc_storeStrong((id *)&self->_templateSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateSource, 0);
  objc_storeStrong((id *)&self->_rankingController, 0);
  objc_storeStrong((id *)&self->_recommendationSources, 0);
}

@end
