@implementation FBKSFeedbackCount

- (FBKSFeedbackCount)initWithCampaign:(id)a3 campaignErrors:(id)a4 feedbackSubmitted:(id)a5 declineCount:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  FBKSFeedbackCount *v14;
  FBKSFeedbackCount *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FBKSFeedbackCount;
  v14 = -[FBKSFeedbackCount init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_currentCampaign, a3);
    objc_storeStrong((id *)&v15->_errors, a4);
    objc_storeStrong((id *)&v15->_feedbackFiled, a5);
    v15->_declineCount = a6;
  }

  return v15;
}

- (id)debugDescription
{
  void *v2;
  void *v3;

  -[FBKSFeedbackCount swiftObject](self, "swiftObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (FBKSFeedbackCount)initWithSwiftObject:(id)a3
{
  id v3;
  FBKSCampaign *v4;
  void *v5;
  FBKSCampaign *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  FBKSFeedback *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  FBKSCampaignError *v24;
  FBKSFeedbackCount *v25;
  FBKSFeedbackCount *v26;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = [FBKSCampaign alloc];
  objc_msgSend(v3, "currentCampaign");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FBKSCampaign initWithSwiftObject:](v4, "initWithSwiftObject:", v5);

  v7 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "feedbackFiled");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v3, "feedbackFiled");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        v15 = -[FBKSFeedback initWithSwiftObject:]([FBKSFeedback alloc], "initWithSwiftObject:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v14));
        if (v15)
          objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v12);
  }

  v16 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "errors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v17, "count"));

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v3, "errors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v30;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(v19);
        v24 = -[FBKSCampaignError initWithSwiftObject:]([FBKSCampaignError alloc], "initWithSwiftObject:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v23));
        if (v24)
          objc_msgSend(v18, "addObject:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v21);
  }

  v25 = -[FBKSFeedbackCount initWithCampaign:campaignErrors:feedbackSubmitted:declineCount:](self, "initWithCampaign:campaignErrors:feedbackSubmitted:declineCount:", v6, v18, v9, objc_msgSend(v3, "declineCount"));
  v26 = v25;
  if (v25)
    -[FBKSFeedbackCount setSwiftObject:](v25, "setSwiftObject:", v3);

  return v26;
}

+ (void)fetchCountsForFormWithIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__FBKSFeedbackCount_fetchCountsForFormWithIdentifier_completion___block_invoke;
  v7[3] = &unk_250C5F3F0;
  v8 = v5;
  v6 = v5;
  +[FBKSFeedbackCount_FrameworkPrivateName fetchCountsForFormWithIdentifier:completion:](FBKSFeedbackCount_FrameworkPrivateName, "fetchCountsForFormWithIdentifier:completion:", a3, v7);

}

void __65__FBKSFeedbackCount_fetchCountsForFormWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  FBKSFeedbackCount *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (v8)
    {
      v6 = -[FBKSFeedbackCount initWithSwiftObject:]([FBKSFeedbackCount alloc], "initWithSwiftObject:", v8);
      (*(void (**)(_QWORD, FBKSFeedbackCount *, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v6, 0);
    }
    else
    {
      v7 = *(_QWORD *)(a1 + 32);
      FBKSError(-200, CFSTR("Unexpected nil FBKSFeedbackCount"));
      v6 = (FBKSFeedbackCount *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, FBKSFeedbackCount *))(v7 + 16))(v7, 0, v6);
    }

  }
}

- (id)description
{
  void *v2;
  void *v3;

  -[FBKSFeedbackCount swiftObject](self, "swiftObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (FBKSCampaign)currentCampaign
{
  return self->_currentCampaign;
}

- (NSArray)feedbackFiled
{
  return self->_feedbackFiled;
}

- (NSArray)errors
{
  return self->_errors;
}

- (int64_t)declineCount
{
  return self->_declineCount;
}

- (FBKSFeedbackCount_FrameworkPrivateName)swiftObject
{
  return self->_swiftObject;
}

- (void)setSwiftObject:(id)a3
{
  objc_storeStrong((id *)&self->_swiftObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftObject, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_feedbackFiled, 0);
  objc_storeStrong((id *)&self->_currentCampaign, 0);
}

@end
