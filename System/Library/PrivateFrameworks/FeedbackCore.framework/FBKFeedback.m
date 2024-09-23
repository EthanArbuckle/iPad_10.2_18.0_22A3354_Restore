@implementation FBKFeedback

+ (id)entityName
{
  return CFSTR("Feedback");
}

- (void)setPropertiesFromJSONObject:(id)a3
{
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
  id v14;

  v14 = a3;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("for_build"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[FBKFeedback setBuild:](self, "setBuild:", v5);
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("form_response_id"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[FBKFeedback setFormResponseID:](self, "setFormResponseID:", v7);
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("feedback_followup_ids"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[FBKFeedback setFeedbackFollowupIDs:](self, "setFeedbackFollowupIDs:", v9);
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v11, "isEqualToString:", 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKFeedback setRawType:](self, "setRawType:", v12);

  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFeedback setUpdatedAt:](self, "setUpdatedAt:", v13);

}

- (BOOL)hasVisibleFollowupContent
{
  void *v3;
  char v4;
  void *v5;

  -[FBKFeedback validFeedbackFollowups](self, "validFeedbackFollowups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[FBKFeedback contentItem](self, "contentItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "hasFollowupPending");

  }
  return v4;
}

- (FBKFormResponseStub)formResponseStub
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;

  -[FBKFeedback contentItem](self, "contentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[FBKLog model](FBKLog, "model");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[FBKFeedback formResponseStub].cold.1(v4);

  }
  -[FBKFeedback contentItem](self, "contentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formResponseStub");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBKFormResponseStub *)v6;
}

- (NSArray)feedbackFollowups
{
  void *v3;
  void *v4;

  -[FBKFeedback willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("feedbackFollowups"));
  -[FBKFeedback primitiveFeedbackFollowups](self, "primitiveFeedbackFollowups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKFeedback didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("feedbackFollowups"));
  return (NSArray *)v4;
}

- (void)setFeedbackFollowups:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[FBKFeedback willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("feedbackFollowups"));
  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKFeedback setPrimitiveFeedbackFollowups:](self, "setPrimitiveFeedbackFollowups:", v5);
  -[FBKFeedback didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("feedbackFollowups"));
}

- (void)addFollowup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[FBKFeedback feedbackFollowups](self, "feedbackFollowups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFeedback setFeedbackFollowups:](self, "setFeedbackFollowups:", v6);

  -[FBKFeedback feedbackFollowupIDs](self, "feedbackFollowupIDs");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "arrayByAddingObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFeedback setFeedbackFollowupIDs:](self, "setFeedbackFollowupIDs:", v8);

}

- (void)deleteFollowup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *);
  void *v21;
  NSObject *v22;
  _QWORD v23[4];
  NSObject *v24;

  v4 = a3;
  -[FBKFeedback feedbackFollowupIDs](self, "feedbackFollowupIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  v8 = MEMORY[0x24BDAC760];
  if (v7)
  {
    -[FBKFeedback feedbackFollowupIDs](self, "feedbackFollowupIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v8;
    v23[1] = 3221225472;
    v23[2] = __30__FBKFeedback_deleteFollowup___block_invoke;
    v23[3] = &unk_24E156EA0;
    v24 = v4;
    objc_msgSend(v9, "ded_rejectItemsPassingTest:", v23);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKFeedback setFeedbackFollowupIDs:](self, "setFeedbackFollowupIDs:", v10);

    v11 = v24;
  }
  else
  {
    +[FBKLog model](FBKLog, "model");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[FBKFeedback deleteFollowup:].cold.2(v4);
  }

  -[FBKFeedback feedbackFollowups](self, "feedbackFollowups");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v4);

  if (v13)
  {
    -[FBKFeedback managedObjectContext](self, "managedObjectContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deleteObject:", v4);

    -[FBKFeedback feedbackFollowups](self, "feedbackFollowups");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v8;
    v19 = 3221225472;
    v20 = __30__FBKFeedback_deleteFollowup___block_invoke_15;
    v21 = &unk_24E156EC8;
    v22 = v4;
    objc_msgSend(v15, "ded_rejectItemsPassingTest:", &v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKFeedback setFeedbackFollowups:](self, "setFeedbackFollowups:", v16, v18, v19, v20, v21);

    v17 = v22;
  }
  else
  {
    +[FBKLog model](FBKLog, "model");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[FBKFeedback deleteFollowup:].cold.1(v4);
  }

}

uint64_t __30__FBKFeedback_deleteFollowup___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToNumber:", v4);

  return v5;
}

uint64_t __30__FBKFeedback_deleteFollowup___block_invoke_15(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToNumber:", v4);

  return v5;
}

- (id)validFeedbackFollowups
{
  void *v2;
  void *v3;

  -[FBKFeedback feedbackFollowups](self, "feedbackFollowups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ded_rejectItemsPassingTest:", &__block_literal_global_6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __37__FBKFeedback_validFeedbackFollowups__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (objc_msgSend(v2, "type")
    || (objc_msgSend(v2, "feedbackFollowupResponses"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "count"),
        v3,
        v4))
  {
    v5 = 0;
  }
  else
  {
    +[FBKLog ffu](FBKLog, "ffu");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v2, "ID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = 67109120;
      v9[1] = objc_msgSend(v8, "intValue");
      _os_log_impl(&dword_21D9A9000, v7, OS_LOG_TYPE_DEFAULT, "will not display unsolicited ffu without response: [%i]", (uint8_t *)v9, 8u);

    }
    v5 = 1;
  }

  return v5;
}

- (BOOL)hasEqualMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  if (!v4)
    goto LABEL_5;
  -[FBKFeedback formResponseID](self, "formResponseID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formResponseID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToNumber:", v6);

  if (!v7)
    goto LABEL_5;
  -[FBKManagedFeedbackObject ID](self, "ID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToNumber:", v9);

  if (v10)
  {
    -[FBKFeedback feedbackFollowupIDs](self, "feedbackFollowupIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "feedbackFollowupIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToArray:", v12);

  }
  else
  {
LABEL_5:
    v13 = 0;
  }

  return v13;
}

- (unint64_t)type
{
  void *v2;
  unint64_t v3;

  -[FBKFeedback rawType](self, "rawType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (BOOL)allowUnsolicitedFollowup
{
  void *v2;
  char v3;

  -[FBKFeedback contentItem](self, "contentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowUnsolicitedFollowup");

  return v3;
}

- (void)formResponseStub
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21D9A9000, log, OS_LOG_TYPE_ERROR, "Cannot reach FormReponse Stub. Content item is nil", v1, 2u);
}

- (void)deleteFollowup:(void *)a1 .cold.1(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "ID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intValue");
  objc_msgSend(a1, "feedback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intValue");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_21D9A9000, v5, v6, "FFU [%i] not in Feedback [%i], cannot remove FFU", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_0();
}

- (void)deleteFollowup:(void *)a1 .cold.2(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "ID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intValue");
  objc_msgSend(a1, "feedback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intValue");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_21D9A9000, v5, v6, "FFU ID [%i] not in Feedback [%i], cannot remove ID", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_0();
}

@end
