@implementation UTType(DOCNode)

- (uint64_t)_doc_fileTypeCompare:()DOCNode
{
  id v4;
  int v5;
  unsigned int v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_msgSend(a1, "doc_conformsToFolder");
  v6 = objc_msgSend(v4, "doc_conformsToFolder");
  if ((v5 & 1) != 0 || v6)
  {
    if ((v5 ^ 1 | v6) == 1)
      v9 = (v5 ^ 1) & v6;
    else
      v9 = -1;
  }
  else if (a1 == v4)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(a1, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "compare:", v8);

  }
  return v9;
}

- (uint64_t)doc_conformsToFolder
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  if (doc_conformsToFolder_onceToken != -1)
    dispatch_once(&doc_conformsToFolder_onceToken, &__block_literal_global_297);
  v2 = (void *)doc_conformsToFolder__folderUTICache;
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    if (objc_msgSend(a1, "conformsToType:", *MEMORY[0x24BDF83C0]))
      v5 = objc_msgSend(a1, "conformsToType:", *MEMORY[0x24BDF8500]) ^ 1;
    else
      v5 = 0;
    v6 = (void *)doc_conformsToFolder__folderUTICache;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, v8);

  }
  return v5;
}

@end
