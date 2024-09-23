@implementation BMSocialHighlightFeedbackEvent_v4

- (BMSocialHighlightFeedbackEvent_v4)initWithProto:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  BMRankableSocialHighlight *v8;
  void *v9;
  BMRankableSocialHighlight *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BMSocialHighlightFeedbackEvent_v4 *v15;
  NSObject *v16;
  void *v17;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v6 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v5, "feedbackCreationSecondsSinceReferenceDate");
    v7 = (void *)objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");
    v8 = [BMRankableSocialHighlight alloc];
    objc_msgSend(v5, "highlight");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[BMRankableSocialHighlight initWithProto:](v8, "initWithProto:", v9);

    objc_msgSend(v5, "clientIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v5, "feedbackType");
    v13 = v12;
    if (v12 >= 0xC)
    {
      __biome_log_for_category();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[BMSocialHighlightFeedbackEvent_v4 initWithProto:].cold.1(v13);

      v14 = 11;
    }
    else
    {
      v14 = qword_18DC0BB58[(int)v12];
    }
    -[BMRankableSocialHighlight clientVariant](v10, "clientVariant");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[BMSocialHighlightFeedbackEvent initWithClientIdentifier:feedbackType:feedbackCreationDate:highlight:clientVariant:](self, "initWithClientIdentifier:feedbackType:feedbackCreationDate:highlight:clientVariant:", v11, v14, v7, v10, v17);

    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1)
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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMSocialHighlightFeedbackEvent: unable to convert BMPBSocialHighlightUnifiedFeedbackType v4 enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
