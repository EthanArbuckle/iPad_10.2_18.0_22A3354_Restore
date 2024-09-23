@implementation MLFeatureDescription

- (BOOL)isOptional
{
  return self->_optional;
}

- (NSString)name
{
  return self->_name;
}

+ (MLFeatureDescription)featureDescriptionWithName:(id)a3 type:(int64_t)a4 optional:(BOOL)a5 constraints:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;

  v6 = a5;
  v10 = a6;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:type:optional:contraints:", v11, a4, v6, v10);

  return (MLFeatureDescription *)v12;
}

- (MLFeatureDescription)initWithName:(id)a3 type:(int64_t)a4 optional:(BOOL)a5 contraints:(id)a6
{
  id v11;
  id v12;
  MLFeatureDescription *v13;
  MLFeatureDescription *v14;
  NSDictionary *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_class *v22;
  void *v23;
  NSDictionary *valueConstraints;
  NSDictionary *v25;
  NSDictionary *v26;
  objc_class *v27;
  void *v28;
  uint64_t v29;
  MLMultiArrayConstraint *multiArrayConstraintCached;
  NSDictionary *v31;
  objc_class *v32;
  void *v33;
  uint64_t v34;
  MLImageConstraint *imageConstraintCached;
  NSDictionary *v36;
  objc_class *v37;
  void *v38;
  uint64_t v39;
  MLDictionaryConstraint *dictionaryConstraintCached;
  NSDictionary *v41;
  objc_class *v42;
  void *v43;
  uint64_t v44;
  MLSequenceConstraint *sequenceConstraintCached;
  NSDictionary *v46;
  objc_class *v47;
  void *v48;
  uint64_t v49;
  MLStateConstraint *stateConstraintCached;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  objc_super v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v56.receiver = self;
  v56.super_class = (Class)MLFeatureDescription;
  v13 = -[MLFeatureDescription init](&v56, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_name, a3);
    v14->_type = a4;
    v14->_optional = a5;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v16 = v12;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v53;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v53 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v20);
          v22 = (objc_class *)objc_opt_class();
          NSStringFromClass(v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v21, v23, (_QWORD)v52);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v18);
    }

    valueConstraints = v14->_valueConstraints;
    v14->_valueConstraints = v15;
    v25 = v15;

    v26 = v14->_valueConstraints;
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", v28);
    v29 = objc_claimAutoreleasedReturnValue();
    multiArrayConstraintCached = v14->_multiArrayConstraintCached;
    v14->_multiArrayConstraintCached = (MLMultiArrayConstraint *)v29;

    v31 = v14->_valueConstraints;
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v31, "objectForKeyedSubscript:", v33);
    v34 = objc_claimAutoreleasedReturnValue();
    imageConstraintCached = v14->_imageConstraintCached;
    v14->_imageConstraintCached = (MLImageConstraint *)v34;

    v36 = v14->_valueConstraints;
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v36, "objectForKeyedSubscript:", v38);
    v39 = objc_claimAutoreleasedReturnValue();
    dictionaryConstraintCached = v14->_dictionaryConstraintCached;
    v14->_dictionaryConstraintCached = (MLDictionaryConstraint *)v39;

    v41 = v14->_valueConstraints;
    v42 = (objc_class *)objc_opt_class();
    NSStringFromClass(v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v41, "objectForKeyedSubscript:", v43);
    v44 = objc_claimAutoreleasedReturnValue();
    sequenceConstraintCached = v14->_sequenceConstraintCached;
    v14->_sequenceConstraintCached = (MLSequenceConstraint *)v44;

    v46 = v14->_valueConstraints;
    v47 = (objc_class *)objc_opt_class();
    NSStringFromClass(v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v46, "objectForKeyedSubscript:", v48);
    v49 = objc_claimAutoreleasedReturnValue();
    stateConstraintCached = v14->_stateConstraintCached;
    v14->_stateConstraintCached = (MLStateConstraint *)v49;

  }
  return v14;
}

- (MLMultiArrayConstraint)multiArrayConstraint
{
  return self->_multiArrayConstraintCached;
}

- (MLFeatureType)type
{
  return self->_type;
}

- (BOOL)isAllowedValue:(MLFeatureValue *)value
{
  return -[MLFeatureDescription isAllowedValue:error:](self, "isAllowedValue:error:", value, 0);
}

- (BOOL)isAllowedValue:(id)a3 error:(id *)a4
{
  id v6;
  int64_t type;
  NSDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  type = self->_type;
  if (type != objc_msgSend(v6, "type"))
  {
    if (!a4)
      goto LABEL_18;
    +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", self->_type);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", objc_msgSend(v6, "type"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Expected feature of type %@ but got %@"), v15, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
    LOBYTE(a4) = 0;
    goto LABEL_18;
  }
  if (objc_msgSend(v6, "isUndefined") && !self->_optional)
  {
    if (!a4)
      goto LABEL_18;
    +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", self->_type);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Feature description does not allow missing %@ values"), v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_valueConstraints;
  v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        -[NSDictionary objectForKeyedSubscript:](self->_valueConstraints, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isAllowedValue:error:", v6, a4);

        if (!v14)
        {
          LOBYTE(a4) = 0;
          goto LABEL_17;
        }
      }
      v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }
  LOBYTE(a4) = 1;
LABEL_17:

LABEL_18:
  return (char)a4;
}

- (MLImageConstraint)imageConstraint
{
  return self->_imageConstraintCached;
}

- (MLDictionaryConstraint)dictionaryConstraint
{
  return self->_dictionaryConstraintCached;
}

- (MLSequenceConstraint)sequenceConstraint
{
  return self->_sequenceConstraintCached;
}

- (id)stateConstraint
{
  return self->_stateConstraintCached;
}

- (BOOL)allowsValuesWithDescription:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  if (v5 != -[MLFeatureDescription type](self, "type")
    || !-[MLFeatureDescription isOptional](self, "isOptional") && (objc_msgSend(v4, "isOptional") & 1) != 0)
  {
    goto LABEL_23;
  }
  -[MLFeatureDescription multiArrayConstraint](self, "multiArrayConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "multiArrayConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_23;
    -[MLFeatureDescription multiArrayConstraint](self, "multiArrayConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shape");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "multiArrayConstraint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shape");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v9, "count");
    if (v12 != objc_msgSend(v11, "count"))
    {
LABEL_22:

      goto LABEL_23;
    }
    if (objc_msgSend(v9, "count"))
    {
      v13 = 0;
      do
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "integerValue");

        if (v15 >= 1)
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "integerValue");

          if (v15 != v17)
            goto LABEL_22;
        }
      }
      while (++v13 < (unint64_t)objc_msgSend(v9, "count"));
    }

  }
  -[MLFeatureDescription imageConstraint](self, "imageConstraint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v4, "imageConstraint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[MLFeatureDescription imageConstraint](self, "imageConstraint");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "pixelsWide");

      -[MLFeatureDescription imageConstraint](self, "imageConstraint");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "pixelsHigh");

      objc_msgSend(v4, "imageConstraint");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "pixelsWide");

      objc_msgSend(v4, "imageConstraint");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "pixelsHigh");

      v28 = 0;
      if (v21 != v25 || v23 != v27)
        goto LABEL_24;
      goto LABEL_17;
    }
LABEL_23:
    v28 = 0;
    goto LABEL_24;
  }
LABEL_17:
  -[MLFeatureDescription stateConstraint](self, "stateConstraint");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v4, "stateConstraint");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
      goto LABEL_23;
    -[MLFeatureDescription stateConstraint](self, "stateConstraint");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "dataType");
    objc_msgSend(v4, "stateConstraint");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "dataType");

    if (v32 != v34)
      goto LABEL_23;
    -[MLFeatureDescription stateConstraint](self, "stateConstraint");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bufferShape");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "stateConstraint");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "bufferShape");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v37) = objc_msgSend(v36, "isEqualToArray:", v38);
    if (!(_DWORD)v37)
      goto LABEL_23;
  }
  v28 = 1;
LABEL_24:

  return v28;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  MLFeatureDescription *v6;

  -[NSDictionary allValues](self->_valueConstraints, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLFeatureDescription initWithName:type:optional:contraints:](+[MLFeatureDescription allocWithZone:](MLFeatureDescription, "allocWithZone:", a3), "initWithName:type:optional:contraints:", self->_name, self->_type, self->_optional, v5);

  return v6;
}

- (id)description
{
  void *v3;
  NSString *name;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  NSString *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  NSString *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  NSString *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  NSString *v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  NSString *v25;
  uint64_t v26;
  const __CFString *v27;
  void *v28;

  switch(self->_type)
  {
    case 4:
      v3 = (void *)MEMORY[0x1E0CB3940];
      name = self->_name;
      -[MLFeatureDescription imageConstraint](self, "imageConstraint");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      if (self->_optional)
        v7 = CFSTR("?");
      else
        v7 = &stru_1E3D68DC8;
      objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ : Image (%@)%@"), name, v5, v7);
      break;
    case 5:
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = self->_name;
      -[MLFeatureDescription multiArrayConstraint](self, "multiArrayConstraint");
      v14 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v14;
      if (self->_optional)
        v15 = CFSTR("?");
      else
        v15 = &stru_1E3D68DC8;
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ : MultiArray (%@)%@"), v13, v14, v15);
      break;
    case 6:
      v16 = (void *)MEMORY[0x1E0CB3940];
      v17 = self->_name;
      -[MLFeatureDescription dictionaryConstraint](self, "dictionaryConstraint");
      v18 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v18;
      if (self->_optional)
        v19 = CFSTR("?");
      else
        v19 = &stru_1E3D68DC8;
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ : Dictionary (%@)%@"), v17, v18, v19);
      break;
    case 7:
      v20 = (void *)MEMORY[0x1E0CB3940];
      v21 = self->_name;
      -[MLFeatureDescription sequenceConstraint](self, "sequenceConstraint");
      v22 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v22;
      if (self->_optional)
        v23 = CFSTR("?");
      else
        v23 = &stru_1E3D68DC8;
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ : Sequence (%@)%@"), v21, v22, v23);
      break;
    case 8:
      v24 = (void *)MEMORY[0x1E0CB3940];
      v25 = self->_name;
      -[MLFeatureDescription stateConstraint](self, "stateConstraint");
      v26 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v26;
      if (self->_optional)
        v27 = CFSTR("?");
      else
        v27 = &stru_1E3D68DC8;
      objc_msgSend(v24, "stringWithFormat:", CFSTR("%@ : State (%@)%@"), v25, v26, v27);
      break;
    default:
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = self->_name;
      +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:");
      v10 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v10;
      if (self->_optional)
        v11 = CFSTR("?");
      else
        v11 = &stru_1E3D68DC8;
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ : %@%@"), v9, v10, v11);
      break;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MLFeatureDescription name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[MLFeatureDescription type](self, "type"), CFSTR("type"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MLFeatureDescription isOptional](self, "isOptional"), CFSTR("optional"));
  -[MLFeatureDescription valueConstraints](self, "valueConstraints");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("constraints"));

}

- (MLFeatureDescription)initWithCoder:(id)a3
{
  id v4;
  MLFeatureDescription *v5;
  uint64_t v6;
  NSString *name;
  id v8;
  void *v9;
  uint64_t v10;
  NSDictionary *valueConstraints;
  NSDictionary *v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  MLMultiArrayConstraint *multiArrayConstraintCached;
  NSDictionary *v17;
  objc_class *v18;
  void *v19;
  uint64_t v20;
  MLImageConstraint *imageConstraintCached;
  NSDictionary *v22;
  objc_class *v23;
  void *v24;
  uint64_t v25;
  MLDictionaryConstraint *dictionaryConstraintCached;
  NSDictionary *v27;
  objc_class *v28;
  void *v29;
  uint64_t v30;
  MLSequenceConstraint *sequenceConstraintCached;
  NSDictionary *v32;
  objc_class *v33;
  void *v34;
  uint64_t v35;
  MLStateConstraint *stateConstraintCached;
  objc_super v38;
  _QWORD v39[8];

  v39[7] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)MLFeatureDescription;
  v5 = -[MLFeatureDescription init](&v38, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_optional = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("optional"));
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    v39[2] = objc_opt_class();
    v39[3] = objc_opt_class();
    v39[4] = objc_opt_class();
    v39[5] = objc_opt_class();
    v39[6] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v9);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("constraints"));
    v10 = objc_claimAutoreleasedReturnValue();
    valueConstraints = v5->_valueConstraints;
    v5->_valueConstraints = (NSDictionary *)v10;

    v12 = v5->_valueConstraints;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    multiArrayConstraintCached = v5->_multiArrayConstraintCached;
    v5->_multiArrayConstraintCached = (MLMultiArrayConstraint *)v15;

    v17 = v5->_valueConstraints;
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    imageConstraintCached = v5->_imageConstraintCached;
    v5->_imageConstraintCached = (MLImageConstraint *)v20;

    v22 = v5->_valueConstraints;
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    dictionaryConstraintCached = v5->_dictionaryConstraintCached;
    v5->_dictionaryConstraintCached = (MLDictionaryConstraint *)v25;

    v27 = v5->_valueConstraints;
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", v29);
    v30 = objc_claimAutoreleasedReturnValue();
    sequenceConstraintCached = v5->_sequenceConstraintCached;
    v5->_sequenceConstraintCached = (MLSequenceConstraint *)v30;

    v32 = v5->_valueConstraints;
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v32, "objectForKeyedSubscript:", v34);
    v35 = objc_claimAutoreleasedReturnValue();
    stateConstraintCached = v5->_stateConstraintCached;
    v5->_stateConstraintCached = (MLStateConstraint *)v35;

  }
  return v5;
}

- (NSDictionary)valueConstraints
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setValueConstraints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (MLMultiArrayConstraint)multiArrayConstraintCached
{
  return self->_multiArrayConstraintCached;
}

- (MLImageConstraint)imageConstraintCached
{
  return self->_imageConstraintCached;
}

- (MLDictionaryConstraint)dictionaryConstraintCached
{
  return self->_dictionaryConstraintCached;
}

- (MLSequenceConstraint)sequenceConstraintCached
{
  return self->_sequenceConstraintCached;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceConstraintCached, 0);
  objc_storeStrong((id *)&self->_dictionaryConstraintCached, 0);
  objc_storeStrong((id *)&self->_imageConstraintCached, 0);
  objc_storeStrong((id *)&self->_multiArrayConstraintCached, 0);
  objc_storeStrong((id *)&self->_valueConstraints, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_stateConstraintCached, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
