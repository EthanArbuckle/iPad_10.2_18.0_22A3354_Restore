@implementation DTAssertionPidInfo

- (id)initForPid:(int)a3 withRemoveBlocks:(id)a4 onBehalfOfClient:(id)a5
{
  id v8;
  id v9;
  DTAssertionPidInfo *v10;
  DTAssertionPidInfo *v11;
  uint64_t v12;
  NSArray *blocks;
  uint64_t v14;
  NSMutableSet *clientsWithClaim;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DTAssertionPidInfo;
  v10 = -[DTAssertionPidInfo init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_pid = a3;
    v12 = objc_msgSend(v8, "copy");
    blocks = v11->_blocks;
    v11->_blocks = (NSArray *)v12;

    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", v9);
    v14 = objc_claimAutoreleasedReturnValue();
    clientsWithClaim = v11->_clientsWithClaim;
    v11->_clientsWithClaim = (NSMutableSet *)v14;

  }
  return v11;
}

- (void)removeAssertions
{
  NSArray *blocks;
  _QWORD v3[5];

  blocks = self->_blocks;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_222B80280;
  v3[3] = &unk_24EB2A738;
  v3[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](blocks, "enumerateObjectsUsingBlock:", v3);
}

- (void)addClaimForClient:(id)a3
{
  -[NSMutableSet addObject:](self->_clientsWithClaim, "addObject:", a3);
}

- (BOOL)removeClaimFromClient:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = -[NSMutableSet containsObject:](self->_clientsWithClaim, "containsObject:", v4);
  if (v5)
    -[NSMutableSet removeObject:](self->_clientsWithClaim, "removeObject:", v4);

  return v5;
}

- (BOOL)hasNoMoreClients
{
  void *v2;
  BOOL v3;

  -[NSMutableSet anyObject](self->_clientsWithClaim, "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (NSArray)blocks
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (int)pid
{
  return self->_pid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientsWithClaim, 0);
  objc_storeStrong((id *)&self->_blocks, 0);
}

@end
