@implementation SWUpdateCollaborationParticipantsAction

+ (SWUpdateCollaborationParticipantsAction)actionWithMetadata:(id)a3 addedIdentities:(id)a4 removedIdentites:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMetadata:addedIdentities:removedIdentites:", v9, v8, v7);

  return (SWUpdateCollaborationParticipantsAction *)v10;
}

- (SWUpdateCollaborationParticipantsAction)initWithMetadata:(id)a3 addedIdentities:(id)a4 removedIdentites:(id)a5
{
  id v9;
  id v10;
  id v11;
  SWUpdateCollaborationParticipantsAction *v12;
  SWUpdateCollaborationParticipantsAction *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SWUpdateCollaborationParticipantsAction;
  v12 = -[SWAction init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_collaborationMetadata, a3);
    objc_storeStrong((id *)&v13->_addedIdentities, a4);
    objc_storeStrong((id *)&v13->_removedIdentities, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SWUpdateCollaborationParticipantsAction)initWithCoder:(id)a3
{
  id v4;
  SWUpdateCollaborationParticipantsAction *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  SWCollaborationMetadata *collaborationMetadata;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *addedIdentities;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSArray *removedIdentities;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SWUpdateCollaborationParticipantsAction;
  v5 = -[SWAction initWithCoder:](&v27, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_collaborationMetadata);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    collaborationMetadata = v5->_collaborationMetadata;
    v5->_collaborationMetadata = (SWCollaborationMetadata *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_addedIdentities);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    addedIdentities = v5->_addedIdentities;
    v5->_addedIdentities = (NSArray *)v17;

    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_removedIdentities);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    removedIdentities = v5->_removedIdentities;
    v5->_removedIdentities = (NSArray *)v24;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SWUpdateCollaborationParticipantsAction;
  v4 = a3;
  -[SWAction encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  -[SWUpdateCollaborationParticipantsAction collaborationMetadata](self, "collaborationMetadata", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_collaborationMetadata);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[SWUpdateCollaborationParticipantsAction addedIdentities](self, "addedIdentities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_addedIdentities);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[SWUpdateCollaborationParticipantsAction removedIdentities](self, "removedIdentities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_removedIdentities);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SWUpdateCollaborationParticipantsAction;
  v4 = -[SWAction copyWithZone:](&v9, sel_copyWithZone_, a3);
  if (v4)
  {
    -[SWUpdateCollaborationParticipantsAction collaborationMetadata](self, "collaborationMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCollaborationMetadata:", v5);

    -[SWUpdateCollaborationParticipantsAction addedIdentities](self, "addedIdentities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAddedIdentities:", v6);

    -[SWUpdateCollaborationParticipantsAction removedIdentities](self, "removedIdentities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRemovedIdentities:", v7);

  }
  return v4;
}

- (BOOL)isEqualToAction:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  void *v28;
  objc_super v29;

  v8 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SWUpdateCollaborationParticipantsAction;
  if (!-[SWAction isEqualToAction:](&v29, sel_isEqualToAction_, v8)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v13 = 0;
    goto LABEL_32;
  }
  v9 = v8;
  -[SWUpdateCollaborationParticipantsAction collaborationMetadata](self, "collaborationMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 || (objc_msgSend(v9, "collaborationMetadata"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SWUpdateCollaborationParticipantsAction collaborationMetadata](self, "collaborationMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collaborationMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v11) & 1) == 0)
    {

      v13 = 0;
      goto LABEL_29;
    }
    v28 = v11;
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }
  -[SWUpdateCollaborationParticipantsAction addedIdentities](self, "addedIdentities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(v9, "addedIdentities");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      v26 = 0;
      v27 = v12;
      v23 = 0;
      goto LABEL_20;
    }
  }
  -[SWUpdateCollaborationParticipantsAction addedIdentities](self, "addedIdentities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addedIdentities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v5) & 1) != 0)
  {
    v26 = 1;
    v27 = v12;
LABEL_20:
    -[SWUpdateCollaborationParticipantsAction removedIdentities](self, "removedIdentities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 || (objc_msgSend(v9, "removedIdentities"), (v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v24 = v4;
      v25 = v3;
      -[SWUpdateCollaborationParticipantsAction removedIdentities](self, "removedIdentities", v21, v23);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removedIdentities");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v16, "isEqual:", v17);

      if (v15)
      {

        v4 = v24;
        v3 = v25;
        v18 = v27;
        if (!v26)
          goto LABEL_25;
        goto LABEL_24;
      }
      v4 = v24;
      v3 = v25;
      v18 = v27;
      v20 = v22;
    }
    else
    {
      v20 = 0;
      v13 = 1;
      v18 = v27;
    }

    if ((v26 & 1) == 0)
    {
LABEL_25:
      if (!v14)

      if (!v18)
        goto LABEL_29;
      goto LABEL_28;
    }
LABEL_24:

    goto LABEL_25;
  }

  if (v14)
  else

  v13 = 0;
  if ((v12 & 1) != 0)
  {
LABEL_28:

  }
LABEL_29:
  if (!v10)

LABEL_32:
  return v13;
}

- (SWUpdateCollaborationParticipantsAction)initWithDestinationAction:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  SWUpdateCollaborationParticipantsAction *v26;
  id *p_isa;
  SWUpdateCollaborationParticipantsAction *v28;
  SWUpdateCollaborationParticipantsAction *v29;
  void *v31;
  id v32;
  void *v34;
  void *v35;
  objc_super v36;
  id v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForSetting:", 3);
  v5 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForSetting:", 4);
  v7 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "info");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForSetting:", 5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3710];
  v10 = (void *)MEMORY[0x1E0C99E60];
  v38[0] = objc_opt_class();
  v38[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v35 = (void *)v5;
  objc_msgSend(v9, "unarchivedObjectOfClasses:fromData:error:", v12, v5, &v37);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v37;

  v14 = (void *)MEMORY[0x1E0CB3710];
  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)v7;
  objc_msgSend(v14, "unarchivedObjectOfClasses:fromData:error:", v18, v7, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0CB3710];
  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, v23, objc_opt_class(), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "unarchivedObjectOfClasses:fromData:error:", v24, v31, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v36.receiver = self;
    v36.super_class = (Class)SWUpdateCollaborationParticipantsAction;
    v26 = -[SWAction initWithDestinationAction:](&v36, sel_initWithDestinationAction_, v3);
    p_isa = (id *)&v26->super.super.isa;
    if (v26)
    {
      objc_storeStrong((id *)&v26->_collaborationMetadata, v13);
      objc_storeStrong(p_isa + 9, v19);
      objc_storeStrong(p_isa + 10, v25);
    }
    v28 = p_isa;
    v29 = v28;
  }
  else
  {
    v29 = 0;
    v28 = self;
  }

  return v29;
}

- (void)encodeWithBSActionSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SWUpdateCollaborationParticipantsAction;
  v4 = a3;
  -[SWAction encodeWithBSActionSettings:](&v14, sel_encodeWithBSActionSettings_, v4);
  v5 = (void *)MEMORY[0x1E0CB36F8];
  -[SWUpdateCollaborationParticipantsAction collaborationMetadata](self, "collaborationMetadata", v14.receiver, v14.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB36F8];
  -[SWUpdateCollaborationParticipantsAction addedIdentities](self, "addedIdentities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB36F8];
  -[SWUpdateCollaborationParticipantsAction removedIdentities](self, "removedIdentities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forSetting:", v7, 3);
  objc_msgSend(v4, "setObject:forSetting:", v10, 4);
  objc_msgSend(v4, "setObject:forSetting:", v13, 5);

}

- (SWCollaborationMetadata)collaborationMetadata
{
  return self->_collaborationMetadata;
}

- (void)setCollaborationMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationMetadata, a3);
}

- (NSArray)addedIdentities
{
  return self->_addedIdentities;
}

- (void)setAddedIdentities:(id)a3
{
  objc_storeStrong((id *)&self->_addedIdentities, a3);
}

- (NSArray)removedIdentities
{
  return self->_removedIdentities;
}

- (void)setRemovedIdentities:(id)a3
{
  objc_storeStrong((id *)&self->_removedIdentities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedIdentities, 0);
  objc_storeStrong((id *)&self->_addedIdentities, 0);
  objc_storeStrong((id *)&self->_collaborationMetadata, 0);
}

@end
