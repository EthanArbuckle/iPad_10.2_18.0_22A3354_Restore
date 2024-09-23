@implementation SFPrintActivityItemProvider

uint64_t __47___SFPrintActivityItemProvider_pdfItemProvider__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47___SFPrintActivityItemProvider_pdfItemProvider__block_invoke_2;
  v6[3] = &unk_1E4AC13D8;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

  return 0;
}

void __47___SFPrintActivityItemProvider_pdfItemProvider__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 344);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47___SFPrintActivityItemProvider_pdfItemProvider__block_invoke_3;
  v4[3] = &unk_1E4AC53C0;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "getPDFDataForUsage:withCompletion:", 1, v4);

}

void __47___SFPrintActivityItemProvider_pdfItemProvider__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "setSize:", objc_msgSend(v3, "length"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
