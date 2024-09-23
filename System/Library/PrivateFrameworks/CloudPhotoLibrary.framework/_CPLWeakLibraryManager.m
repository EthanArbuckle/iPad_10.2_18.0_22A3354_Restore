@implementation _CPLWeakLibraryManager

- (_CPLWeakLibraryManager)initWithLibraryManager:(id)a3
{
  id v4;
  _CPLWeakLibraryManager *v5;
  _CPLWeakLibraryManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_CPLWeakLibraryManager;
  v5 = -[_CPLWeakLibraryManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_weakLibraryManager, v4);

  return v6;
}

- (CPLLibraryManager)weakLibraryManager
{
  return (CPLLibraryManager *)objc_loadWeakRetained((id *)&self->_weakLibraryManager);
}

- (void)setWeakLibraryManager:(id)a3
{
  objc_storeWeak((id *)&self->_weakLibraryManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakLibraryManager);
}

@end
