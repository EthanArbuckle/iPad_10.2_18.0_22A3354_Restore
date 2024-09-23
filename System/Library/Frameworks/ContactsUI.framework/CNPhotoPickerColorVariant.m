@implementation CNPhotoPickerColorVariant

- (CNPhotoPickerColorVariant)initWithColor:(id)a3 named:(id)a4
{
  id v7;
  id v8;
  CNPhotoPickerColorVariant *v9;
  CNPhotoPickerColorVariant *v10;
  CNPhotoPickerColorVariant *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNPhotoPickerColorVariant;
  v9 = -[CNPhotoPickerColorVariant init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_color, a3);
    objc_storeStrong((id *)&v10->_colorName, a4);
    v11 = v10;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  char v10;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    v8 = (void *)MEMORY[0x1E0D13A40];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __37__CNPhotoPickerColorVariant_isEqual___block_invoke;
    v12[3] = &unk_1E2050050;
    v12[4] = self;
    v13 = v7;
    v9 = v7;
    v10 = objc_msgSend(v8, "isObject:equalToOther:withBlocks:", self, v9, v12, 0);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (UIColor)color
{
  return self->_color;
}

- (NSString)colorName
{
  return self->_colorName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorName, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

uint64_t __37__CNPhotoPickerColorVariant_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "color");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

@end
