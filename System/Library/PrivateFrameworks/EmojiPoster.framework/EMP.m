@implementation EMP

void __63__EMP_TSDImageColorAnalyzer_filterInterestingColorsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __55__EMP_TSDImageColorAnalyzer_p_prepareInterestingColors__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  id v7;
  double v8;
  double v9;
  double v10;

  v3 = a2;
  v9 = 0.0;
  v10 = 0.0;
  v8 = 0.0;
  objc_msgSend(v3, "getHue:saturation:brightness:alpha:", &v10, &v9, &v8, 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1000 * llround(v9 * 10.0) + 100 * llround(v8 * 10.0) + llround(v10 * 100.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4);
  v6 = 32;
  if (v5)
  {
    v6 = 40;
    v7 = v3;
  }
  else
  {
    v7 = v4;
  }
  objc_msgSend(*(id *)(a1 + v6), "addObject:", v7);

}

@end
