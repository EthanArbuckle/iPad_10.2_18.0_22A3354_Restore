@implementation HRETemplateRecommendationGenerator

- (HRETemplateRecommendationGenerator)initWithTemplates:(id)a3
{
  id v5;
  HRETemplateRecommendationGenerator *v6;
  HRETemplateRecommendationGenerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HRETemplateRecommendationGenerator;
  v6 = -[HREStandardAsyncRecommendationSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_templates, a3);

  return v7;
}

- (unint64_t)disablingOptions
{
  return 8;
}

- (id)_filterTemplates:(id)a3 options:(unint64_t)a4
{
  _QWORD v5[4];
  BOOL v6;
  char v7;
  BOOL v8;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__HRETemplateRecommendationGenerator__filterTemplates_options___block_invoke;
  v5[3] = &__block_descriptor_35_e21_B16__0__HRETemplate_8l;
  v6 = (a4 & 2) != 0;
  v7 = a4 & 1;
  v8 = (a4 & 4) != 0;
  objc_msgSend(a3, "na_filter:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL __63__HRETemplateRecommendationGenerator__filterTemplates_options___block_invoke(_BYTE *a1, void *a2)
{
  id v3;
  char isKindOfClass;
  char v5;
  char v6;

  v3 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v5 = objc_opt_isKindOfClass();
  objc_opt_class();
  v6 = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) != 0 && a1[32] || (v5 & 1) != 0 && a1[33] || (v6 & 1) != 0 && a1[34];
}

- (void)setupProcess:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HRETemplateRecommendationGenerator;
  -[HREStandardAsyncRecommendationSource setupProcess:](&v17, sel_setupProcess_, v4);
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v5, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rooms");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v5, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "roomForEntireHome");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v5, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "roomForEntireHome");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v14);

  }
  objc_msgSend(v7, "setRooms:", v10);
  -[HRETemplateRecommendationGenerator templates](self, "templates");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRETemplateRecommendationGenerator _filterTemplates:options:](self, "_filterTemplates:options:", v15, objc_msgSend(v5, "options"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActiveTemplates:", v16);

}

- (Class)generationProcessClass
{
  return (Class)objc_opt_class();
}

+ (id)allAvailableTemplates
{
  if (allAvailableTemplates_onceToken != -1)
    dispatch_once(&allAvailableTemplates_onceToken, &__block_literal_global_4);
  return (id)allAvailableTemplates_templates;
}

void __59__HRETemplateRecommendationGenerator_allAvailableTemplates__block_invoke()
{
  HREGoodNightTemplate *v0;
  HREGoodMorningTemplate *v1;
  HRELeaveHomeTemplate *v2;
  HREAutoArriveHomeTemplate *v3;
  HREAutoLeaveHomeTemplate *v4;
  HREAutoLightsOnUnlockTemplate *v5;
  HRELockWhenDoorClosedTemplate *v6;
  HREMotionSensorLightsTemplate *v7;
  HRELightsAllOffContextActionTemplate *v8;
  HREMediaPauseAllContextActionTemplate *v9;
  uint64_t v10;
  void *v11;
  HREArriveHomeTemplate *v12;
  _QWORD v13[12];

  v13[11] = *MEMORY[0x24BDAC8D0];
  v12 = objc_alloc_init(HREArriveHomeTemplate);
  v13[0] = v12;
  v0 = objc_alloc_init(HREGoodNightTemplate);
  v13[1] = v0;
  v1 = objc_alloc_init(HREGoodMorningTemplate);
  v13[2] = v1;
  v2 = objc_alloc_init(HRELeaveHomeTemplate);
  v13[3] = v2;
  v3 = objc_alloc_init(HREAutoArriveHomeTemplate);
  v13[4] = v3;
  v4 = objc_alloc_init(HREAutoLeaveHomeTemplate);
  v13[5] = v4;
  v5 = objc_alloc_init(HREAutoLightsOnUnlockTemplate);
  v13[6] = v5;
  v6 = objc_alloc_init(HRELockWhenDoorClosedTemplate);
  v13[7] = v6;
  v7 = objc_alloc_init(HREMotionSensorLightsTemplate);
  v13[8] = v7;
  v8 = objc_alloc_init(HRELightsAllOffContextActionTemplate);
  v13[9] = v8;
  v9 = objc_alloc_init(HREMediaPauseAllContextActionTemplate);
  v13[10] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 11);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)allAvailableTemplates_templates;
  allAvailableTemplates_templates = v10;

}

- (NSArray)templates
{
  return self->_templates;
}

- (void)setTemplates:(id)a3
{
  objc_storeStrong((id *)&self->_templates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templates, 0);
}

@end
