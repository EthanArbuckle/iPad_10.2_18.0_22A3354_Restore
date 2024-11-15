@implementation ASFAsn1ReceiptToken

+ (ASFAsn1ReceiptToken)readFromBuffer:(uint64_t)a1
{
  id v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  ASFAsn1ReceiptToken *v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  ASFAsn1ReceiptToken *v18;
  uint64_t v20;
  objc_super v21;

  v2 = a2;
  objc_opt_self();
  v20 = 0;
  +[ASFAsn1Token readTokenFromBuffer:length:]((uint64_t)ASFAsn1Token, v2, &v20);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = 0;
LABEL_11:
    v10 = 0;
    goto LABEL_25;
  }
  v4 = v20;
  v5 = objc_msgSend(v2, "length");
  objc_msgSend(v2, "subdataWithRange:", v4, v5 - v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[ASFAsn1Token readTokenFromBuffer:length:]((uint64_t)ASFAsn1Token, v6, &v20);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    v2 = v6;
    goto LABEL_25;
  }
  v8 = v20;
  v9 = objc_msgSend(v6, "length");
  objc_msgSend(v6, "subdataWithRange:", v8, v9 - v20);
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
LABEL_6:
    +[ASFAsn1Token readTokenFromBuffer:length:]((uint64_t)ASFAsn1Token, v2, &v20);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (id)v12;
    if (!v12 || *(_QWORD *)(v12 + 16) != 4 || *(_BYTE *)(v12 + 8))
    {
      v10 = 0;
LABEL_24:

      goto LABEL_25;
    }
    v10 = [ASFAsn1ReceiptToken alloc];
    if (!v3)
    {
      v15 = 0;
      goto LABEL_18;
    }
LABEL_17:
    v15 = v3[4];
LABEL_18:
    v16 = v13;
    if (v7)
      v17 = v7[4];
    else
      v17 = 0;
    v13 = v13;
    if (v10)
    {
      v21.receiver = v10;
      v21.super_class = (Class)ASFAsn1ReceiptToken;
      v18 = (ASFAsn1ReceiptToken *)objc_msgSendSuper2(&v21, sel_init);
      v10 = v18;
      if (v18)
      {
        v18->mType = v15;
        v18->mTypeVersion = v17;
        objc_storeStrong((id *)&v18->mContentToken, v16);
      }
    }

    goto LABEL_24;
  }
  v10 = 0;
  v11 = v3[4];
  if (v11 <= 0x18)
  {
    if (((1 << v11) & 0x1E1FF1F) != 0)
      goto LABEL_6;
    if (((1 << v11) & 0x200E0) != 0)
    {
      +[ASFAsn1Token readTokenFromBuffer:opaque:length:]((uint64_t)ASFAsn1Token, v2, 1, &v20);
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v13 = (id)v14;
        v10 = [ASFAsn1ReceiptToken alloc];
        goto LABEL_17;
      }
      goto LABEL_11;
    }
  }
LABEL_25:

  return v10;
}

- (uint64_t)contentIsAnInteger
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
        if (v4 && !*((_BYTE *)v4 + 8))
        {
          v1 = v4[2] == 2;
          goto LABEL_9;
        }
      }
      else
      {
        v4 = 0;
      }
      v1 = 0;
LABEL_9:

      return v1;
    }
    return 0;
  }
  return v1;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mContentToken, 0);
}

@end
