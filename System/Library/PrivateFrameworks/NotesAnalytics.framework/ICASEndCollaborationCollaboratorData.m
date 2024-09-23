@implementation ICASEndCollaborationCollaboratorData

- (ICASEndCollaborationCollaboratorData)initWithEndInvitedCount:(id)a3 endAcceptedCount:(id)a4
{
  id v7;
  id v8;
  ICASEndCollaborationCollaboratorData *v9;
  ICASEndCollaborationCollaboratorData *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASEndCollaborationCollaboratorData;
  v9 = -[ICASEndCollaborationCollaboratorData init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_endInvitedCount, a3);
    objc_storeStrong((id *)&v10->_endAcceptedCount, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("EndCollaborationCollaboratorData");
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
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("endInvitedCount");
  -[ICASEndCollaborationCollaboratorData endInvitedCount](self, "endInvitedCount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICASEndCollaborationCollaboratorData endInvitedCount](self, "endInvitedCount");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = CFSTR("endAcceptedCount");
  v12[0] = v4;
  -[ICASEndCollaborationCollaboratorData endAcceptedCount](self, "endAcceptedCount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICASEndCollaborationCollaboratorData endAcceptedCount](self, "endAcceptedCount");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSNumber)endInvitedCount
{
  return self->_endInvitedCount;
}

- (NSNumber)endAcceptedCount
{
  return self->_endAcceptedCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endAcceptedCount, 0);
  objc_storeStrong((id *)&self->_endInvitedCount, 0);
}

@end
