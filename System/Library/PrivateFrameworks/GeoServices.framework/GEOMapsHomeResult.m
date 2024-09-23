@implementation GEOMapsHomeResult

- (GEOMapsHomeResult)initWithMapsHomeResult:(id)a3 mapsResults:(id)a4
{
  id *v6;
  id v7;
  GEOMapsHomeResult *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  GEOMapsHomeSection *v18;
  GEOMapsHomeSection *v19;
  uint64_t v20;
  NSArray *sections;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)GEOMapsHomeResult;
  v8 = -[GEOMapsHomeResult init](&v27, sel_init);
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0C99DE8];
    if (v6)
      v10 = objc_msgSend(v6[2], "count");
    else
      v10 = 0;
    objc_msgSend(v9, "arrayWithCapacity:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[GEOPDMapsHomeResult mapsHomeSections](v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16);
          v18 = [GEOMapsHomeSection alloc];
          v19 = -[GEOMapsHomeSection initWithMapsHomeSection:mapsResults:](v18, "initWithMapsHomeSection:mapsResults:", v17, v7, (_QWORD)v23);
          if (v19)
            objc_msgSend(v11, "addObject:", v19);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v14);
    }

    v20 = objc_msgSend(v11, "copy");
    sections = v8->_sections;
    v8->_sections = (NSArray *)v20;

  }
  return v8;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
