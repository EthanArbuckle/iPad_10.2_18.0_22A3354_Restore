@implementation LiveFSVolume

- (LiveFSVolume)init
{
  LiveFSVolume *v2;
  uint64_t v3;
  NSMapTable *currentConnections;
  LiveFSVolume *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LiveFSVolume;
  v2 = -[LiveFSVolume init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    currentConnections = v2->_currentConnections;
    v2->_currentConnections = (NSMapTable *)v3;

    if (!v2->_currentConnections)
    {
      v5 = 0;
      goto LABEL_6;
    }
    v2->validConnections = 0;
    v2->connectionCount = 0;
    v2->_workingSetInterest = 0;
  }
  v5 = v2;
LABEL_6:

  return v5;
}

- (unint64_t)newConnectionIDOrError:(id *)a3
{
  LiveFSVolume *v4;
  int connectionCount;
  unint64_t v6;
  uint64_t v7;
  unint64_t validConnections;

  v4 = self;
  objc_sync_enter(v4);
  connectionCount = v4->connectionCount;
  if (connectionCount < 64)
  {
    v7 = 0;
    v4->connectionCount = connectionCount + 1;
    validConnections = v4->validConnections;
    do
    {
      v6 = 1 << v7;
      if ((validConnections & (1 << v7)) == 0)
        break;
    }
    while (v7++ != 63);
    v4->validConnections = validConnections | v6;
  }
  else if (a3)
  {
    getNSErrorFromLiveFSErrno(24);
    v6 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_sync_exit(v4);

  return v6;
}

- (void)releaseConnectionAllocation:(unint64_t)a3
{
  NSMapTable *currentConnections;
  void *v6;
  LiveFSVolume *obj;

  if ((a3 & (a3 - 1)) != 0)
    -[LiveFSVolume releaseConnectionAllocation:].cold.1();
  if ((self->validConnections & a3) == 0)
    -[LiveFSVolume releaseConnectionAllocation:].cold.2();
  if (self->connectionCount <= 0)
    -[LiveFSVolume releaseConnectionAllocation:].cold.3();
  obj = self;
  objc_sync_enter(obj);
  self->validConnections &= ~a3;
  currentConnections = obj->_currentConnections;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](currentConnections, "removeObjectForKey:", v6);

  --self->connectionCount;
  objc_sync_exit(obj);

}

- (void)invalidateFileNodesForConnection:(unint64_t)a3
{
  __assert_rtn("-[LiveFSVolume invalidateFileNodesForConnection:]", "LiveFSVolume.m", 78, "0");
}

- (void)invalidateAllConnections
{
  void *v2;
  LiveFSVolume *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NSMapTable dictionaryRepresentation](obj->_currentConnections, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_2);

  objc_sync_exit(obj);
}

uint64_t __40__LiveFSVolume_invalidateAllConnections__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidate");
}

- (void)rememberConnection:(id)a3 forID:(unint64_t)a4
{
  LiveFSVolume *v6;
  NSMapTable *currentConnections;
  void *v8;
  id v9;

  v9 = a3;
  v6 = self;
  objc_sync_enter(v6);
  currentConnections = v6->_currentConnections;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](currentConnections, "setObject:forKey:", v9, v8);

  objc_sync_exit(v6);
}

- (void)LISMPUpdateItem:(id)a3 nameOrPath:(id)a4 interestedItem:(id)a5 interestedClients:(unint64_t)a6 op:(int)a7
{
  LiveFSVolume *v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSMapTable *currentConnections;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  int v24;
  id v25;

  v22 = a3;
  v23 = a4;
  v25 = a5;
  v12 = self;
  objc_sync_enter(v12);
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v24 = a7;
  while (v14 < v12->connectionCount)
  {
    v17 = 1 << v13;
    if ((v12->validConnections & v17) != 0)
      ++v14;
    if ((v17 & a6) != 0)
    {
      currentConnections = v12->_currentConnections;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable objectForKey:](currentConnections, "objectForKey:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v20, "remoteObjectProxy");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          switch(v24)
          {
            case 0:
              objc_msgSend(v21, "updatedItem:name:interestedItem:", v22, v23, v25);
              break;
            case 1:
              objc_msgSend(v21, "deletedItem:name:how:interestedItem:", v22, v23, 0, v25);
              break;
            case 2:
              objc_msgSend(v21, "updatedName:interestedItem:", v23, v25);
              break;
            case 3:
              objc_msgSend(v21, "deletedName:item:how:interestedItem:", v23, v22, 0, v25);
              break;
            case 4:
              objc_msgSend(v21, "volumeWideUpdatedName:interestedItem:", v23, v25);
              break;
            case 5:
              objc_msgSend(v21, "volumeWideDeletedName:interestedItem:", v23, v25);
              break;
            case 6:
              objc_msgSend(v21, "historyResetItem:interestedItem:", v22, v25);
              break;
            case 7:
              objc_msgSend(v21, "historyResetName:interestedItem:", v23, v25);
              break;
            case 8:
              objc_msgSend(v21, "updatesDoneFor:", v25);
              break;
            default:
              goto LABEL_12;
          }
        }
        goto LABEL_12;
      }
    }
    else
    {
      v20 = v16;
    }
    v21 = v15;
LABEL_12:
    ++v13;
    v15 = v21;
    v16 = v20;
    if (v13 == 64)
      goto LABEL_23;
  }
  v20 = v16;
  v21 = v15;
LABEL_23:
  objc_sync_exit(v12);

}

- (void)updatedItem:(id)a3 name:(id)a4 interestedItem:(id)a5 interestedClients:(unint64_t)a6
{
  -[LiveFSVolume LISMPUpdateItem:nameOrPath:interestedItem:interestedClients:op:](self, "LISMPUpdateItem:nameOrPath:interestedItem:interestedClients:op:", a3, a4, a5, a6, 0);
}

- (void)deletedItem:(id)a3 name:(id)a4 interestedItem:(id)a5 how:(int)a6 interestedClients:(unint64_t)a7
{
  -[LiveFSVolume LISMPUpdateItem:nameOrPath:interestedItem:interestedClients:op:](self, "LISMPUpdateItem:nameOrPath:interestedItem:interestedClients:op:", a3, a4, a5, a7, 1);
}

- (void)updatedName:(id)a3 interestedItem:(id)a4 interestedClients:(unint64_t)a5
{
  -[LiveFSVolume LISMPUpdateItem:nameOrPath:interestedItem:interestedClients:op:](self, "LISMPUpdateItem:nameOrPath:interestedItem:interestedClients:op:", 0, a3, a4, a5, 2);
}

- (void)deletedName:(id)a3 item:(id)a4 interestedItem:(id)a5 how:(int)a6 interestedClients:(unint64_t)a7
{
  -[LiveFSVolume LISMPUpdateItem:nameOrPath:interestedItem:interestedClients:op:](self, "LISMPUpdateItem:nameOrPath:interestedItem:interestedClients:op:", a4, a3, a5, a7, 3);
}

- (void)volumeWideUpdatedName:(id)a3 interestedItem:(id)a4 interestedClients:(unint64_t)a5
{
  -[LiveFSVolume LISMPUpdateItem:nameOrPath:interestedItem:interestedClients:op:](self, "LISMPUpdateItem:nameOrPath:interestedItem:interestedClients:op:", 0, a3, a4, a5, 4);
}

- (void)volumeWideDeletedName:(id)a3 interestedItem:(id)a4 interestedClients:(unint64_t)a5
{
  -[LiveFSVolume LISMPUpdateItem:nameOrPath:interestedItem:interestedClients:op:](self, "LISMPUpdateItem:nameOrPath:interestedItem:interestedClients:op:", 0, a3, a4, a5, 5);
}

- (void)historyResetItem:(id)a3 interestedItem:(id)a4 interestedClients:(unint64_t)a5
{
  -[LiveFSVolume LISMPUpdateItem:nameOrPath:interestedItem:interestedClients:op:](self, "LISMPUpdateItem:nameOrPath:interestedItem:interestedClients:op:", a3, 0, a4, a5, 6);
}

- (void)historyResetName:(id)a3 interestedItem:(id)a4 interestedClients:(unint64_t)a5
{
  -[LiveFSVolume LISMPUpdateItem:nameOrPath:interestedItem:interestedClients:op:](self, "LISMPUpdateItem:nameOrPath:interestedItem:interestedClients:op:", 0, a3, a4, a5, 7);
}

- (void)itemUpdatesDone:(id)a3 interestedClients:(unint64_t)a4
{
  -[LiveFSVolume LISMPUpdateItem:nameOrPath:interestedItem:interestedClients:op:](self, "LISMPUpdateItem:nameOrPath:interestedItem:interestedClients:op:", 0, 0, a3, a4, 8);
}

- (void)itemRenamedIn:(id)a3 named:(id)a4 originalID:(id)a5 intoDirectory:(id)a6 newName:(id)a7 atopItem:(id)a8 interestedClients:(unint64_t)a9
{
  LiveFSVolume *v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSMapTable *currentConnections;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;

  v30 = a3;
  v29 = a4;
  v28 = a5;
  v27 = a6;
  v26 = a7;
  v25 = a8;
  v15 = self;
  objc_sync_enter(v15);
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  while (v17 < v15->connectionCount)
  {
    v20 = 1 << v16;
    if ((v15->validConnections & v20) != 0)
      ++v17;
    if ((v20 & a9) != 0)
    {
      currentConnections = v15->_currentConnections;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable objectForKey:](currentConnections, "objectForKey:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(v23, "remoteObjectProxy");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
          objc_msgSend(v24, "renamedItem:named:fromDirectory:intoDirectory:newName:atopItem:", v30, v29, v28, v27, v26, v25);
        goto LABEL_11;
      }
    }
    else
    {
      v23 = v19;
    }
    v24 = v18;
LABEL_11:
    ++v16;
    v18 = v24;
    v19 = v23;
    if (v16 == 64)
      goto LABEL_14;
  }
  v23 = v19;
  v24 = v18;
LABEL_14:
  objc_sync_exit(v15);

}

- (void)checkAccessTo:(id)a3 requestedAccess:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  (*((void (**)(id, uint64_t))a6 + 2))(a6, 45);
}

- (void)close:(id)a3 keepingMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a6 + 2))(a6, 45, 0, 0, 0, 0, 0, 0);
}

- (void)createIn:(id)a3 named:(id)a4 attributes:(id)a5 andClient:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a8 + 2))(a8, 45, 0, 0, 0, 0, 0);
}

- (void)fileAttributes:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 45, 0);
}

- (void)otherAttributeOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  (*((void (**)(id, uint64_t, _QWORD))a6 + 2))(a6, 45, 0);
}

- (void)parentsAndAttributesForItemsByID:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 45, 0);
}

- (void)rootFileHandleForClient:(unint64_t)a3 reply:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  getNSErrorFromLiveFSErrno(45);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a4 + 2))(v5, 0, v6);

}

- (void)xattrOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  (*((void (**)(id, uint64_t, _QWORD))a6 + 2))(a6, 45, 0);
}

- (void)listXattrsOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 45, 0);
}

- (void)lookupin:(id)a3 name:(id)a4 forClient:(unint64_t)a5 usingFlags:(unsigned int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  (*((void (**)(id, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a8 + 2))(a8, 45, 0xFFFFFFFFLL, 0, 0, 0, 0, 0, 0, 0);
}

- (void)makeCloneOf:(id)a3 named:(id)a4 inDirectory:(id)a5 attributes:(id)a6 usingFlags:(unsigned int)a7 andClient:(unint64_t)a8 requestID:(unint64_t)a9 reply:(id)a10
{
  (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a10 + 2))(a10, 45, 0, 0, 0, 0, 0);
}

- (void)makeDirectoryIn:(id)a3 named:(id)a4 attributes:(id)a5 andClient:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a8 + 2))(a8, 45, 0, 0, 0, 0, 0);
}

- (void)makeLinkOf:(id)a3 named:(id)a4 inDirectory:(id)a5 andClient:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a8 + 2))(a8, 45, 0, 0, 0, 0, 0);
}

- (void)makeSymLinkIn:(id)a3 named:(id)a4 contents:(id)a5 attributes:(id)a6 andClient:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a9 + 2))(a9, 45, 0, 0, 0, 0, 0);
}

- (void)open:(id)a3 withMode:(int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  (*((void (**)(id, uint64_t))a6 + 2))(a6, 45);
}

- (void)pathConfiguration:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 45, 0);
}

- (void)readFrom:(id)a3 atOffset:(unint64_t)a4 intoBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  (*((void (**)(id, uint64_t, _QWORD))a7 + 2))(a7, 45, 0);
}

- (void)readFrom:(id)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  (*((void (**)(id, uint64_t, _QWORD))a7 + 2))(a7, 45, 0);
}

- (void)readDirectory:(id)a3 amount:(unint64_t)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD))a8 + 2))(a8, 45, 0, 0, 0);
}

- (void)readDirectory:(id)a3 intoBuffer:(id)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  (*((void (**)(id, uint64_t, _QWORD, _QWORD))a8 + 2))(a8, 45, 0, 0);
}

- (void)readDirectory:(id)a3 amount:(unint64_t)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD))a9 + 2))(a9, 45, 0, 0, 0);
}

- (void)readDirectory:(id)a3 intoBuffer:(id)a4 requestedAttributes:(unint64_t)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  (*((void (**)(id, uint64_t, _QWORD, _QWORD))a9 + 2))(a9, 45, 0, 0);
}

- (void)readLinkOf:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  (*((void (**)(id, uint64_t, _QWORD, _QWORD))a5 + 2))(a5, 45, 0, 0);
}

- (void)reclaim:(id)a3 forClient:(unint64_t)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  (*((void (**)(id, uint64_t, _QWORD))a6 + 2))(a6, 45, 0);
}

- (void)removeItem:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, const __CFString *, _QWORD, _QWORD))a8 + 2))(a8, 45, 0, 0, 0, &stru_24F64CE40, 0, 0);
}

- (void)removeDirectory:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, const __CFString *, _QWORD, _QWORD))a8 + 2))(a8, 45, 0, 0, 0, &stru_24F64CE40, 0, 0);
}

- (void)renameItemIn:(id)a3 named:(id)a4 toDirectory:(id)a5 newName:(id)a6 usingFlags:(unsigned int)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  char v9;
  char v10;

  v10 = 0;
  v9 = 0;
  (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char, _QWORD, _QWORD, char, _QWORD))a9
   + 2))(a9, 45, 0, 0, 0, 0, 0, 0, v9, 0, 0, v10, 0);
}

- (void)search:(id)a3 token:(id)a4 criteria:(id)a5 returnProxy:(id)a6 forClient:(unint64_t)a7 requestID:(unint64_t)a8 reply:(id)a9
{
  (*((void (**)(id, uint64_t))a9 + 2))(a9, 45);
}

- (void)abortSearch:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  (*((void (**)(id, uint64_t))a5 + 2))(a5, 45);
}

- (void)replenishSearchCreditsFor:(id)a3 credits:(unsigned int)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  (*((void (**)(id, uint64_t))a6 + 2))(a6, 45);
}

- (void)setFileAttributesOf:(id)a3 to:(id)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a6 + 2))(a6, 45, 0, 0, 0, 0, 0, 0, 0);
}

- (void)setOtherAttributeOf:(id)a3 named:(id)a4 value:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v8;
  id v9;

  v8 = a7;
  v9 = (id)objc_opt_new();
  (*((void (**)(id, uint64_t, id, _QWORD))a7 + 2))(v8, 45, v9, 0);

}

- (void)setUpdateInterest:(id)a3 interest:(BOOL)a4 forClient:(unint64_t)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v8;
  id v9;

  v8 = a7;
  getNSErrorFromLiveFSErrno(45);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a7 + 2))(v8, v9);

}

- (void)setXattrOf:(id)a3 named:(id)a4 value:(id)a5 how:(int)a6 requestID:(unint64_t)a7 reply:(id)a8
{
  (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a8 + 2))(a8, 45, 0, 0, 0, 0, 0);
}

- (void)volumeStatistics:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 45, 0);
}

- (void)verifyItemExistenceByIDs:(id)a3 requestID:(unint64_t)a4 reply:(id)a5
{
  (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 45, 0);
}

- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 fromBuffer:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  (*((void (**)(id, uint64_t, _QWORD, _QWORD))a7 + 2))(a7, 45, 0, 0);
}

- (void)blockmapFile:(id)a3 range:(_NSRange)a4 startIO:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8
{
  (*((void (**)(id, uint64_t, _QWORD, _QWORD))a8 + 2))(a8, 45, 0, 0);
}

- (void)endIO:(id)a3 range:(_NSRange)a4 status:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 reply:(id)a8
{
  (*((void (**)(id, uint64_t))a8 + 2))(a8, 45);
}

- (void)fetchVolumeMachPortLabeled:(id)a3 forClient:(unint64_t)a4 requestID:(unint64_t)a5 reply:(id)a6
{
  (*((void (**)(id, uint64_t, _QWORD))a6 + 2))(a6, 45, 0);
}

- (unint64_t)workingSetInterest
{
  return self->_workingSetInterest;
}

- (void)setWorkingSetInterest:(unint64_t)a3
{
  self->_workingSetInterest = a3;
}

- (BOOL)renameChangesFileID
{
  return self->_renameChangesFileID;
}

- (BOOL)hasPersistentFileIDs
{
  return self->_hasPersistentFileIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConnections, 0);
}

- (void)releaseConnectionAllocation:.cold.1()
{
  __assert_rtn("-[LiveFSVolume releaseConnectionAllocation:]", "LiveFSVolume.m", 63, "(client & (client - 1)) == 0");
}

- (void)releaseConnectionAllocation:.cold.2()
{
  __assert_rtn("-[LiveFSVolume releaseConnectionAllocation:]", "LiveFSVolume.m", 64, "client & validConnections");
}

- (void)releaseConnectionAllocation:.cold.3()
{
  __assert_rtn("-[LiveFSVolume releaseConnectionAllocation:]", "LiveFSVolume.m", 65, "connectionCount > 0");
}

@end
