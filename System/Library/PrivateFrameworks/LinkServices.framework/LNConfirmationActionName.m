@implementation LNConfirmationActionName

- (LNConfirmationActionName)initWithType:(int64_t)a3 destructive:(BOOL)a4
{
  return -[LNConfirmationActionName initWithType:destructive:acceptLabel:acceptAlternatives:denyLabel:denyAlternatives:](self, "initWithType:destructive:acceptLabel:acceptAlternatives:denyLabel:denyAlternatives:", a3, a4, 0, MEMORY[0x1E0C9AA60], 0, MEMORY[0x1E0C9AA60]);
}

- (LNConfirmationActionName)initWithType:(int64_t)a3 destructive:(BOOL)a4 acceptLabel:(id)a5 acceptAlternatives:(id)a6 denyLabel:(id)a7 denyAlternatives:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  LNConfirmationActionName *v20;
  LNConfirmationActionName *v21;
  uint64_t v22;
  LNStaticDeferredLocalizedString *acceptLabel;
  uint64_t v24;
  NSArray *acceptAlternatives;
  uint64_t v26;
  LNStaticDeferredLocalizedString *denyLabel;
  uint64_t v28;
  NSArray *denyAlternatives;
  LNConfirmationActionName *v30;
  void *v32;
  void *v33;
  objc_super v34;

  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = v18;
  if (v16)
  {
    if (v18)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNConfirmationActionName.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("acceptAlternatives"));

    if (v19)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNConfirmationActionName.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("denyAlternatives"));

LABEL_3:
  v34.receiver = self;
  v34.super_class = (Class)LNConfirmationActionName;
  v20 = -[LNConfirmationActionName init](&v34, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_type = a3;
    v20->_destructive = a4;
    v22 = objc_msgSend(v15, "copy");
    acceptLabel = v21->_acceptLabel;
    v21->_acceptLabel = (LNStaticDeferredLocalizedString *)v22;

    v24 = objc_msgSend(v16, "copy");
    acceptAlternatives = v21->_acceptAlternatives;
    v21->_acceptAlternatives = (NSArray *)v24;

    v26 = objc_msgSend(v17, "copy");
    denyLabel = v21->_denyLabel;
    v21->_denyLabel = (LNStaticDeferredLocalizedString *)v26;

    v28 = objc_msgSend(v19, "copy");
    denyAlternatives = v21->_denyAlternatives;
    v21->_denyAlternatives = (NSArray *)v28;

    v30 = v21;
  }

  return v21;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  int64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LNConfirmationActionName type](self, "type");
  if (-[LNConfirmationActionName destructive](self, "destructive"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  -[LNConfirmationActionName acceptLabel](self, "acceptLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNConfirmationActionName acceptAlternatives](self, "acceptAlternatives");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNConfirmationActionName denyLabel](self, "denyLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNConfirmationActionName denyAlternatives](self, "denyAlternatives");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, type: %ld, destructive: %@, acceptLabel: %@, acceptAlternatives: %@, denyLabel: %@, denyAlternatives: %@>"), v5, self, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (LNConfirmationActionName)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  LNConfirmationActionName *v17;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("destructive"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("acceptLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("acceptAlternatives"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("denyLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("denyAlternatives"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  if (v11 && v16)
  {
    self = -[LNConfirmationActionName initWithType:destructive:acceptLabel:acceptAlternatives:denyLabel:denyAlternatives:](self, "initWithType:destructive:acceptLabel:acceptAlternatives:denyLabel:denyAlternatives:", v5, v6, v7, v11, v12, v16);
    v17 = self;
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNConfirmationActionName type](self, "type"), CFSTR("type"));
  objc_msgSend(v4, "encodeBool:forKey:", -[LNConfirmationActionName destructive](self, "destructive"), CFSTR("destructive"));
  -[LNConfirmationActionName acceptLabel](self, "acceptLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("acceptLabel"));

  -[LNConfirmationActionName acceptAlternatives](self, "acceptAlternatives");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("acceptAlternatives"));

  -[LNConfirmationActionName denyLabel](self, "denyLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("denyLabel"));

  -[LNConfirmationActionName denyAlternatives](self, "denyAlternatives");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("denyAlternatives"));

}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)destructive
{
  return self->_destructive;
}

- (LNStaticDeferredLocalizedString)acceptLabel
{
  return self->_acceptLabel;
}

- (NSArray)acceptAlternatives
{
  return self->_acceptAlternatives;
}

- (LNStaticDeferredLocalizedString)denyLabel
{
  return self->_denyLabel;
}

- (NSArray)denyAlternatives
{
  return self->_denyAlternatives;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denyAlternatives, 0);
  objc_storeStrong((id *)&self->_denyLabel, 0);
  objc_storeStrong((id *)&self->_acceptAlternatives, 0);
  objc_storeStrong((id *)&self->_acceptLabel, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
