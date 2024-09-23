@implementation BCSBusinessLinkContentItem

- (id)initWithBusinessLinkContentItemModel:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)BCSBusinessLinkContentItem;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

- (NSString)description
{
  void *v3;
  void *v4;
  BCSBusinessLinkContentItemModel *businessLinkContentItemModel;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
    businessLinkContentItemModel = self->_businessLinkContentItemModel;
  else
    businessLinkContentItemModel = 0;
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", businessLinkContentItemModel, CFSTR("businessLinkContentItemModel"));
  objc_msgSend(v4, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isDefault
{
  BCSBusinessLinkContentItemModel *businessLinkContentItemModel;

  if (self)
  {
    businessLinkContentItemModel = self->_businessLinkContentItemModel;
    if (businessLinkContentItemModel)
      LOBYTE(self) = businessLinkContentItemModel->_isDefault;
    else
      LOBYTE(self) = 0;
  }
  return (char)self;
}

- (NSString)title
{
  if (self)
    self = (BCSBusinessLinkContentItem *)self->_businessLinkContentItemModel;
  return -[BCSBusinessLinkContentItem title](self, "title");
}

- (NSString)subtitle
{
  if (self)
    self = (BCSBusinessLinkContentItem *)self->_businessLinkContentItemModel;
  return -[BCSBusinessLinkContentItem subtitle](self, "subtitle");
}

- (NSString)language
{
  if (self)
    self = (BCSBusinessLinkContentItem *)self->_businessLinkContentItemModel;
  return -[BCSBusinessLinkContentItem language](self, "language");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessLinkContentItemModel, 0);
}

@end
