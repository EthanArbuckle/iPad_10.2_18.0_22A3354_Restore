@implementation CAXContextualActionsFeedbackEvent

- (CAXContextualActionsFeedbackEvent)initWithSelectedAction:(id)a3 suggestion:(id)a4 deviceContext:(id)a5 sessionIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CAXContextualActionsFeedbackEvent *v15;
  CAXContextualActionsFeedbackEvent *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CAXContextualActionsFeedbackEvent;
  v15 = -[CAXContextualActionsFeedbackEvent init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_selectedAction, a3);
    objc_storeStrong((id *)&v16->_suggestion, a4);
    objc_storeStrong((id *)&v16->_deviceContext, a5);
    objc_storeStrong((id *)&v16->_sessionIdentifier, a6);
  }

  return v16;
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

  v22[1] = *MEMORY[0x24BDAC8D0];
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
      v16 = objc_alloc(MEMORY[0x24BDD1540]);
      v21 = *MEMORY[0x24BDD0FC8];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
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
  id v4;
  id v5;

  v4 = a3;
  -[CAXContextualActionsFeedbackEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CAXProtobufData"));

}

- (CAXContextualActionsFeedbackEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  CAXContextualActionsFeedbackEvent *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAXProtobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CAXContextualActionsFeedbackEvent initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  return v6;
}

- (id)jsonRawData
{
  void *v2;
  void *v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v17[0] = CFSTR("selectedAction");
  -[CAXContextualActionsFeedbackEvent selectedAction](self, "selectedAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CAXContextualActionsFeedbackEvent selectedAction](self, "selectedAction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "jsonRawData");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("nil");
  }
  v18[0] = v5;
  v17[1] = CFSTR("suggestion");
  -[CAXContextualActionsFeedbackEvent suggestion](self, "suggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[CAXContextualActionsFeedbackEvent suggestion](self, "suggestion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "jsonRawData");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("nil");
  }
  v18[1] = v7;
  v17[2] = CFSTR("deviceContext");
  -[CAXContextualActionsFeedbackEvent deviceContext](self, "deviceContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[CAXContextualActionsFeedbackEvent deviceContext](self, "deviceContext");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "jsonRawData");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("nil");
  }
  v18[2] = v9;
  v17[3] = CFSTR("sessionIdentifier");
  -[CAXContextualActionsFeedbackEvent sessionIdentifier](self, "sessionIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = CFSTR("nil");
  v18[3] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {

  }
  if (v6)
  {

  }
  if (v4)
  {

  }
  return v13;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD1608];
  -[CAXContextualActionsFeedbackEvent jsonRawData](self, "jsonRawData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[CAXContextualActionsFeedbackEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CAXContextualActionsFeedbackEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  CAXContextualAction *v6;
  void *v7;
  CAXContextualAction *v8;
  CAXSuggestion *v9;
  void *v10;
  CAXSuggestion *v11;
  CAXPredictionContext *v12;
  void *v13;
  CAXPredictionContext *v14;
  void *v15;
  CAXContextualActionsFeedbackEvent *v16;
  NSObject *v17;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_contextual_actions();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[CAXContextualActionsFeedbackEvent initWithProto:].cold.1((uint64_t)self, v17);

    goto LABEL_7;
  }
  v5 = v4;
  v6 = [CAXContextualAction alloc];
  objc_msgSend(v5, "selectedAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CAXContextualAction initWithProto:](v6, "initWithProto:", v7);

  v9 = [CAXSuggestion alloc];
  objc_msgSend(v5, "suggestion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CAXSuggestion initWithProto:](v9, "initWithProto:", v10);

  v12 = [CAXPredictionContext alloc];
  objc_msgSend(v5, "deviceContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CAXPredictionContext initWithProto:](v12, "initWithProto:", v13);

  objc_msgSend(v5, "sessionIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  self = -[CAXContextualActionsFeedbackEvent initWithSelectedAction:suggestion:deviceContext:sessionIdentifier:](self, "initWithSelectedAction:suggestion:deviceContext:sessionIdentifier:", v8, v11, v14, v15);
  v16 = self;
LABEL_8:

  return v16;
}

- (CAXContextualActionsFeedbackEvent)initWithProtoData:(id)a3
{
  id v4;
  CAXPBContextualActionsFeedbackEvent *v5;
  CAXContextualActionsFeedbackEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[CAXPBContextualActionsFeedbackEvent initWithData:]([CAXPBContextualActionsFeedbackEvent alloc], "initWithData:", v4);

    self = -[CAXContextualActionsFeedbackEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setSessionIdentifier:", self->_sessionIdentifier);
  -[CAXContextualAction proto](self->_selectedAction, "proto");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelectedAction:", v4);

  -[CAXPredictionContext proto](self->_deviceContext, "proto");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDeviceContext:", v5);

  -[CAXSuggestion proto](self->_suggestion, "proto");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSuggestion:", v6);

  return v3;
}

- (CAXContextualAction)selectedAction
{
  return self->_selectedAction;
}

- (void)setSelectedAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CAXSuggestion)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CAXPredictionContext)deviceContext
{
  return self->_deviceContext;
}

- (void)setDeviceContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceContext, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_selectedAction, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_2196B3000, a2, OS_LOG_TYPE_FAULT, "Unable to construct class %@ from ProtoBuf object", (uint8_t *)&v5, 0xCu);

}

@end
