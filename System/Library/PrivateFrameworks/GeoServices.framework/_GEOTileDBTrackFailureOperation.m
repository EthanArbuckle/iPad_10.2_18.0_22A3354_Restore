@implementation _GEOTileDBTrackFailureOperation

- (void)initWithTileKey:(_OWORD *)a3 tileSet:(int)a4 shouldProactivelyLoad:(char)a5
{
  char *v8;
  void *v9;
  char *v10;
  objc_super v12;

  v12.receiver = a1;
  v12.super_class = (Class)_GEOTileDBTrackFailureOperation;
  v8 = -[_GEOTileDBTrackFailureOperation init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    *(_OWORD *)(v8 + 8) = *a3;
    *((_DWORD *)v8 + 6) = a4;
    v8[28] = a5;
    v10 = v8;
  }

  return v9;
}

- (uint64_t)key
{
  return a1 + 8;
}

- (unint64_t)sizeInBytes
{
  return 20;
}

- (BOOL)canIncreaseDataSizeInDB
{
  return 0;
}

- (void)performWithDB:(id)a3
{
  objc_msgSend(a3, "_trackFailureOnDBQueueWithKey:tileSet:shouldProactivelyLoad:", &self->_key, self->_tileSet.value, *(_BYTE *)&self->_tileSet.structured.var0.standard);
}

- (BOOL)isSupercededByOperation:(id)a3
{
  _BYTE *v4;
  _QWORD *v5;
  BOOL v7;
  _QWORD *v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (_QWORD *)objc_msgSend(v4, "key");
    if (*(_QWORD *)&self->_key != *v5 || *(_QWORD *)&self->_anon_c[4] != v5[1])
      goto LABEL_16;
    v7 = v4[28] != 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_16:
        v7 = 0;
        goto LABEL_17;
      }
    }
    v8 = (_QWORD *)objc_msgSend(v4, "key");
    v7 = *(_QWORD *)&self->_key == *v8 && *(_QWORD *)&self->_anon_c[4] == v8[1];
  }
LABEL_17:

  return v7;
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

@end
