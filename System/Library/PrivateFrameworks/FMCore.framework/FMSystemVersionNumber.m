@implementation FMSystemVersionNumber

- (FMSystemVersionNumber)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Use initWithString:"));
  return -[FMSystemVersionNumber initWithString:](self, "initWithString:", &stru_1E82AADD8);
}

- (FMSystemVersionNumber)initWithString:(id)a3
{
  id v4;
  FMSystemVersionNumber *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *baseLetter;
  void *v10;
  NSString *v11;
  NSString *suffix;
  NSString *v13;
  id v15;
  id v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FMSystemVersionNumber;
  v5 = -[FMSystemVersionNumber init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "scanInteger:", &v5->_baseNumber))
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "uppercaseLetterCharacterSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      objc_msgSend(v6, "scanCharactersFromSet:intoString:", v7, &v16);
      v8 = (NSString *)v16;

      baseLetter = v5->_baseLetter;
      v5->_baseLetter = v8;

      if (objc_msgSend(v6, "scanInteger:", &v5->_buildNumber))
      {
        objc_msgSend(MEMORY[0x1E0CB3500], "lowercaseLetterCharacterSet");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
        objc_msgSend(v6, "scanCharactersFromSet:intoString:", v10, &v15);
        v11 = (NSString *)v15;

        suffix = v5->_suffix;
        v5->_suffix = v11;
        v13 = v11;

      }
    }

  }
  return v5;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p [%@]>"), objc_opt_class(), self, self);
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t baseNumber;
  void *v6;
  int64_t buildNumber;
  void *v8;
  void *v9;

  -[FMSystemVersionNumber suffix](self, "suffix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  baseNumber = self->_baseNumber;
  if (v3)
  {
    -[FMSystemVersionNumber baseLetter](self, "baseLetter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    buildNumber = self->_buildNumber;
    -[FMSystemVersionNumber suffix](self, "suffix");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%lu%@%lu%@"), baseNumber, v6, buildNumber, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu%@%lu"), baseNumber, self->_baseLetter, self->_buildNumber);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (int64_t)compare:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  __CFString *v15;

  v4 = a3;
  v5 = -[FMSystemVersionNumber baseNumber](self, "baseNumber");
  if (v5 < objc_msgSend(v4, "baseNumber"))
  {
LABEL_2:
    v6 = -1;
    goto LABEL_6;
  }
  v7 = -[FMSystemVersionNumber baseNumber](self, "baseNumber");
  if (v7 > objc_msgSend(v4, "baseNumber"))
    goto LABEL_4;
  -[FMSystemVersionNumber baseLetter](self, "baseLetter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "baseLetter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "compare:", v9);

  if (v6)
    goto LABEL_6;
  v11 = -[FMSystemVersionNumber buildNumber](self, "buildNumber");
  if (v11 < objc_msgSend(v4, "buildNumber"))
    goto LABEL_2;
  v12 = -[FMSystemVersionNumber buildNumber](self, "buildNumber");
  if (v12 > objc_msgSend(v4, "buildNumber"))
  {
LABEL_4:
    v6 = 1;
    goto LABEL_6;
  }
  -[FMSystemVersionNumber suffix](self, "suffix");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suffix");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v13)
    v13 = &stru_1E82AADD8;
  if (v14)
    v15 = (__CFString *)v14;
  else
    v15 = &stru_1E82AADD8;
  v6 = -[__CFString compare:](v13, "compare:", v15);

LABEL_6:
  return v6;
}

- (int64_t)baseNumber
{
  return self->_baseNumber;
}

- (void)setBaseNumber:(int64_t)a3
{
  self->_baseNumber = a3;
}

- (NSString)baseLetter
{
  return self->_baseLetter;
}

- (void)setBaseLetter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)buildNumber
{
  return self->_buildNumber;
}

- (void)setBuildNumber:(int64_t)a3
{
  self->_buildNumber = a3;
}

- (NSString)suffix
{
  return self->_suffix;
}

- (void)setSuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_baseLetter, 0);
}

@end
