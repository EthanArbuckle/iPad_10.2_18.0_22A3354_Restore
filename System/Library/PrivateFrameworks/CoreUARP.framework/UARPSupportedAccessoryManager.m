@implementation UARPSupportedAccessoryManager

- (UARPSupportedAccessoryManager)init
{
  UARPSupportedAccessoryManager *v2;
  NSMutableSet *v3;
  NSMutableSet *setOfAccessories;
  os_log_t v5;
  OS_os_log *log;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UARPSupportedAccessoryManager;
  v2 = -[UARPSupportedAccessoryManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    setOfAccessories = v2->_setOfAccessories;
    v2->_setOfAccessories = v3;

    v5 = os_log_create("com.apple.accessoryupdater.uarp", "supportedAccessories");
    log = v2->_log;
    v2->_log = (OS_os_log *)v5;

  }
  return v2;
}

+ (id)defaultManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__UARPSupportedAccessoryManager_defaultManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultManager_onceToken != -1)
    dispatch_once(&defaultManager_onceToken, block);
  return (id)defaultManager_sharedManager;
}

void __47__UARPSupportedAccessoryManager_defaultManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  UARPSupportedAccessoryA2384 *v4;
  void *v5;
  UARPSupportedAccessoryA2049 *v6;
  void *v7;
  UARPSupportedAccessoryA2049DFU *v8;
  void *v9;
  UARPSupportedAccessoryA2049Simulated *v10;
  void *v11;
  UARPSupportedAccessoryA2049DFUSimulated *v12;
  void *v13;
  UARPSupportedAccessoryA2869 *v14;
  void *v15;
  UARPSupportedAccessoryA2868 *v16;
  void *v17;
  UARPSupportedAccessoryA2518 *v18;
  void *v19;
  UARPSupportedAccessoryA2140 *v20;
  void *v21;
  UARPSupportedAccessoryA2580 *v22;
  void *v23;
  UARPSupportedAccessoryA2924 *v24;
  void *v25;
  UARPSupportedAccessoryA3150 *v26;
  void *v27;
  UARPSupportedAccessoryA3140 *v28;
  void *v29;
  UARPSupportedAccessoryA3085 *v30;
  void *v31;
  UARPSupportedAccessoryA3211 *v32;
  void *v33;
  UARPSupportedAccessoryA3157 *v34;
  void *v35;
  UARPSupportedAccessoryA2513 *v36;
  void *v37;
  UARPSupportedAccessoryA2538 *v38;
  void *v39;
  UARPSupportedAccessoryA2776 *v40;
  void *v41;
  UARPSupportedAccessoryA2871 *v42;
  void *v43;
  UARPSupportedAccessoryA2617 *v44;
  void *v45;
  UARPSupportedAccessoryA2968 *v46;
  void *v47;
  UARPSupportedAccessoryA2699 *v48;
  void *v49;
  UARPSupportedAccessoryA3048 *v50;
  void *v51;
  UARPSupportedAccessoryA3058USB *v52;
  void *v53;
  UARPSupportedAccessoryA3059 *v54;
  void *v55;
  UARPSupportedAccessoryA3053 *v56;
  void *v57;
  UARPSupportedAccessoryA3054 *v58;
  void *v59;
  UARPSupportedAccessoryA3056 *v60;
  void *v61;
  UARPSupportedAccessoryA3057 *v62;
  void *v63;
  UARPSupportedAccessoryA2781 *v64;
  void *v65;
  UARPSupportedAccessoryA3046 *v66;
  void *v67;
  UARPSupportedAccessoryA3046DFU *v68;
  void *v69;
  UARPSupportedAccessoryA3046Simulated *v70;
  void *v71;
  UARPSupportedAccessoryA3046DFUSimulated *v72;
  void *v73;
  UARPSupportedAccessoryA2458 *v74;
  void *v75;
  UARPSupportedAccessoryA2571 *v76;
  void *v77;
  UARPSupportedAccessoryA3328 *v78;
  void *v79;
  UARPSupportedAccessoryA2676 *v80;
  void *v81;
  UARPSupportedAccessoryA2743 *v82;
  void *v83;
  UARPSupportedAccessoryA2166 *v84;
  void *v85;
  UARPSupportedAccessoryA2452 *v86;
  void *v87;
  UARPSupportedAccessoryA2515 *v88;
  void *v89;
  UARPSupportedAccessoryA2879 *v90;
  void *v91;
  UARPSupportedAccessoryA2463 *v92;
  void *v93;
  UARPSupportedAccessoryA2728 *v94;
  void *v95;
  UARPSupportedAccessoryA3088 *v96;
  void *v97;
  UARPSupportedAccessoryA2755 *v98;
  void *v99;
  UARPSupportedAccessoryA2363 *v100;
  void *v101;
  UARPSupportedAccessoryA2675 *v102;
  void *v103;
  UARPSupportedAccessoryd5b67c73d2e5e518 *v104;
  void *v105;
  UARPSupportedAccessoryA2975 *v106;
  void *v107;
  UARPSupportedAccessoryA2974 *v108;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultManager_sharedManager;
  defaultManager_sharedManager = (uint64_t)v1;

  v3 = (void *)defaultManager_sharedManager;
  v4 = objc_alloc_init(UARPSupportedAccessoryA2384);
  objc_msgSend(v3, "addSupportedAccessory:", v4);

  v5 = (void *)defaultManager_sharedManager;
  v6 = objc_alloc_init(UARPSupportedAccessoryA2049);
  objc_msgSend(v5, "addSupportedAccessory:", v6);

  v7 = (void *)defaultManager_sharedManager;
  v8 = objc_alloc_init(UARPSupportedAccessoryA2049DFU);
  objc_msgSend(v7, "addSupportedAccessory:", v8);

  v9 = (void *)defaultManager_sharedManager;
  v10 = objc_alloc_init(UARPSupportedAccessoryA2049Simulated);
  objc_msgSend(v9, "addSupportedAccessory:", v10);

  v11 = (void *)defaultManager_sharedManager;
  v12 = objc_alloc_init(UARPSupportedAccessoryA2049DFUSimulated);
  objc_msgSend(v11, "addSupportedAccessory:", v12);

  v13 = (void *)defaultManager_sharedManager;
  v14 = objc_alloc_init(UARPSupportedAccessoryA2869);
  objc_msgSend(v13, "addSupportedAccessory:", v14);

  v15 = (void *)defaultManager_sharedManager;
  v16 = objc_alloc_init(UARPSupportedAccessoryA2868);
  objc_msgSend(v15, "addSupportedAccessory:", v16);

  v17 = (void *)defaultManager_sharedManager;
  v18 = objc_alloc_init(UARPSupportedAccessoryA2518);
  objc_msgSend(v17, "addSupportedAccessory:", v18);

  v19 = (void *)defaultManager_sharedManager;
  v20 = objc_alloc_init(UARPSupportedAccessoryA2140);
  objc_msgSend(v19, "addSupportedAccessory:", v20);

  v21 = (void *)defaultManager_sharedManager;
  v22 = objc_alloc_init(UARPSupportedAccessoryA2580);
  objc_msgSend(v21, "addSupportedAccessory:", v22);

  v23 = (void *)defaultManager_sharedManager;
  v24 = objc_alloc_init(UARPSupportedAccessoryA2924);
  objc_msgSend(v23, "addSupportedAccessory:", v24);

  v25 = (void *)defaultManager_sharedManager;
  v26 = objc_alloc_init(UARPSupportedAccessoryA3150);
  objc_msgSend(v25, "addSupportedAccessory:", v26);

  v27 = (void *)defaultManager_sharedManager;
  v28 = objc_alloc_init(UARPSupportedAccessoryA3140);
  objc_msgSend(v27, "addSupportedAccessory:", v28);

  v29 = (void *)defaultManager_sharedManager;
  v30 = objc_alloc_init(UARPSupportedAccessoryA3085);
  objc_msgSend(v29, "addSupportedAccessory:", v30);

  v31 = (void *)defaultManager_sharedManager;
  v32 = objc_alloc_init(UARPSupportedAccessoryA3211);
  objc_msgSend(v31, "addSupportedAccessory:", v32);

  v33 = (void *)defaultManager_sharedManager;
  v34 = objc_alloc_init(UARPSupportedAccessoryA3157);
  objc_msgSend(v33, "addSupportedAccessory:", v34);

  v35 = (void *)defaultManager_sharedManager;
  v36 = objc_alloc_init(UARPSupportedAccessoryA2513);
  objc_msgSend(v35, "addSupportedAccessory:", v36);

  v37 = (void *)defaultManager_sharedManager;
  v38 = objc_alloc_init(UARPSupportedAccessoryA2538);
  objc_msgSend(v37, "addSupportedAccessory:", v38);

  v39 = (void *)defaultManager_sharedManager;
  v40 = objc_alloc_init(UARPSupportedAccessoryA2776);
  objc_msgSend(v39, "addSupportedAccessory:", v40);

  v41 = (void *)defaultManager_sharedManager;
  v42 = objc_alloc_init(UARPSupportedAccessoryA2871);
  objc_msgSend(v41, "addSupportedAccessory:", v42);

  v43 = (void *)defaultManager_sharedManager;
  v44 = objc_alloc_init(UARPSupportedAccessoryA2617);
  objc_msgSend(v43, "addSupportedAccessory:", v44);

  v45 = (void *)defaultManager_sharedManager;
  v46 = objc_alloc_init(UARPSupportedAccessoryA2968);
  objc_msgSend(v45, "addSupportedAccessory:", v46);

  v47 = (void *)defaultManager_sharedManager;
  v48 = objc_alloc_init(UARPSupportedAccessoryA2699);
  objc_msgSend(v47, "addSupportedAccessory:", v48);

  v49 = (void *)defaultManager_sharedManager;
  v50 = objc_alloc_init(UARPSupportedAccessoryA3048);
  objc_msgSend(v49, "addSupportedAccessory:", v50);

  v51 = (void *)defaultManager_sharedManager;
  v52 = objc_alloc_init(UARPSupportedAccessoryA3058USB);
  objc_msgSend(v51, "addSupportedAccessory:", v52);

  v53 = (void *)defaultManager_sharedManager;
  v54 = objc_alloc_init(UARPSupportedAccessoryA3059);
  objc_msgSend(v53, "addSupportedAccessory:", v54);

  v55 = (void *)defaultManager_sharedManager;
  v56 = objc_alloc_init(UARPSupportedAccessoryA3053);
  objc_msgSend(v55, "addSupportedAccessory:", v56);

  v57 = (void *)defaultManager_sharedManager;
  v58 = objc_alloc_init(UARPSupportedAccessoryA3054);
  objc_msgSend(v57, "addSupportedAccessory:", v58);

  v59 = (void *)defaultManager_sharedManager;
  v60 = objc_alloc_init(UARPSupportedAccessoryA3056);
  objc_msgSend(v59, "addSupportedAccessory:", v60);

  v61 = (void *)defaultManager_sharedManager;
  v62 = objc_alloc_init(UARPSupportedAccessoryA3057);
  objc_msgSend(v61, "addSupportedAccessory:", v62);

  v63 = (void *)defaultManager_sharedManager;
  v64 = objc_alloc_init(UARPSupportedAccessoryA2781);
  objc_msgSend(v63, "addSupportedAccessory:", v64);

  v65 = (void *)defaultManager_sharedManager;
  v66 = objc_alloc_init(UARPSupportedAccessoryA3046);
  objc_msgSend(v65, "addSupportedAccessory:", v66);

  v67 = (void *)defaultManager_sharedManager;
  v68 = objc_alloc_init(UARPSupportedAccessoryA3046DFU);
  objc_msgSend(v67, "addSupportedAccessory:", v68);

  v69 = (void *)defaultManager_sharedManager;
  v70 = objc_alloc_init(UARPSupportedAccessoryA3046Simulated);
  objc_msgSend(v69, "addSupportedAccessory:", v70);

  v71 = (void *)defaultManager_sharedManager;
  v72 = objc_alloc_init(UARPSupportedAccessoryA3046DFUSimulated);
  objc_msgSend(v71, "addSupportedAccessory:", v72);

  v73 = (void *)defaultManager_sharedManager;
  v74 = objc_alloc_init(UARPSupportedAccessoryA2458);
  objc_msgSend(v73, "addSupportedAccessory:", v74);

  v75 = (void *)defaultManager_sharedManager;
  v76 = objc_alloc_init(UARPSupportedAccessoryA2571);
  objc_msgSend(v75, "addSupportedAccessory:", v76);

  v77 = (void *)defaultManager_sharedManager;
  v78 = objc_alloc_init(UARPSupportedAccessoryA3328);
  objc_msgSend(v77, "addSupportedAccessory:", v78);

  v79 = (void *)defaultManager_sharedManager;
  v80 = objc_alloc_init(UARPSupportedAccessoryA2676);
  objc_msgSend(v79, "addSupportedAccessory:", v80);

  v81 = (void *)defaultManager_sharedManager;
  v82 = objc_alloc_init(UARPSupportedAccessoryA2743);
  objc_msgSend(v81, "addSupportedAccessory:", v82);

  v83 = (void *)defaultManager_sharedManager;
  v84 = objc_alloc_init(UARPSupportedAccessoryA2166);
  objc_msgSend(v83, "addSupportedAccessory:", v84);

  v85 = (void *)defaultManager_sharedManager;
  v86 = objc_alloc_init(UARPSupportedAccessoryA2452);
  objc_msgSend(v85, "addSupportedAccessory:", v86);

  v87 = (void *)defaultManager_sharedManager;
  v88 = objc_alloc_init(UARPSupportedAccessoryA2515);
  objc_msgSend(v87, "addSupportedAccessory:", v88);

  v89 = (void *)defaultManager_sharedManager;
  v90 = objc_alloc_init(UARPSupportedAccessoryA2879);
  objc_msgSend(v89, "addSupportedAccessory:", v90);

  v91 = (void *)defaultManager_sharedManager;
  v92 = objc_alloc_init(UARPSupportedAccessoryA2463);
  objc_msgSend(v91, "addSupportedAccessory:", v92);

  v93 = (void *)defaultManager_sharedManager;
  v94 = objc_alloc_init(UARPSupportedAccessoryA2728);
  objc_msgSend(v93, "addSupportedAccessory:", v94);

  v95 = (void *)defaultManager_sharedManager;
  v96 = objc_alloc_init(UARPSupportedAccessoryA3088);
  objc_msgSend(v95, "addSupportedAccessory:", v96);

  v97 = (void *)defaultManager_sharedManager;
  v98 = objc_alloc_init(UARPSupportedAccessoryA2755);
  objc_msgSend(v97, "addSupportedAccessory:", v98);

  v99 = (void *)defaultManager_sharedManager;
  v100 = objc_alloc_init(UARPSupportedAccessoryA2363);
  objc_msgSend(v99, "addSupportedAccessory:", v100);

  v101 = (void *)defaultManager_sharedManager;
  v102 = objc_alloc_init(UARPSupportedAccessoryA2675);
  objc_msgSend(v101, "addSupportedAccessory:", v102);

  v103 = (void *)defaultManager_sharedManager;
  v104 = objc_alloc_init(UARPSupportedAccessoryd5b67c73d2e5e518);
  objc_msgSend(v103, "addSupportedAccessory:", v104);

  v105 = (void *)defaultManager_sharedManager;
  v106 = objc_alloc_init(UARPSupportedAccessoryA2975);
  objc_msgSend(v105, "addSupportedAccessory:", v106);

  v107 = (void *)defaultManager_sharedManager;
  v108 = objc_alloc_init(UARPSupportedAccessoryA2974);
  objc_msgSend(v107, "addSupportedAccessory:", v108);

}

- (NSSet)setOfAccessories
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", self->_setOfAccessories);
}

- (void)addSupportedAccessoriesByURL:(id)a3
{
  id v4;
  void *v5;
  NSObject *log;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    -[UARPSupportedAccessoryManager addSupportedAccessoriesByURL:].cold.2((uint64_t)v4, log, v7, v8, v9, v10, v11, v12);
  -[UARPSupportedAccessoryManager addSupportedAccessoryByDictionary:](self, "addSupportedAccessoryByDictionary:", v5);
  v13 = self->_log;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[UARPSupportedAccessoryManager addSupportedAccessoriesByURL:].cold.1((uint64_t)self, v13, v14, v15, v16, v17, v18, v19);

}

- (void)addSupportedAccessoryByDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  UARPSupportedAccessory *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = -[UARPSupportedAccessory initWithDictionary:]([UARPSupportedAccessory alloc], "initWithDictionary:", v9);
          if (v10)
            -[UARPSupportedAccessoryManager addSupportedAccessory:](self, "addSupportedAccessory:", v10);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)addSupportedAccessory:(id)a3
{
  UARPSupportedAccessoryManager *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if ((-[NSMutableSet containsObject:](v4->_setOfAccessories, "containsObject:", v5) & 1) == 0)
    -[NSMutableSet addObject:](v4->_setOfAccessories, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)addSupportedAccessories:(id)a3
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
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
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
        -[UARPSupportedAccessoryManager addSupportedAccessory:](self, "addSupportedAccessory:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_setOfAccessories, 0);
}

- (void)addSupportedAccessoriesByURL:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_212D08000, a2, a3, "Supported Accessories %@", a5, a6, a7, a8, 2u);
}

- (void)addSupportedAccessoriesByURL:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_212D08000, a2, a3, "Adding Supported Accessories from %@", a5, a6, a7, a8, 2u);
}

@end
