@implementation SUUIInfoViewElement

- (SUUILabelViewElement)titleElement
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__32;
  v9 = __Block_byref_object_dispose__32;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__SUUIInfoViewElement_titleElement__block_invoke;
  v4[3] = &unk_2511F4B90;
  v4[4] = &v5;
  -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SUUILabelViewElement *)v2;
}

void __35__SUUIInfoViewElement_titleElement__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "elementType") == 138 && objc_msgSend(v6, "labelViewStyle") == 5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (NSArray)valueElements
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__SUUIInfoViewElement_valueElements__block_invoke;
  v6[3] = &unk_2511F46F8;
  v4 = v3;
  v7 = v4;
  -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v6);

  return (NSArray *)v4;
}

void __36__SUUIInfoViewElement_valueElements__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "elementType");
  if (v3 > 0x3E || ((1 << v3) & 0x4006004100001100) == 0)
  {
    switch(v3)
    {
      case 0x87uLL:
      case 0x8DuLL:
      case 0x90uLL:
        goto LABEL_7;
      case 0x88uLL:
      case 0x89uLL:
      case 0x8BuLL:
      case 0x8CuLL:
      case 0x8EuLL:
      case 0x8FuLL:
        break;
      case 0x8AuLL:
        if (objc_msgSend(v5, "labelViewStyle") != 5)
          goto LABEL_7;
        break;
      default:
        if (v3 == 152)
          goto LABEL_7;
        break;
    }
  }
  else
  {
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }

}

@end
