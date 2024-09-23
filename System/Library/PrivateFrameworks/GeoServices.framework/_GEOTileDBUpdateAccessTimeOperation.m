@implementation _GEOTileDBUpdateAccessTimeOperation

- (BOOL)canIncreaseDataSizeInDB
{
  return 0;
}

- (void)performWithDB:(id)a3
{
  objc_msgSend(a3, "_setLastAccessTimeOnDBQueue:forKey:", &self->_key, self->_timestamp);
}

- (uint64_t)dataForKey:(uint64_t)a3 ETag:(_QWORD *)a4 originalLoadReason:(_BYTE *)a5 isKnownNotToExist:(_BYTE *)a6
{
  if (a4)
    *a4 = 0;
  if (a6)
    *a6 = 0;
  if (a5)
    *a5 = 0;
  return 0;
}

- (void)initWithTileKey:(uint64_t)a3 timestamp:(_OWORD *)a4
{
  char *v6;
  void *v7;
  char *v8;
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)_GEOTileDBUpdateAccessTimeOperation;
  v6 = -[_GEOTileDBUpdateAccessTimeOperation init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 8) = *a4;
    *((double *)v6 + 3) = a2;
    v8 = v6;
  }

  return v7;
}

- (BOOL)isSupercededByOperation:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  BOOL v7;
  _QWORD *v8;
  _QWORD *v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "reason");
    v7 = 0;
    if (v6 <= 4 && ((1 << v6) & 0x13) != 0)
    {
      v8 = (_QWORD *)objc_msgSend(v5, "key");
      v7 = *(_QWORD *)&self->_key == *v8 && *(_QWORD *)&self->_anon_c[4] == v8[1];
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = (_QWORD *)objc_msgSend(v4, "key");
      v7 = *(_QWORD *)&self->_key == *v10 && *(_QWORD *)&self->_anon_c[4] == v10[1];
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (uint64_t)key
{
  return a1 + 8;
}

- (unint64_t)sizeInBytes
{
  return 8;
}

@end
