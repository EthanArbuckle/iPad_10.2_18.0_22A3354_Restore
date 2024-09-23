@implementation GCGenericArcadeStickModel(DeviceDelegate)

- (_GCControllerInputComponentDescription)logicalDevice:()DeviceDelegate makeControllerInputDescriptionWithIdentifier:bindings:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
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
  void *v35;
  _GCControllerInputComponentDescription *v36;
  void *v38;
  id v39;
  id v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  objc_msgSend(a1, "physicalInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v36 = 0;
    goto LABEL_22;
  }
  v39 = v8;
  v40 = v7;
  v38 = v9;
  objc_msgSend(v9, "elements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (!v12)
    goto LABEL_20;
  v13 = v12;
  v14 = *(_QWORD *)v43;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v43 != v14)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v16;
        v18 = (void *)objc_opt_new();
        objc_msgSend(v17, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setIdentifier:", v19);

        objc_msgSend(v17, "names");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSSet setWithArray:](&off_254DEBEC0, "setWithArray:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setAliases:", v21);

        objc_msgSend(v17, "localizedNameKey");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setLocalizedName:", v22);

        objc_msgSend(v17, "symbolName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          objc_msgSend(v17, "symbolName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setSymbol:", v25);

        }
        else
        {
          objc_msgSend(v18, "setSymbol:", 0);
        }

        objc_msgSend(v17, "isAnalog");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setAnalog:", objc_msgSend(v34, "BOOLValue"));

        objc_msgSend(v18, "setEventPressedValueField:", objc_msgSend(v17, "sourceExtendedEventFieldIndex"));
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          continue;
        v26 = v16;
        v18 = (void *)objc_opt_new();
        objc_msgSend(v26, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setIdentifier:", v27);

        objc_msgSend(v26, "names");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSSet setWithArray:](&off_254DEBEC0, "setWithArray:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setAliases:", v29);

        objc_msgSend(v26, "localizedNameKey");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setLocalizedName:", v30);

        objc_msgSend(v26, "symbolName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          objc_msgSend(v26, "symbolName");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setSymbol:", v33);

        }
        else
        {
          objc_msgSend(v18, "setSymbol:", 0);
        }

        objc_msgSend(v18, "setAnalog:", 0);
        objc_msgSend(v18, "setEventUpValueField:", objc_msgSend(v26, "sourceUpExtendedEventFieldIndex"));
        objc_msgSend(v18, "setEventRightValueField:", objc_msgSend(v26, "sourceRightExtendedEventFieldIndex"));
        objc_msgSend(v18, "setEventDownValueField:", objc_msgSend(v26, "sourceDownExtendedEventFieldIndex"));
        objc_msgSend(v18, "setEventLeftValueField:", objc_msgSend(v26, "sourceLeftExtendedEventFieldIndex"));
      }
      objc_msgSend(v11, "addObject:", v18);

    }
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  }
  while (v13);
LABEL_20:

  v35 = (void *)objc_opt_new();
  objc_msgSend(v35, "setElements:", v11);
  v8 = v39;
  v7 = v40;
  v36 = -[_GCControllerInputComponentDescription initWithIdentifier:controllerInputs:bindings:]([_GCControllerInputComponentDescription alloc], "initWithIdentifier:controllerInputs:bindings:", v40, v35, v39);

  v9 = v38;
LABEL_22:

  return v36;
}

@end
