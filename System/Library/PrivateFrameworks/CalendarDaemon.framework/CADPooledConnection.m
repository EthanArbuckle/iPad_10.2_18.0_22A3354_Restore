@implementation CADPooledConnection

- (CADPooledConnection)initWithDatabase:(CalDatabase *)a3
{
  CADPooledConnection *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CADPooledConnection;
  v4 = -[CADPooledConnection init](&v6, sel_init);
  if (v4)
  {
    CFRetain(a3);
    v4->_database = a3;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_database);
  v3.receiver = self;
  v3.super_class = (Class)CADPooledConnection;
  -[CADPooledConnection dealloc](&v3, sel_dealloc);
}

- (CalDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(CalDatabase *)a3
{
  self->_database = a3;
}

- (unint64_t)lastUsedTimestamp
{
  return self->_lastUsedTimestamp;
}

- (void)setLastUsedTimestamp:(unint64_t)a3
{
  self->_lastUsedTimestamp = a3;
}

@end
