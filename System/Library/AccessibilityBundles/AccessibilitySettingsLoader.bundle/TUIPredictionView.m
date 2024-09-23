@implementation TUIPredictionView

uint64_t __49__TUIPredictionView_TFExtras__handleAXLongPress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSelectedIndex:", *(_QWORD *)(a1 + 40));
}

void __49__TUIPredictionView_TFExtras__handleAXLongPress___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", *(_QWORD *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "safeValueForKey:", CFSTR("delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "safeValueForKey:", CFSTR("candidate"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "predictionView:didSelectCandidate:", *(_QWORD *)(a1 + 40), v3);

  }
}

uint64_t __49__TUIPredictionView_TFExtras__handleAXLongPress___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSelectedIndex:", 0x7FFFFFFFFFFFFFFFLL);
}

@end
