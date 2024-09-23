@implementation WFEvernoteNotebook

- (WFEvernoteNotebook)initWithGUID:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  WFEvernoteNotebook *v8;
  uint64_t v9;
  NSString *guid;
  uint64_t v11;
  NSString *name;
  WFEvernoteNotebook *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFEvernoteNotebook;
  v8 = -[WFEvernoteNotebook init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    guid = v8->_guid;
    v8->_guid = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (WFEvernoteNotebook)initWithNotebook:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  WFEvernoteNotebook *v8;

  v4 = a3;
  objc_msgSend(v4, "notebook");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "guid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[WFEvernoteNotebook initWithGUID:name:](self, "initWithGUID:name:", v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFEvernoteNotebook guid](self, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("guid"));

  -[WFEvernoteNotebook name](self, "name");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("name"));

}

- (WFEvernoteNotebook)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  WFEvernoteNotebook *v11;

  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("guid")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("guid"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("notebook")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notebook"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "guid");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v5 = (void *)v7;

    goto LABEL_9;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("sharedNotebook")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharedNotebook"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notebookGuid");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v5 = 0;
LABEL_9:
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("name")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("notebook")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notebook"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "name");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("linkedNotebook")))
      {
        v8 = 0;
        goto LABEL_17;
      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("linkedNotebook"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shareName");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v10;

  }
LABEL_17:
  v11 = -[WFEvernoteNotebook initWithGUID:name:](self, "initWithGUID:name:", v5, v8);

  return v11;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

+ (void)initialize
{
  void *v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  id v17;

  if ((id)objc_opt_class() == a1)
  {
    +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_class();
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setClass:forCachedClassName:", v3, v5);

    +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClass:forCachedClassName:", v7, v9);

    +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClass:forCachedClassName:", v11, v13);

    +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_class();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setClass:forCachedClassName:", v14, v16);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
