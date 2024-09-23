@implementation MSASPersonModelItem

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSObject *object;
  void *v6;
  char v7;
  BOOL v9;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    object = self->_object;
    objc_msgSend(v4, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[NSObject isEqual:](object, "isEqual:", v6);
    return v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MSASPersonModelItem;
    v9 = -[MSASPersonModelItem isEqual:](&v10, sel_isEqual_, v4);

    return v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  MSASPersonModelItem *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(MSASPersonModelItem);
  -[MSASPersonModelItem setErrorCount:](v4, "setErrorCount:", -[MSASPersonModelItem errorCount](self, "errorCount"));
  -[MSASPersonModelItem object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASPersonModelItem setObject:](v4, "setObject:", v5);

  -[MSASPersonModelItem album](self, "album");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASPersonModelItem setAlbum:](v4, "setAlbum:", v6);

  -[MSASPersonModelItem albumGUID](self, "albumGUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASPersonModelItem setAlbumGUID:](v4, "setAlbumGUID:", v7);

  return v4;
}

- (int)errorCount
{
  return self->_errorCount;
}

- (void)setErrorCount:(int)a3
{
  self->_errorCount = a3;
}

- (MSASAlbum)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_album, a3);
}

- (NSString)albumGUID
{
  return self->_albumGUID;
}

- (void)setAlbumGUID:(id)a3
{
  objc_storeStrong((id *)&self->_albumGUID, a3);
}

- (NSObject)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  objc_storeStrong((id *)&self->_object, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_object, 0);
  objc_storeStrong((id *)&self->_albumGUID, 0);
  objc_storeStrong((id *)&self->_album, 0);
}

@end
