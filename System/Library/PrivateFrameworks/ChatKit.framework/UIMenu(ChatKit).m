@implementation UIMenu(ChatKit)

+ (uint64_t)ck_indexOfMenuWithMenuIdentifier:()ChatKit inMenuElementsArray:
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__UIMenu_ChatKit__ck_indexOfMenuWithMenuIdentifier_inMenuElementsArray___block_invoke;
  v9[3] = &unk_1E27580F8;
  v10 = v5;
  v6 = v5;
  v7 = objc_msgSend(a4, "indexOfObjectPassingTest:", v9);

  return v7;
}

+ (unint64_t)ck_menuInsertionIndexAfterIndex:()ChatKit inMenuElementsArray:
{
  id v5;
  void *v6;
  unint64_t v7;

  v5 = a4;
  v6 = v5;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    v7 = a3 + 1;
    if (v7 > objc_msgSend(v5, "count"))
      v7 = objc_msgSend(v6, "count");
  }

  return v7;
}

@end
