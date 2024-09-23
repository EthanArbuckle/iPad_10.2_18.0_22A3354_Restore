@implementation ATXHomeScreenFolder

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXHomeScreenFolder)initWithFolderPages:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  ATXHomeScreenFolder *v8;
  uint64_t v9;
  NSMutableArray *folderPages;
  uint64_t v11;
  NSString *name;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXHomeScreenFolder;
  v8 = -[ATXHomeScreenFolder init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "mutableCopy");
    folderPages = v8->_folderPages;
    v8->_folderPages = (NSMutableArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v11;

  }
  return v8;
}

- (NSArray)folderPages
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_folderPages, "copy");
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ATXHomeScreenFolder name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[ATXHomeScreenFolder folderPages](self, "folderPages");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("folderPages"));

}

- (ATXHomeScreenFolder)initWithCoder:(id)a3
{
  id v4;
  ATXHomeScreenFolder *v5;
  uint64_t v6;
  NSString *name;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  NSMutableArray *folderPages;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ATXHomeScreenFolder;
  v5 = -[ATXHomeScreenFolder init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = (void *)MEMORY[0x1A85A4F90]();
    v9 = objc_alloc(MEMORY[0x1E0C99E60]);
    v10 = objc_opt_class();
    v11 = (void *)objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("folderPages"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");
    v14 = v13;
    if (v13)
      v15 = v13;
    else
      v15 = (NSMutableArray *)objc_opt_new();
    folderPages = v5->_folderPages;
    v5->_folderPages = v15;

  }
  return v5;
}

- (unint64_t)hash
{
  return -[NSMutableArray count](self->_folderPages, "count");
}

- (BOOL)isEqual:(id)a3
{
  ATXHomeScreenFolder *v4;
  ATXHomeScreenFolder *v5;
  BOOL v6;

  v4 = (ATXHomeScreenFolder *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXHomeScreenFolder isEqualToATXHomeScreenFolder:](self, "isEqualToATXHomeScreenFolder:", v5);

  return v6;
}

- (BOOL)isEqualToATXHomeScreenFolder:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *v5;
  char v6;

  v4 = self->_folderPages;
  v5 = v4;
  if (v4 == *((NSMutableArray **)a3 + 1))
    v6 = 1;
  else
    v6 = -[NSMutableArray isEqual:](v4, "isEqual:");

  return v6;
}

- (void)addIcon:(id)a3 folderPageIndex:(unint64_t)a4
{
  int64_t v6;
  uint64_t v7;
  ATXHomeScreenFolderPage *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (-[NSMutableArray count](self->_folderPages, "count") <= a4)
  {
    v6 = a4 - -[NSMutableArray count](self->_folderPages, "count") + 1;
    if (v6 >= 1)
    {
      v7 = MEMORY[0x1E0C9AA60];
      do
      {
        v8 = -[ATXHomeScreenFolderPage initWithContents:]([ATXHomeScreenFolderPage alloc], "initWithContents:", v7);
        -[NSMutableArray addObject:](self->_folderPages, "addObject:", v8);

        --v6;
      }
      while (v6);
    }
  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_folderPages, "objectAtIndexedSubscript:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addIcon:", v10);

}

- (void)enumerateApps:(id)a3
{
  id v4;
  NSMutableArray *folderPages;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  folderPages = self->_folderPages;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__ATXHomeScreenFolder_enumerateApps___block_invoke;
  v7[3] = &unk_1E4D5D2A8;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](folderPages, "enumerateObjectsUsingBlock:", v7);

}

void __37__ATXHomeScreenFolder_enumerateApps___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a2, "contents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__ATXHomeScreenFolder_enumerateApps___block_invoke_2;
  v4[3] = &unk_1E4D5D280;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void __37__ATXHomeScreenFolder_enumerateApps___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)dictionaryRepresentationForIntrospection
{
  NSMutableArray *folderPages;
  const __CFString *v3;
  NSMutableArray **p_folderPages;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  p_folderPages = &self->_folderPages;
  folderPages = self->_folderPages;
  v3 = (const __CFString *)p_folderPages[1];
  if (v3)
    v5 = v3;
  else
    v5 = CFSTR("<nil>");
  v11[0] = CFSTR("name");
  v11[1] = CFSTR("folderPages");
  v12[0] = v5;
  -[NSMutableArray _pas_mappedArrayWithTransform:](folderPages, "_pas_mappedArrayWithTransform:", &__block_literal_global_176);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = MEMORY[0x1E0C9AA60];
  if (v6)
    v8 = v6;
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __63__ATXHomeScreenFolder_dictionaryRepresentationForIntrospection__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentationForIntrospection");
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_folderPages, 0);
}

@end
