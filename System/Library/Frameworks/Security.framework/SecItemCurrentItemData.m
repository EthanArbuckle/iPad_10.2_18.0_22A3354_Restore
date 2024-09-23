@implementation SecItemCurrentItemData

- (SecItemCurrentItemData)initWithPersistentRef:(id)a3
{
  id v4;
  SecItemCurrentItemData *v5;
  SecItemCurrentItemData *v6;
  SecItemCurrentItemData *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SecItemCurrentItemData;
  v5 = -[SecItemCurrentItemData init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SecItemCurrentItemData setPersistentRef:](v5, "setPersistentRef:", v4);
    v7 = v6;
  }

  return v6;
}

- (NSData)persistentRef
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPersistentRef:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDate)currentItemPointerModificationTime
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCurrentItemPointerModificationTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentItemPointerModificationTime, 0);
  objc_storeStrong((id *)&self->_persistentRef, 0);
}

@end
