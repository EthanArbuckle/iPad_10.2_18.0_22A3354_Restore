@implementation SYVectorClock

+ (void)initialize
{
  objc_method *InstanceMethod;
  objc_method *v4;
  BOOL v5;

  if ((id)objc_opt_class() == a1)
  {
    InstanceMethod = class_getInstanceMethod((Class)a1, sel_isEqual_);
    v4 = class_getInstanceMethod((Class)a1, sel__setTheory_isEqual_);
    if (InstanceMethod)
      v5 = v4 == 0;
    else
      v5 = 1;
    if (!v5)
      method_exchangeImplementations(InstanceMethod, v4);
  }
}

- (BOOL)_setTheory_isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = (void *)MEMORY[0x24BDBCF20];
    -[SYVectorClock clocks](self, "clocks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v4, "clocks");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v7, "isEqualToSet:", v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (SYVectorClock)initWithJSONRepresentation:(id)a3
{
  id v4;
  SYVectorClock *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SYVectorClock *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  SYPeer *v19;
  void *v20;
  void *v21;
  SYPeer *v22;
  SYVectorClock *v23;
  void *v25;
  SYVectorClock *v26;
  id v27;
  _QWORD v28[4];
  SYVectorClock *v29;
  objc_super v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SYVectorClock;
  v5 = -[SYVectorClock init](&v30, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "length"))
    {
      v6 = (void *)MEMORY[0x24BDD1608];
      objc_msgSend(v4, "dataUsingEncoding:", 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "JSONObjectWithData:options:error:", v7, 4, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("clocks"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v27 = v4;
        v25 = v8;
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("clocks"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v5;
        v11 = v5;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v32;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v32 != v14)
                objc_enumerationMutation(v10);
              v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v15);
              v17 = (void *)objc_opt_new();
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("version"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setVersion:", objc_msgSend(v18, "unsignedLongLongValue"));

              v19 = [SYPeer alloc];
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("peer"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("peerID"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = -[SYPeer initWithPeerID:generation:](v19, "initWithPeerID:generation:", v21, 0);
              objc_msgSend(v17, "setPeer:", v22);

              -[SYVectorClock addClocks:](v11, "addClocks:", v17);
              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          }
          while (v13);
        }

        v5 = v26;
        v4 = v27;
        v8 = v25;
      }
      else
      {
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __55__SYVectorClock_Additions__initWithJSONRepresentation___block_invoke;
        v28[3] = &unk_24CC66660;
        v29 = v5;
        objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v28);
        v10 = v29;
      }

    }
    v23 = v5;
  }

  return v5;
}

void __55__SYVectorClock_Additions__initWithJSONRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  SYPeer *v7;
  uint64_t v8;
  id v9;

  v5 = a3;
  v6 = a2;
  v9 = (id)objc_opt_new();
  v7 = -[SYPeer initWithPeerID:generation:]([SYPeer alloc], "initWithPeerID:generation:", v6, 0);

  objc_msgSend(v9, "setPeer:", v7);
  v8 = objc_msgSend(v5, "unsignedLongLongValue");

  objc_msgSend(v9, "setVersion:", v8);
  objc_msgSend(*(id *)(a1 + 32), "addClocks:", v9);

}

- (BOOL)hasClockForPeer:(id)a3
{
  void *v4;

  objc_msgSend(a3, "peerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SYVectorClock hasClockForPeerID:](self, "hasClockForPeerID:", v4);

  return (char)self;
}

- (BOOL)hasClockForPeerID:(id)a3
{
  void *v3;
  BOOL v4;

  -[SYVectorClock clockForPeerID:](self, "clockForPeerID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)clockForPeer:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(a3, "peerID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYVectorClock clockForPeerID:](self, "clockForPeerID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    LogWithTrace((uint64_t)"Nil peer");
    v5 = 0;
  }
  return v5;
}

- (id)clockForPeerID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[SYVectorClock clocks](self, "clocks", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "peer");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "peerID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v4);

          if (v12)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LogWithTrace((uint64_t)"Nil peer ID");
    v6 = 0;
  }

  return v6;
}

- (unint64_t)clockValueForPeer:(id)a3
{
  void *v4;
  unint64_t v5;

  if (a3)
  {
    objc_msgSend(a3, "peerID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SYVectorClock clockValueForPeerID:](self, "clockValueForPeerID:", v4);

    return v5;
  }
  else
  {
    LogWithTrace((uint64_t)"Nil peer");
    return 0;
  }
}

- (void)increaseClockForPeer:(id)a3 by:(unint64_t)a4
{
  id v6;

  if (a3)
  {
    objc_msgSend(a3, "peerID");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[SYVectorClock increaseClockForPeerID:by:](self, "increaseClockForPeerID:by:", v6, a4);

  }
  else
  {
    LogWithTrace((uint64_t)"Nil peer");
  }
}

- (void)incrementClockForPeer:(id)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(a3, "peerID");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SYVectorClock increaseClockForPeerID:by:](self, "increaseClockForPeerID:by:", v4, 1);

  }
  else
  {
    LogWithTrace((uint64_t)"Nil peer");
  }
}

- (void)setClockValue:(unint64_t)a3 forPeer:(id)a4
{
  id v6;

  if (a4)
  {
    objc_msgSend(a4, "peerID");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[SYVectorClock setClockValue:forPeerID:](self, "setClockValue:forPeerID:", a3, v6);

  }
  else
  {
    LogWithTrace((uint64_t)"Nil peer");
  }
}

- (unint64_t)clockValueForPeerID:(id)a3
{
  void *v3;
  unint64_t v4;

  -[SYVectorClock clockForPeerID:](self, "clockForPeerID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "version");

  return v4;
}

- (void)increaseClockForPeerID:(id)a3 by:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  SYPeer *v9;
  id v10;

  v6 = a3;
  v10 = v6;
  if (v6)
  {
    -[SYVectorClock clockForPeerID:](self, "clockForPeerID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v7, "setVersion:", objc_msgSend(v7, "version") + a4);
    }
    else
    {
      v8 = (void *)objc_opt_new();
      v9 = -[SYPeer initWithPeerID:generation:]([SYPeer alloc], "initWithPeerID:generation:", v10, 0);
      objc_msgSend(v8, "setPeer:", v9);

      objc_msgSend(v8, "setVersion:", a4);
      -[SYVectorClock addClocks:](self, "addClocks:", v8);
    }

  }
  else
  {
    LogWithTrace((uint64_t)"Nil peer ID");
  }

}

- (void)incrementClockForPeerID:(id)a3
{
  -[SYVectorClock increaseClockForPeerID:by:](self, "increaseClockForPeerID:by:", a3, 1);
}

- (void)setClockValue:(unint64_t)a3 forPeerID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  SYPeer *v9;
  id v10;

  v6 = a4;
  v10 = v6;
  if (v6)
  {
    -[SYVectorClock clockForPeerID:](self, "clockForPeerID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v7, "setVersion:", a3);
    }
    else
    {
      v8 = (void *)objc_opt_new();
      v9 = -[SYPeer initWithPeerID:generation:]([SYPeer alloc], "initWithPeerID:generation:", v10, 0);
      objc_msgSend(v8, "setPeer:", v9);

      objc_msgSend(v8, "setVersion:", a3);
      -[SYVectorClock addClocks:](self, "addClocks:", v8);
    }

  }
  else
  {
    LogWithTrace((uint64_t)"Nil peer ID");
  }

}

- (id)compactDictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t);
  void *v15;
  id v16;
  id v17;

  if (!-[SYVectorClock clocksCount](self, "clocksCount"))
    return (id)objc_opt_new();
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", -[SYVectorClock clocksCount](self, "clocksCount"));
  -[SYVectorClock clocks](self, "clocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __59__SYVectorClock_Additions__compactDictionaryRepresentation__block_invoke;
  v15 = &unk_24CC66688;
  v6 = v3;
  v16 = v6;
  v7 = v4;
  v17 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v12);

  if (objc_msgSend(v6, "count", v12, v13, v14, v15))
  {
    -[SYVectorClock clocks](self, "clocks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectsAtIndexes:", v6);

  }
  v9 = v17;
  v10 = v7;

  return v10;
}

void __59__SYVectorClock_Additions__compactDictionaryRepresentation__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "peer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "peerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v11, "version"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v11, "peer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "peerID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v10);

  }
  else
  {
    LogWithTrace((uint64_t)"Nil peer ID");
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  }

}

- (id)jsonRepresentation
{
  void *v2;
  void *v3;
  void *v4;

  -[SYVectorClock compactDictionaryRepresentation](self, "compactDictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v3, 4);

  return v4;
}

- (void)clearClocks
{
  -[NSMutableArray removeAllObjects](self->_clocks, "removeAllObjects");
}

- (void)addClocks:(id)a3
{
  id v4;
  NSMutableArray *clocks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  clocks = self->_clocks;
  v8 = v4;
  if (!clocks)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_clocks;
    self->_clocks = v6;

    v4 = v8;
    clocks = self->_clocks;
  }
  -[NSMutableArray addObject:](clocks, "addObject:", v4);

}

- (unint64_t)clocksCount
{
  return -[NSMutableArray count](self->_clocks, "count");
}

- (id)clocksAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_clocks, "objectAtIndex:", a3);
}

+ (Class)clocksType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SYVectorClock;
  -[SYVectorClock description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYVectorClock dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_clocks, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_clocks, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = self->_clocks;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "dictionaryRepresentation", (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("clocks"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYVectorClockReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_clocks;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (-[SYVectorClock clocksCount](self, "clocksCount"))
  {
    objc_msgSend(v8, "clearClocks");
    v4 = -[SYVectorClock clocksCount](self, "clocksCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SYVectorClock clocksAtIndex:](self, "clocksAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addClocks:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_clocks;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v13);
        objc_msgSend(v5, "addClocks:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *clocks;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    clocks = self->_clocks;
    if ((unint64_t)clocks | v4[1])
      v6 = -[NSMutableArray isEqual:](clocks, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSMutableArray hash](self->_clocks, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *((id *)a3 + 1);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[SYVectorClock addClocks:](self, "addClocks:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (NSMutableArray)clocks
{
  return self->_clocks;
}

- (void)setClocks:(id)a3
{
  objc_storeStrong((id *)&self->_clocks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clocks, 0);
}

@end
