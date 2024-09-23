@implementation GEOButtonItem

- (GEOButtonItem)initWithButtonItem:(id)a3
{
  id v5;
  GEOButtonItem *v6;
  GEOButtonItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOButtonItem;
  v6 = -[GEOButtonItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_buttonItem, a3);

  return v7;
}

- (int)buttonType
{
  unsigned int v2;

  v2 = -[GEOPDButtonItem buttonType](self->_buttonItem, "buttonType") - 1;
  if (v2 > 0xE)
    return 0;
  else
    return dword_189CD2964[v2];
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[GEOPDButtonItem debugDescription](self->_buttonItem, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (int)GEOButtonItemTypeFromGEOPDButtonItemType:(int)a3
{
  if ((a3 - 1) > 0xE)
    return 0;
  else
    return dword_189CD2964[a3 - 1];
}

+ (id)buttonItemsFromPDButtonItems:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  GEOButtonItemGroup *v11;
  void *v12;
  GEOButtonItem *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "buttonType", (_QWORD)v16) != 8)
        {
          v13 = -[GEOButtonItem initWithButtonItem:]([GEOButtonItem alloc], "initWithButtonItem:", v10);
          if (!v13)
            goto LABEL_11;
LABEL_10:
          objc_msgSend(v4, "addObject:", v13);
          goto LABEL_11;
        }
        v11 = [GEOButtonItemGroup alloc];
        objc_msgSend(v10, "groupParams");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[GEOButtonItemGroup initWithGroupParams:](v11, "initWithGroupParams:", v12);

        if (v13)
          goto LABEL_10;
LABEL_11:

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v14 = (void *)objc_msgSend(v4, "copy");
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonItem, 0);
}

@end
