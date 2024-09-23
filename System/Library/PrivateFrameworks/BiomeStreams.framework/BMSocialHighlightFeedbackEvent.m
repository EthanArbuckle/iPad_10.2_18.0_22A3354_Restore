@implementation BMSocialHighlightFeedbackEvent

- (int)_protoFeedbackType
{
  unint64_t v3;
  NSObject *v4;

  v3 = -[BMSocialHighlightFeedbackEvent feedbackType](self, "feedbackType");
  if (v3 >= 0xB)
  {
    __biome_log_for_category();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[BMSocialHighlightFeedbackEvent _protoFeedbackType].cold.1(self);

    LODWORD(v3) = -1;
  }
  return v3;
}

- (unint64_t)_feedbackTypeForProtoType:(int)a3
{
  uint64_t v3;
  NSObject *v5;

  v3 = *(_QWORD *)&a3;
  if (a3 < 0xB)
    return a3;
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[BMSocialHighlightFeedbackEvent _feedbackTypeForProtoType:].cold.1(v3);

  return 11;
}

- (unsigned)dataVersion
{
  return 3;
}

- (BMSocialHighlightFeedbackEvent)initWithClientIdentifier:(id)a3 feedbackType:(unint64_t)a4 feedbackCreationDate:(id)a5 highlight:(id)a6 clientVariant:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BMSocialHighlightFeedbackEvent *v17;
  BMSocialHighlightFeedbackEvent *v18;
  objc_super v20;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMSocialHighlightFeedbackEvent;
  v17 = -[BMEventBase init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_clientIdentifier, a3);
    v18->_feedbackType = a4;
    objc_storeStrong((id *)&v18->_feedbackCreationDate, a5);
    objc_storeStrong((id *)&v18->_highlight, a6);
    objc_storeStrong((id *)&v18->_clientVariant, a7);
  }

  return v18;
}

- (BMSocialHighlightFeedbackEvent)initWithClientIdentifier:(id)a3 feedbackType:(unint64_t)a4 feedbackCreationDate:(id)a5 highlight:(id)a6
{
  return -[BMSocialHighlightFeedbackEvent initWithClientIdentifier:feedbackType:feedbackCreationDate:highlight:clientVariant:](self, "initWithClientIdentifier:feedbackType:feedbackCreationDate:highlight:clientVariant:", a3, a4, a5, a6, &stru_1E2672FA8);
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  __objc2_class **v6;
  void *v7;

  v5 = a3;
  if (a4 == 4)
  {
    v6 = off_1E2635428;
  }
  else
  {
    if (a4 != 3)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v6 = off_1E2635420;
  }
  v7 = (void *)objc_msgSend(objc_alloc(*v6), "initWithProtoData:", v5);
LABEL_7:

  return v7;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMSocialHighlightFeedbackEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMSocialHighlightFeedbackEvent)initWithProto:(id)a3
{
  id v4;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  BMRankableSocialHighlight *v9;
  void *v10;
  BMRankableSocialHighlight *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  BMSocialHighlightFeedbackEvent *v16;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = (objc_class *)MEMORY[0x1E0C99D68];
    v6 = v4;
    v7 = [v5 alloc];
    objc_msgSend(v6, "feedbackCreationSecondsSinceReferenceDate");
    v8 = (void *)objc_msgSend(v7, "initWithTimeIntervalSinceReferenceDate:");
    v9 = [BMRankableSocialHighlight alloc];
    objc_msgSend(v6, "highlight");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[BMRankableSocialHighlight initWithProto:](v9, "initWithProto:", v10);

    objc_msgSend(v6, "clientIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v6, "feedbackType");

    v14 = -[BMSocialHighlightFeedbackEvent _feedbackTypeForProtoType:](self, "_feedbackTypeForProtoType:", v13);
    -[BMRankableSocialHighlight clientVariant](v11, "clientVariant");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[BMSocialHighlightFeedbackEvent initWithClientIdentifier:feedbackType:feedbackCreationDate:highlight:clientVariant:](self, "initWithClientIdentifier:feedbackType:feedbackCreationDate:highlight:clientVariant:", v12, v14, v8, v11, v15);

    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BMSocialHighlightFeedbackEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBSocialHighlightFeedbackEvent *v5;
  BMSocialHighlightFeedbackEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBSocialHighlightFeedbackEvent initWithData:]([BMPBSocialHighlightFeedbackEvent alloc], "initWithData:", v4);

    self = -[BMSocialHighlightFeedbackEvent initWithProto:](self, "initWithProto:", v5);
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
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  -[BMSocialHighlightFeedbackEvent clientIdentifier](self, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClientIdentifier:", v4);

  objc_msgSend(v3, "setFeedbackType:", -[BMSocialHighlightFeedbackEvent _protoFeedbackType](self, "_protoFeedbackType"));
  -[BMSocialHighlightFeedbackEvent feedbackCreationDate](self, "feedbackCreationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setFeedbackCreationSecondsSinceReferenceDate:");

  -[BMSocialHighlightFeedbackEvent highlight](self, "highlight");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "proto");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHighlight:", v7);

  -[BMSocialHighlightFeedbackEvent clientVariant](self, "clientVariant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClientVariant:", v8);

  return v3;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (unint64_t)feedbackType
{
  return self->_feedbackType;
}

- (NSDate)feedbackCreationDate
{
  return self->_feedbackCreationDate;
}

- (BMRankableSocialHighlight)highlight
{
  return self->_highlight;
}

- (NSString)clientVariant
{
  return self->_clientVariant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientVariant, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_feedbackCreationDate, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (void)_protoFeedbackType
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "feedbackType"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMSocialHighlightFeedbackEvent: unable to convert BMSocialHighlightUnifiedFeedbackType enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

- (void)_feedbackTypeForProtoType:(uint64_t)a1 .cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMSocialHighlightFeedbackEvent: unable to convert BMPBSocialHighlightUnifiedFeedbackType enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
