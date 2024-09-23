@implementation MLParameterContainer

- (BOOL)setCurrentValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  objc_class *v28;
  void *v29;

  v8 = a3;
  v9 = a4;
  if (v9)
  {
    if (!v8)
      goto LABEL_16;
    -[MLParameterContainer parameterKeys](self, "parameterKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v9);

    if (!v11)
      goto LABEL_16;
    -[MLParameterContainer parameterDescriptions](self, "parameterDescriptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v13 == 0;
    if (v13)
    {
      v15 = objc_opt_class();
      objc_msgSend(v13, "defaultValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_opt_class();

      if (v15 == v17)
        goto LABEL_13;
      objc_msgSend(v13, "defaultValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_opt_class();
      LODWORD(v19) = objc_msgSend(v19, "isSubclassOfClass:", objc_opt_class());

      if (!(_DWORD)v19)
      {
        objc_msgSend(v13, "defaultValue");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_opt_class();
        LODWORD(v22) = objc_msgSend(v22, "isSubclassOfClass:", objc_opt_class());

        if (!(_DWORD)v22)
          goto LABEL_13;
      }
      v23 = (void *)objc_opt_class();
      if ((objc_msgSend(v23, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
      {
LABEL_13:
        objc_msgSend(v13, "numericConstraint");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v24
          || -[MLParameterContainer validateParameterValue:givenConstraint:](self, "validateParameterValue:givenConstraint:", v8, v24))
        {
          -[MLParameterContainer currentParameterValues](self, "currentParameterValues");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v8, v9);

LABEL_16:
          v14 = 1;
          goto LABEL_25;
        }
        if (a5)
        {
          +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("%@ is not a valid value given constraint %@ for key %@"), v8, v24, v9);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }

LABEL_20:
        v14 = 0;
        goto LABEL_25;
      }
      if (!a5)
      {
LABEL_24:

        goto LABEL_25;
      }
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "defaultValue");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Parameter value type %@ does not conform with default value's type %@"), v20, v29);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[MLParameterContainer currentParameterValues](self, "currentParameterValues");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v8, v9);
    }

    goto LABEL_24;
  }
  if (!a5)
    goto LABEL_20;
  +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Failed to set parameter value because of nil key"));
  v14 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

  return v14;
}

- (BOOL)validateParameterValue:(id)a3 givenConstraint:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "enumeratedNumbers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v6, "enumeratedNumbers", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "doubleValue");
          v14 = v13;
          objc_msgSend(v5, "doubleValue");
          if (vabdd_f64(v14, v15) <= 0.0001)
          {

            v16 = 1;
            goto LABEL_16;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v10)
          continue;
        break;
      }
    }

    v16 = 0;
  }
  else
  {
    objc_msgSend(v5, "doubleValue");
    v18 = v17;
    objc_msgSend(v6, "minNumber");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    if (v18 >= v20)
    {
      objc_msgSend(v5, "doubleValue");
      v22 = v21;
      objc_msgSend(v6, "maxNumber");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValue");
      v16 = v22 <= v24;

    }
    else
    {
      v16 = 0;
    }

  }
LABEL_16:

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MLParameterContainer currentParameterValues](self, "currentParameterValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("currentParameterValues"));

  -[MLParameterContainer parameterKeys](self, "parameterKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("parameterKeys"));

  -[MLParameterContainer parameterDescriptions](self, "parameterDescriptions");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("parameterDescriptions"));

}

- (MLParameterContainer)initWithCoder:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  MLParameterContainer *v15;
  MLParameterContainer *v16;
  id v18;
  id v19;
  id v20;
  _QWORD v21[16];

  v21[15] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C99E20];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  v21[2] = objc_opt_class();
  v21[3] = objc_opt_class();
  v21[4] = objc_opt_class();
  v21[5] = objc_opt_class();
  v21[6] = objc_opt_class();
  v21[7] = objc_opt_class();
  v21[8] = objc_opt_class();
  v21[9] = objc_opt_class();
  v21[10] = objc_opt_class();
  v21[11] = objc_opt_class();
  v21[12] = objc_opt_class();
  v21[13] = objc_opt_class();
  v21[14] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  objc_msgSend(v5, "allowedClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v8);

  v20 = 0;
  objc_msgSend(v5, "decodeTopLevelObjectOfClasses:forKey:error:", v6, CFSTR("currentParameterValues"), &v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v20;
  v19 = v10;
  objc_msgSend(v5, "decodeTopLevelObjectOfClasses:forKey:error:", v6, CFSTR("parameterKeys"), &v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v19;

  v18 = v12;
  objc_msgSend(v5, "decodeTopLevelObjectOfClasses:forKey:error:", v6, CFSTR("parameterDescriptions"), &v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v18;
  v15 = objc_alloc_init(MLParameterContainer);
  v16 = v15;
  if (v15)
  {
    -[MLParameterContainer setCurrentParameterValues:](v15, "setCurrentParameterValues:", v9);
    -[MLParameterContainer setParameterKeys:](v16, "setParameterKeys:", v11);
    -[MLParameterContainer setParameterDescriptions:](v16, "setParameterDescriptions:", v13);
  }

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[MLParameterContainer currentParameterValues](self, "currentParameterValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("\ncurrentParameterValues: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v6);

  v7 = (void *)MEMORY[0x1E0CB3940];
  -[MLParameterContainer parameterKeys](self, "parameterKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("\nparameterKeys: %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v9);

  v10 = (void *)MEMORY[0x1E0CB3940];
  -[MLParameterContainer parameterDescriptions](self, "parameterDescriptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("\nparameterDescriptions: %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v12);

  return v3;
}

- (NSMutableDictionary)currentParameterValues
{
  return self->_currentParameterValues;
}

- (void)setCurrentParameterValues:(id)a3
{
  objc_storeStrong((id *)&self->_currentParameterValues, a3);
}

- (NSArray)parameterKeys
{
  return self->_parameterKeys;
}

- (void)setParameterKeys:(id)a3
{
  objc_storeStrong((id *)&self->_parameterKeys, a3);
}

- (NSDictionary)parameterDescriptions
{
  return self->_parameterDescriptions;
}

- (void)setParameterDescriptions:(id)a3
{
  objc_storeStrong((id *)&self->_parameterDescriptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterDescriptions, 0);
  objc_storeStrong((id *)&self->_parameterKeys, 0);
  objc_storeStrong((id *)&self->_currentParameterValues, 0);
}

+ (id)parameterContainerFor:(id)a3 descriptions:(id)a4
{
  id v5;
  id v6;
  MLParameterContainer *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MLParameterContainer);
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  -[MLParameterContainer setCurrentParameterValues:](v7, "setCurrentParameterValues:", v8);

  -[MLParameterContainer setParameterKeys:](v7, "setParameterKeys:", v5);
  -[MLParameterContainer setParameterDescriptions:](v7, "setParameterDescriptions:", v6);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v14, (_QWORD)v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "defaultValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLParameterContainer currentParameterValues](v7, "currentParameterValues");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
