@implementation SGReminderMessage

- (SGReminderMessage)initWithMessage:(id)a3 entity:(id)a4 enrichedTaggedCharacterRanges:(id)a5 modelOutput:(id)a6
{
  id v11;
  id v12;
  SGReminderMessage *v13;
  SGReminderMessage *v14;
  uint64_t v15;
  NSArray *plainTextDetectedData;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SGReminderMessage;
  v13 = -[SGExtractionDocument initWithEnrichedTaggedCharacterRanges:modelOutput:](&v18, sel_initWithEnrichedTaggedCharacterRanges_modelOutput_, a5, a6);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_message, a3);
    objc_storeStrong((id *)&v14->_entity, a4);
    objc_msgSend(v11, "plainTextDetectedData");
    v15 = objc_claimAutoreleasedReturnValue();
    plainTextDetectedData = v14->_plainTextDetectedData;
    v14->_plainTextDetectedData = (NSArray *)v15;

  }
  return v14;
}

- (SGReminderMessage)initWithMessage:(id)a3 plainTextDetectedData:(id)a4 enrichedTaggedCharacterRanges:(id)a5 modelOutput:(id)a6
{
  id v11;
  id v12;
  SGReminderMessage *v13;
  SGReminderMessage *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SGReminderMessage;
  v13 = -[SGExtractionDocument initWithEnrichedTaggedCharacterRanges:modelOutput:](&v16, sel_initWithEnrichedTaggedCharacterRanges_modelOutput_, a5, a6);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_message, a3);
    objc_storeStrong((id *)&v14->_plainTextDetectedData, a4);
  }

  return v14;
}

- (BOOL)isConfirmation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  uint64_t v13;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!-[SGMessage isSent](self->_message, "isSent"))
    return 0;
  -[SGExtractionDocument modelOutput](self, "modelOutput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[SGExtractionDocument modelOutput](self, "modelOutput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("polarity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v5, "count");

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[SGExtractionDocument modelOutput](self, "modelOutput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("polarity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(CFSTR("POLARITY__COMMITMENT"), "isEqualToString:", v13))
        {
          v11 = v11 + 1.0;
        }
        else if ((objc_msgSend(CFSTR("POLARITY__REJECTION"), "isEqualToString:", v13) & 1) != 0
               || (objc_msgSend(CFSTR("POLARITY__DONE"), "isEqualToString:", v13) & 1) != 0)
        {
          goto LABEL_20;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);

    if (v11 > 0.0 && v23 != 0)
      return 1;
  }
  else
  {
LABEL_20:

  }
  +[SGReminderExtractionModel sharedInstance](SGReminderExtractionModel, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reminderOverrides");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
    goto LABEL_24;
  -[SGMessage textContent](self->_message, "textContent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  CFCharacterSetGetPredefined(kCFCharacterSetPunctuation);
  _PASRemoveCharacterSet();
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v19, "localizedLowercaseString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("confirmation"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = objc_msgSend(v21, "containsObject:", v20);

  if ((v19 & 1) != 0)
    v15 = 1;
  else
LABEL_24:
    v15 = 0;

  return v15;
}

- (BOOL)isRejection
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  uint64_t v15;
  char v16;
  char v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = -[SGMessage isSent](self->_message, "isSent");
  if (v3)
  {
    -[SGExtractionDocument modelOutput](self, "modelOutput");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[SGExtractionDocument modelOutput](self, "modelOutput");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("polarity"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      -[SGExtractionDocument modelOutput](self, "modelOutput", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("polarity"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v20;
        v13 = 0.0;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v9);
            v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
            if ((objc_msgSend(CFSTR("POLARITY__REJECTION"), "isEqualToString:", v15) & 1) != 0
              || objc_msgSend(CFSTR("POLARITY__DONE"), "isEqualToString:", v15))
            {
              v13 = v13 + 1.0;
            }
            else if ((objc_msgSend(CFSTR("POLARITY__COMMITMENT"), "isEqualToString:", v15) & 1) != 0)
            {
              v16 = 0;
              goto LABEL_18;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v11)
            continue;
          break;
        }
        v16 = 1;
      }
      else
      {
        v16 = 1;
        v13 = 0.0;
      }
LABEL_18:

      if (v7)
        v17 = v16;
      else
        v17 = 0;
      if (v13 > 0.0)
        LOBYTE(v3) = v17;
      else
        LOBYTE(v3) = 0;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)isProposal
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!-[SGMessage isSent](self->_message, "isSent"))
  {
    -[SGExtractionDocument modelOutput](self, "modelOutput");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[SGExtractionDocument modelOutput](self, "modelOutput");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("polarity"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      -[SGExtractionDocument modelOutput](self, "modelOutput", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("polarity"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        v12 = 0.0;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
            if (objc_msgSend(CFSTR("POLARITY__REMINDER_STATEMENT"), "isEqualToString:", v14))
            {
              v12 = v12 + 1.0;
            }
            else if ((objc_msgSend(CFSTR("POLARITY__REJECTION"), "isEqualToString:", v14) & 1) != 0)
            {
              goto LABEL_16;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v10);

        if (v12 > 0.0 && v12 / (double)v6 > 0.1)
          return 1;
      }
      else
      {
LABEL_16:

      }
    }
  }
  return 0;
}

- (BOOL)isTriggerOptional
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[SGMessage isSent](self->_message, "isSent") || -[SGReminderMessage hasTrigger](self, "hasTrigger"))
    return 0;
  v4 = (void *)objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "triggerOptionalTokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGReminderMessage message](self, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "tokensMatchedInContent:content:", v5, v7);

  return (char)v4;
}

- (id)detectedTitleForLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[SGExtractionDocument modelOutput](self, "modelOutput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGExtractionDocument enrichedTaggedCharacterRanges](self, "enrichedTaggedCharacterRanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMessage textContent](self->_message, "textContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "detectedTitleInModelOutput:enrichedTaggedCharacterRanges:textContent:language:", v6, v7, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (objc_msgSend((id)objc_opt_class(), "excludedContent:", v9) & 1) != 0)
    v10 = 0;
  else
    v10 = v9;

  return v10;
}

- (id)dueDateDataDetectorMatches
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SGExtractionDocument modelOutput](self, "modelOutput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SGReminderMessage _labelTokenIndexesForOutputName:label:](self, "_labelTokenIndexesForOutputName:label:", CFSTR("trigger"), CFSTR("DUE_TIME_TRIGGER__DATETIME"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGExtractionDocument dataDetectorMatchesForTokenIndexes:dataDetectorMatches:allowDatesInPast:allowTimeOffset:](self, "dataDetectorMatchesForTokenIndexes:dataDetectorMatches:allowDatesInPast:allowTimeOffset:", v4, self->_plainTextDetectedData, 1, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0D81638]);
    v5 = (void *)objc_msgSend(v6, "initWithFirst:second:", MEMORY[0x1E0C9AA60], 0);
  }
  return v5;
}

- (id)detectedDueDateComponents
{
  void *v2;
  void *v3;
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
  -[SGReminderMessage dueDateDataDetectorMatches](self, "dueDateDataDetectorMatches");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v2, "first", 0);
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
        v10 = (void *)objc_opt_class();
        objc_msgSend(v2, "second");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dateComponentsFromDataDetectorMatch:inferDates:approximateTime:partialDate:useEndForDurations:", v9, objc_msgSend(v11, "BOOLValue") ^ 1, 1, 1, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          objc_msgSend(v3, "addObject:", v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)dueLocation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v22;
  SGReminderDueLocation *v23;

  -[SGExtractionDocument modelOutput](self, "modelOutput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[SGExtractionDocument modelOutput](self, "modelOutput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trigger"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_new();
  if (objc_msgSend(v5, "count"))
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "hasPrefix:", CFSTR("DUE_LOCATION_TRIGGER__")))
      {
        if ((objc_msgSend(v10, "containsString:", CFSTR("ARRIVE")) & 1) != 0)
        {
          v8 = 1;
        }
        else if (objc_msgSend(v10, "containsString:", CFSTR("LEAVE")))
        {
          v8 = 2;
        }
        if ((objc_msgSend(v10, "hasSuffix:", CFSTR("MY_HOME")) & 1) != 0)
        {
          v9 = 1;
        }
        else if ((objc_msgSend(v10, "hasSuffix:", CFSTR("MY_SCHOOL")) & 1) != 0)
        {
          v9 = 3;
        }
        else if ((objc_msgSend(v10, "hasSuffix:", CFSTR("MY_WORK")) & 1) != 0)
        {
          v9 = 2;
        }
        else if (objc_msgSend(v10, "hasSuffix:", CFSTR("OTHER")))
        {
          objc_msgSend(v6, "addIndex:", v7);
          v9 = 4;
        }
      }

      ++v7;
    }
    while (objc_msgSend(v5, "count") > v7);
    if (v9 == 4)
    {
      v11 = (void *)MEMORY[0x1C3BD4F6C]();
      v12 = objc_msgSend((id)objc_opt_class(), "firstRangeInIndexSet:", v6);
      v14 = v13;
      -[SGExtractionDocument enrichedTaggedCharacterRanges](self, "enrichedTaggedCharacterRanges");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = objc_msgSend((id)objc_opt_class(), "textRangeForIndexRange:inTaggedCharacterRanges:", v12, v14, v15);
        v18 = v17;
        -[SGMessage textContent](self->_message, "textContent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "substringWithRange:", v16, v18);
        v20 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v20 = 0;
      }

      objc_autoreleasePoolPop(v11);
      v9 = 4;
      goto LABEL_27;
    }
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  v20 = 0;
  v22 = 0;
  v23 = 0;
  if (v9 | v8)
  {
LABEL_27:
    v23 = -[SGReminderDueLocation initWithLocationType:trigger:name:]([SGReminderDueLocation alloc], "initWithLocationType:trigger:name:", v9, v8, v20);
    v22 = (void *)v20;
  }

  return v23;
}

- (BOOL)hasTrigger
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SGExtractionDocument modelOutput](self, "modelOutput", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("trigger"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isEqualToString:", CFSTR("NONE")))
        {
          v8 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (id)_labelTokenIndexesForOutputName:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_class();
  -[SGExtractionDocument modelOutput](self, "modelOutput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "labelTokenIndexesForOutputName:label:modelOutput:", v7, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (SGMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (SGPipelineEntity)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
  objc_storeStrong((id *)&self->_entity, a3);
}

- (NSArray)plainTextDetectedData
{
  return self->_plainTextDetectedData;
}

- (void)setPlainTextDetectedData:(id)a3
{
  objc_storeStrong((id *)&self->_plainTextDetectedData, a3);
}

- (SGDuplicateKey)extractedReminderDuplicateKey
{
  return self->_extractedReminderDuplicateKey;
}

- (void)setExtractedReminderDuplicateKey:(id)a3
{
  objc_storeStrong((id *)&self->_extractedReminderDuplicateKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractedReminderDuplicateKey, 0);
  objc_storeStrong((id *)&self->_plainTextDetectedData, 0);
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

+ (BOOL)isConfirmationOptionalForContent:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "confirmationOptionalTokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "tokensMatchedInContent:content:", v5, v4);

  return (char)a1;
}

+ (BOOL)shouldAddTitlePrefixForContent:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "titlePrefixTokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "tokensMatchedInContent:content:", v5, v4);

  return (char)a1;
}

+ (BOOL)tokensMatchedInContent:(id)a3 content:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  v6 = a4;
  objc_msgSend(a1, "regexFromJoinedArray:wordBoundary:", a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7
    || (v9 = 1,
        objc_msgSend(v7, "rangeOfFirstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")) == 0x7FFFFFFFFFFFFFFFLL)
    && !v8)
  {
    v9 = 0;
  }

  return v9;
}

+ (id)detectedTitleInModelOutput:(id)a3 enrichedTaggedCharacterRanges:(id)a4 textContent:(id)a5 language:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *v30;
  const char *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  NSObject *v50;
  uint64_t v52;
  void *context;
  unint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint8_t v58[8];
  _QWORD v59[5];
  uint8_t buf[8];
  uint8_t *v61;
  uint64_t v62;
  int v63;
  _QWORD v64[4];
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = 0;
  if (v10 && v11)
  {
    if ((objc_msgSend(a1, "enrichedTaggedCharacterRangesContainsProfanity:", v11) & 1) != 0)
    {
      v14 = 0;
      goto LABEL_48;
    }
    objc_msgSend(a1, "labelTokenIndexesForOutputName:label:modelOutput:", CFSTR("title"), CFSTR("EXTRACTION__REMINDER_TITLE_ACTION_VERB"), v10);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v57, "count"))
    {
      v14 = 0;
LABEL_47:

      goto LABEL_48;
    }
    objc_msgSend(a1, "labelTokenIndexesForOutputName:label:modelOutput:", CFSTR("title"), CFSTR("EXTRACTION__REMINDER_TITLE_ACTION_OBJECT_CORE"), v10);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v56, "count"))
    {
      v14 = 0;
LABEL_46:

      goto LABEL_47;
    }
    v15 = objc_msgSend(a1, "firstRangeInIndexSet:", v57);
    v17 = v16;
    if ((objc_msgSend(a1, "validActionVerbIndexRange:enrichedTaggedCharacterRanges:", v15, v16, v11) & 1) != 0)
    {
      v18 = objc_msgSend(a1, "firstRangeInIndexSet:", v56);
      v55 = v19;
      if ((objc_msgSend(a1, "validObjectCoreIndexRange:enrichedTaggedCharacterRanges:", v18, v19, v11) & 1) != 0)
      {
        context = (void *)MEMORY[0x1C3BD4F6C]();
        v54 = v18;
        if (v15 >= v18)
        {
          v32 = (void *)objc_opt_new();
          v70 = 0u;
          v71 = 0u;
          v72 = 0u;
          v73 = 0u;
          v33 = (void *)MEMORY[0x1C3BD4F6C]();
          objc_msgSend(v11, "subarrayWithRange:", v15, v17);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_autoreleasePoolPop(v33);
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
          if (v35)
          {
            v36 = *(_QWORD *)v71;
            do
            {
              for (i = 0; i != v35; ++i)
              {
                if (*(_QWORD *)v71 != v36)
                  objc_enumerationMutation(v34);
                objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * i), "text");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "addObject:", v38);

              }
              v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
            }
            while (v35);
          }

          v68 = 0u;
          v69 = 0u;
          v66 = 0u;
          v67 = 0u;
          v39 = (void *)MEMORY[0x1C3BD4F6C]();
          objc_msgSend(v11, "subarrayWithRange:", v54, v55);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_autoreleasePoolPop(v39);
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
          if (v41)
          {
            v42 = *(_QWORD *)v67;
            do
            {
              for (j = 0; j != v41; ++j)
              {
                if (*(_QWORD *)v67 != v42)
                  objc_enumerationMutation(v40);
                objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * j), "text");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "addObject:", v44);

              }
              v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
            }
            while (v41);
          }

          objc_msgSend(v32, "_pas_componentsJoinedByString:", CFSTR(" "));
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_autoreleasePoolPop(context);
        }
        else
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v20, "range");

          objc_msgSend(v11, "objectAtIndexedSubscript:", v55 + v18 - 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "range");
          objc_msgSend(v21, "range");
          v24 = v23;
          objc_msgSend(a1, "titlePrependForActionVerbIndexRange:enrichedTaggedCharacterRanges:language:content:", v15, v17, v11, v13, v12);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v22 - v52 + v24;
          if (v25)
          {
            v27 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v12, "substringWithRange:", v52, v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = (void *)objc_msgSend(v27, "initWithFormat:", CFSTR("%@%@"), v25, v28);

          }
          else
          {
            objc_msgSend(v12, "substringWithRange:", v52, v22 - v52 + v24);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
          }

          objc_autoreleasePoolPop(context);
        }
        if (!v29)
        {
          v30 = 0;
          goto LABEL_40;
        }
        v45 = (void *)MEMORY[0x1C3BD4F6C]();
        v46 = (void *)objc_msgSend(v29, "mutableCopy");
        v47 = objc_msgSend(v29, "length");
        v48 = MEMORY[0x1E0C809B0];
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __99__SGReminderMessage_detectedTitleInModelOutput_enrichedTaggedCharacterRanges_textContent_language___block_invoke;
        v64[3] = &unk_1E7DAF2A8;
        v49 = v46;
        v65 = v49;
        objc_msgSend(v49, "enumerateSubstringsInRange:options:usingBlock:", 0, v47, 1027, v64);
        v30 = v49;

        *(_QWORD *)buf = 0;
        v61 = buf;
        v62 = 0x2020000000;
        v63 = 0;
        v59[0] = v48;
        v59[1] = 3221225472;
        v59[2] = __99__SGReminderMessage_detectedTitleInModelOutput_enrichedTaggedCharacterRanges_textContent_language___block_invoke_2;
        v59[3] = &unk_1E7DAF2D0;
        v59[4] = buf;
        -[NSObject enumerateSubstringsInRange:options:usingBlock:](v30, "enumerateSubstringsInRange:options:usingBlock:", 0, -[NSObject length](v30, "length"), 2, v59);
        if (*((int *)v61 + 6) < 81)
        {
          _Block_object_dispose(buf, 8);

          objc_autoreleasePoolPop(v45);
LABEL_40:
          v30 = v30;
          v14 = v30;
LABEL_45:

          goto LABEL_46;
        }
        sgRemindersLogHandle();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v58 = 0;
          _os_log_error_impl(&dword_1C3607000, v50, OS_LOG_TYPE_ERROR, "SGReminderMessage: Title has too many characters", v58, 2u);
        }

        _Block_object_dispose(buf, 8);
        objc_autoreleasePoolPop(v45);
LABEL_44:
        v14 = 0;
        goto LABEL_45;
      }
      sgRemindersLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        goto LABEL_44;
      *(_WORD *)buf = 0;
      v31 = "SGReminderMessage: No NN, NNP in objectCoreIndexRange";
    }
    else
    {
      sgRemindersLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        goto LABEL_44;
      *(_WORD *)buf = 0;
      v31 = "SGReminderMessage: No VB in actionVerbIndexRange";
    }
    _os_log_debug_impl(&dword_1C3607000, v30, OS_LOG_TYPE_DEBUG, v31, buf, 2u);
    goto LABEL_44;
  }
LABEL_48:

  return v14;
}

+ (id)titlePrependForActionVerbIndexRange:(_NSRange)a3 enrichedTaggedCharacterRanges:(id)a4 language:(id)a5 content:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  id v13;
  void *v14;

  length = a3.length;
  location = a3.location;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v12
    && objc_msgSend(v12, "isEqualToString:", CFSTR("fr"))
    && objc_msgSend(a1, "shouldAddTitlePrefixForContent:", v13))
  {
    objc_msgSend(a1, "frenchPrependForEnrichedTaggedCharacterRanges:actionVerbIndexRange:", v11, location, length);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)frenchPrependForEnrichedTaggedCharacterRanges:(id)a3 actionVerbIndexRange:(_NSRange)a4
{
  NSUInteger location;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  char v20;

  location = a4.location;
  v5 = a3;
  v6 = v5;
  if (location < 2)
    goto LABEL_13;
  objc_msgSend(v5, "objectAtIndexedSubscript:", location - 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "containsObject:", CFSTR("I_PRP")))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", location - 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tags");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "containsObject:", CFSTR("I_PRP")) & 1) != 0)
    {
LABEL_6:

LABEL_7:
      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("aeiouyhé"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", location);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "text");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v7, "characterIsMember:", objc_msgSend(v13, "characterAtIndex:", 0));
      v15 = CFSTR("se ");
      if (v14)
        v15 = CFSTR("s'");
      v16 = v15;

      goto LABEL_11;
    }
    objc_msgSend(v6, "objectAtIndexedSubscript:", location - 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tags");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "containsObject:", CFSTR("L_de")) & 1) != 0)
    {

      goto LABEL_6;
    }
    objc_msgSend(v6, "objectAtIndexedSubscript:", location - 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqualToString:", CFSTR("à"));

    if ((v20 & 1) != 0)
      goto LABEL_7;
LABEL_13:
    v16 = 0;
    goto LABEL_14;
  }
  v16 = 0;
LABEL_11:

LABEL_14:
  return v16;
}

+ (BOOL)validActionVerbIndexRange:(_NSRange)a3 enrichedTaggedCharacterRanges:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  BOOL v19;
  NSObject *v20;
  NSUInteger v22;
  uint64_t v23;
  id v24;
  NSUInteger v25;
  void *v26;
  uint8_t buf[16];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  length = a3.length;
  location = a3.location;
  v33 = *MEMORY[0x1E0C80C00];
  v24 = a4;
  v6 = (void *)MEMORY[0x1C3BD4F6C]();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("I_VB"), CFSTR("I_VBP"), CFSTR("I_VBN"), CFSTR("I_VBG"), CFSTR("I_Verb"), 0);
  objc_autoreleasePoolPop(v6);
  v22 = location + length;
  if (location >= location + length)
  {
    v23 = 0;
LABEL_22:
    v19 = HIDWORD(v23) == 1 && (int)v23 < 2;
  }
  else
  {
    v23 = 0;
    while (1)
    {
      objc_msgSend(v24, "objectAtIndexedSubscript:", location);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      objc_msgSend(v8, "tags");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (!v10)
        break;
      v11 = v10;
      v25 = location;
      v26 = v8;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v9);
          v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if ((objc_msgSend(v17, "isEqualToString:", CFSTR("R_action")) & 1) != 0)
          {
            v12 = 1;
          }
          else if ((objc_msgSend(v7, "containsObject:", v17) & 1) != 0)
          {
            v13 = 1;
          }
          else
          {
            v14 |= objc_msgSend(v17, "isEqualToString:", CFSTR("I_RP"));
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v11);

      if ((v12 & v13 & 1) != 0)
      {
        ++HIDWORD(v23);
        v8 = v26;
      }
      else
      {
        v8 = v26;
        if ((v14 & 1) == 0)
          goto LABEL_29;
        LODWORD(v23) = v23 + 1;
      }

      location = v25 + 1;
      if (v25 + 1 == v22)
        goto LABEL_22;
    }

LABEL_29:
    sgRemindersLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v20, OS_LOG_TYPE_DEBUG, "SGReminderMessage: No whitelisted action verb or particle actionVerbTokenIndexes", buf, 2u);
    }

    v19 = 0;
  }

  return v19;
}

+ (BOOL)validObjectCoreIndexRange:(_NSRange)a3 enrichedTaggedCharacterRanges:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  NSUInteger v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  length = a3.length;
  location = a3.location;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(a1, "posTaggerNouns");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = location + length;
  if (location >= location + length)
  {
    LOBYTE(v12) = 0;
  }
  else
  {
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", location);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      objc_msgSend(v10, "tags", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v17 != v13)
              objc_enumerationMutation(v11);
            if ((objc_msgSend(v8, "containsObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i)) & 1) != 0)
            {
              LOBYTE(v12) = 1;
              goto LABEL_12;
            }
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v12)
            continue;
          break;
        }
      }
LABEL_12:

      ++location;
    }
    while (location < v9 && (v12 & 1) == 0);
  }

  return v12;
}

+ (id)posTaggerNouns
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1C3BD4F6C](a1, a2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("I_NN"), CFSTR("I_NNP"), CFSTR("I_Noun"), CFSTR("I_NNS"), CFSTR("I_NNPS"), 0);
  objc_autoreleasePoolPop(v2);
  return v3;
}

+ (BOOL)validModelOutput:(id)a3 error:(id *)a4
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  int v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id obj;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  char v42;
  char v43;
  uint64_t v44;
  void *v45;
  void *v46;
  char v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[6];
  _QWORD v61[6];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = a3;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  v4 = 0;
  v5 = 0;
  v6 = 0;
  if (v40)
  {
    v47 = 0;
    v7 = 0;
    v39 = *(_QWORD *)v57;
    v8 = 1;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v57 != v39)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v9);
        objc_msgSend(v10, "modelOutput");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v26 = obj;
          goto LABEL_45;
        }
        v44 = v9;
        v45 = v10;
        if ((v4 & 1) != 0)
        {
          v4 = 1;
        }
        else
        {
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          objc_msgSend(v10, "modelOutput");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("polarity"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v53;
            while (2)
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v53 != v16)
                  objc_enumerationMutation(v13);
                if (!objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "isEqualToString:", CFSTR("NONE")))
                {
                  v4 = 1;
                  goto LABEL_19;
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
              if (v15)
                continue;
              break;
            }
          }
          v4 = 0;
LABEL_19:

          v10 = v45;
        }
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        objc_msgSend(v10, "modelOutput");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("title"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
        if (v20)
        {
          v21 = v20;
          v41 = v4;
          v42 = v6;
          v43 = v8;
          v22 = 0;
          v23 = *(_QWORD *)v49;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v49 != v23)
                objc_enumerationMutation(v19);
              v25 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
              if ((objc_msgSend(v25, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
              {
                v5 = 1;
              }
              else if (objc_msgSend(v25, "isEqualToString:", CFSTR("EXTRACTION__REMINDER_TITLE_ACTION_VERB")))
              {
                ++v22;
                v47 = 1;
              }
              else
              {
                v7 |= objc_msgSend(v25, "isEqualToString:", CFSTR("EXTRACTION__REMINDER_TITLE_ACTION_OBJECT_CORE"));
              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
          }
          while (v21);

          LOBYTE(v6) = v42;
          v8 = (v22 < 2) & v43;
          v4 = v41;
        }
        else
        {

        }
        if ((v6 & 1) != 0)
          v6 = 1;
        else
          v6 = objc_msgSend(v45, "hasTrigger");
        v9 = v44 + 1;
      }
      while (v44 + 1 != v40);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      if (v40)
        continue;
      break;
    }
  }
  else
  {
    v47 = 0;
    LOBYTE(v7) = 0;
    v8 = 1;
  }

  v27 = v4;
  v28 = v4 & v5 & v47 & v6 & v8 & v7;
  if (a4 && (v28 & 1) == 0)
  {
    v46 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0D19AE8];
    v60[0] = CFSTR("hasPolarity:");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v26;
    v60[1] = CFSTR("hasTitle");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5 & 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v30;
    v60[2] = CFSTR("hasTrigger");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v61[2] = v31;
    v60[3] = CFSTR("hasCorrectNumberOfActionVerbs");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8 & 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v61[3] = v32;
    v60[4] = CFSTR("hasActionVerb");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v47 & 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v61[4] = v33;
    v60[5] = CFSTR("hasObjectCore");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7 & 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v61[5] = v34;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 6);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "errorWithDomain:code:userInfo:", v29, 9, v35);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_45:
    v28 = 0;
  }

  return v28;
}

+ (BOOL)enrichedTaggedCharacterRangesContainsProfanity:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  sgMapAndFilter();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[SGLexicon profanityInTokens:forLocaleIdentifier:](SGLexicon, "profanityInTokens:forLocaleIdentifier:", v3, v5);

  return v6;
}

+ (id)triggerOptionalTokens
{
  void *v2;
  void *v3;
  void *v4;

  +[SGReminderExtractionModel sharedInstance](SGReminderExtractionModel, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reminderOverrides");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("triggerOptional"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

+ (id)confirmationOptionalTokens
{
  void *v2;
  void *v3;
  void *v4;

  +[SGReminderExtractionModel sharedInstance](SGReminderExtractionModel, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reminderOverrides");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("confirmationOptional"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

+ (id)excludeList
{
  void *v2;
  void *v3;
  void *v4;

  +[SGReminderExtractionModel sharedInstance](SGReminderExtractionModel, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reminderOverrides");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("excludeList"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

+ (id)titlePrefixTokens
{
  void *v2;
  void *v3;
  void *v4;

  +[SGReminderExtractionModel sharedInstance](SGReminderExtractionModel, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reminderOverrides");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("titlePrefix"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

+ (id)regexFromJoinedArray:(id)a3 wordBoundary:(id)a4
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *context;

  v5 = a3;
  v6 = (__CFString *)a4;
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = &stru_1E7DB83A8;
  v9 = v8;
  if (objc_msgSend(v5, "count"))
  {
    context = (void *)MEMORY[0x1C3BD4F6C]();
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "appendString:", CFSTR("(?:"));
    if (objc_msgSend(v5, "count"))
    {
      v11 = 0;
      do
      {
        v12 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(v5, "objectAtIndexedSubscript:", v11);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v11)
          v15 = CFSTR("|");
        else
          v15 = &stru_1E7DB83A8;
        objc_msgSend(v10, "appendFormat:", CFSTR("%@%@%@%@"), v15, v9, v13, v9);

        objc_autoreleasePoolPop(v12);
        ++v11;
      }
      while (objc_msgSend(v5, "count") > v11);
    }
    objc_msgSend(v10, "appendString:", CFSTR(")"));
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", v10, 1, 0);

    objc_autoreleasePoolPop(context);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (BOOL)excludedContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(a1, "excludeList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "regexFromJoinedArray:wordBoundary:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6
      || (v8 = 1,
          objc_msgSend(v6, "rangeOfFirstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length")) == 0x7FFFFFFFFFFFFFFFLL)
      && !v7)
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)searchTokensForReminderTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id obj;
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SGPOSTagger sharedInstance](SGPOSTagger, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v4;
  objc_msgSend(v5, "tokenizeTextContent:languageHint:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)objc_opt_new();
  objc_msgSend(a1, "posTaggerNouns");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v36;
    v26 = *(_QWORD *)v36;
    do
    {
      v11 = 0;
      v27 = v9;
      do
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v11);
        if (objc_msgSend(v12, "annotationType") == 2)
        {
          v29 = v11;
          v33 = 0u;
          v34 = 0u;
          v31 = 0u;
          v32 = 0u;
          objc_msgSend(v12, "tags");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v32;
            do
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v32 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
                v19 = objc_alloc(MEMORY[0x1E0CB3940]);
                objc_msgSend(v12, "annotationTypeUniqueIdentifier");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("%@_%@"), v20, v18);
                LODWORD(v18) = objc_msgSend(v7, "containsObject:", v21);

                if ((_DWORD)v18)
                {
                  objc_msgSend(v12, "text");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "addObject:", v22);

                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            }
            while (v15);
          }

          v10 = v26;
          v9 = v27;
          v11 = v29;
        }
        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v9);
  }

  objc_msgSend(v30, "allObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

id __68__SGReminderMessage_enrichedTaggedCharacterRangesContainsProfanity___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v2, "tags", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasPrefix:", CFSTR("L_")))
        {
          v10 = (void *)MEMORY[0x1C3BD4F6C]();
          objc_msgSend(v9, "substringFromIndex:", 2);
          v11 = objc_claimAutoreleasedReturnValue();

          objc_autoreleasePoolPop(v10);
          v6 = (void *)v11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __99__SGReminderMessage_detectedTitleInModelOutput_enrichedTaggedCharacterRanges_textContent_language___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v11 = *(void **)(a1 + 32);
  v12 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v14, "localizedCapitalizedString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v12);
  objc_msgSend(v11, "replaceCharactersInRange:withString:", a3, a4, v13);

  *a7 = 1;
}

uint64_t __99__SGReminderMessage_detectedTitleInModelOutput_enrichedTaggedCharacterRanges_textContent_language___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  if ((int)++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) >= 81)
    *a7 = 1;
  return result;
}

@end
