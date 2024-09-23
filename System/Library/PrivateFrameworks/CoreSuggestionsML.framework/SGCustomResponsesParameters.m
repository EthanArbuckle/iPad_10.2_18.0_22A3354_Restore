@implementation SGCustomResponsesParameters

- (SGCustomResponsesParameters)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  NSObject *v53;
  const char *v54;
  double timeDecayFactor;
  SGCustomResponsesParameters *v56;
  objc_super v58;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v53 = MEMORY[0x24BDACB70];
      v54 = "dictionary";
      goto LABEL_73;
    }
LABEL_74:
    v56 = 0;
    goto LABEL_75;
  }

  v58.receiver = self;
  v58.super_class = (Class)SGCustomResponsesParameters;
  self = -[SGCustomResponsesParameters init](&v58, sel_init);
  if (self)
  {
    objc_msgSend(v5, "numberAssertedForKey:", CFSTR("IS_CUSTOM_RESPONSES_ENABLED"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = MEMORY[0x24BDACB70];
        v54 = "[dictionary numberAssertedForKey:IS_CUSTOM_RESPONSES_ENABLED]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v7 = v6;
    self->_isCustomResponsesEnabled = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v5, "numberAssertedForKey:", CFSTR("FILTER_BATCH_SIZE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = MEMORY[0x24BDACB70];
        v54 = "[dictionary numberAssertedForKey:FILTER_BATCH_SIZE]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v9 = v8;
    self->_filterBatchSize = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(v5, "numberAssertedForKey:", CFSTR("MINIMUM_TIME_INTERVAL_SECS"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = MEMORY[0x24BDACB70];
        v54 = "[dictionary numberAssertedForKey:MINIMUM_TIME_INTERVAL_SECS]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v11 = v10;
    objc_msgSend(v10, "doubleValue");
    self->_minimumTimeIntervalSecs = v12;

    objc_msgSend(v5, "numberAssertedForKey:", CFSTR("MINIMUM_DISTINCT_RECIPIENTS"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = MEMORY[0x24BDACB70];
        v54 = "[dictionary numberAssertedForKey:MINIMUM_DISTINCT_RECIPIENTS]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v14 = v13;
    self->_minimumDistinctRecipients = objc_msgSend(v13, "unsignedIntegerValue");

    objc_msgSend(v5, "numberAssertedForKey:", CFSTR("MINIMUM_REPLY_OCCURENCES"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = MEMORY[0x24BDACB70];
        v54 = "[dictionary numberAssertedForKey:MINIMUM_REPLY_OCCURENCES]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v16 = v15;
    self->_minimumReplyOccurences = objc_msgSend(v15, "unsignedIntegerValue");

    objc_msgSend(v5, "numberAssertedForKey:", CFSTR("TIME_DECAY_FACTOR"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = MEMORY[0x24BDACB70];
        v54 = "[dictionary numberAssertedForKey:TIME_DECAY_FACTOR]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v18 = v17;
    objc_msgSend(v17, "doubleValue");
    self->_timeDecayFactor = v19;

    objc_msgSend(v5, "numberAssertedForKey:", CFSTR("COUNT_EXPONENT"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = MEMORY[0x24BDACB70];
        v54 = "[dictionary numberAssertedForKey:COUNT_EXPONENT]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v21 = v20;
    objc_msgSend(v20, "doubleValue");
    self->_countExponent = v22;

    objc_msgSend(v5, "numberAssertedForKey:", CFSTR("DISTANCE_THRESHOLD"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = MEMORY[0x24BDACB70];
        v54 = "[dictionary numberAssertedForKey:DISTANCE_THRESHOLD]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v24 = v23;
    objc_msgSend(v23, "doubleValue");
    self->_distanceThreshold = v25;

    objc_msgSend(v5, "numberAssertedForKey:", CFSTR("MIN_DECAYED_COUNT_FOR_PREDICTION"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = MEMORY[0x24BDACB70];
        v54 = "[dictionary numberAssertedForKey:MIN_DECAYED_COUNT_FOR_PREDICTION]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v27 = v26;
    objc_msgSend(v26, "doubleValue");
    self->_minDecayedCountForPrediction = v28;

    objc_msgSend(v5, "numberAssertedForKey:", CFSTR("MIN_DECAYED_COUNT_FOR_PRUNING"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = MEMORY[0x24BDACB70];
        v54 = "[dictionary numberAssertedForKey:MIN_DECAYED_COUNT_FOR_PRUNING]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v30 = v29;
    objc_msgSend(v29, "doubleValue");
    self->_minDecayedCountForPruning = v31;

    objc_msgSend(v5, "numberAssertedForKey:", CFSTR("MAX_STORED_MESSAGES"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = MEMORY[0x24BDACB70];
        v54 = "[dictionary numberAssertedForKey:MAX_STORED_MESSAGES]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v33 = v32;
    self->_maxStoredMessages = objc_msgSend(v32, "unsignedIntegerValue");

    objc_msgSend(v5, "numberAssertedForKey:", CFSTR("MAX_STORED_CUSTOM_RESPONSES"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v34)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = MEMORY[0x24BDACB70];
        v54 = "[dictionary numberAssertedForKey:MAX_STORED_CUSTOM_RESPONSES]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v35 = v34;
    self->_maxStoredCustomResponses = objc_msgSend(v34, "unsignedIntegerValue");

    objc_msgSend(v5, "numberAssertedForKey:", CFSTR("MAX_ROWS_IN_PER_RECIPIENT_TABLE"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v36)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = MEMORY[0x24BDACB70];
        v54 = "[dictionary numberAssertedForKey:MAX_ROWS_IN_PER_RECIPIENT_TABLE]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v37 = v36;
    self->_maxRowsInPerRecipientTable = objc_msgSend(v36, "unsignedIntegerValue");

    objc_msgSend(v5, "numberAssertedForKey:", CFSTR("CUSTOM_RESPONSES_COMPATIBILITY_VERSION"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v38)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = MEMORY[0x24BDACB70];
        v54 = "[dictionary numberAssertedForKey:CUSTOM_RESPONSES_COMPATIBILITY_VERSION]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v39 = v38;
    self->_compatibilityVersion = objc_msgSend(v38, "unsignedIntegerValue");

    objc_msgSend(v5, "numberAssertedForKey:", CFSTR("ALLOW_PROFANITY"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v40)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = MEMORY[0x24BDACB70];
        v54 = "[dictionary numberAssertedForKey:ALLOW_PROFANITY]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v41 = v40;
    self->_allowProfanity = objc_msgSend(v40, "BOOLValue");

    objc_msgSend(v5, "numberAssertedForKey:", CFSTR("KNOWLEDGE_STORE_QUERY_LIMIT"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v42)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = MEMORY[0x24BDACB70];
        v54 = "[dictionary numberAssertedForKey:KNOWLEDGE_STORE_QUERY_LIMIT]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v43 = v42;
    self->_knowledgeStoreQueryLimit = objc_msgSend(v42, "unsignedIntegerValue");

    objc_msgSend(v5, "numberAssertedForKey:", CFSTR("MAX_REPLY_LENGTH"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v44)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = MEMORY[0x24BDACB70];
        v54 = "[dictionary numberAssertedForKey:MAX_REPLY_LENGTH]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v45 = v44;
    self->_maxReplyLength = objc_msgSend(v44, "unsignedIntegerValue");

    objc_msgSend(v5, "numberAssertedForKey:", CFSTR("MAX_REPLY_GAP_SECS"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v46)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = MEMORY[0x24BDACB70];
        v54 = "[dictionary numberAssertedForKey:MAX_REPLY_GAP_SECS]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v47 = v46;
    objc_msgSend(v46, "doubleValue");
    self->_maxReplyGapSecs = v48;

    objc_msgSend(v5, "numberAssertedForKey:", CFSTR("USAGE_SPREAD_EXPONENT"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v49)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = MEMORY[0x24BDACB70];
        v54 = "[dictionary numberAssertedForKey:USAGE_SPREAD_EXPONENT]";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v50 = v49;
    objc_msgSend(v49, "doubleValue");
    self->_usageSpreadExponent = v51;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("USE_NON_NEGATIVE_CLASSES_ONLY"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    self->_useNonNegativeClassesOnly = objc_msgSend(v52, "BOOLValue");

    if (self->_minimumTimeIntervalSecs < 0.0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = MEMORY[0x24BDACB70];
        v54 = "0 <= _minimumTimeIntervalSecs";
LABEL_73:
        _os_log_fault_impl(&dword_21ABF4000, v53, OS_LOG_TYPE_FAULT, v54, buf, 2u);
        goto LABEL_74;
      }
      goto LABEL_74;
    }
    timeDecayFactor = self->_timeDecayFactor;
    if (timeDecayFactor < 0.0 || timeDecayFactor > 1.0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = MEMORY[0x24BDACB70];
        v54 = "0 <= _timeDecayFactor && _timeDecayFactor <= 1";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    if (self->_countExponent < 0.0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v53 = MEMORY[0x24BDACB70];
        v54 = "0 <= _countExponent";
        goto LABEL_73;
      }
      goto LABEL_74;
    }
  }
  self = self;
  v56 = self;
LABEL_75:

  return v56;
}

- (BOOL)isCustomResponsesEnabled
{
  return self->_isCustomResponsesEnabled;
}

- (unint64_t)filterBatchSize
{
  return self->_filterBatchSize;
}

- (double)minimumTimeIntervalSecs
{
  return self->_minimumTimeIntervalSecs;
}

- (unint64_t)minimumDistinctRecipients
{
  return self->_minimumDistinctRecipients;
}

- (unint64_t)minimumReplyOccurences
{
  return self->_minimumReplyOccurences;
}

- (double)timeDecayFactor
{
  return self->_timeDecayFactor;
}

- (double)countExponent
{
  return self->_countExponent;
}

- (double)distanceThreshold
{
  return self->_distanceThreshold;
}

- (double)minDecayedCountForPruning
{
  return self->_minDecayedCountForPruning;
}

- (double)minDecayedCountForPrediction
{
  return self->_minDecayedCountForPrediction;
}

- (unint64_t)maxStoredMessages
{
  return self->_maxStoredMessages;
}

- (unint64_t)maxStoredCustomResponses
{
  return self->_maxStoredCustomResponses;
}

- (unint64_t)maxRowsInPerRecipientTable
{
  return self->_maxRowsInPerRecipientTable;
}

- (unint64_t)knowledgeStoreQueryLimit
{
  return self->_knowledgeStoreQueryLimit;
}

- (unint64_t)maxReplyLength
{
  return self->_maxReplyLength;
}

- (double)maxReplyGapSecs
{
  return self->_maxReplyGapSecs;
}

- (double)usageSpreadExponent
{
  return self->_usageSpreadExponent;
}

- (BOOL)allowProfanity
{
  return self->_allowProfanity;
}

- (unint64_t)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (BOOL)useNonNegativeClassesOnly
{
  return self->_useNonNegativeClassesOnly;
}

@end
