@implementation WFMediaRoutePickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFMediaRoutePickerParameter)initWithDefinition:(id)a3
{
  WFMediaRoutePickerParameter *v3;
  WFMediaRoutePickerParameter *v4;
  WFMediaRoutePickerParameter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFMediaRoutePickerParameter;
  v3 = -[WFMediaRoutePickerParameter initWithDefinition:](&v7, sel_initWithDefinition_, a3);
  v4 = v3;
  if (v3)
  {
    -[WFDynamicEnumerationParameter setDataSource:](v3, "setDataSource:", v3);
    v5 = v4;
  }

  return v4;
}

- (int64_t)routeType
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  int64_t v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[WFMediaRoutePickerParameter definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RouteType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v5 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v11 = 136315906;
      v12 = "WFEnforceClass";
      v13 = 2114;
      v14 = v5;
      v15 = 2114;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v4;
      v8 = v16;
      _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v11, 0x2Au);

    }
    v6 = 0;
  }
  else
  {
    v6 = v5;
  }

  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Endpoint")) & 1) != 0)
  {
    v9 = 1;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("HandoffEndpoint")) & 1) != 0)
  {
    v9 = 2;
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("ListeningModeCapableOutputDevice")))
  {
    v9 = 3;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (WFMediaRoutePicker)routePicker
{
  WFMediaRoutePicker *routePicker;
  WFMediaRoutePicker *v4;
  WFMediaRoutePicker *v5;

  routePicker = self->_routePicker;
  if (!routePicker)
  {
    v4 = -[WFMediaRoutePicker initWithRouteType:]([WFMediaRoutePicker alloc], "initWithRouteType:", -[WFMediaRoutePickerParameter routeType](self, "routeType"));
    v5 = self->_routePicker;
    self->_routePicker = v4;

    routePicker = self->_routePicker;
  }
  return routePicker;
}

- (void)startDiscoveringRoutes
{
  id v3;

  -[WFMediaRoutePickerParameter routePicker](self, "routePicker");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAvailableRoutesObserver:", self);

}

- (void)stopDiscoveringRoutes
{
  id v3;

  -[WFMediaRoutePickerParameter routePicker](self, "routePicker");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAvailableRoutesObserver:", self);

}

- (id)defaultSerializedRepresentationForEnumeration:(id)a3
{
  void *v3;
  void *v4;

  if (-[WFMediaRoutePickerParameter shouldDefaultToLocalDeviceEndpoint](self, "shouldDefaultToLocalDeviceEndpoint", a3))
  {
    WFGetLocalDeviceMediaRoute();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v3, "serializedRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void (**v10)(id, void *, _QWORD);

  v10 = (void (**)(id, void *, _QWORD))a5;
  -[WFDynamicEnumerationParameter possibleStates](self, "possibleStates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BDD9ED0]);
    -[WFDynamicEnumerationParameter possibleStates](self, "possibleStates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithItems:", v8);

  }
  else
  {
    v9 = 0;
  }
  v10[2](v10, v9, 0);

}

- (BOOL)preferParameterValuePicker
{
  return 1;
}

- (BOOL)shouldDefaultToLocalDeviceEndpoint
{
  void *v2;
  void *v3;
  char v4;

  -[WFMediaRoutePickerParameter definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BEC4518]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Local"));

  return v4;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a4, "value", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "routeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sortedStatesForAvailableRoutes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__17693;
  v20 = __Block_byref_object_dispose__17694;
  v21 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __62__WFMediaRoutePickerParameter_sortedStatesForAvailableRoutes___block_invoke;
  v15[3] = &unk_24F8B3C30;
  v15[4] = self;
  v15[5] = &v16;
  objc_msgSend(v4, "if_compactMap:", v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("value.routeName"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WFMediaRoutePickerParameter routeType](self, "routeType") == 3)
  {
    v9 = v8;
  }
  else
  {
    v10 = (void *)objc_msgSend(v8, "mutableCopy");
    v9 = v10;
    if (v17[5])
    {
      objc_msgSend(v10, "removeObject:");
      objc_msgSend(v9, "insertObject:atIndex:", v17[5], 0);
    }
    else
    {
      WFGetLocalDeviceMediaRoute();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v17[5];
      v17[5] = v11;

      v13 = v17[5];
      if (v13)
        objc_msgSend(v9, "insertObject:atIndex:", v13, 0);
    }
  }

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (BOOL)parameterStateIsValid:(id)a3
{
  return 1;
}

- (id)accessoryImageForPossibleState:(id)a3
{
  id v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLocalDevice");

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BEC14E0]);
    objc_msgSend(getMPAVRoutingControllerClass(), "_currentDeviceRoutingIconImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithPlatformImage:", v7);
  }
  else
  {
    objc_msgSend(v3, "route");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v9 = objc_alloc(MEMORY[0x24BEC14E0]);
      objc_msgSend(getMPAVRoutingControllerClass(), "_iconImageForRoute:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v9, "initWithPlatformImage:", v10);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)hidesAccessoryIconInEditor
{
  return 1;
}

- (BOOL)liveUpdatesPossibleStatesInEditor
{
  return 1;
}

- (void)routePickerDidUpdateAvailableRoutes:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__WFMediaRoutePickerParameter_routePickerDidUpdateAvailableRoutes___block_invoke;
  v6[3] = &unk_24F8BA480;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

- (void)setRoutePicker:(id)a3
{
  objc_storeStrong((id *)&self->_routePicker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routePicker, 0);
}

void __67__WFMediaRoutePickerParameter_routePickerDidUpdateAvailableRoutes___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "availableRoutes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedStatesForAvailableRoutes:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  if (v6)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9ED0]), "initWithItems:", v6);
    objc_msgSend(v4, "setPossibleStatesCollection:", v5);

  }
  else
  {
    objc_msgSend(v4, "setPossibleStatesCollection:", 0);
  }

}

WFMediaRouteState *__62__WFMediaRoutePickerParameter_sortedStatesForAvailableRoutes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  WFMediaRouteState *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "routeType") != 3)
    goto LABEL_7;
  if (!v3)
    goto LABEL_9;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v4 = (void *)getMPAVOutputDeviceRouteClass_softClass;
  v14 = getMPAVOutputDeviceRouteClass_softClass;
  if (!getMPAVOutputDeviceRouteClass_softClass)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __getMPAVOutputDeviceRouteClass_block_invoke;
    v10[3] = &unk_24F8BB430;
    v10[4] = &v11;
    __getMPAVOutputDeviceRouteClass_block_invoke((uint64_t)v10);
    v4 = (void *)v12[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v11, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (WFAvailableListeningModesForRoute(v3),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v7 >= 2))
  {
LABEL_7:
    v8 = -[WFMediaRouteState initWithRoute:]([WFMediaRouteState alloc], "initWithRoute:", v3);
    if (objc_msgSend(v3, "isDeviceSpeakerRoute"))
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v8);
  }
  else
  {
LABEL_9:
    v8 = 0;
  }

  return v8;
}

- (BOOL)wf_alwaysScaleIconImage
{
  return 1;
}

@end
