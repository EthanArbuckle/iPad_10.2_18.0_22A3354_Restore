@implementation MUFetchBadgeIconWithStyleAttributes

void ___MUFetchBadgeIconWithStyleAttributes_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0CC17D0], "imageForStyle:size:forScale:format:transparent:transitMode:isCarplay:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), 0, *(unsigned __int8 *)(a1 + 72), 0, 0, *(double *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(v2, "imageWithRenderingMode:", 2);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___MUFetchBadgeIconWithStyleAttributes_block_invoke_2;
  v8[3] = &unk_1E2E03198;
  v5 = *(NSObject **)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_async(v5, v8);

}

uint64_t ___MUFetchBadgeIconWithStyleAttributes_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, 0);
}

@end
