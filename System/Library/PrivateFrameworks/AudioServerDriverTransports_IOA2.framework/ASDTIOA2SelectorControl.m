@implementation ASDTIOA2SelectorControl

- (ASDTIOA2SelectorControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 forElement:(unsigned int)a6 inScope:(unsigned int)a7 objectClassID:(unsigned int)a8 dictionary:(id)a9
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  id v15;
  void *v16;
  ASDTIOA2SelectorControl *v17;
  objc_super v19;

  v9 = *(_QWORD *)&a8;
  v10 = *(_QWORD *)&a7;
  v11 = *(_QWORD *)&a6;
  v12 = a5;
  v15 = a3;
  objc_msgSend(v15, "plugin");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)ASDTIOA2SelectorControl;
  v17 = -[ASDSelectorControl initWithIsSettable:forElement:inScope:withPlugin:andObjectClassID:](&v19, sel_initWithIsSettable_forElement_inScope_withPlugin_andObjectClassID_, v12, v11, v10, v16, v9);

  if (v17)
  {
    objc_storeWeak((id *)&v17->_ioa2Device, v15);
    v17->_userClientID = a4;
  }

  return v17;
}

- (void)dealloc
{
  objc_super v3;

  -[ASDControl asdtRemoveControlProperties](self, "asdtRemoveControlProperties");
  v3.receiver = self;
  v3.super_class = (Class)ASDTIOA2SelectorControl;
  -[ASDTIOA2SelectorControl dealloc](&v3, sel_dealloc);
}

- (NSArray)propertySelectorInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("selector");
  v11[1] = CFSTR("dataType");
  v12[0] = &unk_2508502D8;
  v12[1] = &unk_2508502F0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v9[0] = CFSTR("selector");
  v9[1] = CFSTR("dataType");
  v10[0] = &unk_250850308;
  v10[1] = &unk_2508502F0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  v7[0] = CFSTR("selector");
  v7[1] = CFSTR("dataType");
  v8[0] = &unk_250850320;
  v8[1] = &unk_250850338;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (BOOL)synchronizeWithRegistryDictionary:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  int v35;
  BOOL v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t m;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t n;
  void *v46;
  id v47;
  std::recursive_mutex *p_lock;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id obj;
  void *v54;
  ASDTIOA2SelectorControl *v55;
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
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t buf[8];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _QWORD v87[3];

  v87[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v55 = self;
  p_lock = (std::recursive_mutex *)&self->_lock;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_lock);
  if (!v4)
  {
    v8 = 0;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_71;
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Error: Couldn't synchronize with registry", buf, 2u);
LABEL_7:
    v8 = 0;
    goto LABEL_71;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("property selectors"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ASDControl asdtAddControlProperties:](self, "asdtAddControlProperties:", v5);

  if (!v6)
    goto LABEL_7;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("multi-selector"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v4;
  v55->_multiSelector = objc_msgSend(v7, "BOOLValue");

  if (v55->_multiSelector)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v87, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[ASDSelectorControl values](v55, "values");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("selectors"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v46, "count"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  obj = v46;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v77;
    v50 = *(_QWORD *)v77;
    do
    {
      v12 = 0;
      v51 = v10;
      do
      {
        if (*(_QWORD *)v77 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v12);
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("value"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("name"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("kind"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v14, "unsignedIntValue");
        if ((_DWORD)v17)
          v18 = v15 == 0;
        else
          v18 = 1;
        if (!v18)
        {
          if (objc_msgSend(v54, "count"))
          {
            v74 = 0uLL;
            v75 = 0uLL;
            v72 = 0uLL;
            v73 = 0uLL;
            v19 = v54;
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
            if (v20)
            {
              v21 = *(_QWORD *)v73;
              while (2)
              {
                for (i = 0; i != v20; ++i)
                {
                  if (*(_QWORD *)v73 != v21)
                    objc_enumerationMutation(v19);
                  v23 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
                  if (objc_msgSend(v23, "value") == (_DWORD)v17)
                  {
                    v11 = v50;
                    v10 = v51;
                    v20 = objc_msgSend(v23, "selected");
                    goto LABEL_40;
                  }
                }
                v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
                if (v20)
                  continue;
                break;
              }
              v11 = v50;
              goto LABEL_39;
            }
          }
          else
          {
            v70 = 0uLL;
            v71 = 0uLL;
            v68 = 0uLL;
            v69 = 0uLL;
            v19 = v49;
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
            if (v20)
            {
              v24 = *(_QWORD *)v69;
              while (2)
              {
                for (j = 0; j != v20; ++j)
                {
                  if (*(_QWORD *)v69 != v24)
                    objc_enumerationMutation(v19);
                  if (objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * j), "unsignedIntValue") == (_DWORD)v17)
                  {
                    v20 = 1;
                    goto LABEL_39;
                  }
                }
                v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
                if (v20)
                  continue;
                break;
              }
LABEL_39:
              v10 = v51;
            }
          }
LABEL_40:

          objc_msgSend(MEMORY[0x24BE0A268], "withValue:name:andKind:selected:", v17, v15, objc_msgSend(v16, "unsignedIntValue"), v20);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "addObject:", v26);

        }
        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
    }
    while (v10);
  }

  v27 = objc_msgSend(v52, "count");
  if (v27 == objc_msgSend(v54, "count"))
  {
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v28 = v52;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v64, v83, 16);
    if (v29)
    {
      v30 = 0;
      v31 = *(_QWORD *)v65;
      while (2)
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v65 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * k);
          if (v30 + k < (unint64_t)objc_msgSend(v54, "count"))
          {
            objc_msgSend(v54, "objectAtIndexedSubscript:");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "value");
            v36 = v35 == objc_msgSend(v33, "value");

            if (v36)
              continue;
          }

          goto LABEL_55;
        }
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v64, v83, 16);
        v30 += k;
        if (v29)
          continue;
        break;
      }
    }

  }
  else
  {
LABEL_55:
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v37 = v54;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v60, v82, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v61;
      do
      {
        for (m = 0; m != v38; ++m)
        {
          if (*(_QWORD *)v61 != v39)
            objc_enumerationMutation(v37);
          -[ASDSelectorControl removeValue:](v55, "removeValue:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * m));
        }
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v60, v82, 16);
      }
      while (v38);
    }

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v41 = v52;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v56, v81, 16);
    if (v42)
    {
      v43 = *(_QWORD *)v57;
      do
      {
        for (n = 0; n != v42; ++n)
        {
          if (*(_QWORD *)v57 != v43)
            objc_enumerationMutation(v41);
          -[ASDSelectorControl addValue:](v55, "addValue:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * n));
        }
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v56, v81, 16);
      }
      while (v42);
    }

    -[ASDControl asdtSendControlPropertyChangeNotificationAtIndex:](v55, "asdtSendControlPropertyChangeNotificationAtIndex:", 1);
  }
  -[ASDTIOA2SelectorControl pushValues:](v55, "pushValues:", v49);

  v8 = 1;
  v4 = v47;
LABEL_71:
  std::recursive_mutex::unlock(p_lock);

  return v8;
}

- (BOOL)doSetValues:(const unsigned int *)a3 withCount:(unint64_t)a4
{
  recursive_mutex *p_lock;
  void *v8;
  void *v9;
  _BOOL4 v10;
  id WeakRetained;
  void *v12;
  unsigned int v13;
  id v14;
  void *v15;
  unsigned int v16;
  int v17;
  int v18;
  int v19;
  void *v20;
  int v21;
  int v22;
  int v23;
  unsigned int v24;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_lock);
  v26.receiver = self;
  v26.super_class = (Class)ASDTIOA2SelectorControl;
  if (-[ASDSelectorControl setSelectedValues:withCount:](&v26, sel_setSelectedValues_withCount_, a3, a4))
  {
    NSStringFromSelector(sel_selectedValue);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOA2SelectorControl willChangeValueForKey:](self, "willChangeValueForKey:", v8);

    -[ASDControl asdtSendControlPropertyChangeNotificationAtIndex:](self, "asdtSendControlPropertyChangeNotificationAtIndex:", 0);
    NSStringFromSelector(sel_selectedValue);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOA2SelectorControl didChangeValueForKey:](self, "didChangeValueForKey:", v9);

    LODWORD(v9) = self->_multiSelector;
    v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v9)
    {
      if (v10)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_ioa2Device);
        objc_msgSend(WeakRetained, "deviceUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 29
          && -[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 24 <= 0x7E)
        {
          v13 = -[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 24;
        }
        else
        {
          v13 = 32;
        }
        if ((-[ASDTIOA2SelectorControl objectClass](self, "objectClass") & 0xE00000) != 0
          && (-[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 16) <= 0x7Eu)
        {
          v17 = (-[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 16);
        }
        else
        {
          v17 = 32;
        }
        if ((-[ASDTIOA2SelectorControl objectClass](self, "objectClass") & 0xE000) != 0
          && ((unsigned __int16)-[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 8) <= 0x7Eu)
        {
          v18 = ((unsigned __int16)-[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 8);
        }
        else
        {
          v18 = 32;
        }
        if ((-[ASDTIOA2SelectorControl objectClass](self, "objectClass") & 0xE0) != 0
          && -[ASDTIOA2SelectorControl objectClass](self, "objectClass") <= 0x7Eu)
        {
          v19 = -[ASDTIOA2SelectorControl objectClass](self, "objectClass");
        }
        else
        {
          v19 = 32;
        }
        -[ASDSelectorControl values](self, "values");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413570;
        v28 = v12;
        v29 = 1024;
        v30 = v13;
        v31 = 1024;
        v32 = v17;
        v33 = 1024;
        v34 = v18;
        v35 = 1024;
        v36 = v19;
        v37 = 2112;
        v38 = v20;
        _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Control '%c%c%c%c' changed to: %@", buf, 0x2Eu);

      }
    }
    else if (v10)
    {
      v14 = objc_loadWeakRetained((id *)&self->_ioa2Device);
      objc_msgSend(v14, "deviceUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 29
        && -[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 24 <= 0x7E)
      {
        v16 = -[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 24;
      }
      else
      {
        v16 = 32;
      }
      if ((-[ASDTIOA2SelectorControl objectClass](self, "objectClass") & 0xE00000) != 0
        && (-[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 16) <= 0x7Eu)
      {
        v21 = (-[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 16);
      }
      else
      {
        v21 = 32;
      }
      if ((-[ASDTIOA2SelectorControl objectClass](self, "objectClass") & 0xE000) != 0
        && ((unsigned __int16)-[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 8) <= 0x7Eu)
      {
        v22 = ((unsigned __int16)-[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 8);
      }
      else
      {
        v22 = 32;
      }
      if ((-[ASDTIOA2SelectorControl objectClass](self, "objectClass") & 0xE0) != 0
        && -[ASDTIOA2SelectorControl objectClass](self, "objectClass") <= 0x7Eu)
      {
        v23 = -[ASDTIOA2SelectorControl objectClass](self, "objectClass");
      }
      else
      {
        v23 = 32;
      }
      v24 = -[ASDSelectorControl selectedValue](self, "selectedValue");
      *(_DWORD *)buf = 138413570;
      v28 = v15;
      v29 = 1024;
      v30 = v16;
      v31 = 1024;
      v32 = v21;
      v33 = 1024;
      v34 = v22;
      v35 = 1024;
      v36 = v23;
      v37 = 1024;
      LODWORD(v38) = v24;
      _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Control '%c%c%c%c' changed to: %u", buf, 0x2Au);

    }
  }
  std::recursive_mutex::unlock((std::recursive_mutex *)p_lock);
  return 1;
}

+ (BOOL)automaticallyNotifiesObserversOfSelectedValue
{
  return 0;
}

- (BOOL)setSelectedValues:(const unsigned int *)a3 withCount:(unint64_t)a4
{
  void *v7;
  unint64_t v8;
  std::vector<unsigned int>::size_type v9;
  id WeakRetained;
  void *v11;
  unsigned int v12;
  id v13;
  int v14;
  id v15;
  int v16;
  BOOL v17;
  int v19;
  int v20;
  int v21;
  id v22;
  void *v23;
  unsigned int v24;
  int v25;
  int v26;
  int v27;
  std::vector<unsigned int> __p;
  std::vector<unsigned int>::size_type v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  unint64_t v41;
  __int16 v42;
  std::vector<unsigned int>::size_type v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  -[ASDSelectorControl values](self, "values");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= 1)
    v9 = 1;
  else
    v9 = v8;
  v29 = v9;
  std::vector<unsigned int>::vector(&__p, v9);
  if (self->_multiSelector)
  {
    if (v9 < a4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_ioa2Device);
        objc_msgSend(WeakRetained, "deviceUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 29
          && -[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 24 <= 0x7E)
        {
          v12 = -[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 24;
        }
        else
        {
          v12 = 32;
        }
        if ((-[ASDTIOA2SelectorControl objectClass](self, "objectClass") & 0xE00000) != 0
          && (-[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 16) <= 0x7Eu)
        {
          v19 = (-[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 16);
        }
        else
        {
          v19 = 32;
        }
        if ((-[ASDTIOA2SelectorControl objectClass](self, "objectClass") & 0xE000) != 0
          && ((unsigned __int16)-[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 8) <= 0x7Eu)
        {
          v20 = ((unsigned __int16)-[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 8);
        }
        else
        {
          v20 = 32;
        }
        if ((-[ASDTIOA2SelectorControl objectClass](self, "objectClass") & 0xE0) != 0
          && -[ASDTIOA2SelectorControl objectClass](self, "objectClass") <= 0x7Eu)
        {
          v21 = -[ASDTIOA2SelectorControl objectClass](self, "objectClass");
        }
        else
        {
          v21 = 32;
        }
        *(_DWORD *)buf = 138413826;
        v31 = v11;
        v32 = 1024;
        v33 = v12;
        v34 = 1024;
        v35 = v19;
        v36 = 1024;
        v37 = v20;
        v38 = 1024;
        v39 = v21;
        v40 = 2048;
        v41 = a4;
        v42 = 2048;
        v43 = v9;
        _os_log_error_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: selector control '%c%c%c%c': bad number of items: %zu (max %zu)", buf, 0x38u);

      }
      goto LABEL_16;
    }
    v15 = objc_loadWeakRetained((id *)&self->_ioa2Device);
    v16 = objc_msgSend(v15, "_setControlValues:withCount:resultValues:count:forControl:", a3, a4, __p.__begin_, &v29, self->_userClientID);

    if (v16)
    {
LABEL_14:
      v17 = -[ASDTIOA2SelectorControl doSetValues:withCount:](self, "doSetValues:withCount:");
      goto LABEL_17;
    }
  }
  else
  {
    if (a4 != 1)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v22 = objc_loadWeakRetained((id *)&self->_ioa2Device);
        objc_msgSend(v22, "deviceUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 29
          && -[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 24 <= 0x7E)
        {
          v24 = -[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 24;
        }
        else
        {
          v24 = 32;
        }
        if ((-[ASDTIOA2SelectorControl objectClass](self, "objectClass") & 0xE00000) != 0
          && (-[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 16) <= 0x7Eu)
        {
          v25 = (-[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 16);
        }
        else
        {
          v25 = 32;
        }
        if ((-[ASDTIOA2SelectorControl objectClass](self, "objectClass") & 0xE000) != 0
          && ((unsigned __int16)-[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 8) <= 0x7Eu)
        {
          v26 = ((unsigned __int16)-[ASDTIOA2SelectorControl objectClass](self, "objectClass") >> 8);
        }
        else
        {
          v26 = 32;
        }
        if ((-[ASDTIOA2SelectorControl objectClass](self, "objectClass") & 0xE0) != 0
          && -[ASDTIOA2SelectorControl objectClass](self, "objectClass") <= 0x7Eu)
        {
          v27 = -[ASDTIOA2SelectorControl objectClass](self, "objectClass");
        }
        else
        {
          v27 = 32;
        }
        *(_DWORD *)buf = 138413570;
        v31 = v23;
        v32 = 1024;
        v33 = v24;
        v34 = 1024;
        v35 = v25;
        v36 = 1024;
        v37 = v26;
        v38 = 1024;
        v39 = v27;
        v40 = 2048;
        v41 = a4;
        _os_log_error_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: selector control '%c%c%c%c': bad number of items: %zu (require 1)", buf, 0x2Eu);

      }
      goto LABEL_16;
    }
    *(_DWORD *)buf = *a3;
    v13 = objc_loadWeakRetained((id *)&self->_ioa2Device);
    v14 = objc_msgSend(v13, "_setControlValue:forControl:", buf, self->_userClientID);

    if (v14)
    {
      *__p.__begin_ = *(_DWORD *)buf;
      goto LABEL_14;
    }
  }
LABEL_16:
  v17 = 0;
LABEL_17:
  if (__p.__begin_)
  {
    __p.__end_ = __p.__begin_;
    operator delete(__p.__begin_);
  }
  return v17;
}

- (void)pushValue:(unsigned int)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (!a3 || self->_multiSelector)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_ioa2Device);
    objc_msgSend(WeakRetained, "_controlDictionaryForControl:", self->_userClientID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("value"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[ASDTIOA2SelectorControl pushValues:](self, "pushValues:", v5);

}

- (void)pushValues:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  std::vector<unsigned int> v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  std::vector<unsigned int>::vector(&v16, objc_msgSend(v4, "count"));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      v10 = v6;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "unsignedIntValue", (_QWORD)v12);
        v6 = v10 + 1;
        v16.__begin_[v10] = v11;
        ++v9;
        ++v10;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v7);
  }

  -[ASDTIOA2SelectorControl doSetValues:withCount:](self, "doSetValues:withCount:", v16.__begin_, v6);
  if (v16.__begin_)
  {
    v16.__end_ = v16.__begin_;
    operator delete(v16.__begin_);
  }

}

- (BOOL)marked
{
  return self->marked;
}

- (void)setMarked:(BOOL)a3
{
  self->marked = a3;
}

- (NSArray)properties
{
  return self->properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->properties, a3);
}

- (ASDTIOA2Device)ioa2Device
{
  return (ASDTIOA2Device *)objc_loadWeakRetained((id *)&self->_ioa2Device);
}

- (void)setIoa2Device:(id)a3
{
  objc_storeWeak((id *)&self->_ioa2Device, a3);
}

- (unsigned)userClientID
{
  return self->_userClientID;
}

- (void)setUserClientID:(unsigned int)a3
{
  self->_userClientID = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ioa2Device);
  objc_storeStrong((id *)&self->properties, 0);
  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)&self->_lock);
}

- (id).cxx_construct
{
  MEMORY[0x23B802C48](&self->_lock, a2);
  return self;
}

@end
