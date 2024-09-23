@implementation WFStartCallAction

- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  WFStartCallAction *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    v8 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    v11 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v10 = 0;
    v7 = 0;
    v12 = 0;
  }
  v13 = v12;

  if (v7 || v10 || v13)
  {
    objc_msgSend(v5, "_codableDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("WFCallContact");
    -[WFStartCallAction parameterForKey:](self, "parameterForKey:", CFSTR("WFCallContact"));
    v17 = objc_claimAutoreleasedReturnValue();
    v42 = self;
    if (!v17)
    {
      v16 = CFSTR("WFFaceTimeContact");
      -[WFStartCallAction parameterForKey:](self, "parameterForKey:", CFSTR("WFFaceTimeContact"));
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v17;
    objc_msgSend(v5, "valueForKey:", CFSTR("contacts"));
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "attributeByName:", CFSTR("contacts"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v18;
    objc_msgSend(v18, "definition");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v20;
    v46 = (void *)v19;
    objc_msgSend(v20, "wf_parameterStateForIntentValue:parameterDefinition:", v19, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "serializedRepresentation");
    v23 = objc_claimAutoreleasedReturnValue();

    v24 = CFSTR("Audio");
    if (objc_msgSend(v7, "callCapability") == 1
      || ((v25 = objc_msgSend(v7, "callCapability"), !v10) ? (v26 = CFSTR("Video")) : (v26 = CFSTR("Audio")),
          v25 != 2 ? (v24 = v26) : (v24 = CFSTR("Video")),
          v25 == 2 || v10 || v13))
    {
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC40C8]), "initWithValue:", v24);
      objc_msgSend(v28, "serializedRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v27 = 0;
    }
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
    v14 = v29;
    if (v23)
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v23, v16);
    v44 = (void *)v23;
    if (v27)
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v27, CFSTR("WFFaceTimeType"));
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9DD0]), "initWithIntent:", v5);
    objc_msgSend(MEMORY[0x24BDD9BF0], "sharedResolver");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "resolvedIntentMatchingDescriptor:", v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "bundleIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v32, "serializedRepresentation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v34, *MEMORY[0x24BEC4410]);

    }
    else
    {
      -[WFStartCallAction supportedIdentifiers](v42, "supportedIdentifiers");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "allObjects");
      v41 = v15;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = MEMORY[0x24BDAC760];
      v48[1] = 3221225472;
      v48[2] = __92__WFStartCallAction_serializedParametersForDonatedIntent_allowDroppingUnconfigurableValues___block_invoke;
      v48[3] = &unk_24F8B7B78;
      v49 = v5;
      v50 = v32;
      objc_msgSend(v36, "if_compactMap:", v48);
      v43 = v13;
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v37, "firstObject");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "serializedRepresentation");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v39, *MEMORY[0x24BEC4410]);

      v15 = v41;
      v13 = v43;

    }
  }
  else
  {
    v7 = 0;
    v14 = 0;
  }

  return v14;
}

- (id)communicationMethod
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id *v15;
  id v16;
  id v17;

  -[WFStartCallAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFCallContact"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "communicationMethod");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[WFStartCallAction processedParameters](self, "processedParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WFCallContact"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_opt_class();
      v7 = (objc_opt_isKindOfClass() & 1) != 0 ? v6 : 0;
    }
    else
    {
      v7 = 0;
    }
    v8 = v7;

    objc_msgSend(v8, "communicationMethod");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[WFStartCallAction definition](self, "definition");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("WFStartCallActionType"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (id)*MEMORY[0x24BE19750];
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("FaceTime")))
      {
        v12 = (id)*MEMORY[0x24BE19748];

        v13 = (id)*MEMORY[0x24BEC16F8];
        v11 = v12;
      }
      else
      {
        v13 = 0;
      }
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("FaceTime")))
        goto LABEL_18;
      -[WFStartCallAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFFaceTimeType"), objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "isEqualToString:", CFSTR("Audio")) & 1) != 0)
      {
        v15 = (id *)MEMORY[0x24BE19748];
      }
      else
      {
        if (!objc_msgSend(v14, "isEqualToString:", CFSTR("Video")))
        {
LABEL_17:
          v17 = (id)*MEMORY[0x24BEC16C0];

          v13 = v17;
LABEL_18:
          v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE19400]), "initWithBundleIdentifier:type:", v13, v11);

          goto LABEL_19;
        }
        v15 = (id *)MEMORY[0x24BE19758];
      }
      v16 = *v15;

      v11 = v16;
      goto LABEL_17;
    }
  }
LABEL_19:

  return v4;
}

- (int64_t)callCapability
{
  void *v2;
  int64_t v3;

  -[WFStartCallAction communicationMethod](self, "communicationMethod");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "callCapability");

  return v3;
}

- (int64_t)preferredCallProvider
{
  void *v2;
  int64_t v3;

  -[WFStartCallAction communicationMethod](self, "communicationMethod");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preferredCallProvider");

  return v3;
}

- (id)localizedCallServiceName
{
  int64_t v3;
  __CFString *v4;
  void *v5;

  if (-[WFStartCallAction preferredCallProvider](self, "preferredCallProvider") != 2)
  {
    if (-[WFStartCallAction isRunningOniPad](self, "isRunningOniPad")
      && -[WFStartCallAction preferredCallProvider](self, "preferredCallProvider") == 1)
    {
      v4 = CFSTR("Phone");
      goto LABEL_8;
    }
LABEL_9:
    -[WFHandleSystemIntentAction localizedAppName](self, "localizedAppName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  v3 = -[WFStartCallAction callCapability](self, "callCapability");
  if (v3 == 1)
  {
    WFLocalizedStringWithKey(CFSTR("FaceTime Audio (error)"), CFSTR("FaceTime Audio"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  if (v3 != 2)
    goto LABEL_9;
  v4 = CFSTR("FaceTime Video");
LABEL_8:
  WFLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (id)localizedKeyParameterDisplayName
{
  return WFLocalizedString(CFSTR("Contact"));
}

- (id)appConfigurationRequiredError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedString(CFSTR("Setup Required"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("%@ is not set up to make calls."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStartCallAction localizedCallServiceName](self, "localizedCallServiceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD1540];
  v9 = *MEMORY[0x24BEC4270];
  v10 = *MEMORY[0x24BDD0FC8];
  v15[0] = *MEMORY[0x24BDD0FD8];
  v15[1] = v10;
  v16[0] = v3;
  v16[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleIntentAction errorThatLaunchesApp:](self, "errorThatLaunchesApp:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)callingServiceNotAvailableError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("%@ Unavailable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStartCallAction localizedCallServiceName](self, "localizedCallServiceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("The call could not be started because %@ is not available."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStartCallAction localizedCallServiceName](self, "localizedCallServiceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD1540];
  v12 = *MEMORY[0x24BEC4270];
  v13 = *MEMORY[0x24BDD0FC8];
  v17[0] = *MEMORY[0x24BDD0FD8];
  v17[1] = v13;
  v18[0] = v6;
  v18[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 5, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)contactNotSupportedByAppErrorForContacts:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  WFLocalizedString(CFSTR("Contact Not Supported"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("The call could not be started because %@ cannot take part in the call."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDD1540];
  v11 = *MEMORY[0x24BEC4270];
  v12 = *MEMORY[0x24BDD0FC8];
  v16[0] = *MEMORY[0x24BDD0FD8];
  v16[1] = v12;
  v17[0] = v4;
  v17[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 5, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)airplaneModeError
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
  WFLocalizedString(CFSTR("Airplane Mode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("The call could not be started because your device is in Airplane Mode."));
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

- (id)disabledInSettingsError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("%@ Disabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStartCallAction localizedCallServiceName](self, "localizedCallServiceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("The call could not be started because %@ has been disabled in Settings."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStartCallAction localizedCallServiceName](self, "localizedCallServiceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD1540];
  v12 = *MEMORY[0x24BEC4270];
  v13 = *MEMORY[0x24BDD0FC8];
  v18[0] = *MEMORY[0x24BDD0FD8];
  v18[1] = v13;
  v19[0] = v6;
  v19[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 5, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleIntentAction errorThatLaunchesApp:](self, "errorThatLaunchesApp:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)errorFromResolutionResult:(id)a3 forSlot:(id)a4 onIntent:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v8;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;
  v13 = objc_msgSend(v12, "unsupportedReason");
  if ((unint64_t)(v13 - 1) >= 2)
  {
    if (v13 == 6)
    {
      -[WFStartCallAction disabledInSettingsError](self, "disabledInSettingsError");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17.receiver = self;
      v17.super_class = (Class)WFStartCallAction;
      -[WFHandleIntentAction errorFromResolutionResult:forSlot:onIntent:](&v17, sel_errorFromResolutionResult_forSlot_onIntent_, v8, v9, v10);
      v14 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[WFStartCallAction callingServiceNotAvailableError](self, "callingServiceNotAvailableError");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v14;

  return v15;
}

- (id)errorFromStartCallResponse:(id)a3 intent:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    v9 = 0;
    switch(objc_msgSend(v6, "code"))
    {
      case 6:
        -[WFStartCallAction callingServiceNotAvailableError](self, "callingServiceNotAvailableError");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      case 7:
        objc_msgSend(v8, "contacts");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFStartCallAction contactNotSupportedByAppErrorForContacts:](self, "contactNotSupportedByAppErrorForContacts:", v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      case 8:
        -[WFStartCallAction airplaneModeError](self, "airplaneModeError");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      case 10:
        -[WFStartCallAction appConfigurationRequiredError](self, "appConfigurationRequiredError");
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v9 = (void *)v10;
        break;
      default:
        break;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)populatesInputFromInputParameter
{
  return 0;
}

- (BOOL)skipsProcessingHiddenParameters
{
  return 0;
}

- (id)iconName
{
  objc_super v4;

  if (-[WFStartCallAction isRunningOniPad](self, "isRunningOniPad")
    && -[WFStartCallAction preferredCallProvider](self, "preferredCallProvider") == 1)
  {
    return CFSTR("Phone");
  }
  v4.receiver = self;
  v4.super_class = (Class)WFStartCallAction;
  -[WFStartCallAction iconName](&v4, sel_iconName);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)disabledOnPlatforms
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFStartCallAction;
  -[WFHandleIntentAction disabledOnPlatforms](&v5, sel_disabledOnPlatforms);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", *MEMORY[0x24BEC43E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  -[WFStartCallAction errorFromStartCallResponse:intent:](self, "errorFromStartCallResponse:intent:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFStartCallAction;
    -[WFHandleIntentAction errorFromConfirmResponse:intent:](&v13, sel_errorFromConfirmResponse_intent_, v6, v7);
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
  -[WFStartCallAction errorFromStartCallResponse:intent:](self, "errorFromStartCallResponse:intent:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFStartCallAction;
    -[WFHandleIntentAction errorFromHandleResponse:intent:](&v13, sel_errorFromHandleResponse_intent_, v6, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)generatedIntentWithIdentifier:(id)a3 input:(id)a4 processedParameters:(id)a5 error:(id *)a6
{
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFStartCallAction;
  -[WFHandleSystemIntentAction generatedIntentWithIdentifier:input:processedParameters:error:](&v10, sel_generatedIntentWithIdentifier_input_processedParameters_error_, a3, a4, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    objc_msgSend(v8, "setDestinationType:", 1);
    objc_msgSend(v8, "setCallCapability:", -[WFStartCallAction callCapability](self, "callCapability"));
    objc_msgSend(v8, "setPreferredCallProvider:", -[WFStartCallAction preferredCallProvider](self, "preferredCallProvider"));

  }
  return v7;
}

- (BOOL)shouldOpenAppThroughSiriForIntent:(id)a3 intentResponse:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "_idiom") == 4)
  {
    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFStartCallAction;
    v8 = -[WFHandleIntentAction shouldOpenAppThroughSiriForIntent:intentResponse:](&v10, sel_shouldOpenAppThroughSiriForIntent_intentResponse_, v6, v7);
  }

  return v8;
}

- (id)intentDescriptorFromParameterState
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFStartCallAction;
  -[WFHandleSystemIntentAction intentDescriptorFromParameterState](&v6, sel_intentDescriptorFromParameterState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptorWithPreferredCallProvider:", -[WFStartCallAction preferredCallProvider](self, "preferredCallProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)intentDescriptorWithIntentClassName:(id)a3 launchableBundleId:(id)a4
{
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFStartCallAction;
  -[WFHandleSystemIntentAction intentDescriptorWithIntentClassName:launchableBundleId:](&v8, sel_intentDescriptorWithIntentClassName_launchableBundleId_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptorWithPreferredCallProvider:", -[WFStartCallAction preferredCallProvider](self, "preferredCallProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)supportedIdentifiers
{
  void *v3;
  void *v4;
  objc_super v6;
  objc_super v7;

  if (-[WFStartCallAction isRunningOniPad](self, "isRunningOniPad"))
  {
    v6.receiver = self;
    v6.super_class = (Class)WFStartCallAction;
    -[WFHandleSystemIntentAction supportedIdentifiers](&v6, sel_supportedIdentifiers);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    if ((objc_msgSend(v4, "containsObject:", CFSTR("com.apple.TelephonyUtilities.PhoneIntentHandler")) & 1) == 0)
      objc_msgSend(v4, "addObject:", CFSTR("com.apple.TelephonyUtilities.PhoneIntentHandler"));
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)WFStartCallAction;
    -[WFHandleSystemIntentAction supportedIdentifiers](&v7, sel_supportedIdentifiers);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)isRunningOniPad
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "idiom") == 1;

  return v3;
}

- (id)contentDestinationWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE19390];
  -[WFHandleIntentAction appDescriptor](self, "appDescriptor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationWithAppDescriptor:promptingBehaviour:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = a5;
  if (v6)
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to place a call using %2$@?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to place a call?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  -[WFStartCallAction parameterStateForKey:](self, "parameterStateForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "variable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(v6, "collectionFilter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "namedQueryReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "topHitSystemEntityCollectionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)canOfferSuggestionsForParameterWithKey:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  char v6;
  char v7;
  __CFString *v8;
  void *v9;
  BOOL v10;

  v4 = (__CFString *)a3;
  v5 = v4;
  if (v4 == CFSTR("WFCallContact"))
    goto LABEL_4;
  if (v4)
  {
    v6 = -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("WFCallContact"));

    if ((v6 & 1) != 0)
    {
LABEL_4:
      v7 = 1;
      goto LABEL_10;
    }
    v8 = v5;
    if (v8 == CFSTR("WFFaceTimeContact"))
      v7 = 1;
    else
      v7 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("WFFaceTimeContact"));
  }
  else
  {
    v7 = 0;
  }

LABEL_10:
  -[WFStartCallAction systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:](self, "systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = v7;
  else
    v10 = 0;

  return v10;
}

- (id)suggestedEntityFromCallDescriptor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;

  v3 = a3;
  objc_msgSend(v3, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wf_image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithDisplayStyle:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v3, "callType");
    if (v8 > 3)
      v9 = 0;
    else
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC1338]), "initWithBundleIdentifier:", **((_QWORD **)&unk_24F8B6A18 + v8));
    objc_msgSend(v3, "person");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "nameComponents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "givenName");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(v3, "person");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "nameComponents");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "givenName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "length");

      if (v18)
      {
        objc_msgSend(v3, "person");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "nameComponents");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "givenName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
        v22 = objc_alloc(MEMORY[0x24BEC13A0]);
        objc_msgSend(v3, "handle");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC14E8]), "initWithImage:", v7);
        objc_msgSend(v3, "personSerializedRepresentation");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v22, "initWithIdentifier:name:entryIcon:accessoryIcon:serializedParameterState:", v23, v21, v24, v9, v25);

        goto LABEL_12;
      }
    }
    else
    {

    }
    objc_msgSend(v3, "person");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "displayName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (void)fetchRecentCallDestinationWithTelephony:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BEC1318], "standardClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __72__WFStartCallAction_fetchRecentCallDestinationWithTelephony_completion___block_invoke;
  v9[3] = &unk_24F8BABC0;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "getRecentsCallWithTelephony:limit:completion:", v4, 20, v9);

}

- (void)fetchFavoriteCallDestinationsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BEC1318], "standardClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__WFStartCallAction_fetchFavoriteCallDestinationsWithCompletion___block_invoke;
  v7[3] = &unk_24F8BABC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getFavoriteContactsWithLimit:completion:", 20, v7);

}

- (void)fetchSuggestedEntititiesForParameterWithKey:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  WFStartCallAction *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD, void *))a4;
  -[WFStartCallAction systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:](self, "systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("WFStartCallActionCollectionIdentifierRecents")))
  {
    v8 = self;
    v9 = 1;
LABEL_5:
    -[WFStartCallAction fetchRecentCallDestinationWithTelephony:completion:](v8, "fetchRecentCallDestinationWithTelephony:completion:", v9, v6);
    goto LABEL_6;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("WFStartCallActionCollectionIdentifierFaceTimeRecents")))
  {
    v8 = self;
    v9 = 0;
    goto LABEL_5;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("WFStartCallActionCollectionIdentifierFavorites")))
  {
    -[WFStartCallAction fetchFavoriteCallDestinationsWithCompletion:](self, "fetchFavoriteCallDestinationsWithCompletion:", v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Suggestions Not Found"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedString(CFSTR("The specified action has no suggestions available"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BEC4270];
    v14 = *MEMORY[0x24BDD0FC8];
    v17[0] = *MEMORY[0x24BDD0FD8];
    v17[1] = v14;
    v18[0] = v10;
    v18[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 5, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v6[2](v6, 0, v16);
  }
LABEL_6:

}

void __65__WFStartCallAction_fetchFavoriteCallDestinationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __65__WFStartCallAction_fetchFavoriteCallDestinationsWithCompletion___block_invoke_2;
  v4[3] = &unk_24F8B69F8;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "if_compactMap:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __65__WFStartCallAction_fetchFavoriteCallDestinationsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "suggestedEntityFromCallDescriptor:", a2);
}

void __72__WFStartCallAction_fetchRecentCallDestinationWithTelephony_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __72__WFStartCallAction_fetchRecentCallDestinationWithTelephony_completion___block_invoke_2;
  v9[3] = &unk_24F8B69D0;
  v5 = *(_QWORD *)(a1 + 32);
  v10 = v4;
  v11 = v5;
  v6 = v4;
  objc_msgSend(v3, "if_compactMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(_QWORD, void *, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v7, 0, v8);
}

id __72__WFStartCallAction_fetchRecentCallDestinationWithTelephony_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(v3, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
    objc_msgSend(*(id *)(a1 + 40), "suggestedEntityFromCallDescriptor:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

id __92__WFStartCallAction_serializedParametersForDonatedIntent_allowDroppingUnconfigurableValues___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (objc_class *)MEMORY[0x24BDD9DD0];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithIntentClassName:launchableAppBundleId:", v7, v4);

  objc_msgSend(MEMORY[0x24BDD9BF0], "sharedResolver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resolvedIntentMatchingDescriptor:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "displayableBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "displayableBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v11, "isEqualToString:", v12);

  if ((_DWORD)v7)
    v13 = v10;
  else
    v13 = 0;

  return v13;
}

@end
