@implementation GCGenericDeviceModel(DeviceDelegate)

- (id)physicalDeviceGetHapticCapabilities:()DeviceDelegate
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "driver");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "rumble");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v2, "actuators");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "gc_arrayByTransformingElementsWithOptions:usingBlock:", 0, &__block_literal_global_36);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (GCHapticCapabilityGraph)physicalDeviceGetHapticCapabilityGraph:()DeviceDelegate
{
  id v4;
  void *v5;
  GCHapticCapabilityGraph *v6;
  void *v7;
  void *v8;
  void *v9;
  GCHapticCapabilityGraph *v10;

  v4 = a3;
  objc_msgSend(a1, "physicalDeviceGetHapticCapabilities:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [GCHapticCapabilityGraph alloc];
  objc_msgSend(a1, "driver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rumble");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[GCHapticCapabilityGraph initWithActuators:nodes:](v6, "initWithActuators:nodes:", v5, v9);

  return v10;
}

- (uint64_t)logicalDeviceControllerDescriptionClass:()DeviceDelegate
{
  return objc_opt_class();
}

- (uint64_t)logicalDeviceControllerIsAttachedToHost:()DeviceDelegate
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "isFormFitting");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (id)logicalDevice:()DeviceDelegate makeControllerPhysicalInputProfileDescriptionWithIdentifier:bindings:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  GCDeviceButtonInputDescription *v28;
  void *v29;
  int v30;
  GCDeviceButtonInputDescription *v31;
  void *v32;
  id v33;
  void *v34;
  id v36;
  id v37;
  id v38;
  id obj;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  objc_msgSend(a1, "physicalInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v32 = 0;
    goto LABEL_31;
  }
  v37 = v8;
  v38 = v7;
  v36 = v9;
  objc_msgSend(v9, "elements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_opt_new();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v10;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (!v42)
    goto LABEL_26;
  v41 = *(_QWORD *)v44;
  do
  {
    for (i = 0; i != v42; ++i)
    {
      if (*(_QWORD *)v44 != v41)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
      objc_msgSend(v12, "names");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSSet setWithArray:](&off_254DEBEC0, "setWithArray:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "gc_setByRemovingObject:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "localizedNameKey");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        v19 = v17;
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "defaultLocalizedNameForElement:", v14);
        v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      v20 = v19;

      objc_msgSend(v12, "symbolName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        v23 = v21;
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "defaultSymbolNameForElement:", v14);
        v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      v24 = v23;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((objc_msgSend(v14, "isEqualToString:", CFSTR("Button Home")) & 1) != 0
          || (objc_msgSend(v14, "isEqualToString:", CFSTR("Button Options")) & 1) != 0)
        {
          v25 = 49152;
        }
        else if (objc_msgSend(v14, "isEqualToString:", CFSTR("Button Menu")))
        {
          v25 = 0x4000;
        }
        else
        {
          v25 = 2;
        }
        objc_msgSend(v12, "isAnalog");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "BOOLValue");

        v28 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", v14, v16, v25, v20, v24, v30 ^ 1u, objc_msgSend(v12, "sourceExtendedEventFieldIndex"));
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_24;
        objc_msgSend(v12, "isAnalog");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "BOOLValue");

        v28 = -[GCDeviceDirectionPadDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:]([GCDeviceDirectionPadDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:", v14, v16, 2, v20, v24, v27 ^ 1u, objc_msgSend(v12, "sourceUpExtendedEventFieldIndex"), objc_msgSend(v12, "sourceDownExtendedEventFieldIndex"), objc_msgSend(v12, "sourceLeftExtendedEventFieldIndex"), objc_msgSend(v12, "sourceRightExtendedEventFieldIndex"));
      }
      v31 = v28;
      objc_msgSend(v40, "addObject:", v28);

LABEL_24:
    }
    v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  }
  while (v42);
LABEL_26:

  if ((objc_msgSend((id)objc_opt_class(), "elementsMakeValidExtendedGamepad:", v40) & 1) == 0)
    objc_msgSend((id)objc_opt_class(), "elementsMakeValidGamepad:", v40);
  v8 = v37;
  v7 = v38;
  v33 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(v40, "allObjects");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v33, "initWithIdentifier:elements:bindings:", v38, v34, v37);

  v9 = v36;
LABEL_31:

  return v32;
}

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
  void *v36;
  _GCControllerInputComponentDescription *v37;
  void *v39;
  id v40;
  id v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  objc_msgSend(a1, "physicalInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v37 = 0;
    goto LABEL_22;
  }
  v40 = v8;
  v41 = v7;
  v39 = v9;
  objc_msgSend(v9, "elements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (!v12)
    goto LABEL_20;
  v13 = v12;
  v14 = *(_QWORD *)v44;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v44 != v14)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
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

        objc_msgSend(v26, "isAnalog");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setAnalog:", objc_msgSend(v35, "BOOLValue"));

        objc_msgSend(v18, "setEventUpValueField:", objc_msgSend(v26, "sourceUpExtendedEventFieldIndex"));
        objc_msgSend(v18, "setEventRightValueField:", objc_msgSend(v26, "sourceRightExtendedEventFieldIndex"));
        objc_msgSend(v18, "setEventDownValueField:", objc_msgSend(v26, "sourceDownExtendedEventFieldIndex"));
        objc_msgSend(v18, "setEventLeftValueField:", objc_msgSend(v26, "sourceLeftExtendedEventFieldIndex"));
      }
      objc_msgSend(v11, "addObject:", v18);

    }
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  }
  while (v13);
LABEL_20:

  v36 = (void *)objc_opt_new();
  objc_msgSend(v36, "setElements:", v11);
  v8 = v40;
  v7 = v41;
  v37 = -[_GCControllerInputComponentDescription initWithIdentifier:controllerInputs:bindings:]([_GCControllerInputComponentDescription alloc], "initWithIdentifier:controllerInputs:bindings:", v41, v36, v40);

  v9 = v39;
LABEL_22:

  return v37;
}

- (uint64_t)logicalDevice:()DeviceDelegate makeControllerPhysicalInputProfileWithIdentifier:
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)respondsToSelector:()DeviceDelegate
{
  _BOOL8 v3;
  void *v4;
  objc_super v6;

  if (sel_logicalDeviceControllerIsAttachedToHost_ == a3)
  {
    objc_msgSend(a1, "isFormFitting");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v4 != 0;

  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&off_254DE7378;
    return objc_msgSendSuper2(&v6, sel_respondsToSelector_);
  }
  return (id)v3;
}

+ (uint64_t)elementsMakeValidExtendedGamepad:()DeviceDelegate
{
  id v3;
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
  uint64_t v14;
  void *v15;
  char isKindOfClass;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = a3;
  objc_msgSend(v3, "member:", CFSTR("Button A"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "member:", CFSTR("Button B"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "member:", CFSTR("Button X"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v3, "member:", CFSTR("Button Y"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v3, "member:", CFSTR("Direction Pad"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v3, "member:", CFSTR("Left Thumbstick"));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v3, "member:", CFSTR("Right Thumbstick"));
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v3, "member:", CFSTR("Left Shoulder"));
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v20 = v11;
                  objc_msgSend(v3, "member:", CFSTR("Right Shoulder"));
                  v12 = objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v21 = (void *)v12;
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v3, "member:", CFSTR("Left Trigger"));
                    v13 = objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    v19 = (void *)v13;
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v3, "member:", CFSTR("Right Trigger"));
                      v14 = objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      v18 = (void *)v14;
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        objc_msgSend(v3, "member:", CFSTR("Button Menu"), v14, v19);
                        v15 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_opt_class();
                        isKindOfClass = objc_opt_isKindOfClass();

                      }
                      else
                      {
                        isKindOfClass = 0;
                      }
                      v11 = v20;

                    }
                    else
                    {
                      isKindOfClass = 0;
                      v11 = v20;
                    }

                  }
                  else
                  {
                    isKindOfClass = 0;
                    v11 = v20;
                  }

                }
                else
                {
                  isKindOfClass = 0;
                }

              }
              else
              {
                isKindOfClass = 0;
              }

            }
            else
            {
              isKindOfClass = 0;
            }

          }
          else
          {
            isKindOfClass = 0;
          }

        }
        else
        {
          isKindOfClass = 0;
        }

      }
      else
      {
        isKindOfClass = 0;
      }

    }
    else
    {
      isKindOfClass = 0;
    }

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

+ (uint64_t)elementsMakeValidGamepad:()DeviceDelegate
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;

  v3 = a3;
  objc_msgSend(v3, "member:", CFSTR("Button A"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "member:", CFSTR("Button B"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "member:", CFSTR("Button X"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v3, "member:", CFSTR("Button Y"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v3, "member:", CFSTR("Direction Pad"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v3, "member:", CFSTR("Left Shoulder"));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v3, "member:", CFSTR("Right Shoulder"));
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v3, "member:", CFSTR("Button Menu"));
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();

              }
              else
              {
                isKindOfClass = 0;
              }

            }
            else
            {
              isKindOfClass = 0;
            }

          }
          else
          {
            isKindOfClass = 0;
          }

        }
        else
        {
          isKindOfClass = 0;
        }

      }
      else
      {
        isKindOfClass = 0;
      }

    }
    else
    {
      isKindOfClass = 0;
    }

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

+ (id)defaultLocalizedNameForElement:()DeviceDelegate
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Button A")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Button B")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Button X")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Button Y")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Direction Pad")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Left Thumbstick")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Right Thumbstick")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Left Shoulder")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Right Shoulder")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Left Trigger")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Right Trigger")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Left Thumbstick Button")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Right Thumbstick Button")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Button Home")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Button Menu")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Button Options")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("Button Share")))
  {
    _GCFConvertStringToLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (const)defaultSymbolNameForElement:()DeviceDelegate
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Button A")) & 1) != 0)
  {
    v4 = CFSTR("a.circle");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Button B")) & 1) != 0)
  {
    v4 = CFSTR("b.circle");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Button X")) & 1) != 0)
  {
    v4 = CFSTR("y.circle");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Button Y")) & 1) != 0)
  {
    v4 = CFSTR("x.circle");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Direction Pad")) & 1) != 0)
  {
    v4 = CFSTR("dpad");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Left Thumbstick")) & 1) != 0)
  {
    v4 = CFSTR("l.joystick");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Right Thumbstick")) & 1) != 0)
  {
    v4 = CFSTR("r.joystick");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Left Shoulder")) & 1) != 0)
  {
    v4 = CFSTR("l1.rectangle.roundedbottom");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Right Shoulder")) & 1) != 0)
  {
    v4 = CFSTR("r1.rectangle.roundedbottom");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Left Trigger")) & 1) != 0)
  {
    v4 = CFSTR("l2.rectangle.roundedtop");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Right Trigger")) & 1) != 0)
  {
    v4 = CFSTR("r2.rectangle.roundedtop");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Left Thumbstick Button")) & 1) != 0)
  {
    v4 = CFSTR("l.joystick.press.down");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Right Thumbstick Button")) & 1) != 0)
  {
    v4 = CFSTR("r.joystick.press.down");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Button Home")) & 1) != 0)
  {
    v4 = CFSTR("house.circle");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Button Menu")) & 1) != 0)
  {
    v4 = CFSTR("line.horizontal.3.circle");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Button Options")) & 1) != 0)
  {
    v4 = CFSTR("ellipsis.circle");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Button Share")))
  {
    v4 = CFSTR("square.and.arrow.up");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)physicalDeviceGetHapticCapabilityGraph:()DeviceDelegate .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_215181000, a2, OS_LOG_TYPE_FAULT, "Caught exception decoding GCHapticCapabilityGraph: %@", (uint8_t *)&v2, 0xCu);
}

@end
