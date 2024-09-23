@implementation DAContactsContainer

- (DAContactsContainer)initWithCNContainer:(id)a3
{
  id v4;
  DAContactsContainer *v5;
  uint64_t v6;
  CNMutableContainer *mutableContainer;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DAContactsContainer;
  v5 = -[DAContactsContainer init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    mutableContainer = v5->_mutableContainer;
    v5->_mutableContainer = (CNMutableContainer *)v6;

  }
  return v5;
}

- (id)identifier
{
  void *v2;
  void *v3;

  -[DAContactsContainer mutableContainer](self, "mutableContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)name
{
  void *v2;
  void *v3;

  -[DAContactsContainer mutableContainer](self, "mutableContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DAContactsContainer mutableContainer](self, "mutableContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v4);

}

- (BOOL)isLocal
{
  void *v2;
  BOOL v3;

  -[DAContactsContainer mutableContainer](self, "mutableContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type") == 1;

  return v3;
}

- (int64_t)type
{
  void *v2;
  int64_t v3;

  -[DAContactsContainer mutableContainer](self, "mutableContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  return v3;
}

- (void)setType:(int64_t)a3
{
  id v4;

  -[DAContactsContainer mutableContainer](self, "mutableContainer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setType:", a3);

}

- (id)externalIdentifier
{
  void *v2;
  void *v3;

  -[DAContactsContainer mutableContainer](self, "mutableContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "externalIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setExternalIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DAContactsContainer mutableContainer](self, "mutableContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExternalIdentifier:", v4);

}

- (id)cTag
{
  void *v2;
  void *v3;

  -[DAContactsContainer mutableContainer](self, "mutableContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "externalModificationTag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setCTag:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DAContactsContainer mutableContainer](self, "mutableContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExternalModificationTag:", v4);

}

- (id)syncTag
{
  void *v2;
  void *v3;

  -[DAContactsContainer mutableContainer](self, "mutableContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "externalSyncTag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setSyncTag:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DAContactsContainer mutableContainer](self, "mutableContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExternalSyncTag:", v4);

}

- (id)syncData
{
  void *v2;
  void *v3;

  -[DAContactsContainer mutableContainer](self, "mutableContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "externalSyncData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setSyncData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DAContactsContainer mutableContainer](self, "mutableContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExternalSyncData:", v4);

}

- (id)constraintsPath
{
  void *v2;
  void *v3;

  -[DAContactsContainer mutableContainer](self, "mutableContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constraintsPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setConstraintsPath:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DAContactsContainer mutableContainer](self, "mutableContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstraintsPath:", v4);

}

- (id)meContactidentifier
{
  void *v2;
  void *v3;

  -[DAContactsContainer mutableContainer](self, "mutableContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "meIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setMeContactIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DAContactsContainer mutableContainer](self, "mutableContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMeIdentifier:", v4);

}

- (id)accountIdentifier
{
  void *v2;
  void *v3;

  -[DAContactsContainer mutableContainer](self, "mutableContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setAccountIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DAContactsContainer mutableContainer](self, "mutableContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountIdentifier:", v4);

}

- (BOOL)isContentReadonly
{
  void *v3;
  _BOOL8 v4;

  if ((-[DAContactsContainer type](self, "type") & 0x1000000) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    -[DAContactsContainer mutableContainer](self, "mutableContainer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "restrictions") & 1;

  }
  return v4;
}

- (void)setContentReadonly:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  -[DAContactsContainer mutableContainer](self, "mutableContainer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "restrictions");
  -[DAContactsContainer mutableContainer](self, "mutableContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRestrictions:", v5 & 0xFFFFFFFFFFFFFFFELL | v3);

}

- (BOOL)arePropertiesReadonly
{
  void *v3;
  unint64_t v4;

  if ((-[DAContactsContainer type](self, "type") & 0x1000000) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    -[DAContactsContainer mutableContainer](self, "mutableContainer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = ((unint64_t)objc_msgSend(v3, "restrictions") >> 1) & 1;

  }
  return v4;
}

- (void)setArePropertiesReadonly:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = a3;
  -[DAContactsContainer mutableContainer](self, "mutableContainer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v9, "restrictions");
  -[DAContactsContainer mutableContainer](self, "mutableContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = 2;
  if (!v3)
    v8 = 0;
  objc_msgSend(v6, "setRestrictions:", v5 & 0xFFFFFFFFFFFFFFFDLL | v8);

}

- (BOOL)isSearchContainer
{
  return 0;
}

- (void)markForDeletion
{
  -[DAContactsContainer setMarkedForDeletion:](self, "setMarkedForDeletion:", 1);
}

- (void)markAsDefault
{
  -[DAContactsContainer setMarkedAsDefault:](self, "setMarkedAsDefault:", 1);
}

- (BOOL)isContact
{
  return 0;
}

- (BOOL)isGroup
{
  return 0;
}

- (BOOL)isContainer
{
  return 1;
}

- (BOOL)isAccount
{
  return 0;
}

- (void)updateSaveRequest:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  v8 = a3;
  v4 = -[DAContactsContainer markedForDeletion](self, "markedForDeletion");
  -[DAContactsContainer mutableContainer](self, "mutableContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v8, "deleteContainer:", v5);
LABEL_5:

    goto LABEL_6;
  }
  v7 = objc_msgSend(v5, "iOSLegacyIdentifier");

  if (v7 != -1)
  {
    -[DAContactsContainer mutableContainer](self, "mutableContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateContainer:", v6);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)asSource
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("DAContactsContainer does not support asSource"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CNMutableContainer)mutableContainer
{
  return self->_mutableContainer;
}

- (BOOL)markedForDeletion
{
  return self->_markedForDeletion;
}

- (void)setMarkedForDeletion:(BOOL)a3
{
  self->_markedForDeletion = a3;
}

- (BOOL)markedAsDefault
{
  return self->_markedAsDefault;
}

- (void)setMarkedAsDefault:(BOOL)a3
{
  self->_markedAsDefault = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableContainer, 0);
}

@end
