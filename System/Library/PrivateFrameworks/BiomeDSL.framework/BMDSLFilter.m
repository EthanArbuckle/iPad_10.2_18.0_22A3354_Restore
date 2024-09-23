@implementation BMDSLFilter

uint64_t __38__BMDSLFilter_BPSPubSub__bpsPublisher__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _BOOL4 v15;
  uint64_t v16;
  BOOL v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "comparison");
  if (v4 < 0xB)
  {
    objc_msgSend(*(id *)(a1 + 32), "keyPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    BMDSLValueForKeyPath(v3, v7);
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "value");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      switch(v4)
      {
        case 0uLL:
          v23 = -[NSObject isEqual:](v5, "isEqual:", v8);
          goto LABEL_34;
        case 1uLL:
          v24 = objc_opt_class();
          BMDSLFilterCast(v9, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v25;
          if (v25)
          {
            if (objc_msgSend(v25, "BOOLValue"))
              v15 = v5 == 0;
            else
              v15 = v5 != 0;
          }
          else
          {
            v15 = 0;
          }

          goto LABEL_45;
        case 2uLL:
          if (!BMDSLFilterCheckResponds(v5, sel_containsObject_))
            goto LABEL_29;
          v27 = v5;
          v28 = v9;
          goto LABEL_33;
        case 3uLL:
          v15 = 0;
          if (!BMDSLFilterCheckResponds(v8, sel_containsObject_) || !v5)
            goto LABEL_45;
          v27 = v9;
          v28 = v5;
LABEL_33:
          v23 = -[NSObject containsObject:](v27, "containsObject:", v28);
LABEL_34:
          v15 = v23;
          goto LABEL_45;
        case 4uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
          v10 = objc_opt_class();
          BMDSLFilterCast(v5, v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_opt_class();
          BMDSLFilterCast(v9, v12);
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = (void *)v13;
          v15 = 0;
          if (!v11 || !v13)
            goto LABEL_44;
          v16 = objc_msgSend(v11, "compare:", v13);
          switch(v16)
          {
            case 1:
              v17 = (v4 & 0xFFFFFFFFFFFFFFFELL) == 6;
              break;
            case 0:
              v15 = v4 - 5 < 2;
              goto LABEL_44;
            case -1:
              v17 = (v4 & 0xFFFFFFFFFFFFFFFELL) == 4;
              break;
            default:
              goto LABEL_35;
          }
          v15 = v17;
          goto LABEL_44;
        case 8uLL:
        case 9uLL:
        case 0xAuLL:
          v19 = objc_opt_class();
          BMDSLFilterCast(v5, v19);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_opt_class();
          BMDSLFilterCast(v9, v20);
          v21 = objc_claimAutoreleasedReturnValue();
          v14 = (void *)v21;
          v15 = 0;
          if (!v11 || !v21)
            goto LABEL_44;
          switch(v4)
          {
            case 0xAuLL:
              v22 = -[NSObject hasSuffix:](v5, "hasSuffix:", v21);
              break;
            case 9uLL:
              v22 = -[NSObject hasPrefix:](v5, "hasPrefix:", v21);
              break;
            case 8uLL:
              v22 = -[NSObject containsString:](v5, "containsString:", v9);
              break;
            default:
LABEL_35:
              v15 = 0;
              goto LABEL_44;
          }
          v15 = v22;
LABEL_44:

LABEL_45:
          v6 = v15 ^ objc_msgSend(*(id *)(a1 + 32), "negation");
          break;
        default:
LABEL_29:
          v15 = 0;
          goto LABEL_45;
      }
    }
    else
    {
      __biome_log_for_category();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __38__BMDSLFilter_BPSPubSub__bpsPublisher__block_invoke_cold_2(v18);

      v6 = 0;
    }

  }
  else
  {
    __biome_log_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __38__BMDSLFilter_BPSPubSub__bpsPublisher__block_invoke_cold_1(v4, v5);
    v6 = 0;
  }

  return v6;
}

- (id)bpsPublisher
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];

  -[BMDSLFilter upstream](self, "upstream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bpsPublisher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0D02450]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__BMDSLFilter_BPSPubSub__bpsPublisher__block_invoke;
  v8[3] = &unk_1E5E363F8;
  v8[4] = self;
  v6 = (void *)objc_msgSend(v5, "initWithUpstream:isIncluded:", v4, v8);

  return v6;
}

- (NSSecureCoding)value
{
  return self->_value;
}

- (BMDSL)upstream
{
  return self->_upstream;
}

- (BOOL)negation
{
  return self->_negation;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (int64_t)comparison
{
  return self->_comparison;
}

+ (id)name
{
  return CFSTR("filter");
}

- (BMDSLFilter)initWithUpstream:(id)a3 keyPath:(id)a4 comparison:(int64_t)a5 negation:(BOOL)a6 value:(id)a7 name:(id)a8 version:(unsigned int)a9
{
  id v16;
  id v17;
  id v18;
  BMDSLFilter *v19;
  BMDSLFilter *v20;
  uint64_t v21;
  NSString *keyPath;
  BMDSLFilter *v23;
  NSObject *v24;
  objc_super v26;

  v16 = a3;
  v17 = a4;
  v18 = a7;
  if (a9 == 1)
  {
    v26.receiver = self;
    v26.super_class = (Class)BMDSLFilter;
    v19 = -[BMDSLBaseCodable initWithName:version:](&v26, sel_initWithName_version_, a8, 1);
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_upstream, a3);
      v21 = objc_msgSend(v17, "copy");
      keyPath = v20->_keyPath;
      v20->_keyPath = (NSString *)v21;

      v20->_comparison = a5;
      v20->_negation = a6;
      objc_storeStrong((id *)&v20->_value, a7);
    }
    self = v20;
    v23 = self;
  }
  else
  {
    __biome_log_for_category();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[BMDSLFilter initWithUpstream:keyPath:comparison:negation:value:name:version:].cold.1(a9, v24);

    v23 = 0;
  }

  return v23;
}

- (BMDSLFilter)initWithUpstream:(id)a3 keyPath:(id)a4 value:(id)a5
{
  return -[BMDSLFilter initWithUpstream:keyPath:comparison:negation:value:](self, "initWithUpstream:keyPath:comparison:negation:value:", a3, a4, 0, 0, a5);
}

- (BMDSLFilter)initWithUpstream:(id)a3 keyPath:(id)a4 comparison:(int64_t)a5 negation:(BOOL)a6 value:(id)a7
{
  uint64_t v8;

  LODWORD(v8) = 1;
  return -[BMDSLFilter initWithUpstream:keyPath:comparison:negation:value:name:version:](self, "initWithUpstream:keyPath:comparison:negation:value:name:version:", a3, a4, a5, a6, a7, CFSTR("filter"), v8);
}

- (BMDSLFilter)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BMDSL *v8;
  id v9;
  void *v10;
  BMDSLFilter *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("upstream"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v8 = -[BMDSLBaseCodable initWithDictionary:error:]([BMDSL alloc], "initWithDictionary:error:", v7, &v29);
  v9 = v29;
  if (!v9)
  {
    v36[0] = CFSTR("keyPath");
    v37[0] = objc_opt_class();
    v36[1] = CFSTR("value");
    v37[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    BMDSLValidateDictionary(CFSTR("filter"), 1, v6, v10);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("keyPath"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("comparison"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v26 = objc_msgSend(v12, "integerValue");
          if (v26 < 0xB)
            goto LABEL_15;
          v24 = (void *)MEMORY[0x1E0CB35C8];
          v13 = *MEMORY[0x1E0CB28A8];
          v34 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BMDSLFilter error, unknown comparison %@ in dictionary %@"), v12, v6);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v14;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "errorWithDomain:code:userInfo:", v13, 4866, v15);
          v9 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v27 = (void *)MEMORY[0x1E0CB35C8];
          v16 = *MEMORY[0x1E0CB28A8];
          v32 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BMDSLFilter error, invalid comparison type %@ (must be number) in dictionary %@"), v12, v6);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v14;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "errorWithDomain:code:userInfo:", v16, 4866, v15);
          v9 = (id)objc_claimAutoreleasedReturnValue();
          v26 = 0;
        }

        if (v9)
        {
          if (a4)
          {
            v9 = objc_retainAutorelease(v9);
            v11 = 0;
            *a4 = v9;
          }
          else
          {
            v11 = 0;
          }
          goto LABEL_24;
        }
      }
      else
      {
        v26 = 0;
      }
LABEL_15:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("negation"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18 = objc_msgSend(v17, "BOOLValue");
LABEL_22:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("value"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          self = -[BMDSLFilter initWithUpstream:keyPath:comparison:negation:value:](self, "initWithUpstream:keyPath:comparison:negation:value:", v8, v28, v26, v18, v22);

          v9 = 0;
          v11 = self;
LABEL_23:

LABEL_24:
          goto LABEL_25;
        }
        v25 = (void *)MEMORY[0x1E0CB35C8];
        v19 = *MEMORY[0x1E0CB28A8];
        v30 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BMDSLFilter error, invalid negation type %@ (must be number) in dictionary %@"), v12, v6);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "errorWithDomain:code:userInfo:", v19, 4866, v21);
        v9 = (id)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          if (a4)
          {
            v9 = objc_retainAutorelease(v9);
            v11 = 0;
            *a4 = v9;
          }
          else
          {
            v11 = 0;
          }
          goto LABEL_23;
        }
      }
      v18 = 0;
      goto LABEL_22;
    }
  }
  if (a4)
  {
    v9 = objc_retainAutorelease(v9);
    v11 = 0;
    *a4 = v9;
  }
  else
  {
    v11 = 0;
  }
LABEL_25:

  return v11;
}

- (id)upstreams
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BMDSLFilter upstream](self, "upstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BMDSLFilter;
  v4 = a3;
  -[BMDSLBaseCodable encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[BMDSLFilter upstream](self, "upstream", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("upstream"));

  -[BMDSLFilter value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("value"));

  -[BMDSLFilter keyPath](self, "keyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("keyPath"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[BMDSLFilter comparison](self, "comparison"), CFSTR("comparison"));
  objc_msgSend(v4, "encodeBool:forKey:", -[BMDSLFilter negation](self, "negation"), CFSTR("negation"));

}

- (BMDSLFilter)initWithCoder:(id)a3
{
  id v4;
  BMDSLFilter *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BMDSLFilter;
  v5 = -[BMDSLBaseCodable initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    +[BMDSLClasses allowed](BMDSLClasses, "allowed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("upstream"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyPath"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("comparison"));
    v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("negation"));
    +[BMDSLClasses allowed](BMDSLClasses, "allowed");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("value"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[BMDSLBaseCodable name](v5, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = -[BMDSLBaseCodable version](v5, "version");
    v5 = -[BMDSLFilter initWithUpstream:keyPath:comparison:negation:value:name:version:](v5, "initWithUpstream:keyPath:comparison:negation:value:name:version:", v7, v8, v9, v10, v12, v13, v15);

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upstream, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

- (void)initWithUpstream:(int)a1 keyPath:(NSObject *)a2 comparison:negation:value:name:version:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1AEB18000, a2, OS_LOG_TYPE_ERROR, "Unexpected version %u. Failed to initialize BMDSLFilter", (uint8_t *)v2, 8u);
}

void __38__BMDSLFilter_BPSPubSub__bpsPublisher__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1AEB18000, a2, OS_LOG_TYPE_ERROR, "Unrecognized comparison %@ when evaluating BMDSLFilter isIncluded", (uint8_t *)&v4, 0xCu);

}

void __38__BMDSLFilter_BPSPubSub__bpsPublisher__block_invoke_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AEB18000, log, OS_LOG_TYPE_ERROR, "BMDSLFilter value must be non-nil", v1, 2u);
}

@end
