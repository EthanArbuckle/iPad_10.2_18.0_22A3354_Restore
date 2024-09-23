@implementation NSCachedFetchRequestThunk

- (id)initForConnection:(id)a3
{
  NSCachedFetchRequestThunk *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSCachedFetchRequestThunk;
  v4 = -[NSCachedFetchRequestThunk init](&v6, sel_init);
  if (v4)
    v4->_connection = -[_PFWeakReference initWithObject:]([_PFWeakReference alloc], "initWithObject:", a3);
  return v4;
}

void __40__NSCachedFetchRequestThunk_clearCaches__block_invoke(void **a1)
{
  -[NSSQLiteStatement clearCaches:](a1[4], 1);
  -[NSSQLiteStatement clearCaches:](a1[5], 1);

}

- (void)dealloc
{
  NSSQLiteStatement *unlimitedStatement;
  NSSQLiteStatement *limitedStatement;
  id *connection;
  id WeakRetained;
  void *v7;
  objc_super v8;
  _QWORD v9[7];

  if (self)
  {
    limitedStatement = self->_limitedStatement;
    unlimitedStatement = self->_unlimitedStatement;
    self->_limitedStatement = 0;
    self->_unlimitedStatement = 0;
    connection = (id *)self->_connection;
    if (connection)
    {
      WeakRetained = objc_loadWeakRetained(connection + 1);
      v7 = WeakRetained;
      if (WeakRetained && (unint64_t)limitedStatement | (unint64_t)unlimitedStatement)
      {
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __40__NSCachedFetchRequestThunk_clearCaches__block_invoke;
        v9[3] = &unk_1E1EDD790;
        v9[4] = limitedStatement;
        v9[5] = unlimitedStatement;
        v9[6] = WeakRetained;
        -[NSSQLiteConnection _performBlock:]((uint64_t)WeakRetained, (uint64_t)v9);
        goto LABEL_8;
      }
    }
    else
    {
      v7 = 0;
    }

  }
LABEL_8:

  self->_connection = 0;
  v8.receiver = self;
  v8.super_class = (Class)NSCachedFetchRequestThunk;
  -[NSCachedFetchRequestThunk dealloc](&v8, sel_dealloc);
}

@end
