@implementation LNUndoContext

- (LNUndoContext)initWithUndoToken:(id)a3 actionString:(id)a4
{
  id v7;
  id v8;
  LNUndoContext *v9;
  uint64_t v10;
  NSUUID *undoToken;
  uint64_t v12;
  NSString *actionString;
  LNUndoContext *v14;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNUndoContext.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("token"));

  }
  v17.receiver = self;
  v17.super_class = (Class)LNUndoContext;
  v9 = -[LNUndoContext init](&v17, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    undoToken = v9->_undoToken;
    v9->_undoToken = (NSUUID *)v10;

    v12 = objc_msgSend(v8, "copy");
    actionString = v9->_actionString;
    v9->_actionString = (NSString *)v12;

    v14 = v9;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  LNUndoContext *v4;
  LNUndoContext *v5;
  LNUndoContext *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v4 = (LNUndoContext *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[LNUndoContext undoToken](self, "undoToken");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNUndoContext undoToken](v6, "undoToken");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        v12 = 1;
      }
      else
      {
        v12 = 0;
        if (v9 && v10)
          v12 = objc_msgSend(v9, "isEqual:", v10);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNUndoContext undoToken](self, "undoToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("undoToken"));

  -[LNUndoContext actionString](self, "actionString");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("actionString"));

}

- (LNUndoContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  LNUndoContext *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("undoToken"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[LNUndoContext initWithUndoToken:actionString:](self, "initWithUndoToken:actionString:", v5, v6);
  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNUndoContext undoToken](self, "undoToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNUndoContext actionString](self, "actionString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@ action: %@"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSUUID)undoToken
{
  return self->_undoToken;
}

- (NSString)actionString
{
  return self->_actionString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionString, 0);
  objc_storeStrong((id *)&self->_undoToken, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
