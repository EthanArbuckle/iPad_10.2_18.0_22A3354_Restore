@implementation _GCDeviceOnDiskDB

- (_GCDeviceOnDiskDB)initWithBundles:(id)a3
{
  id v5;
  _GCDeviceOnDiskDB *v6;
  uint64_t v7;
  NSArray *configurationBundles;
  uint64_t v9;
  NSArray *bundles;
  void *v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCDeviceOnDiskDB.m"), 24, CFSTR("Invalid parameter not satisfying: %s"), "configurationBundles != nil");

  }
  v13.receiver = self;
  v13.super_class = (Class)_GCDeviceOnDiskDB;
  v6 = -[_GCDeviceOnDiskDB init](&v13, sel_init);
  v7 = objc_msgSend(v5, "copy");
  configurationBundles = v6->_configurationBundles;
  v6->_configurationBundles = (NSArray *)v7;

  objc_msgSend(v5, "gc_arrayByTransformingElementsWithOptions:usingBlock:", 1, &__block_literal_global_8);
  v9 = objc_claimAutoreleasedReturnValue();
  bundles = v6->_bundles;
  v6->_bundles = (NSArray *)v9;

  return v6;
}

- (_GCDeviceOnDiskDB)init
{
  return -[_GCDeviceOnDiskDB initWithBundles:](self, "initWithBundles:", MEMORY[0x1E0C9AA60]);
}

- (id)bestModelMatchingDevice:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  NSObject *v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  void *v40;
  NSArray *obj;
  void *v42;
  uint64_t v43;
  id v44;
  uint8_t v45;
  _BYTE v46[15];
  uint8_t v47;
  _BYTE v48[15];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
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
  uint8_t v65[128];
  uint8_t buf[4];
  void *v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _gc_log_devicedb();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_GCDeviceOnDiskDB bestModelMatchingDevice:].cold.7(v4, v5);

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = self->_bundles;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v62;
    v39 = *(_QWORD *)v62;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v62 != v7)
          objc_enumerationMutation(obj);
        v40 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v8);
        _gc_log_devicedb();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v67 = v40;
          _os_log_debug_impl(&dword_1DC79E000, v9, OS_LOG_TYPE_DEBUG, "  > Searching bundle '%{public}@'...", buf, 0xCu);
        }

        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        objc_msgSend(v40, "devices");
        v44 = (id)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v58;
          v43 = *(_QWORD *)v58;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v58 != v11)
                objc_enumerationMutation(v44);
              v42 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v12);
              _gc_log_devicedb();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                v67 = v42;
                _os_log_debug_impl(&dword_1DC79E000, v13, OS_LOG_TYPE_DEBUG, "    > Trying '%{public}@'...", buf, 0xCu);
              }

              objc_msgSend(v42, "ioMatchingPredicates");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = 0u;
              v56 = 0u;
              v53 = 0u;
              v54 = 0u;
              v15 = v14;
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
              if (v16)
              {
                v17 = *(_QWORD *)v54;
                while (2)
                {
                  for (i = 0; i != v16; ++i)
                  {
                    if (*(_QWORD *)v54 != v17)
                      objc_enumerationMutation(v15);
                    if ((objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "evaluateWithObject:", v4) & 1) != 0)
                    {

                      _gc_log_devicedb();
                      v24 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                        -[_GCDeviceOnDiskDB bestModelMatchingDevice:].cold.6((uint64_t)v42, v24, v25);

                      v51 = 0u;
                      v52 = 0u;
                      v49 = 0u;
                      v50 = 0u;
                      objc_msgSend(v42, "personalities");
                      v26 = objc_claimAutoreleasedReturnValue();
                      v27 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
                      if (v27)
                      {
                        v28 = *(_QWORD *)v50;
                        while (2)
                        {
                          v29 = 0;
                          do
                          {
                            if (*(_QWORD *)v50 != v28)
                              objc_enumerationMutation(v26);
                            v30 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v29);
                            _gc_log_devicedb();
                            v31 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                            {
                              *(_DWORD *)buf = 138543362;
                              v67 = v30;
                              _os_log_debug_impl(&dword_1DC79E000, v31, OS_LOG_TYPE_DEBUG, "      > Trying %{public}@...", buf, 0xCu);
                            }

                            objc_msgSend(v30, "ioMatchingPredicate");
                            v32 = (void *)objc_claimAutoreleasedReturnValue();
                            if (!v32)
                              goto LABEL_51;
                            _gc_log_devicedb();
                            v33 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
                              -[_GCDeviceOnDiskDB bestModelMatchingDevice:].cold.5(&v47, v48, v33);

                            if ((objc_msgSend(v32, "evaluateWithObject:", v4) & 1) != 0)
                            {
LABEL_51:
                              _gc_log_devicedb();
                              v35 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
                                -[_GCDeviceOnDiskDB bestModelMatchingDevice:].cold.3(v35, v36, v37);

                              objc_msgSend(v30, "model");
                              v23 = (void *)objc_claimAutoreleasedReturnValue();

                              goto LABEL_54;
                            }
                            _gc_log_devicedb();
                            v34 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                              -[_GCDeviceOnDiskDB bestModelMatchingDevice:].cold.4(&v45, v46, v34);

                            ++v29;
                          }
                          while (v27 != v29);
                          v27 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
                          if (v27)
                            continue;
                          break;
                        }
                      }

                      _gc_log_devicedb();
                      v26 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
                        -[_GCDeviceOnDiskDB bestModelMatchingDevice:].cold.2();
                      v23 = 0;
LABEL_54:

                      v20 = obj;
                      goto LABEL_56;
                    }
                  }
                  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
                  if (v16)
                    continue;
                  break;
                }
              }

              ++v12;
              v11 = v43;
            }
            while (v12 != v10);
            v10 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
            v11 = v43;
          }
          while (v10);
        }

        ++v8;
        v7 = v39;
      }
      while (v8 != v6);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
      v7 = v39;
    }
    while (v6);
  }

  _gc_log_devicedb();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (NSArray *)v19;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    -[_GCDeviceOnDiskDB bestModelMatchingDevice:].cold.1(v19, v21, v22);
    v23 = 0;
    v20 = (NSArray *)v19;
  }
  else
  {
    v23 = 0;
  }
LABEL_56:

  return v23;
}

- (NSArray)configurationBundles
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundles, 0);
  objc_storeStrong((id *)&self->_configurationBundles, 0);
}

- (void)bestModelMatchingDevice:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_2(&dword_1DC79E000, a1, a3, "  > No device definition found.", v3);
}

- (void)bestModelMatchingDevice:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2(&dword_1DC79E000, v0, v1, "📦 Found matching device definition %{public}@ in bundle '%{public}@', but did not find a compatible personality.");
  OUTLINED_FUNCTION_3_1();
}

- (void)bestModelMatchingDevice:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_2(&dword_1DC79E000, a1, a3, "      > Passed all requirements.", v3);
}

- (void)bestModelMatchingDevice:(NSObject *)a3 .cold.4(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_2(&dword_1DC79E000, a3, (uint64_t)a3, "        > Failed IO property requirements...", a1);
}

- (void)bestModelMatchingDevice:(NSObject *)a3 .cold.5(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_2(&dword_1DC79E000, a3, (uint64_t)a3, "        > Checking IO property requirements...", a1);
}

- (void)bestModelMatchingDevice:(uint64_t)a3 .cold.6(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_4_1(&dword_1DC79E000, a2, a3, "    > Matched %{public}@.  Checking personalities...", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3_1();
}

- (void)bestModelMatchingDevice:(void *)a1 .cold.7(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_4_1(&dword_1DC79E000, a2, v4, "Find model for device %@", (uint8_t *)&v5);

}

@end
