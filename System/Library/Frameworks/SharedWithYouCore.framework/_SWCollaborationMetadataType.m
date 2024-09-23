@implementation _SWCollaborationMetadataType

+ (_SWCollaborationMetadataType)collaboration
{
  _SWCollaborationMetadataType *v2;
  void *v3;
  void *v4;
  _SWCollaborationMetadataType *v5;

  v2 = [_SWCollaborationMetadataType alloc];
  SWCoreFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Collaborate"), &stru_1E217B478, CFSTR("SharedWithYouCore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_SWCollaborationMetadataType initWithTypedIdentifier:actionDescription:](v2, "initWithTypedIdentifier:actionDescription:", CFSTR("SWCollaborationMetadataTypeTypeIdentifierCollaboration"), v4);

  return v5;
}

+ (_SWCollaborationMetadataType)event
{
  _SWCollaborationMetadataType *v2;
  void *v3;
  void *v4;
  _SWCollaborationMetadataType *v5;

  v2 = [_SWCollaborationMetadataType alloc];
  SWCoreFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("RSVP"), &stru_1E217B478, CFSTR("SharedWithYouCore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_SWCollaborationMetadataType initWithTypedIdentifier:actionDescription:](v2, "initWithTypedIdentifier:actionDescription:", CFSTR("SWCollaborationMetadataTypeTypeIdentifierEvent"), v4);

  return v5;
}

- (_SWCollaborationMetadataType)initWithTypedIdentifier:(id)a3 actionDescription:(id)a4
{
  id v6;
  id v7;
  _SWCollaborationMetadataType *v8;
  _SWCollaborationMetadataType *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_SWCollaborationMetadataType;
  v8 = -[_SWCollaborationMetadataType init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[_SWCollaborationMetadataType setTypedIdentifier:](v8, "setTypedIdentifier:", v6);
    -[_SWCollaborationMetadataType setActionDescription:](v9, "setActionDescription:", v7);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[_SWCollaborationMetadataType isEqualToCollaborationMetadataType:](self, "isEqualToCollaborationMetadataType:", v4);

  return v5;
}

- (BOOL)isEqualToCollaborationMetadataType:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  int v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v7 = a3;
  -[_SWCollaborationMetadataType typedIdentifier](self, "typedIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "typedIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v15 = 0;
      v9 = 0;
      goto LABEL_7;
    }
  }
  -[_SWCollaborationMetadataType typedIdentifier](self, "typedIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "typedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqual:", v4))
  {
    v9 = 1;
LABEL_7:
    -[_SWCollaborationMetadataType actionDescription](self, "actionDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 || (objc_msgSend(v7, "actionDescription"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[_SWCollaborationMetadataType actionDescription](self, "actionDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "actionDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "isEqual:", v13);

      if (v11)
        goto LABEL_13;
    }
    else
    {
      v10 = 1;
    }

LABEL_13:
    if (!v9)
      goto LABEL_15;
    goto LABEL_14;
  }
  v10 = 0;
LABEL_14:

LABEL_15:
  if (!v8)

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[_SWCollaborationMetadataType typedIdentifier](self, "typedIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[_SWCollaborationMetadataType actionDescription](self, "actionDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[_SWCollaborationMetadataType typedIdentifier](self, "typedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_typedIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[_SWCollaborationMetadataType actionDescription](self, "actionDescription");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_actionDescription);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, v7);

}

- (_SWCollaborationMetadataType)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _SWCollaborationMetadataType *v11;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_typedIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_actionDescription);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[_SWCollaborationMetadataType initWithTypedIdentifier:actionDescription:](self, "initWithTypedIdentifier:actionDescription:", v7, v10);
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[_SWCollaborationMetadataType typedIdentifier](self, "typedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SWCollaborationMetadataType actionDescription](self, "actionDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithTypedIdentifier:actionDescription:", v5, v6);

  return v7;
}

- (NSString)typedIdentifier
{
  return self->_typedIdentifier;
}

- (void)setTypedIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_typedIdentifier, a3);
}

- (NSString)actionDescription
{
  return self->_actionDescription;
}

- (void)setActionDescription:(id)a3
{
  objc_storeStrong((id *)&self->_actionDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionDescription, 0);
  objc_storeStrong((id *)&self->_typedIdentifier, 0);
}

@end
