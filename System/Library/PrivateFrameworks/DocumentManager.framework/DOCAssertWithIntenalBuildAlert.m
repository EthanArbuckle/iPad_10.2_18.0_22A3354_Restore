@implementation DOCAssertWithIntenalBuildAlert

void __DOCAssertWithIntenalBuildAlert_block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  char v6;

  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __DOCAssertWithIntenalBuildAlert_block_invoke_2;
  v4[3] = &unk_24C0F1CA8;
  v6 = *(_BYTE *)(a1 + 64);
  v3 = *(void **)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  DOCPresentAlertForErrorWithForceHandler(v1, v2, 0, 0, 0, v3, 0, v4);

}

void __DOCAssertWithIntenalBuildAlert_block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL DOCAssertWithIntenalBuildAlert(BOOL, BOOL, NSString *__strong _Nonnull, NSString *__strong _Nonnull, NSString *__strong _Nonnull, UIViewController * _Nullable __strong)_block_invoke_2");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("DOCUtilities.m"), 213, *(_QWORD *)(a1 + 32));

  }
}

@end
