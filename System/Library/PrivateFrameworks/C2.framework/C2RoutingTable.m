@implementation C2RoutingTable

- (id)copyAndDecorateRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  C2RoutingTable *v9;
  void *v10;
  CFAbsoluteTime v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "host");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = self;
      objc_sync_enter(v9);
      -[NSMutableDictionary objectForKeyedSubscript:](v9->_routingTable, "objectForKeyedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_exit(v9);

      if (v10)
      {
        objc_msgSend(v10, "lastUpdated");
        if (v11 < CFAbsoluteTimeGetCurrent() + 1800.0)
        {
          v12 = objc_alloc(MEMORY[0x1E0CB3998]);
          objc_msgSend(v6, "URL");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v12, "initWithURL:resolvingAgainstBaseURL:", v13, 1);

          objc_msgSend(v10, "destination");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setHost:", v15);

          objc_msgSend(v14, "URL");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(v6, "setURL:", v16);

        }
      }
      v17 = v6;

    }
    else
    {
      v17 = v4;
    }

  }
  else
  {
    v17 = v4;
  }

  return v17;
}

- (C2RoutingTable)init
{
  C2RoutingTable *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *routingTable;
  C2RoutingTable *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)C2RoutingTable;
  v2 = -[C2RoutingTable init](&v7, sel_init);
  if (v2
    && (v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]),
        routingTable = v2->_routingTable,
        v2->_routingTable = v3,
        routingTable,
        !v2->_routingTable))
  {
    v5 = 0;
  }
  else
  {
    v5 = v2;
  }

  return v5;
}

- (void)updateOriginalHostname:(id)a3 destinationHostname:(id)a4
{
  id v6;
  C2Route *v7;
  C2RoutingTable *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = objc_alloc_init(C2Route);
  -[C2Route setDestination:](v7, "setDestination:", v6);
  -[C2Route setLastUpdated:](v7, "setLastUpdated:", CFAbsoluteTimeGetCurrent());
  v8 = self;
  objc_sync_enter(v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_routingTable, "setObject:forKeyedSubscript:", v7, v9);
  objc_sync_exit(v8);

}

- (NSMutableDictionary)routingTable
{
  return self->_routingTable;
}

- (void)setRoutingTable:(id)a3
{
  objc_storeStrong((id *)&self->_routingTable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingTable, 0);
}

@end
