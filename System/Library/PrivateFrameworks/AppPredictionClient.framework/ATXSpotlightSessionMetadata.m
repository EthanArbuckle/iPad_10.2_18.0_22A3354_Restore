@implementation ATXSpotlightSessionMetadata

- (ATXSpotlightSessionMetadata)initWithAppConsumerSubType:(unsigned __int8)a3 actionConsumerSubType:(unsigned __int8)a4
{
  return -[ATXSpotlightSessionMetadata initWithAppConsumerSubType:actionConsumerSubType:engagedAppString:didSearchDuringSession:](self, "initWithAppConsumerSubType:actionConsumerSubType:engagedAppString:didSearchDuringSession:", a3, a4, 0, 0);
}

- (ATXSpotlightSessionMetadata)initWithAppConsumerSubType:(unsigned __int8)a3 actionConsumerSubType:(unsigned __int8)a4 engagedAppString:(id)a5 didSearchDuringSession:(BOOL)a6
{
  id v11;
  ATXSpotlightSessionMetadata *v12;
  ATXSpotlightSessionMetadata *v13;
  objc_super v15;

  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXSpotlightSessionMetadata;
  v12 = -[ATXSpotlightSessionMetadata init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_appConsumerSubType = a3;
    v12->_actionConsumerSubType = a4;
    objc_storeStrong((id *)&v12->_engagedAppString, a5);
    v13->_didSearchDuringSession = a6;
  }

  return v13;
}

- (NSString)description
{
  void *v3;
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1A85A4F90](self, a2);
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", self->_appConsumerSubType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", self->_actionConsumerSubType);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (self->_didSearchDuringSession)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v11 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@: \napp consumersubtype: %@ \naction consumersubtype: %@ \nengaged app string: %@ \ndid search during session: %@ \n"), v6, v7, v8, self->_engagedAppString, v10);

  objc_autoreleasePoolPop(v3);
  return (NSString *)v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForBOOL:(BOOL)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  uint64_t appConsumerSubType;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CF9508];
  appConsumerSubType = self->_appConsumerSubType;
  v8 = a3;
  objc_msgSend(v4, "stringForConsumerSubtype:", appConsumerSubType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("appConsumerSubType"));

  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", self->_actionConsumerSubType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("actionConsumerSubType"));

  objc_msgSend(v8, "encodeBool:forKey:", self->_didSearchDuringSession, CFSTR("didSearchDuringSession"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_engagedAppString, CFSTR("engagedAppString"));

}

- (ATXSpotlightSessionMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  ATXSpotlightSessionMetadata *v12;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  char v19;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appConsumerSubType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ATXSpotlightSessionMetadata checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v5, CFSTR("appConsumerSubType"), v4, CFSTR("com.apple.ATXFeedbackSessionMetadata"), -1)|| (v19 = 0, v6 = objc_msgSend(MEMORY[0x1E0CF9508], "consumerSubtypeForString:found:", v5, &v19), !v19))
  {
    v12 = 0;
  }
  else
  {
    v7 = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionConsumerSubType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ATXSpotlightSessionMetadata checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v8, CFSTR("actionConsumerSubType"), v4, CFSTR("com.apple.ATXFeedbackSessionMetadata"), -1)|| (v18 = 0, v9 = objc_msgSend(MEMORY[0x1E0CF9508], "consumerSubtypeForString:found:", v8, &v18), !v18)|| (v10 = v9, v11 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("didSearchDuringSession")), -[ATXSpotlightSessionMetadata checkAndReportDecodingFailureIfNeededForBOOL:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForBOOL:key:coder:errorDomain:errorCode:", v11, CFSTR("didSearchDuringSession"), v4, CFSTR("com.apple.ATXFeedbackSessionMetadata"), -1)))
    {
      v12 = 0;
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0D81610];
      v15 = objc_opt_class();
      __atxlog_handle_feedback();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v15, CFSTR("engagedAppString"), v4, 0, CFSTR("com.apple.ATXFeedbackSessionMetadata"), -1, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      self = -[ATXSpotlightSessionMetadata initWithAppConsumerSubType:actionConsumerSubType:engagedAppString:didSearchDuringSession:](self, "initWithAppConsumerSubType:actionConsumerSubType:engagedAppString:didSearchDuringSession:", v7, v10, v17, v11);
      v12 = self;
    }

  }
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  ATXSpotlightSessionMetadata *v4;
  ATXSpotlightSessionMetadata *v5;
  BOOL v6;

  v4 = (ATXSpotlightSessionMetadata *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXSpotlightSessionMetadata isEqualToATXSpotlightSessionMetadata:](self, "isEqualToATXSpotlightSessionMetadata:", v5);

  return v6;
}

- (BOOL)isEqualToATXSpotlightSessionMetadata:(id)a3
{
  _QWORD *v4;
  int appConsumerSubType;
  int actionConsumerSubType;
  int didSearchDuringSession;
  NSString *v8;
  NSString *v9;
  char v10;

  v4 = a3;
  appConsumerSubType = self->_appConsumerSubType;
  if (appConsumerSubType == objc_msgSend(v4, "appConsumerSubType")
    && (actionConsumerSubType = self->_actionConsumerSubType,
        actionConsumerSubType == objc_msgSend(v4, "actionConsumerSubType"))
    && (didSearchDuringSession = self->_didSearchDuringSession,
        didSearchDuringSession == objc_msgSend(v4, "didSearchDuringSession")))
  {
    v8 = self->_engagedAppString;
    v9 = v8;
    if (v8 == (NSString *)v4[2])
      v10 = 1;
    else
      v10 = -[NSString isEqual:](v8, "isEqual:");

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;

  v2 = self->_actionConsumerSubType - (unint64_t)self->_appConsumerSubType + 32 * self->_appConsumerSubType;
  v3 = self->_didSearchDuringSession - v2 + 32 * v2;
  return (unint64_t)&self->_engagedAppString[4 * v3] - v3;
}

- (unsigned)appConsumerSubType
{
  return self->_appConsumerSubType;
}

- (void)setAppConsumerSubType:(unsigned __int8)a3
{
  self->_appConsumerSubType = a3;
}

- (unsigned)actionConsumerSubType
{
  return self->_actionConsumerSubType;
}

- (void)setActionConsumerSubType:(unsigned __int8)a3
{
  self->_actionConsumerSubType = a3;
}

- (NSString)engagedAppString
{
  return self->_engagedAppString;
}

- (void)setEngagedAppString:(id)a3
{
  objc_storeStrong((id *)&self->_engagedAppString, a3);
}

- (BOOL)didSearchDuringSession
{
  return self->_didSearchDuringSession;
}

- (void)setDidSearchDuringSession:(BOOL)a3
{
  self->_didSearchDuringSession = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagedAppString, 0);
}

@end
