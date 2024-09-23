@implementation GEOAmenityItem

- (GEOAmenityItem)initWithAmenityValue:(id)a3
{
  id v5;
  GEOAmenityItem *v6;
  GEOAmenityItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOAmenityItem;
  v6 = -[GEOAmenityItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_amenityValue, a3);

  return v7;
}

- (NSString)amenityTitle
{
  return (NSString *)-[GEOPDAmenityValue displayTitle](self->_amenityValue, "displayTitle");
}

- (int)amenityType
{
  int result;

  result = -[GEOPDAmenityValue amenityType](self->_amenityValue, "amenityType");
  if (result >= 0x3F)
    return 0;
  return result;
}

- (BOOL)isApplePayAmenity
{
  return -[GEOAmenityItem amenityType](self, "amenityType") == 21;
}

- (BOOL)isAmenityPresent
{
  return -[GEOPDAmenityValue amenityPresent](self->_amenityValue, "amenityPresent");
}

- (NSString)symbolImageName
{
  return -[GEOPDAmenityValue symbolImageName](self->_amenityValue, "symbolImageName");
}

+ (id)amenityItemsFromPDAmenityItems:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  GEOAmenityItem *v11;
  GEOAmenityItem *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
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
        v11 = [GEOAmenityItem alloc];
        v12 = -[GEOAmenityItem initWithAmenityValue:](v11, "initWithAmenityValue:", v10, (_QWORD)v15);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), self->_amenityValue);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amenityValue, 0);
}

@end
