@implementation HKMedicationInteractionResult

- (HKMedicationInteractionResult)init
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

- (HKMedicationInteractionResult)initWithFirstConceptIdentifier:(id)a3 secondConceptIdentifier:(id)a4 interactionType:(unint64_t)a5 interactions:(id)a6
{
  id v11;
  id v12;
  id v13;
  HKMedicationInteractionResult *v14;
  uint64_t v15;
  HKConceptIdentifier *firstIdentifier;
  uint64_t v17;
  HKConceptIdentifier *secondIdentifier;
  uint64_t v19;
  NSSet *interactions;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicationInteractionResult.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("secondIdentifier != nil"));

    if (v13)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicationInteractionResult.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("firstIdentifier != nil"));

  if (!v12)
    goto LABEL_8;
LABEL_3:
  if (v13)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicationInteractionResult.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interactions != nil"));

LABEL_4:
  v25.receiver = self;
  v25.super_class = (Class)HKMedicationInteractionResult;
  v14 = -[HKMedicationInteractionResult init](&v25, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v11, "copy");
    firstIdentifier = v14->_firstIdentifier;
    v14->_firstIdentifier = (HKConceptIdentifier *)v15;

    v17 = objc_msgSend(v12, "copy");
    secondIdentifier = v14->_secondIdentifier;
    v14->_secondIdentifier = (HKConceptIdentifier *)v17;

    v14->_interactionType = a5;
    v19 = objc_msgSend(v13, "copy");
    interactions = v14->_interactions;
    v14->_interactions = (NSSet *)v19;

  }
  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t interactionType;

  v3 = -[HKConceptIdentifier hash](self->_firstIdentifier, "hash");
  v4 = -[HKConceptIdentifier hash](self->_secondIdentifier, "hash") ^ v3;
  interactionType = self->_interactionType;
  return v4 ^ interactionType ^ -[NSSet hash](self->_interactions, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HKMedicationInteractionResult *v4;
  HKMedicationInteractionResult *v5;
  NSSet *interactions;
  NSSet *v7;
  char v8;

  v4 = (HKMedicationInteractionResult *)a3;
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
      if (!-[HKDrugInteractionResult hasEquivalentFirstInteractionClass:secondInteractionClass:]((uint64_t)self, v5->_firstIdentifier, v5->_secondIdentifier)|| self->_interactionType != v5->_interactionType)
      {
        goto LABEL_10;
      }
      interactions = self->_interactions;
      v7 = v5->_interactions;
      if (interactions == v7)
      {
        v8 = 1;
        goto LABEL_11;
      }
      if (v7)
        v8 = -[NSSet isEqualToSet:](interactions, "isEqualToSet:");
      else
LABEL_10:
        v8 = 0;
LABEL_11:

      goto LABEL_12;
    }
    v8 = 0;
  }
LABEL_12:

  return v8;
}

- (id)conceptIdentifiers
{
  HKConceptIdentifier *secondIdentifier;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  secondIdentifier = self->_secondIdentifier;
  v4[0] = self->_firstIdentifier;
  v4[1] = secondIdentifier;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  void *v3;
  uint64_t v4;
  HKConceptIdentifier *firstIdentifier;
  HKConceptIdentifier *secondIdentifier;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  firstIdentifier = self->_firstIdentifier;
  secondIdentifier = self->_secondIdentifier;
  HKStringFromDrugInteractionType(self->_interactionType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSet allObjects](self->_interactions, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p\nfirst concept identifier: %@,\nsecondc concept identifier: %@,\ninteractionType:%@,\ninteractions:[%@]>"), v4, self, firstIdentifier, secondIdentifier, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKConceptIdentifier *firstIdentifier;
  id v5;

  firstIdentifier = self->_firstIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", firstIdentifier, CFSTR("FirstIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondIdentifier, CFSTR("SecondIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_interactionType, CFSTR("InteractionType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interactions, CFSTR("Interactions"));

}

- (HKMedicationInteractionResult)initWithCoder:(id)a3
{
  id v5;
  HKMedicationInteractionResult *v6;
  uint64_t v7;
  HKConceptIdentifier *firstIdentifier;
  uint64_t v9;
  HKConceptIdentifier *secondIdentifier;
  void *v11;
  uint64_t v12;
  NSSet *interactions;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKMedicationInteractionResult;
  v6 = -[HKMedicationInteractionResult init](&v18, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FirstIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    firstIdentifier = v6->_firstIdentifier;
    v6->_firstIdentifier = (HKConceptIdentifier *)v7;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SecondIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    secondIdentifier = v6->_secondIdentifier;
    v6->_secondIdentifier = (HKConceptIdentifier *)v9;

    v6->_interactionType = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("InteractionType"));
    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForSetOf:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("Interactions"));
    v12 = objc_claimAutoreleasedReturnValue();
    interactions = v6->_interactions;
    v6->_interactions = (NSSet *)v12;

    if (!v6->_firstIdentifier)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("HKMedicationInteractionResult.m"), 139, CFSTR("First concept identifier should not be nil"));

    }
    if (!v6->_secondIdentifier)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("HKMedicationInteractionResult.m"), 140, CFSTR("Second concept identifier should not be nil"));

    }
    if (!v6->_interactions)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("HKMedicationInteractionResult.m"), 141, CFSTR("Interactions should not be nil"));

    }
  }

  return v6;
}

- (HKConceptIdentifier)firstIdentifier
{
  return self->_firstIdentifier;
}

- (HKConceptIdentifier)secondIdentifier
{
  return self->_secondIdentifier;
}

- (unint64_t)interactionType
{
  return self->_interactionType;
}

- (NSSet)interactions
{
  return self->_interactions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_storeStrong((id *)&self->_secondIdentifier, 0);
  objc_storeStrong((id *)&self->_firstIdentifier, 0);
}

@end
