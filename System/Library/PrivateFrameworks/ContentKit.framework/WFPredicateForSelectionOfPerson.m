@implementation WFPredicateForSelectionOfPerson

id __WFPredicateForSelectionOfPerson_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __WFPredicateForSelectionOfPerson_block_invoke_2;
  v9[3] = &unk_24C4E31A8;
  v10 = v3;
  v5 = v3;
  objc_msgSend(v4, "if_map:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __WFPredicateForSelectionOfPerson_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v3))
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K.@count == 1"), *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K.@count == 0"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
