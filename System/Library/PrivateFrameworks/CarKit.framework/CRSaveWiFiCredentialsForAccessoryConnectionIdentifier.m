@implementation CRSaveWiFiCredentialsForAccessoryConnectionIdentifier

void __CRSaveWiFiCredentialsForAccessoryConnectionIdentifier_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __CRSaveWiFiCredentialsForAccessoryConnectionIdentifier_block_invoke_2;
  v9[3] = &unk_1E5429020;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v10 = *(id *)(a1 + 40);
  v11 = v5;
  v8 = v5;
  objc_msgSend(a2, "saveWiFiCredentials:forAccessoryConnectionIdentifier:reply:", v6, v7, v9);

}

uint64_t __CRSaveWiFiCredentialsForAccessoryConnectionIdentifier_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t))(v4 + 16))(v4, a2, 0, a3);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __CRSaveWiFiCredentialsForAccessoryConnectionIdentifier_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(result + 16))(result, 0, 0, a2);
  return result;
}

@end
