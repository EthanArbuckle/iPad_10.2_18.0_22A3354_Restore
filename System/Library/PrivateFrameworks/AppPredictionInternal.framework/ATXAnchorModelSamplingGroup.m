@implementation ATXAnchorModelSamplingGroup

- (ATXAnchorModelSamplingGroup)initWithAnchorWhitelist:(id)a3 samplingGroupId:(int64_t)a4
{
  id v6;
  ATXAnchorModelSamplingGroup *v7;
  uint64_t v8;
  NSArray *anchorWhitelist;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXAnchorModelSamplingGroup;
  v7 = -[ATXAnchorModelSamplingGroup init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    anchorWhitelist = v7->_anchorWhitelist;
    v7->_anchorWhitelist = (NSArray *)v8;

    v7->_samplingGroupId = a4;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  NSUInteger v7;
  id v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Sampling Group ID: %li. Anchors: "), self->_samplingGroupId);
  objc_msgSend(v3, "appendString:", v4);

  if (-[NSArray count](self->_anchorWhitelist, "count"))
  {
    v5 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_anchorWhitelist, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSArray count](self->_anchorWhitelist, "count") - 1;
      v8 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v6, "description");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v5 == v7)
        v11 = CFSTR("%@");
      else
        v11 = CFSTR("%@, ");
      v12 = (void *)objc_msgSend(v8, "initWithFormat:", v11, v9);
      objc_msgSend(v3, "appendString:", v12);

      ++v5;
    }
    while (-[NSArray count](self->_anchorWhitelist, "count") > v5);
  }
  v13 = (void *)objc_msgSend(v3, "copy");

  return v13;
}

+ (id)getSamplingGroupForDataCollection
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v4 = (void *)objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  v5 = objc_msgSend(v4, "integerForKey:", CFSTR("com.apple.duetexpertd.anchormodel.dataharvester.samplinggroup.samplinggroupid"));
  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "AnchorModel: Retrieving the user's assigned sampling group for Anchor Model Data Collection.", (uint8_t *)&v11, 2u);
  }

  if (!v5)
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "AnchorModel: User was not assigned to a sampling group. Selecting a sampling group for the user...", (uint8_t *)&v11, 2u);
    }

    v5 = objc_msgSend(a1, "assignSamplingGroupToUserAndPersistToDefaults:", v4);
  }
  __atxlog_handle_default();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134217984;
    v12 = v5;
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "AnchorModel: Sampling group retrieved for user: %li", (uint8_t *)&v11, 0xCu);
  }

  +[ATXAnchorModelSamplingGroup samplingGroupFromSamplingGroupId:](ATXAnchorModelSamplingGroup, "samplingGroupFromSamplingGroupId:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (int64_t)assignSamplingGroupToUserAndPersistToDefaults:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  v5 = objc_msgSend(a1, "selectSamplingGroupForUser");
  objc_msgSend(v4, "setInteger:forKey:", v5, CFSTR("com.apple.duetexpertd.anchormodel.dataharvester.samplinggroup.samplinggroupid"));

  return v5;
}

+ (int64_t)selectSamplingGroupForUser
{
  return arc4random_uniform(+[ATXAnchorModelSamplingGroup numSamplingGroups](ATXAnchorModelSamplingGroup, "numSamplingGroups"))+ 1;
}

+ (void)resetSamplingGroupAssignmentForUser
{
  id v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v3, "setInteger:forKey:", 0, CFSTR("com.apple.duetexpertd.anchormodel.dataharvester.samplinggroup.samplinggroupid"));
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "AnchorModel: User's assigned sampling group for Anchor Model Data Collection has been reset.", v5, 2u);
  }

}

+ (unint64_t)numSamplingGroups
{
  return 6;
}

+ (id)samplingGroupFromSamplingGroupId:(int64_t)a3
{
  NSObject *v4;
  ATXAnchorModelSamplingGroup *v5;
  uint64_t v6;
  int64_t v7;
  NSObject *v8;
  ATXAnchorModelSamplingGroup *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  ATXAnchorModelSamplingGroup *v16;
  void *v17;
  uint64_t v18;
  ATXAnchorModelSamplingGroup *v19;
  ATXAnchorModelSamplingGroup *v20;
  ATXAnchorModelSamplingGroup *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[6];

  v29[5] = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0:
      __atxlog_handle_default();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        +[ATXAnchorModelSamplingGroup samplingGroupFromSamplingGroupId:].cold.2(v4);

      v5 = [ATXAnchorModelSamplingGroup alloc];
      v6 = MEMORY[0x1E0C9AA60];
      v7 = 0;
      goto LABEL_15;
    case 1:
      v20 = [ATXAnchorModelSamplingGroup alloc];
      v10 = (void *)objc_opt_new();
      v29[0] = v10;
      v11 = (void *)objc_opt_new();
      v29[1] = v11;
      v12 = (void *)objc_opt_new();
      v29[2] = v12;
      v13 = (void *)objc_opt_new();
      v29[3] = v13;
      v14 = (void *)objc_opt_new();
      v29[4] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v20;
      v17 = v15;
      v18 = 1;
      goto LABEL_12;
    case 2:
      v9 = [ATXAnchorModelSamplingGroup alloc];
      v10 = (void *)objc_opt_new();
      v28[0] = v10;
      v11 = (void *)objc_opt_new();
      v28[1] = v11;
      v12 = (void *)objc_opt_new();
      v28[2] = v12;
      v13 = (void *)objc_opt_new();
      v28[3] = v13;
      v14 = (void *)objc_opt_new();
      v28[4] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v9;
      v17 = v15;
      v18 = 2;
      goto LABEL_12;
    case 3:
      v19 = [ATXAnchorModelSamplingGroup alloc];
      v10 = (void *)objc_opt_new();
      v23 = v10;
      v11 = (void *)objc_opt_new();
      v24 = v11;
      v12 = (void *)objc_opt_new();
      v25 = v12;
      v13 = (void *)objc_opt_new();
      v26 = v13;
      v14 = (void *)objc_opt_new();
      v27 = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v19;
      v17 = v15;
      v18 = 3;
LABEL_12:
      v21 = -[ATXAnchorModelSamplingGroup initWithAnchorWhitelist:samplingGroupId:](v16, "initWithAnchorWhitelist:samplingGroupId:", v17, v18, v23, v24, v25, v26);

      return v21;
    case 4:
      v5 = [ATXAnchorModelSamplingGroup alloc];
      v6 = MEMORY[0x1E0C9AA60];
      v7 = 4;
      goto LABEL_15;
    case 5:
      v5 = [ATXAnchorModelSamplingGroup alloc];
      v6 = MEMORY[0x1E0C9AA60];
      v7 = 5;
      goto LABEL_15;
    case 6:
      v5 = [ATXAnchorModelSamplingGroup alloc];
      v6 = MEMORY[0x1E0C9AA60];
      v7 = 6;
      goto LABEL_15;
    default:
      __atxlog_handle_default();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        +[ATXAnchorModelSamplingGroup samplingGroupFromSamplingGroupId:].cold.1(a3, v8);

      v5 = [ATXAnchorModelSamplingGroup alloc];
      v6 = MEMORY[0x1E0C9AA60];
      v7 = a3;
LABEL_15:
      v21 = -[ATXAnchorModelSamplingGroup initWithAnchorWhitelist:samplingGroupId:](v5, "initWithAnchorWhitelist:samplingGroupId:", v6, v7);
      return v21;
  }
}

- (NSArray)anchorWhitelist
{
  return self->_anchorWhitelist;
}

- (int64_t)samplingGroupId
{
  return self->_samplingGroupId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorWhitelist, 0);
}

+ (void)samplingGroupFromSamplingGroupId:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "AnchorModel: Tried to initialize a sampling group with an unknown sampling group id. Passed-in id: %li", (uint8_t *)&v2, 0xCu);
}

+ (void)samplingGroupFromSamplingGroupId:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "AnchorModel: Tried to initialize a sampling group with sampling group id ATXAnchorModelDCSamplingGroupIdUnknown. This should never happen.", v1, 2u);
}

@end
