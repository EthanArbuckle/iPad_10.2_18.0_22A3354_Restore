@implementation GEOPlaceRibbonConfiguration

- (GEOPlaceRibbonConfiguration)initWithRibbonConfiguration:(id)a3
{
  id v5;
  GEOPlaceRibbonConfiguration *v6;
  GEOPlaceRibbonConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOPlaceRibbonConfiguration;
  v6 = -[GEOPlaceRibbonConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ribbonConfig, a3);
    -[GEOPlaceRibbonConfiguration _buildRibbonItems](v7, "_buildRibbonItems");
  }

  return v7;
}

- (void)_buildRibbonItems
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id *v10;
  uint64_t v11;
  NSObject *v12;
  const __CFString *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSArray *v18;
  NSArray *ribbonItems;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  const __CFString *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  GEOGetPlaceCardLayoutLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_INFO, "Building ribbon items", buf, 2u);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[GEOPDPlaceRibbonConfiguration ribbonItems]((id *)&self->_ribbonConfig->super.super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v11 = -[GEOPDRibbonItem type]((uint64_t)v10);
        switch((int)v11)
        {
          case 0:
            GEOGetPlaceCardLayoutLog();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_INFO, "We have a ribbon type unknown", buf, 2u);
            }
            goto LABEL_22;
          case 1:
          case 2:
          case 4:
          case 5:
          case 7:
          case 8:
          case 9:
            GEOGetPlaceCardLayoutLog();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              v13 = CFSTR("RIBBON_ITEM_TYPE_UNKNOWN");
              if ((v11 - 1) <= 8)
                v13 = off_1E1C09D78[(int)v11 - 1];
              *(_DWORD *)buf = 138412290;
              v25 = v13;
              _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_INFO, "Adding normal ribbon item of type %@", buf, 0xCu);
            }

            -[GEOPlaceRibbonConfiguration _addRegularRibbonEntryForType:toArray:](self, "_addRegularRibbonEntryForType:toArray:", v11, v3);
            continue;
          case 3:
            GEOGetPlaceCardLayoutLog();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_INFO, "Adding amenities ribbon item", buf, 2u);
            }

            -[GEOPDRibbonItem amenityRibbonItem](v10);
            v14 = objc_claimAutoreleasedReturnValue();
            -[GEOPlaceRibbonConfiguration _addAmenityEntryForRibbonItem:toArray:](self, "_addAmenityEntryForRibbonItem:toArray:", v14, v3);
            goto LABEL_22;
          case 6:
            GEOGetPlaceCardLayoutLog();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_INFO, "Adding factoid ribbon item", buf, 2u);
            }

            -[GEOPDRibbonItem factoidRibbonItem](v10);
            v14 = objc_claimAutoreleasedReturnValue();
            -[GEOPlaceRibbonConfiguration _addFactoidEntriesForRibbonItem:toArray:](self, "_addFactoidEntriesForRibbonItem:toArray:", v14, v3);
LABEL_22:

            break;
          default:
            continue;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v7);
  }

  GEOGetPlaceCardLayoutLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_INFO, "End building ribbon items", buf, 2u);
  }

  v18 = (NSArray *)objc_msgSend(v3, "copy");
  ribbonItems = self->_ribbonItems;
  self->_ribbonItems = v18;

}

- (void)_addFactoidEntriesForRibbonItem:(id)a3 toArray:(id)a4
{
  id v5;
  id v6;
  GEOPlaceRibbonItem *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[GEOPlaceRibbonItem initWithFactoidRibbonItem:]([GEOPlaceRibbonItem alloc], "initWithFactoidRibbonItem:", v6);

  objc_msgSend(v5, "addObject:", v7);
}

- (void)_addRegularRibbonEntryForType:(int)a3 toArray:(id)a4
{
  uint64_t v4;
  id v5;
  GEOPlaceRibbonItem *v6;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v6 = -[GEOPlaceRibbonItem initWithType:]([GEOPlaceRibbonItem alloc], "initWithType:", v4);
  objc_msgSend(v5, "addObject:", v6);

}

- (void)_addAmenityEntryForRibbonItem:(id)a3 toArray:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[GEOPlaceRibbonItem initAmenityWithAmenityItem:]([GEOPlaceRibbonItem alloc], "initAmenityWithAmenityItem:", v6);

  objc_msgSend(v5, "addObject:", v7);
}

- (NSArray)ribbonItems
{
  return self->_ribbonItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ribbonItems, 0);
  objc_storeStrong((id *)&self->_ribbonConfig, 0);
}

@end
