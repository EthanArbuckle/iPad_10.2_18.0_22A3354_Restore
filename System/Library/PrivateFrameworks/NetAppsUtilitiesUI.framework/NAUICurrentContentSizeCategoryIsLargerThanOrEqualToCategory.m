@implementation NAUICurrentContentSizeCategoryIsLargerThanOrEqualToCategory

void __NAUICurrentContentSizeCategoryIsLargerThanOrEqualToCategory_block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  char v5;
  char v6;
  id v7;

  v7 = a2;
  v5 = objc_msgSend(v7, "isEqualToString:", a1[4]);
  v6 = 1;
  if ((v5 & 1) != 0)
    goto LABEL_4;
  if (objc_msgSend(v7, "isEqualToString:", a1[5]))
  {
    v6 = 0;
LABEL_4:
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v6;
    *a3 = 1;
  }

}

@end
