@implementation MPCModelRadioGetTracksDialogIsRetryDialog

void __MPCModelRadioGetTracksDialogIsRetryDialog_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;

  objc_msgSend(a2, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "kind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("getTracks"));

  if (v8)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

@end
