@implementation HKInspectableValueCollection

+ (id)indexableKeyPathsWithPrefix:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("inspectableValue");
  v10[1] = CFSTR("min");
  v10[2] = CFSTR("max");
  v10[3] = CFSTR("inspectableValues");
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", v10, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "hk_foldRightFrom:with:", v6, &__block_literal_global_108);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKConceptIndexUtilities keyPaths:prefix:](HKConceptIndexUtilities, "keyPaths:prefix:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __60__HKInspectableValueCollection_indexableKeyPathsWithPrefix___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a2;
  +[HKInspectableValue indexableKeyPathsWithPrefix:](HKInspectableValue, "indexableKeyPathsWithPrefix:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

- (HKInspectableValueCollection)init
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

+ (id)inspectableValueCollectionSingleWithValue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "_initWithCollectionType:collection:", 0, v6);
  return v7;
}

+ (id)inspectableValueCollectionRangeWithMin:(id)a3 max:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  v12[0] = v7;
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v8, "_initWithCollectionType:collection:", 1, v9);
  return v10;
}

+ (id)inspectableValueCollectionRangeWithMin:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v10[0] = v4;
  +[HKInspectableValue inspectableValueWithNull](HKInspectableValue, "inspectableValueWithNull");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v5, "_initWithCollectionType:collection:", 1, v7);
  return v8;
}

+ (id)inspectableValueCollectionRangeWithMax:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc((Class)a1);
  +[HKInspectableValue inspectableValueWithNull](HKInspectableValue, "inspectableValueWithNull");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v5, "_initWithCollectionType:collection:", 1, v7);
  return v8;
}

+ (id)inspectableValueCollectionListWithValues:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithCollectionType:collection:", 2, v4);

  return v5;
}

+ (id)inspectableValueCollectionTaggedListWithValues:(id)a3 tags:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithCollectionType:collection:tags:", 3, v7, v6);

  return v8;
}

+ (BOOL)hasNoValue:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "collectionType"))
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(v4, "inspectableValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "valueType") == 5;

    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)_initWithCollectionType:(int64_t)a3 collection:(id)a4
{
  return -[HKInspectableValueCollection _initWithCollectionType:collection:tags:](self, "_initWithCollectionType:collection:tags:", a3, a4, 0);
}

- (id)_initWithCollectionType:(int64_t)a3 collection:(id)a4 tags:(id)a5
{
  id v9;
  id v10;
  HKInspectableValueCollection *v11;
  id *p_isa;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HKInspectableValueCollection;
  v11 = -[HKInspectableValueCollection init](&v14, sel_init);
  p_isa = (id *)&v11->super.isa;
  if (v11)
  {
    v11->_collectionType = a3;
    objc_storeStrong((id *)&v11->_collection, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_msgSend(p_isa, "_assertCollectionType");
  }

  return p_isa;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%li: %@"), self->_collectionType, self->_collection);
}

- (HKInspectableValue)inspectableValue
{
  if (self->_collectionType)
    return (HKInspectableValue *)0;
  -[NSArray objectAtIndexedSubscript:](self->_collection, "objectAtIndexedSubscript:", 0);
  return (HKInspectableValue *)(id)objc_claimAutoreleasedReturnValue();
}

- (HKInspectableValue)min
{
  void *v2;

  if (self->_collectionType == 1)
  {
    -[NSArray objectAtIndexedSubscript:](self->_collection, "objectAtIndexedSubscript:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (HKInspectableValue *)v2;
}

- (HKInspectableValue)max
{
  void *v2;

  if (self->_collectionType == 1)
  {
    -[NSArray objectAtIndexedSubscript:](self->_collection, "objectAtIndexedSubscript:", 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (HKInspectableValue *)v2;
}

- (NSArray)inspectableValues
{
  if (self->_collectionType == 2)
    return self->_collection;
  else
    return (NSArray *)0;
}

- (id)valueInRangeWithReferenceRanges:(id)a3 includeUnitString:(BOOL)a4 allowsNullRange:(BOOL)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;

  v6 = a4;
  v8 = a3;
  if (-[HKInspectableValueCollection collectionType](self, "collectionType"))
    goto LABEL_2;
  -[HKInspectableValueCollection inspectableValue](self, "inspectableValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "valueType");

  v9 = 0;
  v10 = 0;
  if (v8 && v15)
  {
    if (objc_msgSend(v8, "count") != 1)
    {
LABEL_2:
      v9 = 0;
      v10 = 0;
      goto LABEL_3;
    }
    objc_msgSend(v8, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "valueRange");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17 && objc_msgSend(v17, "collectionType") == 1)
    {
      objc_msgSend(v18, "min");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v18, "min");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "valueType");

        if (v20)
        {
          objc_msgSend(v18, "min");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = 0;
        }
      }
      objc_msgSend(v18, "max");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
        goto LABEL_22;
      objc_msgSend(v18, "max");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "valueType");

      if (v22)
      {
        objc_msgSend(v18, "max");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
    }
    else
    {
      v9 = 0;
    }
    v10 = 0;
LABEL_22:

  }
LABEL_3:
  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "_unitStringForValueCollection:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5)
      goto LABEL_10;
  }
  else
  {
    v11 = 0;
    if (a5)
    {
LABEL_10:
      +[HKInspectableValueInRange valueInRangeWithLow:high:currentValue:unit:](HKInspectableValueInRange, "valueInRangeWithLow:high:currentValue:unit:", v9, v10, self, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
  }
  if (v9 || v10)
    goto LABEL_10;
  v12 = 0;
LABEL_11:

  return v12;
}

- (id)valueInRangeWithReferenceRanges:(id)a3 includeUnitString:(BOOL)a4
{
  return -[HKInspectableValueCollection valueInRangeWithReferenceRanges:includeUnitString:allowsNullRange:](self, "valueInRangeWithReferenceRanges:includeUnitString:allowsNullRange:", a3, a4, 0);
}

- (int64_t)referenceRangeStatusWithRanges:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;
  int64_t v6;

  -[HKInspectableValueCollection valueInRangeWithReferenceRanges:includeUnitString:](self, "valueInRangeWithReferenceRanges:includeUnitString:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (v5 = objc_msgSend(v3, "currentValueRelation"), v5 <= 2))
    v6 = qword_19A44CB18[v5];
  else
    v6 = 0;

  return v6;
}

- (NSString)unitString
{
  int64_t collectionType;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __CFString *v8;

  collectionType = self->_collectionType;
  if ((unint64_t)(collectionType - 2) >= 2)
  {
    if (!collectionType)
    {
      -[HKInspectableValueCollection inspectableValue](self, "inspectableValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "unitString");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_7:
    v8 = &stru_1E37FD4C0;
    return (NSString *)v8;
  }
  -[HKInspectableValueCollection inspectableValues](self, "inspectableValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    goto LABEL_7;
  -[HKInspectableValueCollection inspectableValues](self, "inspectableValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unitString");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return (NSString *)v8;
}

+ (id)_unitStringForValueCollection:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;

  v3 = a3;
  v4 = objc_msgSend(v3, "collectionType");
  if ((unint64_t)(v4 - 2) >= 2)
  {
    if (!v4)
    {
      v11 = (void *)objc_opt_class();
      objc_msgSend(v3, "inspectableValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_unitStringForValue:", v8);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_7:
    v10 = &stru_1E37FD4C0;
    goto LABEL_8;
  }
  objc_msgSend(v3, "inspectableValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    goto LABEL_7;
  v7 = (void *)objc_opt_class();
  objc_msgSend(v3, "inspectableValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_unitStringForValue:", v9);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_6:
LABEL_8:

  return v10;
}

+ (id)_unitStringForValue:(id)a3
{
  id v3;
  uint64_t v4;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;

  v3 = a3;
  v4 = objc_msgSend(v3, "valueType");
  if (v4 == 8 || v4 == 6)
  {
    objc_msgSend(v3, "unitString");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (v4 == 1)
  {
    objc_msgSend(v3, "ratioValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unitCoding");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "code");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(v9, "displayString");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v6 = v12;

  }
  else
  {
    v6 = &stru_1E37FD4C0;
  }
  if (-[__CFString length](v6, "length"))
  {
    +[HKUCUMUnitDisplayConverter sharedConverter](HKUCUMUnitDisplayConverter, "sharedConverter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "synonymForUCUMUnitString:", v6);
    v14 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v14;
  }

  return v6;
}

- (id)valuesWithTag:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_elementTags, "count"))
  {
    v6 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_elementTags, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqual:", v4);

      if (v8)
      {
        -[NSArray objectAtIndexedSubscript:](self->_collection, "objectAtIndexedSubscript:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v9);

      }
      ++v6;
    }
    while (v6 < -[NSArray count](self->_elementTags, "count"));
  }
  v10 = (void *)objc_msgSend(v5, "copy");

  return v10;
}

- (void)_assertCollectionType
{
  int64_t collectionType;
  NSUInteger v4;
  uint64_t v5;

  collectionType = self->_collectionType;
  if (collectionType == 3)
  {
    v4 = -[NSArray count](self->_collection, "count");
    if (v4 != -[NSArray count](self->_elementTags, "count"))
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKInconsistentInspectableCollectionTypeException"), CFSTR("Tagged collection requires the same number of element and tags, number of tags:%lu, number of elements: %lu"), -[NSArray count](self->_elementTags, "count"), -[NSArray count](self->_collection, "count"));
  }
  else if (collectionType == 1)
  {
    if (-[NSArray count](self->_collection, "count") != 2)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKInconsistentInspectableCollectionTypeException"), CFSTR("Inconsistent number of values found in collection, expect two values, have %lu values"), -[NSArray count](self->_collection, "count"), v5);
  }
  else if (!collectionType && -[NSArray count](self->_collection, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKInconsistentInspectableCollectionTypeException"), CFSTR("Inconsistent number of values found in collection, expect single value, have %lu values"), -[NSArray count](self->_collection, "count"), v5);
  }
}

- (BOOL)isEqual:(id)a3
{
  HKInspectableValueCollection *v4;
  HKInspectableValueCollection *v5;
  int64_t collectionType;
  NSArray *collection;
  void *v8;
  char v9;

  v4 = (HKInspectableValueCollection *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      collectionType = self->_collectionType;
      if (collectionType == -[HKInspectableValueCollection collectionType](v5, "collectionType"))
      {
        collection = self->_collection;
        -[HKInspectableValueCollection collection](v5, "collection");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[NSArray isEqualToArray:](collection, "isEqualToArray:", v8);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[HKInspectableValueCollection collectionType](self, "collectionType");
  -[HKInspectableValueCollection collection](self, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKInspectableValueCollection)initWithCoder:(id)a3
{
  id v4;
  HKInspectableValueCollection *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *collection;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *elementTags;
  objc_super v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKInspectableValueCollection;
  v5 = -[HKInspectableValueCollection init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("CollectionKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    collection = v5->_collection;
    v5->_collection = (NSArray *)v9;

    v5->_collectionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CollectionTypeKey"));
    v11 = (void *)MEMORY[0x1E0C99E60];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("ElementTagsKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    elementTags = v5->_elementTags;
    v5->_elementTags = (NSArray *)v14;

    -[HKInspectableValueCollection _assertCollectionType](v5, "_assertCollectionType");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *collection;
  id v5;

  collection = self->_collection;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", collection, CFSTR("CollectionKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_collectionType, CFSTR("CollectionTypeKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_elementTags, CFSTR("ElementTagsKey"));

}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a3;
  +[HKConceptIndexKeyPath conceptIndexKeyPathWithFullKeyPath:error:](HKConceptIndexKeyPath, "conceptIndexKeyPathWithFullKeyPath:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    goto LABEL_12;
  objc_msgSend(v7, "head");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("inspectableValue"));

  if (!v10)
  {
    objc_msgSend(v8, "head");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("min"));

    if (v13)
    {
      -[HKInspectableValueCollection min](self, "min");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    objc_msgSend(v8, "head");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("max"));

    if (v15)
    {
      -[HKInspectableValueCollection max](self, "max");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    objc_msgSend(v8, "head");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("inspectableValues"));

    if (v17)
    {
      -[HKInspectableValueCollection inspectableValues](self, "inspectableValues");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    +[HKConceptIndexUtilities assignError:forInvalidKeyPath:inClass:](HKConceptIndexUtilities, "assignError:forInvalidKeyPath:inClass:", a4, v6, objc_opt_class());
LABEL_12:
    v20 = 0;
    goto LABEL_13;
  }
  -[HKInspectableValueCollection inspectableValue](self, "inspectableValue");
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v18 = (void *)v11;
  objc_msgSend(v8, "tail");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKConceptIndexUtilities medicalCodingCollectionForIndexableObject:keyPath:error:](HKConceptIndexUtilities, "medicalCodingCollectionForIndexableObject:keyPath:error:", v18, v19, a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v20;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  BOOL v23;

  v8 = a3;
  v9 = a4;
  +[HKConceptIndexKeyPath conceptIndexKeyPathWithFullKeyPath:error:](HKConceptIndexKeyPath, "conceptIndexKeyPathWithFullKeyPath:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_12;
  objc_msgSend(v10, "head");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("inspectableValue"));

  if (!v13)
  {
    objc_msgSend(v11, "head");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("min"));

    if (v16)
    {
      -[HKInspectableValueCollection min](self, "min");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    objc_msgSend(v11, "head");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("max"));

    if (v18)
    {
      -[HKInspectableValueCollection max](self, "max");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    objc_msgSend(v11, "head");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("inspectableValues"));

    if (v20)
    {
      -[HKInspectableValueCollection inspectableValues](self, "inspectableValues");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    +[HKConceptIndexUtilities assignError:forInvalidKeyPath:inClass:](HKConceptIndexUtilities, "assignError:forInvalidKeyPath:inClass:", a5, v9, objc_opt_class());
LABEL_12:
    v23 = 0;
    goto LABEL_13;
  }
  -[HKInspectableValueCollection inspectableValue](self, "inspectableValue");
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v21 = (void *)v14;
  objc_msgSend(v11, "tail");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = +[HKConceptIndexUtilities applyConcepts:toIndexableObject:keyPath:error:](HKConceptIndexUtilities, "applyConcepts:toIndexableObject:keyPath:error:", v8, v21, v22, a5);

LABEL_13:
  return v23;
}

- (int64_t)collectionType
{
  return self->_collectionType;
}

- (NSArray)collection
{
  return self->_collection;
}

- (NSArray)elementTags
{
  return self->_elementTags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementTags, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
