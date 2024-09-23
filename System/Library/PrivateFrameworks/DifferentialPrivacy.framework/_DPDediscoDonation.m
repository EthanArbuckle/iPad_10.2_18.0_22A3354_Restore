@implementation _DPDediscoDonation

- (_DPDediscoDonation)initWithKey:(id)a3 share1:(id)a4 share2:(id)a5 dimension:(int64_t)a6 metadata:(id)a7 serverAlgorithm:(id)a8 algorithmParameters:(id)a9
{
  id v15;
  id v16;
  id v17;
  _DPDediscoDonation *v18;
  _DPDediscoDonation *v19;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v24 = a3;
  v23 = a4;
  v22 = a5;
  v15 = a7;
  v16 = a8;
  v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)_DPDediscoDonation;
  v18 = -[_DPDediscoDonation init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_key, a3);
    objc_storeStrong((id *)&v19->_share1, a4);
    objc_storeStrong((id *)&v19->_share2, a5);
    v19->_dimension = a6;
    objc_storeStrong((id *)&v19->_metadata, a7);
    objc_storeStrong((id *)&v19->_serverAlgorithm, a8);
    objc_storeStrong((id *)&v19->_algorithmParameters, a9);
  }

  return v19;
}

+ (void)insertIfPossibleObj:(id)a3 intoJSONDictionary:(id)a4 withKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0CB36D8];
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_msgSend(v10, "isValidJSONObject:", v11);

  if ((v10 & 1) != 0)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);
  }
  else
  {
    +[_DPLog service](_DPLog, "service");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[_DPDediscoDonation insertIfPossibleObj:intoJSONDictionary:withKey:].cold.1((uint64_t)v9, (uint64_t)v7, v12);

  }
}

- (id)jsonRepresentationFromParameters:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[_DPDediscoDonation convertToHexString:](self, "convertToHexString:", v12);
          v13 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v13;
        }
        objc_msgSend((id)objc_opt_class(), "insertIfPossibleObj:intoJSONDictionary:withKey:", v12, v5, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)jsonRepresentationForMetadata
{
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[_DPDediscoDonation metadata](self, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v20;
    *(_QWORD *)&v6 = 138412546;
    v18 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
        -[_DPDediscoDonation metadata](self, "metadata", v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "isEqualToString:", CFSTR("VDAF")))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[_DPDediscoDonation jsonRepresentationFromParameters:](self, "jsonRepresentationFromParameters:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("VDAF"));

          }
          else
          {
            +[_DPLog service](_DPLog, "service");
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              v15 = (void *)objc_opt_class();
              *(_DWORD *)buf = v18;
              v24 = v10;
              v25 = 2112;
              v26 = v15;
              v16 = v15;
              _os_log_error_impl(&dword_1D3FAA000, v14, OS_LOG_TYPE_ERROR, "Skipping field (%@) expected NSDictionary value, got %@.", buf, 0x16u);

            }
          }
        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "insertIfPossibleObj:intoJSONDictionary:withKey:", v12, v3, v10);
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)toDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[6];
  _QWORD v17[7];

  v17[6] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E08];
  v16[0] = CFSTR("key");
  -[_DPDediscoDonation key](self, "key");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v15;
  v16[1] = CFSTR("share1");
  -[_DPDediscoDonation share1](self, "share1");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPDediscoDonation convertToHexString:](self, "convertToHexString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v5;
  v16[2] = CFSTR("share2");
  -[_DPDediscoDonation share2](self, "share2");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPDediscoDonation convertToHexString:](self, "convertToHexString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v7;
  v16[3] = CFSTR("dimension");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[_DPDediscoDonation dimension](self, "dimension"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v8;
  v16[4] = CFSTR("serverAlgorithm");
  -[_DPDediscoDonation serverAlgorithm](self, "serverAlgorithm");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v9;
  v16[5] = CFSTR("algorithmParameters");
  -[_DPDediscoDonation algorithmParameters](self, "algorithmParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_DPDediscoDonation jsonRepresentationForMetadata](self, "jsonRepresentationForMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("metadata"));

  return v12;
}

+ (id)requiredClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
}

- (id)convertToHexString:(id)a3
{
  id v3;
  uint64_t v4;
  unsigned __int8 *v5;
  uint64_t v6;
  void *v7;
  void *i;
  unsigned int v9;
  void *v10;

  v3 = objc_retainAutorelease(a3);
  v4 = objc_msgSend(v3, "bytes");
  if (v4)
  {
    v5 = (unsigned __int8 *)v4;
    v6 = objc_msgSend(v3, "length");
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 2 * v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = (void *)MEMORY[0x1D8256B78](); v6; --v6)
    {
      v9 = *v5++;
      objc_msgSend(v7, "appendFormat:", CFSTR("%02X"), v9);
    }
    objc_autoreleasePoolPop(i);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DPDediscoDonation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _DPDediscoDonation *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("share1"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("share2"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("dimension"));
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("metadata"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverAlgorithm"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("algorithmParameters"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[_DPDediscoDonation initWithKey:share1:share2:dimension:metadata:serverAlgorithm:algorithmParameters:](self, "initWithKey:share1:share2:dimension:metadata:serverAlgorithm:algorithmParameters:", v5, v6, v7, v8, v9, v10, v11);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[_DPDediscoDonation key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("key"));

  -[_DPDediscoDonation share1](self, "share1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("share1"));

  -[_DPDediscoDonation share2](self, "share2");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("share2"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[_DPDediscoDonation dimension](self, "dimension"), CFSTR("dimension"));
  -[_DPDediscoDonation metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("metadata"));

  -[_DPDediscoDonation serverAlgorithm](self, "serverAlgorithm");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("serverAlgorithm"));

  -[_DPDediscoDonation algorithmParameters](self, "algorithmParameters");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("algorithmParameters"));

}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)share1
{
  return self->_share1;
}

- (void)setShare1:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)share2
{
  return self->_share2;
}

- (void)setShare2:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)dimension
{
  return self->_dimension;
}

- (void)setDimension:(int64_t)a3
{
  self->_dimension = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)serverAlgorithm
{
  return self->_serverAlgorithm;
}

- (void)setServerAlgorithm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)algorithmParameters
{
  return self->_algorithmParameters;
}

- (void)setAlgorithmParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_algorithmParameters, 0);
  objc_storeStrong((id *)&self->_serverAlgorithm, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_share2, 0);
  objc_storeStrong((id *)&self->_share1, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

+ (void)insertIfPossibleObj:(uint64_t)a1 intoJSONDictionary:(uint64_t)a2 withKey:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 138412546;
  v6 = a1;
  v7 = 2112;
  v8 = (id)objc_opt_class();
  v4 = v8;
  _os_log_error_impl(&dword_1D3FAA000, a3, OS_LOG_TYPE_ERROR, "Skipping field =(%@) as it cannot be serialized into JSON, type=%@.", (uint8_t *)&v5, 0x16u);

}

@end
