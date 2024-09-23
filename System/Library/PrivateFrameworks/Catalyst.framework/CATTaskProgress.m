@implementation CATTaskProgress

+ (id)progressForOperation:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOperation:", v4);

  return v5;
}

- (CATTaskProgress)initWithOperationUUID:(id)a3
{
  id v5;
  CATTaskProgress *v6;
  uint64_t v7;
  NSUUID *UUID;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTaskProgress.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuid"));

  }
  v11.receiver = self;
  v11.super_class = (Class)CATTaskProgress;
  v6 = -[CATTaskProgress init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    UUID = v6->_UUID;
    v6->_UUID = (NSUUID *)v7;

    v6->_completedUnitCount = -1;
    v6->_totalUnitCount = -1;
  }

  return v6;
}

- (CATTaskProgress)initWithOperation:(id)a3
{
  id v5;
  void *v6;
  CATTaskProgress *v7;
  void *v8;
  objc_class *v9;
  uint64_t v10;
  NSString *requestClassName;
  uint64_t v12;
  id resultObject;
  uint64_t v14;
  NSError *error;
  uint64_t v16;
  NSDictionary *userInfo;
  void *v19;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTaskProgress.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("operation"));

  }
  objc_msgSend(v5, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CATTaskProgress initWithOperationUUID:](self, "initWithOperationUUID:", v6);

  if (v7)
  {
    objc_msgSend(v5, "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = objc_claimAutoreleasedReturnValue();
    requestClassName = v7->_requestClassName;
    v7->_requestClassName = (NSString *)v10;

    objc_msgSend(v5, "resultObject");
    v12 = objc_claimAutoreleasedReturnValue();
    resultObject = v7->_resultObject;
    v7->_resultObject = (id)v12;

    v7->_phase = objc_msgSend(v5, "phase");
    objc_msgSend(v5, "error");
    v14 = objc_claimAutoreleasedReturnValue();
    error = v7->_error;
    v7->_error = (NSError *)v14;

    objc_msgSend(v5, "userInfo");
    v16 = objc_claimAutoreleasedReturnValue();
    userInfo = v7->_userInfo;
    v7->_userInfo = (NSDictionary *)v16;

    v7->_isCancelable = objc_msgSend((id)objc_opt_class(), "isCancelable");
    v7->_isCanceled = objc_msgSend(v5, "isCanceled");
    v7->_completedUnitCount = objc_msgSend(v5, "completedUnitCount");
    v7->_totalUnitCount = objc_msgSend(v5, "totalUnitCount");
    objc_msgSend((id)objc_opt_class(), "assertResultObject:isValidForRequestClassName:", v7->_resultObject, v7->_requestClassName);
  }

  return v7;
}

- (CATTaskProgress)init
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTaskProgress.m"), 93, CFSTR("%@ cannot call %@ because it is not allowed"), v5, v6);

  return 0;
}

- (unint64_t)state
{
  void *v3;
  unint64_t v4;

  if (-[CATTaskProgress phase](self, "phase") != 3)
    return 0;
  -[CATTaskProgress error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 2;
  else
    v4 = 1;

  return v4;
}

+ (void)assertResultObject:(id)a3 isValidForRequestClassName:(id)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (v10)
  {
    v8 = objc_msgSend((id)objc_opt_class(), "classForResultObjectWithRequestClassName:", v7);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CATTaskProgress.m"), 118, CFSTR("%@: resultObject (%@) is not accepted class %@"), a1, v10, v8);

    }
  }

}

+ (Class)classForResultObjectWithRequestClassName:(id)a3
{
  Class v3;
  void *v4;

  v3 = NSClassFromString((NSString *)a3);
  v4 = (void *)-[objc_class allowlistedClassForResultObject](v3, "allowlistedClassForResultObject");
  if (!v4)
    v4 = (void *)-[objc_class whitelistedClassForResultObject](v3, "whitelistedClassForResultObject");
  return (Class)v4;
}

- (id)progressStateDescription
{
  unint64_t v3;
  __CFString *v4;

  v3 = -[CATTaskProgress state](self, "state");
  if (v3 >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), -[CATTaskProgress state](self, "state"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_24C1C6240[v3];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CATTaskProgress)initWithCoder:(id)a3
{
  id v4;
  CATTaskProgress *v5;
  void *v6;
  uint64_t v7;
  NSUUID *UUID;
  void *v9;
  void *v10;
  uint64_t v11;
  NSError *error;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSDictionary *userInfo;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSString *requestClassName;
  void *v31;
  uint64_t v32;
  id resultObject;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CATTaskProgress;
  v5 = -[CATTaskProgress init](&v38, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("UUID"));
    v7 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phase"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_phase = objc_msgSend(v9, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("error"));
    v11 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v11;

    v37 = (void *)MEMORY[0x24BDBCF20];
    v36 = objc_opt_class();
    v35 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    objc_msgSend(v37, "setWithObjects:", v36, v35, v13, v14, v15, v16, v17, v18, v19, v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("userInfo"));
    v22 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isCancelable"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isCancelable = objc_msgSend(v24, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isCanceled"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isCanceled = objc_msgSend(v25, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalUnitCount"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_totalUnitCount = objc_msgSend(v26, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("completedUnitCount"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_completedUnitCount = objc_msgSend(v27, "integerValue");

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("requestClassName"));
    v29 = objc_claimAutoreleasedReturnValue();
    requestClassName = v5->_requestClassName;
    v5->_requestClassName = (NSString *)v29;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_msgSend((id)objc_opt_class(), "classForResultObjectWithRequestClassName:", v5->_requestClassName), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("resultObject"));
    v32 = objc_claimAutoreleasedReturnValue();
    resultObject = v5->_resultObject;
    v5->_resultObject = (id)v32;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[CATTaskProgress UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("UUID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CATTaskProgress phase](self, "phase"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("phase"));

  -[CATTaskProgress requestClassName](self, "requestClassName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("requestClassName"));

  -[CATTaskProgress resultObject](self, "resultObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("resultObject"));

  -[CATTaskProgress error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("error"));

  -[CATTaskProgress userInfo](self, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("userInfo"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CATTaskProgress isCancelable](self, "isCancelable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("isCancelable"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CATTaskProgress isCanceled](self, "isCanceled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("isCanceled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CATTaskProgress totalUnitCount](self, "totalUnitCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("totalUnitCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CATTaskProgress completedUnitCount](self, "completedUnitCount"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("completedUnitCount"));

}

- (id)description
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[CATTaskProgress state](self, "state");
  if (v3 == 2)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    -[CATTaskProgress error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("finished, error = %@"), v6);
LABEL_6:
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  if (v3 != 1)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    -[CATTaskProgress progressStateDescription](self, "progressStateDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("state = %@"), v6);
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("finished"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v8 = (void *)MEMORY[0x24BDD17C8];
  -[CATTaskProgress UUID](self, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("{ UUID = %@, %@ }"), v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CATTaskProgress UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATTaskProgress progressStateDescription](self, "progressStateDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATTaskProgress error](self, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { UUID = %@, state = %@, error = %@ }>"), v4, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  CATTaskProgress *v6;
  void *v7;
  CATTaskProgress *v8;

  v4 = objc_opt_class();
  if (v4 != objc_opt_class())
    return self;
  v6 = +[CATTaskProgress allocWithZone:](CATTaskProgress, "allocWithZone:", a3);
  -[CATTaskProgress UUID](self, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CATTaskProgress initWithOperationUUID:](v6, "initWithOperationUUID:", v7);

  -[CATTaskProgress setProgress:](v8, "setProgress:", self);
  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CATMutableTaskProgress *v4;
  void *v5;
  CATMutableTaskProgress *v6;

  v4 = +[CATMutableTaskProgress allocWithZone:](CATMutableTaskProgress, "allocWithZone:", a3);
  -[CATTaskProgress UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CATMutableTaskProgress initWithOperationUUID:](v4, "initWithOperationUUID:", v5);

  -[CATMutableTaskProgress setProgress:](v6, "setProgress:", self);
  return v6;
}

- (void)setProgress:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  objc_msgSend(v21, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  -[CATTaskProgress setError:](self, "setError:", v5);

  -[CATTaskProgress setPhase:](self, "setPhase:", objc_msgSend(v21, "phase"));
  -[CATTaskProgress setIsCancelable:](self, "setIsCancelable:", objc_msgSend(v21, "isCancelable"));
  -[CATTaskProgress setIsCanceled:](self, "setIsCanceled:", objc_msgSend(v21, "isCanceled"));
  -[CATTaskProgress setTotalUnitCount:](self, "setTotalUnitCount:", objc_msgSend(v21, "totalUnitCount"));
  -[CATTaskProgress setCompletedUnitCount:](self, "setCompletedUnitCount:", objc_msgSend(v21, "completedUnitCount"));
  objc_msgSend(v21, "requestClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATTaskProgress setRequestClassName:](self, "setRequestClassName:", v6);

  objc_msgSend(v21, "resultObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "resultObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "conformsToProtocol:", &unk_2545AD148))
    goto LABEL_6;
  objc_msgSend(v21, "resultObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  if (objc_msgSend(v9, "hasPrefix:", CFSTR("NSMutable")))
  {

LABEL_13:
    objc_msgSend(v21, "resultObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "mutableCopy");
    goto LABEL_14;
  }
  v17 = objc_msgSend(v9, "hasPrefix:", CFSTR("CATMutable"));

  if (v17)
    goto LABEL_13;
LABEL_7:
  objc_msgSend(v21, "resultObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "conformsToProtocol:", &unk_2545A6D68) & 1) != 0)
  {
    objc_msgSend(v21, "resultObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      objc_msgSend(v21, "resultObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "copy");
LABEL_14:
      v18 = (void *)v16;
      -[CATTaskProgress setResultObject:](self, "setResultObject:", v16);

      goto LABEL_15;
    }
  }
  else
  {

  }
  objc_msgSend(v21, "resultObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATTaskProgress setResultObject:](self, "setResultObject:", v15);
LABEL_15:

  objc_msgSend(v21, "userInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  -[CATTaskProgress setUserInfo:](self, "setUserInfo:", v20);

}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(unint64_t)a3
{
  self->_phase = a3;
}

- (id)resultObject
{
  return self->_resultObject;
}

- (void)setResultObject:(id)a3
{
  objc_storeStrong(&self->_resultObject, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (BOOL)isCancelable
{
  return self->_isCancelable;
}

- (void)setIsCancelable:(BOOL)a3
{
  self->_isCancelable = a3;
}

- (BOOL)isCanceled
{
  return self->_isCanceled;
}

- (void)setIsCanceled:(BOOL)a3
{
  self->_isCanceled = a3;
}

- (int64_t)completedUnitCount
{
  return self->_completedUnitCount;
}

- (void)setCompletedUnitCount:(int64_t)a3
{
  self->_completedUnitCount = a3;
}

- (int64_t)totalUnitCount
{
  return self->_totalUnitCount;
}

- (void)setTotalUnitCount:(int64_t)a3
{
  self->_totalUnitCount = a3;
}

- (NSString)requestClassName
{
  return self->_requestClassName;
}

- (void)setRequestClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestClassName, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_resultObject, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
