@implementation _MPMediaLibraryEntityChange

- (_MPMediaLibraryEntityChange)initWithEntity:(id)a3 anchor:(id)a4 deletionType:(int64_t)a5
{
  id v9;
  id v10;
  _MPMediaLibraryEntityChange *v11;
  _MPMediaLibraryEntityChange *v12;
  uint64_t v13;
  NSString *anchor;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_MPMediaLibraryEntityChange;
  v11 = -[_MPMediaLibraryEntityChange init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_entity, a3);
    v13 = objc_msgSend(v10, "copy");
    anchor = v12->_anchor;
    v12->_anchor = (NSString *)v13;

    v12->_deletionType = a5;
  }

  return v12;
}

- (MPMediaEntity)entity
{
  return self->_entity;
}

- (NSString)anchor
{
  return self->_anchor;
}

- (int64_t)deletionType
{
  return self->_deletionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_entity, 0);
}

@end
