@implementation CAMDebugStringForCaptureResultSpecifiersSet

void __CAMDebugStringForCaptureResultSpecifiersSet_block_invoke(uint64_t a1, void *a2)
{
  char v3;
  __CFString *v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;

  v3 = objc_msgSend(a2, "integerValue");
  if ((v3 & 2) != 0)
  {
    objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((v3 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v4 = &stru_1EA3325A0;
  if ((v3 & 1) != 0)
  {
LABEL_5:
    v13 = v4;
    -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("HDR"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v5;
  }
LABEL_6:
  v14 = v4;
  if (-[__CFString length](v4, "length"))
  {
    v6 = v14;
  }
  else
  {

    v6 = CFSTR("None");
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(_QWORD *)(v7 + 40);
  v15 = v6;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, %@"), v8, v6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;
  }
  else
  {
    v12 = v6;
    v11 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v12;
  }

}

void __CAMDebugStringForCaptureResultSpecifiersSet_block_invoke_0(uint64_t a1, void *a2)
{
  char v3;
  __CFString *v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;

  v3 = objc_msgSend(a2, "integerValue");
  if ((v3 & 2) != 0)
  {
    objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((v3 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v4 = &stru_1EA3325A0;
  if ((v3 & 1) != 0)
  {
LABEL_5:
    v13 = v4;
    -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("HDR"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v5;
  }
LABEL_6:
  v14 = v4;
  if (-[__CFString length](v4, "length"))
  {
    v6 = v14;
  }
  else
  {

    v6 = CFSTR("None");
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(_QWORD *)(v7 + 40);
  v15 = v6;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, %@"), v8, v6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;
  }
  else
  {
    v12 = v6;
    v11 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v12;
  }

}

@end
