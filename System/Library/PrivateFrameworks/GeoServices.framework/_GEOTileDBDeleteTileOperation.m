@implementation _GEOTileDBDeleteTileOperation

- (void)initWithTileKey:(_OWORD *)a3
{
  char *v4;
  void *v5;
  char *v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)_GEOTileDBDeleteTileOperation;
  v4 = -[_GEOTileDBDeleteTileOperation init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 8) = *a3;
    v6 = v4;
  }

  return v5;
}

- (uint64_t)key
{
  return a1 + 8;
}

- (unint64_t)sizeInBytes
{
  return 0;
}

- (BOOL)canIncreaseDataSizeInDB
{
  return 0;
}

- (void)performWithDB:(id)a3
{
  objc_msgSend(a3, "_deleteDataOnDBQueueForKey:", &self->_key);
}

- (BOOL)isSupercededByOperation:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = objc_msgSend(v4, "key");
    v7 = *(_QWORD *)&self->_key == *(_QWORD *)v5 && self[1].super.isa == *(Class *)(v5 + 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)dataForKey:(_QWORD *)a3 ETag:(_QWORD *)a4 originalLoadReason:(_BYTE *)a5 isKnownNotToExist:(BOOL *)a6
{
  _BOOL4 v7;

  v7 = *(_QWORD *)(a1 + 8) != *a3 || *(_QWORD *)(a1 + 16) != a3[1];
  if (a4)
    *a4 = 0;
  if (a6)
    *a6 = !v7;
  if (a5)
    *a5 = 0;
  return 0;
}

@end
