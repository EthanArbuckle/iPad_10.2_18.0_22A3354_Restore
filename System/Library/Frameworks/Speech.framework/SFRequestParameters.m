@implementation SFRequestParameters

- (id)clientIdentifier
{
  NSString *applicationName;

  applicationName = self->_applicationName;
  if (applicationName)
    return applicationName;
  +[SFUtilities defaultClientID](SFUtilities, "defaultClientID");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)hash
{
  return -[NSString hash](self->_requestIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  NSString **v4;
  NSString *applicationName;
  NSString *applicationVersion;
  NSArray *inlineItemList;
  NSString *requestIdentifier;
  NSString *taskIdentifier;
  NSString *task;
  NSString *language;
  NSDictionary *recognitionOverrides;
  NSURL *modelOverrideURL;
  NSURL *dynamicLanguageModel;
  NSURL *dynamicVocabulary;
  BOOL v16;

  v4 = (NSString **)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_29;
  applicationName = self->_applicationName;
  if (applicationName != v4[2] && !-[NSString isEqual:](applicationName, "isEqual:"))
    goto LABEL_29;
  applicationVersion = self->_applicationVersion;
  if (applicationVersion != v4[3] && !-[NSString isEqual:](applicationVersion, "isEqual:"))
    goto LABEL_29;
  inlineItemList = self->_inlineItemList;
  if (inlineItemList != (NSArray *)v4[4] && !-[NSArray isEqual:](inlineItemList, "isEqual:"))
    goto LABEL_29;
  requestIdentifier = self->_requestIdentifier;
  if (requestIdentifier != v4[5] && !-[NSString isEqual:](requestIdentifier, "isEqual:"))
    goto LABEL_29;
  if (((taskIdentifier = self->_taskIdentifier, taskIdentifier == v4[6])
     || -[NSString isEqual:](taskIdentifier, "isEqual:"))
    && ((task = self->_task, task == v4[8]) || -[NSString isEqual:](task, "isEqual:"))
    && ((language = self->_language, language == v4[7]) || -[NSString isEqual:](language, "isEqual:"))
    && self->_narrowband == *((unsigned __int8 *)v4 + 8)
    && ((recognitionOverrides = self->_recognitionOverrides, recognitionOverrides == (NSDictionary *)v4[9])
     || -[NSDictionary isEqual:](recognitionOverrides, "isEqual:"))
    && ((modelOverrideURL = self->_modelOverrideURL, modelOverrideURL == (NSURL *)v4[10])
     || -[NSURL isEqual:](modelOverrideURL, "isEqual:"))
    && self->_maximumRecognitionDuration == *((double *)v4 + 11)
    && ((dynamicLanguageModel = self->_dynamicLanguageModel, dynamicLanguageModel == (NSURL *)v4[12])
     || -[NSURL isEqual:](dynamicLanguageModel, "isEqual:"))
    && ((dynamicVocabulary = self->_dynamicVocabulary, dynamicVocabulary == (NSURL *)v4[13])
     || -[NSURL isEqual:](dynamicVocabulary, "isEqual:"))
    && self->_detectMultipleUtterances == *((unsigned __int8 *)v4 + 9)
    && self->_onDeviceOnly == *((unsigned __int8 *)v4 + 10))
  {
    v16 = self->_enableAutoPunctuation == *((unsigned __int8 *)v4 + 11);
  }
  else
  {
LABEL_29:
    v16 = 0;
  }

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFRequestParameters;
  -[SFRequestParameters description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(", applicationName=%@, applicationVersion=%@, inlineItemList=%@, requestIdentifier=%@ task=%@ language=%@ narrowband=%d recognitionOverrides=%@ modelOverrideURL=%@ maximumRecognitionDuration=%f dynamicLanguageModel=%@ dynamicVocabulary=%@ detectMultipleUtterances=%d onDeviceOnly=%d enableAutoPunctuation=%d"), self->_applicationName, self->_applicationVersion, self->_inlineItemList, self->_requestIdentifier, self->_task, self->_language, self->_narrowband, self->_recognitionOverrides, self->_modelOverrideURL, *(_QWORD *)&self->_maximumRecognitionDuration, self->_dynamicLanguageModel, self->_dynamicVocabulary, self->_detectMultipleUtterances, self->_onDeviceOnly, self->_enableAutoPunctuation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *applicationName;
  id v5;

  applicationName = self->_applicationName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", applicationName, CFSTR("SFRequestParameters::applicationName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applicationVersion, CFSTR("SFRequestParameters::applicationVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_inlineItemList, CFSTR("SFRequestParameters::inlineItemList"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestIdentifier, CFSTR("SFRequestParameters::requestIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_taskIdentifier, CFSTR("SFRequestParameters::taskIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_task, CFSTR("SFRequestParameters::task"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_language, CFSTR("SFRequestParameters::language"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_narrowband, CFSTR("SFRequestParameters::narrowband"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recognitionOverrides, CFSTR("SFRequestParameters::recognitionOverrides"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelOverrideURL, CFSTR("SFRequestParameters::modelOverrideURL"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("SFRequestParameters::maximumRecognitionDuration"), self->_maximumRecognitionDuration);
  objc_msgSend(v5, "encodeObject:forKey:", self->_dynamicLanguageModel, CFSTR("SFRequestParameters::dynamicLanguageModel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dynamicVocabulary, CFSTR("SFRequestParameters::dynamicVocabulary"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_detectMultipleUtterances, CFSTR("SFRequestParameters::detectMultipleUtterances"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_onDeviceOnly, CFSTR("SFRequestParameters::onDeviceOnly"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enableAutoPunctuation, CFSTR("SFRequestParameters::enableAutoPunctuation"));

}

- (SFRequestParameters)initWithCoder:(id)a3
{
  id v4;
  SFRequestParameters *v5;
  uint64_t v6;
  NSString *applicationName;
  uint64_t v8;
  NSString *applicationVersion;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *inlineItemList;
  uint64_t v15;
  NSString *requestIdentifier;
  uint64_t v17;
  NSString *taskIdentifier;
  uint64_t v19;
  NSString *task;
  uint64_t v21;
  NSString *language;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSDictionary *recognitionOverrides;
  uint64_t v28;
  NSURL *modelOverrideURL;
  double v30;
  uint64_t v31;
  NSURL *dynamicLanguageModel;
  uint64_t v33;
  NSURL *dynamicVocabulary;
  objc_super v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)SFRequestParameters;
  v5 = -[SFRequestParameters init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SFRequestParameters::applicationName"));
    v6 = objc_claimAutoreleasedReturnValue();
    applicationName = v5->_applicationName;
    v5->_applicationName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SFRequestParameters::applicationVersion"));
    v8 = objc_claimAutoreleasedReturnValue();
    applicationVersion = v5->_applicationVersion;
    v5->_applicationVersion = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("SFRequestParameters::inlineItemList"));
    v13 = objc_claimAutoreleasedReturnValue();
    inlineItemList = v5->_inlineItemList;
    v5->_inlineItemList = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SFRequestParameters::requestIdentifier"));
    v15 = objc_claimAutoreleasedReturnValue();
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SFRequestParameters::taskIdentifier"));
    v17 = objc_claimAutoreleasedReturnValue();
    taskIdentifier = v5->_taskIdentifier;
    v5->_taskIdentifier = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SFRequestParameters::task"));
    v19 = objc_claimAutoreleasedReturnValue();
    task = v5->_task;
    v5->_task = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SFRequestParameters::language"));
    v21 = objc_claimAutoreleasedReturnValue();
    language = v5->_language;
    v5->_language = (NSString *)v21;

    v5->_narrowband = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SFRequestParameters::narrowband"));
    v23 = (void *)MEMORY[0x1E0C99E60];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setWithArray:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("SFRequestParameters::recognitionOverrides"));
    v26 = objc_claimAutoreleasedReturnValue();
    recognitionOverrides = v5->_recognitionOverrides;
    v5->_recognitionOverrides = (NSDictionary *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SFRequestParameters::modelOverrideURL"));
    v28 = objc_claimAutoreleasedReturnValue();
    modelOverrideURL = v5->_modelOverrideURL;
    v5->_modelOverrideURL = (NSURL *)v28;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SFRequestParameters::maximumRecognitionDuration"));
    v5->_maximumRecognitionDuration = v30;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SFRequestParameters::dynamicLanguageModel"));
    v31 = objc_claimAutoreleasedReturnValue();
    dynamicLanguageModel = v5->_dynamicLanguageModel;
    v5->_dynamicLanguageModel = (NSURL *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SFRequestParameters::dynamicVocabulary"));
    v33 = objc_claimAutoreleasedReturnValue();
    dynamicVocabulary = v5->_dynamicVocabulary;
    v5->_dynamicVocabulary = (NSURL *)v33;

    v5->_detectMultipleUtterances = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SFRequestParameters::detectMultipleUtterances"));
    v5->_onDeviceOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SFRequestParameters::onDeviceOnly"));
    v5->_enableAutoPunctuation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SFRequestParameters::enableAutoPunctuation"));
  }

  return v5;
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (void)setApplicationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)applicationVersion
{
  return self->_applicationVersion;
}

- (void)setApplicationVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)inlineItemList
{
  return self->_inlineItemList;
}

- (void)setInlineItemList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setTaskIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)narrowband
{
  return self->_narrowband;
}

- (void)setNarrowband:(BOOL)a3
{
  self->_narrowband = a3;
}

- (NSDictionary)recognitionOverrides
{
  return self->_recognitionOverrides;
}

- (void)setRecognitionOverrides:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSURL)modelOverrideURL
{
  return self->_modelOverrideURL;
}

- (void)setModelOverrideURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (double)maximumRecognitionDuration
{
  return self->_maximumRecognitionDuration;
}

- (void)setMaximumRecognitionDuration:(double)a3
{
  self->_maximumRecognitionDuration = a3;
}

- (NSURL)dynamicLanguageModel
{
  return self->_dynamicLanguageModel;
}

- (void)setDynamicLanguageModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSURL)dynamicVocabulary
{
  return self->_dynamicVocabulary;
}

- (void)setDynamicVocabulary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)detectMultipleUtterances
{
  return self->_detectMultipleUtterances;
}

- (void)setDetectMultipleUtterances:(BOOL)a3
{
  self->_detectMultipleUtterances = a3;
}

- (BOOL)onDeviceOnly
{
  return self->_onDeviceOnly;
}

- (void)setOnDeviceOnly:(BOOL)a3
{
  self->_onDeviceOnly = a3;
}

- (BOOL)enableAutoPunctuation
{
  return self->_enableAutoPunctuation;
}

- (void)setEnableAutoPunctuation:(BOOL)a3
{
  self->_enableAutoPunctuation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicVocabulary, 0);
  objc_storeStrong((id *)&self->_dynamicLanguageModel, 0);
  objc_storeStrong((id *)&self->_modelOverrideURL, 0);
  objc_storeStrong((id *)&self->_recognitionOverrides, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_inlineItemList, 0);
  objc_storeStrong((id *)&self->_applicationVersion, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
