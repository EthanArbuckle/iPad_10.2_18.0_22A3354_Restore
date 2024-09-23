@implementation ACDataclassAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)actionWithType:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:destructivity:affectedContainers:", a3, 0, 0);
}

+ (id)destructiveActionWithType:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:destructivity:affectedContainers:", a3, 1, 0);
}

+ (id)destructiveActionWithType:(int64_t)a3 affectedContainers:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:destructivity:affectedContainers:", a3, 1, v6);

  return v7;
}

+ (id)_actionForError:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:destructivity:affectedContainers:", 0, 1, 0);
}

- (ACDataclassAction)initWithType:(int64_t)a3 destructivity:(BOOL)a4 affectedContainers:(id)a5
{
  id v9;
  ACDataclassAction *v10;
  ACDataclassAction *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ACDataclassAction;
  v10 = -[ACDataclassAction init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v10->_isDestructive = a4;
    objc_storeStrong((id *)&v10->_affectedContainers, a5);
  }

  return v11;
}

- (ACDataclassAction)initWithCoder:(id)a3
{
  id v4;
  ACDataclassAction *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *affectedContainers;
  uint64_t v13;
  NSString *undoAlertTitle;
  uint64_t v15;
  NSString *undoAlertMessage;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ACDataclassAction;
  v5 = -[ACDataclassAction init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v6, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destructive"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isDestructive = objc_msgSend(v7, "BOOLValue");

    v8 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("affectedContainers"));
    v11 = objc_claimAutoreleasedReturnValue();
    affectedContainers = v5->_affectedContainers;
    v5->_affectedContainers = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alertReasonTitle"));
    v13 = objc_claimAutoreleasedReturnValue();
    undoAlertTitle = v5->_undoAlertTitle;
    v5->_undoAlertTitle = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alertReasonMessage"));
    v15 = objc_claimAutoreleasedReturnValue();
    undoAlertMessage = v5->_undoAlertMessage;
    v5->_undoAlertMessage = (NSString *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  NSString *undoAlertTitle;
  NSString *undoAlertMessage;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDestructive);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("destructive"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_affectedContainers, CFSTR("affectedContainers"));
  undoAlertTitle = self->_undoAlertTitle;
  if (undoAlertTitle)
    objc_msgSend(v8, "encodeObject:forKey:", undoAlertTitle, CFSTR("alertReasonTitle"));
  undoAlertMessage = self->_undoAlertMessage;
  if (undoAlertMessage)
    objc_msgSend(v8, "encodeObject:forKey:", undoAlertMessage, CFSTR("alertReasonMessage"));

}

- (id)_initWithProtobuf:(id)a3
{
  id v4;
  ACDataclassAction *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSArray *affectedContainers;
  void *v10;
  uint64_t v11;
  NSString *undoAlertTitle;
  void *v13;
  uint64_t v14;
  NSString *undoAlertMessage;
  ACDataclassAction *v16;

  v4 = a3;
  v5 = -[ACDataclassAction init](self, "init");
  if (v5)
  {
    v6 = v4;
    v5->_type = (int)objc_msgSend(v6, "type");
    v5->_isDestructive = objc_msgSend(v6, "destructive");
    objc_msgSend(v6, "affectedContainers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    affectedContainers = v5->_affectedContainers;
    v5->_affectedContainers = (NSArray *)v8;

    objc_msgSend(v6, "undoAlertTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    undoAlertTitle = v5->_undoAlertTitle;
    v5->_undoAlertTitle = (NSString *)v11;

    objc_msgSend(v6, "undoAlertMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "copy");
    undoAlertMessage = v5->_undoAlertMessage;
    v5->_undoAlertMessage = (NSString *)v14;

    v16 = v5;
  }

  return v5;
}

- (id)_initWithProtobufData:(id)a3
{
  id v5;
  ACProtobufDataclassAction *v6;
  ACDataclassAction *v7;
  void *v9;

  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDataclassAction.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data.length != 0"));

  }
  if (objc_msgSend(v5, "length"))
  {
    v6 = -[ACProtobufDataclassAction initWithData:]([ACProtobufDataclassAction alloc], "initWithData:", v5);
    if (v6)
    {
      self = (ACDataclassAction *)-[ACDataclassAction _initWithProtobuf:](self, "_initWithProtobuf:", v6);
      v7 = self;
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

- (id)_encodeProtobuf
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setType:", LODWORD(self->_type));
  objc_msgSend(v3, "setDestructive:", self->_isDestructive);
  v4 = (void *)-[NSArray mutableCopy](self->_affectedContainers, "mutableCopy");
  objc_msgSend(v3, "setAffectedContainers:", v4);

  v5 = (void *)-[NSString copy](self->_undoAlertTitle, "copy");
  objc_msgSend(v3, "setUndoAlertTitle:", v5);

  v6 = (void *)-[NSString copy](self->_undoAlertMessage, "copy");
  objc_msgSend(v3, "setUndoAlertMessage:", v6);

  return v3;
}

- (id)_encodeProtobufData
{
  void *v2;
  void *v3;

  -[ACDataclassAction _encodeProtobuf](self, "_encodeProtobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)description
{
  unint64_t v2;

  v2 = -[ACDataclassAction type](self, "type");
  if (v2 > 8)
    return (NSString *)CFSTR("Unknown ACDataclassAction");
  else
    return (NSString *)off_1E4894708[v2];
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  int64_t v6;
  NSArray *affectedContainers;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[ACDataclassAction type](self, "type");
    v8 = 0;
    if (v6 == objc_msgSend(v5, "type"))
    {
      affectedContainers = self->_affectedContainers;
      if (affectedContainers == (NSArray *)v5[3] || -[NSArray isEqual:](affectedContainers, "isEqual:"))
        v8 = 1;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_type;
}

- (BOOL)_isError
{
  return !self->_type && self->_isDestructive;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)isDestructive
{
  return self->_isDestructive;
}

- (NSArray)affectedContainers
{
  return self->_affectedContainers;
}

- (NSString)undoAlertTitle
{
  return self->_undoAlertTitle;
}

- (void)setUndoAlertTitle:(id)a3
{
  objc_storeStrong((id *)&self->_undoAlertTitle, a3);
}

- (NSString)undoAlertMessage
{
  return self->_undoAlertMessage;
}

- (void)setUndoAlertMessage:(id)a3
{
  objc_storeStrong((id *)&self->_undoAlertMessage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoAlertMessage, 0);
  objc_storeStrong((id *)&self->_undoAlertTitle, 0);
  objc_storeStrong((id *)&self->_affectedContainers, 0);
}

@end
