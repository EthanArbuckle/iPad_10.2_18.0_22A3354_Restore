@implementation ICASCollabActivityData

- (ICASCollabActivityData)initWithCollabActivityContextPath:(id)a3 clickContext:(id)a4 mode:(id)a5 isUserMentioned:(id)a6 hasRecentUpdates:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ICASCollabActivityData *v17;
  ICASCollabActivityData *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ICASCollabActivityData;
  v17 = -[ICASCollabActivityData init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_collabActivityContextPath, a3);
    objc_storeStrong((id *)&v18->_clickContext, a4);
    objc_storeStrong((id *)&v18->_mode, a5);
    objc_storeStrong((id *)&v18->_isUserMentioned, a6);
    objc_storeStrong((id *)&v18->_hasRecentUpdates, a7);
  }

  return v18;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("CollabActivityData");
}

- (id)toDict
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("collabActivityContextPath");
  -[ICASCollabActivityData collabActivityContextPath](self, "collabActivityContextPath");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[ICASCollabActivityData collabActivityContextPath](self, "collabActivityContextPath", v19);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_opt_new();
  }
  v4 = (void *)v3;
  v22[0] = v3;
  v21[1] = CFSTR("clickContext");
  -[ICASCollabActivityData clickContext](self, "clickContext", v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ICASCollabActivityData clickContext](self, "clickContext");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_opt_new();
  }
  v7 = (void *)v6;
  v22[1] = v6;
  v21[2] = CFSTR("mode");
  -[ICASCollabActivityData mode](self, "mode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[ICASCollabActivityData mode](self, "mode");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_opt_new();
  }
  v10 = (void *)v9;
  v22[2] = v9;
  v21[3] = CFSTR("isUserMentioned");
  -[ICASCollabActivityData isUserMentioned](self, "isUserMentioned");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[ICASCollabActivityData isUserMentioned](self, "isUserMentioned");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = objc_opt_new();
  }
  v13 = (void *)v12;
  v22[3] = v12;
  v21[4] = CFSTR("hasRecentUpdates");
  -[ICASCollabActivityData hasRecentUpdates](self, "hasRecentUpdates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[ICASCollabActivityData hasRecentUpdates](self, "hasRecentUpdates");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = objc_opt_new();
  }
  v16 = (void *)v15;
  v22[4] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (ICASCollabActivityContextPath)collabActivityContextPath
{
  return self->_collabActivityContextPath;
}

- (ICASClickContext)clickContext
{
  return self->_clickContext;
}

- (ICASMode)mode
{
  return self->_mode;
}

- (NSNumber)isUserMentioned
{
  return self->_isUserMentioned;
}

- (NSNumber)hasRecentUpdates
{
  return self->_hasRecentUpdates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasRecentUpdates, 0);
  objc_storeStrong((id *)&self->_isUserMentioned, 0);
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong((id *)&self->_clickContext, 0);
  objc_storeStrong((id *)&self->_collabActivityContextPath, 0);
}

@end
