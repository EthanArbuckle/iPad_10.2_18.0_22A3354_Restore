@implementation SWStartCollaborationAction

+ (SWStartCollaborationAction)actionWithMetadata:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMetadata:", v4);

  return (SWStartCollaborationAction *)v5;
}

- (SWStartCollaborationAction)initWithMetadata:(id)a3
{
  id v5;
  SWStartCollaborationAction *v6;
  SWStartCollaborationAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SWStartCollaborationAction;
  v6 = -[SWAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_collaborationMetadata, a3);

  return v7;
}

- (void)fulfillUsingURL:(NSURL *)url collaborationIdentifier:(SWCollaborationIdentifier)collaborationIdentifier
{
  NSString *v6;
  NSURL *v7;
  id v8;

  v6 = collaborationIdentifier;
  v7 = url;
  -[SWStartCollaborationAction collaborationMetadata](self, "collaborationMetadata");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCollaborationIdentifier:", v6);

  -[SWStartCollaborationAction fulfillUsingURL:updatedMetadata:](self, "fulfillUsingURL:updatedMetadata:", v7, v8);
}

- (void)fulfillUsingURL:(id)a3 updatedMetadata:(id)a4
{
  id v5;

  +[_SWStartCollaborationActionResponse responseWithURL:updatedMetadata:](_SWStartCollaborationActionResponse, "responseWithURL:updatedMetadata:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SWAction fulfillWithResponse:](self, "fulfillWithResponse:", v5);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SWStartCollaborationAction)initWithCoder:(id)a3
{
  id v4;
  SWStartCollaborationAction *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  SWCollaborationMetadata *collaborationMetadata;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SWStartCollaborationAction;
  v5 = -[SWAction initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_collaborationMetadata);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    collaborationMetadata = v5->_collaborationMetadata;
    v5->_collaborationMetadata = (SWCollaborationMetadata *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SWStartCollaborationAction;
  v4 = a3;
  -[SWAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[SWStartCollaborationAction collaborationMetadata](self, "collaborationMetadata", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_collaborationMetadata);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SWStartCollaborationAction;
  v4 = -[SWAction copyWithZone:](&v7, sel_copyWithZone_, a3);
  if (v4)
  {
    -[SWStartCollaborationAction collaborationMetadata](self, "collaborationMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCollaborationMetadata:", v5);

  }
  return v4;
}

- (BOOL)isEqualToAction:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SWStartCollaborationAction;
  if (-[SWAction isEqualToAction:](&v12, sel_isEqualToAction_, v5))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[SWStartCollaborationAction collaborationMetadata](self, "collaborationMetadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 || (objc_msgSend(v6, "collaborationMetadata"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[SWStartCollaborationAction collaborationMetadata](self, "collaborationMetadata");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "collaborationMetadata");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

        if (v7)
        {
LABEL_10:

          goto LABEL_11;
        }
      }
      else
      {
        v10 = 1;
      }

      goto LABEL_10;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (SWStartCollaborationAction)initWithDestinationAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SWStartCollaborationAction *v12;
  SWStartCollaborationAction *v13;
  SWStartCollaborationAction *v14;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForSetting:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3710];
  v8 = (void *)MEMORY[0x1E0C99E60];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v10, v6, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v16.receiver = self;
    v16.super_class = (Class)SWStartCollaborationAction;
    v12 = -[SWAction initWithDestinationAction:](&v16, sel_initWithDestinationAction_, v4);
    v13 = v12;
    if (v12)
      objc_storeStrong((id *)&v12->_collaborationMetadata, v11);
    self = v13;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)encodeWithBSActionSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SWStartCollaborationAction;
  v4 = a3;
  -[SWAction encodeWithBSActionSettings:](&v8, sel_encodeWithBSActionSettings_, v4);
  v5 = (void *)MEMORY[0x1E0CB36F8];
  -[SWStartCollaborationAction collaborationMetadata](self, "collaborationMetadata", v8.receiver, v8.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forSetting:", v7, 2);
}

- (SWCollaborationMetadata)collaborationMetadata
{
  return self->_collaborationMetadata;
}

- (void)setCollaborationMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationMetadata, 0);
}

@end
