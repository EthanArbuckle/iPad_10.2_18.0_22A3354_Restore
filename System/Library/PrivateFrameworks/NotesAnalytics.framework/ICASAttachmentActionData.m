@implementation ICASAttachmentActionData

- (ICASAttachmentActionData)initWithActionType:(id)a3
{
  id v5;
  ICASAttachmentActionData *v6;
  ICASAttachmentActionData *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASAttachmentActionData;
  v6 = -[ICASAttachmentActionData init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_actionType, a3);

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("AttachmentActionData");
}

- (id)toDict
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("actionType");
  -[ICASAttachmentActionData actionType](self, "actionType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICASAttachmentActionData actionType](self, "actionType");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (ICASActionType)actionType
{
  return self->_actionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionType, 0);
}

@end
