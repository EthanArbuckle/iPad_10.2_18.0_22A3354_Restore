@implementation FCPersistenceCoder

- (_QWORD)initWithKey:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)FCPersistenceCoder;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "copy");
      v5 = (void *)a1[1];
      a1[1] = v4;

    }
  }

  return a1;
}

- (id)encodeData:(void *)a1
{
  if (a1)
  {
    -[FCPersistenceCoder _codeData:]((uint64_t)a1, a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_codeData:(uint64_t)a1
{
  id v3;
  id v4;
  _BYTE *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _BYTE *v9;
  char *v10;
  char v11;

  v3 = a2;
  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 8), "length"))
    {
      v4 = objc_retainAutorelease((id)objc_msgSend(v3, "mutableCopy"));
      v5 = (_BYTE *)objc_msgSend(v4, "mutableBytes");
      v6 = objc_msgSend(v4, "length");
      v7 = (char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 8)), "bytes");
      v8 = objc_msgSend(*(id *)(a1 + 8), "length");
      if (v6 >= 1)
      {
        v9 = &v5[v6];
        v10 = &v7[v8];
        do
        {
          v11 = *v7++;
          *v5++ ^= v11;
          if (v7 == v10)
            v7 = (char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 8)), "bytes");
        }
        while (v5 < v9);
      }
    }
    else
    {
      v4 = v3;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
