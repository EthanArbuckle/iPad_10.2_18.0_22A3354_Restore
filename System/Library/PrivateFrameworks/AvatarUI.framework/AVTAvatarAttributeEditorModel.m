@implementation AVTAvatarAttributeEditorModel

+ (id)diffOfSectionItems:(id)a3 fromSectionItems:(id)a4
{
  return (id)objc_msgSend(a3, "differenceFromArray:withOptions:usingEquivalenceTest:", a4, 0, &__block_literal_global_26);
}

uint64_t __69__AVTAvatarAttributeEditorModel_diffOfSectionItems_fromSectionItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isEqualToString:", v6);
  return v7;
}

+ (id)diffOfSections:(id)a3 fromSections:(id)a4
{
  return (id)objc_msgSend(a3, "differenceFromArray:withOptions:usingEquivalenceTest:", a4, 0, &__block_literal_global_2_2);
}

uint64_t __61__AVTAvatarAttributeEditorModel_diffOfSections_fromSections___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isEqualToString:", v6);
  return v7;
}

- (AVTAvatarAttributeEditorModel)initWithCategories:(id)a3
{
  id v5;
  AVTAvatarAttributeEditorModel *v6;
  AVTAvatarAttributeEditorModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTAvatarAttributeEditorModel;
  v6 = -[AVTAvatarAttributeEditorModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_categories, a3);

  return v7;
}

- (id)differenceFromModel:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  AVTAvatarAttributeEditorModelDiff *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id obj;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "categories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    v35 = v3;
    do
    {
      objc_msgSend(v3, "categories", v35);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[AVTAvatarAttributeEditorModel categories](self, "categories");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v6;
      objc_msgSend(v9, "objectAtIndexedSubscript:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)objc_opt_class();
      objc_msgSend(v10, "sections");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sections");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "diffOfSections:fromSections:", v12, v13);
      v14 = objc_claimAutoreleasedReturnValue();

      v37 = (void *)v14;
      objc_msgSend(v36, "addObject:", v14);
      v15 = (void *)MEMORY[0x1E0C99D80];
      v39 = v8;
      objc_msgSend(v8, "sections");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_avtui_dictionaryByIndexingObjectsInArray:by:", v16, &__block_literal_global_6);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x1E0C99D80];
      v38 = v10;
      objc_msgSend(v10, "sections");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_avtui_dictionaryByIndexingObjectsInArray:by:", v18, &__block_literal_global_7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      objc_msgSend(v19, "allKeys");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v46 != v22)
              objc_enumerationMutation(obj);
            v24 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
            objc_msgSend(v19, "objectForKeyedSubscript:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "objectForKeyedSubscript:", v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              v27 = (void *)objc_opt_class();
              objc_msgSend(v25, "sectionItems");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "sectionItems");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "diffOfSectionItems:fromSectionItems:", v28, v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v30, "hasChanges"))
                objc_msgSend(v41, "setObject:forKeyedSubscript:", v30, v24);

            }
          }
          v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        }
        while (v21);
      }

      v6 = v40 + 1;
      v3 = v35;
      objc_msgSend(v35, "categories");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");

    }
    while (v40 + 1 < v32);
  }
  v33 = -[AVTAvatarAttributeEditorModelDiff initWithSectionDiffs:sectionItemDiffs:]([AVTAvatarAttributeEditorModelDiff alloc], "initWithSectionDiffs:sectionItemDiffs:", v36, v41);

  return v33;
}

uint64_t __53__AVTAvatarAttributeEditorModel_differenceFromModel___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __53__AVTAvatarAttributeEditorModel_differenceFromModel___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (NSArray)categories
{
  return self->_categories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
}

@end
