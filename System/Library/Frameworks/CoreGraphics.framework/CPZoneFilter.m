@implementation CPZoneFilter

- (CPZoneFilter)initWithPage:(id)a3
{
  CPZoneFilter *v4;
  CPZoneFilter *v5;
  double v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CPZoneFilter;
  v4 = -[CPZoneFilter init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->page = (CPPage *)a3;
    objc_msgSend(a3, "pageCropBox");
    v5->minArea = v6 * v7 * 0.04;
  }
  return v5;
}

- (void)filterZonesInZone:(id)a3
{
  void *v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  double v12;
  uint64_t i;
  void *v14;
  unsigned int v15;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a3, "count"));
  objc_msgSend(a3, "childrenOfClass:into:", objc_opt_class(), v5);
  v6 = objc_msgSend(v5, "count");
  v7 = v6;
  if (!v6)
    goto LABEL_24;
  v8 = 0;
  v9 = 0;
  v15 = 0;
  v10 = v6;
  do
  {
    v11 = (void *)objc_msgSend(v5, "objectAtIndex:", v8);
    if ((objc_msgSend(v11, "hasRotatedCharacters") & 1) != 0)
      goto LABEL_10;
    if (!objc_msgSend(v11, "firstDescendantOfClass:", objc_opt_class()))
    {
      deZoneDescendantsOf(v11);
LABEL_9:
      objc_msgSend(v11, "promoteChildren");
      objc_msgSend(v11, "remove");
      goto LABEL_10;
    }
    objc_msgSend(v11, "area");
    if (v12 >= self->minArea)
    {
      ++v9;
      -[CPZoneFilter filterZonesInZone:](self, "filterZonesInZone:", v11);
    }
    else
    {
      deZoneDescendantsOf(v11);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "promoteChildren");
        objc_msgSend(v11, "remove");
      }
      else
      {
        ++v15;
      }
    }
    if (v7 == 1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v15 = 0;
          goto LABEL_9;
        }
      }
    }
LABEL_10:
    ++v8;
  }
  while (v10 != v8);
  if (v9 < v15)
  {
    for (i = 0; i != v10; ++i)
    {
      v14 = (void *)objc_msgSend(v5, "objectAtIndex:", i);
      if (objc_msgSend(v14, "parent") && (objc_msgSend(v14, "hasRotatedCharacters") & 1) == 0)
      {
        objc_msgSend(v14, "promoteChildren");
        objc_msgSend(v14, "remove");
      }
    }
  }
LABEL_24:

  deZoneTablesIn(a3);
}

- (void)findBackgroundGraphicsInZone:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t j;
  id v11;

  v5 = (void *)objc_msgSend(a3, "backgroundGraphics");
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      v8 = (void *)objc_msgSend(v5, "objectAtIndex:", i);
      if (!objc_msgSend(v8, "user"))
        objc_msgSend(v8, "setUser:", a3);
    }
  }
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a3, "count"));
  objc_msgSend(a3, "childrenOfClass:into:", objc_opt_class(), v11);
  v9 = objc_msgSend(v11, "count");
  if (v9)
  {
    for (j = 0; j != v9; ++j)
      -[CPZoneFilter findBackgroundGraphicsInZone:](self, "findBackgroundGraphicsInZone:", objc_msgSend(v11, "objectAtIndex:", j));
  }

}

- (void)findUsedGraphicsInZone:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t k;
  id v19;

  v5 = (void *)objc_msgSend(a3, "zoneBorders");
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      v8 = (void *)objc_msgSend(v5, "objectAtIndex:", i);
      v9 = (void *)objc_msgSend(v8, "graphicObjects");
      v10 = objc_msgSend(v9, "count");
      if (v10)
      {
        for (j = 0; j != v10; ++j)
        {
          v12 = (void *)objc_msgSend(v9, "objectAtIndex:", j);
          if (objc_msgSend(v12, "parent") && !objc_msgSend(v12, "user"))
            objc_msgSend(v12, "setUser:", a3);
        }
      }
      v13 = objc_msgSend(v8, "neighborCount");
      if (v13)
      {
        v14 = v13;
        v15 = 0;
        do
        {
          v16 = (void *)objc_msgSend((id)objc_msgSend(v8, "neighborAtIndex:", v15), "neighborShape");
          if (!objc_msgSend(v16, "user"))
            objc_msgSend(v16, "setUser:", a3);
          v15 = (v15 + 1);
        }
        while (v14 != (_DWORD)v15);
      }
    }
  }
  v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a3, "count"));
  objc_msgSend(a3, "childrenOfClass:into:", objc_opt_class(), v19);
  v17 = objc_msgSend(v19, "count");
  if (v17)
  {
    for (k = 0; k != v17; ++k)
      -[CPZoneFilter findUsedGraphicsInZone:](self, "findUsedGraphicsInZone:", objc_msgSend(v19, "objectAtIndex:", k));
  }

}

+ (void)filterZonesInPage:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  CPZoneFilter *v6;

  v4 = objc_msgSend(a3, "firstDescendantOfClass:", objc_opt_class());
  if (v4)
  {
    v5 = v4;
    v6 = -[CPZoneFilter initWithPage:]([CPZoneFilter alloc], "initWithPage:", a3);
    -[CPZoneFilter filterZonesInZone:](v6, "filterZonesInZone:", v5);
    -[CPZoneFilter findBackgroundGraphicsInZone:](v6, "findBackgroundGraphicsInZone:", v5);
    -[CPZoneFilter findUsedGraphicsInZone:](v6, "findUsedGraphicsInZone:", v5);

  }
}

@end
