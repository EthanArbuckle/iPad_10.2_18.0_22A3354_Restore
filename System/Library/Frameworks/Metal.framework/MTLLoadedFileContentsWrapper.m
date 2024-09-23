@implementation MTLLoadedFileContentsWrapper

- (OS_dispatch_data)dispatchData
{
  return self->_dispatchData;
}

- (MTLLoadedFileContentsWrapper)initWithData:(id)a3
{
  MTLLoadedFileContentsWrapper *v4;
  NSData *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLLoadedFileContentsWrapper;
  v4 = -[MTLLoadedFileContentsWrapper init](&v7, sel_init);
  if (v4)
  {
    v5 = (NSData *)a3;
    v4->_sourceContents = v5;
    v4->_dispatchData = (OS_dispatch_data *)_MTLNSDataToDispatchData(v5, 0);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_dispatchData);

  v3.receiver = self;
  v3.super_class = (Class)MTLLoadedFileContentsWrapper;
  -[MTLLoadedFileContentsWrapper dealloc](&v3, sel_dealloc);
}

- (const)bytes
{
  return -[NSData bytes](self->_sourceContents, "bytes");
}

- (unint64_t)length
{
  return -[NSData length](self->_sourceContents, "length");
}

- (NSData)sourceContents
{
  return self->_sourceContents;
}

@end
