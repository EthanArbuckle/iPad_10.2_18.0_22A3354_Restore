@implementation GEOPhoneNumberResolutionResultSet

- (GEOPhoneNumberResolutionResultSet)initWithPNRResultSet:(id)a3
{
  id v5;
  GEOPhoneNumberResolutionResultSet *v6;
  GEOPhoneNumberResolutionResultSet *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOPhoneNumberResolutionResultSet;
  v6 = -[GEOPhoneNumberResolutionResultSet init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pnrResultSet, a3);

  return v7;
}

- (id)description
{
  return (id)-[PNRPhoneNumberResolutionResultSet description](self->_pnrResultSet, "description");
}

- (void)enumerateResolutionsUsingBlock:(id)a3
{
  id v4;
  PNRPhoneNumberResolutionResultSet *pnrResultSet;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  pnrResultSet = self->_pnrResultSet;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__GEOPhoneNumberResolutionResultSet_enumerateResolutionsUsingBlock___block_invoke;
  v7[3] = &unk_1E1C23AE8;
  v8 = v4;
  v6 = v4;
  -[PNRPhoneNumberResolutionResultSet enumerateResolutionsUsingBlock:](pnrResultSet, "enumerateResolutionsUsingBlock:", v7);

}

void __68__GEOPhoneNumberResolutionResultSet_enumerateResolutionsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  GEOPhoneNumberResolutionResult *v9;
  GEOPhoneNumberResolutionResult *v10;
  void *v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "locationName");
  v9 = (GEOPhoneNumberResolutionResult *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [GEOPhoneNumberResolutionResult alloc];
    objc_msgSend(v7, "locationName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[GEOPhoneNumberResolutionResult initWithLocationName:](v10, "initWithLocationName:", v11);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pnrResultSet, 0);
}

@end
