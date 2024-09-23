@implementation GKScene

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_sceneWithFileNamed:(id)a3 rootNode:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  id v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _QWORD v83[18];

  v83[16] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathForResource:ofType:", v5, CFSTR("gks"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "pathForResource:ofType:", v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v83[0] = objc_opt_class();
  v83[1] = objc_opt_class();
  v83[2] = objc_opt_class();
  v83[3] = objc_opt_class();
  v83[4] = objc_opt_class();
  v83[5] = objc_opt_class();
  v83[6] = objc_opt_class();
  v83[7] = objc_opt_class();
  v83[8] = objc_opt_class();
  v83[9] = objc_opt_class();
  v83[10] = objc_opt_class();
  v83[11] = objc_opt_class();
  v83[12] = objc_opt_class();
  v83[13] = objc_opt_class();
  v83[14] = objc_opt_class();
  v83[15] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v83, 16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v10);

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v8, 1, 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v53, 0);
    v12 = objc_opt_new();
    objc_msgSend(v11, "setDelegate:", v12);
    v56 = v7;
    v57 = v5;
    v54 = v9;
    v55 = v8;
    v59 = v11;
    v51 = (void *)v12;
    if (v6)
    {
      v13 = *MEMORY[0x24BDD0E88];
      v78 = 0;
      objc_msgSend(v11, "decodeTopLevelObjectOfClasses:forKey:error:", v9, v13, &v78);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v78;
      v16 = v15;
      if (v15)
        NSLog(CFSTR("Unable to decode root node of GKScene: %@"), v15);

    }
    else
    {
      objc_msgSend(v11, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_gkScene"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "decodeObjectOfClasses:forKey:", v9, *MEMORY[0x24BDD0E88]);
      v33 = objc_claimAutoreleasedReturnValue();
      if (!v33)
      {
        if (!NSClassFromString(CFSTR("SKScene")))
          NSLog(CFSTR("Cannot load scene contained in %@ due to missing framework."), v5);
        v58 = 0;
        goto LABEL_32;
      }
      v6 = (id)v33;
    }
    RepairGKSceneNodeReferencesRelativeToScene(v14, v6);
    objc_msgSend(v14, "setRootNode:", v6);
    v58 = v6;
LABEL_32:
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    objc_msgSend(v14, "entities");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v75 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
          v70 = 0u;
          v71 = 0u;
          v72 = 0u;
          v73 = 0u;
          objc_msgSend(v39, "components");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
          if (v41)
          {
            v42 = v41;
            v43 = *(_QWORD *)v71;
            do
            {
              for (j = 0; j != v42; ++j)
              {
                if (*(_QWORD *)v71 != v43)
                  objc_enumerationMutation(v40);
                objc_msgSend(v39, "addComponent:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * j));
              }
              v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
            }
            while (v42);
          }

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
      }
      while (v36);
    }

    v45 = v59;
    objc_msgSend(v59, "finishDecoding");
    v46 = v51;
    goto LABEL_48;
  }
  objc_msgSend(v7, "pathForResource:ofType:", v5, CFSTR("sks"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    objc_msgSend(v7, "pathForResource:ofType:", v5, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v14 = 0;
      goto LABEL_49;
    }
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v17, 1, 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v60, 0);
  v19 = (void *)objc_opt_new();
  objc_msgSend(v18, "setDelegate:", v19);
  objc_msgSend(v18, "decodeObjectOfClasses:forKey:", v9, CFSTR("_gkScene"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!NSClassFromString(CFSTR("SKScene")))
  {
    NSLog(CFSTR("Cannot load scene contained in %@ due to missing framework."), v5);
    v47 = v14;

    goto LABEL_50;
  }
  v50 = v19;
  v20 = *MEMORY[0x24BDD0E88];
  v69 = 0;
  objc_msgSend(v18, "decodeTopLevelObjectOfClasses:forKey:error:", v9, v20, &v69);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v69;

  if (v21)
    NSLog(CFSTR("Unable to decode root node of GKScene: %@"), v21);
  v49 = v21;
  v52 = v18;
  v53 = v17;
  v54 = v9;
  v55 = 0;
  v56 = v7;
  v57 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    RepairGKSceneNodeReferencesRelativeToScene(v14, v58);
  objc_msgSend(v14, "setRootNode:", v58);
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  objc_msgSend(v14, "entities");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v66;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v66 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * k);
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        objc_msgSend(v27, "components");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v62;
          do
          {
            for (m = 0; m != v30; ++m)
            {
              if (*(_QWORD *)v62 != v31)
                objc_enumerationMutation(v28);
              objc_msgSend(v27, "addComponent:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * m));
            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
          }
          while (v30);
        }

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
    }
    while (v24);
  }

  v46 = v52;
  objc_msgSend(v52, "finishDecoding");

  v45 = v60;
LABEL_48:

  v5 = v57;
  v6 = v58;
  v8 = v55;
  v7 = v56;
  v9 = v54;
LABEL_49:
  v47 = v14;
LABEL_50:

  return v47;
}

+ (GKScene)sceneWithFileNamed:(NSString *)filename
{
  return (GKScene *)objc_msgSend(a1, "_sceneWithFileNamed:rootNode:", filename, 0);
}

- (GKScene)init
{
  GKScene *v2;
  uint64_t v3;
  NSMutableArray *entities;
  uint64_t v5;
  NSMutableDictionary *graphs;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKScene;
  v2 = -[GKScene init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    entities = v2->_entities;
    v2->_entities = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    graphs = v2->_graphs;
    v2->_graphs = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (GKScene)initWithCoder:(id)a3
{
  id v4;
  GKScene *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *entities;
  uint64_t v11;
  NSMutableDictionary *graphs;
  objc_super v14;
  _QWORD v15[17];

  v15[16] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GKScene;
  v5 = -[GKScene init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v15[4] = objc_opt_class();
    v15[5] = objc_opt_class();
    v15[6] = objc_opt_class();
    v15[7] = objc_opt_class();
    v15[8] = objc_opt_class();
    v15[9] = objc_opt_class();
    v15[10] = objc_opt_class();
    v15[11] = objc_opt_class();
    v15[12] = objc_opt_class();
    v15[13] = objc_opt_class();
    v15[14] = objc_opt_class();
    v15[15] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v7);

    objc_msgSend(v4, "allowedClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v8);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("_entities"));
    v9 = objc_claimAutoreleasedReturnValue();
    entities = v5->_entities;
    v5->_entities = (NSMutableArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("_graphs"));
    v11 = objc_claimAutoreleasedReturnValue();
    graphs = v5->_graphs;
    v5->_graphs = (NSMutableDictionary *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableArray *entities;
  id v5;

  entities = self->_entities;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", entities, CFSTR("_entities"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_graphs, CFSTR("_graphs"));

}

- (id)copy
{
  return -[GKScene copyWithZone:](self, "copyWithZone:", MEMORY[0x22E2A4F5C](self, a2));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = self->_entities;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "copy");
        objc_msgSend(v5, "addObject:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v8);
  }

  objc_storeStrong(v4 + 1, v5);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[NSMutableDictionary allKeys](self->_graphs, "allKeys", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_graphs, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v15);
  }

  v20 = v4[2];
  v4[2] = v12;

  return v4;
}

- (void)addEntity:(GKEntity *)entity
{
  if (entity)
    -[NSMutableArray addObject:](self->_entities, "addObject:");
}

- (void)removeEntity:(GKEntity *)entity
{
  if (entity)
    -[NSMutableArray removeObject:](self->_entities, "removeObject:");
}

- (void)addGraph:(GKGraph *)graph name:(NSString *)name
{
  if (graph)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_graphs, "setObject:forKeyedSubscript:", graph, name);
}

- (void)removeGraph:(NSString *)name
{
  if (name)
    -[NSMutableDictionary removeObjectForKey:](self->_graphs, "removeObjectForKey:");
}

- (NSArray)entities
{
  return &self->_entities->super;
}

- (NSDictionary)graphs
{
  return &self->_graphs->super;
}

- (id)rootNode
{
  return self->_rootNode;
}

- (void)setRootNode:(id)rootNode
{
  objc_storeStrong((id *)&self->_rootNode, rootNode);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootNode, 0);
  objc_storeStrong((id *)&self->_graphs, 0);
  objc_storeStrong((id *)&self->_entities, 0);
}

@end
