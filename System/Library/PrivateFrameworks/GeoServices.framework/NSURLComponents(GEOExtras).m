@implementation NSURLComponents(GEOExtras)

- (void)geo_updateQueryItemsWithBlock:()GEOExtras
{
  void (**v4)(id, id);
  GEOMutableURLQueryItems *v5;
  void *v6;
  void *v7;
  void *v8;
  GEOMutableURLQueryItems *v9;

  v4 = a3;
  v5 = [GEOMutableURLQueryItems alloc];
  objc_msgSend(a1, "queryItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[GEOMutableURLQueryItems initWithItems:](v5, "initWithItems:", v6);

  v4[2](v4, v9);
  -[GEOMutableURLQueryItems items](v9, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    -[GEOMutableURLQueryItems items](v9, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setQueryItems:", v8);

  }
  else
  {
    objc_msgSend(a1, "setQueryItems:", 0);
  }

}

@end
