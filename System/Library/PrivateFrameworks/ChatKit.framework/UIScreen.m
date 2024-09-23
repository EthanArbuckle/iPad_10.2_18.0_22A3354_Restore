@implementation UIScreen

void __42__UIScreen_ChatKit__ck_screenSizeCategory__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;

  objc_msgSend(*(id *)(a1 + 32), "fixedCoordinateSpace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == 5)
  {
    v7 = 2;
LABEL_35:
    ck_screenSizeCategory_screenCategory = v7;
    return;
  }
  if (!v6 && v4 == 568.0 || (v6 == 1 ? (v8 = v4 == 1024.0) : (v8 = 0), v8))
  {
    v7 = 1;
    goto LABEL_35;
  }
  v10 = v4 == 1112.0 && v6 == 1;
  v11 = v4 == 667.0 && v6 == 0;
  v7 = 2;
  if (v11 || v10)
    goto LABEL_35;
  v12 = v4 == 1366.0 && v6 == 1;
  v13 = v12;
  v14 = v4 == 736.0 && v6 == 0;
  v7 = 3;
  if (v14 || v13)
    goto LABEL_35;
  if (!v6 && v4 == 812.0)
  {
    v7 = 4;
    goto LABEL_35;
  }
}

@end
