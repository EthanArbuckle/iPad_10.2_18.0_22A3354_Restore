@implementation _NSCoreDataException

+ (id)exceptionWithName:(uint64_t)a3 code:(uint64_t)a4 reason:(void *)a5 userInfo:
{
  id v9;

  v9 = objc_alloc((Class)objc_opt_self());
  return -[_NSCoreDataException initWithName:code:reason:userInfo:](v9, a2, a3, a4, a5);
}

- (id)initWithName:(uint64_t)a3 code:(uint64_t)a4 reason:(void *)a5 userInfo:
{
  id v5;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  if (result)
  {
    v5 = a5;
    v9 = result;
    v10 = *MEMORY[0x1E0CB3388];
    v11 = (void *)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CB3388]);
    if (!a3)
    {
      v12 = v11;
      if (v11)
      {
        a3 = objc_msgSend(v11, "code");
        if (v5)
        {
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v5);
          if (objc_msgSend(v12, "userInfo"))
            objc_msgSend(v13, "addEntriesFromDictionary:", objc_msgSend(v12, "userInfo"));
          objc_msgSend(v13, "removeObjectForKey:", v10);
          v5 = (id)objc_msgSend(v13, "copy");

        }
        else
        {
          v5 = (id)objc_msgSend(v12, "userInfo");
        }
      }
      else
      {
        a3 = 134060;
      }
    }
    v14.receiver = v9;
    v14.super_class = (Class)_NSCoreDataException;
    result = objc_msgSendSuper2(&v14, sel_initWithName_reason_userInfo_, a2, a4, v5);
    if (result)
      *((_QWORD *)result + 5) = a3;
  }
  return result;
}

- (_NSCoreDataException)initWithName:(id)a3 reason:(id)a4 userInfo:(id)a5
{
  return (_NSCoreDataException *)-[_NSCoreDataException initWithName:code:reason:userInfo:](self, (uint64_t)a3, 0, (uint64_t)a4, a5);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSCoreDataException;
  -[_NSCoreDataException dealloc](&v3, sel_dealloc);
}

- (uint64_t)_setDomain:(uint64_t)result
{
  uint64_t v3;
  void *v4;

  if (result)
  {
    v3 = result;
    v4 = *(void **)(result + 48);
    if (v4 != a2)
    {

      result = objc_msgSend(a2, "copy");
      *(_QWORD *)(v3 + 48) = result;
    }
  }
  return result;
}

- (id)errorObjectWithUserInfo:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  NSString *domain;
  int64_t code;
  void *v10;

  v5 = (void *)-[_NSCoreDataException userInfo](self, "userInfo");
  if (a3)
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v6, "addEntriesFromDictionary:", a3);
    v7 = (id)objc_msgSend(v6, "copy");

  }
  else
  {
    v7 = v5;
  }
  if (self)
  {
    if (self->_domain)
      domain = self->_domain;
    else
      domain = (NSString *)*MEMORY[0x1E0CB28A8];
    if (self->_code)
      code = self->_code;
    else
      code = 134060;
  }
  else
  {
    domain = 0;
    code = 0;
  }
  v10 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", domain, code, v7);

  return v10;
}

@end
