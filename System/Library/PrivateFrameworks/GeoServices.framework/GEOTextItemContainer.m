@implementation GEOTextItemContainer

- (GEOTextItemContainer)init
{
  GEOTextItemContainer *result;

  result = (GEOTextItemContainer *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOTextItemContainer)initWithDisplayConfig:(id)a3 textItems:(id)a4
{
  id v7;
  id v8;
  GEOTextItemContainer *v9;
  GEOTextItemContainer *v10;
  uint64_t v11;
  NSArray *textItems;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GEOTextItemContainer;
  v9 = -[GEOTextItemContainer init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_displayConfig, a3);
    v11 = objc_msgSend(v8, "copy");
    textItems = v10->_textItems;
    v10->_textItems = (NSArray *)v11;

  }
  return v10;
}

- (GEOTextItemContainer)initWithTextItemContainer:(id)a3
{
  id *v4;
  GEOTextItemDisplayConfig *v5;
  void *v6;
  GEOTextItemDisplayConfig *v7;
  void *v8;
  uint64_t v9;
  GEOTextItemContainer *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  GEOTextItem *v20;
  GEOTextItem *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v5 = [GEOTextItemDisplayConfig alloc];
  -[GEOPDTextItemContainer displayConf](v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[GEOTextItemDisplayConfig initWithTextItemDisplayConfig:](v5, "initWithTextItemDisplayConfig:", v6);

  -[GEOPDTextItemContainer textItems](v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v10 = 0;
  if (v9 && v7)
  {
    v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[GEOPDTextItemContainer textItems](v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithCapacity:", objc_msgSend(v12, "count"));

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[GEOPDTextItemContainer textItems](v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v24;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v18);
          v20 = [GEOTextItem alloc];
          v21 = -[GEOTextItem initWithTextItem:](v20, "initWithTextItem:", v19, (_QWORD)v23);
          if (v21)
            objc_msgSend(v13, "addObject:", v21);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v16);
    }

    self = -[GEOTextItemContainer initWithDisplayConfig:textItems:](self, "initWithDisplayConfig:textItems:", v7, v13);
    v10 = self;
  }

  return v10;
}

- (GEOTextItemDisplayConfig)displayConfig
{
  return self->_displayConfig;
}

- (NSArray)textItems
{
  return self->_textItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textItems, 0);
  objc_storeStrong((id *)&self->_displayConfig, 0);
}

@end
