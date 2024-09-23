@implementation PKInkThicknessButton

void __46___PKInkThicknessButton_setSelected_animated___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[_PKInkThicknessButton backgroundColorForIsSelected:highlighted:](*(void **)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", v2);

  -[_PKInkThicknessButton imageTintColorForIsSelected:highlighted:](*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 768);
  else
    v5 = 0;
  v6 = (id)v3;
  objc_msgSend(v5, "setTintColor:", v3);

}

void __52___PKInkThicknessButton__animateToHighlightedState___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[_PKInkThicknessButton backgroundColorForIsSelected:highlighted:](*(void **)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isSelected"), *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", v2);

  -[_PKInkThicknessButton imageTintColorForIsSelected:highlighted:](*(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isSelected"), *(unsigned __int8 *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 768);
  else
    v5 = 0;
  v6 = (id)v3;
  objc_msgSend(v5, "setTintColor:", v3);

}

@end
