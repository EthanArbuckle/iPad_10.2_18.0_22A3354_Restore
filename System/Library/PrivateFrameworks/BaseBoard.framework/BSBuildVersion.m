@implementation BSBuildVersion

- (NSString)stringRepresentation
{
  return self->_stringRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minorBuildLetterString, 0);
  objc_storeStrong((id *)&self->_majorBuildLetterString, 0);
  objc_storeStrong((id *)&self->_stringRepresentation, 0);
}

- (BSBuildVersion)init
{
  void *v4;
  void *v5;
  BSBuildVersion *v6;
  void *v8;
  void *v9;

  v4 = (void *)_CFCopySystemVersionDictionary();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSBuildVersion.m"), 24, CFSTR("System version dictionary not found."));

  }
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C9AB90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSBuildVersion.m"), 26, CFSTR("System version string not found."));

  }
  v6 = -[BSBuildVersion initWithString:](self, "initWithString:", v5);

  return v6;
}

- (BSBuildVersion)initWithString:(id)a3
{
  id v4;
  BSBuildVersion *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSString *stringRepresentation;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *majorBuildLetterString;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSString *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  NSString *v31;
  uint64_t v32;
  NSString *v33;
  BSBuildVersion *v34;
  NSString *minorBuildLetterString;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)BSBuildVersion;
  v5 = -[BSBuildVersion init](&v37, sel_init);
  if (!v5)
    goto LABEL_17;
  if (objc_msgSend(v4, "length") >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v6);
    v9 = v8;

    if (v7 != 0x7FFFFFFFFFFFFFFFLL && v9 == 1)
    {
      v10 = objc_msgSend(v4, "copy");
      stringRepresentation = v5->_stringRepresentation;
      v5->_stringRepresentation = (NSString *)v10;

      objc_msgSend(v4, "substringToIndex:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_majorBuildNumber = objc_msgSend(v12, "integerValue");

      objc_msgSend(v4, "substringWithRange:", v7, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      majorBuildLetterString = v5->_majorBuildLetterString;
      v5->_majorBuildLetterString = (NSString *)v14;

      v16 = v7 + 1;
      objc_msgSend(v4, "substringFromIndex:", v7 + 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "rangeOfCharacterFromSet:", v18);
      v21 = v20;

      if (v19 == 0x7FFFFFFFFFFFFFFFLL || v21 != 1)
      {
        if (v19 == 0x7FFFFFFFFFFFFFFFLL)
        {
          minorBuildLetterString = v5->_minorBuildLetterString;
          v5->_minorBuildLetterString = 0;

          objc_msgSend(v4, "substringFromIndex:", v16);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "integerValue");
          goto LABEL_14;
        }
      }
      else if (v19 == objc_msgSend(v17, "length") - 1)
      {
        objc_msgSend(v17, "substringWithRange:", v19, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "copy");
        v24 = v5->_minorBuildLetterString;
        v5->_minorBuildLetterString = (NSString *)v23;

        objc_msgSend(v17, "substringToIndex:", v19);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "integerValue");
LABEL_14:
        v5->_minorBuildNumber = v26;

        goto LABEL_16;
      }

      v5 = 0;
      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "integerValue"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringValue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v4, "isEqual:", v28);

    if (v29)
    {
      v30 = objc_msgSend(v4, "copy");
      v31 = v5->_stringRepresentation;
      v5->_stringRepresentation = (NSString *)v30;

      v32 = objc_msgSend(v4, "integerValue");
      v33 = v5->_majorBuildLetterString;
      v5->_majorBuildNumber = v32;
      v5->_majorBuildLetterString = 0;

      v17 = v5->_minorBuildLetterString;
      v5->_minorBuildNumber = 0;
      v5->_minorBuildLetterString = 0;
LABEL_16:

LABEL_17:
      v5 = v5;
      v34 = v5;
      goto LABEL_18;
    }
  }
  v34 = 0;
LABEL_18:

  return v34;
}

+ (id)fromString:(id)a3
{
  id v3;
  BSBuildVersion *v4;

  v3 = a3;
  v4 = -[BSBuildVersion initWithString:]([BSBuildVersion alloc], "initWithString:", v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  BSBuildVersion *v4;
  BSBuildVersion *v5;
  BSBuildVersion *v6;
  NSString *majorBuildLetterString;
  NSString *v8;
  char v9;
  NSString *minorBuildLetterString;
  NSString *v11;

  v4 = (BSBuildVersion *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (self->_majorBuildNumber == v5->_majorBuildNumber && self->_minorBuildNumber == v5->_minorBuildNumber)
      {
        majorBuildLetterString = self->_majorBuildLetterString;
        v8 = v6->_majorBuildLetterString;
        if (majorBuildLetterString == v8)
          goto LABEL_9;
        v9 = 0;
        if (!majorBuildLetterString || !v8)
        {
LABEL_16:

          goto LABEL_17;
        }
        if (-[NSString isEqualToString:](majorBuildLetterString, "isEqualToString:"))
        {
LABEL_9:
          minorBuildLetterString = self->_minorBuildLetterString;
          v11 = v6->_minorBuildLetterString;
          if (minorBuildLetterString == v11)
          {
            v9 = 1;
          }
          else
          {
            v9 = 0;
            if (minorBuildLetterString && v11)
              v9 = -[NSString isEqualToString:](minorBuildLetterString, "isEqualToString:");
          }
          goto LABEL_16;
        }
      }
      v9 = 0;
      goto LABEL_16;
    }
    v9 = 0;
  }
LABEL_17:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;

  +[BSHashBuilder builder](BSHashBuilder, "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_stringRepresentation);
  v5 = (id)objc_msgSend(v3, "appendInteger:", self->_majorBuildNumber);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_majorBuildLetterString);
  v7 = (id)objc_msgSend(v3, "appendInteger:", self->_minorBuildNumber);
  v8 = (id)objc_msgSend(v3, "appendObject:", self->_minorBuildLetterString);
  v9 = objc_msgSend(v3, "hash");

  return v9;
}

- (BOOL)isSameAs:(id)a3
{
  return -[BSBuildVersion isSameAs:withPrecision:](self, "isSameAs:withPrecision:", a3, 0);
}

- (BOOL)isSameAs:(id)a3 withPrecision:(int64_t)a4
{
  return -[BSBuildVersion _compareAgainstBuildVersion:withPrecision:](self, "_compareAgainstBuildVersion:withPrecision:", a3, a4) == 0;
}

- (BOOL)isBefore:(id)a3
{
  return -[BSBuildVersion isBefore:withPrecision:](self, "isBefore:withPrecision:", a3, 0);
}

- (BOOL)isBefore:(id)a3 withPrecision:(int64_t)a4
{
  return -[BSBuildVersion _compareAgainstBuildVersion:withPrecision:](self, "_compareAgainstBuildVersion:withPrecision:", a3, a4) == -1;
}

- (BOOL)isAfter:(id)a3
{
  return -[BSBuildVersion isAfter:withPrecision:](self, "isAfter:withPrecision:", a3, 0);
}

- (BOOL)isAfter:(id)a3 withPrecision:(int64_t)a4
{
  return -[BSBuildVersion _compareAgainstBuildVersion:withPrecision:](self, "_compareAgainstBuildVersion:withPrecision:", a3, a4) == 1;
}

- (int64_t)_compareAgainstBuildVersion:(id)a3 withPrecision:(int64_t)a4
{
  id v7;
  int64_t majorBuildNumber;
  uint64_t v9;
  int64_t v10;
  NSString *majorBuildLetterString;
  void *v12;
  int64_t minorBuildNumber;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSBuildVersion.m"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("otherBuildVersion"));

  }
  majorBuildNumber = self->_majorBuildNumber;
  v9 = objc_msgSend(v7, "majorBuildNumber");
  if (majorBuildNumber < v9)
    v10 = -1;
  else
    v10 = majorBuildNumber > v9;
  if (!v10)
  {
    if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
LABEL_8:
      v10 = 0;
      goto LABEL_17;
    }
    majorBuildLetterString = self->_majorBuildLetterString;
    objc_msgSend(v7, "majorBuildLetterString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NSString caseInsensitiveCompare:](majorBuildLetterString, "caseInsensitiveCompare:", v12);

    if (!(v10 | a4))
    {
      minorBuildNumber = self->_minorBuildNumber;
      v14 = objc_msgSend(v7, "minorBuildNumber");
      v10 = minorBuildNumber < v14 ? -1 : minorBuildNumber > v14;
      if (!v10)
      {
        if (self->_minorBuildLetterString
          || (objc_msgSend(v7, "minorBuildLetterString"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v15,
              v15))
        {
          -[BSBuildVersion minorBuildLetterString](self, "minorBuildLetterString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "minorBuildLetterString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v16, "caseInsensitiveCompare:", v17);

          goto LABEL_17;
        }
        goto LABEL_8;
      }
    }
  }
LABEL_17:

  return v10;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_stringRepresentation, 0);
  v4 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_majorBuildNumber, CFSTR("majorNumber"));
  objc_msgSend(v3, "appendString:withName:", self->_majorBuildLetterString, CFSTR("majorLetter"));
  v5 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_minorBuildNumber, CFSTR("minorNumber"));
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_minorBuildLetterString, CFSTR("minorLetter"), 1);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)majorBuildNumber
{
  return self->_majorBuildNumber;
}

- (NSString)majorBuildLetterString
{
  return self->_majorBuildLetterString;
}

- (int64_t)minorBuildNumber
{
  return self->_minorBuildNumber;
}

- (NSString)minorBuildLetterString
{
  return self->_minorBuildLetterString;
}

@end
