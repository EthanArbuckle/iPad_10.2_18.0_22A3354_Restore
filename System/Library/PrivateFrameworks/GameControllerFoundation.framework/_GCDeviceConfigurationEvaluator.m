@implementation _GCDeviceConfigurationEvaluator

- (unint64_t)viableConfigurations:(id *)a3 deviceOwners:(id *)a4
{
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  int v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v64;
  id v65;
  unint64_t v66;
  uint64_t v71;
  uint64_t v72;
  id obj;
  id v74;
  _GCDeviceConfigurationEvaluator *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  _QWORD v79[4];
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint8_t buf[4];
  void *v98;
  __int16 v99;
  void *v100;
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  -[_GCDeviceConfigurationEvaluator configurationsIN](self, "configurationsIN");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = self;
  -[_GCDeviceConfigurationEvaluator physicalDevicesIN](self, "physicalDevicesIN");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  _gc_log_device_configuration();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_GCDeviceConfigurationEvaluator viableConfigurations:deviceOwners:].cold.8();

  _gc_log_device_configuration();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[_GCDeviceConfigurationEvaluator viableConfigurations:deviceOwners:].cold.7(v78, v8);

  v74 = (id)objc_msgSend(objc_alloc((Class)&off_1F03A71F0), "initWithCapacity:", objc_msgSend(v6, "count"));
  _gc_log_device_configuration();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[_GCDeviceConfigurationEvaluator viableConfigurations:deviceOwners:].cold.6();

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
  if (v10)
  {
    v11 = v10;
    v76 = *(_QWORD *)v94;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v94 != v76)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
        -[_GCDeviceConfigurationEvaluator deviceManagersIN](v75, "deviceManagersIN");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "deviceBuilderIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v13, "deviceDependencies");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03A7460), "initWithCapacity:", objc_msgSend(v17, "count"));
          v89 = 0u;
          v90 = 0u;
          v91 = 0u;
          v92 = 0u;
          v19 = v17;
          v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v89, v103, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v90;
LABEL_15:
            v23 = 0;
            while (1)
            {
              if (*(_QWORD *)v90 != v22)
                objc_enumerationMutation(v19);
              objc_msgSend(v78, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * v23));
              v24 = objc_claimAutoreleasedReturnValue();
              if (!v24)
                break;
              v25 = (void *)v24;
              objc_msgSend(v18, "addObject:", v24);

              if (v21 == ++v23)
              {
                v21 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v89, v103, 16);
                if (v21)
                  goto LABEL_15;
                break;
              }
            }
          }

          v26 = -[NSObject count](v19, "count");
          if (v26 == objc_msgSend(v18, "count"))
          {
            objc_msgSend(v74, "addObject:", v13);
          }
          else
          {
            _gc_log_device_configuration();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v98 = v13;
              _os_log_debug_impl(&dword_1DC79E000, v27, OS_LOG_TYPE_DEBUG, "Eliminating configuration because a dependency is missing: %@", buf, 0xCu);
            }

          }
        }
        else
        {
          _gc_log_device_configuration();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v98 = v13;
            _os_log_debug_impl(&dword_1DC79E000, v19, OS_LOG_TYPE_DEBUG, "Eliminating configuration because its manager is not registered: %@", buf, 0xCu);
          }
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
    }
    while (v11);
  }

  objc_msgSend(v74, "sortUsingComparator:", &__block_literal_global_0);
  _gc_log_device_configuration();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    -[_GCDeviceConfigurationEvaluator viableConfigurations:deviceOwners:].cold.5();

  v29 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03AA5A0), "initWithCapacity:", objc_msgSend(v74, "count"));
  _gc_log_device_configuration();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    -[_GCDeviceConfigurationEvaluator viableConfigurations:deviceOwners:].cold.4();

  v31 = objc_msgSend(v74, "count");
  if (!v31)
    goto LABEL_73;
  do
  {
    v71 = v31;
    objc_msgSend(v29, "removeAllObjects");
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    objc_msgSend(v78, "allKeys");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v85, v102, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v86;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v86 != v35)
            objc_enumerationMutation(v32);
          v37 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * j);
          +[NSNull null](&off_1F03A9C88, "null");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:forKey:", v38, v37);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v85, v102, 16);
      }
      while (v34);
    }

    v39 = v74;
    if (!objc_msgSend(v74, "count"))
      goto LABEL_72;
    v40 = 0;
    while (1)
    {
      objc_msgSend(v39, "objectAtIndexedSubscript:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v77 = v41;
      objc_msgSend(v41, "deviceDependencies");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v81, v101, 16);
      if (v43)
      {
        v44 = v43;
        v72 = v40;
        v45 = *(_QWORD *)v82;
        while (2)
        {
          for (k = 0; k != v44; ++k)
          {
            if (*(_QWORD *)v82 != v45)
              objc_enumerationMutation(v42);
            v47 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * k);
            objc_msgSend(v29, "objectForKey:", v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            +[NSNull null](&off_1F03A9C88, "null");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v48, "isEqual:", v49);

            if ((v50 & 1) == 0)
            {
              _gc_log_device_configuration();
              v52 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v98 = v47;
                v99 = 2112;
                v100 = v77;
                _os_log_debug_impl(&dword_1DC79E000, v52, OS_LOG_TYPE_DEBUG, "Eliminating configuration because device dependency with identifier '%@' has already been claimed: %@", buf, 0x16u);
              }

              v51 = 0;
              goto LABEL_57;
            }
            objc_msgSend(v29, "setObject:forKey:", v77, v47);
          }
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v81, v101, 16);
          if (v44)
            continue;
          break;
        }
        v51 = 1;
LABEL_57:
        v40 = v72;
      }
      else
      {
        v51 = 1;
      }

      -[_GCDeviceConfigurationEvaluator deviceManagersIN](v75, "deviceManagersIN");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "deviceBuilderIdentifier");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "objectForKey:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        if (!v51)
          goto LABEL_71;
      }
      else
      {
        unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, v75, CFSTR("_GCDeviceConfigurationEvaluator.m"), 128, CFSTR("Bug in %s"), "-[_GCDeviceConfigurationEvaluator viableConfigurations:deviceOwners:]");

        if (!v51)
          goto LABEL_71;
      }
      v39 = v74;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        break;
LABEL_64:

      if (++v40 >= (unint64_t)objc_msgSend(v74, "count"))
        goto LABEL_72;
    }
    objc_msgSend(v77, "deviceDependencies");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSNull null](&off_1F03A9C88, "null");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "objectsForKeys:notFoundMarker:", v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    +[NSSet setWithArray:](&off_1F03A7348, "setWithArray:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v57) = objc_msgSend(v55, "canMakeDeviceWithConfiguration:dependencies:", v77, v59);

    if ((_DWORD)v57)
    {

      goto LABEL_64;
    }
    _gc_log_device_configuration();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v98 = v77;
      _os_log_debug_impl(&dword_1DC79E000, v61, OS_LOG_TYPE_DEBUG, "Eliminating configuration because its manager can not make the device: %@", buf, 0xCu);
    }

LABEL_71:
    objc_msgSend(v74, "removeObjectAtIndex:", v40);

LABEL_72:
    v31 = v71 - 1;
  }
  while (v71 != 1);
LABEL_73:
  _gc_log_device_configuration();
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
    -[_GCDeviceConfigurationEvaluator viableConfigurations:deviceOwners:].cold.3();

  _gc_log_device_configuration();
  v63 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
    -[_GCDeviceConfigurationEvaluator viableConfigurations:deviceOwners:].cold.2(v74, v63);

  objc_msgSend(v74, "enumerateObjectsUsingBlock:", &__block_literal_global_11);
  _gc_log_device_configuration();
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
    -[_GCDeviceConfigurationEvaluator viableConfigurations:deviceOwners:].cold.1();

  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = __69___GCDeviceConfigurationEvaluator_viableConfigurations_deviceOwners___block_invoke_12;
  v79[3] = &unk_1EA4D2CD8;
  v80 = v78;
  v65 = v78;
  objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v79);
  if (a3)
    *a3 = objc_retainAutorelease(v74);
  if (a4)
    *a4 = objc_retainAutorelease(v29);
  v66 = objc_msgSend(v74, "count");

  return v66;
}

- (void)evaluate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DC79E000, v0, v1, "+++ <Evaluate viable configurations> +++", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (NSSet)configurationsIN
{
  return self->_configurationsIN;
}

- (void)setConfigurationsIN:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)deviceManagersIN
{
  return self->_deviceManagersIN;
}

- (void)setDeviceManagersIN:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)physicalDevicesIN
{
  return self->_physicalDevicesIN;
}

- (void)setPhysicalDevicesIN:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSSet)viableConfigurationsOUT
{
  return self->_viableConfigurationsOUT;
}

- (NSDictionary)deviceOwnersOUT
{
  return self->_deviceOwnersOUT;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceOwnersOUT, 0);
  objc_storeStrong((id *)&self->_viableConfigurationsOUT, 0);
  objc_storeStrong((id *)&self->_physicalDevicesIN, 0);
  objc_storeStrong((id *)&self->_deviceManagersIN, 0);
  objc_storeStrong((id *)&self->_configurationsIN, 0);
}

- (void)viableConfigurations:deviceOwners:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DC79E000, v0, v1, "Devices:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)viableConfigurations:(void *)a1 deviceOwners:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1DC79E000, a2, v3, "Viable Configurations (%llu):", v4);
  OUTLINED_FUNCTION_6();
}

- (void)viableConfigurations:deviceOwners:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DC79E000, v0, v1, "> Results", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)viableConfigurations:deviceOwners:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DC79E000, v0, v1, "> Step (2)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)viableConfigurations:deviceOwners:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1DC79E000, v0, v1, "Viable Configurations: %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)viableConfigurations:deviceOwners:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DC79E000, v0, v1, "> Step (1)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)viableConfigurations:(void *)a1 deviceOwners:(NSObject *)a2 .cold.7(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1DC79E000, a2, v4, "Devices: %@", v5);

  OUTLINED_FUNCTION_6();
}

- (void)viableConfigurations:deviceOwners:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1DC79E000, v0, v1, "Registered Configurations: %@", v2);
  OUTLINED_FUNCTION_5();
}

@end
