@implementation HKMedicationPregnancyLactationInteraction

- (HKMedicationPregnancyLactationInteraction)init
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

- (HKMedicationPregnancyLactationInteraction)initWithMedication:(id)a3 interactionType:(int64_t)a4
{
  id v8;
  HKMedicationPregnancyLactationInteraction *v9;
  HKMedicationPregnancyLactationInteraction *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicationPregnancyLactationInteraction.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("medication != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)HKMedicationPregnancyLactationInteraction;
  v9 = -[HKMedicationPregnancyLactationInteraction init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_medication, a3);
    v10->_interactionType = a4;
  }

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HKMedicationUserDomainConcept firstConceptIdentifier](self->_medication, "firstConceptIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p (%ld, %ld)>"), v4, self, objc_msgSend(v5, "rawIdentifier"), self->_interactionType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  return self->_interactionType ^ -[HKMedicationUserDomainConcept hash](self->_medication, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HKMedicationPregnancyLactationInteraction *v4;
  HKMedicationPregnancyLactationInteraction *v5;
  HKMedicationUserDomainConcept *medication;
  HKMedicationUserDomainConcept *v7;
  BOOL v8;

  v4 = (HKMedicationPregnancyLactationInteraction *)a3;
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
      medication = self->_medication;
      v7 = v5->_medication;
      v8 = (medication == v7 || v7 && -[HKMedicationUserDomainConcept isEqual:](medication, "isEqual:"))
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
  HKMedicationUserDomainConcept *medication;
  id v5;

  medication = self->_medication;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", medication, CFSTR("Medication"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_interactionType, CFSTR("InteractionType"));

}

- (HKMedicationPregnancyLactationInteraction)initWithCoder:(id)a3
{
  id v5;
  HKMedicationPregnancyLactationInteraction *v6;
  uint64_t v7;
  HKMedicationUserDomainConcept *medication;
  void *v10;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKMedicationPregnancyLactationInteraction;
  v6 = -[HKMedicationPregnancyLactationInteraction init](&v11, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Medication"));
    v7 = objc_claimAutoreleasedReturnValue();
    medication = v6->_medication;
    v6->_medication = (HKMedicationUserDomainConcept *)v7;

    v6->_interactionType = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("InteractionType"));
    if (!v6->_medication)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("HKMedicationPregnancyLactationInteraction.m"), 95, CFSTR("Medication should not be nil"));

    }
  }

  return v6;
}

- (HKMedicationUserDomainConcept)medication
{
  return self->_medication;
}

- (void)setMedication:(id)a3
{
  objc_storeStrong((id *)&self->_medication, a3);
}

- (int64_t)interactionType
{
  return self->_interactionType;
}

- (void)setInteractionType:(int64_t)a3
{
  self->_interactionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medication, 0);
}

@end
