@implementation NSAttributedString

void __81__NSAttributedString_BSUIPartialStylingAdditions___bsui_rangesOfTextAttachments___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  if (a2 && a3 != -1 && a4 != -1)
  {
    v7 = *(void **)(*(_QWORD *)(a1[4] + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    v9 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
    if (v9)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) + *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 32);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v10, a3 - v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v11);

      v12 = *(_QWORD *)(a1[6] + 8);
      *(_QWORD *)(v12 + 32) = a3;
      *(_QWORD *)(v12 + 40) = a4;
    }
  }
}

@end
