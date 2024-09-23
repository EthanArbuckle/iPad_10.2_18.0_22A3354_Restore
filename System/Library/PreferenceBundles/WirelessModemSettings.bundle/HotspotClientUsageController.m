@implementation HotspotClientUsageController

- (id)dataUsageString:(id)a3
{
  return (id)objc_msgSend(a3, "propertyForKey:", CFSTR("ClientUsageString"));
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:", CFSTR("Client data usage is only shown in internal builds."), *MEMORY[0x24BE75A68]);
    objc_msgSend(v5, "addObject:", v6);
    -[HotspotClientUsageController getSpecifiersForClients](self, "getSpecifiersForClients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

    v8 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)getSpecifiersForClients
{
  uint64_t v2;
  const void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  const void *v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = WiFiManagerClientCreate();
  if (v2)
  {
    v3 = (const void *)v2;
    v4 = (void *)WiFiManagerClientCopyProperty();
    v5 = v4;
    if (v4)
    {
      v28 = v4;
      v29 = v3;
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      obj = v4;
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      v6 = 0;
      v7 = 0;
      if (v33)
      {
        v31 = *MEMORY[0x24BE67EC8];
        v32 = *(_QWORD *)v48;
        v38 = *MEMORY[0x24BE67EB8];
        v39 = *MEMORY[0x24BE67ED8];
        v36 = *MEMORY[0x24BE67EB0];
        v37 = *MEMORY[0x24BE67E98];
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v48 != v32)
              objc_enumerationMutation(obj);
            v34 = v8;
            objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v8), "objectForKey:", v31);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = 0u;
            v44 = 0u;
            v45 = 0u;
            v46 = 0u;
            v35 = v9;
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
            if (v10)
            {
              v11 = v10;
              v42 = *(_QWORD *)v44;
              do
              {
                v12 = 0;
                v13 = v6;
                v14 = v7;
                do
                {
                  if (*(_QWORD *)v44 != v42)
                    objc_enumerationMutation(v35);
                  v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v12);
                  objc_msgSend(v15, "objectForKey:", v39);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "objectForKey:", v38);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "objectForKey:", v37);
                  v6 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v15, "objectForKey:", v36);
                  v7 = (void *)objc_claimAutoreleasedReturnValue();

                  v18 = objc_msgSend(v17, "unsignedIntegerValue");
                  v19 = objc_msgSend(v16, "unsignedIntegerValue") + v18;
                  if (v7)
                    v20 = v7;
                  else
                    v20 = v6;
                  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v20, self, 0, sel_dataUsageString_, 0, 4, 0);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v22 = v21;
                  if (v19)
                  {
                    objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", v19, 0);
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v22, "setProperty:forKey:", v23, CFSTR("ClientUsageString"));

                  }
                  else
                  {
                    objc_msgSend(v21, "setProperty:forKey:", &stru_24FDBBCF8, CFSTR("ClientUsageString"));
                  }
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v19);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "setProperty:forKey:", v24, CFSTR("ClientUsageBytes"));

                  objc_msgSend(v41, "addObject:", v22);
                  ++v12;
                  v13 = v6;
                  v14 = v7;
                }
                while (v11 != v12);
                v11 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
              }
              while (v11);
            }

            v8 = v34 + 1;
          }
          while (v34 + 1 != v33);
          v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        }
        while (v33);
      }

      v5 = v28;
      v3 = v29;
    }
    CFRelease(v3);

  }
  objc_msgSend(v41, "sortUsingFunction:context:", _CompareUsages, 0);
  objc_msgSend(v41, "reverseObjectEnumerator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "allObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

@end
