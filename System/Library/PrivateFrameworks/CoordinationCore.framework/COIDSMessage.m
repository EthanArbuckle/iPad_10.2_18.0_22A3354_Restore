@implementation COIDSMessage

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("VR"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[COIDSMessage type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("MT"));

  if (-[COIDSMessage type](self, "type") == 2)
  {
    -[COIDSMessage error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _errorToDictionary(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("ER"));

  }
  else
  {
    -[COIDSMessage payload](self, "payload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("PL"));

    -[COIDSMessage command](self, "command");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("CM"));
  }

  -[COIDSMessage metadata](self, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[COIDSMessage metadata](self, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("MK"));

  }
  return v3;
}

- (BOOL)checkValue:(id)a3 forKey:(id)a4 isKindOfClass:(Class)a5 error:(id *)a6
{
  id v8;
  id v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    if (!a6)
      goto LABEL_9;
    v10 = CFSTR("missing property '%@'");
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD0BA0];
    v16[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4000, v13);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a6) = 0;
    goto LABEL_9;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a6)
      goto LABEL_9;
    v10 = CFSTR("property '%@' has wrong type");
    goto LABEL_8;
  }
  LOBYTE(a6) = 1;
LABEL_9:

  return (char)a6;
}

- (BOOL)validateVersion:(id *)a3 error:(id *)a4
{
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = -[COIDSMessage checkValue:forKey:isKindOfClass:error:](self, "checkValue:forKey:isKindOfClass:error:", *a3, CFSTR("version"), objc_opt_class(), a4);
  if (v6)
  {
    v7 = objc_msgSend(*a3, "unsignedIntegerValue");
    LOBYTE(v6) = v7 == 1;
    if (a4)
    {
      if (v7 != 1)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("invalid version '%lu'"), v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x24BDD1540];
        v12 = *MEMORY[0x24BDD0BA0];
        v13[0] = v8;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4000, v10);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        LOBYTE(v6) = 0;
      }
    }
  }
  return v6;
}

- (BOOL)validateType:(id *)a3 error:(id *)a4
{
  id *v4;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString **v14;
  uint64_t *v15;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  _QWORD v22[2];

  v4 = a4;
  v22[1] = *MEMORY[0x24BDAC8D0];
  if (-[COIDSMessage checkValue:forKey:isKindOfClass:error:](self, "checkValue:forKey:isKindOfClass:error:", *a3, CFSTR("type"), objc_opt_class(), a4))
  {
    v7 = *a3;
    v8 = objc_msgSend(v7, "unsignedIntegerValue");
    if (v8 >= 3)
    {
      if (!v4)
      {
LABEL_14:

        return (char)v4;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("invalid message type '%lu'"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BDD1540];
      v21 = *MEMORY[0x24BDD0BA0];
      v22[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4000, v11);
      *v4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_5:
      LOBYTE(v4) = 0;
      goto LABEL_14;
    }
    if (v8 >= 2)
    {
      if (!self->_error)
      {
        if (!v4)
          goto LABEL_14;
        v12 = (void *)MEMORY[0x24BDD1540];
        v17 = *MEMORY[0x24BDD0BA0];
        v18 = CFSTR("'error' property missing");
        v13 = (void *)MEMORY[0x24BDBCE70];
        v14 = &v18;
        v15 = &v17;
LABEL_18:
        objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4000, v9);
        *v4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_5;
      }
    }
    else if (self->_command && !self->_payload)
    {
      if (!v4)
        goto LABEL_14;
      v12 = (void *)MEMORY[0x24BDD1540];
      v19 = *MEMORY[0x24BDD0BA0];
      v20 = CFSTR("'payload' property missing");
      v13 = (void *)MEMORY[0x24BDBCE70];
      v14 = &v20;
      v15 = &v19;
      goto LABEL_18;
    }
    LOBYTE(v4) = 1;
    goto LABEL_14;
  }
  LOBYTE(v4) = 0;
  return (char)v4;
}

- (BOOL)validateCommand:(id *)a3 error:(id *)a4
{
  return !*a3
      || -[COIDSMessage checkValue:forKey:isKindOfClass:error:](self, "checkValue:forKey:isKindOfClass:error:", *a3, CFSTR("command"), objc_opt_class(), a4);
}

- (BOOL)validateData:(id *)a3 error:(id *)a4
{
  _BOOL4 v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (!*a3)
    goto LABEL_4;
  v6 = -[COIDSMessage checkValue:forKey:isKindOfClass:error:](self, "checkValue:forKey:isKindOfClass:error:", *a3, CFSTR("payload"), objc_opt_class(), a4);
  if (v6)
  {
    if (self->_command)
    {
LABEL_4:
      LOBYTE(v6) = 1;
      return v6;
    }
    if (a4)
    {
      v7 = (void *)MEMORY[0x24BDD1540];
      v10 = *MEMORY[0x24BDD0BA0];
      v11[0] = CFSTR("'command' property missing");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4000, v8);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)validateError:(id *)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  if (!*a3)
    return 1;
  if (!-[COIDSMessage checkValue:forKey:isKindOfClass:error:](self, "checkValue:forKey:isKindOfClass:error:", *a3, CFSTR("error"), objc_opt_class(), a4))return 0;
  v6 = *a3;
  _errorFromDictionary(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = v7 != 0;
  if (v7)
  {
    *a3 = objc_retainAutorelease(v7);
  }
  else if (a4)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BDD0BA0];
    v14[0] = CFSTR("'error' data invalid");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4000, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (BOOL)validateMetadata:(id *)a3 error:(id *)a4
{
  return !*a3
      || -[COIDSMessage checkValue:forKey:isKindOfClass:error:](self, "checkValue:forKey:isKindOfClass:error:", *a3, CFSTR("metadata"), objc_opt_class(), a4);
}

- (COIDSMessage)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  COIDSMessage *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  int v11;
  id v12;
  COIDSMessage *v13;
  id v15;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)COIDSMessage;
  v7 = -[COIDSMessage init](&v16, sel_init);
  if (v7)
  {
    v8 = 0;
    while (1)
    {
      objc_msgSend(v6, "objectForKey:", initWithDictionary_error__fields[v8]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v9;
      v10 = initWithDictionary_error__fields[v8 + 1];
      v11 = -[COIDSMessage validateValue:forKey:error:](v7, "validateValue:forKey:error:", &v15, v10, a4);
      v12 = v15;

      if (!v11)
        break;
      -[COIDSMessage setValue:forKey:](v7, "setValue:forKey:", v12, v10);

      v8 += 2;
      if (v8 == 12)
        goto LABEL_5;
    }

    v13 = 0;
  }
  else
  {
LABEL_5:
    v13 = v7;
  }

  return v13;
}

- (COIDSMessage)initWithError:(id)a3
{
  id v5;
  char *v6;
  COIDSMessage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COIDSMessage;
  v6 = -[COIDSMessage init](&v9, sel_init);
  v7 = (COIDSMessage *)v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 8) = xmmword_215F52F80;
    objc_storeStrong((id *)v6 + 5, a3);
  }

  return v7;
}

- (COIDSMessage)initWithRequest:(id)a3
{
  id v4;
  char *v5;
  COIDSMessage *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)COIDSMessage;
  v5 = -[COIDSMessage init](&v8, sel_init);
  v6 = (COIDSMessage *)v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 8) = xmmword_215F52F70;
    objc_msgSend(v5, "_commandPayload:", v4);
  }

  return v6;
}

- (COIDSMessage)initWithResponse:(id)a3
{
  id v4;
  char *v5;
  COIDSMessage *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)COIDSMessage;
  v5 = -[COIDSMessage init](&v8, sel_init);
  v6 = (COIDSMessage *)v5;
  if (v5)
  {
    *(int64x2_t *)(v5 + 8) = vdupq_n_s64(1uLL);
    objc_msgSend(v5, "_commandPayload:", v4);
  }

  return v6;
}

- (id)unarchivePayloadOfTypes:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  NSString *v9;
  Class v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[COIDSMessage command](self, "command");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if ((v8 & 1) != 0)
  {
    -[COIDSMessage command](self, "command");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = NSClassFromString(v9);

    v11 = (void *)MEMORY[0x24BDD1620];
    -[COIDSMessage payload](self, "payload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unarchivedObjectOfClass:fromData:error:", v10, v12, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    return v13;
  }
  else
  {
    if (a4)
    {
      v15 = (void *)MEMORY[0x24BDD17C8];
      -[COIDSMessage command](self, "command");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("Invalid type: %@"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x24BDD1540];
      v19 = *MEMORY[0x24BDD0B88];
      v21 = *MEMORY[0x24BDD0BA0];
      v22[0] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 4866, v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
    return a4;
  }
}

- (void)_commandPayload:(id)a3
{
  id v4;
  objc_class *v5;
  NSString *v6;
  NSString *command;
  NSData *v8;
  NSData *payload;
  NSObject *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  command = self->_command;
  self->_command = v6;

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0);
  v8 = (NSData *)objc_claimAutoreleasedReturnValue();
  payload = self->_payload;
  self->_payload = v8;

  if (!self->_payload)
  {
    if (class_getMethodImplementation(v5, sel_supportsSecureCoding)
      && class_getMethodImplementation(v5, sel_encodeWithCoder_))
    {
      COCoreLogForCategory(17);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[COIDSMessage _commandPayload:].cold.2((uint64_t)v4, v10, v11);
    }
    else
    {
      COCoreLogForCategory(17);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[COIDSMessage _commandPayload:].cold.1(v5, v10);
    }

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDD0E18], 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise");

  }
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSString)command
{
  return self->_command;
}

- (NSData)payload
{
  return self->_payload;
}

- (NSError)error
{
  return self->_error;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_command, 0);
}

- (void)_commandPayload:(objc_class *)a1 .cold.1(objc_class *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  NSStringFromClass(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_15(&dword_215E92000, a2, v4, "%@ does not appear to properly support secure coding which is required for all commands going over IDS!", (uint8_t *)&v5);

}

- (void)_commandPayload:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_15(&dword_215E92000, a2, a3, "Failed to properly archive for sending over IDS: %@", (uint8_t *)&v3);
}

@end
