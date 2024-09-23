@implementation NSMutableAttributedString

void __79__NSMutableAttributedString_FIUISizing__scaleFontSizeByAmount_minimumFontSize___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  id v12;

  v7 = a2;
  objc_msgSend(v7, "pointSize");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8 * *(double *)(a1 + 48);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(double *)(v9 + 24);
  if (v10 < *(double *)(a1 + 56))
    v10 = *(double *)(a1 + 56);
  *(double *)(v9 + 24) = v10;
  objc_msgSend(v7, "fontWithSize:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v11 = *MEMORY[0x24BEBB360];
  objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x24BEBB360], a3, a4);
  objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v11, v12, a3, a4);

}

void __72__NSMutableAttributedString_FIUISizing__scaleNumericAttribute_byAmount___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  double v7;
  void *v8;
  uint64_t v9;
  id v10;

  if (a2)
    objc_msgSend(a2, "doubleValue");
  else
    v7 = 1.0;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7 * *(double *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *(_QWORD *)(a1 + 40), a3, a4);
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAttribute:value:range:", v9, v10, a3, a4);

}

@end
