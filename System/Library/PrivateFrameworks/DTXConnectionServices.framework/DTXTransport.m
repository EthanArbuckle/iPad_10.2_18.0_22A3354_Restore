@implementation DTXTransport

+ (id)schemes
{
  return 0;
}

+ (BOOL)recognizesURL:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;

  v4 = a3;
  objc_msgSend_schemes(a1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scheme(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend_containsObject_(v7, v11, (uint64_t)v10);
  return (char)v4;
}

- (DTXTransport)init
{
  DTXTransport *v2;
  DTXTransport *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DTXTransport;
  v2 = -[DTXTransport init](&v5, sel_init);
  v3 = v2;
  if (v2)
    sub_21DC8AF6C(v2);
  return v3;
}

- (DTXTransport)initWithXPCRepresentation:(id)a3
{
  id v4;
  DTXTransport *v5;
  DTXTransport *v6;
  const void *data;
  const void *v8;
  void *v9;
  NSObject *serializer;
  DTXTransport *v11;
  _QWORD v13[4];
  DTXTransport *v14;
  void *v15;
  size_t v16;
  size_t length;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DTXTransport;
  v5 = -[DTXTransport init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    sub_21DC8AF6C(v5);
    if (!v4)
    {
      v11 = 0;
      goto LABEL_8;
    }
    length = 0;
    data = xpc_dictionary_get_data(v4, "__DTXTransport_preflightdata", &length);
    if (data)
    {
      v8 = data;
      if (length)
      {
        v9 = malloc_type_malloc(length, 0x34527BAAuLL);
        memcpy(v9, v8, length);
        serializer = v6->_serializer;
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = sub_21DC8B15C;
        v13[3] = &unk_24E1AAC00;
        v14 = v6;
        v15 = v9;
        v16 = length;
        dispatch_async(serializer, v13);

      }
    }
  }
  v11 = v6;
LABEL_8:

  return v11;
}

- (id)serializedXPCRepresentation
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_resumed)
    dispatch_resume((dispatch_object_t)self->_serializer);
  v3.receiver = self;
  v3.super_class = (Class)DTXTransport;
  -[DTXTransport dealloc](&v3, sel_dealloc);
}

- (DTXTransport)initWithRemoteAddress:(id)a3
{
  id v5;
  DTXTransport *v6;
  DTXTransport *v7;
  void *v8;
  const char *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DTXTransport;
  v6 = -[DTXTransport init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    sub_21DC8AF6C(v6);
    v8 = (void *)objc_opt_class();
    if ((objc_msgSend_recognizesURL_(v8, v9, (uint64_t)v5) & 1) == 0)
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("-[%@ %@]: Unrecognized URL: %@"), v11, v12, v5);

      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)transmit:(const void *)a3 ofLength:(unint64_t)a4
{
  return 0;
}

- (void)received:(const char *)a3 ofLength:(unint64_t)a4 destructor:(id)a5
{
  const char *v8;
  id v9;
  NSObject *serializer;
  id v11;
  _QWORD v12[5];
  id v13;
  const char *v14;
  unint64_t v15;

  v9 = a5;
  if (a4)
    objc_msgSend_acquireSize_(self->_tracker, v8, a4);
  serializer = self->_serializer;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_21DC8B384;
  v12[3] = &unk_24E1AAC28;
  v14 = a3;
  v15 = a4;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  dispatch_async(serializer, v12);

}

- (void)disconnect
{
  NSObject *handlerGuard;
  const char *v4;
  const char *v5;
  _QWORD block[5];

  handlerGuard = self->_handlerGuard;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21DC8B488;
  block[3] = &unk_24E1AAAC8;
  block[4] = self;
  dispatch_sync(handlerGuard, block);
  objc_msgSend_received_ofLength_destructor_(self, v4, 0, 0, 0);
  objc_msgSend_setStatus_(self, v5, 3);
}

- (void)serializedDisconnect:(id)a3
{
  const char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  NSObject *serializer;
  id v15;
  id v16;
  void *v17;
  const char *v18;
  _QWORD block[4];
  id v20;
  id v21;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v5, v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, self, CFSTR("DTXTransport.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transportCallback != nil"));

  }
  v8 = (void *)MEMORY[0x22079E084]();
  objc_msgSend_serializedXPCRepresentation(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_disconnect(self, v12, v13);
  serializer = self->_serializer;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21DC8B5C0;
  block[3] = &unk_24E1AAC50;
  v15 = v7;
  v20 = v11;
  v21 = v15;
  v16 = v11;
  dispatch_async(serializer, block);

  objc_autoreleasePoolPop(v8);
}

- (void)setDataReceivedHandler:(id)a3
{
  id v4;
  NSObject *handlerGuard;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  handlerGuard = self->_handlerGuard;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21DC8B64C;
  block[3] = &unk_24E1AA9B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(handlerGuard, block);

}

- (id)dataReceivedHandler
{
  NSObject *handlerGuard;
  void *v3;
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
  v9 = sub_21DC8B7BC;
  v10 = sub_21DC8B7E4;
  v11 = 0;
  handlerGuard = self->_handlerGuard;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_21DC8B7EC;
  v5[3] = &unk_24E1AAC78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(handlerGuard, v5);
  v3 = (void *)MEMORY[0x22079E258](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSArray)localAddresses
{
  return 0;
}

- (id)permittedBlockCompressionTypes
{
  return (id)objc_msgSend_setWithObjects_(MEMORY[0x24BDBCF20], a2, (uint64_t)&unk_24E1B02B0, &unk_24E1B02C8, &unk_24E1B02E0, &unk_24E1B02F8, &unk_24E1B0310, &unk_24E1B0328, &unk_24E1B0340, &unk_24E1B0358, 0);
}

- (unsigned)supportedDirections
{
  return 3;
}

- (unsigned)status
{
  return self->_status;
}

- (void)setStatus:(unsigned int)a3
{
  self->_status = a3;
}

- (DTXResourceTracker)resourceTracker
{
  return self->_tracker;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dataReceivedHandler, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_handlerGuard, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
}

@end
