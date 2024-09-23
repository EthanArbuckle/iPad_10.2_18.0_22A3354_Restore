@implementation WFRequestRideIntentAction

- (id)disabledOnPlatforms
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFRequestRideIntentAction;
  -[WFHandleIntentAction disabledOnPlatforms](&v5, sel_disabledOnPlatforms);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", *MEMORY[0x24BEC43E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (WFRequestRideIntentAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  WFRequestRideIntentAction *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  WFRideOptionsLoader *v12;
  WFRideOptionsLoader *rideOptionsLoader;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  WFRequestRideIntentAction *v35;
  objc_super v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v37.receiver = self;
  v37.super_class = (Class)WFRequestRideIntentAction;
  v5 = -[WFHandleIntentAction initWithIdentifier:definition:serializedParameters:](&v37, sel_initWithIdentifier_definition_serializedParameters_, a3, a4, a5);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD9BF8];
    v38 = *MEMORY[0x24BDD9828];
    v39[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "optionsWithDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD9BF0], "sharedResolver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOptions:forIntentClassName:", v8, v11);

    v12 = objc_alloc_init(WFRideOptionsLoader);
    rideOptionsLoader = v5->_rideOptionsLoader;
    v5->_rideOptionsLoader = v12;

    -[WFRequestRideIntentAction rideOptionsLoader](v5, "rideOptionsLoader");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDelegate:", v5);

    -[WFHandleSystemIntentAction intentDescriptor](v5, "intentDescriptor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRequestRideIntentAction rideOptionsLoader](v5, "rideOptionsLoader");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAppBundleIdentifier:", v16);

    -[WFRequestRideIntentAction parameterStateForKey:fallingBackToDefaultValue:](v5, "parameterStateForKey:fallingBackToDefaultValue:", WFRequestRideActionDropOffLocationParameterKey, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
    }
    else
    {
      v19 = 0;
    }
    v20 = v19;

    objc_msgSend(v20, "value");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "placemark");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRequestRideIntentAction rideOptionsLoader](v5, "rideOptionsLoader");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDropOffLocation:", v22);

    -[WFRequestRideIntentAction parameterStateForKey:fallingBackToDefaultValue:](v5, "parameterStateForKey:fallingBackToDefaultValue:", WFRequestRideActionPickupLocationParameterKey, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v25 = v24;
      else
        v25 = 0;
    }
    else
    {
      v25 = 0;
    }
    v26 = v25;

    objc_msgSend(v26, "value");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "placemark");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRequestRideIntentAction rideOptionsLoader](v5, "rideOptionsLoader");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setPickupLocation:", v28);

    -[WFRequestRideIntentAction rideOptionsLoader](v5, "rideOptionsLoader");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRequestRideIntentAction addEventObserver:](v5, "addEventObserver:", v30);

    -[WFRequestRideIntentAction parameterForKey:](v5, "parameterForKey:", WFRequestRideActionRideOptionParameterKey);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRequestRideIntentAction rideOptionsLoader](v5, "rideOptionsLoader");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setRideOptionParameterParameter:", v31);

    objc_msgSend(v31, "setAction:", v5);
    -[WFRequestRideIntentAction parameterForKey:](v5, "parameterForKey:", WFRequestRideActionPaymentMethodParameterKey);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRequestRideIntentAction rideOptionsLoader](v5, "rideOptionsLoader");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setPaymentMethodParameterParameter:", v33);

    v35 = v5;
  }

  return v5;
}

- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  objc_super v19;
  _QWORD v20[4];
  id v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v12, "wf_slotName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("dropOffLocation"));

  if (v18)
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __87__WFRequestRideIntentAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke;
    v20[3] = &unk_24F8B8168;
    v21 = v16;
    objc_msgSend(v15, "getObjectRepresentation:forClass:", v20, getCLPlacemarkClass_39691());

  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)WFRequestRideIntentAction;
    -[WFHandleIntentAction resolveSlot:withProcessedValue:parameter:input:completion:](&v19, sel_resolveSlot_withProcessedValue_parameter_input_completion_, v12, v13, v14, v15, v16);
  }

}

- (void)getOutputFromIntentResponse:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRequestRideIntentAction.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_14:
      v8[2](v8, 0);
      goto LABEL_15;
    }
    if (v7)
      goto LABEL_8;
LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  if (!v7)
    goto LABEL_11;
LABEL_8:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
LABEL_12:
  v10 = v9;

  objc_msgSend(v10, "rideStatus");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_14;
  objc_msgSend(MEMORY[0x24BE19450], "itemWithObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BE19438];
  v17[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "collectionWithItems:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *))v8)[2](v8, v15);

LABEL_15:
}

- (void)handleExecutionCompletionWithInteraction:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "intentResponse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v8 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v8, "rideStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "phase");

  if (v10 > 1)
  {
LABEL_6:
    v16.receiver = self;
    v16.super_class = (Class)WFRequestRideIntentAction;
    -[WFHandleIntentAction handleExecutionCompletionWithInteraction:error:](&v16, sel_handleExecutionCompletionWithInteraction_error_, v6, v7);
    goto LABEL_7;
  }
  -[WFRequestRideIntentAction setRequestRideInteraction:](self, "setRequestRideInteraction:", v6);
  v11 = (void *)objc_opt_new();
  -[WFHandleIntentAction appBundleIdentifier](self, "appBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setLaunchId:", v12);

  objc_msgSend(v11, "_setExecutionContext:", 7);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC3E18]), "initWithIntent:donateInteraction:groupIdentifier:", v11, 0, 0);
  -[WFRequestRideIntentAction setRideStatusExecutor:](self, "setRideStatusExecutor:", v13);

  -[WFRequestRideIntentAction rideStatusExecutor](self, "rideStatusExecutor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegate:", self);

  -[WFRequestRideIntentAction rideStatusExecutor](self, "rideStatusExecutor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startReceivingRideStatusUpdates");

LABEL_7:
}

- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;

  v5 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v5, "_codableDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributeByName:", CFSTR("pickupLocation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRequestRideIntentAction parameterForKey:](self, "parameterForKey:", WFRequestRideActionPickupLocationParameterKey);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pickupLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v8;
    objc_msgSend(v8, "definition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v7;
    objc_msgSend(v7, "wf_parameterStateForIntentValue:parameterDefinition:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serializedRepresentation");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "attributeByName:", CFSTR("dropOffLocation"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRequestRideIntentAction parameterForKey:](self, "parameterForKey:", WFRequestRideActionDropOffLocationParameterKey);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dropOffLocation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v13;
    objc_msgSend(v13, "definition");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v12;
    objc_msgSend(v12, "wf_parameterStateForIntentValue:parameterDefinition:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "serializedRepresentation");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "attributeByName:", CFSTR("rideOptionName"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRequestRideIntentAction parameterForKey:](self, "parameterForKey:", WFRequestRideActionRideOptionParameterKey);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rideOptionName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v18;
    objc_msgSend(v18, "definition");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v17;
    objc_msgSend(v17, "wf_parameterStateForIntentValue:parameterDefinition:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "serializedRepresentation");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "attributeByName:", CFSTR("partySize"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRequestRideIntentAction parameterForKey:](self, "parameterForKey:", WFRequestRideActionPartySizeParameterKey);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "partySize");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v23;
    objc_msgSend(v23, "definition");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v22;
    objc_msgSend(v22, "wf_parameterStateForIntentValue:parameterDefinition:", v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "serializedRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "attributeByName:", CFSTR("paymentMethod"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRequestRideIntentAction parameterForKey:](self, "parameterForKey:", WFRequestRideActionPaymentMethodParameterKey);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "paymentMethod");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "definition");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "wf_parameterStateForIntentValue:parameterDefinition:", v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "serializedRepresentation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v35 = v34;
    if (v52)
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v52, WFRequestRideActionPickupLocationParameterKey);
    if (v51)
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v51, WFRequestRideActionDropOffLocationParameterKey);
    if (v50)
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v50, WFRequestRideActionRideOptionParameterKey);
    if (v27)
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v27, WFRequestRideActionPartySizeParameterKey);
    if (v33)
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v33, WFRequestRideActionPaymentMethodParameterKey);
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9DD0]), "initWithIntent:", v5);
    objc_msgSend(MEMORY[0x24BDD9BF0], "sharedResolver");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "resolvedIntentMatchingDescriptor:", v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "appDescriptor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "serializedRepresentation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v40, *MEMORY[0x24BEC4410]);

  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (id)mustVerifyCredentialsError
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedString(CFSTR("Sign In Required"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Your current credentials are invalid. You must sign into the app in order to request a ride."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = *MEMORY[0x24BEC4270];
  v7 = *MEMORY[0x24BDD0FC8];
  v12[0] = *MEMORY[0x24BDD0FD8];
  v12[1] = v7;
  v13[0] = v3;
  v13[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleIntentAction errorThatLaunchesApp:](self, "errorThatLaunchesApp:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)noServiceInAreaError
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedString(CFSTR("No Service Available"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("There is no service available in the requested area."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = *MEMORY[0x24BEC4270];
  v7 = *MEMORY[0x24BDD0FC8];
  v12[0] = *MEMORY[0x24BDD0FD8];
  v12[1] = v7;
  v13[0] = v3;
  v13[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleIntentAction errorThatLaunchesApp:](self, "errorThatLaunchesApp:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)serviceTemporarilyUnavailableError
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedString(CFSTR("Service Temporarily Unavailable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Service is temporarily unavailable. Please try again later."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = *MEMORY[0x24BEC4270];
  v7 = *MEMORY[0x24BDD0FC8];
  v12[0] = *MEMORY[0x24BDD0FD8];
  v12[1] = v7;
  v13[0] = v3;
  v13[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleIntentAction errorThatLaunchesApp:](self, "errorThatLaunchesApp:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)previousRideNeedsCompletionError
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedString(CFSTR("Ride Not Completed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("A previous ride needs your feedback before you can request a new ride."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = *MEMORY[0x24BEC4270];
  v7 = *MEMORY[0x24BDD0FC8];
  v12[0] = *MEMORY[0x24BDD0FD8];
  v12[1] = v7;
  v13[0] = v3;
  v13[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleIntentAction errorThatLaunchesApp:](self, "errorThatLaunchesApp:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)rideScheduledTooFarError
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedString(CFSTR("Too Far in Advance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("The scheduled ride time is too far in advance."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BEC4270];
  v6 = *MEMORY[0x24BDD0FC8];
  v10[0] = *MEMORY[0x24BDD0FD8];
  v10[1] = v6;
  v11[0] = v2;
  v11[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)previousRideNeedsFeedback
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedString(CFSTR("Feedback Required"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Your previous ride needs your feedback. Please give your feedback in the app."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = *MEMORY[0x24BEC4270];
  v7 = *MEMORY[0x24BDD0FC8];
  v12[0] = *MEMORY[0x24BDD0FD8];
  v12[1] = v7;
  v13[0] = v3;
  v13[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleIntentAction errorThatLaunchesApp:](self, "errorThatLaunchesApp:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)errorFromListRideOptionsResponse:(id)a3 intent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  char isKindOfClass;
  void *v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;
  v10 = v7;
  if (v10)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v12 = 0;
    if (v9 && (isKindOfClass & 1) != 0)
    {
      switch(objc_msgSend(v9, "code"))
      {
        case 6:
          -[WFRequestRideIntentAction mustVerifyCredentialsError](self, "mustVerifyCredentialsError");
          v13 = objc_claimAutoreleasedReturnValue();
          break;
        case 7:
          -[WFRequestRideIntentAction noServiceInAreaError](self, "noServiceInAreaError");
          v13 = objc_claimAutoreleasedReturnValue();
          break;
        case 8:
          -[WFRequestRideIntentAction serviceTemporarilyUnavailableError](self, "serviceTemporarilyUnavailableError");
          v13 = objc_claimAutoreleasedReturnValue();
          break;
        case 9:
          -[WFRequestRideIntentAction previousRideNeedsCompletionError](self, "previousRideNeedsCompletionError");
          v13 = objc_claimAutoreleasedReturnValue();
          break;
        case 10:
          -[WFRequestRideIntentAction previousRideNeedsFeedback](self, "previousRideNeedsFeedback");
          v13 = objc_claimAutoreleasedReturnValue();
          break;
        default:
          goto LABEL_11;
      }
      v12 = (void *)v13;
    }
  }
  else
  {
LABEL_11:
    v12 = 0;
  }

  return v12;
}

- (id)errorFromRequestRideResponse:(id)a3 intent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  char isKindOfClass;
  void *v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;
  v10 = v7;
  if (v10)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v12 = 0;
    if (v9 && (isKindOfClass & 1) != 0)
    {
      switch(objc_msgSend(v9, "code"))
      {
        case 6:
          -[WFRequestRideIntentAction mustVerifyCredentialsError](self, "mustVerifyCredentialsError");
          v13 = objc_claimAutoreleasedReturnValue();
          break;
        case 7:
          -[WFRequestRideIntentAction noServiceInAreaError](self, "noServiceInAreaError");
          v13 = objc_claimAutoreleasedReturnValue();
          break;
        case 8:
          -[WFRequestRideIntentAction serviceTemporarilyUnavailableError](self, "serviceTemporarilyUnavailableError");
          v13 = objc_claimAutoreleasedReturnValue();
          break;
        case 9:
          -[WFRequestRideIntentAction previousRideNeedsCompletionError](self, "previousRideNeedsCompletionError");
          v13 = objc_claimAutoreleasedReturnValue();
          break;
        case 10:
          -[WFRequestRideIntentAction rideScheduledTooFarError](self, "rideScheduledTooFarError");
          v13 = objc_claimAutoreleasedReturnValue();
          break;
        default:
          goto LABEL_11;
      }
      v12 = (void *)v13;
    }
  }
  else
  {
LABEL_11:
    v12 = 0;
  }

  return v12;
}

- (id)errorFromConfirmResponse:(id)a3 intent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  -[WFRequestRideIntentAction errorFromRequestRideResponse:intent:](self, "errorFromRequestRideResponse:intent:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFRequestRideIntentAction;
    -[WFHandleIntentAction errorFromHandleResponse:intent:](&v13, sel_errorFromHandleResponse_intent_, v6, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)errorFromHandleResponse:(id)a3 intent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  -[WFRequestRideIntentAction errorFromRequestRideResponse:intent:](self, "errorFromRequestRideResponse:intent:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFRequestRideIntentAction;
    -[WFHandleIntentAction errorFromHandleResponse:intent:](&v13, sel_errorFromHandleResponse_intent_, v6, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)displayableAppDescriptor
{
  void *v3;
  void *v4;
  id v5;

  -[WFHandleSystemIntentAction intentDescriptor](self, "intentDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFHandleSystemIntentAction intentDescriptor](self, "intentDescriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x24BDD9BD0]);
    v4 = (void *)objc_msgSend(v5, "initWithBundleIdentifier:", *MEMORY[0x24BEC16E8]);
  }
  return v4;
}

- (void)rideOptionsLoader:(id)a3 errorFromListRideOptionsError:(id)a4 updatedErrorHandler:(id)a5
{
  void (**v7)(id, id);
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v16 = a4;
  v7 = (void (**)(id, id))a5;
  objc_msgSend(v16, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BEC4440]);

  if (!v9)
    goto LABEL_9;
  v10 = objc_msgSend(v16, "code");
  if ((unint64_t)(v10 - 102) >= 2)
  {
    if (v10 == 100)
    {
      -[WFHandleIntentAction getErrorFromExtensionError:completionHandler:](self, "getErrorFromExtensionError:completionHandler:", v16, v7);
      goto LABEL_10;
    }
LABEL_9:
    v7[2](v7, v16);
    goto LABEL_10;
  }
  objc_msgSend(v16, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BEC4448]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BEC4450]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRequestRideIntentAction errorFromListRideOptionsResponse:intent:](self, "errorFromListRideOptionsResponse:intent:", v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = v14;
  else
    v15 = v16;
  v7[2](v7, v15);

LABEL_10:
}

- (void)intentExecutor:(id)a3 receivingRideStatusDidReceiveUpdate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "rideStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "phase");

  if (v9 >= 2)
  {
    -[WFRequestRideIntentAction requestRideInteraction](self, "requestRideInteraction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "intentResponse");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

    objc_msgSend(v7, "rideStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v12, "setRideStatus:", v14);

    -[WFRequestRideIntentAction requestRideInteraction](self, "requestRideInteraction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_setIntentResponse:", v12);

    objc_msgSend(v6, "stopReceivingRideStatusUpdates");
    -[WFRequestRideIntentAction setRideStatusExecutor:](self, "setRideStatusExecutor:", 0);
    -[WFRequestRideIntentAction requestRideInteraction](self, "requestRideInteraction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17.receiver = self;
    v17.super_class = (Class)WFRequestRideIntentAction;
    -[WFHandleIntentAction handleExecutionCompletionWithInteraction:error:](&v17, sel_handleExecutionCompletionWithInteraction_error_, v16, 0);

  }
}

- (void)intentExecutor:(id)a3 receivingRideStatusDidReceiveError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  getWFActionsLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[WFRequestRideIntentAction intentExecutor:receivingRideStatusDidReceiveError:]";
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_ERROR, "%s Get Ride Status failed with %{public}@", buf, 0x16u);
  }

  objc_msgSend(v7, "stopReceivingRideStatusUpdates");
  -[WFRequestRideIntentAction setRideStatusExecutor:](self, "setRideStatusExecutor:", 0);
  -[WFRequestRideIntentAction requestRideInteraction](self, "requestRideInteraction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)WFRequestRideIntentAction;
  -[WFHandleIntentAction handleExecutionCompletionWithInteraction:error:](&v10, sel_handleExecutionCompletionWithInteraction_error_, v9, 0);

}

- (WFRideOptionsLoader)rideOptionsLoader
{
  return self->_rideOptionsLoader;
}

- (WFIntentExecutor)rideStatusExecutor
{
  return self->_rideStatusExecutor;
}

- (void)setRideStatusExecutor:(id)a3
{
  objc_storeStrong((id *)&self->_rideStatusExecutor, a3);
}

- (INInteraction)requestRideInteraction
{
  return self->_requestRideInteraction;
}

- (void)setRequestRideInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_requestRideInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestRideInteraction, 0);
  objc_storeStrong((id *)&self->_rideStatusExecutor, 0);
  objc_storeStrong((id *)&self->_rideOptionsLoader, 0);
}

uint64_t __87__WFRequestRideIntentAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
