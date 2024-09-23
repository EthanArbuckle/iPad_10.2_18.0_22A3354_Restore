@implementation GEOStorefrontInfo

- (GEOStorefrontInfo)init
{
  GEOStorefrontInfo *result;

  result = (GEOStorefrontInfo *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOStorefrontInfo)initWithStorefront:(id)a3
{
  id *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  GEOStorefrontBundleId *v14;
  uint64_t v15;
  void *v16;
  NSArray *v17;
  NSArray *bundleIds;
  GEOStorefrontInfo *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  if (v4
    && (v25.receiver = self,
        v25.super_class = (Class)GEOStorefrontInfo,
        (self = -[GEOStorefrontInfo init](&v25, sel_init)) != 0))
  {
    v5 = (void *)MEMORY[0x1E0C99DE8];
    v6 = v4[1];
    objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = v4[1];
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12);
          v14 = [GEOStorefrontBundleId alloc];
          v15 = -[GEOStorefrontBundleId initWithBundleId:](v14, "initWithBundleId:", v13, (_QWORD)v21);
          if (!v15)
          {

            v19 = 0;
            goto LABEL_14;
          }
          v16 = (void *)v15;
          objc_msgSend(v7, "addObject:", v15);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v10)
          continue;
        break;
      }
    }

    v17 = (NSArray *)objc_msgSend(v7, "copy");
    bundleIds = self->_bundleIds;
    self->_bundleIds = v17;

    v19 = self;
LABEL_14:

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (NSArray)bundleIds
{
  return self->_bundleIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIds, 0);
}

@end
