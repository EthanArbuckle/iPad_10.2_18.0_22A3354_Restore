@implementation CNUIMeContactComparisonStrategyIdentifier

- (void)meContactChangedInStore:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v10[0] = *MEMORY[0x1E0C966E8];
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v5, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v6, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIMeContactComparisonStrategyIdentifier setMeContactIdentifierFound:](self, "setMeContactIdentifierFound:", v8);

}

- (BOOL)isMeContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNUIMeContactComparisonStrategyIdentifier meContactIdentifierFound](self, "meContactIdentifierFound");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (id)meContactIdentifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D13848];
  -[CNUIMeContactComparisonStrategyIdentifier meContactIdentifierFound](self, "meContactIdentifierFound");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4) & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[CNUIMeContactComparisonStrategyIdentifier meContactIdentifierFound](self, "meContactIdentifierFound");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (NSString)meContactIdentifierFound
{
  return self->_meContactIdentifierFound;
}

- (void)setMeContactIdentifierFound:(id)a3
{
  objc_storeStrong((id *)&self->_meContactIdentifierFound, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meContactIdentifierFound, 0);
}

@end
