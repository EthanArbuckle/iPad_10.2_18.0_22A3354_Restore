@implementation BKEventDeferringNode

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[BKSHIDEventDeferringRule hash](self->_rule, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_pid);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  BKEventDeferringNode *v4;
  uint64_t v5;
  BKEventDeferringNode *v6;
  BKEventDeferringNode *v7;
  char v8;
  id *v9;

  v4 = (BKEventDeferringNode *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v9 = v7;

    if (v9 && *((_DWORD *)v9 + 3) == self->_pid)
      v8 = objc_msgSend(v9[2], "isEqual:", self->_rule);
    else
      v8 = 0;

  }
  return v8;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  -[BKSHIDEventDeferringRule identity](self->_rule, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v12, "appendObject:withName:", v4, 0);

  -[BKSHIDEventDeferringRule predicate](self->_rule, "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v12, "appendObject:withName:", v6, 0);

  objc_msgSend(v12, "appendRightArrow");
  -[BKSHIDEventDeferringRule target](self->_rule, "target");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v12, "appendObject:withName:", v8, 0);

  -[BKSHIDEventDeferringRule reason](self->_rule, "reason");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v12, "appendObject:withName:", v10, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subnodes, 0);
  objc_storeStrong((id *)&self->_supernodes, 0);
  objc_storeStrong((id *)&self->_rule, 0);
}

uint64_t __39__BKEventDeferringNode_connectSubnode___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t *v4;
  uint64_t *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;

  v4 = a3;
  v5 = v4;
  if (!a2)
  {
    v6 = 0;
    if (v4)
      goto LABEL_3;
LABEL_6:
    v7 = 0;
    goto LABEL_4;
  }
  v6 = *(void **)(a2 + 16);
  if (!v4)
    goto LABEL_6;
LABEL_3:
  v7 = v4[2];
LABEL_4:
  v8 = v6;
  v9 = objc_msgSend(v8, "weightedDeferringRuleCompare:", v7);

  return v9;
}

- (uint64_t)_disconnectSubnode:(uint64_t)result
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  void *v5;

  if (result)
  {
    v2 = result;
    v3 = *(void **)(result + 32);
    v4 = a2;
    objc_msgSend(v3, "removeObject:", v4);
    v5 = (void *)v4[3];

    return objc_msgSend(v5, "removeObject:", v2);
  }
  return result;
}

- (void)disconnectFromGraph
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v2 = (void *)objc_msgSend(a1[3], "copy");
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v17;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v17 != v5)
            objc_enumerationMutation(v2);
          -[BKEventDeferringNode _disconnectSubnode:](*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6++), a1);
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v4);
    }

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = (void *)objc_msgSend(a1[4], "copy", 0);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          -[BKEventDeferringNode _disconnectSubnode:]((uint64_t)a1, *(void **)(*((_QWORD *)&v12 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
      }
      while (v9);
    }

  }
}

- (void)appendGraphDescription:(uint64_t)a1
{
  id *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  id *v15;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 16), "predicate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "token");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "description");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = &stru_1E81F83B8;
    }
    objc_msgSend(*(id *)(a1 + 16), "identity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKGraphDescription appendNode:](v3, CFSTR("%@ <%@>"), v8, v9, v10, v11, v12, v13, (uint64_t)v7);

    if (!objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __47__BKEventDeferringNode_appendGraphDescription___block_invoke;
      v14[3] = &unk_1E81F7CF8;
      v14[4] = a1;
      v15 = v3;
      -[BKGraphDescription appendSubnodesWithCount:block:]((uint64_t)v15, 1, v14);

    }
  }

}

void __47__BKEventDeferringNode_appendGraphDescription___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  id *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "target");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v19, "pid");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(id **)(a1 + 40);
  if (v2 == *(_DWORD *)(v3 + 12))
  {
    objc_msgSend(v19, "token");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKGraphDescription appendNode:](v4, CFSTR("<token: %@>"), v6, v7, v8, v9, v10, v11, (uint64_t)v5);
  }
  else
  {
    v12 = objc_msgSend(v19, "pid");
    objc_msgSend(v19, "token");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKGraphDescription appendNode:](v4, CFSTR("<pid: %d; token: %@>"), v13, v14, v15, v16, v17, v18, v12);
  }

}

- (uint64_t)hasAncestorNode:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    if ((objc_msgSend(*(id *)(a1 + 24), "containsObject:", v3) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      v11 = 0u;
      v12 = 0u;
      v9 = 0u;
      v10 = 0u;
      v5 = *(id *)(a1 + 24);
      v4 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
      {
        v6 = *(_QWORD *)v10;
        while (2)
        {
          for (i = 0; i != v4; ++i)
          {
            if (*(_QWORD *)v10 != v6)
              objc_enumerationMutation(v5);
            if ((-[BKEventDeferringNode hasAncestorNode:](*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i), v3) & 1) != 0)
            {
              v4 = 1;
              goto LABEL_14;
            }
          }
          v4 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
          if (v4)
            continue;
          break;
        }
      }
LABEL_14:

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
