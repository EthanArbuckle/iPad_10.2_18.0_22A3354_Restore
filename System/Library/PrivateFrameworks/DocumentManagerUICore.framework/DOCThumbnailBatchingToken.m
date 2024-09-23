@implementation DOCThumbnailBatchingToken

- (void)_setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (!self->_invalidated)
  {
    -[DOCThumbnailBatchingToken _setInvalidated:](self, "_setInvalidated:", 1);
    +[DOCThumbnailGenerator sharedGenerator](DOCThumbnailGenerator, "sharedGenerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endBatching:", self);

  }
  v4.receiver = self;
  v4.super_class = (Class)DOCThumbnailBatchingToken;
  -[DOCThumbnailBatchingToken dealloc](&v4, sel_dealloc);
}

@end
