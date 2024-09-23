@implementation NEIKEv2RequestContext

- (NEIKEv2RequestContext)initWithRequestType:(int)a3
{
  NEIKEv2RequestContext *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NEIKEv2RequestContext;
  result = -[NEIKEv2RequestContext init](&v5, sel_init);
  if (result)
    result->_requestType = a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[NEIKEv2RequestContext releasePowerAssertionIfNeeded]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)NEIKEv2RequestContext;
  -[NEIKEv2RequestContext dealloc](&v3, sel_dealloc);
}

- (id)description
{
  if (self)
    LODWORD(self) = self->_requestType;
  return NEIKEv2RequestContextTypeString(self);
}

- (void)sendCallbackSuccess:(BOOL)a3 session:(id)a4
{
  _BYTE *v5;
  const char *v6;
  NSObject *Property;
  _QWORD block[4];
  _BYTE *v9;

  v5 = a4;
  -[NEIKEv2RequestContext releasePowerAssertionIfNeeded]((uint64_t)self);
  if (self && self->_requestInitiator)
  {
    if (v5)
    {
      v5[15] = 0;
      Property = objc_getProperty(v5, v6, 368, 1);
    }
    else
    {
      Property = 0;
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__NEIKEv2RequestContext_sendCallbackSuccess_session___block_invoke;
    block[3] = &unk_1E3CC41F0;
    v9 = v5;
    dispatch_async(Property, block);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerAssertion, 0);
}

- (void)releasePowerAssertionIfNeeded
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a1 && *(_QWORD *)(a1 + 16))
  {
    ne_log_obj();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 16);
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEFAULT, "Invalidating power assertion %@", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 16), "invalidate");
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

  }
}

void __53__NEIKEv2RequestContext_sendCallbackSuccess_session___block_invoke(uint64_t a1, const char *a2)
{
  -[NEIKEv2Session sendPendingRequestContext](*(_QWORD *)(a1 + 32), a2);
}

@end
