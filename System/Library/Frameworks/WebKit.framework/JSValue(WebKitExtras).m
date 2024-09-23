@implementation JSValue(WebKitExtras)

- (id)_toJSONString
{
  void *v2;
  WebKit *v3;
  const OpaqueJSContext *v4;
  const OpaqueJSValue **v5;
  void *v6;

  objc_msgSend(a1, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (WebKit *)objc_msgSend(v2, "JSGlobalContextRef");
  v4 = (const OpaqueJSContext *)objc_msgSend(a1, "JSValueRef");
  WebKit::serializeJSObject(v3, v4, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_toSortedJSONString
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a1, "_toJSONString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dataUsingEncoding:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v2, 4, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 6, 0);
      v4 = objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
        v2 = (void *)v4;
LABEL_8:

        return v5;
      }
      v2 = 0;
    }
    v5 = 0;
    goto LABEL_8;
  }
  v5 = 0;
  return v5;
}

- (BOOL)_isFunction
{
  void *v2;
  const OpaqueJSContext *v3;
  const OpaqueJSValue *v4;
  const OpaqueJSValue *v5;
  OpaqueJSValue *v6;

  objc_msgSend(a1, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (const OpaqueJSContext *)objc_msgSend(v2, "JSGlobalContextRef");

  v4 = (const OpaqueJSValue *)objc_msgSend(a1, "JSValueRef");
  if (v4 && (v5 = v4, JSValueIsObject(v3, v4)) && (v6 = JSValueToObject(v3, v5, 0)) != 0)
    return JSObjectIsFunction(v3, v6);
  else
    return 0;
}

- (uint64_t)_isDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (!objc_msgSend(a1, "isObject"))
    return 0;
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("__proto__"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Object"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("prototype"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToObject:", v5))
    v6 = objc_msgSend(a1, "_isThenable") ^ 1;
  else
    v6 = 0;

  return v6;
}

- (uint64_t)_isRegularExpression
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (!objc_msgSend(a1, "isObject"))
    return 0;
  objc_msgSend(a1, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("RegExp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "isInstanceOf:", v3);

  return v4;
}

- (uint64_t)_isThenable
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (!objc_msgSend(a1, "isObject"))
    return 0;
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("then"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  WTF::dynamic_objc_cast<JSValue>(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isFunction");

  return v4;
}

- (void)_awaitThenableResolutionWithCompletionHandler:()WebKitExtras
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD aBlock[4];
  id v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__JSValue_WebKitExtras___awaitThenableResolutionWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E34B0120;
  v6 = v4;
  v17 = v6;
  v7 = _Block_copy(aBlock);
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __71__JSValue_WebKitExtras___awaitThenableResolutionWithCompletionHandler___block_invoke_2;
  v14[3] = &unk_1E34B0120;
  v8 = v6;
  v15 = v8;
  v9 = _Block_copy(v14);
  v10 = _Block_copy(v7);
  v18[0] = v10;
  v11 = _Block_copy(v9);
  v18[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(a1, "invokeMethod:withArguments:", CFSTR("then"), v12);

}

@end
