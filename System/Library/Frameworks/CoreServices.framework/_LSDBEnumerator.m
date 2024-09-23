@implementation _LSDBEnumerator

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  id NextObject;
  id lastFastObject;
  id v9;

  if (a3->var0)
  {
    if (!a5)
      return 0;
  }
  else
  {
    a3->var1 = a4;
    a3->var2 = (unint64_t *)&mutationsPtr;
    a3->var0 = 1;
    if (!a5)
      return 0;
  }
  NextObject = _LSDBEnumeratorGetNextObject((uint64_t)self);
  lastFastObject = self->_lastFastObject;
  self->_lastFastObject = NextObject;

  v9 = self->_lastFastObject;
  if (v9)
  {
    *a4 = v9;
    return 1;
  }
  return 0;
}

- (id)nextObject
{
  return _LSDBEnumeratorGetNextObject((uint64_t)self);
}

- (id)_initWithContext:(LSContext *)CurrentContext
{
  id v4;
  void *v5;
  id v6;
  id v7;
  LSContext *v9;
  id v10;
  char v11;
  id v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_LSDBEnumerator;
  v4 = -[LSEnumerator _initWithContext:](&v13, sel__initWithContext_);
  v5 = v4;
  if (v4)
  {
    if (!CurrentContext)
      CurrentContext = (LSContext *)_LSDatabaseContextGetCurrentContext((LaunchServices::DatabaseContext *)v4);
    v9 = CurrentContext;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    LaunchServices::Database::Context::operator=((uint64_t)v5 + 32, (uint64_t)&v9);
    if (v9 && v11)
      _LSContextDestroy((void **)&v9->db);
    v6 = v10;
    v9 = 0;
    v10 = 0;

    v11 = 0;
    v7 = v12;
    v12 = 0;

  }
  return v5;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_BYTE *)self + 48) = 0;
  return self;
}

- (void).cxx_destruct
{
  Context *p_context;
  _LSDatabase *db;
  NSError *error;

  objc_storeStrong(&self->_lastFastObject, 0);
  p_context = &self->_context;
  if (p_context->_contextPointer && p_context->_created)
    _LSContextDestroy((void **)&p_context->_contextPointer->db);
  db = p_context->_contextStorage.db;
  p_context->_contextPointer = 0;
  p_context->_contextStorage.db = 0;

  p_context->_created = 0;
  error = p_context->_error;
  p_context->_error = 0;

}

- (BOOL)_prepareWithContext:(LSContext *)a3 error:(id *)a4
{
  abort();
}

- (BOOL)_getObject:(id *)a3 atIndex:(unint64_t)a4 context:(LSContext *)a5
{
  abort();
}

- (void)swift_forEach:(id)a3
{
  id NextObject;
  id v6;

  NextObject = _LSDBEnumeratorGetNextObject((uint64_t)self);
  if (NextObject)
  {
    v6 = NextObject;
    do
    {
      (*((void (**)(id, id))a3 + 2))(a3, v6);

      v6 = _LSDBEnumeratorGetNextObject((uint64_t)self);
    }
    while (v6);
  }
}

- (id)swift_firstWhere:(id)a3
{
  _LSDBEnumerator *i;
  id NextObject;

  for (i = self; ; self = i)
  {
    NextObject = _LSDBEnumeratorGetNextObject((uint64_t)self);
    if (!NextObject)
      break;
    if ((*((unsigned int (**)(id, id))a3 + 2))(a3, NextObject))
    {
      NextObject = NextObject;
      break;
    }

  }
  return NextObject;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  _QWORD *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_LSDBEnumerator;
  v4 = -[LSEnumerator copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    LaunchServices::Database::Context::operator=((uint64_t)(v4 + 4), (uint64_t)&self->_context);
    v5[8] = self->_index;
    *((_BYTE *)v5 + 80) = v5[10] & 0xFE | *((_BYTE *)self + 80) & 1;
    *((_BYTE *)v5 + 80) = v5[10] & 0xFD | *((_BYTE *)self + 80) & 2;
    *((_BYTE *)v5 + 80) = v5[10] & 0xFB | *((_BYTE *)self + 80) & 4;
  }
  return v5;
}

@end
