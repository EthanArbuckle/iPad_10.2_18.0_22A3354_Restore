@implementation MTRChannelClusterProgramCategoryStruct

- (MTRChannelClusterProgramCategoryStruct)init
{
  MTRChannelClusterProgramCategoryStruct *v2;
  MTRChannelClusterProgramCategoryStruct *v3;
  NSString *category;
  NSString *subCategory;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRChannelClusterProgramCategoryStruct;
  v2 = -[MTRChannelClusterProgramCategoryStruct init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    category = v2->_category;
    v2->_category = (NSString *)&stru_2505249E8;

    subCategory = v3->_subCategory;
    v3->_subCategory = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRChannelClusterProgramCategoryStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRChannelClusterProgramCategoryStruct);
  objc_msgSend_category(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCategory_(v4, v8, (uint64_t)v7);

  objc_msgSend_subCategory(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSubCategory_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: category:%@; subCategory:%@; >"),
    v5,
    self->_category,
    self->_subCategory);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)subCategory
{
  return self->_subCategory;
}

- (void)setSubCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subCategory, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end
