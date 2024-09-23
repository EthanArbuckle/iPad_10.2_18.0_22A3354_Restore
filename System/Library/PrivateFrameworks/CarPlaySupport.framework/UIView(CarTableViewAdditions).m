@implementation UIView(CarTableViewAdditions)

- (id)_CPS_recursiveSubviewsWithClass:()CarTableViewAdditions
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id obj;
  uint64_t v12;
  _QWORD __b[8];
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18 = a1;
  v17 = a2;
  v16 = a3;
  v15 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  memset(__b, 0, sizeof(__b));
  obj = (id)objc_msgSend(v18, "subviews");
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
  if (v12)
  {
    v8 = *(_QWORD *)__b[2];
    v9 = 0;
    v10 = v12;
    while (1)
    {
      v7 = v9;
      if (*(_QWORD *)__b[2] != v8)
        objc_enumerationMutation(obj);
      v14 = *(id *)(__b[1] + 8 * v9);
      v5 = v15;
      v6 = (id)objc_msgSend(v14, "_CPS_recursiveSubviewsWithClass:", v16);
      objc_msgSend(v5, "addObjectsFromArray:");

      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v15, "addObject:", v14);
      ++v9;
      if (v7 + 1 >= v10)
      {
        v9 = 0;
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
        if (!v10)
          break;
      }
    }
  }

  v4 = (id)objc_msgSend(v15, "copy");
  objc_storeStrong(&v15, 0);
  return v4;
}

@end
