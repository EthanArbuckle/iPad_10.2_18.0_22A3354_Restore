@implementation CRDevice

- (CRDevice)initWithComponents:(id)a3
{
  id v5;
  CRDevice *v6;
  CRDevice *v7;
  const char *v8;
  uint64_t v9;
  CRDevice *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRDevice;
  v6 = -[CRDevice init](&v12, sel_init);
  v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_components, a3),
        !objc_msgSend_populateLookupDictionary_(v7, v8, (uint64_t)v5, v9)))
  {
    v10 = 0;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (BOOL)populateLookupDictionary:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSDictionary *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  NSDictionary *v36;
  NSDictionary *typeToComponent;
  BOOL v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v9 = (NSDictionary *)v4;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v40, (uint64_t)v44, 16);
  if (v11)
  {
    v15 = v11;
    v16 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v41 != v16)
          objc_enumerationMutation(v9);
        v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x24BDD16E0];
        v20 = objc_msgSend_type(v18, v12, v13, v14, (_QWORD)v40);
        objc_msgSend_numberWithUnsignedInt_(v19, v21, v20, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v8, v24, (uint64_t)v23, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          v38 = 0;
          typeToComponent = v9;
          goto LABEL_11;
        }
        v30 = (void *)MEMORY[0x24BDD16E0];
        v31 = objc_msgSend_type(v18, v27, v28, v29);
        objc_msgSend_numberWithUnsignedInt_(v30, v32, v31, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v8, v35, (uint64_t)v18, (uint64_t)v34);

      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v40, (uint64_t)v44, 16);
      if (v15)
        continue;
      break;
    }
  }

  v36 = v8;
  typeToComponent = self->_typeToComponent;
  self->_typeToComponent = v36;
  v38 = 1;
LABEL_11:

  return v38;
}

- (id)getComponentByType:(int)a3
{
  uint64_t v3;
  NSDictionary *typeToComponent;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  typeToComponent = self->_typeToComponent;
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], a2, *(uint64_t *)&a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(typeToComponent, v6, (uint64_t)v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)components
{
  return self->_components;
}

- (void)setComponents:(id)a3
{
  objc_storeStrong((id *)&self->_components, a3);
}

- (NSDictionary)typeToComponent
{
  return self->_typeToComponent;
}

- (void)setTypeToComponent:(id)a3
{
  objc_storeStrong((id *)&self->_typeToComponent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeToComponent, 0);
  objc_storeStrong((id *)&self->_components, 0);
}

@end
