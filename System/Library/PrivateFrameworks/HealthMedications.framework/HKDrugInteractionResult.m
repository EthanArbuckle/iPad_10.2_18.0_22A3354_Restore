@implementation HKDrugInteractionResult

- (HKDrugInteractionResult)init
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

- (HKDrugInteractionResult)initWithFirstInteractionClass:(id)a3 secondInteractionClass:(id)a4 severity:(id)a5 educationContent:(id)a6 ontologyIdentifier:(id)a7 validRegionCodes:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  HKDrugInteractionResult *v21;
  uint64_t v22;
  HKDrugInteractionClass *firstInteractionClass;
  uint64_t v24;
  HKDrugInteractionClass *secondInteractionClass;
  uint64_t v26;
  HKDrugInteractionSeverity *severity;
  uint64_t v28;
  HKOntologyLocalizedEducationContent *educationContent;
  uint64_t v30;
  HKConceptIdentifier *identifier;
  uint64_t v32;
  NSSet *validRegionCodes;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDrugInteractionResult.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("firstInteractionClass != nil"));

    if (v16)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDrugInteractionResult.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("secondInteractionClass != nil"));

LABEL_3:
  if (!objc_msgSend(v15, "isEqual:", v16))
  {
    if (v17)
      goto LABEL_5;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDrugInteractionResult.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("severity != nil"));

    if (v19)
      goto LABEL_6;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDrugInteractionResult.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("! [firstInteractionClass isEqual:secondInteractionClass]"));

  if (!v17)
    goto LABEL_12;
LABEL_5:
  if (v19)
    goto LABEL_6;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDrugInteractionResult.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

LABEL_6:
  v40.receiver = self;
  v40.super_class = (Class)HKDrugInteractionResult;
  v21 = -[HKDrugInteractionResult init](&v40, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v15, "copy");
    firstInteractionClass = v21->_firstInteractionClass;
    v21->_firstInteractionClass = (HKDrugInteractionClass *)v22;

    v24 = objc_msgSend(v16, "copy");
    secondInteractionClass = v21->_secondInteractionClass;
    v21->_secondInteractionClass = (HKDrugInteractionClass *)v24;

    v26 = objc_msgSend(v17, "copy");
    severity = v21->_severity;
    v21->_severity = (HKDrugInteractionSeverity *)v26;

    v28 = objc_msgSend(v18, "copy");
    educationContent = v21->_educationContent;
    v21->_educationContent = (HKOntologyLocalizedEducationContent *)v28;

    v30 = objc_msgSend(v19, "copy");
    identifier = v21->_identifier;
    v21->_identifier = (HKConceptIdentifier *)v30;

    v32 = objc_msgSend(v20, "copy");
    validRegionCodes = v21->_validRegionCodes;
    v21->_validRegionCodes = (NSSet *)v32;

  }
  return v21;
}

- (NSString)uniqueIdentifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[HKConceptIdentifier rawIdentifier](self->_identifier, "rawIdentifier");
  -[HKDrugInteractionClass uniqueIdentifier](self->_firstInteractionClass, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDrugInteractionClass uniqueIdentifier](self->_secondInteractionClass, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%ld_%@_%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  HKDrugInteractionSeverity *severity;
  void *v6;
  HKConceptIdentifier *identifier;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v12 = *(_OWORD *)&self->_firstInteractionClass;
  severity = self->_severity;
  HKStringFromBool();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  -[NSSet allObjects](self->_validRegionCodes, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p\nfirst interaction class: %@,\nsecond interaction class: %@,\nseverity: %@,\neducationPresent: %@,\nontologyIdentifier: %@,\nvalidRegionCodes:[%@]>"), v4, self, v12, severity, v6, identifier, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)interactionClasses
{
  HKDrugInteractionClass *secondInteractionClass;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  secondInteractionClass = self->_secondInteractionClass;
  v4[0] = self->_firstInteractionClass;
  v4[1] = secondInteractionClass;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)hasSameAncestorIdentifiersAsInteractionResult:(id)a3
{
  HKDrugInteractionResult *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3 == self)
    return 1;
  v3 = self;
  v4 = a3;
  objc_msgSend(v4, "firstInteractionClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ancestorIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondInteractionClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "ancestorIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[HKDrugInteractionResult hasEquivalentFirstAncestorIdentifier:secondAncestorIdentifier:]((uint64_t)v3, v6, v8);

  return (char)v3;
}

- (uint64_t)hasEquivalentFirstAncestorIdentifier:(void *)a3 secondAncestorIdentifier:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  id v11;
  void *v12;
  int v13;
  int v14;
  id v15;
  void *v16;
  int v17;
  int v18;
  id v19;
  void *v20;
  int v21;
  int v22;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "ancestorIdentifier");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7 == v5)
    {
      v10 = 0;
    }
    else if (v5)
    {
      objc_msgSend(*(id *)(a1 + 8), "ancestorIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqual:", v5);

      v10 = v9 ^ 1;
    }
    else
    {
      v10 = 1;
    }

    objc_msgSend(*(id *)(a1 + 16), "ancestorIdentifier");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 == v6)
    {
      v14 = 0;
    }
    else if (v6)
    {
      objc_msgSend(*(id *)(a1 + 16), "ancestorIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqual:", v6);

      v14 = v13 ^ 1;
    }
    else
    {
      v14 = 1;
    }

    objc_msgSend(*(id *)(a1 + 8), "ancestorIdentifier");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15 == v6)
    {
      v18 = 0;
    }
    else if (v6)
    {
      objc_msgSend(*(id *)(a1 + 8), "ancestorIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqual:", v6);

      v18 = v17 ^ 1;
    }
    else
    {
      v18 = 1;
    }

    objc_msgSend(*(id *)(a1 + 16), "ancestorIdentifier");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (v19 == v5)
    {
      v22 = 0;
    }
    else if (v5)
    {
      objc_msgSend(*(id *)(a1 + 16), "ancestorIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqual:", v5);

      v22 = v21 ^ 1;
    }
    else
    {
      v22 = 1;
    }

    a1 = (v10 | v14) & (v18 | v22) ^ 1u;
  }

  return a1;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[HKDrugInteractionClass hash](self->_firstInteractionClass, "hash");
  v4 = -[HKDrugInteractionClass hash](self->_secondInteractionClass, "hash") ^ v3;
  return v4 ^ -[HKConceptIdentifier hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HKDrugInteractionResult *v4;
  HKDrugInteractionResult *v5;
  HKConceptIdentifier *identifier;
  HKConceptIdentifier *v7;
  char v8;

  v4 = (HKDrugInteractionResult *)a3;
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
      if (!-[HKDrugInteractionResult hasEquivalentFirstInteractionClass:secondInteractionClass:]((uint64_t)self, v5->_firstInteractionClass, v5->_secondInteractionClass))goto LABEL_9;
      identifier = self->_identifier;
      v7 = v5->_identifier;
      if (identifier == v7)
      {
        v8 = 1;
        goto LABEL_11;
      }
      if (v7)
        v8 = -[HKConceptIdentifier isEqual:](identifier, "isEqual:");
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

- (uint64_t)hasEquivalentFirstInteractionClass:(void *)a3 secondInteractionClass:
{
  id v5;
  id v6;
  id v7;
  int v8;
  id v9;
  int v10;
  id v11;
  int v12;
  id v13;
  int v14;

  v5 = a2;
  v6 = a3;
  if (!a1)
    goto LABEL_23;
  v7 = *(id *)(a1 + 8);
  if (v7 == v5)
  {
    v8 = 0;
  }
  else if (v5)
  {
    v8 = objc_msgSend(v7, "isEqual:", v5) ^ 1;
  }
  else
  {
    v8 = 1;
  }
  v9 = *(id *)(a1 + 16);
  if (v9 == v6)
  {
    v10 = 1;
  }
  else
  {
    if (!v6)
    {
      v10 = 0;
      v12 = *(_QWORD *)(a1 + 8) == 0;
      goto LABEL_17;
    }
    v10 = objc_msgSend(v9, "isEqual:", v6);
  }
  v11 = *(id *)(a1 + 8);
  if (v11 == v6)
  {
    v12 = 1;
  }
  else if (v6)
  {
    v12 = objc_msgSend(v11, "isEqual:", v6);
  }
  else
  {
    v12 = 0;
  }
LABEL_17:
  v13 = *(id *)(a1 + 16);
  if (v13 == v5)
  {
    v14 = 0;
  }
  else if (v5)
  {
    v14 = objc_msgSend(v13, "isEqual:", v5) ^ 1;
  }
  else
  {
    v14 = 1;
  }
  a1 = (v8 | ~v10) & (v12 ^ 1 | v14) ^ 1u;
LABEL_23:

  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKDrugInteractionClass *firstInteractionClass;
  id v5;

  firstInteractionClass = self->_firstInteractionClass;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", firstInteractionClass, CFSTR("FirstInteractionClass"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondInteractionClass, CFSTR("SecondInteractionClass"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_severity, CFSTR("Severity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_educationContent, CFSTR("EducationContent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("OntologyIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_validRegionCodes, CFSTR("ValidRegionCodes"));

}

- (HKDrugInteractionResult)initWithCoder:(id)a3
{
  id v5;
  HKDrugInteractionResult *v6;
  uint64_t v7;
  HKDrugInteractionClass *firstInteractionClass;
  uint64_t v9;
  HKDrugInteractionClass *secondInteractionClass;
  uint64_t v11;
  HKDrugInteractionSeverity *severity;
  uint64_t v13;
  HKOntologyLocalizedEducationContent *educationContent;
  uint64_t v15;
  HKConceptIdentifier *identifier;
  void *v17;
  uint64_t v18;
  NSSet *validRegionCodes;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HKDrugInteractionResult;
  v6 = -[HKDrugInteractionResult init](&v24, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FirstInteractionClass"));
    v7 = objc_claimAutoreleasedReturnValue();
    firstInteractionClass = v6->_firstInteractionClass;
    v6->_firstInteractionClass = (HKDrugInteractionClass *)v7;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SecondInteractionClass"));
    v9 = objc_claimAutoreleasedReturnValue();
    secondInteractionClass = v6->_secondInteractionClass;
    v6->_secondInteractionClass = (HKDrugInteractionClass *)v9;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Severity"));
    v11 = objc_claimAutoreleasedReturnValue();
    severity = v6->_severity;
    v6->_severity = (HKDrugInteractionSeverity *)v11;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EducationContent"));
    v13 = objc_claimAutoreleasedReturnValue();
    educationContent = v6->_educationContent;
    v6->_educationContent = (HKOntologyLocalizedEducationContent *)v13;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OntologyIdentifier"));
    v15 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (HKConceptIdentifier *)v15;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForSetOf:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v17, CFSTR("ValidRegionCodes"));
    v18 = objc_claimAutoreleasedReturnValue();
    validRegionCodes = v6->_validRegionCodes;
    v6->_validRegionCodes = (NSSet *)v18;

    if (!v6->_firstInteractionClass)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("HKDrugInteractionResult.m"), 178, CFSTR("First interaction class should not be nil"));

    }
    if (!v6->_secondInteractionClass)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("HKDrugInteractionResult.m"), 179, CFSTR("Second interaction class should not be nil"));

    }
    if (!v6->_identifier)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("HKDrugInteractionResult.m"), 180, CFSTR("Identifier should not be nil"));

    }
  }

  return v6;
}

- (HKDrugInteractionClass)firstInteractionClass
{
  return self->_firstInteractionClass;
}

- (HKDrugInteractionClass)secondInteractionClass
{
  return self->_secondInteractionClass;
}

- (HKDrugInteractionSeverity)severity
{
  return self->_severity;
}

- (HKOntologyLocalizedEducationContent)educationContent
{
  return self->_educationContent;
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
  objc_storeStrong((id *)&self->_educationContent, 0);
  objc_storeStrong((id *)&self->_severity, 0);
  objc_storeStrong((id *)&self->_secondInteractionClass, 0);
  objc_storeStrong((id *)&self->_firstInteractionClass, 0);
}

@end
