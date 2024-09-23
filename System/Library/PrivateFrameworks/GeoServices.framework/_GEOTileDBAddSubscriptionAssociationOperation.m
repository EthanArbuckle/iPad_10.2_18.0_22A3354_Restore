@implementation _GEOTileDBAddSubscriptionAssociationOperation

- (_QWORD)initWithTileKey:(_OWORD *)a3 subscriptionIdentifier:(void *)a4
{
  id v6;
  char *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = a1;
  v13.super_class = (Class)_GEOTileDBAddSubscriptionAssociationOperation;
  v7 = -[_GEOTileDBAddSubscriptionAssociationOperation init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    *(_OWORD *)(v7 + 8) = *a3;
    v9 = objc_msgSend(v6, "copy");
    v10 = (void *)v8[3];
    v8[3] = v9;

    v11 = v8;
  }

  return v8;
}

- (uint64_t)key
{
  return a1 + 8;
}

- (unint64_t)sizeInBytes
{
  return -[NSString lengthOfBytesUsingEncoding:](self->_subscriptionIdentifier, "lengthOfBytesUsingEncoding:", 4) + 16;
}

- (BOOL)canIncreaseDataSizeInDB
{
  return 0;
}

- (void)performWithDB:(id)a3
{
  objc_msgSend(a3, "_markDataForTileKey:associatedWithSubscriptionIdentifier:", &self->_key, self->_subscriptionIdentifier);
}

- (BOOL)isSupercededByOperation:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionIdentifier, 0);
}

@end
