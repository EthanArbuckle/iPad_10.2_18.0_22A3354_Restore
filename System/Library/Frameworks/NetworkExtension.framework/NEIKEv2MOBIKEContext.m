@implementation NEIKEv2MOBIKEContext

- (id)initWithMOBIKEInterface:(void *)a3 mobikeEndpoint:(char)a4 invalidateTransport:(int)a5 maxRetries:(void *)a6 retryIntervalMilliseconds:(void *)a7 callbackQueue:(void *)a8 callback:
{
  id v15;
  id v16;
  id v17;
  id v18;
  id *v19;
  const char *v20;
  SEL v21;
  SEL v22;
  objc_super v24;

  v15 = a2;
  v16 = a3;
  v17 = a7;
  v18 = a8;
  if (a1)
  {
    v24.receiver = a1;
    v24.super_class = (Class)NEIKEv2MOBIKEContext;
    v19 = (id *)objc_msgSendSuper2(&v24, sel_initWithRequestType_, 4);
    a1 = v19;
    if (v19)
    {
      objc_setProperty_nonatomic_copy(v19, v20, v15, 32);
      objc_setProperty_nonatomic_copy(a1, v21, v16, 40);
      *((_BYTE *)a1 + 24) = a4;
      *((_DWORD *)a1 + 7) = a5;
      a1[6] = a6;
      objc_storeStrong(a1 + 7, a7);
      objc_setProperty_nonatomic_copy(a1, v22, v18, 64);
    }
  }

  return a1;
}

- (id)description
{
  id v3;
  NSString *v4;
  NWEndpoint *mobikeEndpoint;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self)
  {
    v4 = self->_mobikeInterface;
    mobikeEndpoint = self->_mobikeEndpoint;
  }
  else
  {
    v4 = 0;
    mobikeEndpoint = 0;
  }
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("mobike request to interface %@ with endpoint %@"), v4, mobikeEndpoint);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_mobikeEndpoint, 0);
  objc_storeStrong((id *)&self->_mobikeInterface, 0);
}

- (void)sendCallbackSuccess:(void *)a3 session:(void *)a4 error:
{
  _BYTE *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;
  id v13;
  SEL v14;
  NSObject *v15;
  _QWORD v16[4];
  _BYTE *v17;
  id v18;
  id v19;
  char v20;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)NEIKEv2MOBIKEContext;
    objc_msgSendSuper2(&v21, sel_sendCallbackSuccess_session_, a2, v7);
    v9 = a1[8];
    if (v9)
    {
      v10 = v9;
      v11 = a1[7];
      if (!v11)
      {
LABEL_7:

        goto LABEL_8;
      }
      if (!v7)
      {

        goto LABEL_6;
      }
      v12 = v7[12];

      if ((v12 & 1) == 0)
      {
LABEL_6:
        v13 = a1[8];
        objc_setProperty_nonatomic_copy(a1, v14, 0, 64);
        v15 = a1[7];
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __58__NEIKEv2MOBIKEContext_sendCallbackSuccess_session_error___block_invoke;
        v16[3] = &unk_1E3CC30A8;
        v17 = v7;
        v19 = v13;
        v20 = a2;
        v18 = v8;
        v10 = v13;
        dispatch_async(v15, v16);

        goto LABEL_7;
      }
    }
  }
LABEL_8:

}

uint64_t __58__NEIKEv2MOBIKEContext_sendCallbackSuccess_session_error___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!v1 || (*(_BYTE *)(v1 + 12) & 1) == 0)
    return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(result + 48) + 16))(*(_QWORD *)(result + 48));
  return result;
}

@end
