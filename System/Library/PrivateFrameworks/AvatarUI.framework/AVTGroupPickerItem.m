@implementation AVTGroupPickerItem

- (AVTGroupPickerItem)initWithLocalizedName:(id)a3 symbolNameProvider:(id)a4
{
  id v7;
  id v8;
  AVTGroupPickerItem *v9;
  AVTGroupPickerItem *v10;
  uint64_t v11;
  id symbolNameProvider;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVTGroupPickerItem;
  v9 = -[AVTGroupPickerItem init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localizedName, a3);
    v11 = MEMORY[0x1DF0D0754](v8);
    symbolNameProvider = v10->_symbolNameProvider;
    v10->_symbolNameProvider = (id)v11;

  }
  return v10;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (id)symbolNameProvider
{
  return self->_symbolNameProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_symbolNameProvider, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end
