@implementation CLSQuantityReportItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLSQuantityReportItem;
  v4 = -[CLSActivityReportItem copyWithZone:](&v8, sel_copyWithZone_, a3);
  objc_msgSend_setQuantity_(v4, v5, v6, self->_quantity);
  return v4;
}

- (id)convertToItemCompatibleWithItem:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  void *v7;
  double quantity;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  objc_super v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_opt_new();
    v7 = v5;
    quantity = self->_quantity;
    if (quantity > 2.22044605e-16)
      objc_msgSend_setValue_(v5, v6, 1);
    else
      objc_msgSend_setValue_(v5, v6, quantity < 0.0);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_opt_new();
      objc_msgSend_setValue_(v7, v9, v10, self->_quantity);
      objc_msgSend_setMaxValue_(v7, v11, v12, self->_quantity);
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)CLSQuantityReportItem;
      -[CLSReportItem convertToItemCompatibleWithItem:](&v14, sel_convertToItemCompatibleWithItem_, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7;
}

- (CLSQuantityReportItem)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  CLSQuantityReportItem *v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSQuantityReportItem;
  v6 = -[CLSActivityReportItem initWithCoder:](&v9, sel_initWithCoder_, v4);
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
  v6.super_class = (Class)CLSQuantityReportItem;
  v4 = a3;
  -[CLSActivityReportItem encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeDouble_forKey_(v4, v5, (uint64_t)CFSTR("quantity"), self->_quantity, v6.receiver, v6.super_class);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)compare:(id)a3
{
  void *v4;
  double quantity;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  double v10;
  int64_t v11;
  double v12;
  double v13;

  objc_msgSend_convertToItemCompatibleWithItem_copyIfSameType_(a3, a2, (uint64_t)self, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  quantity = self->_quantity;
  objc_msgSend_quantity(v4, v6, v7);
  if (quantity >= v10)
  {
    v12 = self->_quantity;
    objc_msgSend_quantity(v4, v8, v9);
    v11 = v12 > v13;
  }
  else
  {
    v11 = -1;
  }

  return v11;
}

- (void)add:(id)a3
{
  const char *v4;
  uint64_t v5;
  double v6;
  id v7;

  objc_msgSend_convertToItemCompatibleWithItem_(a3, a2, (uint64_t)self);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_quantity(v7, v4, v5);
  self->_quantity = v6 + self->_quantity;

}

- (void)scalarMultiply:(double)a3
{
  self->_quantity = self->_quantity * a3;
}

- (id)description
{
  id v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = objc_opt_class();
  v6 = (void *)objc_msgSend_initWithFormat_(v3, v5, (uint64_t)CFSTR("<%@ %p"), v4, self);
  objc_msgSend_title(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v10, (uint64_t)CFSTR(" title: %@"), v9);

  objc_msgSend_identifier(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v14, (uint64_t)CFSTR(" identifier: %@"), v13);

  objc_msgSend_quantity(self, v15, v16);
  objc_msgSend_appendFormat_(v6, v17, (uint64_t)CFSTR(" quantity: %.3f"), v18);
  objc_msgSend_appendString_(v6, v19, (uint64_t)CFSTR(">"));
  return v6;
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
  v12.super_class = (Class)CLSQuantityReportItem;
  -[CLSActivityReportItem dictionaryRepresentation](&v12, sel_dictionaryRepresentation);
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
  return self->_quantity;
}

- (void)setQuantity:(double)a3
{
  self->_quantity = a3;
}

@end
