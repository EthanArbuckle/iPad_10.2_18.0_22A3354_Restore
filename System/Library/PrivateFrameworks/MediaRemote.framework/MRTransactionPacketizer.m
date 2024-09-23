@implementation MRTransactionPacketizer

- (BOOL)isEmpty
{
  return !-[NSMutableArray count](self->_outgoingPackets, "count")
      && -[NSMutableDictionary count](self->_incomingPackets, "count") == 0;
}

- (void)packetize:(id)a3 packageSize:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *, BOOL);
  id v10;
  NSMutableArray *outgoingPackets;
  NSMutableArray *v12;
  NSMutableArray *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *, BOOL))a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  outgoingPackets = self->_outgoingPackets;
  if (!outgoingPackets)
  {
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = self->_outgoingPackets;
    self->_outgoingPackets = v12;

    outgoingPackets = self->_outgoingPackets;
  }
  -[NSMutableArray addObjectsFromArray:](outgoingPackets, "addObjectsFromArray:", v8);
  while (a4)
  {
    if (!-[NSMutableArray count](self->_outgoingPackets, "count"))
      break;
    -[NSMutableArray firstObject](self->_outgoingPackets, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "actualLength");
    v16 = v15 - objc_msgSend(v14, "writePosition");
    v17 = a4;
    if (a4 >= v16)
    {
      v18 = objc_msgSend(v14, "actualLength");
      v17 = v18 - objc_msgSend(v14, "writePosition");
    }
    objc_msgSend(v14, "setWriteLength:", v17);
    objc_msgSend(v10, "addObject:", v14);
    if (objc_msgSend(v14, "isWriteComplete"))
      -[NSMutableArray removeObject:](self->_outgoingPackets, "removeObject:", v14);
    a4 -= v17;

  }
  MRTransactionPacketsGetShallowCopy(v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = v10;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v24++), "writeComplete", (_QWORD)v25);
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v22);
  }

  v9[2](v9, v19, -[NSMutableArray count](self->_outgoingPackets, "count") != 0);
}

- (void)unpacketize:(id)a3 completion:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *incomingPackets;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  MRTransactionPacketAccumulator *v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  void (**v25)(id, void *);
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v25 = (void (**)(id, void *))a4;
  if (!self->_incomingPackets)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    incomingPackets = self->_incomingPackets;
    self->_incomingPackets = v7;

  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v16 = self->_incomingPackets;
        objc_msgSend(v15, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](v16, "objectForKey:", v17);
        v18 = (MRTransactionPacketAccumulator *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          v18 = objc_alloc_init(MRTransactionPacketAccumulator);
          v19 = self->_incomingPackets;
          objc_msgSend(v15, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v18, v20);

        }
        -[MRTransactionPacketAccumulator mergePacket:](v18, "mergePacket:", v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          if (!v12)
            v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v12, "addObject:", v21);
          v22 = self->_incomingPackets;
          objc_msgSend(v15, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary removeObjectForKey:](v22, "removeObjectForKey:", v23);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  MRTransactionPacketsGetShallowCopy(v12);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2](v25, v24);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingPackets, 0);
  objc_storeStrong((id *)&self->_outgoingPackets, 0);
}

@end
