@implementation HAPTLVCreator

- (HAPTLVCreator)initWithBufferSize:(unint64_t)a3
{
  HAPTLVCreator *v3;
  HAPTLVCreator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HAPTLVCreator;
  v3 = -[HAPTLVCreator init](&v6, sel_init);
  v4 = v3;
  if (v3)
  {
    v3->_addHasFailed = 0;
    TLV8BufferInit();
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  TLV8BufferFree();
  v3.receiver = self;
  v3.super_class = (Class)HAPTLVCreator;
  -[HAPTLVCreator dealloc](&v3, sel_dealloc);
}

- (id)serialize
{
  if (self->_addHasFailed)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->_tlv.ptr, self->_tlv.len);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)addTLV:(unint64_t)a3 data:(id)a4
{
  id v5;
  void *v6;
  id v7;
  BOOL v8;

  v5 = a4;
  v6 = v5;
  if (!v5)
    goto LABEL_4;
  v7 = objc_retainAutorelease(v5);
  objc_msgSend(v7, "bytes");
  objc_msgSend(v7, "length");
  v8 = 1;
  if (TLV8BufferAppend())
  {
    self->_addHasFailed = 1;
LABEL_4:
    v8 = 0;
  }

  return v8;
}

- (BOOL)addTLV:(unint64_t)a3 string:(id)a4
{
  id v5;
  int v6;
  BOOL v7;

  if (!a4)
    return 0;
  objc_msgSend(a4, "dataUsingEncoding:", 4);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "bytes");
  objc_msgSend(v5, "length");
  v6 = TLV8BufferAppend();
  v7 = v6 == 0;
  if (v6)
    self->_addHasFailed = 1;

  return v7;
}

- (BOOL)addTLV:(unint64_t)a3 number:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;

  v5 = a4;
  v6 = v5;
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v5, "unsignedIntegerValue");
  v7 = 1;
  if (TLV8BufferAppendUInt64())
  {
    self->_addHasFailed = 1;
LABEL_4:
    v7 = 0;
  }

  return v7;
}

- (BOOL)addTLV:(unint64_t)a3 length:(unint64_t)a4 number:(id)a5
{
  void *v8;
  BOOL v9;
  uint64_t v11;

  if (!a5)
    return 0;
  v11 = objc_msgSend(a5, "unsignedIntegerValue");
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v11, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HAPTLVCreator addTLV:data:](self, "addTLV:data:", a3, v8);

  return v9;
}

- (BOOL)addTLV:(unint64_t)a3 length:(unint64_t)a4 floatNumber:(id)a5
{
  int v8;
  void *v9;
  BOOL v10;
  int v12;

  if (!a5)
    return 0;
  objc_msgSend(a5, "floatValue");
  v12 = v8;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v12, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HAPTLVCreator addTLV:data:](self, "addTLV:data:", a3, v9);

  return v10;
}

- (BOOL)addTLV:(unint64_t)a3 uuid:(id)a4
{
  int v5;
  BOOL result;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  if (!a4)
    return 0;
  v7[0] = 0;
  v7[1] = 0;
  objc_msgSend(a4, "getUUIDBytes:", v7);
  v5 = TLV8BufferAppend();
  result = v5 == 0;
  if (v5)
    self->_addHasFailed = 1;
  return result;
}

+ (id)creator
{
  return -[HAPTLVCreator initWithBufferSize:]([HAPTLVCreator alloc], "initWithBufferSize:", 0x4000);
}

+ (id)creatorWithBufferSize:(unint64_t)a3
{
  return -[HAPTLVCreator initWithBufferSize:]([HAPTLVCreator alloc], "initWithBufferSize:", a3);
}

@end
