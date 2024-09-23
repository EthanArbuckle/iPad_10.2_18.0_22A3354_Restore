@implementation INObjectCollection

- (INObjectCollection)initWithItems:(NSArray *)items
{
  NSArray *v4;
  INObjectSection *v5;
  void *v6;
  INObjectCollection *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = items;
  v5 = -[INObjectSection initWithTitle:items:]([INObjectSection alloc], "initWithTitle:items:", 0, v4);

  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[INObjectCollection initWithSections:](self, "initWithSections:", v6);

  return v7;
}

- (INObjectCollection)initWithSections:(NSArray *)sections
{
  NSArray *v4;
  INObjectCollection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  NSArray *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  objc_super v18;

  v4 = sections;
  v18.receiver = self;
  v18.super_class = (Class)INObjectCollection;
  v5 = -[INObjectCollection init](&v18, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3550];
    -[NSArray valueForKey:](v4, "valueForKey:", CFSTR("title"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3550], "setWithSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __39__INObjectCollection_initWithSections___block_invoke;
    v15[3] = &unk_1E2291DA0;
    v16 = v8;
    v17 = v9;
    v10 = v9;
    v11 = v8;
    -[NSArray if_map:](v4, "if_map:", v15);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v5->_sections;
    v5->_sections = (NSArray *)v12;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
}

INObjectSection *__39__INObjectCollection_initWithSections___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  INObjectSection *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  INObjectSection *v13;

  v3 = a2;
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v4);
    v6 = v5 - objc_msgSend(*(id *)(a1 + 40), "countForObject:", v4);
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v4);
    v7 = [INObjectSection alloc];
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("-%lu"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subtitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "image");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "items");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[INObjectSection initWithIdentifier:title:subtitle:image:items:](v7, "initWithIdentifier:title:subtitle:image:items:", v8, v9, v10, v11, v12);

  }
  else
  {
    v13 = (INObjectSection *)v3;
  }

  return v13;
}

uint64_t __30__INObjectCollection_allItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "items");
}

- (NSArray)allItems
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[INObjectCollection sections](self, "sections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_flatMap:", &__block_literal_global_92173);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setUsesIndexedCollation:(BOOL)usesIndexedCollation
{
  self->_usesIndexedCollation = usesIndexedCollation;
}

- (id)copyWithZone:(_NSZone *)a3
{
  INObjectCollection *v4;
  void *v5;
  INObjectCollection *v6;

  v4 = [INObjectCollection alloc];
  -[INObjectCollection sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[INObjectCollection initWithSections:](v4, "initWithSections:", v5);

  -[INObjectCollection setUsesIndexedCollation:](v6, "setUsesIndexedCollation:", -[INObjectCollection usesIndexedCollation](self, "usesIndexedCollation"));
  return v6;
}

- (INObjectCollection)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  INObjectCollection *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("sections"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = v8;
  else
    v9 = (void *)MEMORY[0x1E0C9AA60];
  v10 = -[INObjectCollection initWithSections:](self, "initWithSections:", v9);
  v11 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("usesIndexedCollation"));

  -[INObjectCollection setUsesIndexedCollation:](v10, "setUsesIndexedCollation:", v11);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *sections;
  id v5;

  sections = self->_sections;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sections, CFSTR("sections"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_usesIndexedCollation, CFSTR("usesIndexedCollation"));

}

- (id)_typedObjectCollectionWithCodableAttribute:(id)a3
{
  id v4;
  id v5;
  void *v6;
  INJSONDecoder *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  INObjectSection *v17;
  void *v18;
  INObjectSection *v19;
  INObjectCollection *v20;
  INObjectCollection *v22;
  id obj;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[INObjectCollection sections](self, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

  v7 = objc_alloc_init(INJSONDecoder);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v22 = self;
  -[INObjectCollection sections](self, "sections");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v26)
  {
    v24 = *(_QWORD *)v32;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v8);
        v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v9, "items");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v28;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v28 != v14)
                objc_enumerationMutation(v11);
              -[INJSONDecoder decodeWithCodableAttribute:from:](v7, "decodeWithCodableAttribute:from:", v4, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v15));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "if_addObjectIfNonNil:", v16);

              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v13);
        }

        v17 = [INObjectSection alloc];
        objc_msgSend(v9, "title");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[INObjectSection initWithTitle:items:](v17, "initWithTitle:items:", v18, v10);
        objc_msgSend(v25, "addObject:", v19);

        ++v8;
      }
      while (v8 != v26);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v26);
  }

  v20 = -[INObjectCollection initWithSections:]([INObjectCollection alloc], "initWithSections:", v25);
  -[INObjectCollection setUsesIndexedCollation:](v20, "setUsesIndexedCollation:", -[INObjectCollection usesIndexedCollation](v22, "usesIndexedCollation"));

  return v20;
}

- (id)_untypedObjectCollectionWithItemClass:(Class)a3 codableAttribute:(id)a4 error:(id *)a5
{
  id v6;
  unint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  INJSONEncoder *v22;
  void *v23;
  void *v24;
  INObjectSection *v25;
  void *v26;
  INObjectSection *v27;
  INObjectCollection *v28;
  void *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  INObjectCollection *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  void *v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = 0x1E0C99000uLL;
  v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[INObjectCollection sections](self, "sections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v37 = self;
  -[INObjectCollection sections](self, "sections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
  if (v38)
  {
    v12 = *(_QWORD *)v49;
    v42 = v11;
    v43 = v10;
    v36 = *(_QWORD *)v49;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v49 != v12)
          objc_enumerationMutation(v11);
        v40 = v13;
        v14 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v13);
        v15 = objc_alloc_init(*(Class *)(v7 + 3560));
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v39 = v14;
        objc_msgSend(v14, "items");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v45;
          while (2)
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v45 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v20);
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v29 = (void *)MEMORY[0x1E0CB35C8];
                v52 = *MEMORY[0x1E0CB2D50];
                v30 = (void *)MEMORY[0x1E0CB3940];
                v31 = (objc_class *)objc_opt_class();
                NSStringFromClass(v31);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "stringWithFormat:", CFSTR("Unexpected class %@"), v32);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = v33;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("_INObjectCollectionErrorDomain"), 1001, v34);
                *a5 = (id)objc_claimAutoreleasedReturnValue();

                v28 = 0;
                v10 = v43;
                goto LABEL_20;
              }
              v22 = objc_alloc_init(INJSONEncoder);
              INObjectWithTypedObject(v21, v6);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (v23)
              {
                -[INJSONEncoder encodeObject:withCodableAttribute:](v22, "encodeObject:withCodableAttribute:", v23, v6);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "if_addObjectIfNonNil:", v24);

              }
              ++v20;
            }
            while (v18 != v20);
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
            if (v18)
              continue;
            break;
          }
        }

        v25 = [INObjectSection alloc];
        objc_msgSend(v39, "title");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[INObjectSection initWithTitle:items:](v25, "initWithTitle:items:", v26, v15);
        v10 = v43;
        objc_msgSend(v43, "addObject:", v27);

        v13 = v40 + 1;
        v11 = v42;
        v7 = 0x1E0C99000;
        v12 = v36;
      }
      while (v40 + 1 != v38);
      v38 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
    }
    while (v38);
  }

  v28 = -[INObjectCollection initWithSections:]([INObjectCollection alloc], "initWithSections:", v10);
  -[INObjectCollection setUsesIndexedCollation:](v28, "setUsesIndexedCollation:", -[INObjectCollection usesIndexedCollation](v37, "usesIndexedCollation"));
LABEL_20:

  return v28;
}

- (BOOL)usesIndexedCollation
{
  return self->_usesIndexedCollation;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
