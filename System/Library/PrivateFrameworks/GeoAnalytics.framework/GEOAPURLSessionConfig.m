@implementation GEOAPURLSessionConfig

+ (id)allSessionConfigTypes
{
  return &unk_250DE0300;
}

+ (id)configForURLSessionConfigType:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD block[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = *(_QWORD *)&a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__GEOAPURLSessionConfig_configForURLSessionConfigType___block_invoke;
  block[3] = &unk_250DC1318;
  block[4] = &v14;
  if (qword_254316CD8 != -1)
    dispatch_once(&qword_254316CD8, block);
  v4 = (void *)_MergedGlobals_15;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v15[5];
  v15[5] = v6;

  v8 = (void *)v15[5];
  if (!v8)
  {
    objc_msgSend((id)_MergedGlobals_15, "objectForKeyedSubscript:", &unk_250DDF958);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v15[5];
    v15[5] = v9;

    v8 = (void *)v15[5];
  }
  v11 = v8;
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __55__GEOAPURLSessionConfig_configForURLSessionConfigType___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  GEOAPURLSessionConfig *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  GEOAPURLSessionConfig *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  GEOAPURLSessionConfig *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  GEOAPURLSessionConfig *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  GEOAPURLSessionConfig *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  GEOAPURLSessionConfig *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  GEOAPURLSessionConfig *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = (void *)_MergedGlobals_15;
  _MergedGlobals_15 = (uint64_t)v2;

  v4 = objc_alloc_init(GEOAPURLSessionConfig);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setType:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setNoCellAuthType:", 6);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setRequireWifi:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setRequirePower:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setDiscretionary:", 0);
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v8 = (void *)_MergedGlobals_15;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v7, "type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  v10 = objc_alloc_init(GEOAPURLSessionConfig);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setType:", 2);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setNoCellAuthType:", 4);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setRequireWifi:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setRequirePower:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setDiscretionary:", 1);
  v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v14 = (void *)_MergedGlobals_15;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v13, "type"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

  v16 = objc_alloc_init(GEOAPURLSessionConfig);
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setType:", 3);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setNoCellAuthType:", 5);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setRequireWifi:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setRequirePower:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setDiscretionary:", 1);
  v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v20 = (void *)_MergedGlobals_15;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v19, "type"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v21);

  v22 = objc_alloc_init(GEOAPURLSessionConfig);
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v22;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setType:", 4);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setNoCellAuthType:", 4);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setRequireWifi:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setRequirePower:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setDiscretionary:", 1);
  v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v26 = (void *)_MergedGlobals_15;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v25, "type"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, v27);

  v28 = objc_alloc_init(GEOAPURLSessionConfig);
  v29 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v30 = *(void **)(v29 + 40);
  *(_QWORD *)(v29 + 40) = v28;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setType:", 5);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setNoCellAuthType:", 5);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setRequireWifi:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setRequirePower:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setDiscretionary:", 1);
  v31 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v32 = (void *)_MergedGlobals_15;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v31, "type"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v31, v33);

  v34 = objc_alloc_init(GEOAPURLSessionConfig);
  v35 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v36 = *(void **)(v35 + 40);
  *(_QWORD *)(v35 + 40) = v34;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setType:", 6);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setNoCellAuthType:", 6);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setRequireWifi:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setRequirePower:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setDiscretionary:", 0);
  v37 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v38 = (void *)_MergedGlobals_15;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v37, "type"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v37, v39);

  v40 = objc_alloc_init(GEOAPURLSessionConfig);
  v41 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v42 = *(void **)(v41 + 40);
  *(_QWORD *)(v41 + 40) = v40;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setType:", 0);
  v43 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v44 = (void *)_MergedGlobals_15;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v43, "type"));
  v45 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setObject:forKeyedSubscript:", v43, v45);

}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (BOOL)requireWifi
{
  return self->_requireWifi;
}

- (void)setRequireWifi:(BOOL)a3
{
  self->_requireWifi = a3;
}

- (BOOL)requirePower
{
  return self->_requirePower;
}

- (void)setRequirePower:(BOOL)a3
{
  self->_requirePower = a3;
}

- (BOOL)discretionary
{
  return self->_discretionary;
}

- (void)setDiscretionary:(BOOL)a3
{
  self->_discretionary = a3;
}

- (int)noCellAuthType
{
  return self->_noCellAuthType;
}

- (void)setNoCellAuthType:(int)a3
{
  self->_noCellAuthType = a3;
}

@end
