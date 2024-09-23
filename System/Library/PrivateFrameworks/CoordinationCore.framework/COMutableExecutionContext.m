@implementation COMutableExecutionContext

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  NSObject *context;

  context = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("dispatchQueue"))
    || (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = -[NSObject isEqual:](context, "isEqual:", v7),
        v7,
        (v8 & 1) == 0))
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("dispatchQueue")))
      dispatch_queue_set_specific(context, "queueSpecificInfo", context, 0);
    -[COExecutionContext metadata](self, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "setObject:forKey:", context, v6);
    -[COExecutionContext setMetadata:](self, "setMetadata:", v10);

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  COExecutionContext *v4;
  void *v5;
  COExecutionContext *v6;

  v4 = [COExecutionContext alloc];
  -[COExecutionContext metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[COExecutionContext initWithMetadata:](v4, "initWithMetadata:", v5);

  return v6;
}

@end
