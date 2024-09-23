@implementation MTLLoadedFile

- (MTLLoadedFile)initWithData:(id)a3 parent:(void *)a4
{
  MTLLoadedFile *v6;
  MTLLoadedFile *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTLLoadedFile;
  v6 = -[MTLLoadedFile init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_fileData = (NSData *)a3;
    v6->_parent = a4;
  }
  else
  {

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_isCached)
    LoaderGlobalState::deallocFile((LoaderGlobalState *)self->_parent, self);

  v3.receiver = self;
  v3.super_class = (Class)MTLLoadedFile;
  -[MTLLoadedFile dealloc](&v3, sel_dealloc);
}

- (NSData)contents
{
  return self->_fileData;
}

@end
