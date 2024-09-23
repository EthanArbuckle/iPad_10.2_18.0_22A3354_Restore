@implementation BMDSL(BMDSLStreamPublisher)

- (id)rootStreamIdentifiers
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", a1, 0);
  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  while (objc_msgSend(v1, "count"))
  {
    objc_msgSend(v1, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "removeObjectAtIndex:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        objc_msgSend(v2, "addObject:", v4);

    }
    objc_msgSend(v3, "upstreams");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "addObjectsFromArray:", v5);

  }
  v6 = (void *)objc_msgSend(v2, "copy");

  return v6;
}

- (id)streamPublishers
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", a1, 0);
  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  while (objc_msgSend(v1, "count"))
  {
    objc_msgSend(v1, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "removeObjectAtIndex:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v2, "addObject:", v3);
    objc_msgSend(v3, "upstreams");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "addObjectsFromArray:", v4);

  }
  v5 = (void *)objc_msgSend(v2, "copy");

  return v5;
}

@end
