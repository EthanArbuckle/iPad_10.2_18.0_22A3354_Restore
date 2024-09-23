@implementation CKXStructArrayProxy

- (void)enumerate:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = a3;
  if (v6)
  {
    v7 = objc_msgSend_count(self, v4, v5);
    v10 = v7 - 1;
    if (v7 >= 1)
    {
      v11 = 0;
      v12 = MEMORY[0x1E0C809B0];
      do
      {
        v20 = 0;
        v21 = &v20;
        v22 = 0x2020000000;
        v23 = 0;
        objc_msgSend_backingStore(self, v8, v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = v12;
        v16[1] = 3221225472;
        v16[2] = sub_1D4BCB484;
        v16[3] = &unk_1E984B810;
        v16[4] = self;
        v19 = v11;
        v17 = v6;
        v18 = &v20;
        objc_msgSend_proxyScope_(v13, v14, (uint64_t)v16);

        LODWORD(v13) = *((unsigned __int8 *)v21 + 24);
        _Block_object_dispose(&v20, 8);
        if ((_DWORD)v13)
          break;
      }
      while (v10 != v11++);
    }
  }

}

- (int64_t)count
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  int64_t v10;
  uint64_t v12;

  objc_msgSend_backingStore(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readerForProxy_(v4, v5, (uint64_t)self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_listInstance(self, v7, v8);
  v10 = objc_msgSend_lengthForList_(v6, v9, (uint64_t)&v12);

  return v10;
}

- (id)proxyAtIndex:(int64_t)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  uint64_t v11;

  objc_msgSend_backingStore(self, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_listInstance(self, v6, v7);
  objc_msgSend_structProxyForListInstance_atIndex_(v5, v8, (uint64_t)&v11, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
