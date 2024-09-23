@implementation ASFAsn1Token

+ (ASFAsn1OSToken)readTokenFromBuffer:(int)a3 opaque:(_QWORD *)a4 length:
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  ASFAsn1Token *v19;
  unsigned __int8 v20;
  id v21;
  ASFAsn1OSToken *v22;
  ASFAsn1OSToken *v23;
  uint64_t v24;
  NSData *v25;
  ASFAsn1IntegerToken *v26;
  int v27;
  id v28;
  ASFAsn1IntegerToken *v29;
  uint64_t v30;
  NSData *v31;
  int v32;
  ASFAsn1IntegerToken *v33;
  int v34;
  id v35;
  ASFAsn1OSToken *v36;
  ASFAsn1OSToken *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSData *mData;
  uint64_t v42;
  NSData *v43;
  ASFAsn1Token *mValue;
  uint64_t v45;
  uint64_t v47;
  unsigned __int8 v48;
  objc_super v49;
  void *v50;
  void *v51;
  uint64_t *v52;
  _BYTE *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;

  v6 = a2;
  objc_opt_self();
  v48 = 0;
  v47 = 0;
  v7 = v6;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v8 = (void *)MEMORY[0x24BDAC760];
  v49.receiver = (id)MEMORY[0x24BDAC760];
  v49.super_class = (Class)3221225472;
  v50 = __readIdentifier_block_invoke;
  v51 = &unk_24C7D68F8;
  v52 = &v55;
  v53 = &v48;
  v54 = &v47;
  objc_msgSend(v7, "enumerateByteRangesUsingBlock:", &v49);
  v9 = v56[3];
  _Block_object_dispose(&v55, 8);

  v10 = v47;
  v11 = objc_msgSend(v7, "length");
  objc_msgSend(v7, "subdataWithRange:", v10, v11 - v47);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v12;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v49.receiver = v8;
  v49.super_class = (Class)3221225472;
  v50 = __readLength_block_invoke;
  v51 = &unk_24C7D6920;
  v52 = &v55;
  v53 = &v47;
  objc_msgSend(v13, "enumerateByteRangesUsingBlock:", &v49);
  v14 = v56[3];
  _Block_object_dispose(&v55, 8);

  v15 = objc_msgSend(v13, "length");
  v16 = v47;
  if (v14 >= v15 - v47)
    v17 = v15 - v47;
  else
    v17 = v14;
  objc_msgSend(v13, "subdataWithRange:", v47, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
    *a4 = v16 + v10 + v17;
  if (v48)
    goto LABEL_7;
  if (v9 == 2)
  {
    v26 = [ASFAsn1IntegerToken alloc];
    v32 = v48;
    v28 = v18;
    if (v26)
    {
      v49.receiver = v26;
      v49.super_class = (Class)ASFAsn1IntegerToken;
      v33 = (ASFAsn1IntegerToken *)objc_msgSendSuper2(&v49, sel_init);
      v26 = v33;
      if (!v32)
      {
        if (v33)
        {
          v33->super.mClass = 0;
          v33->super.mIdentifier = 2;
          v38 = objc_msgSend(v28, "length");
          if (v38 >= 8)
            v39 = 8;
          else
            v39 = v38;
          objc_msgSend(v28, "subdataWithRange:", 0, v39);
          v40 = objc_claimAutoreleasedReturnValue();
          mData = v26->super.mData;
          v26->super.mData = (NSData *)v40;

          v26->mValue = 0;
          -[NSData getBytes:length:](v26->super.mData, "getBytes:length:");
          v26->mValue = bswap64(v26->mValue) >> (-8 * v39);
        }
        goto LABEL_29;
      }
    }
LABEL_20:
    v23 = 0;
LABEL_30:

    goto LABEL_38;
  }
  if (v9 != 4)
  {
    if (v9 != 17)
    {
LABEL_7:
      v19 = [ASFAsn1Token alloc];
      v20 = v48;
      v21 = v18;
      if (v19)
      {
        v49.receiver = v19;
        v49.super_class = (Class)ASFAsn1Token;
        v22 = (ASFAsn1OSToken *)objc_msgSendSuper2(&v49, sel_init);
        v23 = v22;
        if (v22)
        {
          v22->super.mClass = v20;
          v22->super.mIdentifier = v9;
          v24 = objc_msgSend(v21, "copy");
          v25 = v23->super.mData;
          v23->super.mData = (NSData *)v24;

        }
      }
      else
      {
        v23 = 0;
      }

      goto LABEL_38;
    }
    v26 = [ASFAsn1SetToken alloc];
    v27 = v48;
    v28 = v18;
    if (v26)
    {
      v49.receiver = v26;
      v49.super_class = (Class)ASFAsn1SetToken;
      v29 = (ASFAsn1IntegerToken *)objc_msgSendSuper2(&v49, sel_init);
      v26 = v29;
      if (!v27)
      {
        if (v29)
        {
          v29->super.mClass = 0;
          v29->super.mIdentifier = 17;
          v30 = objc_msgSend(v28, "copy");
          v31 = v26->super.mData;
          v26->super.mData = (NSData *)v30;

          objc_storeStrong((id *)&v26->mValue, v26->super.mData);
        }
LABEL_29:
        v26 = v26;
        v23 = (ASFAsn1OSToken *)v26;
        goto LABEL_30;
      }
    }
    goto LABEL_20;
  }
  v23 = [ASFAsn1OSToken alloc];
  v34 = v48;
  v35 = v18;
  if (v23)
  {
    v49.receiver = v23;
    v49.super_class = (Class)ASFAsn1OSToken;
    v36 = (ASFAsn1OSToken *)objc_msgSendSuper2(&v49, sel_init);
    v37 = v36;
    if (v34)
    {
      v23 = 0;
    }
    else
    {
      if (v36)
      {
        v36->super.mClass = 0;
        v36->super.mIdentifier = 4;
        v42 = objc_msgSend(v35, "copy");
        v43 = v37->super.mData;
        v37->super.mData = (NSData *)v42;

        if (a3)
        {
          mValue = v37->mValue;
          v37->mValue = 0;
        }
        else
        {
          +[ASFAsn1Token readTokenFromBuffer:length:](ASFAsn1Token, v37->super.mData, 0);
          v45 = objc_claimAutoreleasedReturnValue();
          mValue = v37->mValue;
          v37->mValue = (ASFAsn1Token *)v45;
        }

      }
      v37 = v37;
      v23 = v37;
    }
  }
  else
  {
    v37 = 0;
  }

LABEL_38:
  return v23;
}

+ (id)readTokenFromBuffer:(_QWORD *)a3 length:
{
  id v4;
  void *v5;

  v4 = a2;
  objc_opt_self();
  +[ASFAsn1Token readTokenFromBuffer:opaque:length:]((uint64_t)ASFAsn1Token, v4, 0, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Token of class:%d ID:%ld length:%ld data:%@"), self->mClass, self->mIdentifier, -[NSData length](self->mData, "length"), self->mData);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mData, 0);
}

@end
