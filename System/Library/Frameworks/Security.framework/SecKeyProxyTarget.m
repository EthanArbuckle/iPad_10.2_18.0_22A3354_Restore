@implementation SecKeyProxyTarget

- (SecKeyProxyTarget)initWithKey:(id)a3 certificate:(id)a4
{
  id v7;
  id v8;
  SecKeyProxyTarget *v9;
  SecKeyProxyTarget *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SecKeyProxyTarget;
  v9 = -[SecKeyProxyTarget init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_key, a3);
    objc_storeStrong((id *)&v10->_certificate, a4);
  }

  return v10;
}

- (__SecKey)key
{
  return (__SecKey *)self->_key;
}

- (void)initializeWithReply:(id)a3
{
  (*((void (**)(id, NSData *))a3 + 2))(a3, self->_certificate);
}

- (void)getBlockSizeWithReply:(id)a3
{
  __SecKey *v4;
  uint64_t (*v5)(__SecKey *);
  uint64_t v6;
  void (**v7)(id, uint64_t);

  v7 = (void (**)(id, uint64_t))a3;
  v4 = -[SecKeyProxyTarget key](self, "key");
  _SecKeyCheck((uint64_t)v4, (uint64_t)"SecKeyGetBlockSize");
  v5 = *(uint64_t (**)(__SecKey *))(*((_QWORD *)v4 + 2) + 80);
  if (v5)
    v6 = v5(v4);
  else
    v6 = 0;
  v7[2](v7, v6);

}

- (void)getAttributesWithReply:(id)a3
{
  void (**v4)(id, void *);
  CFDictionaryRef v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFData *v14;
  void *v15;
  id v16;

  v4 = (void (**)(id, void *))a3;
  v5 = SecKeyCopyAttributes(-[SecKeyProxyTarget key](self, "key"));
  v16 = (id)-[__CFDictionary mutableCopy](v5, "mutableCopy");

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("accc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v14 = SecAccessControlCopyData((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, CFSTR("accc"));

  }
  v15 = (void *)objc_msgSend(v16, "copy");
  v4[2](v4, v15);

}

- (void)getExternalRepresentationWithReply:(id)a3
{
  void (**v4)(id, CFDataRef, CFErrorRef);
  CFDataRef v5;
  CFErrorRef error;

  error = 0;
  v4 = (void (**)(id, CFDataRef, CFErrorRef))a3;
  v5 = SecKeyCopyExternalRepresentation(-[SecKeyProxyTarget key](self, "key"), &error);
  v4[2](v4, v5, error);

}

- (void)getDescriptionWithReply:(id)a3
{
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (**v8)(id, __CFString *);

  v8 = (void (**)(id, __CFString *))a3;
  v4 = (__CFString *)CFCopyDescription(-[SecKeyProxyTarget key](self, "key"));
  if (-[__CFString hasPrefix:](v4, "hasPrefix:", CFSTR("<SecKeyRef "))
    && (-[__CFString hasSuffix:](v4, "hasSuffix:", CFSTR(">")) & 1) != 0)
  {
    v5 = -12;
    v6 = 11;
LABEL_7:
    -[__CFString substringWithRange:](v4, "substringWithRange:", v6, -[__CFString length](v4, "length") + v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v7;
    goto LABEL_8;
  }
  if (-[__CFString hasPrefix:](v4, "hasPrefix:", CFSTR("<SecKeyRef: "))
    && -[__CFString hasSuffix:](v4, "hasSuffix:", CFSTR(">")))
  {
    v5 = -13;
    v6 = 12;
    goto LABEL_7;
  }
LABEL_8:
  v8[2](v8, v4);

}

- (void)getAlgorithmIDWithReply:(id)a3
{
  uint64_t AlgorithmId;
  id v6;

  v6 = a3;
  AlgorithmId = SecKeyGetAlgorithmId((uint64_t)-[SecKeyProxyTarget key](self, "key"));
  (*((void (**)(id, uint64_t))a3 + 2))(v6, AlgorithmId);

}

- (void)getPublicKey:(id)a3
{
  SecKeyProxy *publicKeyProxy;
  SecKeyRef v5;
  SecKeyRef v6;
  SecKeyProxy *v7;
  SecKeyProxy *v8;
  void *v9;
  void (**v10)(id, _QWORD);

  v10 = (void (**)(id, _QWORD))a3;
  publicKeyProxy = self->_publicKeyProxy;
  if (!publicKeyProxy)
  {
    v5 = SecKeyCopyPublicKey(-[SecKeyProxyTarget key](self, "key"));
    if (!v5)
    {
      v10[2](v10, 0);
      goto LABEL_5;
    }
    v6 = v5;
    v7 = -[SecKeyProxy initWithKey:]([SecKeyProxy alloc], "initWithKey:", v5);
    v8 = self->_publicKeyProxy;
    self->_publicKeyProxy = v7;

    publicKeyProxy = self->_publicKeyProxy;
  }
  -[SecKeyProxy endpoint](publicKeyProxy, "endpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *))v10)[2](v10, v9);

LABEL_5:
}

- (void)performOperation:(int64_t)a3 mode:(int64_t)a4 algorithm:(id)a5 parameters:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, void *, __CFString *);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFData *v19;
  __CFData *v20;
  void *v21;
  uint64_t v22[4];
  __CFString *v23;
  __CFData *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(id, void *, __CFString *))a7;
  v25[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }
  if ((unint64_t)objc_msgSend(v13, "count") < 2)
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v23 = 0;
  v22[0] = (uint64_t)-[SecKeyProxyTarget key](self, "key");
  v22[1] = a3;
  v22[2] = (uint64_t)v16;
  v22[3] = a4;
  v19 = SecKeyRunAlgorithmAndCopyResult(v22, (const __CFData *)v17, (const __CFData *)v18, &v23);
  v20 = v19;
  if (v19)
  {
    v24 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v21, v23);

  }
  else
  {
    v14[2](v14, (void *)MEMORY[0x1E0C9AA60], v23);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKeyProxy, 0);
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong(&self->_key, 0);
}

@end
