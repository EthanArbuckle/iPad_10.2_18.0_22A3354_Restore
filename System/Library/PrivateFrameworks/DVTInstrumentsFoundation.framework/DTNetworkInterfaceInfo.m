@implementation DTNetworkInterfaceInfo

+ (void)addInterface:(__SCNetworkInterface *)a3 toNameMapping:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  SCNetworkInterfaceGetBSDName(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SCNetworkInterfaceGetLocalizedDisplayName(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length") && objc_msgSend(v6, "length"))
    objc_msgSend(v7, "setObject:forKey:", v6, v5);

}

+ (id)interfaceNameMappings
{
  void *v3;
  const __CFArray *v4;
  uint64_t v5;
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
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = SCNetworkInterfaceCopyAll();
  v5 = -[__CFArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(a1, "addInterface:toNameMapping:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8++), v3, (_QWORD)v12);
      }
      while (v6 != v8);
      v6 = -[__CFArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v9 = *MEMORY[0x24BDF5A30];
  objc_msgSend(v3, "objectForKey:", SCNetworkInterfaceGetBSDName((SCNetworkInterfaceRef)*MEMORY[0x24BDF5A30]));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    objc_msgSend(a1, "addInterface:toNameMapping:", v9, v3);

  return v3;
}

@end
