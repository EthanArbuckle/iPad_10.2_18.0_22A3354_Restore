@implementation CPListImageRowItem

+ (CGSize)maximumImageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 95.0;
  v3 = 95.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPListImageRowItem)initWithText:(NSString *)text images:(NSArray *)images
{
  return -[CPListImageRowItem initWithText:images:imageTitles:](self, "initWithText:images:imageTitles:", text, images, MEMORY[0x24BDBD1A8]);
}

- (CPListImageRowItem)initWithText:(id)a3 images:(id)a4 imageTitles:(id)a5
{
  id v9;
  id v10;
  id v11;
  CPListImageRowItem *v12;
  uint64_t v13;
  NSUUID *identifier;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CPListImageRowItem;
  v12 = -[CPListImageRowItem init](&v16, sel_init);
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v13 = objc_claimAutoreleasedReturnValue();
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v13;

    objc_storeStrong((id *)&v12->_text, a3);
    v12->_enabled = 1;
    objc_storeStrong((id *)&v12->_imageTitles, a5);
    -[CPListImageRowItem updateImages:](v12, "updateImages:", v10);
  }

  return v12;
}

- (CPListImageRowItem)initWithCoder:(id)a3
{
  id v4;
  CPListImageRowItem *v5;
  uint64_t v6;
  NSString *text;
  uint64_t v8;
  NSUUID *identifier;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *gridImagesSet;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSArray *imageTitles;
  objc_super v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CPListImageRowItem;
  v5 = -[CPListImageRowItem init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPListImageRowItemTextKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPListImageRowIdentifierKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v8;

    v10 = (void *)MEMORY[0x24BDBCF20];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("kCPListImageRowItemGridImagesKey"));
    v13 = objc_claimAutoreleasedReturnValue();
    gridImagesSet = v5->_gridImagesSet;
    v5->_gridImagesSet = (NSArray *)v13;

    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kCPListImageRowItemEnabledKey"));
    v15 = (void *)MEMORY[0x24BDBCF20];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("kCPListImageRowItemImageTitlesKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    imageTitles = v5->_imageTitles;
    v5->_imageTitles = (NSArray *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CPListImageRowItem text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCPListImageRowItemTextKey"));

  -[CPListImageRowItem identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCPListImageRowIdentifierKey"));

  -[CPListImageRowItem gridImagesSet](self, "gridImagesSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kCPListImageRowItemGridImagesKey"));

  objc_msgSend(v4, "encodeBool:forKey:", -[CPListImageRowItem isEnabled](self, "isEnabled"), CFSTR("kCPListImageRowItemEnabledKey"));
  -[CPListImageRowItem imageTitles](self, "imageTitles");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kCPListImageRowItemImageTitlesKey"));

}

- (NSArray)gridImages
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_gridImagesSet;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v17;
    *(_QWORD *)&v6 = 138412290;
    v15 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "image", v15, (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v3, "addObject:", v11);
        }
        else
        {
          CarPlayFrameworkGeneralLogging();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v15;
            v21 = v10;
            _os_log_impl(&dword_20D6F4000, v12, OS_LOG_TYPE_INFO, "Unable to identify a grid image for %@", buf, 0xCu);
          }

        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v13;
}

- (void)setEnabled:(BOOL)enabled
{
  if (self->_enabled != enabled)
  {
    self->_enabled = enabled;
    -[CPListImageRowItem _setNeedsUpdate](self, "_setNeedsUpdate");
  }
}

- (void)_setNeedsUpdate
{
  id v3;

  -[CPListImageRowItem listTemplate](self, "listTemplate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setItemNeedsUpdate:", self);

}

- (void)setText:(NSString *)text
{
  NSString *v5;

  v5 = text;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_text, text);
    -[CPListImageRowItem _setNeedsUpdate](self, "_setNeedsUpdate");
  }

}

- (void)updateImages:(NSArray *)gridImages
{
  NSArray *v4;
  unint64_t v5;
  uint64_t v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  CPImageSet *v10;
  void *v11;
  CPImageSet *v12;
  NSArray *gridImagesSet;
  _QWORD v14[5];

  v4 = gridImages;
  v5 = -[NSArray count](v4, "count");
  if (v5 >= 8)
    v6 = 8;
  else
    v6 = v5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v6);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = 0;
    v9 = MEMORY[0x24BDAC760];
    do
    {
      v10 = [CPImageSet alloc];
      -[NSArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v9;
      v14[1] = 3221225472;
      v14[2] = __35__CPListImageRowItem_updateImages___block_invoke;
      v14[3] = &unk_24C77D488;
      v14[4] = self;
      v12 = -[CPImageSet initWithImage:treatmentBlock:](v10, "initWithImage:treatmentBlock:", v11, v14);

      -[NSArray addObject:](v7, "addObject:", v12);
      ++v8;
    }
    while (v6 != v8);
  }
  gridImagesSet = self->_gridImagesSet;
  self->_gridImagesSet = v7;

  -[CPListImageRowItem _setNeedsUpdate](self, "_setNeedsUpdate");
}

id __35__CPListImageRowItem_updateImages___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  void *v5;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "maximumImageSize");
  CPImageByScalingImageToSize(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setImageTitles:(id)a3
{
  objc_storeStrong((id *)&self->_imageTitles, a3);
  -[CPListImageRowItem _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (NSString)text
{
  return self->_text;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)userInfo
{
  objc_storeStrong(&self->_userInfo, userInfo);
}

- (void)handler
{
  return self->_handler;
}

- (void)setHandler:(void *)handler
{
  objc_setProperty_nonatomic_copy(self, a2, handler, 32);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSArray)imageTitles
{
  return self->_imageTitles;
}

- (void)listImageRowHandler
{
  return self->_listImageRowHandler;
}

- (void)setListImageRowHandler:(void *)listImageRowHandler
{
  objc_setProperty_nonatomic_copy(self, a2, listImageRowHandler, 48);
}

- (NSArray)gridImagesSet
{
  return self->_gridImagesSet;
}

- (void)setGridImagesSet:(id)a3
{
  objc_storeStrong((id *)&self->_gridImagesSet, a3);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (CPListTemplate)listTemplate
{
  return (CPListTemplate *)objc_loadWeakRetained((id *)&self->_listTemplate);
}

- (void)setListTemplate:(id)a3
{
  objc_storeWeak((id *)&self->_listTemplate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listTemplate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_gridImagesSet, 0);
  objc_storeStrong(&self->_listImageRowHandler, 0);
  objc_storeStrong((id *)&self->_imageTitles, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
