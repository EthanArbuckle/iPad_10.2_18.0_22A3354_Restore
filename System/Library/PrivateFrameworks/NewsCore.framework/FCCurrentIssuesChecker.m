@implementation FCCurrentIssuesChecker

- (FCCurrentIssuesChecker)initWithContext:(id)a3 subscriptionController:(id)a4 issueReadingHistory:(id)a5 bundleSubscriptionProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  FCCurrentIssuesChecker *v15;
  FCCurrentIssuesChecker *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)FCCurrentIssuesChecker;
  v15 = -[FCCurrentIssuesChecker init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_context, a3);
    objc_storeStrong((id *)&v16->_subscriptionController, a4);
    objc_storeStrong((id *)&v16->_issueReadingHistory, a5);
    objc_storeStrong((id *)&v16->_bundleSubscriptionProvider, a6);
  }

  return v16;
}

- (FCCurrentIssuesChecker)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCCurrentIssuesChecker init]";
    v9 = 2080;
    v10 = "FCCurrentIssuesChecker.m";
    v11 = 1024;
    v12 = 60;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCCurrentIssuesChecker init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)fetchUsersCurrentIssuesWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[6];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke;
  v26[3] = &unk_1E463D3A8;
  v26[4] = self;
  objc_msgSend(MEMORY[0x1E0D60AF0], "firstly:", v26);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v5;
  v25[1] = 3221225472;
  v25[2] = __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_2;
  v25[3] = &unk_1E4646198;
  v25[4] = self;
  objc_msgSend(v18, "thenOn:then:", v17, v25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v5;
  v24[1] = 3221225472;
  v24[2] = __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_12;
  v24[3] = &unk_1E46461C0;
  v24[4] = self;
  objc_msgSend(v6, "thenOn:then:", v7, v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v5;
  v23[1] = 3221225472;
  v23[2] = __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_14;
  v23[3] = &unk_1E46461C0;
  v23[4] = self;
  objc_msgSend(v8, "thenOn:then:", v9, v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v5;
  v21[1] = 3221225472;
  v21[2] = __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_17;
  v21[3] = &unk_1E46461E8;
  v21[4] = self;
  v12 = v4;
  v22 = v12;
  objc_msgSend(v10, "thenOn:then:", v11, v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v5;
  v19[1] = 3221225472;
  v19[2] = __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_20;
  v19[3] = &unk_1E463DB48;
  v20 = v12;
  v15 = v12;
  v16 = (id)objc_msgSend(v13, "errorOn:error:", v14, v19);

}

id __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke(uint64_t a1)
{
  return -[FCCurrentIssuesChecker _promiseBundleChannelIDs](*(void **)(a1 + 32));
}

- (id)_promiseBundleChannelIDs
{
  void *v1;
  id v2;
  _QWORD v4[5];

  if (a1)
  {
    v1 = a1;
    v2 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __50__FCCurrentIssuesChecker__promiseBundleChannelIDs__block_invoke;
    v4[3] = &unk_1E463DAD0;
    v4[4] = v1;
    a1 = (void *)objc_msgSend(v2, "initWithResolver:", v4);
  }
  return a1;
}

id __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  FCCurrentIssuesPromiseChainingData *v4;
  FCCurrentIssuesCheckerResult *v5;
  void *v6;
  NSOrderedSet *bundleChannelIDs;
  NSOrderedSet *v8;
  NSObject *v9;
  uint64_t v10;
  FCCurrentIssuesPromiseChainingData *v11;
  id v12;
  void *v13;
  __int128 v15;
  void (*v16)(_QWORD *, void *, void *);
  void *v17;
  uint64_t v18;
  FCCurrentIssuesPromiseChainingData *v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(FCCurrentIssuesPromiseChainingData);
  v5 = objc_alloc_init(FCCurrentIssuesCheckerResult);
  if (v4)
    objc_storeStrong((id *)&v4->_partialResult, v5);
  -[FCHandlePushNotificationResult setRecordZoneIDs:]((uint64_t)v4, v3);

  v6 = (void *)FCCurrentIssuesCheckerLog;
  if (os_log_type_enabled((os_log_t)FCCurrentIssuesCheckerLog, OS_LOG_TYPE_DEFAULT))
  {
    if (v4)
      bundleChannelIDs = v4->_bundleChannelIDs;
    else
      bundleChannelIDs = 0;
    v8 = bundleChannelIDs;
    v9 = v6;
    LODWORD(v15) = 134217984;
    *(_QWORD *)((char *)&v15 + 4) = -[NSOrderedSet count](v8, "count");
    _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "Found %lu bundle channels", (uint8_t *)&v15, 0xCu);

  }
  v10 = *(_QWORD *)(a1 + 32);
  v11 = v4;
  if (v10)
  {
    v12 = objc_alloc(MEMORY[0x1E0D60AF0]);
    *(_QWORD *)&v15 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v15 + 1) = 3221225472;
    v16 = __101__FCCurrentIssuesChecker__promiseFollowedAndAutofavoriteChannelIDsWithChainingData_qualityOfService___block_invoke;
    v17 = &unk_1E4646288;
    v18 = v10;
    v20 = 17;
    v19 = v11;
    v13 = (void *)objc_msgSend(v12, "initWithResolver:", &v15);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

id __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)FCCurrentIssuesCheckerLog;
  if (os_log_type_enabled((os_log_t)FCCurrentIssuesCheckerLog, OS_LOG_TYPE_DEFAULT))
  {
    if (v3)
      v5 = (void *)*((_QWORD *)v3 + 3);
    else
      v5 = 0;
    v6 = v5;
    v7 = v4;
    v8 = objc_msgSend(v6, "count");
    if (v3)
      v9 = (void *)*((_QWORD *)v3 + 4);
    else
      v9 = 0;
    v10 = v9;
    v16 = 134218240;
    v17 = v8;
    v18 = 2048;
    v19 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "Found %lu followed channels and %lu autofavorite tags", (uint8_t *)&v16, 0x16u);

  }
  if (v3)
  {
    v11 = *((id *)v3 + 3);
    v12 = *((_QWORD *)v3 + 4);
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }
  objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCCurrentIssuesChecker _promiseCurrentIssuesFromChannelIDs:withChainingData:qualityOfService:](*(_QWORD *)(a1 + 32), v13, v3, 17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_promiseCurrentIssuesFromChannelIDs:(void *)a3 withChainingData:(uint64_t)a4 qualityOfService:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    v9 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __96__FCCurrentIssuesChecker__promiseCurrentIssuesFromChannelIDs_withChainingData_qualityOfService___block_invoke;
    v12[3] = &unk_1E46462D8;
    v13 = v8;
    v14 = v7;
    v15 = a1;
    v16 = a4;
    v10 = (void *)objc_msgSend(v9, "initWithResolver:", v12);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_14(uint64_t a1, void *a2)
{
  id *v3;
  id *v4;
  id v5;
  uint64_t v6;
  id *v7;
  void *v8;
  id v9;
  id *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  NSObject *v31;
  id *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  id *v46;
  id v47;
  void *v48;
  void *v50;
  void *v51;
  id *v52;
  uint64_t v53;
  _QWORD v54[4];
  id *v55;
  _QWORD v56[4];
  id *v57;
  _BYTE buf[24];
  __int128 v59;
  id v60;
  id *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v3 = (id *)v3[4];
    v5 = v4[1];
  }
  else
  {
    v5 = 0;
  }
  v6 = MEMORY[0x1E0C809B0];
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_2_15;
  v56[3] = &unk_1E463F138;
  v7 = v3;
  v57 = v7;
  objc_msgSend(v5, "fc_arrayOfObjectsFailingTest:", v56);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v9 = v4[1];
  else
    v9 = 0;
  v54[0] = v6;
  v54[1] = 3221225472;
  v54[2] = __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_3;
  v54[3] = &unk_1E463F138;
  v10 = v7;
  v55 = v10;
  objc_msgSend(v9, "fc_arrayOfObjectsPassingTest:", v54);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCurrentIssuesChecker demoFollowedChannelIDs](*(_QWORD *)(a1 + 32));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  v53 = a1;
  if (v13)
  {
    v14 = *(void **)(a1 + 32);
    if (v4)
      v15 = v4[3];
    else
      v15 = 0;
    v12 = v15;
    -[FCCurrentIssuesChecker sortIssues:basedOnTagIDs:](v14, v8, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      goto LABEL_9;
  }
  else
  {
    v16 = v8;
    if (v4)
    {
LABEL_9:
      v17 = v4[5];
      goto LABEL_10;
    }
  }
  v17 = 0;
LABEL_10:
  objc_msgSend(v17, "setFollowedIssues:", v16);
  if (v13)
  {

    v18 = v53;
    -[FCCurrentIssuesChecker sortIssues:basedOnTagIDs:](*(void **)(v53 + 32), v11, v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
LABEL_12:
      v20 = v4[5];
      goto LABEL_13;
    }
  }
  else
  {
    v19 = v11;
    v18 = v53;
    if (v4)
      goto LABEL_12;
  }
  v20 = 0;
LABEL_13:
  objc_msgSend(v20, "setAutoFavoriteIssues:", v19);
  if (v13)

  v21 = (id)FCCurrentIssuesCheckerLog;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v52 = v10;
    v22 = v8;
    if (v4)
      v23 = v4[5];
    else
      v23 = 0;
    v24 = v23;
    objc_msgSend(v24, "autoFavoriteIssues");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");
    v27 = v11;
    if (v4)
      v28 = v4[5];
    else
      v28 = 0;
    v29 = v28;
    objc_msgSend(v29, "autoFavoriteIssues");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v26;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v30;
    _os_log_impl(&dword_1A1B90000, v21, OS_LOG_TYPE_DEFAULT, "Found %lu auto favorited issues: %@", buf, 0x16u);

    v8 = v22;
    v10 = v52;
    v18 = v53;
    v11 = v27;
  }

  v31 = (id)FCCurrentIssuesCheckerLog;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = v10;
    v33 = v8;
    if (v4)
      v34 = v4[5];
    else
      v34 = 0;
    v35 = v34;
    objc_msgSend(v35, "followedIssues");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "count");
    v38 = v11;
    if (v4)
      v39 = v4[5];
    else
      v39 = 0;
    v40 = v39;
    objc_msgSend(v40, "followedIssues");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v37;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v41;
    _os_log_impl(&dword_1A1B90000, v31, OS_LOG_TYPE_DEFAULT, "Found %lu followed issues: %@", buf, 0x16u);

    v8 = v33;
    v10 = v32;
    v11 = v38;
    v18 = v53;
  }

  v42 = *(_QWORD *)(v18 + 32);
  if (v4)
    v43 = v4[5];
  else
    v43 = 0;
  v44 = v43;
  objc_msgSend(v44, "followedIssues");
  v45 = (id)objc_claimAutoreleasedReturnValue();
  v46 = v4;
  if (!v42)
  {
    v48 = 0;
    goto LABEL_36;
  }
  if (!v45 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "issues");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[FCCurrentIssuesChecker _promiseFilterUnreadIssuesWithFromIssues:withChainingdata:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "FCCurrentIssuesChecker.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v59) = 311;
    WORD2(v59) = 2114;
    *(_QWORD *)((char *)&v59 + 6) = v50;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v4)
    {
LABEL_33:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "data");
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "-[FCCurrentIssuesChecker _promiseFilterUnreadIssuesWithFromIssues:withChainingdata:]";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "FCCurrentIssuesChecker.m";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v59) = 312;
        WORD2(v59) = 2114;
        *(_QWORD *)((char *)&v59 + 6) = v51;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
    }
  }
  else if (!v4)
  {
    goto LABEL_33;
  }
  v47 = objc_alloc(MEMORY[0x1E0D60AF0]);
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __84__FCCurrentIssuesChecker__promiseFilterUnreadIssuesWithFromIssues_withChainingdata___block_invoke;
  *(_QWORD *)&v59 = &unk_1E463F5A8;
  *((_QWORD *)&v59 + 1) = v42;
  v60 = v45;
  v61 = v46;
  v48 = (void *)objc_msgSend(v47, "initWithResolver:", buf);

LABEL_36:
  return v48;
}

uint64_t __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_2_15(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "sourceChannel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "containsObject:", v4);

  return v5;
}

uint64_t __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "sourceChannel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "containsObject:", v4);

  return v5;
}

- (id)demoFollowedChannelIDs
{
  void *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    NewsCoreUserDefaults();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringForKey:", CFSTR("news.demo.followed_channels"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(","));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)sortIssues:(void *)a3 basedOnTagIDs:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (v5 && v6)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __51__FCCurrentIssuesChecker_sortIssues_basedOnTagIDs___block_invoke_2;
      v10[3] = &unk_1E463C9B8;
      v11 = v5;
      objc_msgSend(v7, "fc_arrayByTransformingWithBlock:", v10);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v11;
    }
    else
    {
      v8 = v5;
      a1 = v8;
    }

  }
  return a1;
}

uint64_t __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_17(uint64_t a1, void *a2)
{
  id *v3;
  id *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  void *v45;
  uint64_t v46;
  id v47;
  uint64_t v49;
  _QWORD v50[5];
  _QWORD v51[5];
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = v3[1];
    v3 = (id *)v4[5];
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v3, "setUnreadFollowedIssues:", v5);

  v6 = (void *)FCCurrentIssuesCheckerLog;
  v49 = a1;
  if (os_log_type_enabled((os_log_t)FCCurrentIssuesCheckerLog, OS_LOG_TYPE_DEFAULT))
  {
    if (v4)
      v7 = v4[5];
    else
      v7 = 0;
    v8 = v7;
    v9 = v6;
    objc_msgSend(v8, "unreadFollowedIssues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    if (v4)
      v12 = v4[5];
    else
      v12 = 0;
    v13 = v12;
    objc_msgSend(v13, "unreadFollowedIssues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v53 = v11;
    v54 = 2112;
    v55 = v14;
    _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "Found %lu unread issues: %@", buf, 0x16u);

    a1 = v49;
  }
  if (v4)
    v15 = v4[5];
  else
    v15 = 0;
  v16 = v15;
  objc_msgSend(v16, "unreadFollowedIssues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_18;
  v51[3] = &unk_1E463F138;
  v19 = *(_QWORD *)(a1 + 32);

  v51[4] = v19;
  objc_msgSend(v17, "fc_arrayOfObjectsPassingTest:", v51);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v21 = v4[5];
  else
    v21 = 0;
  objc_msgSend(v21, "setUnbadgedIssues:", v20);
  v22 = (void *)FCCurrentIssuesCheckerLog;
  if (os_log_type_enabled((os_log_t)FCCurrentIssuesCheckerLog, OS_LOG_TYPE_DEFAULT))
  {
    if (v4)
      v23 = v4[5];
    else
      v23 = 0;
    v24 = v23;
    v25 = v22;
    objc_msgSend(v24, "unbadgedIssues");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");
    if (v4)
      v28 = v4[5];
    else
      v28 = 0;
    v29 = v28;
    objc_msgSend(v29, "unbadgedIssues");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v53 = v27;
    v54 = 2112;
    v55 = v30;
    _os_log_impl(&dword_1A1B90000, v25, OS_LOG_TYPE_DEFAULT, "Found %lu unbadged issues: %@", buf, 0x16u);

    a1 = v49;
  }
  if (v4)
    v31 = v4[5];
  else
    v31 = 0;
  v32 = v31;
  objc_msgSend(v32, "unreadFollowedIssues");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v18;
  v50[1] = 3221225472;
  v50[2] = __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_19;
  v50[3] = &unk_1E463F138;
  v34 = *(_QWORD *)(a1 + 32);

  v50[4] = v34;
  objc_msgSend(v33, "fc_arrayOfObjectsPassingTest:", v50);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v36 = v4[5];
  else
    v36 = 0;
  objc_msgSend(v36, "setSeenIssues:", v35);
  v37 = (void *)FCCurrentIssuesCheckerLog;
  if (os_log_type_enabled((os_log_t)FCCurrentIssuesCheckerLog, OS_LOG_TYPE_DEFAULT))
  {
    if (v4)
      v38 = v4[5];
    else
      v38 = 0;
    v39 = v38;
    v40 = v37;
    objc_msgSend(v39, "seenIssues");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "count");
    if (v4)
      v43 = v4[5];
    else
      v43 = 0;
    v44 = v43;
    objc_msgSend(v44, "seenIssues");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v53 = v42;
    v54 = 2112;
    v55 = v45;
    _os_log_impl(&dword_1A1B90000, v40, OS_LOG_TYPE_DEFAULT, "Found %lu seen issues: %@", buf, 0x16u);

    a1 = v49;
  }
  v46 = *(_QWORD *)(a1 + 40);
  if (v46)
  {
    if (v4)
      v47 = v4[5];
    else
      v47 = 0;
    (*(void (**)(uint64_t, id))(v46 + 16))(v46, v47);
  }

  return 0;
}

uint64_t __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_18(uint64_t a1, void *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  int v6;

  v3 = *(_QWORD **)(a1 + 32);
  if (v3)
    v3 = (_QWORD *)v3[3];
  v4 = v3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasIssueWithIDBeenBadged:", v5);

  return v6 ^ 1u;
}

uint64_t __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_19(uint64_t a1, void *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;

  v3 = *(_QWORD **)(a1 + 32);
  if (v3)
    v3 = (_QWORD *)v3[3];
  v4 = v3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasIssueWithIDBeenSeen:", v5);

  return v6;
}

void __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  FCCurrentIssuesCheckerResult *v5;
  uint64_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = FCCurrentIssuesCheckerLog;
  if (os_log_type_enabled((os_log_t)FCCurrentIssuesCheckerLog, OS_LOG_TYPE_ERROR))
  {
    v7 = 138543362;
    v8 = v3;
    _os_log_error_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_ERROR, "Failed to check for current issues with error: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  v5 = objc_alloc_init(FCCurrentIssuesCheckerResult);
  -[FCCurrentIssuesCheckerResult setError:](v5, "setError:", v3);
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, FCCurrentIssuesCheckerResult *))(v6 + 16))(v6, v5);

}

- (void)fetchUsersFollowedIssuesWithQualityOfService:(int64_t)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[6];
  _QWORD v22[5];

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __82__FCCurrentIssuesChecker_fetchUsersFollowedIssuesWithQualityOfService_completion___block_invoke;
  v22[3] = &unk_1E463D3A8;
  v22[4] = self;
  objc_msgSend(MEMORY[0x1E0D60AF0], "firstly:", v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v7;
  v21[1] = 3221225472;
  v21[2] = __82__FCCurrentIssuesChecker_fetchUsersFollowedIssuesWithQualityOfService_completion___block_invoke_2;
  v21[3] = &unk_1E4646210;
  v21[4] = self;
  v21[5] = a3;
  objc_msgSend(v8, "thenOn:then:", v9, v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __82__FCCurrentIssuesChecker_fetchUsersFollowedIssuesWithQualityOfService_completion___block_invoke_3;
  v19[3] = &unk_1E4646238;
  v12 = v6;
  v20 = v12;
  objc_msgSend(v10, "thenOn:then:", v11, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __82__FCCurrentIssuesChecker_fetchUsersFollowedIssuesWithQualityOfService_completion___block_invoke_4;
  v17[3] = &unk_1E463DB48;
  v18 = v12;
  v15 = v12;
  v16 = (id)objc_msgSend(v13, "errorOn:error:", v14, v17);

}

id __82__FCCurrentIssuesChecker_fetchUsersFollowedIssuesWithQualityOfService_completion___block_invoke(uint64_t a1)
{
  return -[FCCurrentIssuesChecker _promiseBundleChannelIDs](*(void **)(a1 + 32));
}

id __82__FCCurrentIssuesChecker_fetchUsersFollowedIssuesWithQualityOfService_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  FCCurrentIssuesPromiseChainingData *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = objc_alloc_init(FCCurrentIssuesPromiseChainingData);
  -[FCHandlePushNotificationResult setRecordZoneIDs:]((uint64_t)v4, v3);

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    v6 = *(void **)(v5 + 16);
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v7, "subscribedTagIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCurrentIssuesChecker _promiseCurrentIssuesFromChannelIDs:withChainingData:qualityOfService:](v5, v8, v4, *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __82__FCCurrentIssuesChecker_fetchUsersFollowedIssuesWithQualityOfService_completion___block_invoke_3(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    if (v3)
      v5 = v3[1];
    else
      v5 = 0;
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v4 + 16))(v4, v5, 0);
  }

  return 0;
}

void __82__FCCurrentIssuesChecker_fetchUsersFollowedIssuesWithQualityOfService_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = FCCurrentIssuesCheckerLog;
  if (os_log_type_enabled((os_log_t)FCCurrentIssuesCheckerLog, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_error_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_ERROR, "Failed to check for current issues with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

id __51__FCCurrentIssuesChecker_sortIssues_basedOnTagIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "sourceChannel", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v3);

        if ((v11 & 1) != 0)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

void __50__FCCurrentIssuesChecker__promiseBundleChannelIDs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    v8 = *(void **)(v7 + 32);
  else
    v8 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__FCCurrentIssuesChecker__promiseBundleChannelIDs__block_invoke_2;
  v11[3] = &unk_1E463CD80;
  v11[4] = v7;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v8, "prepareForUseWithCompletion:", v11);

}

void __50__FCCurrentIssuesChecker__promiseBundleChannelIDs__block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = a1[4];
  if (v2)
    v3 = *(void **)(v2 + 32);
  else
    v3 = 0;
  objc_msgSend(v3, "bundleSubscription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleChannelIDs");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fc_errorWithCode:description:", 8, CFSTR("Could not get the list of bundle channelIDs."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(a1[6] + 16))();

  }
}

void __101__FCCurrentIssuesChecker__promiseFollowedAndAutofavoriteChannelIDsWithChainingData_qualityOfService___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = (_QWORD *)a1[4];
  if (v7)
    v7 = (_QWORD *)v7[2];
  v8 = a1[6];
  v9 = v7;
  FCDispatchQueueForQualityOfService(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __101__FCCurrentIssuesChecker__promiseFollowedAndAutofavoriteChannelIDsWithChainingData_qualityOfService___block_invoke_2;
  v14[3] = &unk_1E4646260;
  v11 = (void *)a1[5];
  v14[4] = a1[4];
  v15 = v11;
  v16 = v5;
  v17 = v6;
  v12 = v6;
  v13 = v5;
  objc_msgSend(v9, "fetchSubscribedTagsWithCallbackQueue:preferCache:completion:", v10, 0, v14);

}

void __101__FCCurrentIssuesChecker__promiseFollowedAndAutofavoriteChannelIDsWithChainingData_qualityOfService___block_invoke_2(uint64_t *a1, void *a2, uint64_t a3)
{
  void (*v5)(void);
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  if (a3)
  {
    v5 = *(void (**)(void))(a1[7] + 16);
  }
  else
  {
    -[FCCurrentIssuesChecker demoFollowedChannelIDs](a1[4]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
      -[FCCurrentIssuesChecker demoFollowedChannelIDs](a1[4]);
    else
      objc_msgSend(v14, "fc_arrayByTransformingWithBlock:", &__block_literal_global_117);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = a1[5];
    if (v9)
      objc_storeStrong((id *)(v9 + 24), v8);

    v10 = (_QWORD *)a1[4];
    if (v10)
      v10 = (_QWORD *)v10[2];
    v11 = v10;
    objc_msgSend(v11, "autoFavoriteTagIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = a1[5];
    if (v13)
      objc_storeStrong((id *)(v13 + 32), v12);

    v5 = *(void (**)(void))(a1[6] + 16);
  }
  v5();

}

id __101__FCCurrentIssuesChecker__promiseFollowedAndAutofavoriteChannelIDsWithChainingData_qualityOfService___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "asChannel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __96__FCCurrentIssuesChecker__promiseCurrentIssuesFromChannelIDs_withChainingData_qualityOfService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  FCChannelIssuesFetchOperation *v13;
  uint64_t v14;
  uint64_t v15;
  FCChannelIssuesFetchOperation *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t *, void *, uint64_t);
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD **)(a1 + 32);
  if (v7)
    v7 = (_QWORD *)v7[2];
  v8 = v7;
  v9 = *(void **)(a1 + 40);
  v10 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __96__FCCurrentIssuesChecker__promiseCurrentIssuesFromChannelIDs_withChainingData_qualityOfService___block_invoke_2;
  v26[3] = &unk_1E463C7A0;
  v11 = v8;
  v27 = v11;
  objc_msgSend(v9, "fc_arrayOfObjectsPassingTest:", v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = [FCChannelIssuesFetchOperation alloc];
    v14 = *(_QWORD *)(a1 + 48);
    if (v14)
      v15 = *(_QWORD *)(v14 + 8);
    else
      v15 = 0;
    v16 = -[FCChannelIssuesFetchOperation initWithContext:channelIDs:issueSet:](v13, "initWithContext:channelIDs:issueSet:", v15, v12, 0);
    -[FCOperation setQualityOfService:](v16, "setQualityOfService:", *(_QWORD *)(a1 + 56));
    v17 = *(_QWORD *)(a1 + 56);
    if (v17 == 9)
    {
      v18 = -1;
    }
    else if (v17 == 33 || (v18 = 0, v17 == 25))
    {
      v18 = 1;
    }
    -[FCOperation setRelativePriority:](v16, "setRelativePriority:", v18);
    v19 = v10;
    v20 = 3221225472;
    v21 = __96__FCCurrentIssuesChecker__promiseCurrentIssuesFromChannelIDs_withChainingData_qualityOfService___block_invoke_4;
    v22 = &unk_1E46440D8;
    v23 = *(id *)(a1 + 32);
    v24 = v5;
    v25 = v6;
    -[FCChannelIssuesFetchOperation setFetchCompletionHandler:](v16, "setFetchCompletionHandler:", &v19);
    -[FCOperation start](v16, "start", v19, v20, v21, v22);

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

uint64_t __96__FCCurrentIssuesChecker__promiseCurrentIssuesFromChannelIDs_withChainingData_qualityOfService___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

void __96__FCCurrentIssuesChecker__promiseCurrentIssuesFromChannelIDs_withChainingData_qualityOfService___block_invoke_4(uint64_t *a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a2;
  if (a3)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __96__FCCurrentIssuesChecker__promiseCurrentIssuesFromChannelIDs_withChainingData_qualityOfService___block_invoke_5;
    v8[3] = &unk_1E46462B0;
    v9 = v5;
    v6 = v5;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);
    -[FCPurchaseController setPurchasesDiscoveredTagIDs:](a1[4], v6);
    (*(void (**)(void))(a1[5] + 16))();

  }
}

uint64_t __96__FCCurrentIssuesChecker__promiseCurrentIssuesFromChannelIDs_withChainingData_qualityOfService___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:");
}

void __84__FCCurrentIssuesChecker__promiseFilterUnreadIssuesWithFromIssues_withChainingdata___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    v4 = (_QWORD *)v4[3];
  v5 = v4;
  dispatch_get_global_queue(17, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__FCCurrentIssuesChecker__promiseFilterUnreadIssuesWithFromIssues_withChainingdata___block_invoke_2;
  v10[3] = &unk_1E4646300;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v11 = v7;
  v12 = v8;
  v13 = *(id *)(a1 + 48);
  v14 = v3;
  v9 = v3;
  objc_msgSend(v5, "syncWithCallbackQueue:completion:", v6, v10);

}

void __84__FCCurrentIssuesChecker__promiseFilterUnreadIssuesWithFromIssues_withChainingdata___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v4;
      _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "Failed to fetch our issue reading history; Unable to determine unread state, error=%{public}@",
        buf,
        0xCu);
    }
    -[FCPurchaseController setPurchasesDiscoveredTagIDs:](*(_QWORD *)(a1 + 48), *(void **)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __84__FCCurrentIssuesChecker__promiseFilterUnreadIssuesWithFromIssues_withChainingdata___block_invoke_3;
    v8[3] = &unk_1E463F138;
    v6 = *(void **)(a1 + 32);
    v8[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "fc_arrayOfObjectsPassingTest:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPurchaseController setPurchasesDiscoveredTagIDs:](*(_QWORD *)(a1 + 48), v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

uint64_t __84__FCCurrentIssuesChecker__promiseFilterUnreadIssuesWithFromIssues_withChainingdata___block_invoke_3(uint64_t a1, void *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  int v6;

  v3 = *(_QWORD **)(a1 + 32);
  if (v3)
    v3 = (_QWORD *)v3[3];
  v4 = v3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasIssueWithIDBeenVisited:", v5);

  return v6 ^ 1u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleSubscriptionProvider, 0);
  objc_storeStrong((id *)&self->_issueReadingHistory, 0);
  objc_storeStrong((id *)&self->_subscriptionController, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
