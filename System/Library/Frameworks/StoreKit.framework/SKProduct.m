@implementation SKProduct

- (SKProduct)init
{
  SKProduct *v2;
  SKProductInternal *v3;
  id internal;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKProduct;
  v2 = -[SKProduct init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SKProductInternal);
    internal = v2->_internal;
    v2->_internal = v3;

  }
  return v2;
}

- (NSArray)downloadContentLengths
{
  return (NSArray *)*((id *)self->_internal + 3);
}

- (NSString)downloadContentVersion
{
  return (NSString *)*((id *)self->_internal + 1);
}

- (BOOL)isDownloadable
{
  return *((_BYTE *)self->_internal + 16);
}

- (BOOL)downloadable
{
  return *((_BYTE *)self->_internal + 16);
}

- (BOOL)isFamilyShareable
{
  return *((_BYTE *)self->_internal + 17);
}

- (SKProductDiscount)introductoryPrice
{
  return (SKProductDiscount *)*((id *)self->_internal + 4);
}

- (NSString)localizedDescription
{
  return (NSString *)*((id *)self->_internal + 5);
}

- (NSString)localizedTitle
{
  return (NSString *)*((id *)self->_internal + 6);
}

- (NSDecimalNumber)price
{
  return (NSDecimalNumber *)*((id *)self->_internal + 7);
}

- (NSLocale)priceLocale
{
  return (NSLocale *)*((id *)self->_internal + 8);
}

- (NSString)productIdentifier
{
  return (NSString *)*((id *)self->_internal + 9);
}

- (NSString)subscriptionGroupIdentifier
{
  return (NSString *)*((id *)self->_internal + 10);
}

- (SKProductSubscriptionPeriod)subscriptionPeriod
{
  return (SKProductSubscriptionPeriod *)*((id *)self->_internal + 11);
}

- (NSArray)discounts
{
  return (NSArray *)*((id *)self->_internal + 12);
}

- (void)_setContentVersion:(id)a3
{
  _QWORD *internal;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  internal = self->_internal;
  if ((id)internal[1] != a3)
  {
    v7 = internal;
    v5 = objc_msgSend(a3, "copy");
    v6 = (void *)internal[1];
    internal[1] = v5;

  }
}

- (void)_setDownloadContentLengths:(id)a3
{
  _QWORD *internal;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  internal = self->_internal;
  if ((id)internal[3] != a3)
  {
    v7 = internal;
    v5 = objc_msgSend(a3, "copy");
    v6 = (void *)internal[3];
    internal[3] = v5;

  }
}

- (void)_setDownloadable:(BOOL)a3
{
  *((_BYTE *)self->_internal + 16) = a3;
}

- (void)_setFamilyShareable:(BOOL)a3
{
  *((_BYTE *)self->_internal + 17) = a3;
}

- (void)_setIntroductoryPrice:(id)a3
{
  id v5;
  char *internal;
  id *v7;
  id v8;
  id v9;

  v5 = a3;
  internal = (char *)self->_internal;
  v8 = (id)*((_QWORD *)internal + 4);
  v7 = (id *)(internal + 32);
  if (v8 != v5)
  {
    v9 = v5;
    objc_storeStrong(v7, a3);
    v5 = v9;
  }

}

- (void)_setLocalizedDescription:(id)a3
{
  _QWORD *internal;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  internal = self->_internal;
  if ((id)internal[5] != a3)
  {
    v7 = internal;
    v5 = objc_msgSend(a3, "copy");
    v6 = (void *)internal[5];
    internal[5] = v5;

  }
}

- (void)_setLocalizedTitle:(id)a3
{
  _QWORD *internal;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  internal = self->_internal;
  if ((id)internal[6] != a3)
  {
    v7 = internal;
    v5 = objc_msgSend(a3, "copy");
    v6 = (void *)internal[6];
    internal[6] = v5;

  }
}

- (void)_setPrice:(id)a3
{
  id v5;
  char *internal;
  id *v7;
  id v8;
  id v9;

  v5 = a3;
  internal = (char *)self->_internal;
  v8 = (id)*((_QWORD *)internal + 7);
  v7 = (id *)(internal + 56);
  if (v8 != v5)
  {
    v9 = v5;
    objc_storeStrong(v7, a3);
    v5 = v9;
  }

}

- (void)_setPriceLocale:(id)a3
{
  id v5;
  id *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (id *)self->_internal;
  if (v6[8] != v5)
    objc_storeStrong(v6 + 8, a3);
  objc_msgSend(v6[4], "_setPriceLocale:", v5);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6[12];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "_setPriceLocale:", v5, (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)_setProductIdentifier:(id)a3
{
  _QWORD *internal;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  internal = self->_internal;
  if ((id)internal[9] != a3)
  {
    v7 = internal;
    v5 = objc_msgSend(a3, "copy");
    v6 = (void *)internal[9];
    internal[9] = v5;

  }
}

- (void)_setSubscriptionGroupIdentifier:(id)a3
{
  _QWORD *internal;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  internal = self->_internal;
  if ((id)internal[10] != a3)
  {
    v7 = internal;
    v5 = objc_msgSend(a3, "copy");
    v6 = (void *)internal[10];
    internal[10] = v5;

  }
}

- (void)_setSubscriptionPeriod:(id)a3
{
  id v5;
  char *internal;
  id *v7;
  id v8;
  id v9;

  v5 = a3;
  internal = (char *)self->_internal;
  v8 = (id)*((_QWORD *)internal + 11);
  v7 = (id *)(internal + 88);
  if (v8 != v5)
  {
    v9 = v5;
    objc_storeStrong(v7, a3);
    v5 = v9;
  }

}

- (void)_setDiscounts:(id)a3
{
  uint64_t v4;
  _QWORD *internal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  internal = self->_internal;
  v6 = (void *)internal[12];
  internal[12] = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_internal, 0);
}

@end
