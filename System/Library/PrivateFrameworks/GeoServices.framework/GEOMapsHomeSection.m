@implementation GEOMapsHomeSection

- (GEOMapsHomeSection)initWithMapsHomeSection:(id)a3 mapsResults:(id)a4
{
  id *v6;
  id v7;
  GEOMapsHomeSection *v8;
  void *v9;
  uint64_t v10;
  NSString *name;
  int v12;
  void *v13;
  id v14;
  GEOCollectionSuggestionResult *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  GEOCollectionSuggestionResult *collectionSuggestionResult;
  _QWORD v21[4];
  id v22;
  objc_super v23;

  v6 = (id *)a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)GEOMapsHomeSection;
  v8 = -[GEOMapsHomeSection init](&v23, sel_init);
  if (v8)
  {
    -[GEOPDMapsHomeSection name](v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v10;

    v12 = -[GEOPDMapsHomeSection sectionType]((uint64_t)v6);
    if (v12 == 1)
    {
      v8->_sectionType = 1;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __58__GEOMapsHomeSection_initWithMapsHomeSection_mapsResults___block_invoke;
      v21[3] = &unk_1E1BFF5C8;
      v14 = v13;
      v22 = v14;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v21);
      if (v6)
      {
        -[GEOPDMapsHomeSection _readCollectionSuggestionResult]((uint64_t)v6);
        if (v6[3])
        {
          v15 = [GEOCollectionSuggestionResult alloc];
          -[GEOPDMapsHomeSection collectionSuggestionResult](v6);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v14, "copy");
          v18 = -[GEOCollectionSuggestionResult initWithCollectionSuggestionResult:mapsResults:](v15, "initWithCollectionSuggestionResult:mapsResults:", v16, v17);
          collectionSuggestionResult = v8->_collectionSuggestionResult;
          v8->_collectionSuggestionResult = (GEOCollectionSuggestionResult *)v18;

        }
      }

    }
    else if (!v12)
    {
      v8->_sectionType = 0;
    }
  }

  return v8;
}

void __58__GEOMapsHomeSection_initWithMapsHomeSection_mapsResults___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "resultType") == 2 && objc_msgSend(v3, "hasCollection"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (NSString)name
{
  return self->_name;
}

- (GEOCollectionSuggestionResult)collectionSuggestionResult
{
  return self->_collectionSuggestionResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionSuggestionResult, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
