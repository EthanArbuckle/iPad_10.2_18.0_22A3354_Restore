@implementation NSManagedObjectID(HomeKitDaemon)

- (id)hmd_debugIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;

  objc_msgSend(a1, "URIRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(a1, "isTemporaryID");
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    objc_msgSend(v8, "substringFromIndex:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hash");
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@/t%u"), v7, HIWORD(v11) ^ WORD1(v11) ^ (unsigned __int16)(WORD2(v11) ^ v11));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@/%@"), v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

@end
