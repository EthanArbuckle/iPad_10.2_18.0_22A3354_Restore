@implementation DTXMessageParser

- (DTXMessageParser)initWithMessageHandler:(id)a3 andParseExceptionHandler:(id)a4
{
  id v6;
  id v7;
  DTXMessageParser *v8;
  const char *v9;
  uint64_t v10;
  DTXMessageParser *v11;
  uint64_t BlockCompressor;
  DTXBlockCompressor *compressor;
  uint64_t v14;
  id exceptionHandler;
  uint64_t v16;
  id parsedMessageHandler;
  uint64_t v18;
  NSMutableDictionary *fragmentedBuffersByIdentifier;
  dispatch_queue_t v20;
  void *parsingQueue;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)DTXMessageParser;
  v8 = -[DTXMessageParser init](&v23, sel_init);
  v11 = v8;
  if (v8)
  {
    if (v6)
    {
      BlockCompressor = objc_msgSend_createBlockCompressor(DTXBlockCompressorFactory, v9, v10);
      compressor = v11->_compressor;
      v11->_compressor = (DTXBlockCompressor *)BlockCompressor;

      v14 = MEMORY[0x22079E258](v7);
      exceptionHandler = v11->_exceptionHandler;
      v11->_exceptionHandler = (id)v14;

      v16 = MEMORY[0x22079E258](v6);
      parsedMessageHandler = v11->_parsedMessageHandler;
      v11->_parsedMessageHandler = (id)v16;

      v18 = objc_opt_new();
      fragmentedBuffersByIdentifier = v11->_fragmentedBuffersByIdentifier;
      v11->_fragmentedBuffersByIdentifier = (NSMutableDictionary *)v18;

      v20 = dispatch_queue_create("DTXMessage parsing queue", 0);
      parsingQueue = v11->_parsingQueue;
      v11->_parsingQueue = (OS_dispatch_queue *)v20;
    }
    else
    {
      parsingQueue = v8;
      v11 = 0;
    }

  }
  return v11;
}

- (void)dealloc
{
  char *parsingBuffer;
  objc_super v4;

  parsingBuffer = (char *)self->_parsingBuffer;
  if (parsingBuffer)
  {
    free(parsingBuffer);
    self->_parsingBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DTXMessageParser;
  -[DTXMessageParser dealloc](&v4, sel_dealloc);
}

- (void)_messageParsedWithHeader:(DTXMessageHeader *)a3 bytes:(const void *)a4 length:(unint64_t)a5 destructor:(id)a6
{
  void *v10;
  DTXMessage *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  id v19;

  v19 = a6;
  v10 = (void *)MEMORY[0x22079E084]();
  v11 = [DTXMessage alloc];
  v13 = (void *)objc_msgSend_initWithSerializedForm_length_destructor_compressor_(v11, v12, (uint64_t)a4, a5, v19, self->_compressor);
  v15 = v13;
  if (v13)
  {
    objc_msgSend_setExpectsReply_(v13, v14, *((_DWORD *)&a3->var5 + 3) & 1);
    objc_msgSend_setIdentifier_(v15, v16, a3->var5.var0);
    objc_msgSend_setChannelCode_(v15, v17, a3->var5.var2);
    objc_msgSend_setConversationIndex_(v15, v18, a3->var5.var1);
    (*((void (**)(void))self->_parsedMessageHandler + 2))();
  }

  objc_autoreleasePoolPop(v10);
}

- (void)parseIncomingBytes:(const char *)a3 length:(unint64_t)a4
{
  NSObject *parsingQueue;
  id v5;
  _QWORD block[7];

  if (a3 && a4)
  {
    parsingQueue = self->_parsingQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_21DC976F4;
    block[3] = &unk_24E1AAC00;
    block[4] = self;
    block[5] = a4;
    block[6] = a3;
    dispatch_sync(parsingQueue, block);
  }
  else
  {
    v5 = (id)objc_msgSend_parsingComplete(self, a2, (uint64_t)a3, a4);
  }
}

- (id)parsingComplete
{
  NSObject *parsingQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_21DC97D90;
  v10 = sub_21DC97DA0;
  v11 = 0;
  parsingQueue = self->_parsingQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_21DC97DA8;
  v5[3] = &unk_24E1AAA28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(parsingQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)replaceCompressor:(id)a3
{
  objc_storeStrong((id *)&self->_compressor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compressor, 0);
  objc_storeStrong((id *)&self->_fragmentedBuffersByIdentifier, 0);
  objc_storeStrong((id *)&self->_parsingQueue, 0);
  objc_storeStrong(&self->_parsedMessageHandler, 0);
  objc_storeStrong(&self->_exceptionHandler, 0);
}

@end
