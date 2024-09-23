@implementation CNCardiMessageEmailGroup

- (CNCardiMessageEmailGroup)initWithContact:(id)a3 propertyItem:(id)a4
{
  id v6;
  CNCardiMessageEmailGroup *v7;
  uint64_t v8;
  NSArray *displayItems;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CNCardiMessageEmailGroup;
  v7 = -[CNCardGroup initWithContact:](&v11, sel_initWithContact_, a3);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    displayItems = v7->_displayItems;
    v7->_displayItems = (NSArray *)v8;

  }
  return v7;
}

- (id)displayItems
{
  return self->_displayItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayItems, 0);
}

@end
