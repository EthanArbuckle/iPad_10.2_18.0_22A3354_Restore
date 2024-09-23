@implementation MSVMethodComponents

void ___MSVMethodComponents_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "removeLastObject");
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

    v3 = v8;
  }
  if (objc_msgSend(v3, "length"))
  {
    v6 = 1;
    v7 = v8;
  }
  else
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      goto LABEL_7;
    v6 = 0;
    v7 = *(id *)(a1 + 40);
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;
LABEL_7:

}

@end
