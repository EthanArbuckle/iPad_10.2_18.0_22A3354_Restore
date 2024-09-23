@implementation HRERecommendationEmptyTriggerBuilderContext

- (HRERecommendationEmptyTriggerBuilderContext)init
{
  HRERecommendationEmptyTriggerBuilderContext *v2;
  HRERecommendationEmptyTriggerBuilderContext *v3;
  uint64_t v4;
  NSString *testActionsInstructionDescription;
  uint64_t v6;
  NSString *serviceActionsInstructionDescription;
  uint64_t v8;
  NSString *actionEditorInstructionsDescription;
  uint64_t v10;
  NSString *triggerContextAwareTitle;
  uint64_t v12;
  NSString *deleteInstructionDescription;
  uint64_t v14;
  NSString *deleteConfirmationAlertTitle;
  uint64_t v16;
  NSString *deleteConfirmationAlertMessage;
  uint64_t v18;
  NSString *doneButtonTitle;
  uint64_t v20;
  NSSet *unsupportedTriggers;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)HRERecommendationEmptyTriggerBuilderContext;
  v2 = -[HRERecommendationEmptyTriggerBuilderContext init](&v23, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->allowDurationEditing = 0;
    __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke();
    v4 = objc_claimAutoreleasedReturnValue();
    testActionsInstructionDescription = v3->testActionsInstructionDescription;
    v3->testActionsInstructionDescription = (NSString *)v4;

    __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_3();
    v6 = objc_claimAutoreleasedReturnValue();
    serviceActionsInstructionDescription = v3->serviceActionsInstructionDescription;
    v3->serviceActionsInstructionDescription = (NSString *)v6;

    __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_5();
    v8 = objc_claimAutoreleasedReturnValue();
    actionEditorInstructionsDescription = v3->actionEditorInstructionsDescription;
    v3->actionEditorInstructionsDescription = (NSString *)v8;

    __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_7();
    v10 = objc_claimAutoreleasedReturnValue();
    triggerContextAwareTitle = v3->triggerContextAwareTitle;
    v3->triggerContextAwareTitle = (NSString *)v10;

    __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_9();
    v12 = objc_claimAutoreleasedReturnValue();
    deleteInstructionDescription = v3->deleteInstructionDescription;
    v3->deleteInstructionDescription = (NSString *)v12;

    __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_11();
    v14 = objc_claimAutoreleasedReturnValue();
    deleteConfirmationAlertTitle = v3->deleteConfirmationAlertTitle;
    v3->deleteConfirmationAlertTitle = (NSString *)v14;

    __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_13();
    v16 = objc_claimAutoreleasedReturnValue();
    deleteConfirmationAlertMessage = v3->deleteConfirmationAlertMessage;
    v3->deleteConfirmationAlertMessage = (NSString *)v16;

    __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_15();
    v18 = objc_claimAutoreleasedReturnValue();
    doneButtonTitle = v3->doneButtonTitle;
    v3->doneButtonTitle = (NSString *)v18;

    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v20 = objc_claimAutoreleasedReturnValue();
    unsupportedTriggers = v3->unsupportedTriggers;
    v3->unsupportedTriggers = (NSSet *)v20;

  }
  return v3;
}

id __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke()
{
  if (HREServiceTypeAll_block_invoke_na_once_token_376 != -1)
    dispatch_once(&HREServiceTypeAll_block_invoke_na_once_token_376, &__block_literal_global_264);
  return (id)HREServiceTypeAll_block_invoke_na_once_object_376;
}

void __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_2()
{
  void *v0;

  v0 = (void *)HREServiceTypeAll_block_invoke_na_once_object_376;
  HREServiceTypeAll_block_invoke_na_once_object_376 = (uint64_t)&stru_24F219000;

}

id __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_3()
{
  if (HREServiceTypeAll_block_invoke_2_na_once_token_377 != -1)
    dispatch_once(&HREServiceTypeAll_block_invoke_2_na_once_token_377, &__block_literal_global_268_0);
  return (id)HREServiceTypeAll_block_invoke_2_na_once_object_377;
}

void __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_4()
{
  void *v0;

  v0 = (void *)HREServiceTypeAll_block_invoke_2_na_once_object_377;
  HREServiceTypeAll_block_invoke_2_na_once_object_377 = (uint64_t)&stru_24F219000;

}

id __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_5()
{
  if (HREServiceTypeAll_block_invoke_3_na_once_token_378 != -1)
    dispatch_once(&HREServiceTypeAll_block_invoke_3_na_once_token_378, &__block_literal_global_270);
  return (id)HREServiceTypeAll_block_invoke_3_na_once_object_378;
}

void __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_6()
{
  void *v0;

  v0 = (void *)HREServiceTypeAll_block_invoke_3_na_once_object_378;
  HREServiceTypeAll_block_invoke_3_na_once_object_378 = (uint64_t)&stru_24F219000;

}

id __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_7()
{
  if (HREServiceTypeAll_block_invoke_4_na_once_token_379 != -1)
    dispatch_once(&HREServiceTypeAll_block_invoke_4_na_once_token_379, &__block_literal_global_272);
  return (id)HREServiceTypeAll_block_invoke_4_na_once_object_379;
}

void __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_8()
{
  void *v0;

  v0 = (void *)HREServiceTypeAll_block_invoke_4_na_once_object_379;
  HREServiceTypeAll_block_invoke_4_na_once_object_379 = (uint64_t)&stru_24F219000;

}

id __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_9()
{
  if (HREServiceTypeAll_block_invoke_5_na_once_token_380 != -1)
    dispatch_once(&HREServiceTypeAll_block_invoke_5_na_once_token_380, &__block_literal_global_274_0);
  return (id)HREServiceTypeAll_block_invoke_5_na_once_object_380;
}

void __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_10()
{
  void *v0;

  v0 = (void *)HREServiceTypeAll_block_invoke_5_na_once_object_380;
  HREServiceTypeAll_block_invoke_5_na_once_object_380 = (uint64_t)&stru_24F219000;

}

id __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_11()
{
  if (HREServiceTypeAll_block_invoke_6_na_once_token_381 != -1)
    dispatch_once(&HREServiceTypeAll_block_invoke_6_na_once_token_381, &__block_literal_global_276);
  return (id)HREServiceTypeAll_block_invoke_6_na_once_object_381;
}

void __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_12()
{
  void *v0;

  v0 = (void *)HREServiceTypeAll_block_invoke_6_na_once_object_381;
  HREServiceTypeAll_block_invoke_6_na_once_object_381 = (uint64_t)&stru_24F219000;

}

id __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_13()
{
  if (HREServiceTypeAll_block_invoke_7_na_once_token_382 != -1)
    dispatch_once(&HREServiceTypeAll_block_invoke_7_na_once_token_382, &__block_literal_global_278);
  return (id)HREServiceTypeAll_block_invoke_7_na_once_object_382;
}

void __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_14()
{
  void *v0;

  v0 = (void *)HREServiceTypeAll_block_invoke_7_na_once_object_382;
  HREServiceTypeAll_block_invoke_7_na_once_object_382 = (uint64_t)&stru_24F219000;

}

id __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_15()
{
  if (HREServiceTypeAll_block_invoke_8_na_once_token_383 != -1)
    dispatch_once(&HREServiceTypeAll_block_invoke_8_na_once_token_383, &__block_literal_global_280);
  return (id)HREServiceTypeAll_block_invoke_8_na_once_object_383;
}

void __51__HRERecommendationEmptyTriggerBuilderContext_init__block_invoke_16()
{
  void *v0;

  v0 = (void *)HREServiceTypeAll_block_invoke_8_na_once_object_383;
  HREServiceTypeAll_block_invoke_8_na_once_object_383 = (uint64_t)&stru_24F219000;

}

- (BOOL)allowDurationEditing
{
  return self->allowDurationEditing;
}

- (BOOL)allowConvertToShortcut
{
  return self->allowConvertToShortcut;
}

- (BOOL)filtersEmptyActionSets
{
  return self->filtersEmptyActionSets;
}

- (NSString)serviceActionsInstructionDescription
{
  return self->serviceActionsInstructionDescription;
}

- (BOOL)showActionSetsInstructions
{
  return self->showActionSetsInstructions;
}

- (BOOL)showConditionTriggers
{
  return self->showConditionTriggers;
}

- (BOOL)showTriggerDeleteButton
{
  return self->showTriggerDeleteButton;
}

- (BOOL)showTriggerEnableSwitch
{
  return self->showTriggerEnableSwitch;
}

- (BOOL)showTriggerSummary
{
  return self->showTriggerSummary;
}

- (NSString)testActionsInstructionDescription
{
  return self->testActionsInstructionDescription;
}

- (NSString)actionEditorInstructionsDescription
{
  return self->actionEditorInstructionsDescription;
}

- (NSString)deleteConfirmationAlertMessage
{
  return self->deleteConfirmationAlertMessage;
}

- (NSString)deleteConfirmationAlertTitle
{
  return self->deleteConfirmationAlertTitle;
}

- (NSString)deleteInstructionDescription
{
  return self->deleteInstructionDescription;
}

- (NSString)doneButtonTitle
{
  return self->doneButtonTitle;
}

- (NSString)triggerContextAwareTitle
{
  return self->triggerContextAwareTitle;
}

- (NSSet)unsupportedTriggers
{
  return self->unsupportedTriggers;
}

- (HFItem)suggestionItem
{
  return self->suggestionItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->suggestionItem, 0);
  objc_storeStrong((id *)&self->unsupportedTriggers, 0);
  objc_storeStrong((id *)&self->triggerContextAwareTitle, 0);
  objc_storeStrong((id *)&self->doneButtonTitle, 0);
  objc_storeStrong((id *)&self->deleteInstructionDescription, 0);
  objc_storeStrong((id *)&self->deleteConfirmationAlertTitle, 0);
  objc_storeStrong((id *)&self->deleteConfirmationAlertMessage, 0);
  objc_storeStrong((id *)&self->actionEditorInstructionsDescription, 0);
  objc_storeStrong((id *)&self->testActionsInstructionDescription, 0);
  objc_storeStrong((id *)&self->serviceActionsInstructionDescription, 0);
}

@end
