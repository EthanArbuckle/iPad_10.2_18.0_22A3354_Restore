@implementation HKCodedValueCollection

+ (id)indexableKeyPathsWithPrefix:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[HKCodedValue indexableKeyPathsWithPrefix:](HKCodedValue, "indexableKeyPathsWithPrefix:", CFSTR("codedValues"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKConceptIndexUtilities keyPaths:prefix:](HKConceptIndexUtilities, "keyPaths:prefix:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)codedValueCollectionWithCodedValues:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCodedValues:", v4);

  return v5;
}

- (HKCodedValueCollection)init
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

- (HKCodedValueCollection)initWithCodedValues:(id)a3
{
  id v4;
  HKCodedValueCollection *v5;
  uint64_t v6;
  NSArray *codedValues;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKCodedValueCollection;
  v5 = -[HKCodedValueCollection init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    codedValues = v5->_codedValues;
    v5->_codedValues = (NSArray *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKCodedValueCollection)initWithCoder:(id)a3
{
  id v4;
  HKCodedValueCollection *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *codedValues;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKCodedValueCollection;
  v5 = -[HKCodedValueCollection init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("CodedValues"));
    v9 = objc_claimAutoreleasedReturnValue();
    codedValues = v5->_codedValues;
    v5->_codedValues = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HKCodedValueCollection codedValues](self, "codedValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CodedValues"));

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HKCodedValueCollection codedValues](self, "codedValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HKCodedValueCollection *v4;
  HKCodedValueCollection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;

  v4 = (HKCodedValueCollection *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HKCodedValueCollection codedValues](self, "codedValues");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKCodedValueCollection codedValues](v5, "codedValues");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        LOBYTE(v11) = 0;
      }
      else
      {
        -[HKCodedValueCollection codedValues](v5, "codedValues");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[HKCodedValueCollection codedValues](self, "codedValues");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKCodedValueCollection codedValues](v5, "codedValues");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10) ^ 1;

        }
        else
        {
          LOBYTE(v11) = 1;
        }

      }
      v12 = v11 ^ 1;

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  +[HKConceptIndexUtilities firstComponentForKeyPath:error:](HKConceptIndexUtilities, "firstComponentForKeyPath:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    goto LABEL_7;
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("codedValues")))
  {
    +[HKConceptIndexUtilities assignError:forInvalidKeyPath:inClass:](HKConceptIndexUtilities, "assignError:forInvalidKeyPath:inClass:", a4, v6, objc_opt_class());
LABEL_7:
    v10 = 0;
    goto LABEL_11;
  }
  if (self->_codedValues)
  {
    +[HKConceptIndexUtilities keyPathRemovingFirstComponentFromKeyPath:error:](HKConceptIndexUtilities, "keyPathRemovingFirstComponentFromKeyPath:error:", v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[NSArray codingsForKeyPath:error:](self->_codedValues, "codingsForKeyPath:error:", v9, a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
LABEL_11:

  return v10;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *codedValues;
  BOOL v14;
  BOOL v15;

  v8 = a3;
  v9 = a4;
  +[HKConceptIndexUtilities firstComponentForKeyPath:error:](HKConceptIndexUtilities, "firstComponentForKeyPath:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_7;
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("codedValues")))
  {
    +[HKConceptIndexUtilities assignError:forInvalidKeyPath:inClass:](HKConceptIndexUtilities, "assignError:forInvalidKeyPath:inClass:", a5, v9, objc_opt_class());
LABEL_7:
    v15 = 0;
    goto LABEL_12;
  }
  +[HKConceptIndexUtilities keyPathRemovingFirstComponentFromKeyPath:error:](HKConceptIndexUtilities, "keyPathRemovingFirstComponentFromKeyPath:error:", v9, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    codedValues = self->_codedValues;
    if (codedValues)
      v14 = -[NSArray applyConcepts:forKeyPath:error:](codedValues, "applyConcepts:forKeyPath:error:", v8, v12, a5);
    else
      v14 = HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 0, (uint64_t)v9, (uint64_t)a5);
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }

LABEL_12:
  return v15;
}

- (NSArray)codedValues
{
  return self->_codedValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codedValues, 0);
}

@end
