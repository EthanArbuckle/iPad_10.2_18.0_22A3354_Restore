@implementation _MPMusicPlayerMediaItemProxy

- (_MPMusicPlayerMediaItemProxy)initWithItemIdentifier:(id)a3 item:(id)a4
{
  id v7;
  id v8;
  _MPMusicPlayerMediaItemProxy *v9;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    objc_storeStrong((id *)&self->_item, a4);
    objc_storeStrong((id *)&self->_itemIdentifier, a3);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  return self == a3 || -[MPMediaItem isEqual:](self->_item, "isEqual:");
}

- (void)forwardInvocation:(id)a3
{
  objc_msgSend(a3, "invokeWithTarget:", self->_item);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  -[MPMediaItem methodSignatureForSelector:](self->_item, "methodSignatureForSelector:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)_MPMusicPlayerMediaItemProxy;
    -[_MPMusicPlayerMediaItemProxy methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)description
{
  return (id)-[MPMediaItem description](self->_item, "description");
}

- (MPMediaItem)item
{
  return self->_item;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
