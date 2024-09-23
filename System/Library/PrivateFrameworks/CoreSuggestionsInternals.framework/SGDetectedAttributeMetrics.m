@implementation SGDetectedAttributeMetrics

- (SGDetectedAttributeMetrics)initWithTracker:(id)a3
{
  id v4;
  SGDetectedAttributeMetrics *v5;
  SGDetectedAttributeMetrics *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SGDetectedAttributeMetrics;
  v5 = -[SGDetectedAttributeMetrics init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SGDetectedAttributeMetrics setPet2Tracker:](v5, "setPet2Tracker:", v4);

  return v6;
}

- (PETEventTracker2)pet2Tracker
{
  return self->_pet2Tracker;
}

- (void)setPet2Tracker:(id)a3
{
  objc_storeStrong((id *)&self->_pet2Tracker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pet2Tracker, 0);
}

+ (id)instance
{
  if (instance_onceToken != -1)
    dispatch_once(&instance_onceToken, &__block_literal_global_3052);
  return (id)instance__instance;
}

+ (void)_recordExtractionEventFromSource:(SGMDocumentType_)a3 foundInSignature:(BOOL)a4 isDDSignature:(BOOL)a5 detailType:(SGMContactDetailType_)a6 outcome:(SGMContactDetailExtractionOutcome_)a7 foundInCNContact:(SGMContactDetailOwner_)a8 modelVersion:(id)a9 isUnlikelyPhone:(BOOL)a10 sigSource:(SGMContactDetailExtractionSignatureSource_)a11
{
  _BOOL8 v14;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v14 = a4;
  v17 = a9;
  v26 = (id)objc_opt_new();
  objc_msgSend(v26, "setSource:", a3.var0);
  objc_msgSend(v26, "setSignature:", v14);
  objc_msgSend(v26, "setDetail:", a6.var0);
  objc_msgSend(v26, "setOutcome:", a7.var0);
  objc_msgSend(v26, "setFoundInSenderCNContact:", a8.var0);
  v18 = objc_msgSend(v17, "unsignedShortValue");

  objc_msgSend(v26, "setExtractionModelVersion:", v18);
  objc_msgSend(v26, "setIsUnlikelyPhone:", a10);
  objc_msgSend(v26, "setExtractionSignatureSource:", LODWORD(a11.var0));
  objc_msgSend(a1, "instance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "pet2Tracker");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trackScalarForMessage:", v26);

  v21 = objc_alloc(MEMORY[0x1E0CB3940]);
  v22 = *MEMORY[0x1E0D19D90];
  objc_msgSend(v26, "key");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("%@.%@"), v22, v23);

  objc_msgSend(v26, "dictionaryRepresentation");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

+ (void)_recordExtractionOutcome:(SGMContactDetailExtractionOutcome_)a3 detailType:(SGMContactDetailType_)a4 fromMessage:(id)a5 foundInSignature:(BOOL)a6 isDDSignature:(BOOL)a7 detailType:(unint64_t)a8 detailValue:(id)a9 modelVersion:(id)a10 isUnlikelyPhone:(BOOL)a11
{
  _BOOL8 v12;
  _BOOL8 v13;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  _BOOL4 v36;
  unint64_t var0;
  unint64_t v38;
  id v40;

  v12 = a7;
  v13 = a6;
  v40 = a5;
  v16 = a9;
  v17 = a10;
  if (!objc_msgSend(v16, "length"))
    goto LABEL_17;
  var0 = a4.var0;
  v38 = a3.var0;
  v18 = *MEMORY[0x1E0D19B78];
  objc_msgSend(v40, "author");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "displayName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {

  }
  else
  {
    objc_msgSend(v40, "author");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handles");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (!v23)
    {
      v25 = 0;
      goto LABEL_11;
    }
  }
  +[SGContactPipelineHelper findContactsForDetailType:andValue:](SGContactPipelineHelper, "findContactsForDetailType:andValue:", a8, v16);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24 && objc_msgSend(v24, "count"))
  {
    objc_msgSend(v40, "author");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "displayName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "author");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handles");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = +[SGContactPipelineHelper personExistsInContacts:name:handle:](SGContactPipelineHelper, "personExistsInContacts:name:handle:", v25, v27, v30);

    v31 = v40;
    v32 = (uint64_t *)MEMORY[0x1E0D19B88];
    if (!v36)
      v32 = (uint64_t *)MEMORY[0x1E0D19B80];
    v18 = *v32;
    goto LABEL_12;
  }
LABEL_11:
  v31 = v40;
LABEL_12:
  v33 = _sgmDocumentTypeOfMessage(v31);
  v34 = (_QWORD *)MEMORY[0x1E0D19B40];
  if (!v12)
    v34 = (_QWORD *)MEMORY[0x1E0D19B48];
  if (!v13)
    v34 = (_QWORD *)MEMORY[0x1E0D19B50];
  LOBYTE(v35) = a11;
  objc_msgSend(a1, "_recordExtractionEventFromSource:foundInSignature:isDDSignature:detailType:outcome:foundInCNContact:modelVersion:isUnlikelyPhone:sigSource:", v33, v13, v12, var0, v38, v18, v17, v35, *v34);

LABEL_17:
}

+ (void)recordExtractionOutcome:(SGMContactDetailExtractionOutcome_)a3 fromMessage:(id)a4 foundInSignature:(BOOL)a5 isDDSignature:(BOOL)a6 detection:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  unsigned int v13;
  uint64_t *v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;

  v7 = a6;
  v8 = a5;
  v22 = a7;
  v12 = a4;
  v13 = objc_msgSend(v22, "type");
  if (v13 > 3)
    v14 = (uint64_t *)MEMORY[0x1E0D19BA0];
  else
    v14 = (uint64_t *)qword_1E7DA8730[v13];
  v15 = *v14;
  v16 = objc_msgSend(v22, "type");
  if (v16 > 3)
    v17 = -1;
  else
    v17 = qword_1C3853548[v16];
  objc_msgSend(v22, "extraction");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "extractionInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "modelVersion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = objc_msgSend(v22, "isUnlikelyPhone");
  objc_msgSend(a1, "_recordExtractionOutcome:detailType:fromMessage:foundInSignature:isDDSignature:detailType:detailValue:modelVersion:isUnlikelyPhone:", a3.var0, v15, v12, v8, v7, v17, v18, v20, v21);

}

+ (void)recordExtractionOutcome:(SGMContactDetailExtractionOutcome_)a3 fromMessage:(id)a4 foundInSignature:(BOOL)a5 isDDSignature:(BOOL)a6 match:(id)a7 modelVersion:(id)a8 isUnlikelyPhone:(BOOL)a9
{
  _BOOL8 v11;
  _BOOL8 v12;
  id v15;
  id v16;
  void *v17;
  void *v18;
  unint64_t var0;
  _BOOL8 v20;
  _BOOL8 v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  unsigned int v27;
  uint64_t *v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;

  v11 = a6;
  v12 = a5;
  v34 = a4;
  v15 = a7;
  v16 = a8;
  objc_msgSend(v15, "valueString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v15, "valueString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = a1;
    var0 = a3.var0;
    v20 = v12;
    v21 = v11;
    v22 = MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v34, "textContent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v15, "valueRange");
    objc_msgSend(v23, "substringWithRange:", v24, v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)v22;
    v11 = v21;
    v12 = v20;
    a3.var0 = var0;
    a1 = v33;
    objc_autoreleasePoolPop(v26);
  }

  v27 = objc_msgSend(v15, "matchType");
  if (v27 > 2)
    v28 = (uint64_t *)MEMORY[0x1E0D19BA0];
  else
    v28 = (uint64_t *)qword_1E7DA8750[v27];
  v29 = *v28;
  v30 = objc_msgSend(v15, "matchType");
  if (v30 >= 3)
    v31 = -1;
  else
    v31 = v30;
  LOBYTE(v32) = a9;
  objc_msgSend(a1, "_recordExtractionOutcome:detailType:fromMessage:foundInSignature:isDDSignature:detailType:detailValue:modelVersion:isUnlikelyPhone:", a3.var0, v29, v34, v12, v11, v31, v18, v16, v32);

}

+ (void)recordExtractionOutcome:(SGMContactDetailExtractionOutcome_)a3 fromMessage:(id)a4 foundInSignature:(BOOL)a5 isDDSignature:(BOOL)a6 match:(id)a7 foundInCNContact:(SGMContactDetailOwner_)a8 modelVersion:(id)a9 isUnlikelyPhone:(BOOL)a10
{
  _BOOL8 v12;
  _BOOL8 v13;
  id v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  id v24;

  v12 = a6;
  v13 = a5;
  v24 = a9;
  v17 = a7;
  v18 = _sgmDocumentTypeOfMessage(a4);
  v19 = objc_msgSend(v17, "matchType");

  if (v19 > 2)
    v20 = (uint64_t *)MEMORY[0x1E0D19BA0];
  else
    v20 = (uint64_t *)qword_1E7DA8750[v19];
  v21 = *v20;
  v22 = (_QWORD *)MEMORY[0x1E0D19B40];
  if (!v12)
    v22 = (_QWORD *)MEMORY[0x1E0D19B48];
  if (!v13)
    v22 = (_QWORD *)MEMORY[0x1E0D19B50];
  LOBYTE(v23) = a10;
  objc_msgSend(a1, "_recordExtractionEventFromSource:foundInSignature:isDDSignature:detailType:outcome:foundInCNContact:modelVersion:isUnlikelyPhone:sigSource:", v18, v13, v12, v21, a3.var0, a8.var0, v24, v23, *v22);

}

+ (void)recordExtractionOutcome:(SGMContactDetailExtractionOutcome_)a3 forDetectionsInMessage:(id)a4 signatureRange:(_NSRange)a5 isDDSignature:(BOOL)a6
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  unsigned int v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  _BOOL4 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  NSRange v29;

  v22 = a6;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(v8, "plainTextDetectedData");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "reverseObjectEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = (_QWORD *)MEMORY[0x1E0D19BA0];
    v13 = *(_QWORD *)v24;
    v14 = *MEMORY[0x1E0D19BA0];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "matchType");
        v18 = v12;
        if (v17 <= 2)
          v18 = (_QWORD *)qword_1E7DA8750[v17];
        if (*v18 != v14)
        {
          v29.location = objc_msgSend(v16, "range");
          LOBYTE(v19) = 0;
          objc_msgSend(a1, "recordExtractionOutcome:fromMessage:foundInSignature:isDDSignature:match:modelVersion:isUnlikelyPhone:", a3.var0, v8, NSIntersectionRange(v29, a5).length != 0, v22, v16, &unk_1E7E0BE40, v19);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

}

+ (void)recordBirthdayExtractionAccuracy:(unsigned __int8)a3 withOffset:(id)a4 withModelVersion:(id)a5 isFromCongratulation:(unsigned __int8)a6 didRegexTrigger:(unsigned __int8)a7 didResponseKitTrigger:(unsigned __int8)a8
{
  int v8;
  int v9;
  int v10;
  int v12;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v12 = a3;
  v22 = a5;
  v14 = a4;
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setDateIsCorrect:", v12 != 0);
  objc_msgSend(v15, "setIsFromCongratulation:", v10 != 0);
  v16 = objc_msgSend(v15, "StringAsOffset:", v14);

  objc_msgSend(v15, "setOffset:", v16);
  objc_msgSend(v15, "setDidRegexTrigger:", v9 != 0);
  if (v22)
    objc_msgSend(v15, "setModelVersion:", objc_msgSend(v22, "unsignedIntValue"));
  objc_msgSend(v15, "setDidResponseKitTrigger:", v8 != 0);
  objc_msgSend(a1, "instance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pet2Tracker");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trackScalarForMessage:", v15);

  v19 = objc_alloc(MEMORY[0x1E0CB3940]);
  v20 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("%@.%@"), *MEMORY[0x1E0D19D90], CFSTR("birthdaySupervision"));
  objc_msgSend(v15, "dictionaryRepresentation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

+ (void)recordSelfIdModelScore:(BOOL)a3 model:(int)a4 supervision:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v16 = (id)objc_opt_new();
  objc_msgSend(v16, "setModel:", v6);
  objc_msgSend(v16, "setResult:", v7);
  objc_msgSend(v16, "setSupervision:", v5);
  objc_msgSend(a1, "instance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pet2Tracker");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trackScalarForMessage:", v16);

  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  v12 = *MEMORY[0x1E0D19D90];
  objc_msgSend(v16, "key");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@.%@"), v12, v13);

  objc_msgSend(v16, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

+ (id)nameForDataDetectorMatch:(id)a3 withValue:(id)a4
{
  id v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = objc_msgSend(a3, "matchType");
  if (v6 == 2)
  {
    SGNormalizeEmailAddress();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 1;
  }
  else
  {
    if (v6)
    {
      v12 = 0;
      goto LABEL_7;
    }
    SGNormalizePhoneNumber();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
  }
  +[SGSqlEntityStore defaultHarvestStore](SGSqlEntityStore, "defaultHarvestStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "kvCacheManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cacheOfType:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "valueForKey:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v12;
}

+ (id)tokenizeMessageContent:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = objc_msgSend(v3, "length");
  v6 = *MEMORY[0x1E0CB2D10];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__SGDetectedAttributeMetrics_tokenizeMessageContent___block_invoke;
  v12[3] = &unk_1E7DA8710;
  v7 = v4;
  v13 = v7;
  v14 = v3;
  v8 = v3;
  objc_msgSend(v8, "enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:", 0, v5, v6, 6, 0, v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

+ (void)recordSentContactDetailWithMessage:(id)a3 match:(id)a4 found:(SGMContactDetailFoundIn_)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unsigned int v33;
  unsigned int *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "senderIsAccountOwner"))
  {
    objc_msgSend(v8, "textContent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "valueRange");
    objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", v11, v12, CFSTR("DDMATCH"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "tokenizeMessageContent:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");
    v16 = (uint64_t *)MEMORY[0x1E0D19C80];
    switch(v15)
    {
      case 0:
        goto LABEL_28;
      case 1:
        goto LABEL_6;
      case 2:
        v16 = (uint64_t *)MEMORY[0x1E0D19C88];
        goto LABEL_6;
      case 3:
      case 4:
        v16 = (uint64_t *)MEMORY[0x1E0D19C90];
        goto LABEL_6;
      default:
        v16 = (uint64_t *)MEMORY[0x1E0D19C98];
LABEL_6:
        v41 = *v16;
        v17 = *MEMORY[0x1E0D19CF8];
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v18 = v14;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        if (!v19)
          goto LABEL_17;
        v20 = v19;
        v38 = a1;
        v39 = v17;
        v37 = v13;
        v21 = *(_QWORD *)v43;
        break;
    }
LABEL_8:
    v22 = 0;
    while (1)
    {
      if (*(_QWORD *)v43 != v21)
        objc_enumerationMutation(v18);
      v23 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v22);
      if ((objc_msgSend(v23, "isEqualToString:", CFSTR("DDMATCH")) & 1) != 0)
        goto LABEL_15;
      if ((+[SGNames attributesForNameWord:](SGNames, "attributesForNameWord:", v23) & 4) != 0)
        break;
      if (v20 == ++v22)
      {
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        if (v20)
          goto LABEL_8;
LABEL_15:
        v13 = v37;
        a1 = v38;
        v17 = v39;
        goto LABEL_17;
      }
    }
    v17 = *MEMORY[0x1E0D19D00];
    v13 = v37;
    a1 = v38;
LABEL_17:

    if (*MEMORY[0x1E0D19B58] == a5.var0)
    {
      v24 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v9, "valueString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25)
      {
        v27 = v25;
      }
      else
      {
        objc_msgSend(v8, "textContent");
        v40 = v17;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v9, "valueRange");
        objc_msgSend(v28, "substringWithRange:", v29, v30);
        v27 = (id)objc_claimAutoreleasedReturnValue();

        v17 = v40;
      }

      objc_msgSend(a1, "nameForDataDetectorMatch:withValue:", v9, v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
        a5.var0 = *MEMORY[0x1E0D19B70];

      objc_autoreleasePoolPop(v24);
    }
    v32 = (void *)objc_opt_new();
    objc_msgSend(v32, "setSource:", *MEMORY[0x1E0D19C18]);
    v33 = objc_msgSend(v9, "matchType");
    if (v33 > 2)
      v34 = (unsigned int *)MEMORY[0x1E0D19BA0];
    else
      v34 = (unsigned int *)qword_1E7DA8750[v33];
    objc_msgSend(v32, "setDetail:", *v34);
    objc_msgSend(v32, "setFoundIn:", a5.var0);
    objc_msgSend(v32, "setHasName:", v17 != 0);
    objc_msgSend(v32, "setTokens:", v41);
    objc_msgSend(a1, "instance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "pet2Tracker");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "trackScalarForMessage:", v32);

LABEL_28:
  }

}

void __53__SGDetectedAttributeMetrics_tokenizeMessageContent___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = *(void **)(a1 + 32);
  v8 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v7, "addObject:", v9);

}

void __38__SGDetectedAttributeMetrics_instance__block_invoke()
{
  SGDetectedAttributeMetrics *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [SGDetectedAttributeMetrics alloc];
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[SGDetectedAttributeMetrics initWithTracker:](v0, "initWithTracker:", v3);
  v2 = (void *)instance__instance;
  instance__instance = v1;

}

@end
