@implementation SUUIPaletteViewElement

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;

  v6[1] = 3221225472;
  v6[2] = __54__SUUIPaletteViewElement_enumerateChildrenUsingBlock___block_invoke;
  v6[3] = &unk_2511F4BE0;
  v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUUIPaletteViewElement;
  v6[0] = MEMORY[0x24BDAC760];
  v4 = v7;
  -[SUUIViewElement enumerateChildrenUsingBlock:](&v5, sel_enumerateChildrenUsingBlock_, v6);

}

void __54__SUUIPaletteViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  BOOL v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "elementType");
  v4 = v3 > 0x3E || ((1 << v3) & 0x4004010100001000) == 0;
  if (!v4 || v3 - 95 <= 0x2E && ((1 << (v3 - 95)) & 0x480000004001) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
