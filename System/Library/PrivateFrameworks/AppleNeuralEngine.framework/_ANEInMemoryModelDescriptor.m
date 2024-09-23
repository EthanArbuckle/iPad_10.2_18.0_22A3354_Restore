@implementation _ANEInMemoryModelDescriptor

+ (_ANEInMemoryModelDescriptor)new
{
  return 0;
}

- (_ANEInMemoryModelDescriptor)init
{

  return 0;
}

- (_ANEInMemoryModelDescriptor)initWithNetworkText:(id)a3 weights:(id)a4 optionsPlist:(id)a5 isMILModel:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  NSData *v14;
  NSData *networkText;
  NSString *v16;
  NSString *networkTextHash;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  NSString *v30;
  NSString *weightsHash;
  NSData *v32;
  NSData *optionsPlist;
  NSString *v34;
  NSString *optionsPlistHash;
  _ANEInMemoryModelDescriptor *v36;
  NSObject *v37;
  NSObject *v38;
  void *v40;
  const char *v41;
  BOOL v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  uint8_t v50[128];
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (v11 && v12)
  {
    v49.receiver = self;
    v49.super_class = (Class)_ANEInMemoryModelDescriptor;
    self = -[_ANEInMemoryModelDescriptor init](&v49, sel_init);
    if (self)
    {
      v41 = a2;
      v42 = a6;
      v43 = v13;
      v44 = v11;
      v14 = (NSData *)objc_msgSend(v11, "copy");
      networkText = self->_networkText;
      self->_networkText = v14;

      +[_ANEHashEncoding hexStringForData:](_ANEHashEncoding, "hexStringForData:", self->_networkText);
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      networkTextHash = self->_networkTextHash;
      self->_networkTextHash = v16;

      objc_storeStrong((id *)&self->_weights, a4);
      v18 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      objc_msgSend(v12, "allKeys");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sortedArrayUsingComparator:", &__block_literal_global_7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v21 = v20;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v46;
        while (2)
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v46 != v24)
              objc_enumerationMutation(v21);
            v26 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
            objc_msgSend(v12, "objectForKeyedSubscript:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v27, "count"))
            {
              +[_ANELog framework](_ANELog, "framework");
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                -[_ANEInMemoryModelDescriptor initWithNetworkText:weights:optionsPlist:isMILModel:].cold.1(v41, v26, v38);

              v36 = 0;
              v13 = v43;
              v11 = v44;
              goto LABEL_20;
            }
            objc_msgSend(v27, "allValues");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "firstObject");
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v18, "addObject:", v29);
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
          if (v23)
            continue;
          break;
        }
      }

      +[_ANEHashEncoding hexStringForDataArray:](_ANEHashEncoding, "hexStringForDataArray:", v18);
      v30 = (NSString *)objc_claimAutoreleasedReturnValue();
      weightsHash = self->_weightsHash;
      self->_weightsHash = v30;

      v13 = v43;
      v32 = (NSData *)objc_msgSend(v43, "copy");
      optionsPlist = self->_optionsPlist;
      self->_optionsPlist = v32;

      +[_ANEHashEncoding hexStringForData:](_ANEHashEncoding, "hexStringForData:", self->_optionsPlist);
      v34 = (NSString *)objc_claimAutoreleasedReturnValue();
      optionsPlistHash = self->_optionsPlistHash;
      self->_optionsPlistHash = v34;

      self->_isMILModel = v42;
      v11 = v44;
    }
    self = self;
    v36 = self;
  }
  else
  {
    +[_ANELog framework](_ANELog, "framework");
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v52 = v40;
      v53 = 2112;
      v54 = v11;
      v55 = 2112;
      v56 = v12;
      v57 = 2112;
      v58 = v13;
      _os_log_error_impl(&dword_1D3352000, v37, OS_LOG_TYPE_ERROR, "%@: Invalid arguments. networkText=%@ : weights=%@ : optionsPlist=%@", buf, 0x2Au);

    }
    v36 = 0;
  }
LABEL_20:

  return v36;
}

+ (id)modelWithNetworkDescription:(id)a3 weights:(id)a4 optionsPlist:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNetworkText:weights:optionsPlist:isMILModel:", v10, v9, v8, 0);

  return v11;
}

+ (id)modelWithMILText:(id)a3 weights:(id)a4 optionsPlist:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNetworkText:weights:optionsPlist:isMILModel:", v10, v9, v8, 1);

  return v11;
}

- (id)hexStringIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_ANEInMemoryModelDescriptor networkTextHash](self, "networkTextHash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANEInMemoryModelDescriptor weightsHash](self, "weightsHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANEInMemoryModelDescriptor optionsPlistHash](self, "optionsPlistHash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@_%@_%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqualToInMemoryModelDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  if (!a3)
    return 0;
  v4 = a3;
  -[_ANEInMemoryModelDescriptor networkTextHash](self, "networkTextHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "networkTextHash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  -[_ANEInMemoryModelDescriptor weightsHash](self, "weightsHash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "weightsHash");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  -[_ANEInMemoryModelDescriptor optionsPlistHash](self, "optionsPlistHash");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "optionsPlistHash");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v11, "isEqual:", v12);
  return v7 & v10 & v4;
}

- (BOOL)isEqual:(id)a3
{
  _ANEInMemoryModelDescriptor *v4;
  _ANEInMemoryModelDescriptor *v5;
  BOOL v6;

  v4 = (_ANEInMemoryModelDescriptor *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[_ANEInMemoryModelDescriptor isEqualToInMemoryModelDescriptor:](self, "isEqualToInMemoryModelDescriptor:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[_ANEInMemoryModelDescriptor networkTextHash](self, "networkTextHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[_ANEInMemoryModelDescriptor weightsHash](self, "weightsHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[_ANEInMemoryModelDescriptor optionsPlistHash](self, "optionsPlistHash");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (NSString)networkTextHash
{
  return self->_networkTextHash;
}

- (NSString)weightsHash
{
  return self->_weightsHash;
}

- (NSString)optionsPlistHash
{
  return self->_optionsPlistHash;
}

- (NSData)networkText
{
  return self->_networkText;
}

- (NSDictionary)weights
{
  return self->_weights;
}

- (NSData)optionsPlist
{
  return self->_optionsPlist;
}

- (BOOL)isMILModel
{
  return self->_isMILModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsPlist, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_networkText, 0);
  objc_storeStrong((id *)&self->_optionsPlistHash, 0);
  objc_storeStrong((id *)&self->_weightsHash, 0);
  objc_storeStrong((id *)&self->_networkTextHash, 0);
}

- (void)initWithNetworkText:(NSObject *)a3 weights:optionsPlist:isMILModel:.cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1D3352000, a3, OS_LOG_TYPE_ERROR, "%@: Empty weights dictionary for index=%@", (uint8_t *)&v6, 0x16u);

}

@end
