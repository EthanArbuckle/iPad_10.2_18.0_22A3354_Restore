@implementation _NSCoreDataOptimisticLockingException

- (_NSCoreDataOptimisticLockingException)initWithName:(id)a3 reason:(id)a4 userInfo:(id)a5
{
  void *v9;
  void *v10;
  id v11;
  _NSCoreDataOptimisticLockingException *v12;
  objc_super v14;

  if (objc_msgSend(a5, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", a5);
    objc_msgSend(v9, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("NSExceptionOmitCallstacks"));
    v10 = (void *)objc_msgSend(v9, "copy");

  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0C99D80]);
    v10 = (void *)objc_msgSend(v11, "initWithObjectsAndKeys:", MEMORY[0x1E0C9AAB0], CFSTR("NSExceptionOmitCallstacks"), 0);
  }
  v14.receiver = self;
  v14.super_class = (Class)_NSCoreDataOptimisticLockingException;
  v12 = -[_NSCoreDataOptimisticLockingException initWithName:reason:userInfo:](&v14, sel_initWithName_reason_userInfo_, a3, a4, v10);

  return v12;
}

- (id)errorObjectWithUserInfo:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v4 = (void *)-[_NSCoreDataOptimisticLockingException userInfo](self, "userInfo");
  if (a3)
  {
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v5, "addEntriesFromDictionary:", a3);
    v6 = (id)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = v4;
  }
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134050, v6);

  return v7;
}

@end
