@implementation NSArray(ASDTUtils)

- (id)asdtNearestNumberToNumber:()ASDTUtils
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  double v12;
  void *v13;
  double v14;

  v4 = a3;
  if (objc_msgSend(a1, "count"))
  {
    objc_msgSend(v4, "doubleValue");
    v6 = v5;
    objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;
    if ((unint64_t)objc_msgSend(a1, "count") >= 2)
    {
      v10 = vabdd_f64(v9, v6);
      v11 = 1;
      while (1)
      {
        v12 = v10;
        objc_msgSend(a1, "objectAtIndexedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValue");
        v10 = vabdd_f64(v14, v6);
        if (v10 >= v12)
          break;

        ++v11;
        v7 = v13;
        if (v11 >= objc_msgSend(a1, "count"))
          goto LABEL_10;
      }

    }
    v13 = v7;
  }
  else
  {
    v13 = 0;
  }
LABEL_10:

  return v13;
}

- (id)asdtNumericSortAscending:()ASDTUtils
{
  _QWORD v4[4];
  char v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__NSArray_ASDTUtils__asdtNumericSortAscending___block_invoke;
  v4[3] = &__block_descriptor_33_e11_q24__0_8_16l;
  v5 = a3;
  objc_msgSend(a1, "sortedArrayUsingComparator:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
