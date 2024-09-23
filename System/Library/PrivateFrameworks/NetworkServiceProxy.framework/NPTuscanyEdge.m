@implementation NPTuscanyEdge

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPTuscanyEdge)initWithLabel:(id)a3 index:(unint64_t)a4 onRampEndpoint:(id)a5 probeEndpoint:(id)a6 location:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NPTuscanyEdge *v17;
  NPTuscanyEdge *v18;
  objc_super v20;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)NPTuscanyEdge;
  v17 = -[NPTuscanyEdge init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_label, a3);
    objc_storeStrong((id *)&v18->_onRampEndpoint, a5);
    v18->_index = a4;
    objc_storeStrong((id *)&v18->_location, a7);
    objc_storeStrong((id *)&v18->_probeEndpoint, a6);
  }

  return v18;
}

- (NPTuscanyEdge)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NPTuscanyEdge *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSDictionary *onRampLists;
  NSDictionary *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSDictionary *currentOnRampIndexList;
  double v24;
  uint64_t v25;
  NSDate *lastUsed;
  uint64_t v27;
  NWEndpoint *savedEndpoint;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EdgeIndex"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProbeEndpoint"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OnRampEndpoint"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Location"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NPTuscanyEdge initWithLabel:index:onRampEndpoint:probeEndpoint:location:](self, "initWithLabel:index:onRampEndpoint:probeEndpoint:location:", v5, v6, v8, v7, v9);
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("OnRampList"));
    v16 = objc_claimAutoreleasedReturnValue();
    onRampLists = v10->_onRampLists;
    v10->_onRampLists = (NSDictionary *)v16;

    if (v10->_onRampLists)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v18 = v10->_onRampLists;
        v10->_onRampLists = 0;

      }
    }
    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("CurrentOnRampIndexList"));
    v22 = objc_claimAutoreleasedReturnValue();
    currentOnRampIndexList = v10->_currentOnRampIndexList;
    v10->_currentOnRampIndexList = (NSDictionary *)v22;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Distance"));
    v10->_distance = v24;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastUsed"));
    v25 = objc_claimAutoreleasedReturnValue();
    lastUsed = v10->_lastUsed;
    v10->_lastUsed = (NSDate *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SavedEndpoint"));
    v27 = objc_claimAutoreleasedReturnValue();
    savedEndpoint = v10->_savedEndpoint;
    v10->_savedEndpoint = (NWEndpoint *)v27;

  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[NPTuscanyEdge label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Name"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[NPTuscanyEdge index](self, "index"), CFSTR("EdgeIndex"));
  -[NPTuscanyEdge onRampLists](self, "onRampLists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("OnRampList"));

  -[NPTuscanyEdge currentOnRampIndexList](self, "currentOnRampIndexList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("CurrentOnRampIndexList"));

  -[NPTuscanyEdge probeEndpoint](self, "probeEndpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("ProbeEndpoint"));

  -[NPTuscanyEdge onRampEndpoint](self, "onRampEndpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("OnRampEndpoint"));

  -[NPTuscanyEdge location](self, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("Location"));

  -[NPTuscanyEdge distance](self, "distance");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("Distance"));
  -[NPTuscanyEdge lastUsed](self, "lastUsed");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("LastUsed"));

  -[NPTuscanyEdge savedEndpoint](self, "savedEndpoint");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("SavedEndpoint"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[3];
  char v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v19 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[NPTuscanyEdge label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTuscanyEdge probeEndpoint](self, "probeEndpoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NPTuscanyEdge probeEndpoint](self, "probeEndpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appendFormat:", CFSTR("%@ probe: %@"), v3, v5);

  }
  else
  {
    objc_msgSend(v19, "appendFormat:", CFSTR("%@ probe: %@"), v3, &stru_1E4138CF8);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[NPTuscanyEdge onRampLists](self, "onRampLists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v26;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        v23[0] = 0;
        v23[1] = v23;
        v23[2] = 0x2020000000;
        v24 = 1;
        v20[0] = v9;
        v20[1] = 3221225472;
        v20[2] = __28__NPTuscanyEdge_description__block_invoke;
        v20[3] = &unk_1E4138280;
        v22 = v23;
        v21 = v19;
        -[NPTuscanyEdge iterateOnRampsForAddressFamily:withBlock:](self, "iterateOnRampsForAddressFamily:withBlock:", v11, v20);

        _Block_object_dispose(v23, 8);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v7);
  }

  -[NPTuscanyEdge location](self, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NPTuscanyEdge distance](self, "distance");
    v14 = v13;
    -[NPTuscanyEdge location](self, "location");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appendFormat:", CFSTR(" distance: %f, location: %@"), v14, v15);

  }
  -[NPTuscanyEdge lastUsed](self, "lastUsed");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[NPTuscanyEdge lastUsed](self, "lastUsed");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appendFormat:", CFSTR(" lastUsed: %@"), v17);

  }
  return v19;
}

uint64_t __28__NPTuscanyEdge_description__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;

  v7 = a4;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v8 = *(void **)(a1 + 32);
    v9 = objc_msgSend(a3, "integerValue");
    v10 = CFSTR("IPv6");
    if (v9 == 2)
      v10 = CFSTR("IPv4");
    objc_msgSend(v8, "appendFormat:", CFSTR(" onRamps: %@ currOnRamp: %ld "), v10, a2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@,"), v7);

  return 1;
}

- (id)getCurrentOnRamp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[NPTuscanyEdge currentOnRampIndexList](self, "currentOnRampIndexList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addressFamily");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v7, "integerValue");
    objc_msgSend(v4, "addressFamily");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPTuscanyEdge getOnRamp:addressFamily:](self, "getOnRamp:addressFamily:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)getOnRamp:(int64_t)a3 addressFamily:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  -[NPTuscanyEdge onRampLists](self, "onRampLists");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_6;
  v8 = (void *)v7;
  -[NPTuscanyEdge onRampLists](self, "onRampLists");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NPTuscanyEdge onRampLists](self, "onRampLists");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3 < 0 || objc_msgSend(v12, "count") <= (unint64_t)a3)
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPTuscanyEdge parentWaldo](self, "parentWaldo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "onRampForIndex:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
LABEL_6:
    v15 = 0;
  }

  return v15;
}

- (id)nextOnRampForLatency:(id)a3 outIndex:(int64_t *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  char v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  char v36;
  id v37;
  void *v39;
  int64_t *v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "probeEndpoint");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = -1;
  -[NPTuscanyEdge onRampLists](self, "onRampLists");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v37 = 0;
    goto LABEL_26;
  }
  -[NPTuscanyEdge onRampLists](self, "onRampLists");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addressFamily");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v10, "count"))
  {
    v37 = 0;
    goto LABEL_25;
  }
  v40 = a4;
  -[NPTuscanyEdge currentOnRampIndexList](self, "currentOnRampIndexList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v6;
  objc_msgSend(v6, "addressFamily");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = v13;
  v14 = objc_msgSend(v13, "unsignedIntegerValue");
  v15 = 0;
  v16 = 0;
  v42 = v10;
  v43 = -1;
  while (1)
  {
    if (v14 >= objc_msgSend(v10, "count") - 1)
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v17 = v10;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v46 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
            -[NPTuscanyEdge parentWaldo](self, "parentWaldo");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "onRampForIndex:", v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v24, "setDayPassFailed:", 0);
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        }
        while (v19);
      }

      v14 = 0;
    }
    else
    {
      ++v14;
    }
    -[NPTuscanyEdge parentWaldo](self, "parentWaldo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "onRampForIndex:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = objc_msgSend(v27, "dayPassFailed");
    if ((v28 & 1) != 0)
      goto LABEL_19;
    v29 = v28;
    -[NPTuscanyEdge savedEndpoint](self, "savedEndpoint");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = v29 ^ 1;
      objc_msgSend(v27, "daypassEndpoint");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "hostname");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "hostname");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v33, "isEqualToString:", v34);

      v36 = v35 & v31;
      v10 = v42;

      if ((v36 & 1) == 0)
      {
LABEL_19:

        v27 = v16;
        goto LABEL_20;
      }
    }

    v43 = v14;
    if ((v14 & 0x8000000000000000) == 0)
      break;
LABEL_20:
    ++v15;
    v16 = v27;
    if (v15 >= objc_msgSend(v10, "count"))
      goto LABEL_24;
  }
  v43 = v14;
LABEL_24:
  *v40 = v43;
  v37 = v27;

  v6 = v41;
LABEL_25:

LABEL_26:
  return v37;
}

- (void)setCurrentIndex:(int64_t)a3 addressFamily:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  -[NPTuscanyEdge currentOnRampIndexList](self, "currentOnRampIndexList");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[NPTuscanyEdge currentOnRampIndexList](self, "currentOnRampIndexList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[NPTuscanyEdge currentOnRampIndexList](self, "currentOnRampIndexList");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, v14);

      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v11);
      -[NPTuscanyEdge setCurrentOnRampIndexList:](self, "setCurrentOnRampIndexList:", v13);

    }
  }

}

- (int64_t)currentIndex:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;

  v4 = a3;
  -[NPTuscanyEdge currentOnRampIndexList](self, "currentOnRampIndexList");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_4;
  v6 = (void *)v5;
  -[NPTuscanyEdge currentOnRampIndexList](self, "currentOnRampIndexList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NPTuscanyEdge currentOnRampIndexList](self, "currentOnRampIndexList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

  }
  else
  {
LABEL_4:
    v11 = -1;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NPTuscanyEdge label](self, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NPTuscanyEdge label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (int64_t)compareByDistance:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  int64_t v8;
  double v9;
  double v10;
  double v11;

  v4 = a3;
  -[NPTuscanyEdge distance](self, "distance");
  v6 = v5;
  objc_msgSend(v4, "distance");
  if (v6 >= v7)
  {
    -[NPTuscanyEdge distance](self, "distance");
    v10 = v9;
    objc_msgSend(v4, "distance");
    v8 = v10 != v11;
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

- (void)iterateOnRampsForAddressFamily:(id)a3 withBlock:(id)a4
{
  id v6;
  uint64_t (**v7)(id, _QWORD, id, void *);
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (uint64_t (**)(id, _QWORD, id, void *))a4;
  if (v6)
  {
    -[NPTuscanyEdge parentWaldo](self, "parentWaldo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NPTuscanyEdge currentIndex:](self, "currentIndex:", v6);
    v10 = v9 & ~(v9 >> 63);
    -[NPTuscanyEdge onRampLists](self, "onRampLists");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 < objc_msgSend(v12, "count"))
    {
      v13 = v10;
      while (1)
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "onRampForIndex:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7[2](v7, v13, v6, v15) & 1) == 0)
          break;
        if (v13 + 1 == objc_msgSend(v12, "count"))
          v13 = 0;
        else
          ++v13;

        if (v13 == v10)
          goto LABEL_19;
      }

    }
LABEL_19:

  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[NPTuscanyEdge onRampLists](self, "onRampLists", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v8);
          -[NPTuscanyEdge iterateOnRampsForAddressFamily:withBlock:](self, "iterateOnRampsForAddressFamily:withBlock:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), v7);
        }
        v17 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v17);
    }
  }

}

- (id)unsynthesizeAddresses:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  const char *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NPTuscanyEdge *v43;
  void *v44;
  void *v45;
  int v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  void *v51;
  int v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  _OWORD v59[8];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CCECB0], "sharedDefaultEvaluator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_33;
    objc_msgSend(v8, "interface");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_33;
    v10 = (void *)v9;
    objc_msgSend(v8, "interface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "interfaceIndex");

    if (v12)
    {
      objc_msgSend(v8, "interface");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "interfaceIndex");

      v52 = v14;
      v51 = 0;
      v46 = nw_nat64_copy_prefixes();
      if (v46)
      {
        v43 = self;
        v40 = v8;
        v41 = v6;
        v42 = v5;
        v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v16 = v4;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v48;
          do
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v48 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v20);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v22 = v21;
                if (objc_msgSend(v22, "addressFamily") == 30 && v46 >= 1)
                {
                  v23 = 0;
                  while (1)
                  {
                    objc_msgSend(v22, "address", v40);
                    if (nw_nat64_extract_v4())
                      break;
                    v23 += 16;
                    if (16 * v46 == v23)
                      goto LABEL_17;
                  }
                  memset(v59, 0, sizeof(v59));
                  LOWORD(v59[0]) = 528;
                  DWORD1(v59[0]) = 0;
                  WORD1(v59[0]) = *(_WORD *)(objc_msgSend(v22, "address") + 2);
                  objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithAddress:", v59);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  nplog_obj();
                  v25 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                  {
                    -[NPTuscanyEdge parentWaldo](v43, "parentWaldo");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "identifier");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    v54 = v44;
                    v55 = 2112;
                    v56 = v22;
                    v57 = 2112;
                    v58 = v24;
                    _os_log_debug_impl(&dword_19E8FE000, v25, OS_LOG_TYPE_DEBUG, "%@: Unsynthesized %@ to %@", buf, 0x20u);

                  }
                  objc_msgSend(v15, "addObject:", v24);

                }
                else
                {
LABEL_17:
                  objc_msgSend(v15, "addObject:", v22, v40);
                }

              }
              ++v20;
            }
            while (v20 != v18);
            v26 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
            v18 = v26;
          }
          while (v26);
        }

        if (v51)
          free(v51);
        nplog_obj();
        v27 = objc_claimAutoreleasedReturnValue();
        v6 = v41;
        v5 = v42;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          -[NPTuscanyEdge parentWaldo](v43, "parentWaldo");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "identifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v59[0]) = 138412546;
          *(_QWORD *)((char *)v59 + 4) = v39;
          WORD6(v59[0]) = 2112;
          *(_QWORD *)((char *)v59 + 14) = v15;
          _os_log_debug_impl(&dword_19E8FE000, v27, OS_LOG_TYPE_DEBUG, "%@: Unsynthesized result %@", (uint8_t *)v59, 0x16u);

        }
        if (objc_msgSend(v15, "count"))
          v28 = v15;
        else
          v28 = 0;
        v29 = v28;

        v8 = v40;
        goto LABEL_37;
      }
      nplog_obj();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        -[NPTuscanyEdge parentWaldo](self, "parentWaldo");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v59[0]) = 138412290;
        *(_QWORD *)((char *)v59 + 4) = v32;
        v33 = "%@: No need to unsynthesize addresses, no prefixes";
        goto LABEL_35;
      }
    }
    else
    {
LABEL_33:
      nplog_obj();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        -[NPTuscanyEdge parentWaldo](self, "parentWaldo");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v59[0]) = 138412290;
        *(_QWORD *)((char *)v59 + 4) = v32;
        v33 = "%@: Cannot unsynthesize addresses, no path";
LABEL_35:
        _os_log_impl(&dword_19E8FE000, v30, OS_LOG_TYPE_DEFAULT, v33, (uint8_t *)v59, 0xCu);

      }
    }

    v29 = v4;
LABEL_37:

    goto LABEL_41;
  }
  nplog_obj();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    -[NPTuscanyEdge parentWaldo](self, "parentWaldo");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "identifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v59[0]) = 138412290;
    *(_QWORD *)((char *)v59 + 4) = v36;
    _os_log_impl(&dword_19E8FE000, v34, OS_LOG_TYPE_DEFAULT, "%@: No need to unsynthesize addresses, no IPv6 address", (uint8_t *)v59, 0xCu);

  }
  v29 = v4;
LABEL_41:

  return v29;
}

BOOL __39__NPTuscanyEdge_unsynthesizeAddresses___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  objc_opt_class();
  v3 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v2, "addressFamily") == 30;

  return v3;
}

- (void)resolveWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  NPResolver *v12;
  NPResolver *v13;
  _QWORD v14[5];
  NPResolver *v15;
  void (**v16)(id, uint64_t, _QWORD);
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  if (-[NPTuscanyEdge reResolve](self, "reResolve")
    && (-[NPTuscanyEdge savedEndpoint](self, "savedEndpoint"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        -[NPTuscanyEdge setReResolve:](self, "setReResolve:", 0),
        v5)
    || (-[NPTuscanyEdge probeEndpoint](self, "probeEndpoint"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[NPTuscanyEdge onRampEndpoint](self, "onRampEndpoint"),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v4[2](v4, 1, 0);
    }
    else
    {
      nplog_obj();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        -[NPTuscanyEdge parentWaldo](self, "parentWaldo");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v18 = v8;
        v19 = 2112;
        v20 = v5;
        _os_log_impl(&dword_19E8FE000, v6, OS_LOG_TYPE_DEFAULT, "%@: resolving %@", buf, 0x16u);

      }
      -[NPTuscanyEdge parentWaldo](self, "parentWaldo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isIPv6Enabled");

      if ((v10 & 1) != 0)
      {
        v11 = 0;
      }
      else
      {
        v11 = objc_alloc_init(MEMORY[0x1E0CCECA0]);
        objc_msgSend(v11, "setAllowUnusableAddresses:", 1);
        objc_msgSend(v11, "setRequiredAddressFamily:", 2);
      }
      v12 = -[NWResolver initWithEndpoint:parameters:]([NPResolver alloc], "initWithEndpoint:parameters:", v5, v11);
      -[NPTuscanyEdge setSavedEndpoint:](self, "setSavedEndpoint:", v5);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __46__NPTuscanyEdge_resolveWithCompletionHandler___block_invoke;
      v14[3] = &unk_1E41382A8;
      v14[4] = self;
      v15 = v12;
      v16 = v4;
      v13 = v12;
      -[NPResolver resolveWithCompletionHandler:](v13, "resolveWithCompletionHandler:", v14);

    }
  }
  else
  {
    v4[2](v4, 0, 0);
  }

}

void __46__NPTuscanyEdge_resolveWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  NPTunnelTuscanyEndpoint *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NPTunnelTuscanyEndpoint *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NPTunnelTuscanyEndpoint *v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  nplog_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "probeEndpoint");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "resolvedEndpointArray");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138412546;
    v29 = v3;
    v30 = 2112;
    v31 = v4;
    _os_log_impl(&dword_19E8FE000, v2, OS_LOG_TYPE_DEFAULT, "Resolved %@ to %@", (uint8_t *)&v28, 0x16u);

  }
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "resolvedEndpointArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unsynthesizeAddresses:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "parentWaldo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isIPv6Enabled");

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_431);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filteredArrayUsingPredicate:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v11;
  }
  v12 = -[NPTunnelTuscanyEndpoint initWithHosts:]([NPTunnelTuscanyEndpoint alloc], "initWithHosts:", v7);
  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "probeEndpoint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = *(void **)(a1 + 32);
      objc_msgSend(v14, "probeEndpoint");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "getPortFromEndpoint:defaultPort:", v15, CFSTR("5223"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = -[NPTunnelTuscanyEndpoint copyHostsWithPort:](v12, "copyHostsWithPort:", v16);
      if (objc_msgSend(v17, "count"))
      {
        v18 = -[NPTunnelTuscanyEndpoint initWithHosts:]([NPTunnelTuscanyEndpoint alloc], "initWithHosts:", v17);
        v19 = *(_QWORD *)(a1 + 32);
        v20 = *(void **)(v19 + 64);
        *(_QWORD *)(v19 + 64) = v18;

      }
    }
    v21 = *(void **)(a1 + 32);
    objc_msgSend(v21, "onRampEndpoint");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "getPortFromEndpoint:defaultPort:", v22, CFSTR("443"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = -[NPTunnelTuscanyEndpoint copyHostsWithPort:](v12, "copyHostsWithPort:", v23);
    if (objc_msgSend(v24, "count"))
    {
      v25 = -[NPTunnelTuscanyEndpoint initWithHosts:]([NPTunnelTuscanyEndpoint alloc], "initWithHosts:", v24);
      v26 = *(_QWORD *)(a1 + 32);
      v27 = *(void **)(v26 + 72);
      *(_QWORD *)(v26 + 72) = v25;

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

BOOL __46__NPTuscanyEdge_resolveWithCompletionHandler___block_invoke_430(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  objc_opt_class();
  v3 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v2, "addressFamily") != 30;

  return v3;
}

- (id)getPortFromEndpoint:(id)a3 defaultPort:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    objc_msgSend(v7, "hosts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      objc_msgSend(v7, "hosts");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "port");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = v6;
    }
    goto LABEL_7;
  }
  objc_opt_class();
  v12 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "port");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
LABEL_7:

  }
  return v12;
}

- (void)linkWithOnRampsRetainMissingAddressFamilies:(BOOL)a3
{
  void *v3;
  char isKindOfClass;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  NPTuscanyOnRamp *v16;
  void *v17;
  void *v18;
  BOOL v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint32_t v42;
  void *v43;
  void *v44;
  void *v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  id obj;
  id v51;
  id v52;
  _QWORD v53[5];
  uint8_t buf[8];
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
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
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v46 = a3;
  v73 = *MEMORY[0x1E0C80C00];
  -[NPTuscanyEdge parentWaldo](self, "parentWaldo");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTuscanyEdge onRampLists](self, "onRampLists");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v48)
    __assert_rtn("-[NPTuscanyEdge linkWithOnRampsRetainMissingAddressFamilies:]", "NPWaldo.m", 1452, "parentWaldo != nil");
  -[NPTuscanyEdge setOnRampLists:](self, "setOnRampLists:", 0);
  -[NPTuscanyEdge setCurrentOnRampIndexList:](self, "setCurrentOnRampIndexList:", 0);
  -[NPTuscanyEdge onRampEndpoint](self, "onRampEndpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v48, "allOnRamps");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "mutableCopy");

    -[NPTuscanyEdge onRampEndpoint](self, "onRampEndpoint");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    objc_msgSend(v45, "hosts");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
    if (v8)
    {
      v51 = *(id *)v67;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(id *)v67 != v51)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
          v11 = -[NSObject count](v6, "count");
          if (-[NSObject count](v6, "count"))
          {
            v12 = 0;
            while (1)
            {
              -[NSObject objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "daypassEndpoint");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "isEqual:", v10);

              if ((v15 & 1) != 0)
                break;
              if (++v12 >= (unint64_t)-[NSObject count](v6, "count"))
                goto LABEL_14;
            }
            v11 = v12;
          }
LABEL_14:
          if (v11 == -[NSObject count](v6, "count"))
          {
            v16 = -[NPTuscanyOnRamp initWithEndpoint:]([NPTuscanyOnRamp alloc], "initWithEndpoint:", v10);
            if (!v6)
              v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            -[NSObject addObject:](v6, "addObject:", v16);

          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "addressFamily"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v7)
            v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v7, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18 == 0;

          if (v19)
          {
            v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          }
          else
          {
            objc_msgSend(v7, "objectForKeyedSubscript:", v17);
            v20 = (id)objc_claimAutoreleasedReturnValue();
          }
          v21 = v20;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v22);

          objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, v17);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
      }
      while (v8);
    }

    if (v46)
    {
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v23 = v47;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v63;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v63 != v25)
              objc_enumerationMutation(v23);
            v27 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j);
            objc_msgSend(v7, "objectForKeyedSubscript:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v28)
            {
              objc_msgSend(v23, "objectForKeyedSubscript:", v27);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = (void *)objc_msgSend(v29, "mutableCopy");

              objc_msgSend(v7, "setObject:forKeyedSubscript:", v28, v27);
            }

          }
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
        }
        while (v24);
      }

    }
    if (v6)
    {
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v6);
      objc_msgSend(v48, "setAllOnRamps:", v30);

    }
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v7);
    -[NPTuscanyEdge setOnRampLists:](self, "setOnRampLists:", v31);

    -[NPTuscanyEdge onRampLists](self, "onRampLists");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count") == 0;

    if (!v33)
    {
      v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      -[NPTuscanyEdge onRampLists](self, "onRampLists");
      v52 = (id)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
      if (v35)
      {
        v36 = *(_QWORD *)v59;
        do
        {
          for (k = 0; k != v35; ++k)
          {
            if (*(_QWORD *)v59 != v36)
              objc_enumerationMutation(v52);
            v38 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * k);
            *(_QWORD *)buf = 0;
            v55 = buf;
            v56 = 0x2020000000;
            v57 = -1;
            v53[0] = MEMORY[0x1E0C809B0];
            v53[1] = 3221225472;
            v53[2] = __61__NPTuscanyEdge_linkWithOnRampsRetainMissingAddressFamilies___block_invoke;
            v53[3] = &unk_1E41382D0;
            v53[4] = buf;
            -[NPTuscanyEdge iterateOnRampsForAddressFamily:withBlock:](self, "iterateOnRampsForAddressFamily:withBlock:", v38, v53);
            v39 = *((_QWORD *)v55 + 3);
            if (v39 < 0)
            {
              -[NPTuscanyEdge onRampLists](self, "onRampLists");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "objectForKeyedSubscript:", v38);
              v41 = (void *)objc_claimAutoreleasedReturnValue();

              v42 = arc4random_uniform(objc_msgSend(v41, "count"));
              *((_QWORD *)v55 + 3) = v42;

              v39 = *((_QWORD *)v55 + 3);
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v39);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setObject:forKeyedSubscript:", v43, v38);

            _Block_object_dispose(buf, 8);
          }
          v35 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
        }
        while (v35);
      }

      v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v34);
      -[NPTuscanyEdge setCurrentOnRampIndexList:](self, "setCurrentOnRampIndexList:", v44);

    }
  }
  else
  {
    nplog_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E8FE000, v6, OS_LOG_TYPE_DEFAULT, "Cannot link with onramps because the onramp endpoint is not a list of addresses", buf, 2u);
    }
  }

}

uint64_t __61__NPTuscanyEdge_linkWithOnRampsRetainMissingAddressFamilies___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result;

  result = objc_msgSend(a4, "isDayPassExpired");
  if ((result & 1) == 0)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return result;
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (NPLocation)location
{
  return (NPLocation *)objc_getProperty(self, a2, 32, 1);
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (BOOL)probePending
{
  return self->_probePending;
}

- (void)setProbePending:(BOOL)a3
{
  self->_probePending = a3;
}

- (NSDictionary)onRampLists
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOnRampLists:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDictionary)currentOnRampIndexList
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCurrentOnRampIndexList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NWEndpoint)probeEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 64, 1);
}

- (NWEndpoint)onRampEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 72, 1);
}

- (NSDate)lastUsed
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLastUsed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NPWaldo)parentWaldo
{
  return (NPWaldo *)objc_loadWeakRetained((id *)&self->_parentWaldo);
}

- (void)setParentWaldo:(id)a3
{
  objc_storeWeak((id *)&self->_parentWaldo, a3);
}

- (NWEndpoint)savedEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSavedEndpoint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)reResolve
{
  return self->_reResolve;
}

- (void)setReResolve:(BOOL)a3
{
  self->_reResolve = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedEndpoint, 0);
  objc_destroyWeak((id *)&self->_parentWaldo);
  objc_storeStrong((id *)&self->_lastUsed, 0);
  objc_storeStrong((id *)&self->_onRampEndpoint, 0);
  objc_storeStrong((id *)&self->_probeEndpoint, 0);
  objc_storeStrong((id *)&self->_currentOnRampIndexList, 0);
  objc_storeStrong((id *)&self->_onRampLists, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
