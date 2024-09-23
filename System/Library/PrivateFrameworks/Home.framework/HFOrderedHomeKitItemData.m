@implementation HFOrderedHomeKitItemData

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)actionSetType
{
  return self->_actionSetType;
}

- (NSString)title
{
  return self->_title;
}

- (NSDate)dateAdded
{
  return self->_dateAdded;
}

+ (id)dataWithUniqueIdentifier:(id)a3 title:(id)a4 dateAdded:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init((Class)a1);
  objc_msgSend(v11, "setUniqueIdentifier:", v10);

  objc_msgSend(v11, "setTitle:", v9);
  objc_msgSend(v11, "setDateAdded:", v8);

  return v11;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setDateAdded:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionSetType, 0);
  objc_storeStrong((id *)&self->_dateAdded, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (void)setActionSetType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
