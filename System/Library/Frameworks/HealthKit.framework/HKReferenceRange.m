@implementation HKReferenceRange

+ (id)referenceRangeWithIdentifier:(id)a3 minValue:(id)a4 maxValue:(id)a5
{
  NSString *v7;
  id v8;
  id v9;
  HKReferenceRange *v10;
  NSString *referenceRangeIdentifier;
  NSString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  HKInspectableValueCollection *valueRange;

  v7 = (NSString *)a3;
  v8 = a5;
  v9 = a4;
  v10 = objc_alloc_init(HKReferenceRange);
  referenceRangeIdentifier = v10->_referenceRangeIdentifier;
  v10->_referenceRangeIdentifier = v7;
  v12 = v7;

  +[HKInspectableValue inspectableValueWithCodedQuantity:](HKInspectableValue, "inspectableValueWithCodedQuantity:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKInspectableValue inspectableValueWithCodedQuantity:](HKInspectableValue, "inspectableValueWithCodedQuantity:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKInspectableValueCollection inspectableValueCollectionRangeWithMin:max:](HKInspectableValueCollection, "inspectableValueCollectionRangeWithMin:max:", v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  valueRange = v10->_valueRange;
  v10->_valueRange = (HKInspectableValueCollection *)v15;

  return v10;
}

+ (id)referenceRangeWithIdentifier:(id)a3 minValue:(id)a4
{
  NSString *v5;
  id v6;
  HKReferenceRange *v7;
  NSString *referenceRangeIdentifier;
  NSString *v9;
  void *v10;
  uint64_t v11;
  HKInspectableValueCollection *valueRange;

  v5 = (NSString *)a3;
  v6 = a4;
  v7 = objc_alloc_init(HKReferenceRange);
  referenceRangeIdentifier = v7->_referenceRangeIdentifier;
  v7->_referenceRangeIdentifier = v5;
  v9 = v5;

  +[HKInspectableValue inspectableValueWithCodedQuantity:](HKInspectableValue, "inspectableValueWithCodedQuantity:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKInspectableValueCollection inspectableValueCollectionRangeWithMin:](HKInspectableValueCollection, "inspectableValueCollectionRangeWithMin:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  valueRange = v7->_valueRange;
  v7->_valueRange = (HKInspectableValueCollection *)v11;

  return v7;
}

+ (id)referenceRangeWithIdentifier:(id)a3 maxValue:(id)a4
{
  NSString *v5;
  id v6;
  HKReferenceRange *v7;
  NSString *referenceRangeIdentifier;
  NSString *v9;
  void *v10;
  uint64_t v11;
  HKInspectableValueCollection *valueRange;

  v5 = (NSString *)a3;
  v6 = a4;
  v7 = objc_alloc_init(HKReferenceRange);
  referenceRangeIdentifier = v7->_referenceRangeIdentifier;
  v7->_referenceRangeIdentifier = v5;
  v9 = v5;

  +[HKInspectableValue inspectableValueWithCodedQuantity:](HKInspectableValue, "inspectableValueWithCodedQuantity:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKInspectableValueCollection inspectableValueCollectionRangeWithMax:](HKInspectableValueCollection, "inspectableValueCollectionRangeWithMax:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  valueRange = v7->_valueRange;
  v7->_valueRange = (HKInspectableValueCollection *)v11;

  return v7;
}

+ (id)referenceRangeWithIdentifier:(id)a3 inspectableValueRange:(id)a4
{
  NSString *v7;
  HKInspectableValueCollection *v8;
  HKReferenceRange *v9;
  NSString *referenceRangeIdentifier;
  NSString *v11;
  HKInspectableValueCollection *valueRange;
  void *v14;

  v7 = (NSString *)a3;
  v8 = (HKInspectableValueCollection *)a4;
  v9 = objc_alloc_init(HKReferenceRange);
  if (-[HKInspectableValueCollection collectionType](v8, "collectionType") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKReferenceRange.m"), 55, CFSTR("Only range collection should be used to create a reference range"));

  }
  referenceRangeIdentifier = v9->_referenceRangeIdentifier;
  v9->_referenceRangeIdentifier = v7;
  v11 = v7;

  valueRange = v9->_valueRange;
  v9->_valueRange = v8;

  return v9;
}

- (HKReferenceRange)initWithCoder:(id)a3
{
  id v4;
  HKReferenceRange *v5;
  uint64_t v6;
  NSString *referenceRangeIdentifier;
  uint64_t v8;
  HKInspectableValueCollection *valueRange;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKReferenceRange;
  v5 = -[HKReferenceRange init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referenceRangeIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    referenceRangeIdentifier = v5->_referenceRangeIdentifier;
    v5->_referenceRangeIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("valueRange"));
    v8 = objc_claimAutoreleasedReturnValue();
    valueRange = v5->_valueRange;
    v5->_valueRange = (HKInspectableValueCollection *)v8;

  }
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRange referenceRangeIdentifier](self, "referenceRangeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRange valueRange](self, "valueRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "min");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRange valueRange](self, "valueRange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "max");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p referenceRangeIdentifier = %@, minValue = %@, maxValue = %@>"), v5, self, v6, v8, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  HKReferenceRange *v4;
  HKReferenceRange *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;

  v4 = (HKReferenceRange *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HKReferenceRange referenceRangeIdentifier](v5, "referenceRangeIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKReferenceRange referenceRangeIdentifier](self, "referenceRangeIdentifier");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[HKReferenceRange referenceRangeIdentifier](self, "referenceRangeIdentifier");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_14;
        v10 = (void *)v9;
        -[HKReferenceRange referenceRangeIdentifier](v5, "referenceRangeIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKReferenceRange referenceRangeIdentifier](self, "referenceRangeIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (!v13)
          goto LABEL_15;
      }
      -[HKReferenceRange valueRange](v5, "valueRange");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKReferenceRange valueRange](self, "valueRange");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v15)
      {

LABEL_17:
        v14 = 1;
        goto LABEL_18;
      }
      v8 = (void *)v15;
      -[HKReferenceRange valueRange](self, "valueRange");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        -[HKReferenceRange valueRange](v5, "valueRange");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKReferenceRange valueRange](self, "valueRange");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqual:", v19);

        if ((v20 & 1) != 0)
          goto LABEL_17;
LABEL_15:
        v14 = 0;
LABEL_18:

        goto LABEL_19;
      }
LABEL_14:

      goto LABEL_15;
    }
    v14 = 0;
  }
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKReferenceRange;
  v3 = -[HKReferenceRange hash](&v9, sel_hash);
  -[HKReferenceRange referenceRangeIdentifier](self, "referenceRangeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[HKReferenceRange valueRange](self, "valueRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *referenceRangeIdentifier;
  id v5;

  referenceRangeIdentifier = self->_referenceRangeIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", referenceRangeIdentifier, CFSTR("referenceRangeIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_valueRange, CFSTR("valueRange"));

}

- (NSString)referenceRangeIdentifier
{
  return self->_referenceRangeIdentifier;
}

- (HKInspectableValueCollection)valueRange
{
  return self->_valueRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueRange, 0);
  objc_storeStrong((id *)&self->_referenceRangeIdentifier, 0);
}

@end
