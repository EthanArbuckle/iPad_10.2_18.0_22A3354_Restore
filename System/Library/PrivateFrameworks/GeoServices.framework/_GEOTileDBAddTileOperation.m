@implementation _GEOTileDBAddTileOperation

- (id)initWithTileKey:(_OWORD *)a3 tileSet:(int)a4 data:(void *)a5 ETag:(void *)a6 reason:(char)a7 externalResourceUUID:(void *)a8 forSubscriptionWithIdentifier:(void *)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  char *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  objc_super v28;

  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = a9;
  v28.receiver = a1;
  v28.super_class = (Class)_GEOTileDBAddTileOperation;
  v20 = -[_GEOTileDBAddTileOperation init](&v28, sel_init);
  v21 = v20;
  if (v20)
  {
    *(_OWORD *)(v20 + 8) = *a3;
    *((_DWORD *)v20 + 6) = a4;
    objc_storeStrong((id *)v20 + 4, a5);
    v22 = objc_msgSend(v17, "copy");
    v23 = (void *)*((_QWORD *)v21 + 5);
    *((_QWORD *)v21 + 5) = v22;

    *((_BYTE *)v21 + 48) = a7;
    objc_storeStrong((id *)v21 + 7, a8);
    v24 = objc_msgSend(v19, "copy");
    v25 = (void *)*((_QWORD *)v21 + 8);
    *((_QWORD *)v21 + 8) = v24;

    v26 = v21;
  }

  return v21;
}

- (uint64_t)key
{
  return a1 + 8;
}

- (unint64_t)sizeInBytes
{
  return -[GEOTileData length](self->_data, "length");
}

- (BOOL)canIncreaseDataSizeInDB
{
  return 1;
}

- (void)performWithDB:(id)a3
{
  objc_msgSend(a3, "_addDataOnDBQueueWithData:key:tileSet:ETag:reason:externalResourceUUID:subscriptionIdentifier:", self->_data, &self->_key, self->_tileSet.value, self->_ETag, self->_reason, self->_externalResourceUUID, self->_subscriptionIdentifier);
}

- (BOOL)isSupercededByOperation:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = (_QWORD *)objc_msgSend(v4, "key");
    v7 = *(_QWORD *)&self->_key == *v5 && *(_QWORD *)&self->_anon_c[4] == v5[1];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)dataForKey:(_QWORD *)a3 ETag:(_QWORD *)a4 originalLoadReason:(_BYTE *)a5 isKnownNotToExist:(_BYTE *)a6
{
  id v10;
  id v11;
  char v12;

  if (*(_QWORD *)(a1 + 8) != *a3 || *(_QWORD *)(a1 + 16) != a3[1])
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    if (!a4)
      goto LABEL_7;
    goto LABEL_6;
  }
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = *(_BYTE *)(a1 + 48);
  if (a4)
LABEL_6:
    *a4 = objc_retainAutorelease(v11);
LABEL_7:
  if (a6)
    *a6 = 0;
  if (a5)
    *a5 = v12;

  return v10;
}

- (unsigned)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionIdentifier, 0);
  objc_storeStrong((id *)&self->_externalResourceUUID, 0);
  objc_storeStrong((id *)&self->_ETag, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
