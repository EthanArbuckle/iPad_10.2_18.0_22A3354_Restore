@implementation BRCPCSChainEnumerator

- (id)itemIDNeedingListing
{
  return self->_itemIDNeedingListing;
}

- (BRCPCSChainEnumerator)initWithPCSChainInfo:(id)a3 clientZone:(id)a4
{
  id v6;
  id v7;
  BRCPCSChainEnumerator *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *stack;
  uint64_t v13;
  BRCItemID *itemIDNeedingListing;
  BRCPCSChainBreadthEnumerator *v15;
  NSObject *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BRCPCSChainEnumerator;
  v8 = -[BRCPCSChainEnumerator init](&v18, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "mangledID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_maxPathDepth = objc_msgSend(v10, "pcsChainingMaxPathDepth");

    objc_storeStrong((id *)&v8->_clientZone, a4);
    v11 = objc_opt_new();
    stack = v8->_stack;
    v8->_stack = (NSMutableArray *)v11;

    if (objc_msgSend(v6, "itemType") == 9)
    {
      objc_msgSend(v6, "itemID");
      v13 = objc_claimAutoreleasedReturnValue();
      itemIDNeedingListing = v8->_itemIDNeedingListing;
      v8->_itemIDNeedingListing = (BRCItemID *)v13;

      brc_bread_crumbs();
      v15 = (BRCPCSChainBreadthEnumerator *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[BRCPCSChainEnumerator initWithPCSChainInfo:clientZone:].cold.1(&v8->_itemIDNeedingListing, (uint64_t)v15, v16);

    }
    else
    {
      v15 = -[BRCPCSChainBreadthEnumerator initWithPCSChainInfo:clientZone:]([BRCPCSChainBreadthEnumerator alloc], "initWithPCSChainInfo:clientZone:", v6, v7);
      -[NSMutableArray addObject:](v8->_stack, "addObject:", v15);
    }

  }
  return v8;
}

- (id)nextObject
{
  __int128 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  BRCPCSChainBreadthEnumerator *v9;
  void *v10;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](self->_stack, "count"))
    return 0;
  *(_QWORD *)&v3 = 138412546;
  v24 = v3;
  while (1)
  {
    -[NSMutableArray lastObject](self->_stack, "lastObject", v24);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nextObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[BRCPCSChainEnumerator nextObject].cold.1(v4, (uint64_t)v12, v13);

      -[NSMutableArray removeLastObject](self->_stack, "removeLastObject");
      objc_msgSend(v4, "chainInfo");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    if (objc_msgSend(v5, "itemType") == 9)
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[BRCPCSChainEnumerator nextObject].cold.2(v6, (uint64_t)v15, v16);

      objc_msgSend(v6, "itemID");
      v17 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v18 = 40;
      goto LABEL_21;
    }
    if (objc_msgSend(v6, "itemType"))
    {
      objc_msgSend(v6, "itemID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        brc_bread_crumbs();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          -[BRCPCSChainBreadthEnumerator nextObject].cold.1();

      }
      v14 = v6;
LABEL_19:
      v20 = v14;
      goto LABEL_22;
    }
    if (-[NSMutableArray count](self->_stack, "count") >= self->_maxPathDepth)
      break;
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "itemID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v24;
      v26 = v10;
      v27 = 2112;
      v28 = v7;
      _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Enumerating pcs under new directory %@%@", buf, 0x16u);

    }
    v9 = -[BRCPCSChainBreadthEnumerator initWithPCSChainInfo:clientZone:]([BRCPCSChainBreadthEnumerator alloc], "initWithPCSChainInfo:clientZone:", v6, self->_clientZone);
    -[NSMutableArray addObject:](self->_stack, "addObject:", v9);

    if (!-[NSMutableArray count](self->_stack, "count"))
      return 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorFolderHierarchyTooDeep");
  v17 = (objc_class *)objc_claimAutoreleasedReturnValue();
  v18 = 32;
LABEL_21:
  v21 = *(Class *)((char *)&self->super.super.isa + v18);
  *(Class *)((char *)&self->super.super.isa + v18) = v17;

  v20 = 0;
LABEL_22:

  return v20;
}

- (id)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIDNeedingListing, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
}

- (void)initWithPCSChainInfo:(NSObject *)a3 clientZone:.cold.1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_1CBD43000, a2, a3, "[DEBUG] We need to list the root item %@%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

- (void)nextObject
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "itemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v5, "[DEBUG] We need to list %@%@", v6);

  OUTLINED_FUNCTION_6();
}

@end
