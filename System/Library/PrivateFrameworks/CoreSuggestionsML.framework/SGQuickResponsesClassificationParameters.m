@implementation SGQuickResponsesClassificationParameters

- (SGQuickResponsesClassificationParameters)initWithDictionary:(id)a3 language:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double positiveSamplingRate;
  NSObject *v21;
  const char *v22;
  double dynamicLabelSamplingRate;
  double negativeSamplingRate;
  double v25;
  double v26;
  NSObject *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  NSString *v37;
  NSString *promptJoiningString;
  SGQuickResponsesClassificationParameters *v39;
  objc_super v41;
  uint8_t buf[4];
  double v43;
  __int16 v44;
  double v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  if (!v8)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      goto LABEL_53;
    *(_WORD *)buf = 0;
    v21 = MEMORY[0x24BDACB70];
    v22 = "dictionary";
    goto LABEL_52;
  }

  v41.receiver = self;
  v41.super_class = (Class)SGQuickResponsesClassificationParameters;
  self = -[SGQuickResponsesClassificationParameters init](&v41, sel_init);
  if (!self)
    goto LABEL_49;
  objc_msgSend(v9, "numberAssertedForKey:", CFSTR("POSITIVE_SAMPLING_RATE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      goto LABEL_53;
    *(_WORD *)buf = 0;
    v21 = MEMORY[0x24BDACB70];
    v22 = "[dictionary numberAssertedForKey:POSITIVE_SAMPLING_RATE]";
    goto LABEL_52;
  }
  v11 = v10;
  objc_msgSend(v10, "doubleValue");
  self->_positiveSamplingRate = v12;

  objc_msgSend(v9, "numberAssertedForKey:", CFSTR("DYNAMIC_LABEL_SAMPLING_RATE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      goto LABEL_53;
    *(_WORD *)buf = 0;
    v21 = MEMORY[0x24BDACB70];
    v22 = "[dictionary numberAssertedForKey:DYNAMIC_LABEL_SAMPLING_RATE]";
    goto LABEL_52;
  }
  v14 = v13;
  objc_msgSend(v13, "doubleValue");
  self->_dynamicLabelSamplingRate = v15;

  objc_msgSend(v9, "numberAssertedForKey:", CFSTR("NEGATIVE_SAMPLING_RATE"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      goto LABEL_53;
    *(_WORD *)buf = 0;
    v21 = MEMORY[0x24BDACB70];
    v22 = "[dictionary numberAssertedForKey:NEGATIVE_SAMPLING_RATE]";
    goto LABEL_52;
  }
  v17 = v16;
  objc_msgSend(v16, "doubleValue");
  self->_negativeSamplingRate = v18;

  positiveSamplingRate = self->_positiveSamplingRate;
  if (positiveSamplingRate < 0.0 || positiveSamplingRate > 1.0)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      goto LABEL_53;
    *(_WORD *)buf = 0;
    v21 = MEMORY[0x24BDACB70];
    v22 = "0 <= _positiveSamplingRate && _positiveSamplingRate <= 1";
LABEL_52:
    _os_log_fault_impl(&dword_21ABF4000, v21, OS_LOG_TYPE_FAULT, v22, buf, 2u);
    goto LABEL_53;
  }
  dynamicLabelSamplingRate = self->_dynamicLabelSamplingRate;
  if (dynamicLabelSamplingRate < 0.0 || dynamicLabelSamplingRate > 1.0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v21 = MEMORY[0x24BDACB70];
      v22 = "0 <= _dynamicLabelSamplingRate && _dynamicLabelSamplingRate <= 1";
      goto LABEL_52;
    }
    goto LABEL_53;
  }
  negativeSamplingRate = self->_negativeSamplingRate;
  if (negativeSamplingRate < 0.0 || negativeSamplingRate > 1.0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v21 = MEMORY[0x24BDACB70];
      v22 = "0 <= _negativeSamplingRate && _negativeSamplingRate <= 1";
      goto LABEL_52;
    }
    goto LABEL_53;
  }
  v25 = (1.0 - positiveSamplingRate) * 16.4446468;
  v26 = positiveSamplingRate / -2.22554093 + 1.0;
  if (v25 < v26)
    v26 = v25;
  if (negativeSamplingRate < 1.0 - v26)
  {
    sgLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = self->_negativeSamplingRate;
      v29 = self->_positiveSamplingRate;
      *(_DWORD *)buf = 134218240;
      v43 = v28;
      v44 = 2048;
      v45 = v29;
      _os_log_impl(&dword_21ABF4000, v27, OS_LOG_TYPE_DEFAULT, "SGQuickResponsesConfig: negativeSamplingRate=%f and positiveSamplingRate=%f do not satisfy strict DP constraint", buf, 0x16u);
    }

  }
  objc_msgSend(v9, "dictAssertedForKey:", CFSTR("MAX_PROMPT_LENGTH"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "numberAssertedForKey:", v7);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v21 = MEMORY[0x24BDACB70];
      v22 = "[[dictionary dictAssertedForKey: MAX_PROMPT_LENGTH] numberAssertedForKey:language]";
      goto LABEL_52;
    }
    goto LABEL_53;
  }
  self->_maxPromptLength = objc_msgSend(v31, "integerValue");

  objc_msgSend(v9, "dictAssertedForKey:", CFSTR("MAX_REPLY_LENGTH"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "numberAssertedForKey:", v7);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v33)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v21 = MEMORY[0x24BDACB70];
      v22 = "[[dictionary dictAssertedForKey: MAX_REPLY_LENGTH] numberAssertedForKey:language]";
      goto LABEL_52;
    }
    goto LABEL_53;
  }
  self->_maxReplyLength = objc_msgSend(v33, "integerValue");

  objc_msgSend(v9, "numberAssertedForKey:", CFSTR("MAX_PROMPT_WINDOW_SECONDS"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v34)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v21 = MEMORY[0x24BDACB70];
      v22 = "[dictionary numberAssertedForKey:MAX_PROMPT_WINDOW_SECONDS]";
      goto LABEL_52;
    }
    goto LABEL_53;
  }
  v35 = v34;
  objc_msgSend(v34, "doubleValue");
  self->_maxPromptWindowSeconds = v36;

  if (self->_maxPromptWindowSeconds < 0.0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v21 = MEMORY[0x24BDACB70];
      v22 = "0 <= _maxPromptWindowSeconds";
      goto LABEL_52;
    }
LABEL_53:
    v39 = 0;
    goto LABEL_54;
  }
  objc_msgSend(v9, "stringAssertedForKey:", CFSTR("PROMPT_JOINING_STRING"));
  v37 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (!v37)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v21 = MEMORY[0x24BDACB70];
      v22 = "[dictionary stringAssertedForKey:PROMPT_JOINING_STRING]";
      goto LABEL_52;
    }
    goto LABEL_53;
  }
  promptJoiningString = self->_promptJoiningString;
  self->_promptJoiningString = v37;

LABEL_49:
  self = self;
  v39 = self;
LABEL_54:

  return v39;
}

- (double)positiveSamplingRate
{
  return self->_positiveSamplingRate;
}

- (double)dynamicLabelSamplingRate
{
  return self->_dynamicLabelSamplingRate;
}

- (double)negativeSamplingRate
{
  return self->_negativeSamplingRate;
}

- (unint64_t)maxReplyLength
{
  return self->_maxReplyLength;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promptJoiningString, 0);
}

@end
