@implementation HKDrugInteractionClass

- (HKDrugInteractionClass)init
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

- (HKDrugInteractionClass)initWithName:(id)a3 relationshipCount:(unint64_t)a4 ancestorIdentifier:(id)a5 ontologyIdentifier:(id)a6 validRegionCodes:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HKDrugInteractionClass *v17;
  uint64_t v18;
  NSString *name;
  uint64_t v20;
  HKConceptIdentifier *ancestorIdentifier;
  uint64_t v22;
  HKConceptIdentifier *identifier;
  uint64_t v24;
  NSSet *validRegionCodes;
  void *v27;
  void *v28;
  objc_super v29;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDrugInteractionClass.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ancestorIdentifer"));

    if (v15)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDrugInteractionClass.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

LABEL_3:
  v29.receiver = self;
  v29.super_class = (Class)HKDrugInteractionClass;
  v17 = -[HKDrugInteractionClass init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v13, "copy");
    name = v17->_name;
    v17->_name = (NSString *)v18;

    v17->_relationshipCount = a4;
    v20 = objc_msgSend(v14, "copy");
    ancestorIdentifier = v17->_ancestorIdentifier;
    v17->_ancestorIdentifier = (HKConceptIdentifier *)v20;

    v22 = objc_msgSend(v15, "copy");
    identifier = v17->_identifier;
    v17->_identifier = (HKConceptIdentifier *)v22;

    v24 = objc_msgSend(v16, "copy");
    validRegionCodes = v17->_validRegionCodes;
    v17->_validRegionCodes = (NSSet *)v24;

  }
  return v17;
}

- (NSString)uniqueIdentifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld_%ld"), -[HKConceptIdentifier rawIdentifier](self->_identifier, "rawIdentifier"), -[HKConceptIdentifier rawIdentifier](self->_ancestorIdentifier, "rawIdentifier"));
}

- (id)description
{
  void *v3;
  uint64_t v4;
  HKConceptIdentifier *ancestorIdentifier;
  HKConceptIdentifier *identifier;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v11 = *(_OWORD *)&self->_name;
  ancestorIdentifier = self->_ancestorIdentifier;
  identifier = self->_identifier;
  -[NSSet allObjects](self->_validRegionCodes, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p name:%@, relationship count:%ld, ancestorIdentifier: %@, ontologyIdentifier:%@, validRegionCodes:[%@]>"), v4, self, v11, ancestorIdentifier, identifier, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[HKConceptIdentifier hash](self->_ancestorIdentifier, "hash") ^ v3;
  v5 = v4 ^ -[HKConceptIdentifier hash](self->_identifier, "hash") ^ self->_relationshipCount;
  return v5 ^ -[NSSet hash](self->_validRegionCodes, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HKDrugInteractionClass *v4;
  HKDrugInteractionClass *v5;
  NSString *name;
  NSString *v7;
  HKConceptIdentifier *ancestorIdentifier;
  HKConceptIdentifier *v9;
  HKConceptIdentifier *identifier;
  HKConceptIdentifier *v11;
  NSSet *validRegionCodes;
  NSSet *v13;
  char v14;

  v4 = (HKDrugInteractionClass *)a3;
  if (v4 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      name = self->_name;
      v7 = v5->_name;
      if (name != v7 && (!v7 || !-[NSString isEqualToString:](name, "isEqualToString:")))
        goto LABEL_18;
      ancestorIdentifier = self->_ancestorIdentifier;
      v9 = v5->_ancestorIdentifier;
      if (ancestorIdentifier != v9
        && (!v9 || !-[HKConceptIdentifier isEqual:](ancestorIdentifier, "isEqual:")))
      {
        goto LABEL_18;
      }
      identifier = self->_identifier;
      v11 = v5->_identifier;
      if (identifier != v11 && (!v11 || !-[HKConceptIdentifier isEqual:](identifier, "isEqual:")))
        goto LABEL_18;
      if (self->_relationshipCount != v5->_relationshipCount)
        goto LABEL_18;
      validRegionCodes = self->_validRegionCodes;
      v13 = v5->_validRegionCodes;
      if (validRegionCodes == v13)
      {
        v14 = 1;
        goto LABEL_19;
      }
      if (v13)
        v14 = -[NSSet isEqualToSet:](validRegionCodes, "isEqualToSet:");
      else
LABEL_18:
        v14 = 0;
LABEL_19:

      goto LABEL_20;
    }
    v14 = 0;
  }
LABEL_20:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("Name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ancestorIdentifier, CFSTR("AncestorOntologyIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("OntologyIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_relationshipCount, CFSTR("RelationshipCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_validRegionCodes, CFSTR("ValidRegionCodes"));

}

- (HKDrugInteractionClass)initWithCoder:(id)a3
{
  id v5;
  HKDrugInteractionClass *v6;
  uint64_t v7;
  NSString *name;
  uint64_t v9;
  HKConceptIdentifier *ancestorIdentifier;
  uint64_t v11;
  HKConceptIdentifier *identifier;
  void *v13;
  uint64_t v14;
  NSSet *validRegionCodes;
  void *v17;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKDrugInteractionClass;
  v6 = -[HKDrugInteractionClass init](&v18, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Name"));
    v7 = objc_claimAutoreleasedReturnValue();
    name = v6->_name;
    v6->_name = (NSString *)v7;

    v6->_relationshipCount = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("RelationshipCount"));
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AncestorOntologyIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    ancestorIdentifier = v6->_ancestorIdentifier;
    v6->_ancestorIdentifier = (HKConceptIdentifier *)v9;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OntologyIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (HKConceptIdentifier *)v11;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForSetOf:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v13, CFSTR("ValidRegionCodes"));
    v14 = objc_claimAutoreleasedReturnValue();
    validRegionCodes = v6->_validRegionCodes;
    v6->_validRegionCodes = (NSSet *)v14;

    if (!v6->_identifier)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("HKDrugInteractionClass.m"), 116, CFSTR("Identifier should not be nil"));

    }
  }

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)relationshipCount
{
  return self->_relationshipCount;
}

- (HKConceptIdentifier)ancestorIdentifier
{
  return self->_ancestorIdentifier;
}

- (HKConceptIdentifier)identifier
{
  return self->_identifier;
}

- (NSSet)validRegionCodes
{
  return self->_validRegionCodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validRegionCodes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_ancestorIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
