@implementation GEOAllGuidesLocationsViewResult

- (GEOAllGuidesLocationsViewResult)initWithAllGuidesLocationsViewResult:(id)a3 mapsResults:(id)a4
{
  id v7;
  id v8;
  GEOAllGuidesLocationsViewResult *v9;
  GEOAllGuidesLocationsViewResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOAllGuidesLocationsViewResult;
  v9 = -[GEOAllGuidesLocationsViewResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mapsResults, a4);
    objc_storeStrong((id *)&v10->_viewResult, a3);
  }

  return v10;
}

- (NSString)title
{
  return -[GEOPDAllGuidesLocationsViewResult header]((id *)&self->_viewResult->super.super.isa);
}

- (NSArray)sections
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  GEOAllGuidesLocationsViewResult *v12;
  id v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[GEOPDAllGuidesLocationsViewResult allGuidesLocationsSections]((id *)&self->_viewResult->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __43__GEOAllGuidesLocationsViewResult_sections__block_invoke;
  v11 = &unk_1E1C0A070;
  v12 = self;
  v13 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v8);

  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);
  return (NSArray *)v6;
}

void __43__GEOAllGuidesLocationsViewResult_sections__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  GEOAllGuidesLocationsSection *v4;
  GEOAllGuidesLocationsSection *v5;

  v3 = a2;
  v5 = -[GEOAllGuidesLocationsSection initWithAllGuidesLocationSection:mapsResults:]([GEOAllGuidesLocationsSection alloc], "initWithAllGuidesLocationSection:mapsResults:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    v4 = v5;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsResults, 0);
  objc_storeStrong((id *)&self->_viewResult, 0);
}

@end
