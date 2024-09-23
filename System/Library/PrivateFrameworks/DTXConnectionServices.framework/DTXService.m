@implementation DTXService

+ (void)instantiateServiceWithChannel:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  id v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v7 = (id)objc_msgSend_initWithChannel_(v5, v6, (uint64_t)v4);

}

+ (BOOL)automaticallyRegistersCapabilities
{
  return 1;
}

- (DTXService)initWithChannel:(id)a3
{
  id v5;
  DTXService *v6;
  DTXService *v7;
  id *v8;
  const char *v9;
  const char *v10;
  _QWORD v12[4];
  id *v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DTXService;
  v6 = -[DTXService init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = sub_21DC86AEC;
    v12[3] = &unk_24E1AA988;
    v8 = v6;
    v13 = v8;
    objc_msgSend_setMessageHandler_(v5, v9, (uint64_t)v12);
    objc_msgSend_setDispatchTarget_(v5, v10, (uint64_t)v8);
    objc_storeStrong(v8 + 1, a3);

  }
  return v7;
}

- (DTXChannel)channel
{
  return self->_channel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
}

@end
