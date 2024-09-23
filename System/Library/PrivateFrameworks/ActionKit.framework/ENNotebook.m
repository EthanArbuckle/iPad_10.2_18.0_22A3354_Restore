@implementation ENNotebook

- (ENNotebook)initWithNotebook:(id)a3
{
  return -[ENNotebook initWithNotebook:linkedNotebook:sharedNotebook:](self, "initWithNotebook:linkedNotebook:sharedNotebook:", a3, 0, 0);
}

- (ENNotebook)initWithSharedNotebook:(id)a3 forLinkedNotebook:(id)a4
{
  return -[ENNotebook initWithNotebook:linkedNotebook:sharedNotebook:](self, "initWithNotebook:linkedNotebook:sharedNotebook:", 0, a4, a3);
}

- (ENNotebook)initWithPublicNotebook:(id)a3 forLinkedNotebook:(id)a4
{
  return -[ENNotebook initWithNotebook:linkedNotebook:sharedNotebook:](self, "initWithNotebook:linkedNotebook:sharedNotebook:", a3, a4, 0);
}

- (ENNotebook)initWithSharedNotebook:(id)a3 forLinkedNotebook:(id)a4 withBusinessNotebook:(id)a5
{
  return -[ENNotebook initWithNotebook:linkedNotebook:sharedNotebook:](self, "initWithNotebook:linkedNotebook:sharedNotebook:", a5, a4, a3);
}

- (ENNotebook)initWithNotebook:(id)a3 linkedNotebook:(id)a4 sharedNotebook:(id)a5
{
  id v8;
  id v9;
  id v10;
  ENNotebook *v11;
  ENNotebook *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ENNotebook;
  v11 = -[ENNotebook init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[ENNotebook setNotebook:](v11, "setNotebook:", v8);
    -[ENNotebook setLinkedNotebook:](v12, "setLinkedNotebook:", v9);
    -[ENNotebook setSharedNotebook:](v12, "setSharedNotebook:", v10);
  }

  return v12;
}

- (ENNotebook)initWithCoder:(id)a3
{
  id v4;
  ENNotebook *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ENNotebook *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ENNotebook;
  v5 = -[ENNotebook init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("notebook"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENNotebook setNotebook:](v5, "setNotebook:", v6);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("linkedNotebook"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENNotebook setLinkedNotebook:](v5, "setLinkedNotebook:", v7);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("sharedNotebook"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENNotebook setSharedNotebook:](v5, "setSharedNotebook:", v8);

    -[ENNotebook setIsShared:](v5, "setIsShared:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isShared")));
    -[ENNotebook setIsDefaultNotebookOverride:](v5, "setIsDefaultNotebookOverride:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDefaultNotebookOverride")));
    -[ENNotebook notebook](v5, "notebook");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9
      || (-[ENNotebook linkedNotebook](v5, "linkedNotebook"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {
      -[ENNotebook sharedNotebook](v5, "sharedNotebook");
      v10 = (ENNotebook *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_6;
    }
  }
  v10 = v5;
LABEL_6:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ENNotebook notebook](self, "notebook");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("notebook"));

  -[ENNotebook linkedNotebook](self, "linkedNotebook");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("linkedNotebook"));

  -[ENNotebook sharedNotebook](self, "sharedNotebook");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("sharedNotebook"));

  objc_msgSend(v7, "encodeBool:forKey:", -[ENNotebook isShared](self, "isShared"), CFSTR("isShared"));
  objc_msgSend(v7, "encodeBool:forKey:", -[ENNotebook isDefaultNotebookOverride](self, "isDefaultNotebookOverride"), CFSTR("isDefaultNotebookOverride"));

}

- (NSString)name
{
  void *v3;
  void *v4;
  void *v5;

  -[ENNotebook notebook](self, "notebook");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ENNotebook notebook](self, "notebook");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
  }
  else
  {
    -[ENNotebook linkedNotebook](self, "linkedNotebook");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shareName");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)ownerDisplayName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  if (!-[ENNotebook isBusinessNotebook](self, "isBusinessNotebook"))
  {
    -[ENNotebook linkedNotebook](self, "linkedNotebook");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[ENNotebook linkedNotebook](self, "linkedNotebook");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "username");
    }
    else
    {
      +[ENSession sharedSession](ENSession, "sharedSession");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userDisplayName");
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  -[ENNotebook notebook](self, "notebook");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length"))
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "businessDisplayName");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
LABEL_8:

  }
  return (NSString *)v5;
}

- (id)guid
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[ENNotebook notebook](self, "notebook");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ENNotebook notebook](self, "notebook");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "guid");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;

    return v6;
  }
  -[ENNotebook sharedNotebook](self, "sharedNotebook");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ENNotebook sharedNotebook](self, "sharedNotebook");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notebookGuid");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return v6;
}

- (BOOL)isShared
{
  return -[ENNotebook isOwnShared](self, "isOwnShared") || -[ENNotebook isJoinedShared](self, "isJoinedShared");
}

- (BOOL)isOwnShared
{
  BOOL v3;
  void *v4;
  void *v5;

  if (-[ENNotebook isLinked](self, "isLinked"))
    return 0;
  -[ENNotebook notebook](self, "notebook");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedNotebookIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "count") != 0;

  return v3;
}

- (BOOL)isLinked
{
  void *v2;
  BOOL v3;

  -[ENNotebook linkedNotebook](self, "linkedNotebook");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isPublic
{
  return -[ENNotebook isOwnPublic](self, "isOwnPublic") || -[ENNotebook isJoinedPublic](self, "isJoinedPublic");
}

- (BOOL)isJoinedPublic
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[ENNotebook isLinked](self, "isLinked"))
    return 0;
  -[ENNotebook linkedNotebook](self, "linkedNotebook");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharedNotebookGlobalId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

- (BOOL)isOwnPublic
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[ENNotebook isLinked](self, "isLinked"))
    return 0;
  -[ENNotebook notebook](self, "notebook");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "publishing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uri");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "length") != 0;

  return v3;
}

- (BOOL)isBusinessNotebook
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[ENNotebook notebook](self, "notebook");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ENNotebook linkedNotebook](self, "linkedNotebook");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[ENNotebook linkedNotebook](self, "linkedNotebook");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sharedNotebookGlobalId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6 != 0;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isOwnedByUser
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  BOOL v9;

  -[ENNotebook linkedNotebook](self, "linkedNotebook");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  if (!-[ENNotebook isBusinessNotebook](self, "isBusinessNotebook"))
    return 0;
  -[ENNotebook notebook](self, "notebook");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");
  +[ENSession sharedSession](ENSession, "sharedSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 == objc_msgSend(v8, "userID");

  return v9;
}

- (BOOL)isDefaultNotebook
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  char v8;

  if (-[ENNotebook isDefaultNotebookOverride](self, "isDefaultNotebookOverride"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    -[ENNotebook notebook](self, "notebook");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      v5 = -[ENNotebook isJoinedPublic](self, "isJoinedPublic");

      if (v5)
      {
        LOBYTE(v3) = 0;
      }
      else
      {
        -[ENNotebook notebook](self, "notebook");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "defaultNotebook");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "BOOLValue");

        LOBYTE(v3) = v8;
      }
    }
  }
  return v3;
}

- (BOOL)allowsWriting
{
  void *v3;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;

  -[ENNotebook linkedNotebook](self, "linkedNotebook");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  if (-[ENNotebook isJoinedPublic](self, "isJoinedPublic"))
    return 0;
  -[ENNotebook sharedNotebook](self, "sharedNotebook");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "privilege");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  if (v7 == 3)
  {
    -[ENNotebook notebook](self, "notebook");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "businessNotebook");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "privilege");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "intValue");

  }
  return v7 == 4 || (v7 & 0xFFFFFFFB) == 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  _BOOL4 v11;
  const __CFString *v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD16A8];
  -[ENNotebook ownerDisplayName](self, "ownerDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\"%@\"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[ENNotebook isOwnedByUser](self, "isOwnedByUser"))
    objc_msgSend(v5, "appendString:", CFSTR(" (me)"));
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = objc_opt_class();
  -[ENNotebook name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("NO");
  if (-[ENNotebook isBusinessNotebook](self, "isBusinessNotebook"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (-[ENNotebook isShared](self, "isShared"))
    v9 = CFSTR("YES");
  v11 = -[ENNotebook allowsWriting](self, "allowsWriting");
  v12 = CFSTR("R/O");
  if (v11)
    v12 = CFSTR("R/W");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p; name = \"%@\"; business = %@; shared = %@; owner = %@; access = %@>"),
    v7,
    self,
    v8,
    v10,
    v9,
    v5,
    v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[ENNotebook guid](self, "guid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "guid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ENNotebook guid](self, "guid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)setIsShared:(BOOL)a3
{
  self->_isShared = a3;
}

- (EDAMNotebook)notebook
{
  return self->_notebook;
}

- (void)setNotebook:(id)a3
{
  objc_storeStrong((id *)&self->_notebook, a3);
}

- (EDAMLinkedNotebook)linkedNotebook
{
  return self->_linkedNotebook;
}

- (void)setLinkedNotebook:(id)a3
{
  objc_storeStrong((id *)&self->_linkedNotebook, a3);
}

- (EDAMSharedNotebook)sharedNotebook
{
  return self->_sharedNotebook;
}

- (void)setSharedNotebook:(id)a3
{
  objc_storeStrong((id *)&self->_sharedNotebook, a3);
}

- (BOOL)isDefaultNotebookOverride
{
  return self->_isDefaultNotebookOverride;
}

- (void)setIsDefaultNotebookOverride:(BOOL)a3
{
  self->_isDefaultNotebookOverride = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedNotebook, 0);
  objc_storeStrong((id *)&self->_linkedNotebook, 0);
  objc_storeStrong((id *)&self->_notebook, 0);
}

@end
