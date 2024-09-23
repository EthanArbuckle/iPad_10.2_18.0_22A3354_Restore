@implementation MAAutoAssetSetInfoControl

- (id)initClearingAfter:(BOOL)a3
{
  return -[MAAutoAssetSetInfoControl initClearingAfter:limitedToSetIdentifiers:](self, "initClearingAfter:limitedToSetIdentifiers:", a3, 0);
}

- (id)initClearingAfter:(BOOL)a3 limitedToSetIdentifiers:(id)a4
{
  return -[MAAutoAssetSetInfoControl initClearingAfter:limitedToClientDomains:limitedToSetIdentifiers:](self, "initClearingAfter:limitedToClientDomains:limitedToSetIdentifiers:", a3, 0, a4);
}

- (id)initClearingAfter:(BOOL)a3 limitedToClientDomains:(id)a4
{
  return -[MAAutoAssetSetInfoControl initClearingAfter:limitedToClientDomains:limitedToSetIdentifiers:](self, "initClearingAfter:limitedToClientDomains:limitedToSetIdentifiers:", a3, a4, 0);
}

- (id)initClearingAfter:(BOOL)a3 limitedToClientDomains:(id)a4 limitedToSetIdentifiers:(id)a5
{
  id v9;
  id v10;
  MAAutoAssetSetInfoControl *v11;
  id *p_isa;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MAAutoAssetSetInfoControl;
  v11 = -[MAAutoAssetSetInfoControl init](&v14, sel_init);
  p_isa = (id *)&v11->super.isa;
  if (v11)
  {
    v11->_clearingAfter = a3;
    objc_storeStrong((id *)&v11->_limitedToClientDomains, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (MAAutoAssetSetInfoControl)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetSetInfoControl *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *limitedToClientDomains;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *limitedToSetIdentifiers;
  objc_super v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MAAutoAssetSetInfoControl;
  v5 = -[MAAutoAssetSetInfoControl init](&v17, sel_init);
  if (v5)
  {
    v5->_clearingAfter = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("clearingAfter"));
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("limitedToClientDomains"));
    v9 = objc_claimAutoreleasedReturnValue();
    limitedToClientDomains = v5->_limitedToClientDomains;
    v5->_limitedToClientDomains = (NSArray *)v9;

    v11 = objc_alloc(MEMORY[0x1E0C99E60]);
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithArray:", v12);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("limitedToSetIdentifiers"));
    v14 = objc_claimAutoreleasedReturnValue();
    limitedToSetIdentifiers = v5->_limitedToSetIdentifiers;
    v5->_limitedToSetIdentifiers = (NSArray *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetInfoControl clearingAfter](self, "clearingAfter"), CFSTR("clearingAfter"));
  -[MAAutoAssetSetInfoControl limitedToClientDomains](self, "limitedToClientDomains");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("limitedToClientDomains"));

  -[MAAutoAssetSetInfoControl limitedToSetIdentifiers](self, "limitedToSetIdentifiers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("limitedToSetIdentifiers"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  void *v2;
  void *v4;
  const __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0CB3940];
  if (-[MAAutoAssetSetInfoControl clearingAfter](self, "clearingAfter"))
    v5 = CFSTR("Y");
  else
    v5 = CFSTR("N");
  -[MAAutoAssetSetInfoControl limitedToClientDomains](self, "limitedToClientDomains");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[MAAutoAssetSetInfoControl limitedToClientDomains](self, "limitedToClientDomains");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAAutoAssetSetInfoControl _arrayStringsToString:](self, "_arrayStringsToString:", v2);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("N");
  }
  -[MAAutoAssetSetInfoControl limitedToSetIdentifiers](self, "limitedToSetIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[MAAutoAssetSetInfoControl limitedToSetIdentifiers](self, "limitedToSetIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAAutoAssetSetInfoControl _arrayStringsToString:](self, "_arrayStringsToString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("clearingAfter:%@, limitedToClientDomains:%@ limitedToSetIdentifiers:%@"), v5, v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("clearingAfter:%@, limitedToClientDomains:%@ limitedToSetIdentifiers:%@"), v5, v7, CFSTR("N"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v6)
  {

  }
  return v11;
}

- (id)_arrayStringsToString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "appendString:", CFSTR("["));
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      v10 = &stru_1E5D5F930;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "appendFormat:", CFSTR("%@%@"), v10, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++), (_QWORD)v13);
          v10 = CFSTR(",");
        }
        while (v8 != v11);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        v10 = CFSTR(",");
      }
      while (v8);
    }

    objc_msgSend(v5, "appendString:", CFSTR("]"));
  }

  return v5;
}

- (BOOL)clearingAfter
{
  return self->_clearingAfter;
}

- (NSArray)limitedToClientDomains
{
  return self->_limitedToClientDomains;
}

- (NSArray)limitedToSetIdentifiers
{
  return self->_limitedToSetIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limitedToSetIdentifiers, 0);
  objc_storeStrong((id *)&self->_limitedToClientDomains, 0);
}

@end
