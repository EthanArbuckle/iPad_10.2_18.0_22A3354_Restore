@implementation NTKWorldClockCityAbbreviation

void __NTKWorldClockCityAbbreviation_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v6 = objc_msgSend(v9, "length");
  v7 = v9;
  if (v6)
  {
    objc_msgSend(v9, "substringToIndex:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= 3)
      *a4 = 1;

    v7 = v9;
  }

}

@end
