@implementation MIONumericConstraint

- (MIONumericConstraint)initWithMinimum:(id)a3 maximum:(id)a4
{
  id v7;
  id v8;
  MIONumericConstraint *v9;
  MIONumericConstraint *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MIONumericConstraint;
  v9 = -[MIONumericConstraint init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_minNumber, a3);
    objc_storeStrong((id *)&v10->_maxNumber, a4);
  }

  return v10;
}

- (MIONumericConstraint)initWithEnumeratedNumbers:(id)a3
{
  id v4;
  MIONumericConstraint *v5;
  NSNumber *v6;
  NSNumber *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSNumber *v14;
  NSNumber *v15;
  NSNumber *minNumber;
  NSNumber *v17;
  NSNumber *maxNumber;
  NSNumber *v19;
  uint64_t v20;
  NSSet *enumeratedNumbers;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MIONumericConstraint;
  v5 = -[MIONumericConstraint init](&v27, sel_init);
  if (!objc_msgSend(v4, "count"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("MIONumericConstraint cannot be initialized with the empty enumerated numbers."));
  if (v5)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (-[NSNumber compare:](v6, "compare:", v13, (_QWORD)v23) == NSOrderedDescending)
          {
            v14 = v13;

            v6 = v14;
          }
          if (-[NSNumber compare:](v7, "compare:", v13) == NSOrderedAscending)
          {
            v15 = v13;

            v7 = v15;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v10);
    }

    minNumber = v5->_minNumber;
    v5->_minNumber = v6;
    v17 = v6;

    maxNumber = v5->_maxNumber;
    v5->_maxNumber = v7;
    v19 = v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
    v20 = objc_claimAutoreleasedReturnValue();
    enumeratedNumbers = v5->_enumeratedNumbers;
    v5->_enumeratedNumbers = (NSSet *)v20;

  }
  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("MIONumericConstraint "));
  -[MIONumericConstraint enumeratedNumbers](self, "enumeratedNumbers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MIONumericConstraint enumeratedNumbers](self, "enumeratedNumbers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v7);

  }
  else
  {
    -[MIONumericConstraint minNumber](self, "minNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIONumericConstraint maxNumber](self, "maxNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("min: %@ max: %@"), v5, v6);
  }

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  MIONumericConstraint *v4;
  MIONumericConstraint *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;

  v4 = (MIONumericConstraint *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MIONumericConstraint enumeratedNumbers](self, "enumeratedNumbers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[MIONumericConstraint enumeratedNumbers](self, "enumeratedNumbers");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIONumericConstraint enumeratedNumbers](v5, "enumeratedNumbers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqual:", v8);

        if ((v9 & 1) == 0)
        {
LABEL_11:
          v10 = 0;
          goto LABEL_12;
        }
      }
      else
      {
        -[MIONumericConstraint minNumber](self, "minNumber");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIONumericConstraint minNumber](v5, "minNumber");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (!v13)
          goto LABEL_11;
        -[MIONumericConstraint maxNumber](self, "maxNumber");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIONumericConstraint maxNumber](v5, "maxNumber");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqual:", v15);

        if (!v16)
          goto LABEL_11;
      }
      v10 = 1;
LABEL_12:

      goto LABEL_13;
    }
    v10 = 0;
  }
LABEL_13:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[MIONumericConstraint minNumber](self, "minNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[MIONumericConstraint maxNumber](self, "maxNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[MIONumericConstraint enumeratedNumbers](self, "enumeratedNumbers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (NSNumber)minNumber
{
  return self->_minNumber;
}

- (NSNumber)maxNumber
{
  return self->_maxNumber;
}

- (NSSet)enumeratedNumbers
{
  return self->_enumeratedNumbers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumeratedNumbers, 0);
  objc_storeStrong((id *)&self->_maxNumber, 0);
  objc_storeStrong((id *)&self->_minNumber, 0);
}

@end
