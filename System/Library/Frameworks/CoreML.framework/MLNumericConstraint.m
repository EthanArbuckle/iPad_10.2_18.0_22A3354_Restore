@implementation MLNumericConstraint

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MLNumericConstraint minNumber](self, "minNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("minNumber"));

  -[MLNumericConstraint maxNumber](self, "maxNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("maxNumber"));

  -[MLNumericConstraint enumeratedNumbers](self, "enumeratedNumbers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("enumeratedNumbers"));

}

- (MLNumericConstraint)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MLNumericConstraint *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("minNumber"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("maxNumber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("enumeratedNumbers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    +[MLNumericConstraint numericConstraintWithEnumeratedNumbers:](MLNumericConstraint, "numericConstraintWithEnumeratedNumbers:", v7);
  else
    +[MLNumericConstraint numericConstraintWithMinNumber:maxNumber:](MLNumericConstraint, "numericConstraintWithMinNumber:maxNumber:", v5, v6);
  v8 = (MLNumericConstraint *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  void *v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[MLNumericConstraint minNumber](self, "minNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("\nminValue: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v6);

  v7 = (void *)MEMORY[0x1E0CB3940];
  -[MLNumericConstraint maxNumber](self, "maxNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("\nmaxValue: %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v9);

  -[MLNumericConstraint enumeratedNumbers](self, "enumeratedNumbers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[MLNumericConstraint enumeratedNumbers](self, "enumeratedNumbers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("\nenumeratedNumbers: %@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v13);

  }
  return v3;
}

- (NSNumber)minNumber
{
  return self->_minNumber;
}

- (void)setMinNumber:(id)a3
{
  objc_storeStrong((id *)&self->_minNumber, a3);
}

- (NSNumber)maxNumber
{
  return self->_maxNumber;
}

- (void)setMaxNumber:(id)a3
{
  objc_storeStrong((id *)&self->_maxNumber, a3);
}

- (NSSet)enumeratedNumbers
{
  return self->_enumeratedNumbers;
}

- (void)setEnumeratedNumbers:(id)a3
{
  objc_storeStrong((id *)&self->_enumeratedNumbers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumeratedNumbers, 0);
  objc_storeStrong((id *)&self->_maxNumber, 0);
  objc_storeStrong((id *)&self->_minNumber, 0);
}

+ (MLNumericConstraint)numericConstraintWithMinNumber:(id)a3 maxNumber:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  MLNumericConstraint *v10;
  MLNumericConstraint *v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "doubleValue");
  v8 = v7;
  objc_msgSend(v6, "doubleValue");
  if (v8 <= v9)
  {
    v11 = objc_alloc_init(MLNumericConstraint);
    v10 = v11;
    if (v11)
    {
      -[MLNumericConstraint setMinNumber:](v11, "setMinNumber:", v5);
      -[MLNumericConstraint setMaxNumber:](v10, "setMaxNumber:", v6);
      -[MLNumericConstraint setEnumeratedNumbers:](v10, "setEnumeratedNumbers:", 0);
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (MLNumericConstraint)numericConstraintWithEnumeratedNumbers:(id)a3
{
  id v3;
  void *v4;
  MLNumericConstraint *v5;
  MLNumericConstraint *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = v3;
  if (v3 && !objc_msgSend(v3, "count"))
  {
    v6 = 0;
  }
  else
  {
    v5 = objc_alloc_init(MLNumericConstraint);
    v6 = v5;
    if (v5)
    {
      -[MLNumericConstraint setEnumeratedNumbers:](v5, "setEnumeratedNumbers:", v4);
      objc_msgSend(v4, "valueForKeyPath:", CFSTR("@min.doubleValue"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLNumericConstraint setMinNumber:](v6, "setMinNumber:", v7);

      objc_msgSend(v4, "valueForKeyPath:", CFSTR("@max.doubleValue"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLNumericConstraint setMaxNumber:](v6, "setMaxNumber:", v8);

    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
