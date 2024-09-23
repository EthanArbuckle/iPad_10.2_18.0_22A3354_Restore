@implementation CLSArchivedMultipleChoiceAnswerItem

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSArchivedMultipleChoiceAnswerItem;
  return -[CLSObject _init](&v3, sel__init);
}

- (CLSArchivedMultipleChoiceAnswerItem)initWithText:(id)a3
{
  id v5;
  id *v6;
  CLSArchivedMultipleChoiceAnswerItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSArchivedMultipleChoiceAnswerItem;
  v6 = -[CLSObject _init](&v9, sel__init);
  v7 = (CLSArchivedMultipleChoiceAnswerItem *)v6;
  if (v6)
    objc_storeStrong(v6 + 13, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSArchivedMultipleChoiceAnswerItem)initWithCoder:(id)a3
{
  id v4;
  CLSArchivedMultipleChoiceAnswerItem *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *itemText;
  const char *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CLSArchivedMultipleChoiceAnswerItem;
  v5 = -[CLSObject initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("itemText"));
    v8 = objc_claimAutoreleasedReturnValue();
    itemText = v5->_itemText;
    v5->_itemText = (NSString *)v8;

    v5->_displayOrder = objc_msgSend_decodeIntegerForKey_(v4, v10, (uint64_t)CFSTR("displayOrder"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLSArchivedMultipleChoiceAnswerItem;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_itemText, CFSTR("itemText"), v7.receiver, v7.super_class);
  objc_msgSend_encodeInteger_forKey_(v4, v6, self->_displayOrder, CFSTR("displayOrder"));

}

- (NSString)itemText
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_itemText;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setItemText:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *itemText;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  itemText = self->_itemText;
  v12 = (id)v8;
  if (v8 | (unint64_t)itemText
    && (!v8 || !itemText || (objc_msgSend_isEqualToString_(itemText, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_itemText, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (int64_t)displayOrder
{
  uint64_t v2;
  int64_t displayOrder;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  displayOrder = self->_displayOrder;
  objc_msgSend_unlock(self, v5, v6);
  return displayOrder;
}

- (void)setDisplayOrder:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_displayOrder != a3)
  {
    self->_displayOrder = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (NSArray)assets
{
  uint64_t v3;
  const char *v4;

  v3 = objc_opt_class();
  return (NSArray *)objc_msgSend_childrenOfClass_(self, v4, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->assets, 0);
  objc_storeStrong((id *)&self->_itemText, 0);
}

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40CC3CC;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB940 != -1)
    dispatch_once(&qword_1ED0FB940, block);
  return (id)qword_1ED0FB938;
}

@end
