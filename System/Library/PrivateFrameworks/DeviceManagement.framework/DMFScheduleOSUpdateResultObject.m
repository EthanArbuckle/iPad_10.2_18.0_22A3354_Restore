@implementation DMFScheduleOSUpdateResultObject

- (DMFScheduleOSUpdateResultObject)initWithAction:(unint64_t)a3 productKey:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  DMFScheduleOSUpdateResultObject *v10;
  DMFScheduleOSUpdateResultObject *v11;
  uint64_t v12;
  NSString *productKey;
  uint64_t v14;
  NSError *error;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DMFScheduleOSUpdateResultObject;
  v10 = -[CATTaskResultObject init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_action = a3;
    v12 = objc_msgSend(v8, "copy");
    productKey = v11->_productKey;
    v11->_productKey = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    error = v11->_error;
    v11->_error = (NSError *)v14;

  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFScheduleOSUpdateResultObject)initWithCoder:(id)a3
{
  id v4;
  DMFScheduleOSUpdateResultObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *productKey;
  void *v10;
  uint64_t v11;
  NSError *error;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DMFScheduleOSUpdateResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_action = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("productKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    productKey = v5->_productKey;
    v5->_productKey = (NSString *)v8;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("error"));
    v11 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DMFScheduleOSUpdateResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFScheduleOSUpdateResultObject action](self, "action", v8.receiver, v8.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("action"));

  -[DMFScheduleOSUpdateResultObject productKey](self, "productKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("productKey"));

  -[DMFScheduleOSUpdateResultObject error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("error"));

}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@:%p {\n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DMFScheduleOSUpdateRequest _descriptionForAction:](DMFScheduleOSUpdateRequest, "_descriptionForAction:", -[DMFScheduleOSUpdateResultObject action](self, "action"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tAction      : %@\n"), v4);

  -[DMFScheduleOSUpdateResultObject productKey](self, "productKey");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("None");
  objc_msgSend(v3, "appendFormat:", CFSTR("\tProduct Key : %@\n"), v7);

  -[DMFScheduleOSUpdateResultObject error](self, "error");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("None");
  objc_msgSend(v3, "appendFormat:", CFSTR("\tError       : %@\n"), v10);

  objc_msgSend(v3, "appendString:", CFSTR("}>"));
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

- (unint64_t)action
{
  return self->_action;
}

- (NSString)productKey
{
  return self->_productKey;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_productKey, 0);
}

@end
