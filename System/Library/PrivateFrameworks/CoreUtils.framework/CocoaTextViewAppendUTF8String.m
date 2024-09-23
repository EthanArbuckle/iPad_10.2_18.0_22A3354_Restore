@implementation CocoaTextViewAppendUTF8String

void __CocoaTextViewAppendUTF8String_block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  int v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  _QWORD block[4];
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "contentSize");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "contentInset");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v7 = *(_DWORD *)(a1 + 48);
  if ((v7 & 2) != 0 || (v7 & 1) != 0 && (v8 = v3 + v5 - v6, objc_msgSend(*(id *)(a1 + 32), "contentOffset"), v9 >= v8))
  {
    objc_msgSend(*(id *)(a1 + 32), "textStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendAttributedString:", *(_QWORD *)(a1 + 40));

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __CocoaTextViewAppendUTF8String_block_invoke_3;
    block[3] = &unk_1E25DF2A0;
    v13 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "textStorage");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendAttributedString:", *(_QWORD *)(a1 + 40));

  }
}

uint64_t __CocoaTextViewAppendUTF8String_block_invoke_3(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t result;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  objc_msgSend(*(id *)(a1 + 32), "contentSize");
  v3 = v2;
  result = objc_msgSend(*(id *)(a1 + 32), "bounds");
  if (v3 > v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "contentSize");
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "contentInset");
    v9 = v7 + v8;
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    return objc_msgSend(*(id *)(a1 + 32), "setContentOffset:animated:", 0, 0.0, v9 - v10);
  }
  return result;
}

void __CocoaTextViewAppendUTF8String_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  getNSFontAttributeName[0]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v0;
  objc_msgSend((Class)getUIFontClass[0](), "systemFontOfSize:", 10.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)CocoaTextViewAppendUTF8String_sAttributes;
  CocoaTextViewAppendUTF8String_sAttributes = v2;

}

@end
