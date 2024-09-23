@implementation JSValue(DataBinding)

- (id)ikdt_prototype
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "isObject"))
    return 0;
  objc_msgSend(a1, "_ikdt_globalObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("getPrototypeOf"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = a1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "callWithArguments:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)ikdt_isArray
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "ikdt_prototype");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isArray");

  return v2;
}

- (uint64_t)ikdt_isObject
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "ikdt_prototype");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isObject");

  return v2;
}

- (id)_ikdt_globalObject
{
  void *v0;
  void *v1;
  void *v2;

  +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "jsContext");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("Object"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
