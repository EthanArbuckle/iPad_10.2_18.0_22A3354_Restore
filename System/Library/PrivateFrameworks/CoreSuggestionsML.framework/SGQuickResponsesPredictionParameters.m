@implementation SGQuickResponsesPredictionParameters

- (SGQuickResponsesPredictionParameters)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  const char *v45;
  void *v46;
  void *v47;
  double v48;
  double weightForCategoryMax;
  double weightForCategoryAverage;
  double v51;
  double weightForIndividualModel;
  SGQuickResponsesPredictionParameters *v53;
  double classDiscount;
  double responsesBonus;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  NSString *v61;
  NSString *promptJoiningString;
  NSString *v63;
  NSString *modelTypeName;
  NSString *v65;
  NSString *subModelKeyString;
  objc_super v68;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      goto LABEL_60;
    *(_WORD *)buf = 0;
    v44 = MEMORY[0x24BDACB70];
    v45 = "dictionary";
LABEL_59:
    _os_log_fault_impl(&dword_21ABF4000, v44, OS_LOG_TYPE_FAULT, v45, buf, 2u);
    goto LABEL_60;
  }

  v68.receiver = self;
  v68.super_class = (Class)SGQuickResponsesPredictionParameters;
  self = -[SGQuickResponsesPredictionParameters init](&v68, sel_init);
  if (!self)
    goto LABEL_99;
  objc_msgSend(v5, "numberAssertedForKey:", CFSTR("PERSONALIZATION_IS_DISABLED"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      goto LABEL_60;
    *(_WORD *)buf = 0;
    v44 = MEMORY[0x24BDACB70];
    v45 = "[dictionary numberAssertedForKey:PERSONALIZATION_IS_DISABLED]";
    goto LABEL_59;
  }
  v7 = v6;
  self->_isPersonalizationDisabled = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v5, "numberAssertedForKey:", CFSTR("REPLY_TEXT_IS_RANDOMIZED"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      goto LABEL_60;
    *(_WORD *)buf = 0;
    v44 = MEMORY[0x24BDACB70];
    v45 = "[dictionary numberAssertedForKey:REPLY_TEXT_IS_RANDOMIZED]";
    goto LABEL_59;
  }
  v9 = v8;
  self->_isReplyTextRandomized = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v5, "numberAssertedForKey:", CFSTR("RANKING_AND_RESPONSE_COUNT_IS_PER_CATEGORY"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      goto LABEL_60;
    *(_WORD *)buf = 0;
    v44 = MEMORY[0x24BDACB70];
    v45 = "[dictionary numberAssertedForKey:RANKING_AND_RESPONSE_COUNT_IS_PER_CATEGORY]";
    goto LABEL_59;
  }
  v11 = v10;
  self->_isPerCategory = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v5, "numberAssertedForKey:", CFSTR("RANKING_WEIGHT_CATEGORY_AVERAGE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      goto LABEL_60;
    *(_WORD *)buf = 0;
    v44 = MEMORY[0x24BDACB70];
    v45 = "[dictionary numberAssertedForKey:RANKING_WEIGHT_CATEGORY_AVERAGE]";
    goto LABEL_59;
  }
  v13 = v12;
  objc_msgSend(v12, "doubleValue");
  self->_weightForCategoryAverage = v14;

  objc_msgSend(v5, "numberAssertedForKey:", CFSTR("RANKING_WEIGHT_CATEGORY_MAX"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      goto LABEL_60;
    *(_WORD *)buf = 0;
    v44 = MEMORY[0x24BDACB70];
    v45 = "[dictionary numberAssertedForKey:RANKING_WEIGHT_CATEGORY_MAX]";
    goto LABEL_59;
  }
  v16 = v15;
  objc_msgSend(v15, "doubleValue");
  self->_weightForCategoryMax = v17;

  objc_msgSend(v5, "numberAssertedForKey:", CFSTR("RESPONSE_COUNT_FACTOR_CLASS_DISCOUNT"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      goto LABEL_60;
    *(_WORD *)buf = 0;
    v44 = MEMORY[0x24BDACB70];
    v45 = "[dictionary numberAssertedForKey:RESPONSE_COUNT_FACTOR_CLASS_DISCOUNT]";
    goto LABEL_59;
  }
  v19 = v18;
  objc_msgSend(v18, "doubleValue");
  self->_classDiscount = v20;

  objc_msgSend(v5, "numberAssertedForKey:", CFSTR("RESPONSE_COUNT_FACTOR_RESPONSE_BONUS"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      goto LABEL_60;
    *(_WORD *)buf = 0;
    v44 = MEMORY[0x24BDACB70];
    v45 = "[dictionary numberAssertedForKey:RESPONSE_COUNT_FACTOR_RESPONSE_BONUS]";
    goto LABEL_59;
  }
  v22 = v21;
  objc_msgSend(v21, "doubleValue");
  self->_responsesBonus = v23;

  objc_msgSend(v5, "numberAssertedForKey:", CFSTR("MINIMUM_TO_SHOW_THRESHOLD"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      goto LABEL_60;
    *(_WORD *)buf = 0;
    v44 = MEMORY[0x24BDACB70];
    v45 = "[dictionary numberAssertedForKey:MINIMUM_TO_SHOW_THRESHOLD]";
    goto LABEL_59;
  }
  v25 = v24;
  objc_msgSend(v24, "doubleValue");
  self->_minToShowThreshold = v26;

  objc_msgSend(v5, "numberAssertedForKey:", CFSTR("DEFAULT_RESPONSES_TO_RETURN"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      goto LABEL_60;
    *(_WORD *)buf = 0;
    v44 = MEMORY[0x24BDACB70];
    v45 = "[dictionary numberAssertedForKey:DEFAULT_RESPONSES_TO_RETURN]";
    goto LABEL_59;
  }
  v28 = v27;
  self->_defaultResponsesToReturn = objc_msgSend(v27, "unsignedIntegerValue");

  objc_msgSend(v5, "numberAssertedForKey:", CFSTR("RESPONSES_AT_TOP_WITH_MORE_DIVERSITY"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      goto LABEL_60;
    *(_WORD *)buf = 0;
    v44 = MEMORY[0x24BDACB70];
    v45 = "[dictionary numberAssertedForKey:RESPONSES_AT_TOP_WITH_MORE_DIVERSITY]";
    goto LABEL_59;
  }
  v30 = v29;
  self->_responsesToShowAtTopForDiversity = objc_msgSend(v29, "unsignedIntegerValue");

  v31 = 1.0 - self->_weightForCategoryAverage - self->_weightForCategoryMax;
  if (v31 < 0.0)
    v31 = 0.0;
  self->_weightForIndividualModel = v31;
  objc_msgSend(v5, "numberAssertedForKey:", CFSTR("PERSONALIZATION_SELECTED_PSEUDOCOUNT_PER_SEMANTIC_CLASS"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v32)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      goto LABEL_60;
    *(_WORD *)buf = 0;
    v44 = MEMORY[0x24BDACB70];
    v45 = "[dictionary numberAssertedForKey:PERSONALIZATION_SELECTED_PSEUDOCOUNT_PER_SEMANTIC_CLASS]";
    goto LABEL_59;
  }
  v33 = v32;
  objc_msgSend(v32, "doubleValue");
  self->_personalizationSelectedPseudocountPerSemanticClass = v34;

  objc_msgSend(v5, "numberAssertedForKey:", CFSTR("PERSONALIZATION_DISPLAYED_PSEUDOCOUNT"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v35)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      goto LABEL_60;
    *(_WORD *)buf = 0;
    v44 = MEMORY[0x24BDACB70];
    v45 = "[dictionary numberAssertedForKey:PERSONALIZATION_DISPLAYED_PSEUDOCOUNT]";
    goto LABEL_59;
  }
  v36 = v35;
  objc_msgSend(v35, "doubleValue");
  self->_personalizationDisplayedPseudocount = v37;

  objc_msgSend(v5, "numberAssertedForKey:", CFSTR("PERSONALIZATION_EXPLORATION_FACTOR"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v38)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      goto LABEL_60;
    *(_WORD *)buf = 0;
    v44 = MEMORY[0x24BDACB70];
    v45 = "[dictionary numberAssertedForKey:PERSONALIZATION_EXPLORATION_FACTOR]";
    goto LABEL_59;
  }
  v39 = v38;
  objc_msgSend(v38, "doubleValue");
  self->_personalizationExplorationFactor = v40;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DYNAMIC_LABELS_ENABLED"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  self->_dynamicLabelsEnabled = objc_msgSend(v41, "BOOLValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FILTER_NONCONFIDENT"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FILTER_NONCONFIDENT"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    self->_filterNonConfident = objc_msgSend(v43, "BOOLValue");

  }
  else
  {
    self->_filterNonConfident = objc_msgSend(MEMORY[0x24BDBD1C8], "BOOLValue");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HAS_NEGATIVE_CLASS"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hasNegativeClass = objc_msgSend(v46, "BOOLValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NEGATIVE_CLASS_MAXIMUM_TO_PREDICT"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "doubleValue");
  self->_negativeClassMaximumToPredict = v48;

  weightForCategoryAverage = self->_weightForCategoryAverage;
  weightForCategoryMax = self->_weightForCategoryMax;
  if (weightForCategoryAverage + weightForCategoryMax >= 1.000001)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v44 = MEMORY[0x24BDACB70];
      v45 = "_weightForCategoryAverage + _weightForCategoryMax < 1 + EPSILON_OF_DOUBLE_COMPARISON";
      goto LABEL_59;
    }
    goto LABEL_60;
  }
  v51 = 1.0 - weightForCategoryAverage - weightForCategoryMax;
  weightForIndividualModel = self->_weightForIndividualModel;
  if (vabdd_f64(v51, weightForIndividualModel) >= 0.000001)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v44 = MEMORY[0x24BDACB70];
      v45 = "fabs(1 - _weightForCategoryAverage - _weightForCategoryMax - _weightForIndividualModel) < EPSILON_OF_DOUBLE_COMPARISON";
      goto LABEL_59;
    }
    goto LABEL_60;
  }
  if (!self->_isPerCategory || fabs(v51) < 0.000001)
  {
    if (weightForCategoryAverage < 0.0 || weightForCategoryAverage > 1.0)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        goto LABEL_60;
      *(_WORD *)buf = 0;
      v44 = MEMORY[0x24BDACB70];
      v45 = "0 <= _weightForCategoryAverage && _weightForCategoryAverage <= 1";
      goto LABEL_59;
    }
    if (weightForCategoryMax < 0.0 || weightForCategoryMax > 1.0)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        goto LABEL_60;
      *(_WORD *)buf = 0;
      v44 = MEMORY[0x24BDACB70];
      v45 = "0 <= _weightForCategoryMax && _weightForCategoryMax <= 1";
      goto LABEL_59;
    }
    if (weightForIndividualModel < 0.0 || weightForIndividualModel > 1.0)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        goto LABEL_60;
      *(_WORD *)buf = 0;
      v44 = MEMORY[0x24BDACB70];
      v45 = "0 <= _weightForIndividualModel && _weightForIndividualModel <= 1";
      goto LABEL_59;
    }
    classDiscount = self->_classDiscount;
    if (classDiscount < 0.0 || classDiscount > 1.0)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        goto LABEL_60;
      *(_WORD *)buf = 0;
      v44 = MEMORY[0x24BDACB70];
      v45 = "0 <= _classDiscount && _classDiscount <= 1";
      goto LABEL_59;
    }
    responsesBonus = self->_responsesBonus;
    if (responsesBonus < 0.0 || responsesBonus > 1.0)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        goto LABEL_60;
      *(_WORD *)buf = 0;
      v44 = MEMORY[0x24BDACB70];
      v45 = "0 <= _responsesBonus && _responsesBonus <= 1";
      goto LABEL_59;
    }
    if (self->_personalizationSelectedPseudocountPerSemanticClass > self->_personalizationDisplayedPseudocount)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        goto LABEL_60;
      *(_WORD *)buf = 0;
      v44 = MEMORY[0x24BDACB70];
      v45 = "_personalizationSelectedPseudocountPerSemanticClass <= _personalizationDisplayedPseudocount";
      goto LABEL_59;
    }
    objc_msgSend(v5, "numberAssertedForKey:", CFSTR("MAX_PROMPT_LENGTH"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v56)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        goto LABEL_60;
      *(_WORD *)buf = 0;
      v44 = MEMORY[0x24BDACB70];
      v45 = "[dictionary numberAssertedForKey:MAX_PROMPT_LENGTH]";
      goto LABEL_59;
    }
    v57 = v56;
    self->_maxPromptLength = objc_msgSend(v56, "integerValue");

    objc_msgSend(v5, "numberAssertedForKey:", CFSTR("MAX_PROMPT_WINDOW_SECONDS"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v58)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        goto LABEL_60;
      *(_WORD *)buf = 0;
      v44 = MEMORY[0x24BDACB70];
      v45 = "[dictionary numberAssertedForKey:MAX_PROMPT_WINDOW_SECONDS]";
      goto LABEL_59;
    }
    v59 = v58;
    objc_msgSend(v58, "doubleValue");
    self->_maxPromptWindowSeconds = v60;

    if (self->_maxPromptWindowSeconds < 0.0)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        goto LABEL_60;
      *(_WORD *)buf = 0;
      v44 = MEMORY[0x24BDACB70];
      v45 = "0 <= _maxPromptWindowSeconds";
      goto LABEL_59;
    }
    objc_msgSend(v5, "stringAssertedForKey:", CFSTR("PROMPT_JOINING_STRING"));
    v61 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (!v61)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        goto LABEL_60;
      *(_WORD *)buf = 0;
      v44 = MEMORY[0x24BDACB70];
      v45 = "[dictionary stringAssertedForKey:PROMPT_JOINING_STRING]";
      goto LABEL_59;
    }
    promptJoiningString = self->_promptJoiningString;
    self->_promptJoiningString = v61;

    if (!-[NSString length](self->_promptJoiningString, "length"))
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        goto LABEL_60;
      *(_WORD *)buf = 0;
      v44 = MEMORY[0x24BDACB70];
      v45 = "_promptJoiningString.length";
      goto LABEL_59;
    }
    +[SGQuickResponsesPredictionParameters _modelTypeNameForDictionary:](SGQuickResponsesPredictionParameters, "_modelTypeNameForDictionary:", v5);
    v63 = (NSString *)objc_claimAutoreleasedReturnValue();
    modelTypeName = self->_modelTypeName;
    self->_modelTypeName = v63;

    +[SGQuickResponsesPredictionParameters _subModelKeyStringForDictionary:](SGQuickResponsesPredictionParameters, "_subModelKeyStringForDictionary:", v5);
    v65 = (NSString *)objc_claimAutoreleasedReturnValue();
    subModelKeyString = self->_subModelKeyString;
    self->_subModelKeyString = v65;

    if (!-[NSString isEqualToString:](self->_modelTypeName, "isEqualToString:", CFSTR("quickResponsesEspressoClassifierMultiLabel"))&& !-[NSString isEqualToString:](self->_modelTypeName, "isEqualToString:", CFSTR("quickResponsesBinaryLogisticMultiLabel")))
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        goto LABEL_60;
      *(_WORD *)buf = 0;
      v44 = MEMORY[0x24BDACB70];
      v45 = "[_modelTypeName isEqualToString:SG_QUICK_RESPONSES_MULTICLASS_ESPRESSO_CLASSIFIER] || [_modelTypeName isEqua"
            "lToString:SG_QUICK_RESPONSES_BINARY_LOGISTIC_MULTI_LABEL]";
      goto LABEL_59;
    }
    if (-[NSString isEqualToString:](self->_modelTypeName, "isEqualToString:", CFSTR("quickResponsesEspressoClassifierMultiLabel"))&& !-[NSString length](self->_subModelKeyString, "length"))
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        goto LABEL_60;
      *(_WORD *)buf = 0;
      v44 = MEMORY[0x24BDACB70];
      v45 = "!([_modelTypeName isEqualToString:SG_QUICK_RESPONSES_MULTICLASS_ESPRESSO_CLASSIFIER] && !_subModelKeyString.length)";
      goto LABEL_59;
    }
LABEL_99:
    self = self;
    v53 = self;
    goto LABEL_100;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    v44 = MEMORY[0x24BDACB70];
    v45 = "!_isPerCategory || fabs(1 - _weightForCategoryAverage - _weightForCategoryMax) < EPSILON_OF_DOUBLE_COMPARISON";
    goto LABEL_59;
  }
LABEL_60:
  v53 = 0;
LABEL_100:

  return v53;
}

- (BOOL)isPersonalizationDisabled
{
  return self->_isPersonalizationDisabled;
}

- (BOOL)isReplyTextRandomized
{
  return self->_isReplyTextRandomized;
}

- (BOOL)isPerCategory
{
  return self->_isPerCategory;
}

- (double)weightForCategoryAverage
{
  return self->_weightForCategoryAverage;
}

- (double)weightForCategoryMax
{
  return self->_weightForCategoryMax;
}

- (double)weightForIndividualModel
{
  return self->_weightForIndividualModel;
}

- (double)classDiscount
{
  return self->_classDiscount;
}

- (double)responsesBonus
{
  return self->_responsesBonus;
}

- (double)minToShowThreshold
{
  return self->_minToShowThreshold;
}

- (unint64_t)defaultResponsesToReturn
{
  return self->_defaultResponsesToReturn;
}

- (unint64_t)responsesToShowAtTopForDiversity
{
  return self->_responsesToShowAtTopForDiversity;
}

- (double)personalizationExplorationFactor
{
  return self->_personalizationExplorationFactor;
}

- (double)personalizationDisplayedPseudocount
{
  return self->_personalizationDisplayedPseudocount;
}

- (double)personalizationSelectedPseudocountPerSemanticClass
{
  return self->_personalizationSelectedPseudocountPerSemanticClass;
}

- (unint64_t)maxPromptLength
{
  return self->_maxPromptLength;
}

- (double)maxPromptWindowSeconds
{
  return self->_maxPromptWindowSeconds;
}

- (NSString)promptJoiningString
{
  return self->_promptJoiningString;
}

- (NSString)modelTypeName
{
  return self->_modelTypeName;
}

- (NSString)subModelKeyString
{
  return self->_subModelKeyString;
}

- (BOOL)modelFeaturizationFormatOptionIsDense
{
  return self->_modelFeaturizationFormatOptionIsDense;
}

- (BOOL)dynamicLabelsEnabled
{
  return self->_dynamicLabelsEnabled;
}

- (BOOL)hasNegativeClass
{
  return self->_hasNegativeClass;
}

- (double)negativeClassMaximumToPredict
{
  return self->_negativeClassMaximumToPredict;
}

- (BOOL)filterNonConfident
{
  return self->_filterNonConfident;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subModelKeyString, 0);
  objc_storeStrong((id *)&self->_modelTypeName, 0);
  objc_storeStrong((id *)&self->_promptJoiningString, 0);
}

+ (id)_modelTypeNameForDictionary:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MODEL_TYPE_NAME"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("quickResponsesBinaryLogisticMultiLabel");
  v5 = v3;

  return v5;
}

+ (id)_subModelKeyStringForDictionary:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SUB_MODEL_KEY_STRING"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &stru_24DDC5810;
  v5 = v3;

  return v5;
}

@end
