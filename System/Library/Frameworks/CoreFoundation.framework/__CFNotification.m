@implementation __CFNotification

- (__CFNotification)initWithName:(__CFString *)a3 object:(const void *)a4 userInfo:(__CFDictionary *)a5 foundation:(BOOL)a6
{
  __CFNotification *v6;
  void *v10;

  v6 = self;
  if (a3)
  {
    if (a6)
    {
      self->_name = (id)-[__CFString copy](a3, "copy");
      v6->_userInfo = a5;
      a4 = (id)a4;
    }
    else
    {
      self->_name = (id)CFRetain(a3);
      if (a5)
        v10 = (void *)CFRetain(a5);
      else
        v10 = 0;
      v6->_userInfo = v10;
    }
    v6->_object = (id)a4;
    v6->_fouSemantics = a6;
  }
  else
  {

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  _BOOL4 fouSemantics;
  id name;
  id userInfo;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  fouSemantics = self->_fouSemantics;
  name = self->_name;
  if (fouSemantics)
  {

  }
  else
  {
    if (name)
      CFRelease(name);
    userInfo = self->_userInfo;
    if (userInfo)
      CFRelease(userInfo);
  }
  v6.receiver = self;
  v6.super_class = (Class)__CFNotification;
  -[__CFNotification dealloc](&v6, sel_dealloc);
}

- (id)name
{
  return self->_name;
}

- (id)object
{
  return self->_object;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (unint64_t)hash
{
  return objc_msgSend(-[__CFNotification name](self, "name"), "hash");
}

- (BOOL)isEqual:(id)a3
{
  Class v5;
  int v6;
  id v7;

  if (a3 == self)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  if (!a3)
    goto LABEL_8;
  objc_lookUpClass("__CFNotification");
  v5 = objc_lookUpClass("NSNotification");
  if ((objc_opt_isKindOfClass() & 1) == 0 && (!v5 || (objc_opt_isKindOfClass() & 1) == 0))
    goto LABEL_8;
  v6 = objc_msgSend(-[__CFNotification name](self, "name"), "isEqual:", objc_msgSend(a3, "name"));
  if (!v6)
    return v6;
  v7 = -[__CFNotification object](self, "object");
  if (v7 == (id)objc_msgSend(a3, "object"))
    LOBYTE(v6) = objc_msgSend(-[__CFNotification userInfo](self, "userInfo"), "isEqual:", objc_msgSend(a3, "userInfo"));
  else
LABEL_8:
    LOBYTE(v6) = 0;
  return v6;
}

@end
