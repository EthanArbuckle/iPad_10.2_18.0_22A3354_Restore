@implementation RWIProtocolDOMNode(AirPlayKit)

- (uint64_t)depth
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathWithIndex:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "maximumIndexPathFromIndexPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  return v4;
}

- (id)maximumIndexPathFromIndexPath:()AirPlayKit
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = 0;
    do
    {
      objc_msgSend(a1, "children");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "indexPathByAddingIndex:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "maximumIndexPathFromIndexPath:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v12);

      ++v8;
      objc_msgSend(a1, "children");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

    }
    while (v8 < v14);
  }
  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global);
  objc_msgSend(v5, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
    v15 = v4;
  v17 = v15;

  return v17;
}

- (id)description
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = objc_msgSend(a1, "nodeId");
  v4 = objc_msgSend(a1, "nodeType");
  objc_msgSend(a1, "nodeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodeValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "childNodeCount");
  objc_msgSend(a1, "children");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<RWIProtocolNode: %p> nodeId = %d, nodeType = %d, nodeName = %@, localName = %@, value = %@, childNodeCount = %d, children = %lu"), a1, v3, v4, v5, v6, v7, v8, objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
