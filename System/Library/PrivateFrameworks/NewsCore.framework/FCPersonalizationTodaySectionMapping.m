@implementation FCPersonalizationTodaySectionMapping

- (FCPersonalizationTodaySectionMapping)initWithPBTodaySectionMapping:(id)a3
{
  id v5;
  FCPersonalizationTodaySectionMapping *v6;
  FCPersonalizationTodaySectionMapping *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *todaySectionIdentifiersToFRGroupViewExposureTypes;
  _QWORD v12[4];
  id v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FCPersonalizationTodaySectionMapping;
  v6 = -[FCPersonalizationTodaySectionMapping init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pbTodaySectionMapping, a3);
    v8 = (void *)MEMORY[0x1E0C99D80];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __70__FCPersonalizationTodaySectionMapping_initWithPBTodaySectionMapping___block_invoke;
    v12[3] = &unk_1E463AA78;
    v13 = v5;
    objc_msgSend(v8, "fc_dictionary:", v12);
    v9 = objc_claimAutoreleasedReturnValue();
    todaySectionIdentifiersToFRGroupViewExposureTypes = v7->_todaySectionIdentifiersToFRGroupViewExposureTypes;
    v7->_todaySectionIdentifiersToFRGroupViewExposureTypes = (NSDictionary *)v9;

  }
  return v7;
}

void __70__FCPersonalizationTodaySectionMapping_initWithPBTodaySectionMapping___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__FCPersonalizationTodaySectionMapping_initWithPBTodaySectionMapping___block_invoke_2;
  v6[3] = &unk_1E4649E30;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __70__FCPersonalizationTodaySectionMapping_initWithPBTodaySectionMapping___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__FCPersonalizationTodaySectionMapping_initWithPBTodaySectionMapping___block_invoke_3;
  v9[3] = &unk_1E463AA30;
  v10 = v3;
  v5 = v3;
  objc_msgSend(v4, "fc_array:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "personalizationSectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

}

void __70__FCPersonalizationTodaySectionMapping_initWithPBTodaySectionMapping___block_invoke_3(uint64_t a1, void *a2)
{
  unint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "groupTypesCount"))
  {
    v3 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "groupTypesAtIndex:", v3));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:atIndexedSubscript:", v4, v3);

      ++v3;
    }
    while (objc_msgSend(*(id *)(a1 + 32), "groupTypesCount") > v3);
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationTodaySectionMapping)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  FCPersonalizationTodaySectionMapping *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("todaySectionMapping"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[FCPersonalizationTodaySectionMapping initWithPBTodaySectionMapping:](self, "initWithPBTodaySectionMapping:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NTPBTodaySectionsMapping *pbTodaySectionMapping;

  pbTodaySectionMapping = self->_pbTodaySectionMapping;
  if (pbTodaySectionMapping)
    objc_msgSend(a3, "encodeObject:forKey:", pbTodaySectionMapping, CFSTR("todaySectionMapping"));
}

- (id)groupViewExposureTypesForTodaySectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FCPersonalizationTodaySectionMapping todaySectionIdentifiersToFRGroupViewExposureTypes](self, "todaySectionIdentifiersToFRGroupViewExposureTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)todaySectionIdentifiersToFRGroupViewExposureTypes
{
  return self->_todaySectionIdentifiersToFRGroupViewExposureTypes;
}

- (void)setTodaySectionIdentifiersToFRGroupViewExposureTypes:(id)a3
{
  objc_storeStrong((id *)&self->_todaySectionIdentifiersToFRGroupViewExposureTypes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_todaySectionIdentifiersToFRGroupViewExposureTypes, 0);
  objc_storeStrong((id *)&self->_pbTodaySectionMapping, 0);
}

@end
