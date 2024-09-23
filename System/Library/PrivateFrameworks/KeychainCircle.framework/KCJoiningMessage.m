@implementation KCJoiningMessage

- (BOOL)inflatePartsOfEncoding:(id *)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  id v19;
  unint64_t v20;
  NSData *v21;
  NSData *secondData;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v29;
  id v30[2];
  uint64_t v31;

  -[KCJoiningMessage der](self, "der");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "bytes");

  -[KCJoiningMessage der](self, "der");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 + objc_msgSend(v7, "length");

  v31 = 0;
  if (!ccder_decode_constructed_tl())
  {
    v14 = CFSTR("Not sequence");
    goto LABEL_5;
  }
  if (v31 != v8)
  {
    v14 = CFSTR("Extra data at end of message");
LABEL_5:
    KCJoiningErrorCreate(1, a3, v14, v9, v10, v11, v12, v13, (uint64_t)v29);
    return 0;
  }
  v30[1] = (id)0xAAAAAAAAAAAAAAAALL;
  v16 = ccder_decode_uint64();
  self->_type = 255;
  v30[0] = 0;
  v17 = kcder_decode_data_internal(v30, 0, a3, v16, v8);
  v18 = v30[0];
  v19 = v30[0];
  if (v17 == v8)
  {
    v21 = 0;
    v20 = v8;
  }
  else
  {
    v29 = 0;
    v20 = kcder_decode_data_internal(&v29, 0, a3, v17, v8);
    v21 = (NSData *)v29;
  }
  objc_storeStrong((id *)&self->_firstData, v18);
  secondData = self->_secondData;
  self->_secondData = v21;

  v15 = v20 == v8;
  if (v20 != v8)
    KCJoiningErrorCreate(1, a3, CFSTR("Extra in sequence"), v23, v24, v25, v26, v27, (uint64_t)v29);

  return v15;
}

- (KCJoiningMessage)initWithDER:(id)a3 error:(id *)a4
{
  id v6;
  KCJoiningMessage *v7;
  uint64_t v8;
  NSData *der;
  KCJoiningMessage *v10;
  KCJoiningMessage *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)KCJoiningMessage;
  v7 = -[KCJoiningMessage init](&v13, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    der = v7->_der;
    v7->_der = (NSData *)v8;

  }
  if (-[KCJoiningMessage inflatePartsOfEncoding:](v7, "inflatePartsOfEncoding:", a4))
    v10 = v7;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

- (KCJoiningMessage)initWithType:(int)a3 data:(id)a4 payload:(id)a5 error:(id *)a6
{
  uint64_t v8;
  id v10;
  id v11;
  KCJoiningMessage *v12;
  uint64_t v13;
  NSData *der;
  KCJoiningMessage *v15;
  KCJoiningMessage *v16;
  objc_super v18;

  v8 = *(_QWORD *)&a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)KCJoiningMessage;
  v12 = -[KCJoiningMessage init](&v18, sel_init);
  if (v12
    && (+[KCJoiningMessage encodeToDERType:data:payload:error:](KCJoiningMessage, "encodeToDERType:data:payload:error:", v8, v10, v11, a6), v13 = objc_claimAutoreleasedReturnValue(), der = v12->_der, v12->_der = (NSData *)v13, der, !v12->_der))
  {
    v16 = 0;
  }
  else
  {
    if (-[KCJoiningMessage inflatePartsOfEncoding:](v12, "inflatePartsOfEncoding:", a6))
      v15 = v12;
    else
      v15 = 0;
    v16 = v15;
  }

  return v16;
}

- (int)type
{
  return self->_type;
}

- (NSData)firstData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)secondData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)der
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_der, 0);
  objc_storeStrong((id *)&self->_secondData, 0);
  objc_storeStrong((id *)&self->_firstData, 0);
}

+ (id)messageWithDER:(id)a3 error:(id *)a4
{
  id v4;
  KCJoiningMessage *v5;

  v4 = a3;
  v5 = -[KCJoiningMessage initWithDER:error:]([KCJoiningMessage alloc], "initWithDER:error:", v4, 0);

  return v5;
}

+ (id)messageWithType:(int)a3 data:(id)a4 error:(id *)a5
{
  uint64_t v6;
  id v7;
  KCJoiningMessage *v8;

  v6 = *(_QWORD *)&a3;
  v7 = a4;
  v8 = -[KCJoiningMessage initWithType:data:payload:error:]([KCJoiningMessage alloc], "initWithType:data:payload:error:", v6, v7, 0, a5);

  return v8;
}

+ (id)messageWithType:(int)a3 data:(id)a4 secondData:(id)a5 error:(id *)a6
{
  uint64_t v8;
  id v9;
  id v10;
  KCJoiningMessage *v11;

  v8 = *(_QWORD *)&a3;
  v9 = a5;
  v10 = a4;
  v11 = -[KCJoiningMessage initWithType:data:payload:error:]([KCJoiningMessage alloc], "initWithType:data:payload:error:", v8, v10, v9, a6);

  return v11;
}

+ (id)messageWithType:(int)a3 data:(id)a4 payload:(id)a5 error:(id *)a6
{
  uint64_t v8;
  id v9;
  id v10;
  KCJoiningMessage *v11;

  v8 = *(_QWORD *)&a3;
  v9 = a5;
  v10 = a4;
  v11 = -[KCJoiningMessage initWithType:data:payload:error:]([KCJoiningMessage alloc], "initWithType:data:payload:error:", v8, v10, v9, a6);

  return v11;
}

+ (unint64_t)encodedSizeType:(int)a3 data:(id)a4 payload:(id)a5 error:(id *)a6
{
  id v7;
  unint64_t v8;

  v7 = a5;
  ccder_sizeof_uint64();
  objc_msgSend(a4, "length");
  if (ccder_sizeof_raw_octet_string())
  {
    if (v7)
    {
      objc_msgSend(v7, "length");
      ccder_sizeof_raw_octet_string();
    }
    v8 = ccder_sizeof();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)encodeToDERType:(int)a3 data:(id)a4 payload:(id)a5 error:(id *)a6
{
  uint64_t v8;
  id v9;
  id v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v22;

  v8 = *(_QWORD *)&a3;
  v9 = a4;
  v10 = a5;
  v11 = +[KCJoiningMessage encodedSizeType:data:payload:error:](KCJoiningMessage, "encodedSizeType:data:payload:error:", v8, v9, v10, a6);
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v11);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend(v12, "mutableBytes");
    objc_msgSend(v12, "length");
    if (v10)
      kcder_encode_data(v10);
    kcder_encode_data(v9);
    ccder_encode_uint64();
    v14 = ccder_encode_constructed_tl();
    if (v14)
    {
      if (v14 == v13)
      {
        v20 = v12;
        goto LABEL_10;
      }
      KCJoiningErrorCreate(3, a6, CFSTR("Size didn't match encoding"), v15, v16, v17, v18, v19, v22);
    }
    v20 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v20 = 0;
LABEL_11:

  return v20;
}

@end
