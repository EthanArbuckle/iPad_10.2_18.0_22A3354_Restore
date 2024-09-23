@implementation BLTSettingsSendSerializerPassthrough

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 withDescription:(id)a6 onlyOneFor:(id)a7 didSend:(id)a8 andResponse:(id)a9 spoolToFile:(BOOL)a10
{
  uint64_t v14;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v14 = a4;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a3;
  -[BLTSettingsSendSerializerPassthrough delegate](self, "delegate");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sendRequest:type:withTimeout:withDescription:onlyOneFor:didSend:andResponse:", v22, v14, v21, v20, v19, v18, v17);

}

- (void)sendNowWithSent:(id)a3 withAcknowledgement:(id)a4 withTimeout:(id)a5
{
  void (**v7)(_QWORD, double);
  id v8;
  void (**v9)(id, uint64_t, _QWORD);

  v9 = (void (**)(id, uint64_t, _QWORD))a3;
  v7 = (void (**)(_QWORD, double))a4;
  v8 = a5;
  if (v9)
    v9[2](v9, 1, 0);
  if (v7)
    v7[2](v7, 1.0);

}

- (BLTSettingsSendSerializerDelegate)delegate
{
  return (BLTSettingsSendSerializerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
