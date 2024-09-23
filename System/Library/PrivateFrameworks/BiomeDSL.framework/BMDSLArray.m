@implementation BMDSLArray

- (BMDSLArray)initWithName:(id)a3 version:(unsigned int)a4 values:(id)a5 valueClassName:(id)a6
{
  id v10;
  id v11;
  BMDSLArray *v12;
  uint64_t v13;
  NSArray *values;
  uint64_t v15;
  NSString *valueClassName;
  BMDSLArray *v17;
  NSObject *v18;
  objc_super v20;

  v10 = a5;
  v11 = a6;
  if (a4 == 1)
  {
    v20.receiver = self;
    v20.super_class = (Class)BMDSLArray;
    v12 = -[BMDSLBaseCodable initWithName:version:](&v20, sel_initWithName_version_, a3, 1);
    if (v12)
    {
      v13 = objc_msgSend(v10, "copy");
      values = v12->_values;
      v12->_values = (NSArray *)v13;

      v15 = objc_msgSend(v11, "copy");
      valueClassName = v12->_valueClassName;
      v12->_valueClassName = (NSString *)v15;

    }
    self = v12;
    v17 = self;
  }
  else
  {
    __biome_log_for_category();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[BMDSLArray initWithName:version:values:valueClassName:].cold.1(a4, v18);

    v17 = 0;
  }

  return v17;
}

- (BMDSLArray)initWithValues:(id)a3 valueClassName:(id)a4
{
  return -[BMDSLArray initWithName:version:values:valueClassName:](self, "initWithName:version:values:valueClassName:", CFSTR("array"), 1, a3, a4);
}

- (id)upstreams
{
  return (id)MEMORY[0x1E0C9AA60];
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
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BMDSLArray;
  v4 = a3;
  -[BMDSLBaseCodable encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[BMDSLArray values](self, "values", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("values"));

  -[BMDSLArray valueClassName](self, "valueClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("valueClassName"));

}

- (BMDSLArray)initWithCoder:(id)a3
{
  id v5;
  BMDSLArray *v6;
  BMDSLArray *v7;
  NSString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  BMDSLArray *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  objc_class *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)BMDSLArray;
  v6 = -[BMDSLBaseCodable initWithCoder:](&v29, sel_initWithCoder_, v5);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("valueClassName"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    +[BMDSLClasses allowed](BMDSLClasses, "allowed");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          NSStringFromClass(*(Class *)(*((_QWORD *)&v25 + 1) + 8 * v13));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v8);

          if ((v15 & 1) != 0)
          {

            NSClassFromString(v8);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), v16, 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v16)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = (objc_class *)objc_opt_class();
              NSStringFromClass(v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("BMDSLArray.m"), 75, CFSTR("%@ - Can't get class from string %@"), v24, v8);

            }
            objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v18, CFSTR("values"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[BMDSLBaseCodable name](v7, "name");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = -[BMDSLArray initWithName:version:values:valueClassName:](v7, "initWithName:version:values:valueClassName:", v20, -[BMDSLBaseCodable version](v7, "version"), v19, v8);

            v17 = v7;
            goto LABEL_14;
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v11)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("BMDSLArray.m"), 69, CFSTR("Decoded class not in allow list"));
    v17 = 0;
LABEL_14:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (NSArray)values
{
  return self->_values;
}

- (NSString)valueClassName
{
  return self->_valueClassName;
}

- (void)setValueClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueClassName, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

- (id)bpsPublisher
{
  void *v2;
  void *v3;

  -[BMDSLArray values](self, "values");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bpsPublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)initWithName:(int)a1 version:(NSObject *)a2 values:valueClassName:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1AEB18000, a2, OS_LOG_TYPE_ERROR, "Unexpected version %u. Failed to initialize BMDSLArray", (uint8_t *)v2, 8u);
}

@end
