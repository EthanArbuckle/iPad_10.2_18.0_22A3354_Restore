@implementation ASFAsn1ReceiptIAPToken

- (id)_initWithType:(void *)a3 typeVersion:(void *)a4 contentToken:
{
  id v8;
  id *v9;
  objc_super v11;

  v8 = a4;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)ASFAsn1ReceiptIAPToken;
    v9 = (id *)objc_msgSendSuper2(&v11, sel_init);
    a1 = v9;
    if (v9)
    {
      v9[1] = a2;
      v9[2] = a3;
      objc_storeStrong(v9 + 3, a4);
    }
  }

  return a1;
}

+ (id)readFromBuffer:(uint64_t)a1
{
  id v2;
  void **v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id *v12;
  ASFAsn1ReceiptIAPToken *v14;
  void *v15;
  uint64_t v16;

  v2 = a2;
  objc_opt_self();
  v16 = 0;
  +[ASFAsn1Token readTokenFromBuffer:length:]((uint64_t)ASFAsn1Token, v2, &v16);
  v3 = (void **)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = 0;
LABEL_11:
    v12 = 0;
    goto LABEL_13;
  }
  v4 = v16;
  v5 = objc_msgSend(v2, "length");
  objc_msgSend(v2, "subdataWithRange:", v4, v5 - v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[ASFAsn1Token readTokenFromBuffer:length:]((uint64_t)ASFAsn1Token, v6, &v16);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = 0;
    v2 = v6;
    goto LABEL_13;
  }
  v8 = v16;
  v9 = objc_msgSend(v6, "length");
  objc_msgSend(v6, "subdataWithRange:", v8, v9 - v16);
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if (!v3 || (char *)v3[4] - 1701 > (char *)5)
    goto LABEL_11;
  +[ASFAsn1Token readTokenFromBuffer:length:]((uint64_t)ASFAsn1Token, v2, &v16);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10 && *(_QWORD *)(v10 + 16) == 4 && !*(_BYTE *)(v10 + 8))
  {
    v14 = [ASFAsn1ReceiptIAPToken alloc];
    if (v7)
      v15 = (void *)v7[4];
    else
      v15 = 0;
    v12 = -[ASFAsn1ReceiptIAPToken _initWithType:typeVersion:contentToken:]((id *)&v14->super.isa, v3[4], v15, v11);
  }
  else
  {
    v12 = 0;
  }

LABEL_13:
  return v12;
}

- (id)description
{
  void *v2;
  unint64_t mType;
  unint64_t mTypeVersion;
  void *mContentToken;
  id v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDD17C8];
  mType = self->mType;
  mTypeVersion = self->mTypeVersion;
  mContentToken = self->mContentToken;
  if (mContentToken)
    mContentToken = objc_getProperty(mContentToken, a2, 24, 1);
  v6 = mContentToken;
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Type:%ld Version:%ld Data:%@"), mType, mTypeVersion, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (_QWORD)stringValue
{
  _QWORD **v1;

  if (a1)
  {
    v1 = a1;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ASFAsn1OSToken stringValue](v1[3]);
      a1 = (_QWORD **)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }
  }
  return a1;
}

- (uint64_t)integerValue
{
  uint64_t v1;
  const char *v2;
  void *v3;
  _QWORD *v4;

  v1 = a1;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = *(void **)(v1 + 24);
      if (v3)
      {
        v4 = objc_getProperty(v3, v2, 32, 1);
        if (v4 && !*((_BYTE *)v4 + 8) && v4[2] == 2)
        {
          v1 = v4[4];
LABEL_11:

          return v1;
        }
      }
      else
      {
        v4 = 0;
      }
      v1 = 0xFFFFLL;
      goto LABEL_11;
    }
    return 0xFFFFLL;
  }
  return v1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mContentToken, 0);
}

@end
