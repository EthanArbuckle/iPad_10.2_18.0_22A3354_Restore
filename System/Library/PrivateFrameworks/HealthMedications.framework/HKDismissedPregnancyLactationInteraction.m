@implementation HKDismissedPregnancyLactationInteraction

- (HKDismissedPregnancyLactationInteraction)init
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

- (id)_initWithMedicationIdentifier:(id)a3 interactionType:(int64_t)a4 creationDate:(id)a5
{
  id v9;
  id v10;
  void *v11;
  HKDismissedPregnancyLactationInteraction *v12;
  uint64_t v13;
  HKConceptIdentifier *medicationIdentifier;
  void *v16;
  void *v17;
  objc_super v18;

  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDismissedPregnancyLactationInteraction.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interactionIdentifier != nil"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDismissedPregnancyLactationInteraction.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("creationDate != nil"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)HKDismissedPregnancyLactationInteraction;
  v12 = -[HKDismissedPregnancyLactationInteraction init](&v18, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    medicationIdentifier = v12->_medicationIdentifier;
    v12->_medicationIdentifier = (HKConceptIdentifier *)v13;

    v12->_interactionType = a4;
    objc_storeStrong((id *)&v12->_creationDate, a5);
  }

  return v12;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p (%ld, %ld, %@)>"), objc_opt_class(), self, -[HKConceptIdentifier rawIdentifier](self->_medicationIdentifier, "rawIdentifier"), self->_interactionType, self->_creationDate);
}

- (BOOL)isEquivalentToPregnancyLactationInteraction:(id)a3
{
  id v4;
  HKConceptIdentifier *medicationIdentifier;
  void *v6;
  HKConceptIdentifier *v7;
  void *v8;
  void *v9;
  HKConceptIdentifier *v10;
  void *v11;
  void *v12;
  int64_t v13;
  BOOL v14;
  int64_t interactionType;

  v4 = a3;
  medicationIdentifier = self->_medicationIdentifier;
  objc_msgSend(v4, "medication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstConceptIdentifier");
  v7 = (HKConceptIdentifier *)objc_claimAutoreleasedReturnValue();
  if (medicationIdentifier == v7)
  {
    interactionType = self->_interactionType;
    v14 = interactionType == objc_msgSend(v4, "interactionType");
  }
  else
  {
    objc_msgSend(v4, "medication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstConceptIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = self->_medicationIdentifier;
      objc_msgSend(v4, "medication");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstConceptIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[HKConceptIdentifier isEqual:](v10, "isEqual:", v12))
      {
        v13 = self->_interactionType;
        v14 = v13 == objc_msgSend(v4, "interactionType");
      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

- (unint64_t)hash
{
  return self->_interactionType ^ -[HKConceptIdentifier hash](self->_medicationIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HKDismissedPregnancyLactationInteraction *v4;
  HKDismissedPregnancyLactationInteraction *v5;
  HKConceptIdentifier *medicationIdentifier;
  HKConceptIdentifier *v7;
  BOOL v8;

  v4 = (HKDismissedPregnancyLactationInteraction *)a3;
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
      medicationIdentifier = self->_medicationIdentifier;
      v7 = v5->_medicationIdentifier;
      v8 = (medicationIdentifier == v7
         || v7 && -[HKConceptIdentifier isEqual:](medicationIdentifier, "isEqual:"))
        && self->_interactionType == v5->_interactionType;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKConceptIdentifier *medicationIdentifier;
  id v5;

  medicationIdentifier = self->_medicationIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", medicationIdentifier, CFSTR("MedicationIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_interactionType, CFSTR("InteractionType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("CreationDate"));

}

- (HKDismissedPregnancyLactationInteraction)initWithCoder:(id)a3
{
  id v5;
  HKDismissedPregnancyLactationInteraction *v6;
  uint64_t v7;
  HKConceptIdentifier *medicationIdentifier;
  uint64_t v9;
  NSDate *creationDate;
  void *v12;
  void *v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKDismissedPregnancyLactationInteraction;
  v6 = -[HKDismissedPregnancyLactationInteraction init](&v14, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MedicationIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    medicationIdentifier = v6->_medicationIdentifier;
    v6->_medicationIdentifier = (HKConceptIdentifier *)v7;

    v6->_interactionType = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("InteractionType"));
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CreationDate"));
    v9 = objc_claimAutoreleasedReturnValue();
    creationDate = v6->_creationDate;
    v6->_creationDate = (NSDate *)v9;

    if (!v6->_medicationIdentifier)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("HKDismissedPregnancyLactationInteraction.m"), 107, CFSTR("Medication identifier should not be nil"));

    }
    if (!v6->_creationDate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("HKDismissedPregnancyLactationInteraction.m"), 108, CFSTR("Creation date should not be nil"));

    }
  }

  return v6;
}

- (HKConceptIdentifier)medicationIdentifier
{
  return self->_medicationIdentifier;
}

- (int64_t)interactionType
{
  return self->_interactionType;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_medicationIdentifier, 0);
}

@end
