@implementation CLSAreaOfInterestQueryPerformer

- (CLSAreaOfInterestQueryPerformer)initWithAOICache:(id)a3 locationCache:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLSAreaOfInterestQueryPerformer;
  return -[CLSBusinessItemGenericQueryPerformer initWithBusinessCategoryCache:locationCache:](&v5, sel_initWithBusinessCategoryCache_locationCache_, a3, a4);
}

- (BOOL)shouldQueryItemsForRegion:(id)a3 selectedRegions:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CLSAreaOfInterestQueryPerformer;
  if (-[CLSBusinessItemGenericQueryPerformer shouldQueryItemsForRegion:selectedRegions:](&v18, sel_shouldQueryItemsForRegion_selectedRegions_, v6, a4))
  {
    -[CLSLocationCache placemarksForLocation:](self->super._locationCache, "placemarksForLocation:", v6);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "areasOfInterest", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "count");

          if (v12)
          {
            LOBYTE(v8) = 1;
            goto LABEL_13;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (double)defaultPrecision
{
  return 6000.0;
}

+ (id)categories
{
  return +[CLSNewLocationInformant areaOfInterestCategories](CLSNewLocationInformant, "areaOfInterestCategories");
}

@end
