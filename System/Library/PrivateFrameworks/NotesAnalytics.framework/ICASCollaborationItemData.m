@implementation ICASCollaborationItemData

- (ICASCollaborationItemData)initWithCollaborationItemType:(id)a3
{
  id v5;
  ICASCollaborationItemData *v6;
  ICASCollaborationItemData *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASCollaborationItemData;
  v6 = -[ICASCollaborationItemData init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_collaborationItemType, a3);

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("CollaborationItemData");
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
  v8 = CFSTR("collaborationItemType");
  -[ICASCollaborationItemData collaborationItemType](self, "collaborationItemType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICASCollaborationItemData collaborationItemType](self, "collaborationItemType");
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

- (ICASCollaborationItemType)collaborationItemType
{
  return self->_collaborationItemType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationItemType, 0);
}

@end
