@implementation HDDrugInteractionClass

- (HDDrugInteractionClass)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDDrugInteractionClass)initWithName:(id)a3 relationships:(id)a4 ancestorIdentifier:(id)a5 ontologyIdentifier:(id)a6 validRegionCodes:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  HDDrugInteractionClass *v18;
  uint64_t v19;
  NSArray *relationships;
  void *v22;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDrugInteractionClass.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("relationships != nil"));

  }
  v23.receiver = self;
  v23.super_class = (Class)HDDrugInteractionClass;
  v18 = -[HKDrugInteractionClass initWithName:relationshipCount:ancestorIdentifier:ontologyIdentifier:validRegionCodes:](&v23, sel_initWithName_relationshipCount_ancestorIdentifier_ontologyIdentifier_validRegionCodes_, v13, objc_msgSend(v14, "count"), v15, v16, v17);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    relationships = v18->_relationships;
    v18->_relationships = (NSArray *)v19;

  }
  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDDrugInteractionClass;
  v3 = -[HKDrugInteractionClass hash](&v5, sel_hash);
  return -[NSArray hash](self->_relationships, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  HDDrugInteractionClass *v4;
  HDDrugInteractionClass *v5;
  NSArray *relationships;
  NSArray *v7;
  char v8;
  objc_super v10;

  v4 = (HDDrugInteractionClass *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v10.receiver = self;
      v10.super_class = (Class)HDDrugInteractionClass;
      if (!-[HKDrugInteractionClass isEqual:](&v10, sel_isEqual_, v5))
        goto LABEL_9;
      relationships = self->_relationships;
      v7 = v5->_relationships;
      if (relationships == v7)
      {
        v8 = 1;
        goto LABEL_11;
      }
      if (v7)
        v8 = -[NSArray isEqualToArray:](relationships, "isEqualToArray:");
      else
LABEL_9:
        v8 = 0;
LABEL_11:

      goto LABEL_12;
    }
    v8 = 0;
  }
LABEL_12:

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HKDrugInteractionClass name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKDrugInteractionClass relationshipCount](self, "relationshipCount");
  -[HKDrugInteractionClass ancestorIdentifier](self, "ancestorIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDrugInteractionClass identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDrugInteractionClass validRegionCodes](self, "validRegionCodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p name:%@, relationship count:%ld, ancestorIdentifier: %@, ontologyIdentifier:%@, validRegionCodes:[%@]>"), v4, self, v5, v6, v7, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (HDDrugInteractionClass)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HDDrugInteractionClass;
  return -[HKDrugInteractionClass initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (Class)classForKeyedArchiver
{
  return (Class)objc_opt_class();
}

- (NSArray)relationships
{
  return self->_relationships;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationships, 0);
}

@end
