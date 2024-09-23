@implementation _WKWebExtensionMessagePort

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    _class_setCustomDeallocInitiation();
}

- (void)_objc_initiateDealloc
{
  if (WTF::isMainRunLoop((WTF *)self))
    _objc_deallocOnMainThreadHelper();
  else
    dispatch_async_f(MEMORY[0x1E0C80D38], self, (dispatch_function_t)MEMORY[0x1E0DE7980]);
}

- (void)dealloc
{
  objc_super v3;

  (**(void (***)(ObjectStorage<WebKit::WebExtensionMessagePort> *, SEL))self->_webExtensionMessagePort.data.__lx)(&self->_webExtensionMessagePort, a2);
  v3.receiver = self;
  v3.super_class = (Class)_WKWebExtensionMessagePort;
  -[_WKWebExtensionMessagePort dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  _WKWebExtensionMessagePort *v4;
  _WKWebExtensionMessagePort *v5;
  _WKWebExtensionMessagePort *v6;
  const WTF::StringImpl *v7;
  char v8;

  v4 = (_WKWebExtensionMessagePort *)a3;
  if (self != v4)
  {
    objc_opt_class();
    v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;

      if (v6)
      {
        v8 = WebKit::WebExtensionMessagePort::operator==((uint64_t)&self->_webExtensionMessagePort, (uint64_t)&v6->_webExtensionMessagePort, v7);
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {

      v6 = 0;
    }
    v8 = 0;
    goto LABEL_8;
  }
  v8 = 1;
LABEL_9:

  return v8;
}

- (NSString)applicationIdentifier
{
  id v2;

  v2 = *(id *)&self->_webExtensionMessagePort.data.__lx[24];
  if (v2)
    v2 = (id)WTF::StringImpl::operator NSString *();
  return (NSString *)v2;
}

- (BOOL)isDisconnected
{
  uint64_t v2;

  v2 = *(_QWORD *)&self->_webExtensionMessagePort.data.__lx[16];
  return !v2 || *(_QWORD *)(v2 + 8) == 0;
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;

  v6 = a3;
  v7 = a4;
  if (v7)
    v8 = v7;
  else
    v8 = &__block_literal_global_1;
  v9 = _Block_copy(v8);
  v10 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v10 = off_1E34AAF98;
  v10[1] = v9;
  v12 = v10;
  WebKit::WebExtensionMessagePort::sendMessage((uint64_t)&self->_webExtensionMessagePort, v6, (uint64_t *)&v12);
  v11 = (uint64_t)v12;
  v12 = 0;
  if (v11)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);

}

- (void)disconnectWithError:(id)a3
{
  WTF::StringImpl *v4;
  BOOL v5;
  uint64_t v6;
  WTF::StringImpl *v7;
  char v8;
  char v9;

  WebKit::toWebExtensionMessagePortError((WebKit *)a3, (uint64_t)&v6);
  WebKit::WebExtensionMessagePort::remove((uint64_t)&self->_webExtensionMessagePort);
  if (v9)
    v5 = v8 == 0;
  else
    v5 = 1;
  if (!v5 && v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v4);
    else
      *(_DWORD *)v7 -= 2;
  }
}

- (Object)_apiObject
{
  return (Object *)&self->_webExtensionMessagePort;
}

- (void)_webExtensionMessagePort
{
  return &self->_webExtensionMessagePort;
}

- (id)messageHandler
{
  return *(id *)&self->_webExtensionMessagePort.data.__lx[40];
}

- (void)setMessageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)disconnectHandler
{
  return self->_messageHandler;
}

- (void)setDisconnectHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_webExtensionMessagePort.data.__lx[40], 0);
}

- (uint64_t)sendMessage:(uint64_t)a1 completionHandler:
{

  return a1;
}

- (uint64_t)sendMessage:(id *)a1 completionHandler:
{
  void *v2;

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)sendMessage:(uint64_t)a1 completionHandler:(uint64_t)a2
{
  unsigned __int8 v3;
  int v4;
  WTF::StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  unsigned __int8 v9[8];
  WTF::StringImpl *v10;
  char v11;
  char v12;

  if (!*(_BYTE *)(a2 + 24))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
    return;
  }
  v3 = *(_BYTE *)a2;
  v4 = *(unsigned __int8 *)(a2 + 16);
  if (*(_BYTE *)(a2 + 16))
  {
    v5 = *(WTF::StringImpl **)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v9[0] = v3;
    if (v5)
      *(_DWORD *)v5 += 2;
    v10 = v5;
    v11 = 1;
  }
  else
  {
    v5 = 0;
    v9[0] = *(_BYTE *)a2;
    LOBYTE(v10) = 0;
    v11 = 0;
  }
  v12 = 1;
  WebKit::toAPI(v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 8) + 16))(*(_QWORD *)(a1 + 8));

  if (v12)
  {
    if (v11)
    {
      v8 = v10;
      v10 = 0;
      if (v8)
      {
        if (*(_DWORD *)v8 == 2)
        {
          WTF::StringImpl::destroy(v8, v7);
          if (!v4)
            return;
          goto LABEL_14;
        }
        *(_DWORD *)v8 -= 2;
      }
    }
  }
  if (!v4)
    return;
LABEL_14:
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v7);
    else
      *(_DWORD *)v5 -= 2;
  }
}

@end
