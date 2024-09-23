@implementation SGMailIntelligenceFollowUpWarning

- (SGMailIntelligenceFollowUpWarning)initWithSnippet:(id)a3 core:(id)a4 signature:(id)a5 detectedLanguage:(id)a6 isIncomingMessage:(BOOL)a7 score:(id)a8 startDate:(id)a9 startDateCore:(id)a10 endDate:(id)a11 endDateCore:(id)a12
{
  _BOOL8 v12;
  SGMailIntelligenceFollowUpWarning *v18;
  SGMailIntelligenceFollowUpWarning *v19;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v12 = a7;
  v25 = a9;
  v24 = a10;
  v23 = a11;
  v22 = a12;
  v26.receiver = self;
  v26.super_class = (Class)SGMailIntelligenceFollowUpWarning;
  v18 = -[SGMailIntelligenceWarning initWithSnippet:core:signature:detectedLanguage:isIncomingMessage:score:](&v26, sel_initWithSnippet_core_signature_detectedLanguage_isIncomingMessage_score_, a3, a4, a5, a6, v12, a8);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_startDate, a9);
    objc_storeStrong((id *)&v19->_startDateCore, a10);
    objc_storeStrong((id *)&v19->_endDate, a11);
    objc_storeStrong((id *)&v19->_endDateCore, a12);
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SGMailIntelligenceFollowUpWarning;
  v4 = a3;
  -[SGMailIntelligenceWarning encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_startDateCore, CFSTR("startDateCore"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_endDateCore, CFSTR("endDateCore"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_type, CFSTR("type"));

}

- (SGMailIntelligenceFollowUpWarning)initWithCoder:(id)a3
{
  id v4;
  SGMailIntelligenceWarning *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  SGMailIntelligenceFollowUpWarning *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v31;
  void *v32;
  SGMailIntelligenceFollowUpWarning *v33;
  void *v34;
  void *v35;
  void *v36;

  v4 = a3;
  v5 = -[SGMailIntelligenceWarning initWithCoder:]([SGMailIntelligenceWarning alloc], "initWithCoder:", v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0D81610];
    v7 = objc_opt_class();
    sgMailIntelligenceLogHandle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v7, CFSTR("startDate"), v4, 1, CFSTR("SGErrorDomain"), 11, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0D81610];
    v11 = objc_opt_class();
    sgMailIntelligenceLogHandle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v11, CFSTR("startDateCore"), v4, 0, CFSTR("SGErrorDomain"), 11, v12);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0D81610];
    v14 = objc_opt_class();
    sgMailIntelligenceLogHandle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v14, CFSTR("endDate"), v4, 1, CFSTR("SGErrorDomain"), 11, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0D81610];
    v18 = objc_opt_class();
    sgMailIntelligenceLogHandle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v18, CFSTR("endDateCore"), v4, 0, CFSTR("SGErrorDomain"), 11, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0D81610];
    v22 = objc_opt_class();
    sgMailIntelligenceLogHandle();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v22, CFSTR("type"), v4, 0, CFSTR("SGErrorDomain"), 11, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0;
    if (v9 && v16)
    {
      objc_msgSend(v4, "error");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        v25 = 0;
      }
      else
      {
        v33 = [SGMailIntelligenceFollowUpWarning alloc];
        -[SGMailIntelligenceWarning snippet](v5, "snippet");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[SGMailIntelligenceWarning core](v5, "core");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[SGMailIntelligenceWarning signature](v5, "signature");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[SGMailIntelligenceWarning detectedLanguage](v5, "detectedLanguage");
        v34 = v9;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[SGMailIntelligenceWarning isIncomingMessage](v5, "isIncomingMessage");
        -[SGMailIntelligenceWarning score](v5, "score");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[SGMailIntelligenceFollowUpWarning initWithSnippet:core:signature:detectedLanguage:isIncomingMessage:score:startDate:startDateCore:endDate:endDateCore:](v33, "initWithSnippet:core:signature:detectedLanguage:isIncomingMessage:score:startDate:startDateCore:endDate:endDateCore:", v35, v32, v27, v28, v31, v29, v34, v36, v16, v20);

        v9 = v34;
        -[SGMailIntelligenceFollowUpWarning setType:](v25, "setType:", v24);
      }
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (SGMailIntelligenceFollowUpWarning)initWithNSDictionary:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  SGMailIntelligenceFollowUpWarning *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SGMailIntelligenceFollowUpWarning *v15;
  void *v16;
  NSObject *v17;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("1"));

  if ((v6 & 1) != 0)
  {
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("2"));

  if (!v8)
  {
    sgMailIntelligenceLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1A2267000, v17, OS_LOG_TYPE_FAULT, "SGMailIntelligenceFollowUpWarning version not supported.", buf, 2u);
    }

    goto LABEL_7;
  }
  v9 = [SGMailIntelligenceFollowUpWarning alloc];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("signature"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("detectedLanguage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("score"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SGMailIntelligenceFollowUpWarning initWithSnippet:core:signature:detectedLanguage:isIncomingMessage:score:startDate:startDateCore:endDate:endDateCore:](v9, "initWithSnippet:core:signature:detectedLanguage:isIncomingMessage:score:startDate:startDateCore:endDate:endDateCore:", &stru_1E4762D08, &stru_1E4762D08, v10, v11, 0, v12, v13, &stru_1E4762D08, v14, &stru_1E4762D08);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMailIntelligenceFollowUpWarning setType:](v15, "setType:", v16);

LABEL_8:
  return v15;
}

- (SGMailIntelligenceFollowUpWarning)initWithNSData:(id)a3
{
  void *v4;
  SGMailIntelligenceFollowUpWarning *v5;

  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SGMailIntelligenceFollowUpWarning initWithNSDictionary:](self, "initWithNSDictionary:", v4);

  return v5;
}

- (SGMailIntelligenceFollowUpWarning)initWithString:(id)a3
{
  void *v4;
  SGMailIntelligenceFollowUpWarning *v5;
  id v6;
  id v8;

  if (a3)
  {
    objc_msgSend(a3, "dataUsingEncoding:", 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v8 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, &v8);
      v5 = (SGMailIntelligenceFollowUpWarning *)objc_claimAutoreleasedReturnValue();
      v6 = v8;
      if (v5)
      {
        self = -[SGMailIntelligenceFollowUpWarning initWithNSDictionary:](self, "initWithNSDictionary:", v5);

        v5 = self;
      }
    }
    else
    {
      v6 = 0;
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)toLightNSDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("2"), CFSTR("version"));
  -[SGMailIntelligenceWarning signature](self, "signature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __56__SGMailIntelligenceFollowUpWarning_toLightNSDictionary__block_invoke(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("signature"));

  -[SGMailIntelligenceWarning detectedLanguage](self, "detectedLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __56__SGMailIntelligenceFollowUpWarning_toLightNSDictionary__block_invoke(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("detectedLanguage"));

  -[SGMailIntelligenceWarning score](self, "score");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __56__SGMailIntelligenceFollowUpWarning_toLightNSDictionary__block_invoke(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("score"));

  -[SGMailIntelligenceFollowUpWarning type](self, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __56__SGMailIntelligenceFollowUpWarning_toLightNSDictionary__block_invoke(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("type"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeysForObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "removeObjectsForKeys:", v13);
  return v3;
}

- (id)toLightNSData
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB38B0];
  -[SGMailIntelligenceFollowUpWarning toLightNSDictionary](self, "toLightNSDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithPropertyList:format:options:error:", v5, 200, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMailIntelligenceWarning.m"), 500, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("output"));

  }
  return v6;
}

- (id)toLightJson
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB36D8];
  -[SGMailIntelligenceFollowUpWarning toLightNSDictionary](self, "toLightNSDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "dataWithJSONObject:options:error:", v5, 0, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMailIntelligenceWarning.m"), 509, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("output"));

  }
  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SGMailIntelligenceWarning snippet](self, "snippet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMailIntelligenceWarning signature](self, "signature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMailIntelligenceWarning score](self, "score");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<SGMailIntelligenceFollowUpWarningtriggered on: %@ (with signature %@) score: %@ valid from %@ to %@>"), v4, v5, v6, self->_startDate, self->_endDate);

  return v7;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSString)startDateCore
{
  return self->_startDateCore;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSString)endDateCore
{
  return self->_endDateCore;
}

- (NSNumber)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_endDateCore, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDateCore, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

id __56__SGMailIntelligenceFollowUpWarning_toLightNSDictionary__block_invoke(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
