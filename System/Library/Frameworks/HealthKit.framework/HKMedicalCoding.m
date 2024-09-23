@implementation HKMedicalCoding

+ (id)ICD10CodingWithCode:(id)a3 displayString:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCoding+ICD10.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("code"));

  }
  +[HKMedicalCodingSystem ICD10System](HKMedicalCodingSystem, "ICD10System");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCoding medicalCodingWithSystem:codingVersion:code:displayString:](HKMedicalCoding, "medicalCodingWithSystem:codingVersion:code:displayString:", v9, 0, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)ICD10CodingWithCode:(id)a3
{
  return (id)objc_msgSend(a1, "ICD10CodingWithCode:displayString:", a3, 0);
}

+ (id)ucum_codingWithCode:(id)a3 displayString:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCoding+UCUM.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("code"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCoding+UCUM.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayString"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  +[HKMedicalCodingSystem UCUMSystem](HKMedicalCodingSystem, "UCUMSystem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCoding medicalCodingWithSystem:codingVersion:code:displayString:](HKMedicalCoding, "medicalCodingWithSystem:codingVersion:code:displayString:", v10, 0, v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (HKMedicalCoding)ucum_meterUnitCoding
{
  return (HKMedicalCoding *)objc_msgSend(a1, "ucum_codingWithCode:displayString:", CFSTR("m"), CFSTR("meter"));
}

+ (HKMedicalCoding)ucum_centimeterUnitCoding
{
  return (HKMedicalCoding *)objc_msgSend(a1, "ucum_codingWithCode:displayString:", CFSTR("cm"), CFSTR("centimeter"));
}

+ (id)LOINCCodingWithCode:(id)a3 displayString:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCoding+LOINC.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("code"));

  }
  +[HKMedicalCodingSystem LOINCCodeSystem](HKMedicalCodingSystem, "LOINCCodeSystem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCoding medicalCodingWithSystem:codingVersion:code:displayString:](HKMedicalCoding, "medicalCodingWithSystem:codingVersion:code:displayString:", v9, 0, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)LOINCCodingWithCode:(id)a3
{
  return (id)objc_msgSend(a1, "LOINCCodingWithCode:displayString:", a3, 0);
}

+ (HKMedicalCoding)loinc_diastolicBloodPressureCoding
{
  return (HKMedicalCoding *)objc_msgSend(a1, "LOINCCodingWithCode:", CFSTR("8462-4"));
}

+ (HKMedicalCoding)loinc_systolicBloodPressureCoding
{
  return (HKMedicalCoding *)objc_msgSend(a1, "LOINCCodingWithCode:", CFSTR("8480-6"));
}

+ (id)ICD9CodingWithCode:(id)a3 displayString:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCoding+ICD9CM.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("code"));

  }
  +[HKMedicalCodingSystem ICD9System](HKMedicalCodingSystem, "ICD9System");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCoding medicalCodingWithSystem:codingVersion:code:displayString:](HKMedicalCoding, "medicalCodingWithSystem:codingVersion:code:displayString:", v9, 0, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)ICD9CodingWithCode:(id)a3
{
  return (id)objc_msgSend(a1, "ICD9CodingWithCode:displayString:", a3, 0);
}

+ (id)RxNormCodingWithCode:(id)a3 displayString:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCoding+RxNorm.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("code"));

  }
  +[HKMedicalCodingSystem RxNormCodeSystem](HKMedicalCodingSystem, "RxNormCodeSystem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCoding medicalCodingWithSystem:codingVersion:code:displayString:](HKMedicalCoding, "medicalCodingWithSystem:codingVersion:code:displayString:", v9, 0, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)RxNormCodingWithCode:(id)a3
{
  return (id)objc_msgSend(a1, "RxNormCodingWithCode:displayString:", a3, 0);
}

+ (id)text_codingWithDisplayString:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCoding+Text.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayString"));

  }
  +[HKMedicalCodingSystem textSystem](HKMedicalCodingSystem, "textSystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCoding medicalCodingWithSystem:codingVersion:code:displayString:](HKMedicalCoding, "medicalCodingWithSystem:codingVersion:code:displayString:", v6, CFSTR("1"), v5, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)SNOMEDCodingWithCode:(id)a3 displayString:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCoding+SNOMED.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("code"));

  }
  +[HKMedicalCodingSystem SNOMEDCodeSystem](HKMedicalCodingSystem, "SNOMEDCodeSystem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCoding medicalCodingWithSystem:codingVersion:code:displayString:](HKMedicalCoding, "medicalCodingWithSystem:codingVersion:code:displayString:", v9, 0, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)SNOMEDCodingWithCode:(id)a3
{
  return (id)objc_msgSend(a1, "SNOMEDCodingWithCode:displayString:", a3, 0);
}

+ (id)appleOntologyCodingWithRawIdentifier:(int64_t)a3
{
  void *v3;
  HKMedicalCoding *v4;
  void *v5;
  HKMedicalCoding *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), a3);
  v4 = [HKMedicalCoding alloc];
  +[HKMedicalCodingSystem appleOntologySystem](HKMedicalCodingSystem, "appleOntologySystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKMedicalCoding initWithCodingSystem:codingVersion:code:displayString:](v4, "initWithCodingSystem:codingVersion:code:displayString:", v5, 0, v3, 0);

  return v6;
}

+ (id)appleOntologyCodingWithIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "appleOntologyCodingWithRawIdentifier:", objc_msgSend(a3, "rawIdentifier"));
}

+ (HKMedicalCoding)medicalCodingWithSystem:(id)a3 codingVersion:(id)a4 code:(id)a5 displayString:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCodingSystem:codingVersion:code:displayString:", v13, v12, v11, v10);

  return (HKMedicalCoding *)v14;
}

- (HKMedicalCoding)initWithCodingSystem:(id)a3 codingVersion:(id)a4 code:(id)a5 displayString:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HKMedicalCoding *v14;
  uint64_t v15;
  HKMedicalCodingSystem *codingSystem;
  uint64_t v17;
  NSString *codingVersion;
  uint64_t v19;
  NSString *code;
  uint64_t v21;
  NSString *displayString;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  objc_super v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v29.receiver = self;
  v29.super_class = (Class)HKMedicalCoding;
  v14 = -[HKMedicalCoding init](&v29, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    codingSystem = v14->_codingSystem;
    v14->_codingSystem = (HKMedicalCodingSystem *)v15;

    v17 = objc_msgSend(v11, "copy");
    codingVersion = v14->_codingVersion;
    v14->_codingVersion = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    code = v14->_code;
    v14->_code = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    displayString = v14->_displayString;
    v14->_displayString = (NSString *)v21;

    -[HKMedicalCoding _validateConfiguration](v14, "_validateConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v25 = (void *)MEMORY[0x1E0C99DA0];
      v26 = *MEMORY[0x1E0C99778];
      objc_msgSend(v23, "localizedDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "raise:format:", v26, CFSTR("%@"), v27);

    }
  }

  return v14;
}

- (HKMedicalCoding)init
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

- (BOOL)isEquivalent:(id)a3
{
  HKMedicalCoding *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;

  v4 = (HKMedicalCoding *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HKMedicalCoding codingSystem](v4, "codingSystem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKMedicalCodingSystem LOINCCodeSystem](HKMedicalCodingSystem, "LOINCCodeSystem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v5, "isEqual:", v6);

      if ((_DWORD)v7)
      {
        -[HKMedicalCoding codingSystem](self, "codingSystem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedicalCoding codingSystem](v4, "codingSystem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 == v9)
        {
          -[HKMedicalCoding code](self, "code", v22, v24);
        }
        else
        {
          -[HKMedicalCoding codingSystem](v4, "codingSystem");
          v10 = objc_claimAutoreleasedReturnValue();
          if (!v10)
          {
            v13 = 0;
LABEL_21:

            goto LABEL_22;
          }
          v7 = (void *)v10;
          -[HKMedicalCoding codingSystem](self, "codingSystem");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKMedicalCoding codingSystem](v4, "codingSystem");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v11, "isEqual:", v12))
          {
            v13 = 0;
LABEL_20:

            goto LABEL_21;
          }
          -[HKMedicalCoding code](self, "code", v12, v11);
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedicalCoding code](v4, "code");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v14 == (void *)v15)
        {

          v13 = 1;
        }
        else
        {
          v16 = (void *)v15;
          -[HKMedicalCoding code](v4, "code");
          v17 = objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v18 = (void *)v17;
            -[HKMedicalCoding code](self, "code");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKMedicalCoding code](v4, "code");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v19, "isEqual:", v20);

          }
          else
          {

            v13 = 0;
          }
        }
        v12 = v23;
        v11 = v25;
        if (v8 == v9)
          goto LABEL_21;
        goto LABEL_20;
      }
      v13 = -[HKMedicalCoding isEqual:](self, "isEqual:", v4);
    }
    else
    {
      v13 = 0;
    }
  }
LABEL_22:

  return v13;
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
  -[HKMedicalCoding codingSystem](self, "codingSystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalCoding codingVersion](self, "codingVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalCoding code](self, "code");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalCoding displayString](self, "displayString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p, system='%@', version=%@, code='%@', displayString='%@'>"), v5, self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_validateConfiguration
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  HKMedicalCoding *v4;
  HKMedicalCoding *v5;
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
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;

  v4 = (HKMedicalCoding *)a3;
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
      -[HKMedicalCoding codingSystem](v5, "codingSystem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedicalCoding codingSystem](self, "codingSystem");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[HKMedicalCoding codingSystem](self, "codingSystem");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_24;
        v10 = (void *)v9;
        -[HKMedicalCoding codingSystem](v5, "codingSystem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedicalCoding codingSystem](self, "codingSystem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (!v13)
          goto LABEL_25;
      }
      -[HKMedicalCoding codingVersion](v5, "codingVersion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedicalCoding codingVersion](self, "codingVersion");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v15)
      {

      }
      else
      {
        v8 = (void *)v15;
        -[HKMedicalCoding codingVersion](self, "codingVersion");
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
          goto LABEL_24;
        v17 = (void *)v16;
        -[HKMedicalCoding codingVersion](v5, "codingVersion");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedicalCoding codingVersion](self, "codingVersion");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqualToString:", v19);

        if (!v20)
          goto LABEL_25;
      }
      -[HKMedicalCoding code](v5, "code");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedicalCoding code](self, "code");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v21)
      {

      }
      else
      {
        v8 = (void *)v21;
        -[HKMedicalCoding code](self, "code");
        v22 = objc_claimAutoreleasedReturnValue();
        if (!v22)
          goto LABEL_24;
        v23 = (void *)v22;
        -[HKMedicalCoding code](v5, "code");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedicalCoding code](self, "code");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "isEqualToString:", v25);

        if (!v26)
          goto LABEL_25;
      }
      -[HKMedicalCoding displayString](v5, "displayString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedicalCoding displayString](self, "displayString");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v27)
      {

LABEL_29:
        v14 = 1;
        goto LABEL_26;
      }
      v8 = (void *)v27;
      -[HKMedicalCoding displayString](self, "displayString");
      v28 = objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        v29 = (void *)v28;
        -[HKMedicalCoding displayString](v5, "displayString");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedicalCoding displayString](self, "displayString");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v30, "isEqualToString:", v31);

        if ((v32 & 1) != 0)
          goto LABEL_29;
LABEL_25:
        v14 = 0;
LABEL_26:

        goto LABEL_27;
      }
LABEL_24:

      goto LABEL_25;
    }
    v14 = 0;
  }
LABEL_27:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_code, "hash");
  v4 = -[NSString hash](self->_displayString, "hash") ^ v3;
  if (!v4)
    v4 = -[NSString hash](self->_displayString, "hash");
  v5 = -[HKMedicalCodingSystem hash](self->_codingSystem, "hash");
  return v5 ^ v4 ^ -[NSString hash](self->_codingVersion, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicalCoding)initWithCoder:(id)a3
{
  id v4;
  HKMedicalCoding *v5;
  uint64_t v6;
  HKMedicalCodingSystem *codingSystem;
  uint64_t v8;
  NSString *codingVersion;
  uint64_t v10;
  NSString *code;
  uint64_t v12;
  NSString *displayString;
  void *v14;
  HKMedicalCoding *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKMedicalCoding;
  v5 = -[HKMedicalCoding init](&v17, sel_init);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CodingSystem"));
  v6 = objc_claimAutoreleasedReturnValue();
  codingSystem = v5->_codingSystem;
  v5->_codingSystem = (HKMedicalCodingSystem *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CodingVersion"));
  v8 = objc_claimAutoreleasedReturnValue();
  codingVersion = v5->_codingVersion;
  v5->_codingVersion = (NSString *)v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Code"));
  v10 = objc_claimAutoreleasedReturnValue();
  code = v5->_code;
  v5->_code = (NSString *)v10;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DisplayString"));
  v12 = objc_claimAutoreleasedReturnValue();
  displayString = v5->_displayString;
  v5->_displayString = (NSString *)v12;

  -[HKMedicalCoding _validateConfiguration](v5, "_validateConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    v15 = 0;
  else
LABEL_4:
    v15 = v5;

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  HKMedicalCodingSystem *codingSystem;
  id v5;

  codingSystem = self->_codingSystem;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", codingSystem, CFSTR("CodingSystem"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_codingVersion, CFSTR("CodingVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_code, CFSTR("Code"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayString, CFSTR("DisplayString"));

}

- (HKMedicalCodingSystem)codingSystem
{
  return self->_codingSystem;
}

- (NSString)codingVersion
{
  return self->_codingVersion;
}

- (NSString)code
{
  return self->_code;
}

- (NSString)displayString
{
  return self->_displayString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_code, 0);
  objc_storeStrong((id *)&self->_codingVersion, 0);
  objc_storeStrong((id *)&self->_codingSystem, 0);
}

@end
