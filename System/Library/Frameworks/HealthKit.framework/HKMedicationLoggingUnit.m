@implementation HKMedicationLoggingUnit

- (HKMedicationLoggingUnit)init
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

- (_QWORD)_initWithMedicationLoggingUnitCode:(void *)a3 fallbackLoggingUnitSingularString:(void *)a4 fallbackLoggingUnitPluralString:
{
  id v7;
  id v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a1)
  {
    if (!a2 && (!v7 || !v8))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithMedicationLoggingUnitCode_fallbackLoggingUnitSingularString_fallbackLoggingUnitPluralString_, a1, CFSTR("HKMedicationLoggingUnit.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fallbackLoggingUnitSingularString != nil && fallbackLoggingUnitPluralString != nil"));

    }
    v17.receiver = a1;
    v17.super_class = (Class)HKMedicationLoggingUnit;
    v10 = objc_msgSendSuper2(&v17, sel_init);
    a1 = v10;
    if (v10)
    {
      v10[1] = a2;
      if (!a2)
      {
        v11 = objc_msgSend(v7, "copy");
        v12 = (void *)a1[2];
        a1[2] = v11;

        v13 = objc_msgSend(v9, "copy");
        v14 = (void *)a1[3];
        a1[3] = v13;

      }
    }
  }

  return a1;
}

- (HKMedicationLoggingUnit)initWithLoggingUnitCode:(unint64_t)a3
{
  return (HKMedicationLoggingUnit *)-[HKMedicationLoggingUnit _initWithMedicationLoggingUnitCode:fallbackLoggingUnitSingularString:fallbackLoggingUnitPluralString:](self, a3, 0, 0);
}

+ (id)loggingUnitByResolvingSingularLoggingUnitString:(id)a3 fallbackPluralLoggingUnitString:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  HKMedicationLoggingUnit *v9;
  HKMedicationLoggingUnit *v10;
  HKMedicationLoggingUnit *v11;

  v6 = a3;
  v7 = a4;
  v8 = +[HKMedicationLoggingUnit _loggingUnitCodeForSingularString:]((uint64_t)a1, v6);
  v9 = [HKMedicationLoggingUnit alloc];
  if (v8)
    v10 = -[HKMedicationLoggingUnit initWithLoggingUnitCode:](v9, "initWithLoggingUnitCode:", v8);
  else
    v10 = (HKMedicationLoggingUnit *)-[HKMedicationLoggingUnit _initWithMedicationLoggingUnitCode:fallbackLoggingUnitSingularString:fallbackLoggingUnitPluralString:](v9, 0, v6, v7);
  v11 = v10;

  return v11;
}

+ (uint64_t)_loggingUnitCodeForSingularString:(uint64_t)a1
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(&unk_1E389D698, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (id)copyByOverridingFallbackLoggingUnitSingularString:(id)a3 fallbackLoggingUnitPluralString:(id)a4
{
  HKMedicationLoggingUnit *v6;

  v6 = self;
  return -[HKMedicationLoggingUnit _initWithMedicationLoggingUnitCode:fallbackLoggingUnitSingularString:fallbackLoggingUnitPluralString:](v6, v6->_loggingUnitCode, a3, a4);
}

- (BOOL)isEqual:(id)a3
{
  HKMedicationLoggingUnit *v4;
  HKMedicationLoggingUnit *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;

  v4 = (HKMedicationLoggingUnit *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[HKMedicationLoggingUnit loggingUnitCode](v5, "loggingUnitCode");
      if (v6 != -[HKMedicationLoggingUnit loggingUnitCode](self, "loggingUnitCode"))
        goto LABEL_16;
      -[HKMedicationLoggingUnit fallbackLoggingUnitSingularString](v5, "fallbackLoggingUnitSingularString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedicationLoggingUnit fallbackLoggingUnitSingularString](self, "fallbackLoggingUnitSingularString");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[HKMedicationLoggingUnit fallbackLoggingUnitSingularString](self, "fallbackLoggingUnitSingularString");
        v10 = objc_claimAutoreleasedReturnValue();
        if (!v10)
          goto LABEL_15;
        v11 = (void *)v10;
        -[HKMedicationLoggingUnit fallbackLoggingUnitSingularString](v5, "fallbackLoggingUnitSingularString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedicationLoggingUnit fallbackLoggingUnitSingularString](self, "fallbackLoggingUnitSingularString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if (!v14)
          goto LABEL_16;
      }
      -[HKMedicationLoggingUnit fallbackLoggingUnitPluralString](v5, "fallbackLoggingUnitPluralString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedicationLoggingUnit fallbackLoggingUnitPluralString](self, "fallbackLoggingUnitPluralString");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v16)
      {

LABEL_20:
        v15 = 1;
        goto LABEL_17;
      }
      v9 = (void *)v16;
      -[HKMedicationLoggingUnit fallbackLoggingUnitPluralString](self, "fallbackLoggingUnitPluralString");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)v17;
        -[HKMedicationLoggingUnit fallbackLoggingUnitPluralString](v5, "fallbackLoggingUnitPluralString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedicationLoggingUnit fallbackLoggingUnitPluralString](self, "fallbackLoggingUnitPluralString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isEqualToString:", v20);

        if ((v21 & 1) != 0)
          goto LABEL_20;
LABEL_16:
        v15 = 0;
LABEL_17:

        goto LABEL_18;
      }
LABEL_15:

      goto LABEL_16;
    }
    v15 = 0;
  }
LABEL_18:

  return v15;
}

- (unint64_t)hash
{
  unint64_t loggingUnitCode;
  NSUInteger v4;

  loggingUnitCode = self->_loggingUnitCode;
  v4 = -[NSString hash](self->_fallbackLoggingUnitSingularString, "hash") ^ loggingUnitCode;
  return v4 ^ -[NSString hash](self->_fallbackLoggingUnitPluralString, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicationLoggingUnit)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  HKMedicationLoggingUnit *v7;
  HKMedicationLoggingUnit *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("LoggingUnitCodeKey"));
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)HKMedicationLoggingUnit;
    v7 = -[HKMedicationLoggingUnit init](&v12, sel_init);
    if (v7)
      v7->_loggingUnitCode = v6;
    self = v7;
    v8 = self;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FallbackLoggingUnitSingularStringKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FallbackLoggingUnitPluralStringKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKMedicationLoggingUnit loggingUnitByResolvingSingularLoggingUnitString:fallbackPluralLoggingUnitString:](HKMedicationLoggingUnit, "loggingUnitByResolvingSingularLoggingUnitString:fallbackPluralLoggingUnitString:", v9, v10);
    v8 = (HKMedicationLoggingUnit *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t loggingUnitCode;
  id v5;

  loggingUnitCode = self->_loggingUnitCode;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", loggingUnitCode, CFSTR("LoggingUnitCodeKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fallbackLoggingUnitSingularString, CFSTR("FallbackLoggingUnitSingularStringKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fallbackLoggingUnitPluralString, CFSTR("FallbackLoggingUnitPluralStringKey"));

}

- (unint64_t)loggingUnitCode
{
  return self->_loggingUnitCode;
}

- (NSString)fallbackLoggingUnitSingularString
{
  return self->_fallbackLoggingUnitSingularString;
}

- (NSString)fallbackLoggingUnitPluralString
{
  return self->_fallbackLoggingUnitPluralString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackLoggingUnitPluralString, 0);
  objc_storeStrong((id *)&self->_fallbackLoggingUnitSingularString, 0);
}

@end
