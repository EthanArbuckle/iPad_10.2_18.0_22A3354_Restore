@implementation ASDTCustomPropertyCachePMEnabler

- (ASDTCustomPropertyCachePMEnabler)initWithConfig:(id)a3 forSequencer:(id)a4
{
  id v6;
  ASDTCustomPropertyCachePMEnabler *v7;
  void *v8;
  ASDTCustomPropertyCachePMEnabler *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASDTCustomPropertyCachePMEnabler;
  v7 = -[ASDTPMEnabler initWithConfig:forSequencer:](&v11, sel_initWithConfig_forSequencer_, v6, a4);
  if (!v7
    || (objc_msgSend(v6, "asdtPropertyAddress"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        -[ASDTCustomPropertyCachePMEnabler setPropertyAddress:](v7, "setPropertyAddress:", v8),
        v8,
        -[ASDTCustomPropertyCachePMEnabler propertyAddress](v7, "propertyAddress"),
        v9 = (ASDTCustomPropertyCachePMEnabler *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    v9 = v7;
  }

  return v9;
}

- (id)deviceName
{
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  int v15;
  void *v16;
  int v17;
  uint64_t v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  int v36;
  int v37;
  int v38;
  void *v39;
  void *v40;
  unsigned int v41;
  void *v42;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ASDTCustomPropertyCachePMEnabler propertyAddress](self, "propertyAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "selector") >> 29;
  if (v5)
  {
    -[ASDTCustomPropertyCachePMEnabler propertyAddress](self, "propertyAddress");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "selector") >> 24 > 0x7E)
    {
      v7 = 0;
      v6 = 32;
    }
    else
    {
      -[ASDTCustomPropertyCachePMEnabler propertyAddress](self, "propertyAddress");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v25, "selector") >> 24;
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
    v6 = 32;
  }
  -[ASDTCustomPropertyCachePMEnabler propertyAddress](self, "propertyAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "selector") & 0xE00000;
  if (v9)
  {
    -[ASDTCustomPropertyCachePMEnabler propertyAddress](self, "propertyAddress");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v32, "selector") >> 16) > 0x7Eu)
    {
      v36 = 0;
      v35 = 32;
    }
    else
    {
      -[ASDTCustomPropertyCachePMEnabler propertyAddress](self, "propertyAddress");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (objc_msgSend(v28, "selector") >> 16);
      v36 = 1;
    }
  }
  else
  {
    v36 = 0;
    v35 = 32;
  }
  -[ASDTCustomPropertyCachePMEnabler propertyAddress](self, "propertyAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "selector") & 0xE000;
  v42 = v4;
  v41 = v5;
  v40 = v8;
  if (v11)
  {
    -[ASDTCustomPropertyCachePMEnabler propertyAddress](self, "propertyAddress");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (((unsigned __int16)objc_msgSend(v31, "selector") >> 8) > 0x7Eu)
    {
      v34 = 0;
      v33 = 32;
    }
    else
    {
      -[ASDTCustomPropertyCachePMEnabler propertyAddress](self, "propertyAddress");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = ((unsigned __int16)objc_msgSend(v27, "selector") >> 8);
      v34 = 1;
    }
  }
  else
  {
    v34 = 0;
    v33 = 32;
  }
  -[ASDTCustomPropertyCachePMEnabler propertyAddress](self, "propertyAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v10;
  v37 = objc_msgSend(v12, "selector") & 0xE0;
  v38 = v11;
  if (v37)
  {
    -[ASDTCustomPropertyCachePMEnabler propertyAddress](self, "propertyAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "selector");
    v30 = v13;
    v15 = v9;
    v16 = v3;
    v17 = v7;
    if (v14 > 0x7Eu)
    {
      v19 = 0;
      v18 = 32;
    }
    else
    {
      -[ASDTCustomPropertyCachePMEnabler propertyAddress](self, "propertyAddress");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v26, "selector");
      v19 = 1;
    }
  }
  else
  {
    v15 = v9;
    v16 = v3;
    v17 = v7;
    v19 = 0;
    v18 = 32;
  }
  -[ASDTCustomPropertyCachePMEnabler propertyAddress](self, "propertyAddress");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "element");
  -[ASDTCustomPropertyCachePMEnabler propertyAddress](self, "propertyAddress");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("CacheEnabler S:%c%c%c%c E:%u S:%x"), v6, v35, v33, v18, v21, objc_msgSend(v22, "scope"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  if (v37)

  if (v34)
  if (v38)

  if (v36)
  if (v15)

  if (v17)
  if (v41)

  return v23;
}

- (ASDTCustomProperty)property
{
  ASDTCustomProperty **p_property;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  p_property = &self->_property;
  WeakRetained = objc_loadWeakRetained((id *)&self->_property);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_property);
  }
  else
  {
    -[ASDTPMDevice parentSequencer](self, "parentSequencer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTCustomPropertyCachePMEnabler propertyAddress](self, "propertyAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "customPropertyForAddress:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeWeak((id *)p_property, v9);
    v10 = objc_loadWeakRetained((id *)p_property);

    if (!v10 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTCustomPropertyCachePMEnabler property].cold.1(self);
    v5 = objc_loadWeakRetained((id *)p_property);

  }
  return (ASDTCustomProperty *)v5;
}

- (int)enable:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int v7;

  v3 = a3;
  -[ASDTCustomPropertyCachePMEnabler property](self, "property");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ASDTCustomPropertyCachePMEnabler property](self, "property");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUseCache:", v3);

    v7 = 0;
  }
  else
  {
    v7 = 560227702;
  }

  return v7;
}

- (void)setProperty:(id)a3
{
  objc_storeWeak((id *)&self->_property, a3);
}

- (ASDPropertyAddress)propertyAddress
{
  return self->_propertyAddress;
}

- (void)setPropertyAddress:(id)a3
{
  objc_storeStrong((id *)&self->_propertyAddress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyAddress, 0);
  objc_destroyWeak((id *)&self->_property);
}

- (void)property
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "propertyAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412546;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: No property found matching address %@", (uint8_t *)&v4, 0x16u);

}

@end
