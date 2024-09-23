@implementation IKJSWeakMap

- (IKJSWeakMap)initWithAppContext:(id)a3
{
  id v4;
  IKJSWeakMap *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  JSManagedValue *managedWeakMap;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IKJSWeakMap;
  v5 = -[IKJSObject initWithAppContext:](&v14, sel_initWithAppContext_, v4);
  if (v5)
  {
    objc_msgSend(v4, "jsContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("WeakMap"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constructWithArguments:", MEMORY[0x1E0C9AA60]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0CBE0F8];
    objc_msgSend(v4, "jsApp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "managedValueWithValue:andOwner:", v8, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    managedWeakMap = v5->_managedWeakMap;
    v5->_managedWeakMap = (JSManagedValue *)v11;

  }
  return v5;
}

- (void)setValue:(id)a3 forWeakKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[IKJSWeakMap _jsWeakMap](self, "_jsWeakMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (id)objc_msgSend(v8, "invokeMethod:withArguments:", CFSTR("set"), v9);
}

- (id)valueForWeakKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IKJSWeakMap _jsWeakMap](self, "_jsWeakMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "invokeMethod:withArguments:", CFSTR("get"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (OpaqueJSValue)valueRefForWeakKeyRef:(OpaqueJSValue *)a3
{
  void *v5;
  void *v6;
  const OpaqueJSContext *v7;
  void *v8;
  OpaqueJSValue *v9;
  OpaqueJSString *v10;
  const OpaqueJSValue *Property;
  OpaqueJSValue *v12;
  OpaqueJSValue *v13;
  JSValueRef v15[2];

  v15[1] = *(JSValueRef *)MEMORY[0x1E0C80C00];
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (const OpaqueJSContext *)objc_msgSend(v6, "JSGlobalContextRef");
  -[IKJSWeakMap _jsWeakMap](self, "_jsWeakMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = JSValueToObject(v7, (JSValueRef)objc_msgSend(v8, "JSValueRef"), 0);

  v10 = JSStringCreateWithCFString(CFSTR("get"));
  Property = JSObjectGetProperty(v7, v9, v10, 0);
  v12 = JSValueToObject(v7, Property, 0);
  JSStringRelease(v10);
  v15[0] = a3;
  v13 = JSObjectCallAsFunction(v7, v12, v9, 1uLL, v15, 0);

  return v13;
}

- (id)_jsWeakMap
{
  void *v2;
  void *v3;

  -[IKJSWeakMap managedWeakMap](self, "managedWeakMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (JSManagedValue)managedWeakMap
{
  return self->_managedWeakMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedWeakMap, 0);
}

@end
