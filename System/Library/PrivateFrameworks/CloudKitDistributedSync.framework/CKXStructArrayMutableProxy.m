@implementation CKXStructArrayMutableProxy

- (BOOL)isMutable
{
  return 1;
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKXStructArrayMutableProxy;
  -[CKXArrayProxyBase reset](&v3, sel_reset);
  self->_index = -1;
}

- (int64_t)count
{
  uint64_t v2;

  return objc_msgSend_index(self, a2, v2) + 1;
}

- (void)appendWithProxyBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v8 = a3;
  if (v8)
  {
    objc_msgSend_backingStore(self, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1D4BCB768;
    v9[3] = &unk_1E984B838;
    v9[4] = self;
    v10 = v8;
    objc_msgSend_proxyScope_(v6, v7, (uint64_t)v9);

  }
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

@end
