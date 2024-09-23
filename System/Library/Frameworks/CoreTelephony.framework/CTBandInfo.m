@implementation CTBandInfo

- (CTBandInfo)init
{
  return -[CTBandInfo initWithSupported:andActiveBands:](self, "initWithSupported:andActiveBands:", 0, 0);
}

- (CTBandInfo)initWithActiveBands:(id)a3
{
  return -[CTBandInfo initWithSupported:andActiveBands:](self, "initWithSupported:andActiveBands:", 0, a3);
}

- (CTBandInfo)initWithSupportedBands:(id)a3
{
  return -[CTBandInfo initWithSupported:andActiveBands:](self, "initWithSupported:andActiveBands:", a3, 0);
}

- (CTBandInfo)initWithSupported:(id)a3 andActiveBands:(id)a4
{
  id v6;
  id v7;
  CTBandInfo *v8;
  uint64_t v9;
  NSMutableDictionary *fActiveBands;
  uint64_t v11;
  NSMutableDictionary *fSupportedBands;
  CTBandInfo *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (v6 && !isBandMapValid(v6) || v7 && !isBandMapValid(v7))
  {
    v13 = 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)CTBandInfo;
    v8 = -[CTBandInfo init](&v15, sel_init);
    if (v8)
    {
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v7);
        v9 = objc_claimAutoreleasedReturnValue();
        fActiveBands = v8->_fActiveBands;
        v8->_fActiveBands = (NSMutableDictionary *)v9;

      }
      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v6);
        v11 = objc_claimAutoreleasedReturnValue();
        fSupportedBands = v8->_fSupportedBands;
        v8->_fSupportedBands = (NSMutableDictionary *)v11;

      }
    }
    self = v8;
    v13 = self;
  }

  return v13;
}

- (BOOL)addActiveBand:(id)a3 forRat:(id)a4
{
  id v6;
  id v7;
  _BOOL4 IsValidBand;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  IsValidBand = sIsValidBand(v7, v6);
  if (IsValidBand)
  {
    -[CTBandInfo fActiveBands](self, "fActiveBands");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[CTBandInfo fActiveBands](self, "fActiveBands");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v11, "addObject:", v6);
      }
      else
      {
        -[CTBandInfo fActiveBands](self, "fActiveBands");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v15, v7);

      }
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dictionaryWithObject:forKey:", v11, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTBandInfo setFActiveBands:](self, "setFActiveBands:", v13);

    }
  }

  return IsValidBand;
}

- (BOOL)addActiveBands:(id)a3 forRat:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = sAreBandsValid(v7, v6);
  if (v8)
  {
    -[CTBandInfo fActiveBands](self, "fActiveBands");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[CTBandInfo fActiveBands](self, "fActiveBands");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v11, "addObjectsFromArray:", v6);
      }
      else
      {
        -[CTBandInfo fActiveBands](self, "fActiveBands");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v15, v7);

      }
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dictionaryWithObject:forKey:", v11, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTBandInfo setFActiveBands:](self, "setFActiveBands:", v13);

    }
  }

  return v8;
}

- (BOOL)addSupportedBand:(id)a3 forRat:(id)a4
{
  id v6;
  id v7;
  _BOOL4 IsValidBand;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  IsValidBand = sIsValidBand(v7, v6);
  if (IsValidBand)
  {
    -[CTBandInfo fSupportedBands](self, "fSupportedBands");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[CTBandInfo fSupportedBands](self, "fSupportedBands");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v11, "addObject:", v6);
      }
      else
      {
        -[CTBandInfo fSupportedBands](self, "fSupportedBands");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v15, v7);

      }
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dictionaryWithObject:forKey:", v11, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTBandInfo setFSupportedBands:](self, "setFSupportedBands:", v13);

    }
  }

  return IsValidBand;
}

- (BOOL)addSupportedBands:(id)a3 forRat:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = sAreBandsValid(v7, v6);
  if (v8)
  {
    -[CTBandInfo fSupportedBands](self, "fSupportedBands");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[CTBandInfo fSupportedBands](self, "fSupportedBands");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v11, "addObjectsFromArray:", v6);
      }
      else
      {
        -[CTBandInfo fSupportedBands](self, "fSupportedBands");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v15, v7);

      }
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dictionaryWithObject:forKey:", v11, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTBandInfo setFSupportedBands:](self, "setFSupportedBands:", v13);

    }
  }

  return v8;
}

- (id)activeBands
{
  void *v2;
  void *v3;

  -[CTBandInfo fActiveBands](self, "fActiveBands");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)activeBandsForRat:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CTBandInfo fActiveBands](self, "fActiveBands");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

- (id)supportedBands
{
  void *v2;
  void *v3;

  -[CTBandInfo fSupportedBands](self, "fSupportedBands");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)supportedBandsForRat:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CTBandInfo fSupportedBands](self, "fSupportedBands");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[CTBandInfo fActiveBands](self, "fActiveBands");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fActiveBands");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToDictionary:", v6))
  {
    -[CTBandInfo fSupportedBands](self, "fSupportedBands");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fSupportedBands");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToDictionary:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p>\n{\n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTBandInfo fActiveBands](self, "fActiveBands");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("ActiveBands\n%@\n"), v4);

  -[CTBandInfo fSupportedBands](self, "fSupportedBands");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("SupportedBands\n%@\n"), v5);

  objc_msgSend(v3, "appendString:", CFSTR("}"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[CTBandInfo fSupportedBands](self, "fSupportedBands");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTBandInfo fActiveBands](self, "fActiveBands");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithSupported:andActiveBands:", v5, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CTBandInfo fActiveBands](self, "fActiveBands");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("activeBand"));

  -[CTBandInfo fSupportedBands](self, "fSupportedBands");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("supportedBand"));

}

- (CTBandInfo)initWithCoder:(id)a3
{
  id v4;
  CTBandInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *fActiveBands;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *fSupportedBands;
  objc_super v17;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CTBandInfo;
  v5 = -[CTBandInfo init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v19[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("activeBand"));
    v9 = objc_claimAutoreleasedReturnValue();
    fActiveBands = v5->_fActiveBands;
    v5->_fActiveBands = (NSMutableDictionary *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    v18[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("supportedBand"));
    v14 = objc_claimAutoreleasedReturnValue();
    fSupportedBands = v5->_fSupportedBands;
    v5->_fSupportedBands = (NSMutableDictionary *)v14;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSMutableDictionary)fActiveBands
{
  return self->_fActiveBands;
}

- (void)setFActiveBands:(id)a3
{
  objc_storeStrong((id *)&self->_fActiveBands, a3);
}

- (NSMutableDictionary)fSupportedBands
{
  return self->_fSupportedBands;
}

- (void)setFSupportedBands:(id)a3
{
  objc_storeStrong((id *)&self->_fSupportedBands, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fSupportedBands, 0);
  objc_storeStrong((id *)&self->_fActiveBands, 0);
}

@end
