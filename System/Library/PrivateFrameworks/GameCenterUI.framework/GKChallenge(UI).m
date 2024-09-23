@implementation GKChallenge(UI)

- (void)loadImageWithSource:()UI URLString:withHandler:
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  _QWORD v22[4];
  id v23;
  NSObject *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__12;
  v30 = __Block_byref_object_dispose__12;
  v31 = 0;
  v11 = dispatch_group_create();
  v12 = v11;
  v13 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    dispatch_group_enter(v11);
    v14 = MEMORY[0x1E0C80D38];
    v15 = MEMORY[0x1E0C80D38];
    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = __61__GKChallenge_UI__loadImageWithSource_URLString_withHandler___block_invoke;
    v22[3] = &unk_1E59C8DC0;
    v23 = v8;
    v25 = &v26;
    v24 = v12;
    objc_msgSend(v23, "loadImageForURLString:reference:queue:handler:", v9, a1, v14, v22);

    v16 = v23;
  }
  else
  {
    objc_msgSend(v8, "renderedDefaultImage");
    v17 = objc_claimAutoreleasedReturnValue();
    v16 = (id)v27[5];
    v27[5] = v17;
  }

  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __61__GKChallenge_UI__loadImageWithSource_URLString_withHandler___block_invoke_2;
  v19[3] = &unk_1E59C8DE8;
  v20 = v10;
  v21 = &v26;
  v18 = v10;
  dispatch_group_notify(v12, MEMORY[0x1E0C80D38], v19);

  _Block_object_dispose(&v26, 8);
}

- (void)loadBannerImageWithHandler:()UI
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "iconSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "smallIconURLString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadImageWithSource:URLString:withHandler:", v6, v5, v4);

}

- (void)loadImageWithCompletionHandler:()UI
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "iconSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "iconURLString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadImageWithSource:URLString:withHandler:", v6, v5, v4);

}

- (uint64_t)alertGoalText
{
  id v0;
  void *v1;

  if (!*MEMORY[0x1E0D25460])
    v0 = (id)GKOSLoggers();
  v1 = (void *)*MEMORY[0x1E0D25450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
    -[GKChallenge(UI) alertGoalText].cold.1(v1);
  return 0;
}

- (uint64_t)listTitleText
{
  id v0;
  void *v1;

  if (!*MEMORY[0x1E0D25460])
    v0 = (id)GKOSLoggers();
  v1 = (void *)*MEMORY[0x1E0D25450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
    -[GKChallenge(UI) alertGoalText].cold.1(v1);
  return 0;
}

- (uint64_t)listGoalText
{
  id v0;
  void *v1;

  if (!*MEMORY[0x1E0D25460])
    v0 = (id)GKOSLoggers();
  v1 = (void *)*MEMORY[0x1E0D25450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
    -[GKChallenge(UI) alertGoalText].cold.1(v1);
  return 0;
}

- (uint64_t)composeGoalText
{
  id v0;
  void *v1;

  if (!*MEMORY[0x1E0D25460])
    v0 = (id)GKOSLoggers();
  v1 = (void *)*MEMORY[0x1E0D25450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
    -[GKChallenge(UI) alertGoalText].cold.1(v1);
  return 0;
}

- (uint64_t)detailGoalText
{
  id v0;
  void *v1;

  if (!*MEMORY[0x1E0D25460])
    v0 = (id)GKOSLoggers();
  v1 = (void *)*MEMORY[0x1E0D25450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
    -[GKChallenge(UI) alertGoalText].cold.1(v1);
  return 0;
}

- (id)detailFromText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "issuingPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayNameWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)iconSource
{
  id v0;
  void *v1;

  if (!*MEMORY[0x1E0D25460])
    v0 = (id)GKOSLoggers();
  v1 = (void *)*MEMORY[0x1E0D25450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
    -[GKChallenge(UI) alertGoalText].cold.1(v1);
  return 0;
}

- (uint64_t)smallIconURLString
{
  id v0;
  void *v1;

  if (!*MEMORY[0x1E0D25460])
    v0 = (id)GKOSLoggers();
  v1 = (void *)*MEMORY[0x1E0D25450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
    -[GKChallenge(UI) alertGoalText].cold.1(v1);
  return 0;
}

- (uint64_t)iconURLString
{
  id v0;
  void *v1;

  if (!*MEMORY[0x1E0D25460])
    v0 = (id)GKOSLoggers();
  v1 = (void *)*MEMORY[0x1E0D25450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
    -[GKChallenge(UI) alertGoalText].cold.1(v1);
  return 0;
}

+ (id)challengesNotSupportedAlertController
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v0 = (void *)MEMORY[0x1E0DC3450];
  GKGameCenterUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "alertControllerWithTitle:message:preferredStyle:", v2, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC3448];
  GKGameCenterUIFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v9);

  return v5;
}

+ (id)tooManyPlayersAlertController
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v0 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", v2, 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0DC3450];
  GKGameCenterUIFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v3, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC3448];
  GKGameCenterUIFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionWithTitle:style:handler:", v10, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v11);

  return v7;
}

- (void)alertGoalText
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_7_3(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_3_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_8(&dword_1AB361000, v4, v5, "%@ needs to implement me!", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_3();
}

@end
