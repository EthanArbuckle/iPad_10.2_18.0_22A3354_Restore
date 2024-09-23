@implementation ATXSportsResponseTeam

- (ATXSportsResponseTeam)initWithName:(id)a3 umcid:(id)a4 qid:(id)a5
{
  id v8;
  id v9;
  id v10;
  ATXSportsResponseTeam *v11;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  NSString *umcid;
  uint64_t v16;
  NSString *qid;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ATXSportsResponseTeam;
  v11 = -[ATXSportsResponseTeam init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    umcid = v11->_umcid;
    v11->_umcid = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    qid = v11->_qid;
    v11->_qid = (NSString *)v16;

  }
  return v11;
}

- (ATXSportsResponseTeam)initWithName:(id)a3 umcid:(id)a4
{
  return -[ATXSportsResponseTeam initWithName:umcid:qid:](self, "initWithName:umcid:qid:", a3, a4, 0);
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

  v22[1] = *MEMORY[0x1E0C80C00];
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
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
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
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("KEY_NAME"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_umcid, CFSTR("KEY_UMCID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_qid, CFSTR("KEY_QID"));

}

- (ATXSportsResponseTeam)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXSportsResponseTeam *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_default();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("KEY_NAME"), v4, 0, CFSTR("com.apple.duetexpertd.ATXSportsResponseTeam"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0D81610];
    v12 = objc_opt_class();
    __atxlog_handle_default();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v12, CFSTR("KEY_UMCID"), v4, 0, CFSTR("com.apple.duetexpertd.ATXSportsResponseTeam"), -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v10 = 0;
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0D81610];
      v17 = objc_opt_class();
      __atxlog_handle_default();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v17, CFSTR("KEY_QID"), v4, 0, CFSTR("com.apple.duetexpertd.ATXSportsResponseTeam"), -1, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "error");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v10 = 0;
      }
      else
      {
        self = -[ATXSportsResponseTeam initWithName:umcid:qid:](self, "initWithName:umcid:qid:", v8, v14, v19);
        v10 = self;
      }

    }
  }

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)umcid
{
  return self->_umcid;
}

- (NSString)qid
{
  return self->_qid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qid, 0);
  objc_storeStrong((id *)&self->_umcid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
