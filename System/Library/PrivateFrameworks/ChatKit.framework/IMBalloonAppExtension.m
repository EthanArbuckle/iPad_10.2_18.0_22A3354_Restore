@implementation IMBalloonAppExtension

void __64__IMBalloonAppExtension_ImageLoading____ck_generateStatusImage___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__IMBalloonAppExtension_ImageLoading____ck_generateStatusImage___block_invoke_2;
  v6[3] = &unk_1E274DA38;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __64__IMBalloonAppExtension_ImageLoading____ck_generateStatusImage___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
