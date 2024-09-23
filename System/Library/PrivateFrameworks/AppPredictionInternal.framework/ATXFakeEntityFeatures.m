@implementation ATXFakeEntityFeatures

- (ATXFakeEntityFeatures)init
{
  ATXFakeEntityFeatures *v2;
  uint64_t v3;
  NSMutableArray *identifiersAndDates;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXFakeEntityFeatures;
  v2 = -[ATXFakeEntityFeatures init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    identifiersAndDates = v2->_identifiersAndDates;
    v2->_identifiersAndDates = (NSMutableArray *)v3;

  }
  return v2;
}

- (id)initFromJSON:(id)a3
{
  id v4;
  ATXFakeEntityFeatures *v5;
  uint64_t v6;
  NSMutableArray *identifiersAndDates;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXFakeEntityFeatures;
  v5 = -[ATXFakeEntityFeatures init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifiersAndDates"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifiersAndDates = v5->_identifiersAndDates;
    v5->_identifiersAndDates = (NSMutableArray *)v6;

  }
  return v5;
}

- (id)jsonRepresentation
{
  NSMutableArray *identifiersAndDates;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  identifiersAndDates = self->_identifiersAndDates;
  v4 = CFSTR("identifiersAndDates");
  v5[0] = identifiersAndDates;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSMutableArray)identifiersAndDates
{
  return self->_identifiersAndDates;
}

- (void)setIdentifiersAndDates:(id)a3
{
  objc_storeStrong((id *)&self->_identifiersAndDates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersAndDates, 0);
}

@end
