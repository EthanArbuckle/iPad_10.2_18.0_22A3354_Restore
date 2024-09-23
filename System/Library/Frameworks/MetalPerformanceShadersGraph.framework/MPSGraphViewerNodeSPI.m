@implementation MPSGraphViewerNodeSPI

- (MPSGraphViewerNodeSPI)initWithType:(id)a3 inputs:(id)a4 outputs:(id)a5 properties:(id)a6 regions:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  MPSGraphViewerNodeSPI *v17;
  MPSGraphViewerNodeSPI *v18;
  id v20;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20 = a7;
  v21.receiver = self;
  v21.super_class = (Class)MPSGraphViewerNodeSPI;
  v17 = -[MPSGraphViewerNodeSPI init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_type, a3);
    objc_storeStrong((id *)&v18->_inputs, a4);
    objc_storeStrong((id *)&v18->_outputs, a5);
    objc_storeStrong((id *)&v18->_properties, a6);
    objc_storeStrong((id *)&v18->_regions, a7);
  }

  return v18;
}

- (MPSGraphViewerNodeSPI)initWithJSONDictionary:(id)a3
{
  MPSGraphViewerNodeSPI *v4;
  uint64_t v5;
  NSString *type;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  MPSGraphViewerNodePortSPI *v10;
  uint64_t v11;
  NSArray *inputs;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  MPSGraphViewerNodePortSPI *v16;
  uint64_t v17;
  NSArray *outputs;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  MPSGraphViewerNodePropertyStringSPI *v27;
  MPSGraphViewerNodePropertyStringSPI *v28;
  MPSGraphViewerNodePropertyEnumSPI *v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  NSArray *properties;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  MPSGraphViewerNodeRegionSPI *v42;
  uint64_t v43;
  NSArray *regions;
  MPSGraphViewerNodeSPI *v46;
  id v47;
  id v48;
  id v49;
  id obj;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  objc_super v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v69.receiver = self;
  v69.super_class = (Class)MPSGraphViewerNodeSPI;
  v4 = -[MPSGraphViewerNodeSPI init](&v69, sel_init);
  v46 = v4;
  if (v4)
  {
    objc_msgSend(v47, "objectForKey:", CFSTR("type"));
    v5 = objc_claimAutoreleasedReturnValue();
    type = v4->_type;
    v4->_type = (NSString *)v5;

    v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v47, "objectForKey:", CFSTR("inputs"));
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v66 != v8)
            objc_enumerationMutation(obj);
          v10 = -[MPSGraphViewerNodePortSPI initWithJSONDictionary:]([MPSGraphViewerNodePortSPI alloc], "initWithJSONDictionary:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i));
          objc_msgSend(v52, "addObject:", v10);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
      }
      while (v7);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v52);
    v11 = objc_claimAutoreleasedReturnValue();
    inputs = v46->_inputs;
    v46->_inputs = (NSArray *)v11;

    v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v47, "objectForKey:", CFSTR("outputs"));
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v49 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v62;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v62 != v14)
            objc_enumerationMutation(v49);
          v16 = -[MPSGraphViewerNodePortSPI initWithJSONDictionary:]([MPSGraphViewerNodePortSPI alloc], "initWithJSONDictionary:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * j));
          objc_msgSend(v51, "addObject:", v16);

        }
        v13 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
      }
      while (v13);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v51);
    v17 = objc_claimAutoreleasedReturnValue();
    outputs = v46->_outputs;
    v46->_outputs = (NSArray *)v17;

    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v47, "objectForKey:", CFSTR("properties"));
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v48 = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v58;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v58 != v21)
            objc_enumerationMutation(v48);
          v23 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v22);
          objc_msgSend(v23, "objectForKey:", CFSTR("type"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v24)
          {
            objc_msgSend(v23, "objectForKey:", CFSTR("isEnum"));
            v28 = (MPSGraphViewerNodePropertyStringSPI *)objc_claimAutoreleasedReturnValue();
            v27 = v28;
            if (v28 && -[MPSGraphViewerNodePropertyStringSPI BOOLValue](v28, "BOOLValue"))
            {
              v29 = -[MPSGraphViewerNodePropertyEnumSPI initWithJSONDictionary:]([MPSGraphViewerNodePropertyEnumSPI alloc], "initWithJSONDictionary:", v23);
              objc_msgSend(v19, "addObject:", v29);
            }
            else
            {
              v29 = -[MPSGraphViewerNodePropertyDataSPI initWithJSONDictionary:]([MPSGraphViewerNodePropertyDataSPI alloc], "initWithJSONDictionary:", v23);
              objc_msgSend(v19, "addObject:", v29);
            }

            goto LABEL_31;
          }
          +[MPSGraphViewerNodePropertyStringSPI type](MPSGraphViewerNodePropertyStringSPI, "type");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v24, "isEqualToString:", v25);

          if (v26)
          {
            v27 = -[MPSGraphViewerNodePropertyStringSPI initWithJSONDictionary:]([MPSGraphViewerNodePropertyStringSPI alloc], "initWithJSONDictionary:", v23);
            objc_msgSend(v19, "addObject:", v27);
LABEL_31:

            goto LABEL_32;
          }
          +[MPSGraphViewerNodePropertyEnumSPI type](MPSGraphViewerNodePropertyEnumSPI, "type");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v24, "isEqualToString:", v30);

          if (v31)
          {
            v27 = -[MPSGraphViewerNodePropertyEnumSPI initWithJSONDictionary:]([MPSGraphViewerNodePropertyEnumSPI alloc], "initWithJSONDictionary:", v23);
            objc_msgSend(v19, "addObject:", v27);
            goto LABEL_31;
          }
          +[MPSGraphViewerNodePropertyDataSPI type](MPSGraphViewerNodePropertyDataSPI, "type");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v24, "isEqualToString:", v32);

          if (v33)
          {
            v27 = -[MPSGraphViewerNodePropertyDataSPI initWithJSONDictionary:]([MPSGraphViewerNodePropertyDataSPI alloc], "initWithJSONDictionary:", v23);
            objc_msgSend(v19, "addObject:", v27);
            goto LABEL_31;
          }
LABEL_32:

          ++v22;
        }
        while (v20 != v22);
        v34 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
        v20 = v34;
      }
      while (v34);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v19);
    v35 = objc_claimAutoreleasedReturnValue();
    properties = v46->_properties;
    v46->_properties = (NSArray *)v35;

    v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v47, "objectForKey:", CFSTR("regions"));
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v38 = (id)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v54;
      do
      {
        for (k = 0; k != v39; ++k)
        {
          if (*(_QWORD *)v54 != v40)
            objc_enumerationMutation(v38);
          v42 = -[MPSGraphViewerNodeRegionSPI initWithJSONDictionary:]([MPSGraphViewerNodeRegionSPI alloc], "initWithJSONDictionary:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * k));
          objc_msgSend(v37, "addObject:", v42);

        }
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
      }
      while (v39);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v37);
    v43 = objc_claimAutoreleasedReturnValue();
    regions = v46->_regions;
    v46->_regions = (NSArray *)v43;

  }
  return v46;
}

- (id)jsonDictionary
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[5];
  _QWORD v47[5];
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[MPSGraphViewerNodeSPI inputs](self, "inputs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v43;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v43 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v7), "jsonDictionary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    }
    while (v5);
  }

  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[MPSGraphViewerNodeSPI outputs](self, "outputs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v39;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v13), "jsonDictionary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v11);
  }

  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[MPSGraphViewerNodeSPI properties](self, "properties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v49, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v35;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v35 != v18)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v19), "jsonDictionary");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v49, 16);
    }
    while (v17);
  }

  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[MPSGraphViewerNodeSPI regions](self, "regions", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v48, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v31;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v25), "jsonDictionary");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v26);

        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v48, 16);
    }
    while (v23);
  }

  v46[0] = CFSTR("type");
  -[MPSGraphViewerNodeSPI type](self, "type");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v27;
  v47[1] = v3;
  v46[1] = CFSTR("inputs");
  v46[2] = CFSTR("outputs");
  v47[2] = v9;
  v47[3] = v15;
  v46[3] = CFSTR("properties");
  v46[4] = CFSTR("regions");
  v47[4] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (NSString)type
{
  return self->_type;
}

- (NSArray)inputs
{
  return self->_inputs;
}

- (NSArray)outputs
{
  return self->_outputs;
}

- (NSArray)properties
{
  return self->_properties;
}

- (NSArray)regions
{
  return self->_regions;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  objc_storeStrong((id *)&self->_localizedDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
