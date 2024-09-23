@implementation SGObject

- (SGObject)initWithRecordId:(id)a3 origin:(id)a4
{
  id v7;
  id v8;
  SGObject *v9;
  uint64_t v10;
  SGRecordId *recordId;
  uint64_t v12;
  SGOrigin *origin;
  void *v15;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SGObject;
  v9 = -[SGObject init](&v17, sel_init);
  if (v9)
  {
    if (v7)
    {
      if (v8)
      {
LABEL_4:
        v10 = objc_msgSend(v7, "copy");
        recordId = v9->_recordId;
        v9->_recordId = (SGRecordId *)v10;

        v12 = objc_msgSend(v8, "copy");
        origin = v9->_origin;
        v9->_origin = (SGOrigin *)v12;

        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("SGObject.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));

      if (v8)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("SGObject.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("origin"));

    goto LABEL_4;
  }
LABEL_5:

  return v9;
}

- (SGObject)initWithCoder:(id)a3
{
  id v5;
  SGObject *v6;
  void *v7;
  void *v8;
  SGRecordId *v9;
  void *recordId;
  void *v11;
  void *v12;
  SGOrigin *v13;
  void *origin;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SGObject;
  v6 = -[SGObject init](&v16, sel_init);
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("recordId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v8;
      recordId = v6->_recordId;
      v6->_recordId = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      recordId = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(recordId, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGObject.m"), 34, CFSTR("nonnull property %s *%s was null when decoded"), "SGRecordId", "recordId");
    }

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("origin"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = v12;
      origin = v6->_origin;
      v6->_origin = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      origin = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(origin, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGObject.m"), 35, CFSTR("nonnull property %s *%s was null when decoded"), "SGOrigin", "origin");
    }

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  SGRecordId *recordId;
  id v5;

  recordId = self->_recordId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", recordId, CFSTR("recordId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_origin, CFSTR("origin"));

}

- (BOOL)isEqual:(id)a3
{
  SGObject *v4;
  SGObject *v5;
  BOOL v6;

  v4 = (SGObject *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGObject isEqualToSuggestion:](self, "isEqualToSuggestion:", v5);

  return v6;
}

- (BOOL)isEqualToSuggestion:(id)a3
{
  id *v4;
  SGRecordId *recordId;
  SGRecordId *v6;
  SGRecordId *v7;
  SGRecordId *v8;
  BOOL v9;
  char v10;
  SGOrigin *v11;
  SGOrigin *v12;

  v4 = (id *)a3;
  recordId = self->_recordId;
  v6 = (SGRecordId *)v4[1];
  if (recordId == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = recordId;
    v9 = -[SGRecordId isEqual:](v8, "isEqual:", v7);

    if (!v9)
    {
      v10 = 0;
      goto LABEL_9;
    }
  }
  v11 = self->_origin;
  v12 = v11;
  if (v11 == v4[2])
    v10 = 1;
  else
    v10 = -[SGOrigin isEqual:](v11, "isEqual:");

LABEL_9:
  return v10;
}

- (unint64_t)hash
{
  return -[SGRecordId hash](self->_recordId, "hash");
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[SGObject\n  recordId:%@\n  origin:%@\n]"), self->_recordId, self->_origin);
}

- (SGRecordId)recordId
{
  return self->_recordId;
}

- (SGOrigin)origin
{
  return self->_origin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_recordId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
