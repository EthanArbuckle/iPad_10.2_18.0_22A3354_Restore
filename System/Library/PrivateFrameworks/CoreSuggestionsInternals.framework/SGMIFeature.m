@implementation SGMIFeature

- (SGMIFeature)initWithFeatureName:(int64_t)a3
{
  SGMIFeature *v4;
  SGMIFeature *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SGMIFeature;
  v4 = -[SGMIFeature init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_featureName = a3;
    v4->_featureType = +[SGMIFeature featureTypeForName:](SGMIFeature, "featureTypeForName:", a3);
  }
  return v5;
}

- (SGMIFeature)initWithFeatureName:(int64_t)a3 numberValue:(id)a4
{
  id v7;
  SGMIFeature *v8;
  SGMIFeature *v9;

  v7 = a4;
  v8 = -[SGMIFeature initWithFeatureName:](self, "initWithFeatureName:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_numberValue, a4);

  return v9;
}

- (SGMIFeature)initWithFeatureName:(int64_t)a3 numberArrayValue:(id)a4
{
  id v7;
  SGMIFeature *v8;
  SGMIFeature *v9;

  v7 = a4;
  v8 = -[SGMIFeature initWithFeatureName:](self, "initWithFeatureName:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_numberArrayValue, a4);

  return v9;
}

- (SGMIFeature)initWithFeatureName:(int64_t)a3 stringValue:(id)a4
{
  id v7;
  SGMIFeature *v8;
  SGMIFeature *v9;

  v7 = a4;
  v8 = -[SGMIFeature initWithFeatureName:](self, "initWithFeatureName:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_stringValue, a4);

  return v9;
}

- (SGMIFeature)initWithFeatureName:(int64_t)a3 stringArrayValue:(id)a4
{
  id v7;
  SGMIFeature *v8;
  SGMIFeature *v9;

  v7 = a4;
  v8 = -[SGMIFeature initWithFeatureName:](self, "initWithFeatureName:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_stringArrayValue, a4);

  return v9;
}

- (id)stringArrayRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  id result;
  uint64_t v7;
  _QWORD v8[5];
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  switch(-[SGMIFeature featureType](self, "featureType"))
  {
    case 1:
      -[SGMIFeature numberValue](self, "numberValue");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringValue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    case 2:
      -[SGMIFeature numberArrayValue](self, "numberArrayValue");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __40__SGMIFeature_stringArrayRepresentation__block_invoke;
      v8[3] = &unk_1E7DADF10;
      v8[4] = self;
      objc_msgSend(v3, "_pas_mappedArrayWithTransform:", v8);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3:
      -[SGMIFeature stringValue](self, "stringValue");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v5 = (void *)v7;
LABEL_7:

      goto LABEL_9;
    case 4:
      -[SGMIFeature stringArrayValue](self, "stringArrayValue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      result = v5;
      break;
    default:
      result = MEMORY[0x1E0C9AA60];
      break;
  }
  return result;
}

- (id)description
{
  __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  switch(-[SGMIFeature featureType](self, "featureType"))
  {
    case 0:
      v3 = CFSTR("None");
      break;
    case 1:
      -[SGMIFeature numberValue](self, "numberValue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringValue");
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 2:
      v4 = (void *)objc_opt_new();
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      -[SGMIFeature numberArrayValue](self, "numberArrayValue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v21;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v21 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v9), "stringValue");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v10);

            ++v9;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v7);
      }

      v11 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v4, "_pas_componentsJoinedByString:", CFSTR(", "));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (__CFString *)objc_msgSend(v11, "initWithFormat:", CFSTR("[%@]"), v12);

LABEL_13:
      break;
    case 3:
      -[SGMIFeature stringValue](self, "stringValue");
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      v13 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[SGMIFeature stringArrayValue](self, "stringArrayValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_pas_componentsJoinedByString:", CFSTR(", "));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (__CFString *)objc_msgSend(v13, "initWithFormat:", CFSTR("[%@]"), v15);

      break;
    default:
      v3 = 0;
      break;
  }
  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  +[SGMIFeature prettyName:](SGMIFeature, "prettyName:", -[SGMIFeature featureName](self, "featureName"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("%@: %@"), v17, v3);

  return v18;
}

- (BOOL)BOOLValue
{
  void *v3;
  NSObject *v4;
  void *v5;
  char v6;
  uint8_t v8[16];

  -[SGMIFeature numberValue](self, "numberValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    sgMailIntelligenceLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_fault_impl(&dword_1C3607000, v4, OS_LOG_TYPE_FAULT, "Error accessing BOOLValue. numberValue is nil", v8, 2u);
    }

  }
  -[SGMIFeature numberValue](self, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (float)floatValue
{
  void *v3;
  NSObject *v4;
  void *v5;
  float v6;
  float v7;
  uint8_t v9[16];

  -[SGMIFeature numberValue](self, "numberValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    sgMailIntelligenceLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_1C3607000, v4, OS_LOG_TYPE_FAULT, "Error accessing floatValue. numberValue is nil", v9, 2u);
    }

  }
  -[SGMIFeature numberValue](self, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  return v7;
}

- (double)doubleValue
{
  void *v3;
  NSObject *v4;
  void *v5;
  double v6;
  double v7;
  uint8_t v9[16];

  -[SGMIFeature numberValue](self, "numberValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    sgMailIntelligenceLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_1C3607000, v4, OS_LOG_TYPE_FAULT, "Error accessing doubleValue. numberValue is nil", v9, 2u);
    }

  }
  -[SGMIFeature numberValue](self, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (int)intValue
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  uint8_t v8[16];

  -[SGMIFeature numberValue](self, "numberValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    sgMailIntelligenceLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_fault_impl(&dword_1C3607000, v4, OS_LOG_TYPE_FAULT, "Error accessing intValue. numberValue is nil", v8, 2u);
    }

  }
  -[SGMIFeature numberValue](self, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  return v6;
}

- (int64_t)integerValue
{
  void *v3;
  NSObject *v4;
  void *v5;
  int64_t v6;
  uint8_t v8[16];

  -[SGMIFeature numberValue](self, "numberValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    sgMailIntelligenceLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_fault_impl(&dword_1C3607000, v4, OS_LOG_TYPE_FAULT, "Error accessing integerValue. numberValue is nil", v8, 2u);
    }

  }
  -[SGMIFeature numberValue](self, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  return v6;
}

- (int64_t)featureName
{
  return self->_featureName;
}

- (int64_t)featureType
{
  return self->_featureType;
}

- (NSNumber)numberValue
{
  return self->_numberValue;
}

- (NSArray)numberArrayValue
{
  return self->_numberArrayValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (NSArray)stringArrayValue
{
  return self->_stringArrayValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringArrayValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_numberArrayValue, 0);
  objc_storeStrong((id *)&self->_numberValue, 0);
}

uint64_t __40__SGMIFeature_stringArrayRepresentation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stringValue");
}

+ (int64_t)featureTypeForName:(int64_t)a3
{
  int64_t result;
  int64_t v4;

  result = 0;
  if (a3 <= 1999)
  {
    switch(a3)
    {
      case 1000:
      case 1001:
      case 1002:
      case 1003:
      case 1004:
      case 1005:
      case 1006:
      case 1007:
      case 1008:
LABEL_10:
        result = 1;
        break;
      default:
        switch(a3)
        {
          case 1:
          case 2:
          case 3:
          case 7:
          case 8:
            goto LABEL_10;
          case 4:
          case 5:
          case 6:
            result = 2;
            break;
          default:
            result = a3 == 1100;
            break;
        }
        break;
    }
  }
  else if (a3 <= 2999)
  {
    switch(a3)
    {
      case 2000:
      case 2003:
      case 2010:
      case 2011:
      case 2015:
      case 2016:
        result = 3;
        break;
      case 2001:
      case 2004:
      case 2005:
      case 2006:
      case 2007:
      case 2012:
        result = 4;
        break;
      case 2002:
      case 2008:
      case 2009:
      case 2013:
      case 2014:
        return result;
      default:
        v4 = 3;
        if (a3 != 2102)
          v4 = 0;
        if (a3 == 2101)
          result = 3;
        else
          result = v4;
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 3000:
      case 3001:
      case 3002:
      case 3003:
      case 3004:
      case 3005:
      case 3006:
      case 3007:
      case 3008:
      case 3009:
      case 3010:
      case 3011:
      case 3012:
      case 3013:
      case 3014:
      case 3015:
        goto LABEL_10;
      default:
        return result;
    }
  }
  return result;
}

+ (id)submodeledFeatures
{
  if (submodeledFeatures__pasOnceToken2 != -1)
    dispatch_once(&submodeledFeatures__pasOnceToken2, &__block_literal_global_16833);
  return (id)submodeledFeatures__pasExprOnceResult;
}

+ (id)prettyName:(int64_t)a3
{
  id result;
  __CFString *v4;

  result = CFSTR("None");
  if (a3 <= 1999)
  {
    switch(a3)
    {
      case 1000:
        result = CFSTR("PersonFromSenderProbability");
        break;
      case 1001:
        result = CFSTR("PersonToRecipientsProbability");
        break;
      case 1002:
        result = CFSTR("PersonCCRecipientsProbability");
        break;
      case 1003:
        result = CFSTR("SubjectContentProbability");
        break;
      case 1004:
        result = CFSTR("DomainFromSenderProbability");
        break;
      case 1005:
        result = CFSTR("PersonFromSenderInDyadicConversationProbability");
        break;
      case 1006:
        result = CFSTR("AttachmentHistogramProbability");
        break;
      case 1007:
        result = CFSTR("ListIdProbability");
        break;
      case 1008:
        result = CFSTR("ConversationIdProbability");
        break;
      default:
        switch(a3)
        {
          case 1:
            result = CFSTR("SubjectLength");
            break;
          case 2:
            result = CFSTR("SubjectWordCount");
            break;
          case 3:
            result = CFSTR("SenderIsVIP");
            break;
          case 4:
            result = CFSTR("AttachmentHistogramMedia");
            break;
          case 5:
            result = CFSTR("AttachmentHistogramApplication");
            break;
          case 6:
            result = CFSTR("AttachmentHistogramOthers");
            break;
          case 7:
            result = CFSTR("SenderConnectionScore");
            break;
          case 8:
            result = CFSTR("EmailAgeInDays");
            break;
          default:
            if (a3 == 1100)
              result = CFSTR("PredictedAttachment");
            break;
        }
        break;
    }
  }
  else if (a3 <= 2999)
  {
    switch(a3)
    {
      case 2000:
        result = CFSTR("PrivateSubject");
        break;
      case 2001:
        result = CFSTR("PrivateTokenizedSubject");
        break;
      case 2002:
      case 2008:
      case 2009:
      case 2013:
      case 2014:
        return result;
      case 2003:
        result = CFSTR("PrivateSenderFrom");
        break;
      case 2004:
        result = CFSTR("PrivateSortedToRecipients");
        break;
      case 2005:
        result = CFSTR("PrivateToRecipientsPairs");
        break;
      case 2006:
        result = CFSTR("PrivateSortedCCRecipients");
        break;
      case 2007:
        result = CFSTR("PrivateCCRecipientsPairs");
        break;
      case 2010:
        result = CFSTR("SenderFullEmailDomain");
        break;
      case 2011:
        result = CFSTR("PrivateSenderFromInDyadicConversation");
        break;
      case 2012:
        result = CFSTR("PrivateAttachmentHistogram");
        break;
      case 2015:
        result = CFSTR("PrivateListId");
        break;
      case 2016:
        result = CFSTR("PrivateConversationId");
        break;
      default:
        v4 = CFSTR("PrivateHTMLBodyTextContentLanguageIdentifier");
        if (a3 != 2102)
          v4 = CFSTR("None");
        if (a3 == 2101)
          result = CFSTR("PrivateHTMLBodyTextContent");
        else
          result = v4;
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 3000:
        result = CFSTR("ScrolledToEnd");
        break;
      case 3001:
        result = CFSTR("UserReplied");
        break;
      case 3002:
        result = CFSTR("NumberOfMailsViewedBeforeSinceAvailable");
        break;
      case 3003:
        result = CFSTR("TimeBeforeViewStartSinceAvailable");
        break;
      case 3004:
        result = CFSTR("MessageViewCount");
        break;
      case 3005:
        result = CFSTR("MessageViewMaxDwellTime");
        break;
      case 3006:
        result = CFSTR("MessageViewTotalDwellTime");
        break;
      case 3007:
        result = CFSTR("NumberOfUnreadMessageAtFirstViewTime");
        break;
      case 3008:
        result = CFSTR("NumberOfMoreRecentUnreadMessageAtFirstViewTime");
        break;
      case 3009:
        result = CFSTR("MarkedAsRead");
        break;
      case 3010:
        result = CFSTR("MarkedAsUnread");
        break;
      case 3011:
        result = CFSTR("MailGotFlagged");
        break;
      case 3012:
        result = CFSTR("ReplyDraftStarted");
        break;
      case 3013:
        result = CFSTR("ForwardDraftStarted");
        break;
      case 3014:
        result = CFSTR("MarkedAsJunk");
        break;
      case 3015:
        result = CFSTR("LinkClicked");
        break;
      default:
        return result;
    }
  }
  return result;
}

+ (id)allFeatureNames
{
  return &unk_1E7E10938;
}

+ (id)allFeaturePrettyNames
{
  void *v2;
  void *v3;

  +[SGMIFeature allFeatureNames](SGMIFeature, "allFeatureNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_163_16730);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)prettyNamesReverseMapping
{
  if (prettyNamesReverseMapping__pasOnceToken3 != -1)
    dispatch_once(&prettyNamesReverseMapping__pasOnceToken3, &__block_literal_global_164_16728);
  return (id)prettyNamesReverseMapping__pasExprOnceResult;
}

void __40__SGMIFeature_prettyNamesReverseMapping__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = (void *)objc_opt_new();
  +[SGMIFeature allFeatureNames](SGMIFeature, "allFeatureNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__SGMIFeature_prettyNamesReverseMapping__block_invoke_2;
  v6[3] = &unk_1E7DADEE8;
  v7 = v1;
  v3 = v1;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v6);

  v4 = objc_msgSend(v3, "copy");
  v5 = (void *)prettyNamesReverseMapping__pasExprOnceResult;
  prettyNamesReverseMapping__pasExprOnceResult = v4;

  objc_autoreleasePoolPop(v0);
}

void __40__SGMIFeature_prettyNamesReverseMapping__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  +[SGMIFeature prettyName:](SGMIFeature, "prettyName:", (int)objc_msgSend(v3, "intValue"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

id __36__SGMIFeature_allFeaturePrettyNames__block_invoke(uint64_t a1, void *a2)
{
  return +[SGMIFeature prettyName:](SGMIFeature, "prettyName:", (int)objc_msgSend(a2, "intValue"));
}

void __33__SGMIFeature_submodeledFeatures__block_invoke()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[10];

  v12[9] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = -[SGMIFeatureSubmodelLink initFor:fromUnigram:andBigram:]([SGMIFeatureSubmodelLink alloc], "initFor:fromUnigram:andBigram:", 1000, 2003, 0);
  v2 = -[SGMIFeatureSubmodelLink initFor:fromUnigram:andBigram:]([SGMIFeatureSubmodelLink alloc], "initFor:fromUnigram:andBigram:", 1004, 2010, 0, v1);
  v12[1] = v2;
  v3 = -[SGMIFeatureSubmodelLink initFor:fromUnigram:andBigram:]([SGMIFeatureSubmodelLink alloc], "initFor:fromUnigram:andBigram:", 1003, 2001, 0);
  v12[2] = v3;
  v4 = -[SGMIFeatureSubmodelLink initFor:fromUnigram:andBigram:]([SGMIFeatureSubmodelLink alloc], "initFor:fromUnigram:andBigram:", 1001, 2004, 2005);
  v12[3] = v4;
  v5 = -[SGMIFeatureSubmodelLink initFor:fromUnigram:andBigram:]([SGMIFeatureSubmodelLink alloc], "initFor:fromUnigram:andBigram:", 1002, 2006, 2007);
  v12[4] = v5;
  v6 = -[SGMIFeatureSubmodelLink initFor:fromUnigram:andBigram:]([SGMIFeatureSubmodelLink alloc], "initFor:fromUnigram:andBigram:", 1005, 2011, 0);
  v12[5] = v6;
  v7 = -[SGMIFeatureSubmodelLink initFor:fromUnigram:andBigram:]([SGMIFeatureSubmodelLink alloc], "initFor:fromUnigram:andBigram:", 1006, 2012, 0);
  v12[6] = v7;
  v8 = -[SGMIFeatureSubmodelLink initFor:fromUnigram:andBigram:]([SGMIFeatureSubmodelLink alloc], "initFor:fromUnigram:andBigram:", 1008, 2016, 0);
  v12[7] = v8;
  v9 = -[SGMIFeatureSubmodelLink initFor:fromUnigram:andBigram:]([SGMIFeatureSubmodelLink alloc], "initFor:fromUnigram:andBigram:", 1007, 2015, 0);
  v12[8] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)submodeledFeatures__pasExprOnceResult;
  submodeledFeatures__pasExprOnceResult = v10;

  objc_autoreleasePoolPop(v0);
}

@end
