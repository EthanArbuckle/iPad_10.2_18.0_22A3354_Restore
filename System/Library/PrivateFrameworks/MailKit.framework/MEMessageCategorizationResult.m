@implementation MEMessageCategorizationResult

- (MEMessageCategorizationResult)init
{
  return -[MEMessageCategorizationResult initWithCategoryType:subCategoryType:metadata:](self, "initWithCategoryType:subCategoryType:metadata:", 0, 0, 0);
}

- (MEMessageCategorizationResult)initWithCategoryType:(unint64_t)a3 subCategoryType:(unint64_t)a4 metadata:(id)a5
{
  id v9;
  MEMessageCategorizationResult *v10;
  MEMessageCategorizationResult *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MEMessageCategorizationResult;
  v10 = -[MEMessageCategorizationResult init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_categoryType = a3;
    v10->_subcategory = a4;
    objc_storeStrong((id *)&v10->_metadata, a5);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[MEMessageCategorizationResult categoryType](self, "categoryType"), CFSTR("EFPropertyKey_categoryType"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[MEMessageCategorizationResult subcategory](self, "subcategory"), CFSTR("EFPropertyKey_subcategory"));
  -[MEMessageCategorizationResult metadata](self, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_metadata"));

}

- (MEMessageCategorizationResult)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  MEMessageCategorizationResultMetadata *v7;
  MEMessageCategorizationResultMetadata *metadata;
  MEMessageCategorizationResult *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_categoryType"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_subcategory"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_metadata"));
  v7 = (MEMessageCategorizationResultMetadata *)objc_claimAutoreleasedReturnValue();
  metadata = self->_metadata;
  self->_metadata = v7;

  v9 = -[MEMessageCategorizationResult initWithCategoryType:subCategoryType:metadata:](self, "initWithCategoryType:subCategoryType:metadata:", v5, v6, v7);
  return v9;
}

- (unint64_t)categoryType
{
  return self->_categoryType;
}

- (void)setCategoryType:(unint64_t)a3
{
  self->_categoryType = a3;
}

- (unint64_t)subcategory
{
  return self->_subcategory;
}

- (void)setSubcategory:(unint64_t)a3
{
  self->_subcategory = a3;
}

- (MEMessageCategorizationResultMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
