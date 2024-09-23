@implementation IDSOptionsFromSYServiceOptions

void __IDSOptionsFromSYServiceOptions_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char v6;
  id v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = objc_msgSend(v10, "hasPrefix:", CFSTR("SYServiceOption"));
  v8 = v10;
  if ((v6 & 1) == 0)
  {
    v9 = objc_msgSend(v10, "hasPrefix:", CFSTR("SYEngine"));
    v8 = v10;
    v7 = v10;
    if (!v9)
      goto LABEL_5;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("SYServiceOptionMessageTimeout"), v7))
  {
    v7 = (id)*MEMORY[0x24BE4FB30];
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v7);
  }

}

@end
