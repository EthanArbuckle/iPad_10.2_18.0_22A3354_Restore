@implementation GEOPlaceDetailsModuleConfiguration

- (GEOPlaceDetailsModuleConfiguration)initWithPlaceInfoModuleConfiguration:(id)a3
{
  id v5;
  GEOPlaceDetailsModuleConfiguration *v6;
  GEOPlaceDetailsModuleConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOPlaceDetailsModuleConfiguration;
  v6 = -[GEOPlaceDetailsModuleConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_placeInfosModuleConfig, a3);

  return v7;
}

- (int)locationStyle
{
  uint64_t v2;
  int v4;

  -[GEOPDPlaceInfosModuleConfiguration locationInfoItem]((id *)&self->_placeInfosModuleConfig->super.super.isa);
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2 && (*(_BYTE *)(v2 + 20) & 1) != 0)
  {
    v4 = *(_DWORD *)(v2 + 16);

    if (v4 == 1)
      return 1;
    else
      return 2 * (v4 == 3);
  }
  else
  {

    return 0;
  }
}

- (NSArray)factoidReferences
{
  id v3;
  id *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  GEOFactoidReference *v11;
  GEOFactoidReference *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[GEOPDPlaceInfosModuleConfiguration factoidInfoItem]((id *)&self->_placeInfosModuleConfig->super.super.isa);
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDFactoidInfoItem factoidReferences](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = [GEOFactoidReference alloc];
        v12 = -[GEOFactoidReference initWithFactoidReference:](v11, "initWithFactoidReference:", v10, (_QWORD)v15);
        if (v12)
          objc_msgSend(v3, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v13;
}

- (int)attributionStyle
{
  return -[GEOPDPlaceInfosModuleConfiguration attributionType]((uint64_t)self->_placeInfosModuleConfig) == 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeInfosModuleConfig, 0);
}

@end
