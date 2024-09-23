@implementation NTKEditOptionCollection

- (int64_t)swatchStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NTKEditOptionCollection options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "swatchStyle");

  return v4;
}

- (NSString)optionsDescription
{
  void *v2;
  void *v3;
  void *v4;

  -[NTKEditOptionCollection options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "optionsDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

+ (NTKEditOptionCollection)editOptionCollectionWithEditMode:(int64_t)a3 localizedName:(id)a4 options:(id)a5 collectionType:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a5;
  v11 = a4;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEditMode:localizedName:options:collectionType:", a3, v11, v10, a6);

  return (NTKEditOptionCollection *)v12;
}

- (NTKEditOptionCollection)initWithEditMode:(int64_t)a3 localizedName:(id)a4 options:(id)a5 collectionType:(unint64_t)a6
{
  return -[NTKEditOptionCollection initWithEditMode:localizedName:options:collectionType:slot:](self, "initWithEditMode:localizedName:options:collectionType:slot:", a3, a4, a5, a6, 0);
}

- (NTKEditOptionCollection)initWithEditMode:(int64_t)a3 localizedName:(id)a4 options:(id)a5 collectionType:(unint64_t)a6 slot:(id)a7
{
  id v12;
  id v13;
  id v14;
  NTKEditOptionCollection *v15;
  NTKEditOptionCollection *v16;
  objc_super v18;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)NTKEditOptionCollection;
  v15 = -[NTKEditOptionCollection init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    -[NTKEditOptionCollection setMode:](v15, "setMode:", a3);
    -[NTKEditOptionCollection setLocalizedName:](v16, "setLocalizedName:", v12);
    -[NTKEditOptionCollection setOptions:](v16, "setOptions:", v13);
    -[NTKEditOptionCollection setCollectionType:](v16, "setCollectionType:", a6);
    -[NTKEditOptionCollection setSlot:](v16, "setSlot:", v14);
  }

  return v16;
}

- (id)filteredCollectionWithObjectsPassingTest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  NTKEditOptionCollection *v9;
  int64_t v10;
  void *v11;
  NTKEditOptionCollection *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NTKEditOptionCollection options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __68__NTKEditOptionCollection_filteredCollectionWithObjectsPassingTest___block_invoke;
  v17 = &unk_1E6BD7A88;
  v18 = v5;
  v19 = v4;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v14);

  v9 = [NTKEditOptionCollection alloc];
  v10 = -[NTKEditOptionCollection mode](self, "mode", v14, v15, v16, v17);
  -[NTKEditOptionCollection localizedName](self, "localizedName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NTKEditOptionCollection initWithEditMode:localizedName:options:collectionType:](v9, "initWithEditMode:localizedName:options:collectionType:", v10, v11, v7, -[NTKEditOptionCollection collectionType](self, "collectionType"));

  return v12;
}

void __68__NTKEditOptionCollection_filteredCollectionWithObjectsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)filteredCollectionForDevice:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__NTKEditOptionCollection_filteredCollectionForDevice___block_invoke;
  v8[3] = &unk_1E6BD7AB0;
  v9 = v4;
  v5 = v4;
  -[NTKEditOptionCollection filteredCollectionWithObjectsPassingTest:](self, "filteredCollectionWithObjectsPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __55__NTKEditOptionCollection_filteredCollectionForDevice___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "optionExistsInDevice:", *(_QWORD *)(a1 + 32));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *localizedName;
  void *v9;
  uint64_t v10;
  NSUInteger v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v4, "mode") != self->_mode)
    goto LABEL_14;
  objc_msgSend(v4, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && self->_localizedName)
  {
    objc_msgSend(v4, "localizedName");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    localizedName = self->_localizedName;

    if (v7 != localizedName)
    {
LABEL_14:
      v16 = 0;
      goto LABEL_15;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  v11 = -[NSArray count](self->_options, "count");

  if (v10 != v11)
    goto LABEL_14;
  if (-[NSArray count](self->_options, "count"))
  {
    v12 = 0;
    do
    {
      objc_msgSend(v4, "options");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_options, "objectAtIndexedSubscript:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqual:", v15);

      if ((v16 & 1) == 0)
        break;
      ++v12;
    }
    while (v12 < -[NSArray count](self->_options, "count"));
  }
  else
  {
    v16 = 1;
  }
LABEL_15:

  return v16;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)collectionType
{
  return self->_collectionType;
}

- (void)setCollectionType:(unint64_t)a3
{
  self->_collectionType = a3;
}

- (NSString)slot
{
  return self->_slot;
}

- (void)setSlot:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slot, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end
