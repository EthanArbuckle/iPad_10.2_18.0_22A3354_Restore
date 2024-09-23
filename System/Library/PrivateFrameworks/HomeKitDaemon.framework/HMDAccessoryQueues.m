@implementation HMDAccessoryQueues

- (HMDAccessoryQueues)init
{
  HMDAccessoryQueues *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDAccessoryQueues;
  v2 = -[HMDAccessoryQueues init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[HMDAccessoryQueues setQueues:](v2, "setQueues:", v3);

  }
  return v2;
}

- (BOOL)createQueue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[HMDAccessoryQueues queues](self, "queues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[HMDAccessoryQueues queues](self, "queues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, v4);

  }
  return v6 == 0;
}

- (void)addAccessory:(id)a3 toQueue:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  HMDAccessoryBundle *v12;
  id v13;

  v13 = a3;
  v8 = a5;
  if (v13 && a4)
  {
    v9 = a4;
    -[HMDAccessoryQueues queues](self, "queues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = -[HMDAccessoryBundle initWithAccessory:context:]([HMDAccessoryBundle alloc], "initWithAccessory:context:", v13, v8);
      objc_msgSend(v11, "addObject:", v12);

    }
  }

}

- (id)getContextForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryQueues whichQueueForAccessory:](self, "whichQueueForAccessory:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMDAccessoryQueues queues](self, "queues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v7;
    v9 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v12, "accessory", (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqual:", v4);

          if ((v14 & 1) != 0)
          {
            objc_msgSend(v12, "context");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
        }
        v9 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)removeAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryQueues whichQueueForAccessory:](self, "whichQueueForAccessory:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMDAccessoryQueues queues](self, "queues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v13, "accessory", (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqual:", v4);

          if (v15)
          {
            objc_msgSend(v8, "removeObject:", v13);
            goto LABEL_12;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (id)popAccessoryFromQueue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v4 = a3;
    -[HMDAccessoryQueues queues](self, "queues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accessory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryQueues removeAccessory:](self, "removeAccessory:", v8);

      objc_msgSend(v7, "accessory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)_inQueue:(id)a3 queue:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "accessory", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqual:", v5);

          if ((v12 & 1) != 0)
          {
            LOBYTE(v8) = 1;
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)whichQueueForAccessory:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[HMDAccessoryQueues queues](self, "queues", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          -[HMDAccessoryQueues queues](self, "queues");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKey:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (-[HMDAccessoryQueues _inQueue:queue:](self, "_inQueue:queue:", v4, v12))
          {
            v13 = v10;

            goto LABEL_12;
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }
    v13 = 0;
LABEL_12:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (int)countForQueue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  -[HMDAccessoryQueues queues](self, "queues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "count");
  else
    v7 = -1;

  return v7;
}

- (id)getAccessoryForContext:(id)a3 fromQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[HMDAccessoryQueues queues](self, "queues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v10 = v9;
      v11 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v19 != v12)
              objc_enumerationMutation(v10);
            v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v14, "context", (_QWORD)v18);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqual:", v6);

            if ((v16 & 1) != 0)
            {
              objc_msgSend(v14, "accessory");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_14;
            }
          }
          v11 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v11)
            continue;
          break;
        }
      }
LABEL_14:

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSMutableDictionary)queues
{
  return self->queues;
}

- (void)setQueues:(id)a3
{
  objc_storeStrong((id *)&self->queues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->queues, 0);
}

- (void)enumerateQueue:(id)a3 enumerateAccessory:(id)a4
{
  id v6;
  uint64_t (**v7)(id, void *, void *);
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (uint64_t (**)(id, void *, void *))a4;
  if (v6)
  {
    -[HMDAccessoryQueues queues](self, "queues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
LABEL_4:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v14);
        objc_msgSend(v15, "accessory", (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "context");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v7[2](v7, v16, v17);

        if ((v18 & 1) != 0)
          break;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v12)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

@end
