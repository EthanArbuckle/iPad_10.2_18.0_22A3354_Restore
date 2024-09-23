@implementation WFMediaRouteState

- (WFMediaRouteState)initWithRoute:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  WFMediaRouteDescriptor *v9;
  WFMediaRouteState *v10;
  WFMediaRouteState *v11;
  WFMediaRouteState *v12;
  objc_super v14;

  v5 = a3;
  objc_msgSend(v5, "routeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groupUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "routeUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WFMediaRouteDescriptor initWithRouteUID:groupUID:routeName:isLocalDevice:]([WFMediaRouteDescriptor alloc], "initWithRouteUID:groupUID:routeName:isLocalDevice:", v8, v7, v6, objc_msgSend(v5, "isDeviceSpeakerRoute"));
  v14.receiver = self;
  v14.super_class = (Class)WFMediaRouteState;
  v10 = -[WFVariableSubstitutableParameterState initWithValue:](&v14, sel_initWithValue_, v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_route, a3);
    v12 = v11;
  }

  return v11;
}

- (MPAVRoute)route
{
  return self->_route;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFMediaRouteState.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[value isKindOfClass:[WFMediaRouteDescriptor class]]"));

    if (v5)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x24BEC3FA0], "JSONDictionaryFromModel:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v6;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = v5;
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v13 = 136315906;
      v14 = "WFEnforceClass";
      v15 = 2114;
      v16 = v7;
      v17 = 2114;
      v18 = (id)objc_opt_class();
      v19 = 2114;
      v20 = v6;
      v10 = v18;
      _os_log_impl(&dword_22D353000, v9, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v13, 0x2Au);

    }
    v8 = 0;
  }
  else
  {
    v8 = v7;
  }

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x24BEC3FA0], "modelOfClass:fromJSONDictionary:error:", objc_opt_class(), v8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
