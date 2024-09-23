@implementation MKHTTPRequestMultiplexer

- (MKHTTPRequestMultiplexer)init
{
  MKHTTPRequestMultiplexer *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *routers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKHTTPRequestMultiplexer;
  v2 = -[MKHTTPRequestMultiplexer init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    routers = v2->_routers;
    v2->_routers = v3;

  }
  return v2;
}

- (id)method:(unint64_t)a3
{
  if (a3 - 1 > 8)
    return &stru_24E35A3B8;
  else
    return off_24E359538[a3 - 1];
}

- (void)addRouter:(id)a3 method:(unint64_t)a4 path:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v12 = a3;
  v8 = a5;
  -[MKHTTPRequestMultiplexer method:](self, "method:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "characterAtIndex:", objc_msgSend(v8, "length") - 1) != 47)
  {
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("/"));
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v10;
  }
  -[NSMutableDictionary objectForKey:](self->_routers, "objectForKey:", v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[NSMutableDictionary setObject:forKey:](self->_routers, "setObject:forKey:", v11, v9);
  }
  objc_msgSend(v11, "setObject:forKey:", v12, v8);

}

- (id)routerForMethod:(id)a3 path:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "characterAtIndex:", objc_msgSend(v7, "length") - 1) != 47)
  {
    objc_msgSend(v7, "stringByAppendingString:", CFSTR("/"));
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v8;
  }
  objc_msgSend(v7, "pathComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v9, "count") < 2)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 1, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v11;
    v18[2] = CFSTR("/");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", &stru_24E35A3B8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[NSMutableDictionary objectForKey:](self->_routers, "objectForKey:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "objectForKey:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16 && v13)
    {
      objc_msgSend(v15, "objectForKey:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (!v16)
    {
      objc_msgSend(v15, "objectForKey:", CFSTR("/"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routers, 0);
}

@end
