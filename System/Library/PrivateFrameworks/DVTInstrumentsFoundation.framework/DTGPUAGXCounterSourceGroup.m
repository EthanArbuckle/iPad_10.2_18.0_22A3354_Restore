@implementation DTGPUAGXCounterSourceGroup

- (DTGPUAGXCounterSourceGroup)initWithSourceGroup:(id)a3 selects:(id)a4 apsSelects:(id)a5 profile:(unint64_t)a6
{
  id v10;
  NSArray *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  DTGPUAGXCounterSource *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  int v42;
  int v43;
  id v44;
  uint64_t v45;
  int v46;
  DTGPUAPSCounterSource *v47;
  id v48;
  NSArray *sources;
  NSArray *v50;
  DTGPUAGXCounterSourceGroup *v51;
  void *v53;
  void *v54;
  unint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v61;
  DTGPUAGXCounterSourceGroup *v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  objc_super v72;
  _BYTE v73[128];
  uint8_t v74[128];
  uint8_t buf[4];
  uint64_t v76;
  __int16 v77;
  void *v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v59 = a4;
  v61 = a4;
  v63 = a5;
  v72.receiver = self;
  v72.super_class = (Class)DTGPUAGXCounterSourceGroup;
  v62 = -[DTGPUAGXCounterSourceGroup init](&v72, sel_init);
  if (!v62)
    goto LABEL_53;
  v55 = a6;
  v11 = (NSArray *)objc_opt_new();
  if ((unint64_t)objc_msgSend(v61, "count") >= 6)
  {
    objc_msgSend(v10, "subDivideCounterList:withOptions:", v61, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("passNum"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("passList"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    if (objc_msgSend(v57, "unsignedIntValue") != 1
      || (v16 = objc_msgSend(v15, "count"),
          objc_msgSend(v10, "sourceList"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          LODWORD(v16) = v16 == objc_msgSend(v17, "count"),
          v17,
          !(_DWORD)v16))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Fatal error: cannot fit counters in one pass and/or subdivided list does not equal to source count\n", buf, 2u);
      }

LABEL_54:
      v51 = 0;
      goto LABEL_55;
    }
    v18 = 0;
    v19 = MEMORY[0x24BDACB70];
    while (1)
    {
      v20 = v18;
      if (objc_msgSend(v15, "count") <= (unint64_t)v18)
        break;
      objc_msgSend(v10, "sourceList");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndexedSubscript:", v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "objectAtIndexedSubscript:", v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "count"))
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v22, "name");
          v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v25 = objc_msgSend(v24, "UTF8String");
          *(_DWORD *)buf = 136315394;
          v76 = v25;
          v77 = 2112;
          v78 = v23;
          _os_log_impl(&dword_222B17000, v19, OS_LOG_TYPE_INFO, "Created %s source\n. Counters: %@", buf, 0x16u);

        }
        v26 = -[DTGPUAGXCounterSource initWithSource:sourceGroup:selects:sourceIndex:]([DTGPUAGXCounterSource alloc], "initWithSource:sourceGroup:selects:sourceIndex:", v22, v10, v23, -[NSArray count](v11, "count"));
        -[NSArray addObject:](v11, "addObject:", v26);

      }
      v18 = v20 + 1;
    }

  }
  if (objc_msgSend(v63, "count"))
  {
    objc_msgSend(v10, "subDivideCounterList:withOptions:", v63, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("passNum"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("passList"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v28, "unsignedIntValue") >= 2)
    {
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v30 = v53;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
      if (v31)
      {
        v32 = *(_QWORD *)v69;
        while (2)
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v69 != v32)
              objc_enumerationMutation(v30);
            v34 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
            if (objc_msgSend(v34, "count", v53))
            {
              v35 = v34;

              v63 = v35;
              goto LABEL_28;
            }
          }
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
          if (v31)
            continue;
          break;
        }
      }
LABEL_28:

    }
    objc_msgSend(v10, "subDivideCounterList:withOptions:", v63, 0, v53);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("passNum"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v56, "unsignedIntValue") == 1)
    {
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      objc_msgSend(v10, "sourceList");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
      if (v37)
      {
        v38 = *(_QWORD *)v65;
LABEL_32:
        v39 = 0;
        while (1)
        {
          if (*(_QWORD *)v65 != v38)
            objc_enumerationMutation(v36);
          v40 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v39);
          objc_msgSend(v40, "name");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "hasPrefix:", CFSTR("APS_USC"));

          if (v42)
            break;
          if (v37 == ++v39)
          {
            v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
            if (v37)
              goto LABEL_32;
            goto LABEL_45;
          }
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v40, "name");
          v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v45 = objc_msgSend(v44, "UTF8String");
          v46 = objc_msgSend(v40, "ringBufferNum");
          *(_DWORD *)buf = 136315394;
          v76 = v45;
          v77 = 1024;
          LODWORD(v78) = v46;
          _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Adding APS Source: %s, RING BUFFER %d\n", buf, 0x12u);

        }
        v47 = -[DTGPUAPSCounterSource initWithSource:sourceGroup:selects:sourceIndex:profile:]([DTGPUAPSCounterSource alloc], "initWithSource:sourceGroup:selects:sourceIndex:profile:", v40, v10, v63, -[NSArray count](v11, "count"), v55);
        if (!v47)
          goto LABEL_45;
        v48 = v40;
        -[NSArray addObject:](v11, "addObject:", v47);

        if (!v48)
          goto LABEL_46;
        v43 = 0;
      }
      else
      {
LABEL_45:

LABEL_46:
        v43 = 1;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Failed to find APS Source\n", buf, 2u);
        }
        v48 = 0;
      }

    }
    else
    {
      v43 = 1;
    }

    if (v43)
      goto LABEL_54;
  }
  if (!-[NSArray count](v11, "count"))
    goto LABEL_54;
  sources = v62->_sources;
  v62->_sources = v11;
  v50 = v11;

  objc_storeStrong((id *)&v62->_sourceGroup, a3);
  objc_storeStrong((id *)&v62->_selects, v59);

LABEL_53:
  v51 = v62;
LABEL_55:

  return v51;
}

- (BOOL)request:(unint64_t)a3 vendorFeatures:(id)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_sources;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "request:vendorFeatures:", a3, v6, (_QWORD)v13) & 1) == 0)
        {
          v11 = 0;
          goto LABEL_11;
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_11:

  return v11;
}

- (void)resume
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = self->_sources;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "resume", (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)stop
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = self->_sources;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "stop", (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)sampleCounters:(unint64_t)a3 callback:(id)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_sources;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "sampleCounters:callback:", a3, v6, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)sampleAPS:(id)a3
{
  id v4;
  NSArray *v5;
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
  v5 = self->_sources;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "sampleAPS:", v4, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (NSArray)sources
{
  return self->_sources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_selects, 0);
  objc_storeStrong((id *)&self->_sourceGroup, 0);
}

@end
