@implementation ATXHomeScreenFolderPage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXHomeScreenFolderPage)initWithContents:(id)a3
{
  id v4;
  ATXHomeScreenFolderPage *v5;
  uint64_t v6;
  NSMutableArray *contents;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHomeScreenFolderPage;
  v5 = -[ATXHomeScreenFolderPage init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    contents = v5->_contents;
    v5->_contents = (NSMutableArray *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXHomeScreenFolderPage contents](self, "contents");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("contents"));

}

- (ATXHomeScreenFolderPage)initWithCoder:(id)a3
{
  id v4;
  ATXHomeScreenFolderPage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *contents;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXHomeScreenFolderPage;
  v5 = -[ATXHomeScreenFolderPage init](&v13, sel_init);
  if (v5)
  {
    allowedLeafIconClasses();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("contents"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    v9 = v8;
    if (v8)
      v10 = v8;
    else
      v10 = (NSMutableArray *)objc_opt_new();
    contents = v5->_contents;
    v5->_contents = v10;

  }
  return v5;
}

- (NSArray)contents
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_contents, "copy");
}

- (void)addIcon:(id)a3
{
  -[NSMutableArray addObject:](self->_contents, "addObject:", a3);
}

- (unint64_t)hash
{
  return -[NSMutableArray count](self->_contents, "count");
}

- (BOOL)isEqual:(id)a3
{
  ATXHomeScreenFolderPage *v4;
  ATXHomeScreenFolderPage *v5;
  BOOL v6;

  v4 = (ATXHomeScreenFolderPage *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXHomeScreenFolderPage isEqualToATXHomeScreenFolderPage:](self, "isEqualToATXHomeScreenFolderPage:", v5);

  return v6;
}

- (BOOL)isEqualToATXHomeScreenFolderPage:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *v5;
  char v6;

  v4 = self->_contents;
  v5 = v4;
  if (v4 == *((NSMutableArray **)a3 + 1))
    v6 = 1;
  else
    v6 = -[NSMutableArray isEqual:](v4, "isEqual:");

  return v6;
}

- (id)dictionaryRepresentationForIntrospection
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("contents");
  -[NSMutableArray _pas_mappedArrayWithTransform:](self->_contents, "_pas_mappedArrayWithTransform:", &__block_literal_global_94);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = MEMORY[0x1E0C9AA60];
  if (v2)
    v4 = v2;
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __67__ATXHomeScreenFolderPage_dictionaryRepresentationForIntrospection__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentationForIntrospection");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);
}

@end
