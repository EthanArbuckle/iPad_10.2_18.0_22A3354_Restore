@implementation HKDismissedDrugInteractionResult

- (HKDismissedDrugInteractionResult)init
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

- (id)_initWithDrugInteractionResult:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v22;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDismissedDrugInteractionResult.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("drugInteractionResult != nil"));

  }
  objc_msgSend(v5, "firstInteractionClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "rawIdentifier");
  objc_msgSend(v5, "secondInteractionClass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "rawIdentifier");

  if (v8 <= v11)
  {
    objc_msgSend(v5, "firstInteractionClass");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "secondInteractionClass");
  }
  else
  {
    objc_msgSend(v5, "secondInteractionClass");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstInteractionClass");
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ancestorIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ancestorIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[HKDismissedDrugInteractionResult _initWithInteractionIdentifier:firstDrugClassIdentifier:firstDrugClassAncestorIdentifier:secondDrugClassIdentifier:secondDrugClassAncestorIdentifier:creationDate:](self, "_initWithInteractionIdentifier:firstDrugClassIdentifier:firstDrugClassAncestorIdentifier:secondDrugClassIdentifier:secondDrugClassAncestorIdentifier:creationDate:", v14, v15, v16, v17, v18, v19);

  return v20;
}

- (id)_initWithInteractionIdentifier:(id)a3 firstDrugClassIdentifier:(id)a4 firstDrugClassAncestorIdentifier:(id)a5 secondDrugClassIdentifier:(id)a6 secondDrugClassAncestorIdentifier:(id)a7 creationDate:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  HKDismissedDrugInteractionResult *v22;
  uint64_t v23;
  HKConceptIdentifier *interactionIdentifier;
  uint64_t v25;
  HKConceptIdentifier *firstDrugClassIdentifier;
  uint64_t v27;
  HKConceptIdentifier *firstDrugClassAncestorIdentifier;
  uint64_t v29;
  HKConceptIdentifier *secondDrugClassIdentifier;
  uint64_t v31;
  HKConceptIdentifier *secondDrugClassAncestorIdentifier;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v41;

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
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDismissedDrugInteractionResult.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interactionIdentifier != nil"));

    if (v16)
    {
LABEL_3:
      if (v17)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDismissedDrugInteractionResult.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("firstDrugClassIdentifier != nil"));

  if (v17)
  {
LABEL_4:
    if (v18)
      goto LABEL_5;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDismissedDrugInteractionResult.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("secondDrugClassIdentifier != nil"));

    if (v19)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDismissedDrugInteractionResult.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("firstDrugClassAncestorIdentifier != nil"));

  if (!v18)
    goto LABEL_14;
LABEL_5:
  if (v19)
    goto LABEL_6;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDismissedDrugInteractionResult.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("secondDrugClassAncestorIdentifier != nil"));

LABEL_6:
  v21 = objc_msgSend(v16, "rawIdentifier");
  if (v21 >= objc_msgSend(v18, "rawIdentifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDismissedDrugInteractionResult.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("firstDrugClassIdentifier.rawIdentifier < secondDrugClassIdentifier.rawIdentifier"));

    if (v20)
      goto LABEL_8;
  }
  else if (v20)
  {
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDismissedDrugInteractionResult.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("creationDate != nil"));

LABEL_8:
  v41.receiver = self;
  v41.super_class = (Class)HKDismissedDrugInteractionResult;
  v22 = -[HKDismissedDrugInteractionResult init](&v41, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v15, "copy");
    interactionIdentifier = v22->_interactionIdentifier;
    v22->_interactionIdentifier = (HKConceptIdentifier *)v23;

    v25 = objc_msgSend(v16, "copy");
    firstDrugClassIdentifier = v22->_firstDrugClassIdentifier;
    v22->_firstDrugClassIdentifier = (HKConceptIdentifier *)v25;

    v27 = objc_msgSend(v17, "copy");
    firstDrugClassAncestorIdentifier = v22->_firstDrugClassAncestorIdentifier;
    v22->_firstDrugClassAncestorIdentifier = (HKConceptIdentifier *)v27;

    v29 = objc_msgSend(v18, "copy");
    secondDrugClassIdentifier = v22->_secondDrugClassIdentifier;
    v22->_secondDrugClassIdentifier = (HKConceptIdentifier *)v29;

    v31 = objc_msgSend(v19, "copy");
    secondDrugClassAncestorIdentifier = v22->_secondDrugClassAncestorIdentifier;
    v22->_secondDrugClassAncestorIdentifier = (HKConceptIdentifier *)v31;

    objc_storeStrong((id *)&v22->_creationDate, a8);
  }

  return v22;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p (%ld, %ld, %ld, %ld, %ld, %@)>"), objc_opt_class(), self, -[HKConceptIdentifier rawIdentifier](self->_interactionIdentifier, "rawIdentifier"), -[HKConceptIdentifier rawIdentifier](self->_firstDrugClassIdentifier, "rawIdentifier"), -[HKConceptIdentifier rawIdentifier](self->_firstDrugClassAncestorIdentifier, "rawIdentifier"), -[HKConceptIdentifier rawIdentifier](self->_secondDrugClassIdentifier, "rawIdentifier"), -[HKConceptIdentifier rawIdentifier](self->_secondDrugClassAncestorIdentifier, "rawIdentifier"), self->_creationDate);
}

- (BOOL)isEqualToDrugInteractionResult:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[HKDismissedDrugInteractionResult _initWithDrugInteractionResult:]([HKDismissedDrugInteractionResult alloc], "_initWithDrugInteractionResult:", v4);

  LOBYTE(self) = -[HKDismissedDrugInteractionResult isEqual:](self, "isEqual:", v5);
  return (char)self;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[HKConceptIdentifier hash](self->_interactionIdentifier, "hash");
  v4 = -[HKConceptIdentifier hash](self->_firstDrugClassIdentifier, "hash") ^ v3;
  v5 = -[HKConceptIdentifier hash](self->_firstDrugClassAncestorIdentifier, "hash");
  v6 = v4 ^ v5 ^ -[HKConceptIdentifier hash](self->_secondDrugClassIdentifier, "hash");
  return v6 ^ -[HKConceptIdentifier hash](self->_secondDrugClassAncestorIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HKDismissedDrugInteractionResult *v4;
  HKDismissedDrugInteractionResult *v5;
  HKConceptIdentifier *interactionIdentifier;
  HKConceptIdentifier *v7;
  char v8;

  v4 = (HKDismissedDrugInteractionResult *)a3;
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
      if (!-[HKDismissedDrugInteractionResult hasEquivalentFirstDrugClassIdentifier:firstDrugClassAncestorIdentifier:secondDrugClassIdentifier:secondDrugClassAncestorIdentifier:]((uint64_t)self, v5->_firstDrugClassIdentifier, v5->_firstDrugClassAncestorIdentifier, v5->_secondDrugClassIdentifier, v5->_secondDrugClassAncestorIdentifier))goto LABEL_9;
      interactionIdentifier = self->_interactionIdentifier;
      v7 = v5->_interactionIdentifier;
      if (interactionIdentifier == v7)
      {
        v8 = 1;
        goto LABEL_11;
      }
      if (v7)
        v8 = -[HKConceptIdentifier isEqual:](interactionIdentifier, "isEqual:");
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

- (uint64_t)hasEquivalentFirstDrugClassIdentifier:(void *)a3 firstDrugClassAncestorIdentifier:(void *)a4 secondDrugClassIdentifier:(void *)a5 secondDrugClassAncestorIdentifier:
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  id v15;
  int v16;
  id v17;
  int v18;
  id v19;
  int v20;
  id v21;
  int v22;
  id v23;
  int v24;
  id v25;
  int v26;
  id v27;
  int v28;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!a1)
    goto LABEL_45;
  v13 = *(id *)(a1 + 16);
  if (v13 == v9)
  {
    v14 = 0;
  }
  else if (v9)
  {
    v14 = objc_msgSend(v13, "isEqual:", v9) ^ 1;
  }
  else
  {
    v14 = 1;
  }
  v15 = *(id *)(a1 + 24);
  if (v15 == v10)
  {
    v16 = 0;
  }
  else if (v10)
  {
    v16 = objc_msgSend(v15, "isEqual:", v10) ^ 1;
  }
  else
  {
    v16 = 1;
  }
  v17 = *(id *)(a1 + 32);
  if (v17 == v11)
  {
    v18 = 0;
  }
  else if (v11)
  {
    v18 = objc_msgSend(v17, "isEqual:", v11) ^ 1;
  }
  else
  {
    v18 = 1;
  }
  v19 = *(id *)(a1 + 40);
  if (v19 == v12)
  {
    v20 = 0;
    goto LABEL_21;
  }
  if (v12)
  {
    v20 = objc_msgSend(v19, "isEqual:", v12) ^ 1;
LABEL_21:
    if (((v14 | v16 | v18) & 1) == 0 && !v20)
    {
      a1 = 1;
      goto LABEL_45;
    }
  }
  v21 = *(id *)(a1 + 32);
  if (v21 == v9)
  {
    v22 = 0;
  }
  else if (v9)
  {
    v22 = objc_msgSend(v21, "isEqual:", v9) ^ 1;
  }
  else
  {
    v22 = 1;
  }
  v23 = *(id *)(a1 + 40);
  if (v23 == v10)
  {
    v24 = 0;
  }
  else if (v10)
  {
    v24 = objc_msgSend(v23, "isEqual:", v10) ^ 1;
  }
  else
  {
    v24 = 1;
  }
  v25 = *(id *)(a1 + 16);
  if (v25 == v11)
  {
    v26 = 0;
  }
  else if (v11)
  {
    v26 = objc_msgSend(v25, "isEqual:", v11) ^ 1;
  }
  else
  {
    v26 = 1;
  }
  v27 = *(id *)(a1 + 24);
  if (v27 == v12)
  {
    v28 = 0;
  }
  else if (v12)
  {
    v28 = objc_msgSend(v27, "isEqual:", v12) ^ 1;
  }
  else
  {
    v28 = 1;
  }
  a1 = (v22 | v24 | v26 | v28) ^ 1u;
LABEL_45:

  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKConceptIdentifier *interactionIdentifier;
  id v5;

  interactionIdentifier = self->_interactionIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", interactionIdentifier, CFSTR("InteractionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firstDrugClassIdentifier, CFSTR("FirstDrugClassIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firstDrugClassAncestorIdentifier, CFSTR("FirstDrugClassAncestorIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondDrugClassIdentifier, CFSTR("SecondDrugClassIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondDrugClassAncestorIdentifier, CFSTR("SecondDrugClassAncestorIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("CreationDate"));

}

- (HKDismissedDrugInteractionResult)initWithCoder:(id)a3
{
  id v5;
  HKDismissedDrugInteractionResult *v6;
  uint64_t v7;
  HKConceptIdentifier *interactionIdentifier;
  uint64_t v9;
  HKConceptIdentifier *firstDrugClassIdentifier;
  uint64_t v11;
  HKConceptIdentifier *firstDrugClassAncestorIdentifier;
  uint64_t v13;
  HKConceptIdentifier *secondDrugClassIdentifier;
  uint64_t v15;
  HKConceptIdentifier *secondDrugClassAncestorIdentifier;
  uint64_t v17;
  NSDate *creationDate;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HKDismissedDrugInteractionResult;
  v6 = -[HKDismissedDrugInteractionResult init](&v26, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("InteractionIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    interactionIdentifier = v6->_interactionIdentifier;
    v6->_interactionIdentifier = (HKConceptIdentifier *)v7;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FirstDrugClassIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    firstDrugClassIdentifier = v6->_firstDrugClassIdentifier;
    v6->_firstDrugClassIdentifier = (HKConceptIdentifier *)v9;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FirstDrugClassAncestorIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    firstDrugClassAncestorIdentifier = v6->_firstDrugClassAncestorIdentifier;
    v6->_firstDrugClassAncestorIdentifier = (HKConceptIdentifier *)v11;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SecondDrugClassIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    secondDrugClassIdentifier = v6->_secondDrugClassIdentifier;
    v6->_secondDrugClassIdentifier = (HKConceptIdentifier *)v13;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SecondDrugClassAncestorIdentifier"));
    v15 = objc_claimAutoreleasedReturnValue();
    secondDrugClassAncestorIdentifier = v6->_secondDrugClassAncestorIdentifier;
    v6->_secondDrugClassAncestorIdentifier = (HKConceptIdentifier *)v15;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CreationDate"));
    v17 = objc_claimAutoreleasedReturnValue();
    creationDate = v6->_creationDate;
    v6->_creationDate = (NSDate *)v17;

    if (!v6->_interactionIdentifier)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("HKDismissedDrugInteractionResult.m"), 191, CFSTR("Interaction identifier should not be nil"));

    }
    if (!v6->_firstDrugClassIdentifier)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("HKDismissedDrugInteractionResult.m"), 192, CFSTR("First drug interaction class identifier should not be nil"));

    }
    if (!v6->_firstDrugClassAncestorIdentifier)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("HKDismissedDrugInteractionResult.m"), 193, CFSTR("First drug interaction class ancestor identifier should not be nil"));

    }
    if (!v6->_secondDrugClassIdentifier)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("HKDismissedDrugInteractionResult.m"), 194, CFSTR("Second drug interaction class identifier should not be nil"));

    }
    if (!v6->_secondDrugClassAncestorIdentifier)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("HKDismissedDrugInteractionResult.m"), 195, CFSTR("Second interaction class ancestor identifier should not be nil"));

    }
    if (!v6->_creationDate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("HKDismissedDrugInteractionResult.m"), 196, CFSTR("Creation date should not be nil"));

    }
  }

  return v6;
}

- (HKConceptIdentifier)interactionIdentifier
{
  return self->_interactionIdentifier;
}

- (HKConceptIdentifier)firstDrugClassIdentifier
{
  return self->_firstDrugClassIdentifier;
}

- (HKConceptIdentifier)firstDrugClassAncestorIdentifier
{
  return self->_firstDrugClassAncestorIdentifier;
}

- (HKConceptIdentifier)secondDrugClassIdentifier
{
  return self->_secondDrugClassIdentifier;
}

- (HKConceptIdentifier)secondDrugClassAncestorIdentifier
{
  return self->_secondDrugClassAncestorIdentifier;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_secondDrugClassAncestorIdentifier, 0);
  objc_storeStrong((id *)&self->_secondDrugClassIdentifier, 0);
  objc_storeStrong((id *)&self->_firstDrugClassAncestorIdentifier, 0);
  objc_storeStrong((id *)&self->_firstDrugClassIdentifier, 0);
  objc_storeStrong((id *)&self->_interactionIdentifier, 0);
}

@end
