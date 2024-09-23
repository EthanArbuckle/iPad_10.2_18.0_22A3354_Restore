@implementation DTGPUAPSDataContainer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)fromData:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v5, a4);
  objc_msgSend(v6, "setClass:forClassName:", objc_opt_class(), CFSTR("XRGPUAPSDataContainer"));
  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD0E88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (DTGPUAPSDataContainer)initWithCoder:(id)a3
{
  id v4;
  DTGPUAPSDataContainer *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSMutableDictionary *config;
  void *v18;
  uint64_t v19;
  NSMutableDictionary *data;
  void *v21;
  void *v22;
  uint64_t v23;
  NSMutableArray *uscFiles;
  void *v25;
  uint64_t v26;
  NSMutableArray *rdeFiles;
  void *v28;
  uint64_t v29;
  NSMutableArray *customFiles;
  objc_super v32;
  _QWORD v33[8];

  v33[7] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)DTGPUAPSDataContainer;
  v5 = -[DTGPUAPSDataContainer init](&v32, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    v33[2] = objc_opt_class();
    v33[3] = objc_opt_class();
    v33[4] = objc_opt_class();
    v33[5] = objc_opt_class();
    v33[6] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 7);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("config"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("data"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("uscFiles"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("rdeFiles"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("customFiles"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDBD1B8];
    if (v9)
      v15 = v9;
    else
      v15 = (void *)MEMORY[0x24BDBD1B8];
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    config = v5->_config;
    v5->_config = (NSMutableDictionary *)v16;

    if (v10)
      v18 = v10;
    else
      v18 = v14;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSMutableDictionary *)v19;

    v21 = (void *)MEMORY[0x24BDBD1A8];
    if (v11)
      v22 = v11;
    else
      v22 = (void *)MEMORY[0x24BDBD1A8];
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    uscFiles = v5->_uscFiles;
    v5->_uscFiles = (NSMutableArray *)v23;

    if (v12)
      v25 = v12;
    else
      v25 = v21;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    rdeFiles = v5->_rdeFiles;
    v5->_rdeFiles = (NSMutableArray *)v26;

    if (v13)
      v28 = v13;
    else
      v28 = v21;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v28);
    v29 = objc_claimAutoreleasedReturnValue();
    customFiles = v5->_customFiles;
    v5->_customFiles = (NSMutableArray *)v29;

  }
  return v5;
}

- (DTGPUAPSDataContainer)initWithConfig:(id)a3 baseFolder:(id)a4
{
  DTGPUAPSDataContainer *v6;
  uint64_t v7;
  NSMutableDictionary *config;
  uint64_t v9;
  NSMutableDictionary *data;
  uint64_t v11;
  NSMutableArray *uscFiles;
  uint64_t v13;
  NSMutableArray *rdeFiles;
  uint64_t v15;
  NSMutableArray *customFiles;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  DTGPUAPSDataContainer *v37;
  uint64_t v39;
  id v40;
  id obj;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  objc_super v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v40 = a3;
  v43 = a4;
  v52.receiver = self;
  v52.super_class = (Class)DTGPUAPSDataContainer;
  v6 = -[DTGPUAPSDataContainer init](&v52, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v40);
    v7 = objc_claimAutoreleasedReturnValue();
    config = v6->_config;
    v6->_config = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    data = v6->_data;
    v6->_data = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    uscFiles = v6->_uscFiles;
    v6->_uscFiles = (NSMutableArray *)v11;

    v13 = objc_opt_new();
    rdeFiles = v6->_rdeFiles;
    v6->_rdeFiles = (NSMutableArray *)v13;

    v15 = objc_opt_new();
    customFiles = v6->_customFiles;
    v6->_customFiles = (NSMutableArray *)v15;

    if (v43)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("APSFiles"));
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v49;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v49 != v18)
              objc_enumerationMutation(obj);
            v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
            objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("USCIndex"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "unsignedIntValue");

            objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("File"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "stringByAppendingPathComponent:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v42, "fileExistsAtPath:", v24) & 1) == 0
              || (objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v24),
                  (v25 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
            {

LABEL_25:
              v37 = 0;
              goto LABEL_26;
            }
            -[DTGPUAPSDataContainer addDataForUSCAtIndex:data:](v6, "addDataForUSCAtIndex:data:", v22, v25);

          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
          if (v17)
            continue;
          break;
        }
      }

      objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("RDEFiles"));
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      if (v27)
      {
        v39 = *(_QWORD *)v45;
        while (2)
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v45 != v39)
              objc_enumerationMutation(v26);
            v29 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
            objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("SourceIndex"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "unsignedIntValue");

            objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("BufferIndex"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "unsignedIntValue");

            objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("File"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "stringByAppendingPathComponent:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v42, "fileExistsAtPath:", v35) & 1) == 0
              || (objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v35),
                  (v36 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
            {

              goto LABEL_25;
            }
            -[DTGPUAPSDataContainer addDataForRDESourceIndex:bufferIndex:data:](v6, "addDataForRDESourceIndex:bufferIndex:data:", v31, v33, v36);

          }
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
          if (v27)
            continue;
          break;
        }
      }

    }
  }
  v37 = v6;
LABEL_26:

  return v37;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_data, CFSTR("data"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_config, CFSTR("config"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_customFiles, CFSTR("customFiles"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_uscFiles, CFSTR("uscFiles"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_rdeFiles, CFSTR("rdeFiles"));

}

- (void)addDataForUSCAtIndex:(unsigned int)a3 data:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSMutableArray *uscFiles;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v4 = *(_QWORD *)&a3;
  v12[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("XR_GPU_APS_USC_%d"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  uscFiles = self->_uscFiles;
  v11[0] = CFSTR("USCIndex");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("File");
  v12[0] = v9;
  v12[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](uscFiles, "addObject:", v10);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_data, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)addDataForRDESourceIndex:(unsigned int)a3 bufferIndex:(unsigned int)a4 data:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  NSMutableArray *rdeFiles;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v15[3] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("XR_GPU_APS_RDE_%d_%d"), v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  rdeFiles = self->_rdeFiles;
  v14[0] = CFSTR("BufferIndex");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v14[1] = CFSTR("SourceIndex");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = CFSTR("File");
  v15[1] = v12;
  v15[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](rdeFiles, "addObject:", v13);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_data, "setObject:forKeyedSubscript:", v8, v9);
}

- (void)addCustomData:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *customFiles;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_data, "setObject:forKeyedSubscript:", v7, v6);
  customFiles = self->_customFiles;
  v10 = CFSTR("File");
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](customFiles, "addObject:", v9);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_data, "setObject:forKeyedSubscript:", v7, v6);
}

- (id)encode
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_config, "setObject:forKeyedSubscript:", self->_uscFiles, CFSTR("APSFiles"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_config, "setObject:forKeyedSubscript:", self->_rdeFiles, CFSTR("RDEFiles"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_config, "setObject:forKeyedSubscript:", self->_customFiles, CFSTR("CustomFiles"));
  return (id)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
}

- (NSDictionary)config
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_config, "setObject:forKeyedSubscript:", self->_uscFiles, CFSTR("APSFiles"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_config, "setObject:forKeyedSubscript:", self->_rdeFiles, CFSTR("RDEFiles"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_config, "setObject:forKeyedSubscript:", self->_customFiles, CFSTR("CustomFiles"));
  return (NSDictionary *)self->_config;
}

- (void)enumerateUSCData:(id)a3
{
  id v4;
  NSMutableArray *uscFiles;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  uscFiles = self->_uscFiles;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_222B664CC;
  v7[3] = &unk_24EB29F70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](uscFiles, "enumerateObjectsUsingBlock:", v7);

}

- (void)enumerateRDEData:(id)a3
{
  id v4;
  NSMutableArray *rdeFiles;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  rdeFiles = self->_rdeFiles;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_222B66644;
  v7[3] = &unk_24EB29F70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](rdeFiles, "enumerateObjectsUsingBlock:", v7);

}

- (id)getData:(id)a3
{
  -[NSMutableDictionary objectForKeyedSubscript:](self->_data, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)numUSCs
{
  return -[NSMutableArray count](self->_uscFiles, "count");
}

- (unint64_t)numRDEs
{
  return -[NSMutableArray count](self->_rdeFiles, "count");
}

- (unint64_t)numBuffersAtRDEIndex:(unint64_t)a3
{
  NSMutableArray *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  unsigned int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_rdeFiles;
  v5 = 0;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SourceIndex"), (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "unsignedIntValue") == a3;

        if (v11)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("BufferIndex"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "unsignedIntValue");

          if (v5 <= v13)
            v5 = v13;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v5;
}

- (void)addConfigEntry:(id)a3 value:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_config, "setObject:forKeyedSubscript:", a4, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customFiles, 0);
  objc_storeStrong((id *)&self->_rdeFiles, 0);
  objc_storeStrong((id *)&self->_uscFiles, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
