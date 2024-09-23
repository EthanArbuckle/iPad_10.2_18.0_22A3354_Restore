@implementation AVCustomRoutingActionItem

- (AVCustomRoutingActionItem)init
{
  AVCustomRoutingActionItem *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVCustomRoutingActionItem;
  v2 = -[AVCustomRoutingActionItem init](&v4, sel_init);
  if (v2)
    v2->_identifier = (NSString *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1880], "UUID"), "UUIDString");
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_type = 0;
  self->_overrideTitle = 0;
  v3.receiver = self;
  v3.super_class = (Class)AVCustomRoutingActionItem;
  -[AVCustomRoutingActionItem dealloc](&v3, sel_dealloc);
}

- (id)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  self->_identifier = (NSString *)a3;
}

- (UTType)type
{
  return self->_type;
}

- (void)setType:(UTType *)type
{
  objc_setProperty_nonatomic_copy(self, a2, type, 16);
}

- (NSString)overrideTitle
{
  return self->_overrideTitle;
}

- (void)setOverrideTitle:(NSString *)overrideTitle
{
  objc_setProperty_nonatomic_copy(self, a2, overrideTitle, 24);
}

@end
