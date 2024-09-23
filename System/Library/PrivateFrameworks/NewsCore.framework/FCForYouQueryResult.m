@implementation FCForYouQueryResult

- (FCForYouQueryResult)init
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
    v8 = "-[FCForYouQueryResult init]";
    v9 = 2080;
    v10 = "FCForYouQueryUtilities.m";
    v11 = 1024;
    v12 = 26;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCForYouQueryResult init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCForYouQueryResult)initWithChannelDefaultSectionRequests:(id)a3 channelOtherSectionsRequests:(id)a4 topicRequests:(id)a5 paidBundleRequests:(id)a6 hiddenFeedRequests:(id)a7 sidecarRequests:(id)a8 feedContextByFeedID:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  FCForYouQueryResult *v22;
  uint64_t v23;
  NSArray *channelDefaultSectionRequests;
  uint64_t v25;
  NSArray *channelOtherSectionsRequests;
  uint64_t v27;
  NSArray *topicRequests;
  uint64_t v29;
  NSArray *paidBundleRequests;
  uint64_t v31;
  NSArray *hiddenFeedRequests;
  uint64_t v33;
  NSArray *sidecarRequests;
  uint64_t v35;
  NSDictionary *feedContextByFeedID;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  objc_super v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if (!v15 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "channelDefaultSectionRequests");
    *(_DWORD *)buf = 136315906;
    v47 = "-[FCForYouQueryResult initWithChannelDefaultSectionRequests:channelOtherSectionsRequests:topicRequests:paidBun"
          "dleRequests:hiddenFeedRequests:sidecarRequests:feedContextByFeedID:]";
    v48 = 2080;
    v49 = "FCForYouQueryUtilities.m";
    v50 = 1024;
    v51 = 37;
    v52 = 2114;
    v53 = v38;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v16)
      goto LABEL_6;
  }
  else if (v16)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "channelOtherSectionsRequests");
    *(_DWORD *)buf = 136315906;
    v47 = "-[FCForYouQueryResult initWithChannelDefaultSectionRequests:channelOtherSectionsRequests:topicRequests:paidBun"
          "dleRequests:hiddenFeedRequests:sidecarRequests:feedContextByFeedID:]";
    v48 = 2080;
    v49 = "FCForYouQueryUtilities.m";
    v50 = 1024;
    v51 = 38;
    v52 = 2114;
    v53 = v39;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v17 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "topicRequests");
    *(_DWORD *)buf = 136315906;
    v47 = "-[FCForYouQueryResult initWithChannelDefaultSectionRequests:channelOtherSectionsRequests:topicRequests:paidBun"
          "dleRequests:hiddenFeedRequests:sidecarRequests:feedContextByFeedID:]";
    v48 = 2080;
    v49 = "FCForYouQueryUtilities.m";
    v50 = 1024;
    v51 = 39;
    v52 = 2114;
    v53 = v40;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v18)
      goto LABEL_11;
  }
  else if (v18)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "paidBundleRequests");
    *(_DWORD *)buf = 136315906;
    v47 = "-[FCForYouQueryResult initWithChannelDefaultSectionRequests:channelOtherSectionsRequests:topicRequests:paidBun"
          "dleRequests:hiddenFeedRequests:sidecarRequests:feedContextByFeedID:]";
    v48 = 2080;
    v49 = "FCForYouQueryUtilities.m";
    v50 = 1024;
    v51 = 40;
    v52 = 2114;
    v53 = v41;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_11:
  if (!v19 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "hiddenFeedRequests");
    *(_DWORD *)buf = 136315906;
    v47 = "-[FCForYouQueryResult initWithChannelDefaultSectionRequests:channelOtherSectionsRequests:topicRequests:paidBun"
          "dleRequests:hiddenFeedRequests:sidecarRequests:feedContextByFeedID:]";
    v48 = 2080;
    v49 = "FCForYouQueryUtilities.m";
    v50 = 1024;
    v51 = 41;
    v52 = 2114;
    v53 = v42;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v20)
      goto LABEL_16;
  }
  else if (v20)
  {
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "sidecarRequests");
    *(_DWORD *)buf = 136315906;
    v47 = "-[FCForYouQueryResult initWithChannelDefaultSectionRequests:channelOtherSectionsRequests:topicRequests:paidBun"
          "dleRequests:hiddenFeedRequests:sidecarRequests:feedContextByFeedID:]";
    v48 = 2080;
    v49 = "FCForYouQueryUtilities.m";
    v50 = 1024;
    v51 = 42;
    v52 = 2114;
    v53 = v43;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_16:
  if (!v21 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "feedContextByFeedID");
    *(_DWORD *)buf = 136315906;
    v47 = "-[FCForYouQueryResult initWithChannelDefaultSectionRequests:channelOtherSectionsRequests:topicRequests:paidBun"
          "dleRequests:hiddenFeedRequests:sidecarRequests:feedContextByFeedID:]";
    v48 = 2080;
    v49 = "FCForYouQueryUtilities.m";
    v50 = 1024;
    v51 = 43;
    v52 = 2114;
    v53 = v44;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v45.receiver = self;
  v45.super_class = (Class)FCForYouQueryResult;
  v22 = -[FCForYouQueryResult init](&v45, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v15, "copy");
    channelDefaultSectionRequests = v22->_channelDefaultSectionRequests;
    v22->_channelDefaultSectionRequests = (NSArray *)v23;

    v25 = objc_msgSend(v16, "copy");
    channelOtherSectionsRequests = v22->_channelOtherSectionsRequests;
    v22->_channelOtherSectionsRequests = (NSArray *)v25;

    v27 = objc_msgSend(v17, "copy");
    topicRequests = v22->_topicRequests;
    v22->_topicRequests = (NSArray *)v27;

    v29 = objc_msgSend(v18, "copy");
    paidBundleRequests = v22->_paidBundleRequests;
    v22->_paidBundleRequests = (NSArray *)v29;

    v31 = objc_msgSend(v19, "copy");
    hiddenFeedRequests = v22->_hiddenFeedRequests;
    v22->_hiddenFeedRequests = (NSArray *)v31;

    v33 = objc_msgSend(v20, "copy");
    sidecarRequests = v22->_sidecarRequests;
    v22->_sidecarRequests = (NSArray *)v33;

    v35 = objc_msgSend(v21, "copy");
    feedContextByFeedID = v22->_feedContextByFeedID;
    v22->_feedContextByFeedID = (NSDictionary *)v35;

  }
  return v22;
}

- (NSArray)allRequests
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[7];

  v12[6] = *MEMORY[0x1E0C80C00];
  -[FCForYouQueryResult channelDefaultSectionRequests](self, "channelDefaultSectionRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  -[FCForYouQueryResult channelOtherSectionsRequests](self, "channelOtherSectionsRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  -[FCForYouQueryResult topicRequests](self, "topicRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  -[FCForYouQueryResult paidBundleRequests](self, "paidBundleRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v6;
  -[FCForYouQueryResult hiddenFeedRequests](self, "hiddenFeedRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v7;
  -[FCForYouQueryResult sidecarRequests](self, "sidecarRequests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fc_arrayByFlattening");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v10;
}

- (NSArray)channelDefaultSectionRequests
{
  return self->_channelDefaultSectionRequests;
}

- (NSArray)channelOtherSectionsRequests
{
  return self->_channelOtherSectionsRequests;
}

- (NSArray)topicRequests
{
  return self->_topicRequests;
}

- (NSArray)paidBundleRequests
{
  return self->_paidBundleRequests;
}

- (NSArray)hiddenFeedRequests
{
  return self->_hiddenFeedRequests;
}

- (NSArray)sidecarRequests
{
  return self->_sidecarRequests;
}

- (NSDictionary)feedContextByFeedID
{
  return self->_feedContextByFeedID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedContextByFeedID, 0);
  objc_storeStrong((id *)&self->_sidecarRequests, 0);
  objc_storeStrong((id *)&self->_hiddenFeedRequests, 0);
  objc_storeStrong((id *)&self->_paidBundleRequests, 0);
  objc_storeStrong((id *)&self->_topicRequests, 0);
  objc_storeStrong((id *)&self->_channelOtherSectionsRequests, 0);
  objc_storeStrong((id *)&self->_channelDefaultSectionRequests, 0);
}

@end
