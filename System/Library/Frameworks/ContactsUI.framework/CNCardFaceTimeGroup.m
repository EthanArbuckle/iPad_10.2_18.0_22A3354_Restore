@implementation CNCardFaceTimeGroup

- (id)displayItems
{
  NSArray *displayItems;
  CNCardFaceTimeGroupItem *v4;
  NSArray *v5;
  NSArray *v6;

  displayItems = self->_displayItems;
  if (!displayItems)
  {
    v4 = objc_alloc_init(CNCardFaceTimeGroupItem);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v4);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_displayItems;
    self->_displayItems = v5;

    displayItems = self->_displayItems;
  }
  return displayItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayItems, 0);
}

@end
