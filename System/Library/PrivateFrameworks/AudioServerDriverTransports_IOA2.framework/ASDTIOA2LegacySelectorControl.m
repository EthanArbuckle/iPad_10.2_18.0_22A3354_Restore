@implementation ASDTIOA2LegacySelectorControl

- (ASDTIOA2LegacySelectorControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 forElement:(unsigned int)a6 inScope:(unsigned int)a7 objectClassID:(unsigned int)a8 dictionary:(id)a9
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  id v16;
  void *v17;
  ASDTIOA2LegacySelectorControl *v18;
  objc_super v20;

  v9 = *(_QWORD *)&a8;
  v10 = *(_QWORD *)&a7;
  v11 = *(_QWORD *)&a6;
  v12 = a5;
  v16 = a3;
  objc_msgSend(v16, "plugin");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)ASDTIOA2LegacySelectorControl;
  v18 = -[ASDSelectorControl initWithIsSettable:forElement:inScope:withPlugin:andObjectClassID:](&v20, sel_initWithIsSettable_forElement_inScope_withPlugin_andObjectClassID_, v12, v11, v10, v17, v9);

  if (v18)
  {
    objc_storeStrong((id *)&v18->_ioa2Device, a3);
    v18->_userClientID = a4;
  }

  return v18;
}

- (BOOL)synchronizeWithRegistry
{
  ASDTIOA2LegacyDevice *ioa2Device;
  ASDTIOA2LegacySelectorControl *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  void *v32;
  int v33;
  BOOL v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t n;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t ii;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id obj;
  uint64_t v51;
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
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[8];
  std::recursive_mutex *v78;
  uint64_t v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _QWORD v86[3];

  v86[1] = *MEMORY[0x24BDAC8D0];
  ioa2Device = self->_ioa2Device;
  if (ioa2Device)
  {
    -[ASDTIOA2LegacyDevice scopedLock](ioa2Device, "scopedLock");
    v3 = self;
    ioa2Device = self->_ioa2Device;
  }
  else
  {
    v78 = 0;
    v79 = 0;
    v3 = self;
  }
  -[ASDTIOA2LegacyDevice _controlDictionaryForControl:](ioa2Device, "_controlDictionaryForControl:", v3->_userClientID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("multi-selector"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_multiSelector = objc_msgSend(v5, "BOOLValue");

    if (self->_multiSelector)
    {
      objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("value"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("value"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v86[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v86, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[ASDSelectorControl values](self, "values");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("selectors"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v44, "count"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    obj = v44;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
    v47 = v7;
    if (v8)
    {
      v9 = *(_QWORD *)v74;
      v48 = *(_QWORD *)v74;
      do
      {
        v51 = v8;
        for (i = 0; i != v51; ++i)
        {
          if (*(_QWORD *)v74 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("value"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("name"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kind"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v12, "unsignedIntValue");
          if ((_DWORD)v15)
            v16 = v13 == 0;
          else
            v16 = 1;
          if (!v16)
          {
            if (objc_msgSend(v7, "count"))
            {
              v71 = 0uLL;
              v72 = 0uLL;
              v69 = 0uLL;
              v70 = 0uLL;
              v17 = v7;
              v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v69, v84, 16);
              if (v18)
              {
                v19 = *(_QWORD *)v70;
                while (2)
                {
                  for (j = 0; j != v18; ++j)
                  {
                    if (*(_QWORD *)v70 != v19)
                      objc_enumerationMutation(v17);
                    v21 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
                    if (objc_msgSend(v21, "value") == (_DWORD)v15)
                    {
                      v7 = v47;
                      v9 = v48;
                      v18 = objc_msgSend(v21, "selected");
                      goto LABEL_41;
                    }
                  }
                  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v69, v84, 16);
                  if (v18)
                    continue;
                  break;
                }
                v7 = v47;
                goto LABEL_40;
              }
            }
            else
            {
              v67 = 0uLL;
              v68 = 0uLL;
              v65 = 0uLL;
              v66 = 0uLL;
              v17 = v46;
              v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v65, v83, 16);
              if (v18)
              {
                v22 = *(_QWORD *)v66;
                while (2)
                {
                  for (k = 0; k != v18; ++k)
                  {
                    if (*(_QWORD *)v66 != v22)
                      objc_enumerationMutation(v17);
                    if (objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * k), "unsignedIntValue") == (_DWORD)v15)
                    {
                      v18 = 1;
                      goto LABEL_40;
                    }
                  }
                  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v65, v83, 16);
                  if (v18)
                    continue;
                  break;
                }
LABEL_40:
                v9 = v48;
              }
            }
LABEL_41:

            objc_msgSend(MEMORY[0x24BE0A268], "withValue:name:andKind:selected:", v15, v13, objc_msgSend(v14, "unsignedIntValue"), v18);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "addObject:", v24);

          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
      }
      while (v8);
    }

    v25 = objc_msgSend(v49, "count");
    if (v25 == objc_msgSend(v7, "count"))
    {
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v26 = v49;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v61, v82, 16);
      if (v27)
      {
        v28 = 0;
        v29 = *(_QWORD *)v62;
        while (2)
        {
          for (m = 0; m != v27; ++m)
          {
            if (*(_QWORD *)v62 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * m);
            if (v28 + m < (unint64_t)objc_msgSend(v7, "count"))
            {
              objc_msgSend(v7, "objectAtIndexedSubscript:");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v32, "value");
              v34 = v33 == objc_msgSend(v31, "value");

              if (v34)
                continue;
            }

            goto LABEL_56;
          }
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v61, v82, 16);
          v28 += m;
          if (v27)
            continue;
          break;
        }
      }
    }
    else
    {
LABEL_56:
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v35 = v7;
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v57, v81, 16);
      if (v36)
      {
        v37 = *(_QWORD *)v58;
        do
        {
          for (n = 0; n != v36; ++n)
          {
            if (*(_QWORD *)v58 != v37)
              objc_enumerationMutation(v35);
            -[ASDSelectorControl removeValue:](self, "removeValue:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * n));
          }
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v57, v81, 16);
        }
        while (v36);
      }

      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v39 = v49;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v53, v80, 16);
      if (v40)
      {
        v41 = *(_QWORD *)v54;
        do
        {
          for (ii = 0; ii != v40; ++ii)
          {
            if (*(_QWORD *)v54 != v41)
              objc_enumerationMutation(v39);
            -[ASDSelectorControl addValue:](self, "addValue:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * ii));
          }
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v53, v80, 16);
        }
        while (v40);
      }
    }

    std::unique_lock<std::recursive_mutex>::unlock((uint64_t)&v78);
    -[ASDTIOA2LegacySelectorControl pushValues:](self, "pushValues:", v46);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Error: Couldn't synchronize with registry", buf, 2u);
  }

  if ((_BYTE)v79)
    std::recursive_mutex::unlock(v78);
  return v45 != 0;
}

- (BOOL)doSetValues:(const unsigned int *)a3 withCount:(unint64_t)a4
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  int v17;
  int v18;
  int v19;
  unsigned int v20;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  unsigned int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)ASDTIOA2LegacySelectorControl;
  v5 = -[ASDSelectorControl setSelectedValues:withCount:](&v22, sel_setSelectedValues_withCount_, a3, a4);
  if (v5)
  {
    NSStringFromSelector(sel_selectedValue);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOA2LegacySelectorControl willChangeValueForKey:](self, "willChangeValueForKey:", v6);

    NSStringFromSelector(sel_selectedValue);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOA2LegacySelectorControl didChangeValueForKey:](self, "didChangeValueForKey:", v7);

    LODWORD(v7) = self->_multiSelector;
    v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v7)
    {
      if (v8)
      {
        -[ASDAudioDevice deviceUID](self->_ioa2Device, "deviceUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[ASDTIOA2LegacySelectorControl objectClass](self, "objectClass") >> 29
          && -[ASDTIOA2LegacySelectorControl objectClass](self, "objectClass") >> 24 <= 0x7E)
        {
          v10 = -[ASDTIOA2LegacySelectorControl objectClass](self, "objectClass") >> 24;
        }
        else
        {
          v10 = 32;
        }
        if ((-[ASDTIOA2LegacySelectorControl objectClass](self, "objectClass") & 0xE00000) != 0
          && (-[ASDTIOA2LegacySelectorControl objectClass](self, "objectClass") >> 16) <= 0x7Eu)
        {
          v13 = (-[ASDTIOA2LegacySelectorControl objectClass](self, "objectClass") >> 16);
        }
        else
        {
          v13 = 32;
        }
        if ((-[ASDTIOA2LegacySelectorControl objectClass](self, "objectClass") & 0xE000) != 0
          && ((unsigned __int16)-[ASDTIOA2LegacySelectorControl objectClass](self, "objectClass") >> 8) <= 0x7Eu)
        {
          v14 = ((unsigned __int16)-[ASDTIOA2LegacySelectorControl objectClass](self, "objectClass") >> 8);
        }
        else
        {
          v14 = 32;
        }
        if ((-[ASDTIOA2LegacySelectorControl objectClass](self, "objectClass") & 0xE0) != 0
          && -[ASDTIOA2LegacySelectorControl objectClass](self, "objectClass") <= 0x7Eu)
        {
          v15 = -[ASDTIOA2LegacySelectorControl objectClass](self, "objectClass");
        }
        else
        {
          v15 = 32;
        }
        -[ASDSelectorControl values](self, "values");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413570;
        v24 = v9;
        v25 = 1024;
        v26 = v10;
        v27 = 1024;
        v28 = v13;
        v29 = 1024;
        v30 = v14;
        v31 = 1024;
        v32 = v15;
        v33 = 2112;
        v34 = v16;
        _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Control '%c%c%c%c' changed to: %@", buf, 0x2Eu);

      }
    }
    else if (v8)
    {
      -[ASDAudioDevice deviceUID](self->_ioa2Device, "deviceUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[ASDTIOA2LegacySelectorControl objectClass](self, "objectClass") >> 29
        && -[ASDTIOA2LegacySelectorControl objectClass](self, "objectClass") >> 24 <= 0x7E)
      {
        v12 = -[ASDTIOA2LegacySelectorControl objectClass](self, "objectClass") >> 24;
      }
      else
      {
        v12 = 32;
      }
      if ((-[ASDTIOA2LegacySelectorControl objectClass](self, "objectClass") & 0xE00000) != 0
        && (-[ASDTIOA2LegacySelectorControl objectClass](self, "objectClass") >> 16) <= 0x7Eu)
      {
        v17 = (-[ASDTIOA2LegacySelectorControl objectClass](self, "objectClass") >> 16);
      }
      else
      {
        v17 = 32;
      }
      if ((-[ASDTIOA2LegacySelectorControl objectClass](self, "objectClass") & 0xE000) != 0
        && ((unsigned __int16)-[ASDTIOA2LegacySelectorControl objectClass](self, "objectClass") >> 8) <= 0x7Eu)
      {
        v18 = ((unsigned __int16)-[ASDTIOA2LegacySelectorControl objectClass](self, "objectClass") >> 8);
      }
      else
      {
        v18 = 32;
      }
      if ((-[ASDTIOA2LegacySelectorControl objectClass](self, "objectClass") & 0xE0) != 0
        && -[ASDTIOA2LegacySelectorControl objectClass](self, "objectClass") <= 0x7Eu)
      {
        v19 = -[ASDTIOA2LegacySelectorControl objectClass](self, "objectClass");
      }
      else
      {
        v19 = 32;
      }
      v20 = -[ASDSelectorControl selectedValue](self, "selectedValue");
      *(_DWORD *)buf = 138413570;
      v24 = v11;
      v25 = 1024;
      v26 = v12;
      v27 = 1024;
      v28 = v17;
      v29 = 1024;
      v30 = v18;
      v31 = 1024;
      v32 = v19;
      v33 = 1024;
      LODWORD(v34) = v20;
      _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Control '%c%c%c%c' changed to: %u", buf, 0x2Au);

    }
  }
  return v5;
}

+ (BOOL)automaticallyNotifiesObserversOfSelectedValue
{
  return 0;
}

- (BOOL)setSelectedValues:(const unsigned int *)a3 withCount:(unint64_t)a4
{
  ASDTIOA2LegacyDevice *ioa2Device;
  void *v8;
  unint64_t v9;
  std::vector<unsigned int>::size_type v10;
  BOOL v11;
  BOOL v12;
  std::vector<unsigned int> __p;
  std::vector<unsigned int>::size_type v15;
  std::recursive_mutex *v16;
  uint64_t v17;

  ioa2Device = self->_ioa2Device;
  if (ioa2Device)
  {
    -[ASDTIOA2LegacyDevice scopedLock](ioa2Device, "scopedLock");
  }
  else
  {
    v16 = 0;
    v17 = 0;
  }
  -[ASDSelectorControl values](self, "values");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 <= 1)
    v10 = 1;
  else
    v10 = v9;
  v15 = v10;
  std::vector<unsigned int>::vector(&__p, v10);
  v11 = -[ASDTIOA2LegacyDevice _setControlValues:withCount:resultValues:count:forControl:](self->_ioa2Device, "_setControlValues:withCount:resultValues:count:forControl:", a3, a4, __p.__begin_, &v15, self->_userClientID);
  std::unique_lock<std::recursive_mutex>::unlock((uint64_t)&v16);
  v12 = v11
     && -[ASDTIOA2LegacySelectorControl doSetValues:withCount:](self, "doSetValues:withCount:", __p.__begin_, v15);
  if (__p.__begin_)
  {
    __p.__end_ = __p.__begin_;
    operator delete(__p.__begin_);
  }
  if ((_BYTE)v17)
    std::recursive_mutex::unlock(v16);
  return v12;
}

- (void)pushValue:(unsigned int)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (!a3 || self->_multiSelector)
  {
    -[ASDTIOA2LegacyDevice _controlDictionaryForControl:](self->_ioa2Device, "_controlDictionaryForControl:", self->_userClientID);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("value"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[ASDTIOA2LegacySelectorControl pushValues:](self, "pushValues:", v5);

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

  -[ASDTIOA2LegacySelectorControl doSetValues:withCount:](self, "doSetValues:withCount:", v16.__begin_, v6);
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

- (unsigned)userClientID
{
  return self->_userClientID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ioa2Device, 0);
}

@end
