@implementation SUUIStackItemViewElement

- (NSArray)imageElements
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__SUUIStackItemViewElement_imageElements__block_invoke;
  v6[3] = &unk_2511F46F8;
  v4 = v3;
  v7 = v4;
  -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v6);

  return (NSArray *)v4;
}

void __41__SUUIStackItemViewElement_imageElements__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") == 49)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (SUUILabelViewElement)textElement
{
  return (SUUILabelViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 138);
}

- (int64_t)pageComponentType
{
  return 24;
}

@end
