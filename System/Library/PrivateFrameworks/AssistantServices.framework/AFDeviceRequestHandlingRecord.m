@implementation AFDeviceRequestHandlingRecord

- (AFDeviceRequestHandlingRecord)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFDeviceRequestHandlingRecordMutation *);
  AFDeviceRequestHandlingRecord *v5;
  AFDeviceRequestHandlingRecord *v6;
  _AFDeviceRequestHandlingRecordMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *requestID;
  objc_super v12;

  v4 = (void (**)(id, _AFDeviceRequestHandlingRecordMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFDeviceRequestHandlingRecord;
  v5 = -[AFDeviceRequestHandlingRecord init](&v12, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFDeviceRequestHandlingRecordMutation initWithBase:]([_AFDeviceRequestHandlingRecordMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFDeviceRequestHandlingRecordMutation isDirty](v7, "isDirty"))
    {
      -[_AFDeviceRequestHandlingRecordMutation getRequestID](v7, "getRequestID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      requestID = v6->_requestID;
      v6->_requestID = (NSString *)v9;

      v6->_deviceRoles = -[_AFDeviceRequestHandlingRecordMutation getDeviceRoles](v7, "getDeviceRoles");
    }

  }
  return v6;
}

- (AFDeviceRequestHandlingRecord)init
{
  return -[AFDeviceRequestHandlingRecord initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFDeviceRequestHandlingRecord)initWithRequestID:(id)a3 deviceRoles:(unint64_t)a4
{
  id v6;
  id v7;
  AFDeviceRequestHandlingRecord *v8;
  _QWORD v10[4];
  id v11;
  unint64_t v12;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__AFDeviceRequestHandlingRecord_initWithRequestID_deviceRoles___block_invoke;
  v10[3] = &unk_1E3A2F210;
  v11 = v6;
  v12 = a4;
  v7 = v6;
  v8 = -[AFDeviceRequestHandlingRecord initWithBuilder:](self, "initWithBuilder:", v10);

  return v8;
}

- (NSString)description
{
  return (NSString *)-[AFDeviceRequestHandlingRecord _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  NSString *requestID;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11.receiver = self;
  v11.super_class = (Class)AFDeviceRequestHandlingRecord;
  -[AFDeviceRequestHandlingRecord description](&v11, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  requestID = self->_requestID;
  AFDeviceRequestHandlingRolesGetNames(self->_deviceRoles);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("|"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {requestID = %@, deviceRoles = %@}"), v5, requestID, v8);

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_requestID, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_deviceRoles);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  AFDeviceRequestHandlingRecord *v4;
  AFDeviceRequestHandlingRecord *v5;
  unint64_t deviceRoles;
  NSString *v7;
  NSString *requestID;
  BOOL v9;

  v4 = (AFDeviceRequestHandlingRecord *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      deviceRoles = self->_deviceRoles;
      if (deviceRoles == -[AFDeviceRequestHandlingRecord deviceRoles](v5, "deviceRoles"))
      {
        -[AFDeviceRequestHandlingRecord requestID](v5, "requestID");
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        requestID = self->_requestID;
        v9 = requestID == v7 || -[NSString isEqual:](requestID, "isEqual:", v7);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (AFDeviceRequestHandlingRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  AFDeviceRequestHandlingRecord *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFDeviceRequestHandlingRecord::requestID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFDeviceRequestHandlingRecord::deviceRoles"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  v8 = -[AFDeviceRequestHandlingRecord initWithRequestID:deviceRoles:](self, "initWithRequestID:deviceRoles:", v5, v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *requestID;
  id v5;
  id v6;

  requestID = self->_requestID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", requestID, CFSTR("AFDeviceRequestHandlingRecord::requestID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_deviceRoles);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("AFDeviceRequestHandlingRecord::deviceRoles"));

}

- (AFDeviceRequestHandlingRecord)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  AFDeviceRequestHandlingRecord *v7;
  void *v8;
  uint64_t v9;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "objectForKey:", CFSTR("requestID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    objc_msgSend(v4, "objectForKey:", CFSTR("deviceRoles"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = AFDeviceRequestHandlingRolesGetFromNames(v8);
    else
      v9 = 0;

    self = -[AFDeviceRequestHandlingRecord initWithRequestID:deviceRoles:](self, "initWithRequestID:deviceRoles:", v6, v9);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *requestID;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  requestID = self->_requestID;
  if (requestID)
    objc_msgSend(v3, "setObject:forKey:", requestID, CFSTR("requestID"));
  AFDeviceRequestHandlingRolesGetNames(self->_deviceRoles);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("deviceRoles"));

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (unint64_t)deviceRoles
{
  return self->_deviceRoles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestID, 0);
}

void __63__AFDeviceRequestHandlingRecord_initWithRequestID_deviceRoles___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setRequestID:", v3);
  objc_msgSend(v4, "setDeviceRoles:", *(_QWORD *)(a1 + 40));

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFDeviceRequestHandlingRecordMutation *);
  _AFDeviceRequestHandlingRecordMutation *v5;
  AFDeviceRequestHandlingRecord *v6;
  void *v7;
  uint64_t v8;
  NSString *requestID;

  v4 = (void (**)(id, _AFDeviceRequestHandlingRecordMutation *))a3;
  if (v4)
  {
    v5 = -[_AFDeviceRequestHandlingRecordMutation initWithBase:]([_AFDeviceRequestHandlingRecordMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFDeviceRequestHandlingRecordMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFDeviceRequestHandlingRecord);
      -[_AFDeviceRequestHandlingRecordMutation getRequestID](v5, "getRequestID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      requestID = v6->_requestID;
      v6->_requestID = (NSString *)v8;

      v6->_deviceRoles = -[_AFDeviceRequestHandlingRecordMutation getDeviceRoles](v5, "getDeviceRoles");
    }
    else
    {
      v6 = (AFDeviceRequestHandlingRecord *)-[AFDeviceRequestHandlingRecord copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFDeviceRequestHandlingRecord *)-[AFDeviceRequestHandlingRecord copy](self, "copy");
  }

  return v6;
}

- (AFDeviceRequestHandlingRecord)initWithSerializedBackingStore:(id)a3
{
  id v4;
  AFDeviceRequestHandlingRecord *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self = -[AFDeviceRequestHandlingRecord initWithDictionaryRepresentation:](self, "initWithDictionaryRepresentation:", v4);
    v5 = self;
  }
  else
  {
    v6 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[AFDeviceRequestHandlingRecord(ContextSnapshot) initWithSerializedBackingStore:]";
      v10 = 2112;
      v11 = v4;
      _os_log_error_impl(&dword_19AF50000, v6, OS_LOG_TYPE_ERROR, "%s #hal serializedBackingStore is of unexpected type or is nil: %@", (uint8_t *)&v8, 0x16u);
    }
    v5 = 0;
  }

  return v5;
}

@end
