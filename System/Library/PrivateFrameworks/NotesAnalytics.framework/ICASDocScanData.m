@implementation ICASDocScanData

- (ICASDocScanData)initWithDocScanID:(id)a3 docScanActionType:(id)a4 docScanStage:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICASDocScanData *v12;
  ICASDocScanData *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICASDocScanData;
  v12 = -[ICASDocScanData init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_docScanID, a3);
    objc_storeStrong((id *)&v13->_docScanActionType, a4);
    objc_storeStrong((id *)&v13->_docScanStage, a5);
  }

  return v13;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("DocScanData");
}

- (id)toDict
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("docScanID");
  -[ICASDocScanData docScanID](self, "docScanID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICASDocScanData docScanID](self, "docScanID");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v15[0] = v4;
  v14[1] = CFSTR("docScanActionType");
  -[ICASDocScanData docScanActionType](self, "docScanActionType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICASDocScanData docScanActionType](self, "docScanActionType");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v15[1] = v7;
  v14[2] = CFSTR("docScanStage");
  -[ICASDocScanData docScanStage](self, "docScanStage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[ICASDocScanData docScanStage](self, "docScanStage");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_opt_new();
  }
  v11 = (void *)v10;
  v15[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)docScanID
{
  return self->_docScanID;
}

- (ICASDocScanActionType)docScanActionType
{
  return self->_docScanActionType;
}

- (ICASDocScanStage)docScanStage
{
  return self->_docScanStage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_docScanStage, 0);
  objc_storeStrong((id *)&self->_docScanActionType, 0);
  objc_storeStrong((id *)&self->_docScanID, 0);
}

@end
