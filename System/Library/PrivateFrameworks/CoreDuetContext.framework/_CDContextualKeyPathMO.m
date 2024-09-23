@implementation _CDContextualKeyPathMO

+ (void)hydrateMO:(id)a3 fromKeyPath:(id)a4 andValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v10, "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setKey:", v11);

  objc_msgSend(v10, "deviceID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDeviceIDString:", v12);

  objc_msgSend(v8, "setIsUserCentric:", objc_msgSend(v10, "isUserCentric"));
  v13 = objc_msgSend(v10, "isEphemeral");

  objc_msgSend(v8, "setIsEphemeral:", v13);
  objc_msgSend(v9, "lastModifiedDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLastModifiedDate:", v14);

  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v18;
  if (v15)
  {
    objc_msgSend(v8, "setValue:", v15);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    +[_CDContextualKeyPathMO hydrateMO:fromKeyPath:andValue:].cold.1((objc_class *)a1, (uint64_t)v16);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCreationDate:", v17);

}

+ (id)materializedKeyPathFrom:(id)a3
{
  id v3;
  _CDContextualKeyPath *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _CDContextualKeyPath *v9;

  v3 = a3;
  v4 = [_CDContextualKeyPath alloc];
  objc_msgSend(v3, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "isUserCentric");
  v8 = objc_msgSend(v3, "isEphemeral");

  v9 = -[_CDContextualKeyPath initWithKey:forDeviceID:isUserCentric:isEphemeral:](v4, "initWithKey:forDeviceID:isUserCentric:isEphemeral:", v5, v6, v7, v8);
  return v9;
}

+ (id)materializedContextValueFrom:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3710];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)hydrateMO:(objc_class *)a1 fromKeyPath:(uint64_t)a2 andValue:.cold.1(objc_class *a1, uint64_t a2)
{
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  NSStringFromClass(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_18DD73000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@: Error setting mo.value: %@", (uint8_t *)&v4, 0x16u);

}

@end
