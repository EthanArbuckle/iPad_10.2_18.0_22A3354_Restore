@implementation ASDDSPGraphInfo

- (ASDDSPGraphInfo)initWithDictionary:(id)a3 resourcePath:(id)a4
{
  id v6;
  id v7;
  ASDDSPGraphInfo *v8;
  void *v9;
  uint64_t v10;
  NSString *path;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v43;
  id obj;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  objc_super v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v54.receiver = self;
  v54.super_class = (Class)ASDDSPGraphInfo;
  v8 = -[ASDDSPGraphInfo init](&v54, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Path"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "stringByAppendingPathComponent:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      path = v8->_path;
      v8->_path = (NSString *)v10;

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Text"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v8->_text, v12);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("IncludePaths"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    obj = v13;
    v45 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v51;
        while (2)
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v51 != v17)
              objc_enumerationMutation(v14);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
              v13 = obj;
              v12 = v45;
              if (v19)
                -[ASDDSPGraphInfo initWithDictionary:resourcePath:].cold.2(v19, v20, v21, v22, v23, v24, v25, v26);
              goto LABEL_18;
            }
            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
          if (v16)
            continue;
          break;
        }
      }

      v13 = obj;
      objc_storeStrong((id *)&v8->_includePaths, obj);
      v12 = v45;
    }
LABEL_18:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Substitutions"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = v9;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v28 = v27;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v47;
        while (2)
        {
          v32 = v7;
          v33 = 0;
          do
          {
            if (*(_QWORD *)v47 != v31)
              objc_enumerationMutation(v28);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v34 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
              v7 = v32;
              v9 = v43;
              v13 = obj;
              v12 = v45;
              if (v34)
                -[ASDDSPGraphInfo initWithDictionary:resourcePath:].cold.1(v34, v35, v36, v37, v38, v39, v40, v41);
              goto LABEL_30;
            }
            ++v33;
          }
          while (v30 != v33);
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
          v7 = v32;
          if (v30)
            continue;
          break;
        }
      }

      objc_storeStrong((id *)&v8->_substitutions, v27);
      v9 = v43;
      v13 = obj;
      v12 = v45;
    }
LABEL_30:

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ASDDSPGraphInfo *v8;
  ASDDSPGraphInfo *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  int v40;

  v8 = (ASDDSPGraphInfo *)a3;
  if (self == v8)
  {
    v11 = 1;
    goto LABEL_48;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = 0;
    goto LABEL_48;
  }
  v9 = v8;
  -[ASDDSPGraphInfo path](self, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 || (-[ASDDSPGraphInfo path](v9, "path"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[ASDDSPGraphInfo path](self, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDDSPGraphInfo path](v9, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {

      v11 = 0;
      goto LABEL_45;
    }
    v40 = 1;
  }
  else
  {
    v40 = 0;
  }
  -[ASDDSPGraphInfo text](self, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[ASDDSPGraphInfo text](v9, "text");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v39)
    {
      v39 = 0;
      v38 = 0;
      goto LABEL_21;
    }
  }
  v13 = v3;
  -[ASDDSPGraphInfo text](self, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDDSPGraphInfo text](v9, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqual:", v15) & 1) != 0)
  {
    v33 = v14;
    v38 = 1;
    v3 = v13;
    v6 = v15;
LABEL_21:
    -[ASDDSPGraphInfo includePaths](self, "includePaths");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16
      || (-[ASDDSPGraphInfo includePaths](v9, "includePaths"), (v29 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v36 = v10;
      v17 = v12;
      v18 = v5;
      v19 = v4;
      v20 = v6;
      -[ASDDSPGraphInfo includePaths](self, "includePaths");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDDSPGraphInfo includePaths](v9, "includePaths");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v21;
      if (!objc_msgSend(v21, "isEqual:"))
      {
        v11 = 0;
        v6 = v20;
        v4 = v19;
        v5 = v18;
        v12 = v17;
        v10 = v36;
LABEL_36:

LABEL_37:
        if (!v16)

        if (v38)
        {

        }
        if (!v12)

        if (!v40)
          goto LABEL_45;
        goto LABEL_44;
      }
      v32 = v16;
      v31 = 1;
      v6 = v20;
      v4 = v19;
      v5 = v18;
      v12 = v17;
      v10 = v36;
    }
    else
    {
      v32 = 0;
      v29 = 0;
      v31 = 0;
    }
    -[ASDDSPGraphInfo substitutions](self, "substitutions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22
      || (-[ASDDSPGraphInfo substitutions](v9, "substitutions"), (v27 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v30 = v6;
      v37 = v3;
      -[ASDDSPGraphInfo substitutions](self, "substitutions", v27, v29);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDDSPGraphInfo substitutions](v9, "substitutions");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v23, "isEqual:", v24);

      if (v22)
      {

        v6 = v30;
        if (!v31)
        {
          v3 = v37;
          v16 = v32;
          goto LABEL_37;
        }
        v3 = v37;
        v16 = v32;
        goto LABEL_36;
      }
      v3 = v37;
      v6 = v30;
      v25 = v28;
    }
    else
    {
      v25 = 0;
      v11 = 1;
    }

    v16 = v32;
    if ((v31 & 1) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }

  if (v12)
  else

  v11 = 0;
  v3 = v13;
  if ((v40 & 1) != 0)
  {
LABEL_44:

  }
LABEL_45:
  if (!v10)

LABEL_48:
  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[ASDDSPGraphInfo path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[ASDDSPGraphInfo text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[ASDDSPGraphInfo includePaths](self, "includePaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[ASDDSPGraphInfo substitutions](self, "substitutions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)includePaths
{
  return self->_includePaths;
}

- (void)setIncludePaths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)substitutions
{
  return self->_substitutions;
}

- (void)setSubstitutions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_substitutions, 0);
  objc_storeStrong((id *)&self->_includePaths, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)initWithDictionary:(uint64_t)a3 resourcePath:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_219C60000, MEMORY[0x24BDACB70], a3, "Substitutions parse failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

- (void)initWithDictionary:(uint64_t)a3 resourcePath:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_219C60000, MEMORY[0x24BDACB70], a3, "IncludePaths parse failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

@end
