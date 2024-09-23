@implementation GEOTransitPaymentMethodSuggestion

- (GEOTransitPaymentMethodSuggestion)initWithSuggestionData:(id)a3
{
  id v5;
  GEOTransitPaymentMethodSuggestion *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *paymentMethodIndices;
  uint64_t v16;
  GEOFormattedString *tipTitle;
  uint64_t v18;
  GEOFormattedString *tipSubtitle;
  uint64_t v20;
  NSArray *educationalScreenAssets;
  uint64_t v22;
  NSArray *educationalScreenPaymentBody;
  uint64_t v24;
  void *educationalScreenTitle;
  id v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  unsigned int v32;
  unsigned int v33;
  objc_super v35;

  v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)GEOTransitPaymentMethodSuggestion;
  v6 = -[GEOTransitPaymentMethodSuggestion init](&v35, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "paymentMethodSuggestionDetails");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v6->marketMUID = 0;
    if (v7)
    {
      if (objc_msgSend(v7, "hasPaymentMethodRegionMuid"))
        v6->marketMUID = objc_msgSend(v8, "paymentMethodRegionMuid");
      v9 = v5;
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "paymentMethodIndexsCount"));
      if (objc_msgSend(v9, "paymentMethodIndexsCount"))
      {
        v11 = 0;
        do
        {
          v12 = objc_msgSend(v9, "paymentMethodIndexs");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v12 + 4 * v11));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v13);

          ++v11;
        }
        while (v11 < objc_msgSend(v9, "paymentMethodIndexsCount"));
      }
      v14 = objc_msgSend(v10, "copy");

      paymentMethodIndices = v6->paymentMethodIndices;
      v6->paymentMethodIndices = (NSArray *)v14;

      objc_msgSend(v8, "suggestionTitle");
      v16 = objc_claimAutoreleasedReturnValue();
      tipTitle = v6->tipTitle;
      v6->tipTitle = (GEOFormattedString *)v16;

      objc_msgSend(v8, "suggestionBody");
      v18 = objc_claimAutoreleasedReturnValue();
      tipSubtitle = v6->tipSubtitle;
      v6->tipSubtitle = (GEOFormattedString *)v18;

      objc_msgSend(v8, "educationalScreenAssets");
      v20 = objc_claimAutoreleasedReturnValue();
      educationalScreenAssets = v6->educationalScreenAssets;
      v6->educationalScreenAssets = (NSArray *)v20;

      objc_msgSend(v8, "educationalScreenPaymentBodys");
      v22 = objc_claimAutoreleasedReturnValue();
      educationalScreenPaymentBody = v6->educationalScreenPaymentBody;
      v6->educationalScreenPaymentBody = (NSArray *)v22;

      objc_msgSend(v8, "educationalScreenHeader");
      v24 = objc_claimAutoreleasedReturnValue();
      educationalScreenTitle = v6->educationalScreenTitle;
      v6->educationalScreenTitle = (GEOFormattedString *)v24;
    }
    else
    {
      v26 = v5;
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v26, "paymentMethodIndexsCount"));
      if (objc_msgSend(v26, "paymentMethodIndexsCount"))
      {
        v28 = 0;
        do
        {
          v29 = objc_msgSend(v26, "paymentMethodIndexs");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v29 + 4 * v28));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v30);

          ++v28;
        }
        while (v28 < objc_msgSend(v26, "paymentMethodIndexsCount"));
      }
      v31 = objc_msgSend(v27, "copy");

      educationalScreenTitle = v6->paymentMethodIndices;
      v6->paymentMethodIndices = (NSArray *)v31;
    }

    *(_QWORD *)&v6->purpose = 0;
    if (objc_msgSend(v5, "hasPurpose"))
    {
      v32 = objc_msgSend(v5, "purpose");
      if (v32 <= 2)
        v6->purpose = v32;
    }
    if (objc_msgSend(v5, "hasType"))
    {
      v33 = objc_msgSend(v5, "type");
      if (v33 <= 4)
        v6->type = v33;
    }
    objc_storeStrong((id *)&v6->_suggestion, a3);

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  GEOTransitPaymentMethodSuggestion *v5;
  id v6;
  GEOTransitPaymentMethodSuggestion *v7;

  v5 = +[GEOTransitPaymentMethodSuggestion allocWithZone:](GEOTransitPaymentMethodSuggestion, "allocWithZone:");
  v6 = -[GEOPBTransitPaymentMethodSuggestion copyWithZone:](self->_suggestion, "copyWithZone:", a3);
  v7 = -[GEOTransitPaymentMethodSuggestion initWithSuggestionData:](v5, "initWithSuggestionData:", v6);

  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR(" GEOTransitPaymentMethodSuggestion:\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" marketMUID:                     '%llu'\n"), -[GEOTransitPaymentMethodSuggestion marketMUID](self, "marketMUID"));
  -[GEOTransitPaymentMethodSuggestion paymentMethodIndices](self, "paymentMethodIndices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" paymentMethodIndices:           '%@'\n"), v4);

  -[GEOTransitPaymentMethodSuggestion tipTitle](self, "tipTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" tipTitle:                       '%@'\n"), v5);

  -[GEOTransitPaymentMethodSuggestion tipSubtitle](self, "tipSubtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" tipSubtitle:                    '%@'\n"), v6);

  -[GEOTransitPaymentMethodSuggestion educationalScreenAssets](self, "educationalScreenAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" educationalScreenAssets:        '%@'\n"), v7);

  -[GEOTransitPaymentMethodSuggestion educationalScreenPaymentBody](self, "educationalScreenPaymentBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" educationalScreenPaymentBody:   '%@'\n"), v8);

  -[GEOTransitPaymentMethodSuggestion educationalScreenTitle](self, "educationalScreenTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" educationalScreenTitle:         '%@'\n"), v9);

  -[GEOPBTransitPaymentMethodSuggestion purposeAsString:](self->_suggestion, "purposeAsString:", -[GEOTransitPaymentMethodSuggestion purpose](self, "purpose"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" purpose:                        '%@'\n"), v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v3);
  return v11;
}

- (unint64_t)marketMUID
{
  return self->marketMUID;
}

- (NSArray)paymentMethodIndices
{
  return self->paymentMethodIndices;
}

- (GEOFormattedString)tipTitle
{
  return self->tipTitle;
}

- (GEOFormattedString)tipSubtitle
{
  return self->tipSubtitle;
}

- (NSArray)educationalScreenAssets
{
  return self->educationalScreenAssets;
}

- (NSArray)educationalScreenPaymentBody
{
  return self->educationalScreenPaymentBody;
}

- (GEOFormattedString)educationalScreenTitle
{
  return self->educationalScreenTitle;
}

- (int)purpose
{
  return self->purpose;
}

- (int)type
{
  return self->type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->educationalScreenTitle, 0);
  objc_storeStrong((id *)&self->educationalScreenPaymentBody, 0);
  objc_storeStrong((id *)&self->educationalScreenAssets, 0);
  objc_storeStrong((id *)&self->tipSubtitle, 0);
  objc_storeStrong((id *)&self->tipTitle, 0);
  objc_storeStrong((id *)&self->paymentMethodIndices, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end
