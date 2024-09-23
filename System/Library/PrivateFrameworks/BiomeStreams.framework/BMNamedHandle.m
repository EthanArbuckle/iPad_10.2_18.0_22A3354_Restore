@implementation BMNamedHandle

- (BMNamedHandle)initWithName:(id)a3 handleType:(id)a4 handle:(id)a5 contactIdentifier:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  BMNamedHandle *v16;
  BMNamedHandle *v17;
  void *v19;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMNamedHandle.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handle"));

  }
  v20.receiver = self;
  v20.super_class = (Class)BMNamedHandle;
  v16 = -[BMNamedHandle init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_name, a3);
    objc_storeStrong((id *)&v17->_handleType, a4);
    objc_storeStrong((id *)&v17->_handle, a5);
    objc_storeStrong((id *)&v17->_contactIdentifier, a6);
  }

  return v17;
}

- (BMNamedHandle)initWithString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  BMNamedHandle *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(" <>"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count"))
  {
    v8 = v4;
    goto LABEL_5;
  }
  v7 = objc_msgSend(v6, "count");
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == 1)
  {
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v9 = v8;
  v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v10 = -[BMNamedHandle initWithName:handleType:handle:contactIdentifier:](self, "initWithName:handleType:handle:contactIdentifier:", v9, 0, v8, 0);

  return v10;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  void *v7;
  NSObject *v8;

  v6 = a3;
  if (a4 == 1)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);
  }
  else
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[BMNamedHandle eventWithData:dataVersion:].cold.1(a4, v8);

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  NSString *name;
  void *v4;
  NSString *handleType;
  void *v6;
  NSString *handle;
  NSString *contactIdentifier;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("name");
  name = self->_name;
  v4 = name;
  if (!name)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = v4;
  v12[1] = CFSTR("handleType");
  handleType = self->_handleType;
  v6 = handleType;
  if (!handleType)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  handle = self->_handle;
  contactIdentifier = self->_contactIdentifier;
  v13[1] = v6;
  v13[2] = handle;
  v12[2] = CFSTR("handle");
  v12[3] = CFSTR("contactIdentfier");
  v9 = contactIdentifier;
  if (!contactIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (contactIdentifier)
  {
    if (handleType)
      goto LABEL_9;
LABEL_12:

    if (name)
      return v10;
LABEL_13:

    return v10;
  }

  if (!handleType)
    goto LABEL_12;
LABEL_9:
  if (!name)
    goto LABEL_13;
  return v10;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[BMNamedHandle jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (!v4)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMNamedHandle json].cold.1((uint64_t)v5, v6);

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BMNamedHandle encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dat"));

}

- (BMNamedHandle)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BMNamedHandle *v7;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("dat"), v5, 1, CFSTR("BMStreamErrorDomain"), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[BMNamedHandle initWithProtoData:](self, "initWithProtoData:", v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMNamedHandle proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMNamedHandle)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BMNamedHandle *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[NSObject handle](v5, "handle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[NSObject name](v5, "name");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject handleType](v5, "handleType");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject handle](v5, "handle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject contactIdentifier](v5, "contactIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[BMNamedHandle initWithName:handleType:handle:contactIdentifier:](self, "initWithName:handleType:handle:contactIdentifier:", v7, v8, v9, v10);

        v11 = self;
LABEL_12:

        goto LABEL_13;
      }
      __biome_log_for_category();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        -[BMNamedHandle initWithProto:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);

    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMNamedHandle initWithProto:].cold.2(v5, v12, v13, v14, v15, v16, v17, v18);
    }
    v11 = 0;
    goto LABEL_12;
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (BMNamedHandle)initWithProtoData:(id)a3
{
  id v4;
  BMPBNamedHandle *v5;
  BMNamedHandle *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBNamedHandle initWithData:]([BMPBNamedHandle alloc], "initWithData:", v4);

    self = -[BMNamedHandle initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[BMNamedHandle name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", v4);

  -[BMNamedHandle handleType](self, "handleType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHandleType:", v5);

  -[BMNamedHandle handle](self, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHandle:", v6);

  -[BMNamedHandle contactIdentifier](self, "contactIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContactIdentifier:", v7);

  return v3;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_handle, "hash");
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  void *v8;
  NSString *name;
  NSString *v10;
  uint64_t v11;
  int v12;
  char v13;
  NSString *handleType;
  NSString *v15;
  uint64_t v16;
  NSString *handle;
  void *v18;
  NSString *contactIdentifier;
  NSString *v20;
  uint64_t v21;
  NSString *v22;
  void *v23;
  int v24;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  void *v31;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = 0;
    goto LABEL_34;
  }
  v7 = v6;
  v8 = v7;
  name = self->_name;
  v10 = name;
  if (!name)
  {
    objc_msgSend(v7, "name");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v31 = 0;
      v12 = 0;
      goto LABEL_10;
    }
    v31 = (void *)v11;
    v10 = self->_name;
  }
  objc_msgSend(v8, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString isEqualToString:](v10, "isEqualToString:", v3))
  {

    v13 = 0;
    goto LABEL_31;
  }
  v12 = 1;
LABEL_10:
  handleType = self->_handleType;
  v15 = handleType;
  if (!handleType)
  {
    objc_msgSend(v8, "handleType");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v28 = 0;
      v29 = 0;
      goto LABEL_19;
    }
    v28 = (void *)v16;
    v15 = self->_handleType;
  }
  objc_msgSend(v8, "handleType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString isEqualToString:](v15, "isEqualToString:", v4))
  {

    v13 = 0;
    if (handleType)
      goto LABEL_29;
LABEL_16:

    if ((v12 & 1) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
  v29 = 1;
LABEL_19:
  handle = self->_handle;
  objc_msgSend(v8, "handle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v12;
  if (!-[NSString isEqualToString:](handle, "isEqualToString:", v18))
  {
    v13 = 0;
    v24 = v29;
    goto LABEL_26;
  }
  contactIdentifier = self->_contactIdentifier;
  v20 = contactIdentifier;
  if (!contactIdentifier)
  {
    objc_msgSend(v8, "contactIdentifier");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      v27 = 0;
      v13 = 1;
      LOBYTE(v24) = v29;
      goto LABEL_36;
    }
    v26 = v21;
    v20 = self->_contactIdentifier;
  }
  v22 = v20;
  objc_msgSend(v8, "contactIdentifier", v26, v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[NSString isEqualToString:](v22, "isEqualToString:", v23);

  v24 = v29;
  if (contactIdentifier)
  {
LABEL_26:

    if (!v24)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_36:

  if ((v24 & 1) != 0)
LABEL_27:

LABEL_28:
  v12 = v30;
  if (!handleType)
    goto LABEL_16;
LABEL_29:
  if (v12)
LABEL_30:

LABEL_31:
  if (!name)

LABEL_34:
  return v13;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  NSString *handle;

  handle = self->_handle;
  if (a4 && !handle)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BMStreamErrorDomain"), 3, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return handle != 0;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)handleType
{
  return self->_handleType;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_handleType, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109376;
  v2[1] = a1;
  v3 = 1024;
  v4 = 1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMNamedHandle: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)json
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMNamedHandle: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithProto:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "BMNamedHandle: tried to initialize with a proto missing required data.", a5, a6, a7, a8, 0);
}

- (void)initWithProto:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "BMNamedHandle: tried to initialize with a non-BMNamedHandle proto", a5, a6, a7, a8, 0);
}

@end
