@implementation CLSQuantityItem

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSQuantityItem;
  return -[CLSActivityItem _init](&v3, sel__init);
}

- (CLSQuantityItem)initWithIdentifier:(NSString *)identifier title:(NSString *)title
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLSQuantityItem;
  return -[CLSActivityItem initWithIdentifier:title:](&v5, sel_initWithIdentifier_title_, identifier, title);
}

- (CLSQuantityItem)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  CLSQuantityItem *v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSQuantityItem;
  v6 = -[CLSActivityItem initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v6)
  {
    objc_msgSend_decodeDoubleForKey_(v4, v5, (uint64_t)CFSTR("quantity"));
    v6->_quantity = v7;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLSQuantityItem;
  v4 = a3;
  -[CLSActivityItem encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeDouble_forKey_(v4, v5, (uint64_t)CFSTR("quantity"), self->_quantity, v6.receiver, v6.super_class);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v15.receiver = self;
  v15.super_class = (Class)CLSQuantityItem;
  -[CLSActivityItem description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_initWithString_(v3, v5, (uint64_t)v4);

  objc_msgSend_quantity(self, v7, v8);
  objc_msgSend_appendFormat_(v6, v9, (uint64_t)CFSTR(" (quantity: %.2f)"), v10);
  v13 = (void *)objc_msgSend_copy(v6, v11, v12);

  return v13;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CLSQuantityItem;
  -[CLSActivityItem dictionaryRepresentation](&v12, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_quantity(self, v5, v6);
  objc_msgSend_numberWithDouble_(v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)v9, CFSTR("quantity"));

  return v3;
}

- (double)quantity
{
  uint64_t v2;
  double quantity;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  quantity = self->_quantity;
  objc_msgSend_unlock(self, v5, v6);
  return quantity;
}

- (void)setQuantity:(double)quantity
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;

  objc_msgSend_lock(self, a2, v3);
  if (self->_quantity != quantity)
  {
    self->_quantity = quantity;
    objc_msgSend_setModified_(self, v6, 1);
  }
  objc_msgSend_unlock(self, v6, v7);
}

@end
