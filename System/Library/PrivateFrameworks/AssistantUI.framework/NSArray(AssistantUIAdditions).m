@implementation NSArray(AssistantUIAdditions)

- (id)afui_arrayByMappingWithBlock:()AssistantUIAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __62__NSArray_AssistantUIAdditions__afui_arrayByMappingWithBlock___block_invoke;
    v10[3] = &unk_24D7A2F98;
    v12 = v4;
    v6 = v5;
    v11 = v6;
    objc_msgSend(a1, "enumerateObjectsUsingBlock:", v10);
    v7 = v11;
    v8 = v6;

  }
  else
  {
    v8 = a1;
  }

  return v8;
}

@end
