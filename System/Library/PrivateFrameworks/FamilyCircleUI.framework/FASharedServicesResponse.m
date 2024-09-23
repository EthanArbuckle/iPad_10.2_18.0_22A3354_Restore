@implementation FASharedServicesResponse

- (FASharedServicesResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  FASharedServicesResponse *v4;
  FASharedServicesResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)FASharedServicesResponse;
  v4 = -[AAResponse initWithHTTPResponse:data:bodyIsPlist:](&v19, sel_initWithHTTPResponse_data_bodyIsPlist_, a3, a4, 1);
  v5 = v4;
  if (v4)
  {
    -[AAResponse responseDictionary](v4, "responseDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("familySharedServicesGroups"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[AAResponse responseDictionary](v5, "responseDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("familySharedServices"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[AAResponse responseDictionary](v5, "responseDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("locationAllowed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      v12 = objc_msgSend(v11, "BOOLValue");
    else
      v12 = 1;
    -[FASharedServicesResponse _setLocationAllowedWithLocation:](v5, "_setLocationAllowedWithLocation:", v12);
    if (v9)
    {
      -[FASharedServicesResponse _sharedServicesWithNoGrouping:](v5, "_sharedServicesWithNoGrouping:", v9);
      if (v7)
        -[FASharedServicesResponse _initializeServicesMapWithGroups:andServices:](v5, "_initializeServicesMapWithGroups:andServices:", v7, v9);
    }
    else
    {
      -[AAResponse responseDictionary](v5, "responseDictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("status"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[AAResponse responseDictionary](v5, "responseDictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("status-message"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      _FALogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v21 = v14;
        v22 = 2112;
        v23 = v16;
        _os_log_impl(&dword_20DE41000, v17, OS_LOG_TYPE_DEFAULT, "Error: Shared services not seen in server response data with status=%@ message=%@", buf, 0x16u);
      }

    }
  }
  return v5;
}

- (void)_setLocationAllowedWithLocation:(BOOL)a3
{
  self->_locationAllowed = a3;
}

- (void)_initializeServicesMapWithGroups:(id)a3 andServices:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSArray *services;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSArray *v18;
  NSArray *serviceGroups;
  NSArray *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  NSObject *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v44 = (void *)objc_opt_new();
  if (v4)
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v42 = v4;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v46;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v46 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE30B30]), "initWithServerResponse:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v9));
          services = self->_services;
          v12 = (void *)MEMORY[0x24BDD1758];
          objc_msgSend(v10, "groupID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "predicateWithFormat:", CFSTR("SELF.groupID == %@"), v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray filteredArrayUsingPredicate:](services, "filteredArrayUsingPredicate:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "setServices:", v15);
          objc_msgSend(v44, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v7);
    }

    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("groupID"), 1);
    v49 = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v49, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "sortedArrayUsingDescriptors:", v17);
    v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
    serviceGroups = self->_serviceGroups;
    self->_serviceGroups = v18;

    v20 = self->_services;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF.groupID == %@"), &stru_24C8A3000);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray filteredArrayUsingPredicate:](v20, "filteredArrayUsingPredicate:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v22, "count"))
    {
      _FALogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[FASharedServicesResponse _initializeServicesMapWithGroups:andServices:].cold.2(v23, v24, v25, v26, v27, v28, v29, v30);

      -[NSArray firstObject](self->_serviceGroups, "firstObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "services");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "arrayByAddingObjectsFromArray:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSArray firstObject](self->_serviceGroups, "firstObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setServices:", v33);

    }
    v4 = v42;
  }
  else
  {
    _FALogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[FASharedServicesResponse _initializeServicesMapWithGroups:andServices:].cold.1(v16, v35, v36, v37, v38, v39, v40, v41);
  }

}

- (void)_sharedServicesWithNoGrouping:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *services;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    objc_msgSend(a3, "fa_map:", &__block_literal_global_20);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("order"), 1);
    v16[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject sortedArrayUsingDescriptors:](v4, "sortedArrayUsingDescriptors:", v6);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    services = self->_services;
    self->_services = v7;

  }
  else
  {
    _FALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[FASharedServicesResponse _sharedServicesWithNoGrouping:].cold.1(v4, v9, v10, v11, v12, v13, v14, v15);
  }

}

id __58__FASharedServicesResponse__sharedServicesWithNoGrouping___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BE30B28];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithDictionary:", v3);

  return v4;
}

- (NSArray)services
{
  return self->_services;
}

- (NSArray)serviceGroups
{
  return self->_serviceGroups;
}

- (BOOL)locationAllowed
{
  return self->_locationAllowed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceGroups, 0);
  objc_storeStrong((id *)&self->_services, 0);
}

- (void)_initializeServicesMapWithGroups:(uint64_t)a3 andServices:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20DE41000, a1, a3, "We are not getting services groups!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)_initializeServicesMapWithGroups:(uint64_t)a3 andServices:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20DE41000, a1, a3, "Server is sending down services without groups!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)_sharedServicesWithNoGrouping:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20DE41000, a1, a3, "We are not getting shared services!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

@end
