@implementation NSHTTPConnectionInfo

void __52___NSHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];
  id v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 8);
  if (v3)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52___NSHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke_2;
    v8[3] = &unk_1E14F9B20;
    v8[4] = v2;
    v9 = *(id *)(a1 + 40);
    (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v3 + 16))(v3, v8);
    v4 = v9;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 24));
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __52___NSHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke_4;
    v6[3] = &unk_1E14FDEB0;
    v7 = *(id *)(a1 + 40);
    -[NSURLSession runDelegateBlock:]((uint64_t)WeakRetained, v6);

    v4 = v7;
  }

}

void __52___NSHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  id v5;
  uint64_t v6;
  id WeakRetained;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  double v13;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    WeakRetained = objc_loadWeakRetained((id *)(v6 + 24));
  else
    WeakRetained = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52___NSHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke_3;
  v10[3] = &unk_1E14FDBE0;
  v8 = *(id *)(a1 + 40);
  v11 = v5;
  v12 = v8;
  v13 = a3;
  v9 = v5;
  -[NSURLSession runDelegateBlock:]((uint64_t)WeakRetained, v10);

}

void __52___NSHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke_4(uint64_t a1)
{
  id v2;
  id v3;

  v2 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v3 = (id)objc_msgSend(v2, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 57, 0);
  (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(0.0);

}

uint64_t __52___NSHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));
}

@end
