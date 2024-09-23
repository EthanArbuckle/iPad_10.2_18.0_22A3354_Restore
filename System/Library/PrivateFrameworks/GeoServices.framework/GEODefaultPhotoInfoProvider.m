@implementation GEODefaultPhotoInfoProvider

+ (id)sortedPhotoInfoFromPhotoVersions:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _GEOPlaceDataPhotoInfo *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  double v15;
  unsigned int v16;
  _GEOPlaceDataPhotoInfo *v17;
  uint64_t v18;
  void *v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v8);
        v10 = [_GEOPlaceDataPhotoInfo alloc];
        v11 = (void *)MEMORY[0x1E0C99E98];
        -[GEOPDPhotoContent url]((id *)v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "URLWithString:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          LODWORD(v14) = *(_DWORD *)(v9 + 32);
          v15 = (double)v14;
          v16 = *(_DWORD *)(v9 + 24);
        }
        else
        {
          v16 = 0;
          v15 = 0.0;
        }
        v17 = -[_GEOPlaceDataPhotoInfo initWithURL:width:height:](v10, "initWithURL:width:height:", v13, v15, (double)v16);

        if (v17)
          objc_msgSend(v4, "addObject:", v17);

        ++v8;
      }
      while (v6 != v8);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v6 = v18;
    }
    while (v18);
  }

  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_195);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t __64__GEODefaultPhotoInfoProvider_sortedPhotoInfoFromPhotoVersions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "size");
  v7 = v6;
  objc_msgSend(v4, "size");
  v9 = v8;
  objc_msgSend(v4, "size");
  if (v7 <= v9)
    v12 = v11;
  else
    v12 = v10;
  objc_msgSend(v5, "size");
  v14 = v13;
  objc_msgSend(v5, "size");
  v16 = v15;
  objc_msgSend(v5, "size");
  if (v14 <= v16)
    v17 = v18;
  if (v12 >= v17)
  {
    if (v12 <= v17)
    {
      objc_msgSend(v4, "size");
      v21 = v20;
      objc_msgSend(v4, "size");
      v23 = v22;
      objc_msgSend(v4, "size");
      if (v21 >= v23)
        v26 = v25;
      else
        v26 = v24;
      objc_msgSend(v5, "size");
      v28 = v27;
      objc_msgSend(v5, "size");
      v30 = v29;
      objc_msgSend(v5, "size");
      if (v28 >= v30)
        v31 = v32;
      if (v26 < v31)
        v19 = -1;
      else
        v19 = v26 > v31;
    }
    else
    {
      v19 = 1;
    }
  }
  else
  {
    v19 = -1;
  }

  return v19;
}

- (GEODefaultPhotoInfoProvider)initWithPhotoContent:(id)a3
{
  id v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *sortedPhotoInfos;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  GEODefaultPhotoInfoProvider *v17;
  objc_super v19;
  _QWORD v20[4];
  int v21;

  v4 = a3;
  v5 = -[GEODefaultPhotoInfoProvider designatedURLType](self, "designatedURLType");
  v6 = (void *)MEMORY[0x1E0CB3880];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = ___photoContentForURLType_block_invoke;
  v20[3] = &__block_descriptor_36_e44_B24__0__GEOPDPhotoContent_8__NSDictionary_16l;
  v21 = v5;
  v7 = v4;
  objc_msgSend(v6, "predicateWithBlock:", v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "count"))
    goto LABEL_7;
  v19.receiver = self;
  v19.super_class = (Class)GEODefaultPhotoInfoProvider;
  self = -[GEODefaultPhotoInfoProvider init](&v19, sel_init);
  if (self)
  {
    +[GEODefaultPhotoInfoProvider sortedPhotoInfoFromPhotoVersions:](GEODefaultPhotoInfoProvider, "sortedPhotoInfoFromPhotoVersions:", v9);
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    sortedPhotoInfos = self->_sortedPhotoInfos;
    self->_sortedPhotoInfos = v10;

    -[NSArray firstObject](self->_sortedPhotoInfos, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "url");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      -[GEODefaultPhotoInfoProvider sizeRatio](self, "sizeRatio");
      v16 = v15;

      if (v16 != 0.0)
        goto LABEL_5;
    }
    else
    {

    }
LABEL_7:
    v17 = 0;
    goto LABEL_8;
  }
LABEL_5:
  self = self;
  v17 = self;
LABEL_8:

  return v17;
}

- (double)sizeRatio
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if (!-[NSArray count](self->_sortedPhotoInfos, "count"))
    return 0.0;
  -[NSArray lastObject](self->_sortedPhotoInfos, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v4 = 0.0;
  if (v5 > 0.0)
  {
    objc_msgSend(v3, "size");
    v7 = v6;
    objc_msgSend(v3, "size");
    v4 = v7 / v8;
  }

  return v4;
}

- (id)largestPhoto
{
  return -[NSArray lastObject](self->_sortedPhotoInfos, "lastObject");
}

- (id)bestPhotoForSize:(CGSize)a3 options:(id)a4
{
  double height;
  double width;
  id v7;
  NSArray *sortedPhotoInfos;
  int v9;
  NSArray *v10;
  id v11;
  id v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  height = a3.height;
  width = a3.width;
  v34 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  sortedPhotoInfos = self->_sortedPhotoInfos;
  v9 = objc_msgSend(v7, "allowSmaller");
  v10 = sortedPhotoInfos;
  if (-[NSArray count](v10, "count"))
  {
    if (v9)
    {
      -[NSArray firstObject](v10, "firstObject");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = v10;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v18, "size", (_QWORD)v29);
          if (v19 >= width || (objc_msgSend(v18, "size"), v20 >= height))
          {
            v12 = v18;

            goto LABEL_21;
          }
          if (v9)
          {
            objc_msgSend(v18, "size");
            v22 = v21;
            objc_msgSend(v11, "size");
            if (v22 >= v23 || (objc_msgSend(v18, "size"), v25 = v24, objc_msgSend(v11, "size"), v25 >= v26))
            {
              v27 = v18;

              v11 = v27;
            }
          }
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v15)
          continue;
        break;
      }
    }

    v11 = v11;
    v12 = v11;
LABEL_21:

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (int)designatedURLType
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedPhotoInfos, 0);
}

@end
