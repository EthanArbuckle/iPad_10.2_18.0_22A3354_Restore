@implementation CNPhotoPickerAddItemsProvider

- (CNPhotoPickerAddItemsProvider)initWithVisualIdentity:(id)a3 allowsTakePhotoItem:(BOOL)a4 allowsPhotoFromLibraryItem:(BOOL)a5 allowsMonograms:(BOOL)a6 allowsEmoji:(BOOL)a7
{
  CNPhotoPickerAddItemsProvider *v11;
  CNPhotoPickerAddItemsProvider *v12;
  CNPhotoPickerAddItemsProvider *v13;

  v11 = -[CNPhotoPickerAddItemsProvider initWithVisualIdentity:](self, "initWithVisualIdentity:", a3);
  v12 = v11;
  if (v11)
  {
    v11->_allowsTakePhotoItem = a4;
    v11->_allowsPhotoFromLibraryItem = a5;
    v11->_allowsMonograms = a6;
    v11->_allowsEmoji = a7;
    v13 = v11;
  }

  return v12;
}

- (CNPhotoPickerAddItemsProvider)initWithVisualIdentity:(id)a3
{
  id v5;
  CNPhotoPickerAddItemsProvider *v6;
  CNPhotoPickerAddItemsProvider *v7;
  void *v8;
  uint64_t v9;
  NSString *identifier;
  CNPhotoPickerAddItemsProvider *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNPhotoPickerAddItemsProvider;
  v6 = -[CNPhotoPickerAddItemsProvider init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_visualIdentity, a3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v9;

    v11 = v7;
  }

  return v7;
}

- (id)loadItemsForSize:(CGSize)a3 scale:(double)a4 RTL:(BOOL)a5 renderingQueue:(id)a6 callbackQueue:(id)a7 itemDelegate:(id)a8
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a5, a6, a7, a8, a3.width, a3.height, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNPhotoPickerAddItemsProvider allowsTakePhotoItem](self, "allowsTakePhotoItem"))
  {
    -[CNPhotoPickerAddItemsProvider addItemOfType:](self, "addItemOfType:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
  if (-[CNPhotoPickerAddItemsProvider allowsPhotoFromLibraryItem](self, "allowsPhotoFromLibraryItem"))
  {
    -[CNPhotoPickerAddItemsProvider addItemOfType:](self, "addItemOfType:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v11);

  }
  if (-[CNPhotoPickerAddItemsProvider allowsMonograms](self, "allowsMonograms"))
  {
    -[CNPhotoPickerAddItemsProvider addItemOfType:](self, "addItemOfType:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v12);

  }
  if (-[CNPhotoPickerAddItemsProvider allowsEmoji](self, "allowsEmoji"))
  {
    -[CNPhotoPickerAddItemsProvider addItemOfType:](self, "addItemOfType:", 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v13);

  }
  v14 = (void *)objc_msgSend(v9, "copy");

  return v14;
}

- (id)addItemOfType:(unint64_t)a3
{
  void *v4;
  CNPhotoPickerGlyphProviderItem *v5;

  -[CNPhotoPickerAddItemsProvider symbolImageNameForAddItemType:](self, "symbolImageNameForAddItemType:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNPhotoPickerGlyphProviderItem initWithSymbolImageNamed:withAddItemType:]([CNPhotoPickerGlyphProviderItem alloc], "initWithSymbolImageNamed:withAddItemType:", v4, a3);

  return v5;
}

- (id)symbolImageNameForAddItemType:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("camera");
  else
    return off_1E204F270[a3 - 1];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (CNVisualIdentity)visualIdentity
{
  return self->_visualIdentity;
}

- (BOOL)allowsTakePhotoItem
{
  return self->_allowsTakePhotoItem;
}

- (void)setAllowsTakePhotoItem:(BOOL)a3
{
  self->_allowsTakePhotoItem = a3;
}

- (BOOL)allowsPhotoFromLibraryItem
{
  return self->_allowsPhotoFromLibraryItem;
}

- (void)setAllowsPhotoFromLibraryItem:(BOOL)a3
{
  self->_allowsPhotoFromLibraryItem = a3;
}

- (BOOL)allowsMonograms
{
  return self->_allowsMonograms;
}

- (void)setAllowsMonograms:(BOOL)a3
{
  self->_allowsMonograms = a3;
}

- (BOOL)allowsEmoji
{
  return self->_allowsEmoji;
}

- (void)setAllowsEmoji:(BOOL)a3
{
  self->_allowsEmoji = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualIdentity, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
