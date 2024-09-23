@implementation NWStatsInterfaceRegistry

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__NWStatsInterfaceRegistry_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_pred != -1)
    dispatch_once(&sharedInstance_pred, block);
  return (id)sharedInstance_sharedInstance;
}

- (void)addInterfaceIndexToRegistry:(unsigned int)a3
{
  uint64_t v3;
  NSMutableSet *neQueriedInterfaceIndexes;
  void *v6;
  void *v7;
  void *v8;
  VPNInterfaceByteCountAccumulator *v9;
  NSMutableDictionary *interfaceByteAccumulators;
  void *v11;
  NSMutableSet *v12;
  void *v13;
  _BYTE v14[37];
  char v15[8];
  uint64_t v16;
  unsigned __int8 uu[8];
  uint64_t v18;
  uint64_t v19;

  v3 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)uu = 0;
  v18 = 0;
  neQueriedInterfaceIndexes = self->_neQueriedInterfaceIndexes;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(neQueriedInterfaceIndexes) = -[NSMutableSet containsObject:](neQueriedInterfaceIndexes, "containsObject:", v6);

  if ((neQueriedInterfaceIndexes & 1) == 0)
  {
    *(_QWORD *)v15 = 0;
    v16 = 0;
    if (if_indextoname(v3, v15))
      ne_session_map_interface_to_provider_uuid();
    memset(v14, 0, sizeof(v14));
    uuid_unparse(uu, v14);
    if (!uuid_is_null(uu))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", uu);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_machOUUIDLookups, "setObject:forKeyedSubscript:", v8, v7);

      v9 = objc_alloc_init(VPNInterfaceByteCountAccumulator);
      interfaceByteAccumulators = self->_interfaceByteAccumulators;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](interfaceByteAccumulators, "setObject:forKeyedSubscript:", v9, v11);

    }
    v12 = self->_neQueriedInterfaceIndexes;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](v12, "addObject:", v13);

  }
}

- (BOOL)isTrackingInterfaceIndex:(unsigned int)a3
{
  uint64_t v3;
  NSMutableSet *neQueriedInterfaceIndexes;
  void *v6;
  NSMutableDictionary *interfaceByteAccumulators;
  void *v8;
  void *v9;
  BOOL v10;

  v3 = *(_QWORD *)&a3;
  neQueriedInterfaceIndexes = self->_neQueriedInterfaceIndexes;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableSet containsObject:](neQueriedInterfaceIndexes, "containsObject:", v6))
  {
    interfaceByteAccumulators = self->_interfaceByteAccumulators;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](interfaceByteAccumulators, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)machOUUIDBelongsToVPNProvider:(id)a3
{
  NSMutableDictionary *machOUUIDLookups;
  void *v4;
  BOOL v5;

  machOUUIDLookups = self->_machOUUIDLookups;
  if (!machOUUIDLookups)
    return 0;
  -[NSMutableDictionary objectForKeyedSubscript:](machOUUIDLookups, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

void __42__NWStatsInterfaceRegistry_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

- (id)getState
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "addObject:", CFSTR("NWStatsInterfaceRegistry:"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Queried interface indexes - %@"), self->_neQueriedInterfaceIndexes);
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Looked up machO UUIDs - %@"), self->_machOUUIDLookups);
  objc_msgSend(v3, "addObject:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Accumulated interface bytes - %@"), self->_interfaceByteAccumulators);
  objc_msgSend(v3, "addObject:", v6);

  return v3;
}

- (NWStatsInterfaceRegistry)init
{
  NWStatsInterfaceRegistry *v2;
  NSMutableSet *v3;
  NSMutableSet *neQueriedInterfaceIndexes;
  NSMutableDictionary *v5;
  NSMutableDictionary *machOUUIDLookups;
  NSMutableDictionary *v7;
  NSMutableDictionary *interfaceByteAccumulators;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NWStatsInterfaceRegistry;
  v2 = -[NWStatsInterfaceRegistry init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    neQueriedInterfaceIndexes = v2->_neQueriedInterfaceIndexes;
    v2->_neQueriedInterfaceIndexes = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    machOUUIDLookups = v2->_machOUUIDLookups;
    v2->_machOUUIDLookups = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    interfaceByteAccumulators = v2->_interfaceByteAccumulators;
    v2->_interfaceByteAccumulators = v7;

  }
  return v2;
}

- (void)addVPNBytesForInterfaceIndex:(unsigned int)a3 fromSnapshot:(id)a4
{
  uint64_t v4;
  id v6;
  _BOOL4 v7;
  NSMutableDictionary *interfaceByteAccumulators;
  void *v9;
  void *v10;
  id v11;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (v6)
  {
    v11 = v6;
    v7 = -[NWStatsInterfaceRegistry isTrackingInterfaceIndex:](self, "isTrackingInterfaceIndex:", v4);
    v6 = v11;
    if (v7)
    {
      interfaceByteAccumulators = self->_interfaceByteAccumulators;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](interfaceByteAccumulators, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addBytesToAttributeToVPNProviderFromSnapshot:", v11);

      v6 = v11;
    }
  }

}

- (void)subtractVPNBytesForVPNProviderAppUUID:(id)a3 fromSnapshot:(id)a4
{
  NSMutableDictionary *interfaceByteAccumulators;
  NSMutableDictionary *machOUUIDLookups;
  id v7;
  void *v8;
  id v9;

  if (a3)
  {
    if (a4)
    {
      machOUUIDLookups = self->_machOUUIDLookups;
      interfaceByteAccumulators = self->_interfaceByteAccumulators;
      v7 = a4;
      -[NSMutableDictionary objectForKeyedSubscript:](machOUUIDLookups, "objectForKeyedSubscript:", a3);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](interfaceByteAccumulators, "objectForKeyedSubscript:", v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "subtractBytesAttributedToVPNProviderFromSnapshot:", v7);

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceByteAccumulators, 0);
  objc_storeStrong((id *)&self->_machOUUIDLookups, 0);
  objc_storeStrong((id *)&self->_neQueriedInterfaceIndexes, 0);
}

@end
