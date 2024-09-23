@implementation HAP2PropertyLock

+ (HAP2PropertyLock)lockWithName:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLock:name:", v4, v3);

  return (HAP2PropertyLock *)v5;
}

- (void)performWritingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HAP2Lock internalLock](self, "internalLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lockForWriting");

  -[HAP2Lock _performBlock:allowRecursive:](self, "_performBlock:allowRecursive:", v4, 0);
  -[HAP2Lock internalLock](self, "internalLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (void)performReadingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HAP2Lock internalLock](self, "internalLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lockForReading");

  -[HAP2Lock _performBlock:allowRecursive:](self, "_performBlock:allowRecursive:", v4, 1);
  -[HAP2Lock internalLock](self, "internalLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

@end
