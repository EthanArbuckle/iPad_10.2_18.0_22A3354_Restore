@implementation DMFFetchDevicePropertiesResultObject

- (DMFFetchDevicePropertiesResultObject)initWithValuesByPropertyKey:(id)a3 errorsByPropertyKey:(id)a4
{
  id v6;
  id v7;
  DMFFetchDevicePropertiesResultObject *v8;
  uint64_t v9;
  NSDictionary *valuesByPropertyKey;
  uint64_t v11;
  NSDictionary *errorsByPropertyKey;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DMFFetchDevicePropertiesResultObject;
  v8 = -[CATTaskResultObject init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    valuesByPropertyKey = v8->_valuesByPropertyKey;
    v8->_valuesByPropertyKey = (NSDictionary *)v9;

    v11 = objc_msgSend(v7, "copy");
    errorsByPropertyKey = v8->_errorsByPropertyKey;
    v8->_errorsByPropertyKey = (NSDictionary *)v11;

  }
  return v8;
}

- (id)valueForPropertyKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4)
  {
    -[DMFFetchDevicePropertiesResultObject errorsByPropertyKey](self, "errorsByPropertyKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {

    }
    else
    {
      -[DMFFetchDevicePropertiesResultObject valuesByPropertyKey](self, "valuesByPropertyKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v16 = CFSTR("propertyKey");
        v17[0] = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        DMFErrorWithCodeAndUserInfo();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      }
    }
    -[DMFFetchDevicePropertiesResultObject errorsByPropertyKey](self, "errorsByPropertyKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForKey:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    *a4 = v12;

  }
  -[DMFFetchDevicePropertiesResultObject valuesByPropertyKey](self, "valuesByPropertyKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueForKey:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (DMFDevice)device
{
  id v3;
  void *v4;
  void *v5;

  v3 = -[DMFDevice initPrivate]([DMFDevice alloc], "initPrivate");
  -[DMFFetchDevicePropertiesResultObject valuesByPropertyKey](self, "valuesByPropertyKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValuesForKeysWithDictionary:", v4);

  -[DMFFetchDevicePropertiesResultObject errorsByPropertyKey](self, "errorsByPropertyKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setErrorsForKeys:", v5);

  return (DMFDevice *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (DMFFetchDevicePropertiesResultObject)initWithCoder:(id)a3
{
  id v4;
  DMFFetchDevicePropertiesResultObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSDictionary *valuesByPropertyKey;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSDictionary *errorsByPropertyKey;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)DMFFetchDevicePropertiesResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v35, sel_initWithCoder_, v4);
  if (v5)
  {
    v33 = (void *)MEMORY[0x1E0C99E60];
    v31 = objc_opt_class();
    v29 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v33, "setWithObjects:", v31, v29, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("valuesByPropertyKey"));
    v15 = objc_claimAutoreleasedReturnValue();
    valuesByPropertyKey = v5->_valuesByPropertyKey;
    v5->_valuesByPropertyKey = (NSDictionary *)v15;

    v34 = (void *)MEMORY[0x1E0C99E60];
    v32 = objc_opt_class();
    v30 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    objc_msgSend(v34, "setWithObjects:", v32, v30, v17, v18, v19, v20, v21, v22, v23, v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("errorsByPropertyKey"));
    v26 = objc_claimAutoreleasedReturnValue();
    errorsByPropertyKey = v5->_errorsByPropertyKey;
    v5->_errorsByPropertyKey = (NSDictionary *)v26;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DMFFetchDevicePropertiesResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[DMFFetchDevicePropertiesResultObject valuesByPropertyKey](self, "valuesByPropertyKey", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("valuesByPropertyKey"));

  -[DMFFetchDevicePropertiesResultObject errorsByPropertyKey](self, "errorsByPropertyKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("errorsByPropertyKey"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99E08];
  -[DMFFetchDevicePropertiesResultObject errorsByPropertyKey](self, "errorsByPropertyKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[DMFFetchDevicePropertiesResultObject valuesByPropertyKey](self, "valuesByPropertyKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v6);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p %@>"), objc_opt_class(), self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDictionary)valuesByPropertyKey
{
  return self->_valuesByPropertyKey;
}

- (NSDictionary)errorsByPropertyKey
{
  return self->_errorsByPropertyKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorsByPropertyKey, 0);
  objc_storeStrong((id *)&self->_valuesByPropertyKey, 0);
}

@end
