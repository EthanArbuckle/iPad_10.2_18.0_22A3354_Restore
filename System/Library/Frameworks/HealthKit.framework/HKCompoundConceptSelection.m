@implementation HKCompoundConceptSelection

- (HKCompoundConceptSelection)initWithSelections:(id)a3 operationType:(unint64_t)a4
{
  id v7;
  HKCompoundConceptSelection *v8;
  uint64_t v9;
  NSArray *selections;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCompoundConceptSelection.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selections"));

  }
  if (objc_msgSend(v7, "count"))
  {
    if (a4)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCompoundConceptSelection.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selections.count"));

    if (a4)
      goto LABEL_7;
  }
  if (objc_msgSend(v7, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCompoundConceptSelection.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selections.count == 1"));

  }
LABEL_7:
  v15.receiver = self;
  v15.super_class = (Class)HKCompoundConceptSelection;
  v8 = -[HKConceptSelection init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    selections = v8->_selections;
    v8->_selections = (NSArray *)v9;

    v8->_operationType = a4;
  }

  return v8;
}

- (id)description
{
  unint64_t operationType;
  void *v4;
  const __CFString *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  operationType = self->_operationType;
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (operationType)
    v5 = &stru_1E37FD4C0;
  else
    v5 = CFSTR("NOT ");
  if (operationType)
    v6 = self->_operationType;
  else
    v6 = 2;
  HKStringFromCompoundOperatorType(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR(" %@ "), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = objc_opt_class();
  -[NSArray componentsJoinedByString:](self->_selections, "componentsJoinedByString:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@: %@(%@)>"), v10, v5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKCompoundConceptSelection)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HKCompoundConceptSelection *v10;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("SelectionsKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("OperationTypeKey"));

  if (v8)
  {
    self = -[HKCompoundConceptSelection initWithSelections:operationType:](self, "initWithSelections:operationType:", v8, v9);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *selections;
  id v5;

  selections = self->_selections;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", selections, CFSTR("SelectionsKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_operationType, CFSTR("OperationTypeKey"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKCompoundConceptSelection;
  if (-[HKConceptSelection isEqual:](&v17, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = -[HKCompoundConceptSelection operationType](self, "operationType");
    if (v6 == objc_msgSend(v5, "operationType"))
    {
      -[HKCompoundConceptSelection selections](self, "selections");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "selections");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

        goto LABEL_9;
      }
      v9 = (void *)v8;
      objc_msgSend(v5, "selections");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        -[HKCompoundConceptSelection selections](self, "selections");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "selections");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqual:", v13);

        if ((v14 & 1) == 0)
          goto LABEL_11;
LABEL_9:
        v15 = 1;
LABEL_12:

        goto LABEL_13;
      }

    }
LABEL_11:
    v15 = 0;
    goto LABEL_12;
  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (NSArray)selections
{
  return self->_selections;
}

- (unint64_t)operationType
{
  return self->_operationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selections, 0);
}

@end
