@implementation GCController

- (GCController)initWithIdentifier:(id)a3 components:(id)a4
{
  id v6;
  id v7;
  GCController *v8;
  GCController *v9;
  uint64_t v10;
  NSCopying *identifier;
  uint64_t v12;
  GCNamedProfile *profile;
  uint64_t v14;
  NSMutableArray *hidServices;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GCController;
  v8 = -[GCController init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_handlerQueue, MEMORY[0x24BDAC9B8]);
    v10 = objc_msgSend(v6, "copyWithZone:", 0);
    identifier = v9->_identifier;
    v9->_identifier = (NSCopying *)v10;

    v9->_playerIndex = -1;
    -[GCController setComponents:](v9, "setComponents:", v7);
    v12 = objc_opt_new();
    profile = v9->_profile;
    v9->_profile = (GCNamedProfile *)v12;

    v14 = objc_opt_new();
    hidServices = v9->_hidServices;
    v9->_hidServices = (NSMutableArray *)v14;

  }
  return v9;
}

- (GCController)initWithComponents:(id)a3
{
  id v4;
  void *v5;
  GCController *v6;

  v4 = a3;
  +[NSUUID UUID](&off_254DEEE48, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GCController initWithIdentifier:components:](self, "initWithIdentifier:components:", v5, v4);

  return v6;
}

- (void)removeComponent:(id)a3
{
  NSArray *components;
  id v5;
  NSArray *v6;
  NSArray *v7;

  components = self->_components;
  v5 = a3;
  v6 = (NSArray *)-[NSArray mutableCopy](components, "mutableCopy");
  -[NSArray removeObject:](v6, "removeObject:", v5);

  v7 = self->_components;
  self->_components = v6;

}

- (void)setComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSArray *v11;
  NSArray *components;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  id v17;
  GCLocalPlayerIndicator *v18;
  GCControllerPlayerIndicator *playerIndicator;
  int64_t playerIndex;
  GCControllerPlayerIndicator *v21;
  GCControllerSettingsComponent *settings;
  GCPhysicalInputProfile *physicalInput;
  void *v24;
  _GCControllerInputComponent *input;
  void *v26;
  GCPhysicalInputProfile *v27;
  id *p_systemGesture;
  id obj;
  _QWORD v30[4];
  id v31;
  id from;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[NSArray differenceFromArray:](self->_components, "differenceFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "object");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setController:", 0);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v7);
  }

  v11 = (NSArray *)objc_msgSend(v4, "copy");
  components = self->_components;
  self->_components = v11;

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v4;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v34;
    p_systemGesture = (id *)&self->_systemGesture;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        objc_msgSend(v16, "setController:", self, p_systemGesture);
        if (objc_msgSend(v16, "conformsToProtocol:", &unk_254DD05F8))
          objc_storeStrong((id *)&self->_info, v16);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_storeStrong((id *)&self->_input, v16);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_storeStrong((id *)&self->_physicalInput, v16);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_storeStrong((id *)&self->_motion, v16);
        if (objc_msgSend(v16, "conformsToProtocol:", &unk_254DC79F0))
        {
          v17 = v16;
          if (GCCurrentProcessLinkedOnAfter(0x7E40901FFFFFFFFuLL))
          {
            v18 = (GCLocalPlayerIndicator *)v17;
          }
          else
          {
            -[GCController removeComponent:](self, "removeComponent:", v17);
            playerIndicator = self->_playerIndicator;
            if (playerIndicator)
              playerIndex = -[GCControllerPlayerIndicator playerIndex](playerIndicator, "playerIndex");
            else
              playerIndex = self->_playerIndex;
            v18 = -[GCLocalPlayerIndicator initWithInitialValue:systemPlayerIndicatorProxy:]([GCLocalPlayerIndicator alloc], "initWithInitialValue:systemPlayerIndicatorProxy:", playerIndex, v17);
            -[GCController _addComponent:](self, "_addComponent:", v18);
          }
          v21 = self->_playerIndicator;
          self->_playerIndicator = (GCControllerPlayerIndicator *)v18;

        }
        if (objc_msgSend(v16, "conformsToProtocol:", &unk_254DC75A8))
          objc_storeStrong((id *)&self->_hapticCapabilityInfo, v16);
        if (objc_msgSend(v16, "conformsToProtocol:", &unk_254DCE558))
          objc_storeStrong((id *)&self->_light, v16);
        if (objc_msgSend(v16, "conformsToProtocol:", &unk_254DC7C58))
          objc_storeStrong((id *)&self->_motionConfigurableSensors, v16);
        if (objc_msgSend(v16, "conformsToProtocol:", &unk_254DC3230))
          objc_storeStrong((id *)&self->_battery, v16);
        if (objc_msgSend(v16, "conformsToProtocol:", &unk_254DD06D8))
          objc_storeStrong((id *)&self->_settings, v16);
        if (objc_msgSend(v16, "conformsToProtocol:", &unk_254DCA9C0))
          objc_storeStrong((id *)&self->_gameIntent, v16);
        if (objc_msgSend(v16, "conformsToProtocol:", &unk_254DD6958))
          objc_storeStrong(p_systemGesture, v16);
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v13);
  }

  if (self->_settings && (self->_physicalInput || self->_input))
  {
    objc_initWeak(&from, self);
    settings = self->_settings;
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __30__GCController_setComponents___block_invoke;
    v30[3] = &unk_24D2B49F8;
    objc_copyWeak(&v31, &from);
    -[GCControllerSettingsComponent setChangedHandler:](settings, "setChangedHandler:", v30);
    physicalInput = self->_physicalInput;
    -[GCControllerSettingsComponent settingsProfile](self->_settings, "settingsProfile");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile setSettingsProfile:](physicalInput, "setSettingsProfile:", v24);

    input = self->_input;
    -[GCControllerSettingsComponent settingsProfile](self->_settings, "settingsProfile");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_GCControllerInputComponent setSettingsProfile:](input, "setSettingsProfile:", v26);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&from);
  }
  if (self->_systemGesture)
  {
    v27 = self->_physicalInput;
    if (v27)
      -[GCPhysicalInputProfile applySystemGestureComponent:](v27, "applySystemGestureComponent:");
  }

}

void __30__GCController_setComponents___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controllersQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__GCController_setComponents___block_invoke_2;
  block[3] = &unk_24D2B2C50;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
}

void __30__GCController_setComponents___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)*((_QWORD *)WeakRetained + 6);
    v6 = WeakRetained;
    objc_msgSend(*((id *)WeakRetained + 9), "settingsProfile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setSettingsProfile:", v3);

    v4 = (void *)*((_QWORD *)v6 + 5);
    objc_msgSend(*((id *)v6 + 9), "settingsProfile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSettingsProfile:", v5);

    WeakRetained = v6;
  }

}

- (void)setHandlerQueue:(id)a3
{
  OS_dispatch_queue *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (OS_dispatch_queue *)a3;
  if (self->_handlerQueue != v5)
  {
    objc_storeStrong((id *)&self->_handlerQueue, a3);
    if (self->_components)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      -[GCController components](self, "components", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v13 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v11, "setDispatchQueue:", v5);
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v8);
      }

    }
  }

}

- (NSString)vendorName
{
  if (self->_components)
    -[GCControllerProductInfo vendorName](self->_info, "vendorName");
  else
    -[GCController _legacy_vendorName](self, "_legacy_vendorName");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)productCategory
{
  uint64_t v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;

  if (self->_components)
  {
    -[GCControllerProductInfo productCategory](self->_info, "productCategory");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v2;
    v4 = CFSTR("Generic Game Controller");
    if (v2)
      v4 = (__CFString *)v2;
    v5 = v4;

  }
  else
  {
    -[GCController _legacy_productCategory](self, "_legacy_productCategory");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (id)detailedProductCategory
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  if (self->_components)
  {
    -[GCControllerProductInfo detailedProductCategory](self->_info, "detailedProductCategory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      -[GCController productCategory](self, "productCategory");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;

  }
  else
  {
    -[GCController productCategory](self, "productCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)anonymizedIdentifier
{
  __CFString *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;

  v2 = CFSTR("controller");
  if (self->_components)
  {
    -[GCControllerProductInfo anonymizedIdentifier](self->_info, "anonymizedIdentifier");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      v5 = (__CFString *)v3;
    else
      v5 = CFSTR("controller");
    v2 = v5;

  }
  return v2;
}

- (id)persistentIdentifier
{
  NSCopying *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self->_identifier;
  else
    v3 = (NSCopying *)CFSTR("controller");
  return v3;
}

- (BOOL)isAttachedToDevice
{
  void *v2;
  char v3;

  if (!self->_components)
    return -[GCController _legacy_isAttachedToDevice](self, "_legacy_isAttachedToDevice");
  -[GCControllerProductInfo isAttachedToDevice](self->_info, "isAttachedToDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isEqualToController:(id)a3
{
  id v4;
  int v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (self->_components)
  {
    v5 = -[GCController isComponentBased](self, "isComponentBased");
    if (v5 == objc_msgSend(v4, "isComponentBased"))
    {
      -[GCController components](self, "components");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "components");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "isEqualToArray:", v8);

    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = -[GCController _legacy_isEqualToController:](self, "_legacy_isEqualToController:", v4);
  }

  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;

  if (self->_components)
  {
    -[GCController vendorName](self, "vendorName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<GCController %p vendorName='%@'>"), self, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[GCController _legacy_description](self, "_legacy_description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (GCSProfile)settingsProfile
{
  void *v2;

  if (self->_components)
  {
    -[GCControllerSettingsComponent settingsProfile](self->_settings, "settingsProfile");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (GCSProfile *)v2;
}

- (GCControllerPlayerIndex)playerIndex
{
  if (!self->_components)
    return -[GCController _legacy_playerIndex](self, "_legacy_playerIndex");
  if (self->_playerIndicator)
    return -[GCControllerPlayerIndicator playerIndex](self->_playerIndicator, "playerIndex");
  return self->_playerIndex;
}

- (void)setPlayerIndex:(GCControllerPlayerIndex)playerIndex
{
  if (self->_components)
  {
    if (playerIndex < GCControllerPlayerIndex1)
      playerIndex = GCControllerPlayerIndexUnset;
    if (self->_playerIndicator)
      -[GCControllerPlayerIndicator setPlayerIndex:](self->_playerIndicator, "setPlayerIndex:", playerIndex);
    else
      self->_playerIndex = playerIndex;
  }
  else
  {
    -[GCController _legacy_setPlayerIndex:](self, "_legacy_setPlayerIndex:", playerIndex);
  }
}

- (GCDeviceBattery)battery
{
  if (self->_components)
    -[GCDeviceBatteryComponent battery](self->_battery, "battery");
  else
    -[GCController _legacy_batteryStatus](self, "_legacy_batteryStatus");
  return (GCDeviceBattery *)(id)objc_claimAutoreleasedReturnValue();
}

- (GCControllerLiveInput)input
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  if (self->_components)
  {
    -[_GCDevicePhysicalInputComponent defaultPhysicalInput]((id *)&self->_input->super.super.isa, a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputBase facade]((uint64_t)v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      -[GCController _legacy_input](self, "_legacy_input");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

  }
  else
  {
    -[GCController _legacy_input](self, "_legacy_input");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (GCControllerLiveInput *)v7;
}

- (id)physicalInputProfileName
{
  if (self->_components)
    -[GCPhysicalInputProfile name](self->_physicalInput, "name");
  else
    -[GCController _legacy_physicalInputProfileName](self, "_legacy_physicalInputProfileName");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (GCPhysicalInputProfile)physicalInputProfile
{
  if (self->_components)
    return self->_physicalInput;
  -[GCController _legacy_physicalInputProfile](self, "_legacy_physicalInputProfile");
  return (GCPhysicalInputProfile *)(id)objc_claimAutoreleasedReturnValue();
}

- (GCExtendedGamepad)extendedGamepad
{
  GCPhysicalInputProfile *v3;

  if (self->_components)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = self->_physicalInput;
    else
      v3 = 0;
  }
  else
  {
    -[GCController _legacy_extendedGamepad](self, "_legacy_extendedGamepad");
    v3 = (GCPhysicalInputProfile *)objc_claimAutoreleasedReturnValue();
  }
  return (GCExtendedGamepad *)v3;
}

- (GCGamepad)gamepad
{
  GCPhysicalInputProfile *v3;

  if (self->_components)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v3 = self->_physicalInput;
    else
      v3 = 0;
  }
  else
  {
    -[GCController _legacy_gamepad](self, "_legacy_gamepad");
    v3 = (GCPhysicalInputProfile *)objc_claimAutoreleasedReturnValue();
  }
  return (GCGamepad *)v3;
}

- (GCMicroGamepad)microGamepad
{
  GCPhysicalInputProfile *v3;

  if (self->_components)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v3 = self->_physicalInput;
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    -[GCController _legacy_microGamepad](self, "_legacy_microGamepad");
    v3 = (GCPhysicalInputProfile *)objc_claimAutoreleasedReturnValue();
  }
  return (GCMicroGamepad *)v3;
}

- (GCMotion)motion
{
  if (self->_components)
    return self->_motion;
  -[GCController _legacy_motion](self, "_legacy_motion");
  return (GCMotion *)(id)objc_claimAutoreleasedReturnValue();
}

- (GCDeviceHaptics)haptics
{
  void *v2;

  if (self->_components)
  {
    -[GCDeviceHapticCapabilityInfo deviceHaptics](self->_hapticCapabilityInfo, "deviceHaptics");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (GCDeviceHaptics *)v2;
}

- (id)hapticEngines
{
  if (self->_components)
    -[GCDeviceHapticCapabilityInfo hapticEngines](self->_hapticCapabilityInfo, "hapticEngines");
  else
    +[NSArray array](NSArray_0, "array");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)initializeHapticEngines
{
  -[GCDeviceHapticCapabilityInfo initializeHapticEngines](self->_hapticCapabilityInfo, "initializeHapticEngines");
}

- (void)removeHapticEngines
{
  -[GCDeviceHapticCapabilityInfo removeHapticEngines](self->_hapticCapabilityInfo, "removeHapticEngines");
}

- (GCDeviceLight)light
{
  void *v2;

  if (self->_components)
  {
    -[GCDeviceLightComponent light](self->_light, "light");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (GCDeviceLight *)v2;
}

+ (GCController)current
{
  void *v2;
  void *v3;

  if (current_onceToken != -1)
    dispatch_once(&current_onceToken, &__block_literal_global_18);
  +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GCController *)v3;
}

uint64_t __23__GCController_current__block_invoke()
{
  return +[GCFrameworkInitialization enableControllerSupportWithReason:](GCFrameworkInitialization, "enableControllerSupportWithReason:", 3);
}

- (void)_becomeCurrent
{
  id v3;

  +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentController:", self);

}

+ (NSArray)controllers
{
  void *v2;
  void *v3;

  if (controllers_onceToken != -1)
    dispatch_once(&controllers_onceToken, &__block_literal_global_226);
  +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __27__GCController_controllers__block_invoke()
{
  return +[GCFrameworkInitialization enableControllerSupportWithReason:](GCFrameworkInitialization, "enableControllerSupportWithReason:", 2);
}

+ (void)_startWirelessControllerDiscoveryWithCompanions:(BOOL)a3 btClassic:(BOOL)a4 btle:(BOOL)a5 completionHandler:(id)a6
{
  objc_msgSend(a1, "_startWirelessControllerDiscoveryWithBTClassic:btle:completionHandler:", a4, a5, a6);
}

+ (void)_startWirelessControllerDiscoveryWithBTClassic:(BOOL)a3 btle:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  _QWORD block[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t *v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  int v25;

  v5 = a4;
  v6 = a3;
  v7 = a5;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215181000, v14, OS_LOG_TYPE_DEFAULT, "startWirelessControllerDiscovery", buf, 2u);
    }

  }
  if (_startWirelessControllerDiscoveryWithBTClassic_btle_completionHandler__onceToken != -1)
    dispatch_once(&_startWirelessControllerDiscoveryWithBTClassic_btle_completionHandler__onceToken, &__block_literal_global_227);
  *(_QWORD *)buf = 0;
  v23 = buf;
  v24 = 0x3020000000;
  v8 = MEMORY[0x24BDAC760];
  v25 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __86__GCController__startWirelessControllerDiscoveryWithBTClassic_btle_completionHandler___block_invoke_2;
  v19[3] = &unk_24D2B4A80;
  v21 = buf;
  v9 = v7;
  v20 = v9;
  v10 = (void *)MEMORY[0x2199DEBB0](v19);
  v11 = v10;
  if (v6)
    ++*((_DWORD *)v23 + 10);
  if (v5)
    ++*((_DWORD *)v23 + 10);
  if (v6)
  {
    v12 = s_cbDelegateQueue;
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __86__GCController__startWirelessControllerDiscoveryWithBTClassic_btle_completionHandler___block_invoke_3;
    block[3] = &unk_24D2B4AA8;
    v18 = v10;
    dispatch_async(v12, block);

  }
  if (v5)
  {
    v13 = s_cbDelegateQueue;
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __86__GCController__startWirelessControllerDiscoveryWithBTClassic_btle_completionHandler___block_invoke_4;
    v15[3] = &unk_24D2B4AA8;
    v16 = v11;
    dispatch_async(v13, v15);

  }
  _Block_object_dispose(buf, 8);

}

void __86__GCController__startWirelessControllerDiscoveryWithBTClassic_btle_completionHandler___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("wireless-discovery-queue", 0);
  v1 = (void *)s_cbDelegateQueue;
  s_cbDelegateQueue = (uint64_t)v0;

}

uint64_t __86__GCController__startWirelessControllerDiscoveryWithBTClassic_btle_completionHandler___block_invoke_2(uint64_t result)
{
  if (!--*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
  {
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __86__GCController__startWirelessControllerDiscoveryWithBTClassic_btle_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)s_mbDelegate;
  if (!s_mbDelegate)
  {
    v3 = objc_opt_new();
    v4 = (void *)s_mbDelegate;
    s_mbDelegate = v3;

    v2 = (void *)s_mbDelegate;
  }
  objc_msgSend(v2, "setCompletionHandler:", *(_QWORD *)(a1 + 32));
  return objc_msgSend((id)s_mbDelegate, "startScan");
}

void __86__GCController__startWirelessControllerDiscoveryWithBTClassic_btle_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (s_cbDelegate)
  {
    objc_msgSend((id)s_cbDelegate, "setCompletionHandler:", *(_QWORD *)(a1 + 32));
    objc_msgSend((id)s_cbDelegate, "startScan");
  }
  else
  {
    v2 = objc_opt_new();
    v3 = (void *)s_cbDelegate;
    s_cbDelegate = v2;

    v4 = objc_alloc((Class)&off_254DFFBF0);
    v5 = s_cbDelegate;
    v6 = s_cbDelegateQueue;
    v9 = *MEMORY[0x24BDBB040];
    v10[0] = MEMORY[0x24BDBD1C0];
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v4, "initWithDelegate:queue:options:", v5, v6, v7);

    objc_msgSend((id)s_cbDelegate, "setCentralManager:", v8);
    objc_msgSend((id)s_cbDelegate, "setCompletionHandler:", *(_QWORD *)(a1 + 32));

  }
}

+ (void)startWirelessControllerDiscoveryWithCompletionHandler:(void *)completionHandler
{
  objc_msgSend(a1, "_startWirelessControllerDiscoveryWithBTClassic:btle:completionHandler:", 0, 0, completionHandler);
}

+ (void)stopWirelessControllerDiscovery
{
  objc_msgSend((id)s_mbDelegate, "stopScan");
  objc_msgSend((id)s_cbDelegate, "stopScan");
}

- (void)_setSnapshot:(BOOL)a3
{
  self->_snapshot = a3;
}

- (GCController)capture
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  GCMotion *v7;
  void *v8;
  void *v9;

  -[GCController physicalInputProfile](self, "physicalInputProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[GCController snapshotWithProfile:](GCController, "snapshotWithProfile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCController motion](self, "motion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[GCMotion initWithController:]([GCMotion alloc], "initWithController:", v5);
    -[GCMotion _setCompassEnabled:](v7, "_setCompassEnabled:", 1);
    -[GCMotion _setMotionLite:](v7, "_setMotionLite:", 1);
    objc_msgSend(v4, "set_motion:", v7);
    objc_msgSend(v5, "motion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCController motion](self, "motion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setStateFromMotion:", v9);

  }
  return (GCController *)v5;
}

+ (GCController)controllerWithMicroGamepad
{
  GCMicroGamepad *v2;
  GCController *v3;
  GCMotion *v4;

  v2 = -[GCPhysicalInputProfile initWithController:]([GCMicroGamepad alloc], "initWithController:", 0);
  v3 = -[GCController initWithProfile:]([GCController alloc], "initWithProfile:", v2);
  -[GCController _setSnapshot:](v3, "_setSnapshot:", 1);
  v4 = -[GCMotion initWithController:]([GCMotion alloc], "initWithController:", v3);
  -[GCMotion _setCompassEnabled:](v4, "_setCompassEnabled:", 1);
  -[GCMotion _setMotionLite:](v4, "_setMotionLite:", 1);
  -[GCPhysicalInputProfile set_motion:](v2, "set_motion:", v4);

  return v3;
}

+ (GCController)controllerWithExtendedGamepad
{
  uint64_t i;
  GCExtendedGamepad *v3;
  GCController *v4;
  GCMotion *v5;
  uint64_t j;
  _OWORD v8[100];

  memset(v8, 0, 512);
  GCExtendedGamepadInitInfoMake(v8);
  for (i = 8; i != 1592; i += 72)
    *((_BYTE *)v8 + i) = 1;
  v3 = -[GCExtendedGamepad initWithController:initInfo:]([GCExtendedGamepad alloc], "initWithController:initInfo:", 0, v8);
  v4 = -[GCController initWithProfile:]([GCController alloc], "initWithProfile:", v3);
  -[GCController _setSnapshot:](v4, "_setSnapshot:", 1);
  v5 = -[GCMotion initWithController:]([GCMotion alloc], "initWithController:", v4);
  -[GCMotion _setHasAttitude:](v5, "_setHasAttitude:", -[GCMotion hasAttitude](v5, "hasAttitude"));
  -[GCMotion _setHasRotationRate:](v5, "_setHasRotationRate:", -[GCMotion hasRotationRate](v5, "hasRotationRate"));
  -[GCPhysicalInputProfile set_motion:](v3, "set_motion:", v5);

  for (j = 0; j != 1584; j += 72)
    __destructor_8_s0_s48_s56_s64((id *)((char *)v8 + j));
  return v4;
}

- (void)dealloc
{
  NSMutableArray *hidServices;
  GCNamedProfile *profile;
  objc_super v5;
  _QWORD block[6];
  _QWORD v7[5];
  GCNamedProfile *v8;
  _QWORD v9[5];
  id v10;

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__5;
  v9[4] = __Block_byref_object_dispose__5;
  v10 = (id)-[NSMutableArray mutableCopy](self->_hidServices, "mutableCopy");
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__5;
  v7[4] = __Block_byref_object_dispose__5;
  v8 = self->_profile;
  hidServices = self->_hidServices;
  self->_hidServices = 0;

  profile = self->_profile;
  self->_profile = 0;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__GCController_dealloc__block_invoke;
  block[3] = &unk_24D2B4AD0;
  block[4] = v9;
  block[5] = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  _Block_object_dispose(v7, 8);

  _Block_object_dispose(v9, 8);
  v5.receiver = self;
  v5.super_class = (Class)GCController;
  -[GCController dealloc](&v5, sel_dealloc);
}

void __23__GCController_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "removeAllObjects");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

+ (BOOL)shouldMonitorBackgroundEvents
{
  return 0;
}

- (void)_triggerGameIntentLongPress
{
  -[GCDeviceGameIntentComponent triggerGestureGameIntentAppLibrary](self->_gameIntent, "triggerGestureGameIntentAppLibrary");
}

- (void)_triggerGameIntentShortPress
{
  -[GCDeviceGameIntentComponent triggerGestureGameIntentGameCenter](self->_gameIntent, "triggerGestureGameIntentGameCenter");
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (NSArray)components
{
  return self->_components;
}

- (void)controllerPausedHandler
{
  return self->_controllerPausedHandler;
}

- (void)setControllerPausedHandler:(void *)controllerPausedHandler
{
  objc_setProperty_nonatomic_copy(self, a2, controllerPausedHandler, 224);
}

- (BOOL)isSnapshot
{
  return self->_snapshot;
}

- (NSObject)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_controllerPausedHandler, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_physicalDeviceUniqueID, 0);
  objc_storeStrong((id *)&self->_hidServices, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_legacy_input, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_systemGesture, 0);
  objc_storeStrong((id *)&self->_gameIntent, 0);
  objc_storeStrong((id *)&self->_battery, 0);
  objc_storeStrong((id *)&self->_light, 0);
  objc_storeStrong((id *)&self->_hapticCapabilityInfo, 0);
  objc_storeStrong((id *)&self->_playerIndicator, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_motionConfigurableSensors, 0);
  objc_storeStrong((id *)&self->_motion, 0);
  objc_storeStrong((id *)&self->_physicalInput, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
}

- (BOOL)isComponentBased
{
  return self->_components != 0;
}

- (GCControllerMotionConfigurableSensors)motionConfigurableSensors
{
  return self->_motionConfigurableSensors;
}

- (GCSystemGestureComponent)systemGestureComponent
{
  return self->_systemGesture;
}

- (id)controllerSettings
{
  return self->_settings;
}

- (void)_addComponent:(id)a3
{
  NSArray *components;
  id v5;
  NSArray *v6;
  NSArray *v7;

  components = self->_components;
  v5 = a3;
  v6 = (NSArray *)-[NSArray mutableCopy](components, "mutableCopy");
  objc_msgSend(v5, "setController:", self);
  -[NSArray addObject:](v6, "addObject:", v5);

  v7 = self->_components;
  self->_components = v6;

}

- (id)_componentWithProtocol:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)-[NSArray mutableCopy](self->_components, "mutableCopy", 0);
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "conformsToProtocol:", v4) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_componentOfClass:(Class)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)-[NSArray mutableCopy](self->_components, "mutableCopy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

+ (BOOL)_settingsSupportedForBLEDevice:(id)a3 settingsStore:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(a3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[GCController controllers](GCController, "controllers");
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v13, "persistentIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (__80__GCController_BluetoothSettings___settingsSupportedForBLEDevice_settingsStore___block_invoke((uint64_t)v14, v14, v7))
          {
            v15 = v13[9];

            if (v15)
            {
              LOBYTE(v21) = 1;
              v22 = v8;
              goto LABEL_24;
            }
          }
          else
          {

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v10);
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v5, "controllers", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "values");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v21)
    {
      v17 = *(_QWORD *)v25;
      while (2)
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "persistentIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = __80__GCController_BluetoothSettings___settingsSupportedForBLEDevice_settingsStore___block_invoke((uint64_t)v19, v19, v7);

          if ((v20 & 1) != 0)
          {
            LOBYTE(v21) = 1;
            goto LABEL_24;
          }
        }
        v21 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v21)
          continue;
        break;
      }
    }
LABEL_24:

  }
  else
  {
    LOBYTE(v21) = 0;
  }

  return v21;
}

uint64_t __80__GCController_BluetoothSettings___settingsSupportedForBLEDevice_settingsStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a2, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsString:", v4);

  return v6;
}

+ (BOOL)_settingsSupportedForBTClassicDevice:(id)a3 settingsStore:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  unsigned int (**v14)(_QWORD, _QWORD, _QWORD);
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  char v27;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(a3, "btAddressData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "length") == 6)
    {
      v8 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v7), "bytes");
      +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("%02X-%02X-%02X-%02X-%02X-%02X"), *v8, v8[1], v8[2], v8[3], v8[4], v8[5]);
      v9 = objc_claimAutoreleasedReturnValue();
      +[GCController controllers](GCController, "controllers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      +[NSRegularExpression regularExpressionWithPattern:options:error:](&off_254DFFE70, "regularExpressionWithPattern:options:error:", CFSTR("([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})"), 1, &v41);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v41;
      if (v12)
      {
        LOBYTE(v13) = 0;
      }
      else
      {
        v39[0] = MEMORY[0x24BDAC760];
        v39[1] = 3221225472;
        v39[2] = __86__GCController_BluetoothSettings___settingsSupportedForBTClassicDevice_settingsStore___block_invoke;
        v39[3] = &unk_24D2B4AF8;
        v29 = v11;
        v40 = v11;
        v14 = (unsigned int (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199DEBB0](v39);
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v30 = v10;
        v15 = v10;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v36;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v36 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD **)(*((_QWORD *)&v35 + 1) + 8 * i);
              objc_msgSend(v20, "persistentIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (((unsigned int (**)(_QWORD, void *, NSObject *))v14)[2](v14, v21, v9))
              {
                v22 = v20[9];

                if (v22)
                  goto LABEL_27;
              }
              else
              {

              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          }
          while (v17);
        }

        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        objc_msgSend(v5, "controllers");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "values");
        v15 = (id)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
        if (v13)
        {
          v24 = *(_QWORD *)v32;
LABEL_20:
          v25 = 0;
          while (1)
          {
            if (*(_QWORD *)v32 != v24)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v25), "persistentIdentifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = ((unsigned int (**)(_QWORD, void *, NSObject *))v14)[2](v14, v26, v9);

            if ((v27 & 1) != 0)
              break;
            if (v13 == ++v25)
            {
              v13 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
              if (v13)
                goto LABEL_20;
              goto LABEL_28;
            }
          }
LABEL_27:
          LOBYTE(v13) = 1;
        }
LABEL_28:

        v11 = v29;
        v10 = v30;
        v12 = 0;
      }

      goto LABEL_30;
    }
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[GCController(BluetoothSettings) _settingsSupportedForBTClassicDevice:settingsStore:].cold.1((uint64_t)v7, v9);
      LOBYTE(v13) = 0;
LABEL_30:

      goto LABEL_31;
    }
  }
  LOBYTE(v13) = 0;
LABEL_31:

  return v13;
}

BOOL __86__GCController_BluetoothSettings___settingsSupportedForBTClassicDevice_settingsStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  void *v11;
  _BOOL8 v12;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "rangeOfFirstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  if (v7 == 0x7FFFFFFFFFFFFFFFLL && v8 == 0)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v5, "substringWithRange:", v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("-"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "caseInsensitiveCompare:", v6) == 0;
  }

  return v12;
}

+ (BOOL)settingsSupportedForCBDevice:(id)a3
{
  id v4;
  BOOL v5;
  char v6;

  v4 = a3;
  if (settingsSupportedForCBDevice__onceToken != -1)
    dispatch_once(&settingsSupportedForCBDevice__onceToken, &__block_literal_global_398);
  if ((objc_msgSend(v4, "deviceFlags") & 0x4000) != 0)
  {
    v6 = objc_msgSend(a1, "_settingsSupportedForBTClassicDevice:settingsStore:", v4, settingsSupportedForCBDevice___settingsStore);
LABEL_8:
    v5 = v6;
    goto LABEL_9;
  }
  if ((objc_msgSend(v4, "deviceFlags") & 0x2000) != 0)
  {
    v6 = objc_msgSend(a1, "_settingsSupportedForBLEDevice:settingsStore:", v4, settingsSupportedForCBDevice___settingsStore);
    goto LABEL_8;
  }
  v5 = 0;
LABEL_9:

  return v5;
}

void __64__GCController_BluetoothSettings__settingsSupportedForCBDevice___block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = (void *)objc_msgSend(objc_alloc((Class)&off_254DEF040), "initWithSuiteName:", CFSTR("com.apple.GameController"));
  v1 = v0;
  if (v0)
  {
    v2 = v0;
  }
  else
  {
    +[NSUserDefaults standardUserDefaults](&off_254DEF040, "standardUserDefaults");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v2;

  v3 = objc_msgSend(objc_alloc((Class)&off_254E00648), "initWithUserDefaults:", v5);
  v4 = (void *)settingsSupportedForCBDevice___settingsStore;
  settingsSupportedForCBDevice___settingsStore = v3;

}

+ (BOOL)userHasPairedGameController
{
  if (userHasPairedGameController_onceToken != -1)
    dispatch_once(&userHasPairedGameController_onceToken, &__block_literal_global_408);
  return objc_msgSend((id)userHasPairedGameController__defaults, "BOOLForKey:", CFSTR("showGCPrefsPane"));
}

void __53__GCController_AppStore__userHasPairedGameController__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc((Class)&off_254DEF040), "initWithSuiteName:", CFSTR("com.apple.GameController"));
  v1 = (void *)userHasPairedGameController__defaults;
  userHasPairedGameController__defaults = v0;

}

+ (BOOL)userHasPairedGameControllerSupportingInteractionProfile:(id)a3
{
  return 1;
}

+ (BOOL)userHasRecentlyInstalledGameSupportingInteractionProfile:(id)a3
{
  return _os_feature_enabled_impl() ^ 1;
}

+ (void)__open__
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_34);
}

void __32__GCController_Legacy____open____block_invoke()
{
  id v0;

  +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "open");

}

+ (void)__openXPC__
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_64_0);
}

void __35__GCController_Legacy____openXPC____block_invoke()
{
  id v0;

  +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "open");

}

+ (void)__openXPC_and_CBApplicationDidBecomeActive__
{
  id v2;

  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_65_0);
  if (GCApplicationIsAlmond())
  {
    +[NSUserDefaults standardUserDefaults](&off_254DEF040, "standardUserDefaults");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "registerDefaults:", &unk_24D30F980);

  }
}

void __68__GCController_Legacy____openXPC_and_CBApplicationDidBecomeActive____block_invoke()
{
  void *v0;
  id v1;

  +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "open");

  +[_GCCurrentApplicationForegroundMonitor sharedInstance]();
  v1 = (id)objc_claimAutoreleasedReturnValue();
  -[_GCCurrentApplicationForegroundMonitor CBApplicationDidBecomeActive](v1);

}

+ (id)snapshotWithProfile:(id)a3
{
  id v3;
  GCController *v4;
  GCController *v5;

  v3 = a3;
  v4 = [GCController alloc];
  -[GCController _setSnapshot:](v4, "_setSnapshot:", 1);
  v5 = -[GCController initWithProfile:](v4, "initWithProfile:", v3);

  return v5;
}

- (GCController)initWithProfile:(id)a3
{
  id v5;
  GCController *v6;
  GCController *v7;
  NSMutableArray *v8;
  NSMutableArray *hidServices;
  void *v10;
  void *v11;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GCController;
  v6 = -[GCController init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_handlerQueue, MEMORY[0x24BDAC9B8]);
    v8 = (NSMutableArray *)objc_alloc_init((Class)&off_254DEBB20);
    hidServices = v7->_hidServices;
    v7->_hidServices = v8;

    +[NSUUID UUID](&off_254DEEE48, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCController setPhysicalDeviceUniqueID:](v7, "setPhysicalDeviceUniqueID:", v11);

    objc_storeStrong((id *)&v7->_profile, a3);
    -[GCNamedProfile setController:](v7->_profile, "setController:", v7);
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = -[GCController deviceHash](v7, "deviceHash");
        *(_DWORD *)buf = 134217984;
        v21 = v14;
        _os_log_impl(&dword_215181000, v13, OS_LOG_TYPE_INFO, "DeviceHash: 0x%lx", buf, 0xCu);
      }

    }
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        -[GCController vendorName](v7, "vendorName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v21 = (uint64_t)v16;
        _os_log_impl(&dword_215181000, v15, OS_LOG_TYPE_INFO, "VendorName: %@", buf, 0xCu);

      }
    }
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        -[GCController debugName](v7, "debugName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v21 = (uint64_t)v18;
        _os_log_impl(&dword_215181000, v17, OS_LOG_TYPE_INFO, "DebugName: %@", buf, 0xCu);

      }
    }
  }

  return v7;
}

- (GCController)initWithProfileClass:(Class)a3 serviceRef:(__IOHIDServiceClient *)a4
{
  GCController *v6;
  NSMutableArray *v7;
  NSMutableArray *hidServices;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  GCNamedProfile *profile;
  GCNamedProfile *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v25;
  GCController *v26;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  __IOHIDServiceClient *v33;
  NSObject *v34;
  __IOHIDServiceClient *v35;
  NSObject *v36;
  objc_super v37;
  uint8_t buf[4];
  __IOHIDServiceClient *v39;
  __int16 v40;
  GCController *v41;
  __int16 v42;
  Class v43;
  __int16 v44;
  _BOOL4 v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v37.receiver = self;
  v37.super_class = (Class)GCController;
  v6 = -[GCController init](&v37, sel_init);
  if (!v6)
    goto LABEL_23;
  v7 = (NSMutableArray *)objc_alloc_init((Class)&off_254DEBB20);
  hidServices = v6->_hidServices;
  v6->_hidServices = v7;

  v9 = (void *)objc_msgSend(objc_alloc((Class)&off_254DE4170), "initWithService:", a4);
  -[NSMutableArray addObject:](v6->_hidServices, "addObject:", v9);
  objc_msgSend(v9, "stringPropertyForKey:", CFSTR("PhysicalDeviceUniqueID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCController setPhysicalDeviceUniqueID:](v6, "setPhysicalDeviceUniqueID:", v10);

  objc_msgSend(v9, "numberPropertyForKey:", CFSTR("UsesCompass"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCController setPhysicalDeviceUsesCompass:](v6, "setPhysicalDeviceUsesCompass:", objc_msgSend(v11, "BOOLValue"));

  objc_msgSend(v9, "stringPropertyForKey:", CFSTR("SerialNumber"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCController setUniqueIdentifier:](v6, "setUniqueIdentifier:", v12);

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = -[GCController physicalDeviceUsesCompass](v6, "physicalDeviceUsesCompass");
      *(_DWORD *)buf = 138413058;
      v39 = a4;
      v40 = 2112;
      v41 = v6;
      v42 = 2112;
      v43 = a3;
      v44 = 1024;
      v45 = v29;
      _os_log_impl(&dword_215181000, v28, OS_LOG_TYPE_DEFAULT, "initWithServiceRef: \n%@...\n controller: %@, controllerClass: %@, %d", buf, 0x26u);
    }

    if (!a3)
      goto LABEL_22;
  }
  else if (!a3)
  {
LABEL_22:
    objc_storeStrong((id *)&v6->_handlerQueue, MEMORY[0x24BDAC9B8]);
    -[GCController setPlayerIndex:](v6, "setPlayerIndex:", -1);

LABEL_23:
    v26 = v6;
    goto LABEL_24;
  }
  v13 = objc_msgSend([a3 alloc], "initWithController:", v6);
  profile = v6->_profile;
  v6->_profile = (GCNamedProfile *)v13;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && -[GCNamedProfile conformsToProtocol:](v6->_profile, "conformsToProtocol:", &unk_254DCB1F0))
    {
      objc_msgSend(v9, "numberPropertyForKey:", CFSTR("ProductID"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "unsignedIntValue");

      if ((v24 & 0xFFFFFFFE) == 0x314)
        v25 = 6;
      else
        v25 = 5;
      -[GCNamedProfile setDeviceType:](v6->_profile, "setDeviceType:", v25);
    }
    goto LABEL_19;
  }
  v15 = v6->_profile;
  objc_msgSend(v9, "numberPropertyForKey:", CFSTR("VendorID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntValue");

  objc_msgSend(v9, "numberPropertyForKey:", CFSTR("ProductID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedIntValue");

  objc_msgSend(v9, "stringPropertyForKey:", CFSTR("Transport"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v17 != 76)
    goto LABEL_16;
  if (v19 == 621)
  {
    v22 = 2;
    goto LABEL_15;
  }
  if (v19 != 614)
  {
LABEL_16:

LABEL_19:
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = -[GCController deviceHash](v6, "deviceHash");
        *(_DWORD *)buf = 134217984;
        v39 = (__IOHIDServiceClient *)v31;
        _os_log_impl(&dword_215181000, v30, OS_LOG_TYPE_INFO, "DeviceHash: %lu", buf, 0xCu);
      }

    }
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        -[GCController vendorName](v6, "vendorName");
        v33 = (__IOHIDServiceClient *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v39 = v33;
        _os_log_impl(&dword_215181000, v32, OS_LOG_TYPE_INFO, "VendorName: %@", buf, 0xCu);

      }
    }
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        -[GCController debugName](v6, "debugName");
        v35 = (__IOHIDServiceClient *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v39 = v35;
        _os_log_impl(&dword_215181000, v34, OS_LOG_TYPE_INFO, "DebugName: %@", buf, 0xCu);

      }
    }
    goto LABEL_22;
  }
  if ((objc_msgSend(v20, "isEqualToString:", CFSTR("Rapport")) & 1) != 0)
  {
    v22 = 4;
LABEL_15:
    -[GCNamedProfile setDeviceType:](v15, "setDeviceType:", v22);
    goto LABEL_16;
  }
  if ((objc_msgSend(v21, "isEqualToString:", CFSTR("BluetoothLowEnergy")) & 1) != 0)
  {
    v22 = 1;
    goto LABEL_15;
  }
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215181000, v36, OS_LOG_TYPE_DEFAULT, "App Store HID remote detected, rejecting.", buf, 2u);
    }

  }
  v26 = 0;
LABEL_24:

  return v26;
}

- (GCController)initWithServiceRef:(__IOHIDServiceClient *)a3
{
  id v5;
  GCController *v6;

  v5 = ControllerClassForService(a3);
  if (v5)
  {
    self = -[GCController initWithProfileClass:serviceRef:](self, "initWithProfileClass:serviceRef:", v5, a3);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (GCController)initWithCoder:(id)a3
{
  id v4;
  GCController *v5;
  NSMutableArray *v6;
  NSMutableArray *hidServices;
  int v8;
  int v9;
  uint64_t v10;
  NSString *vendorName;
  __objc2_class *v12;
  uint64_t v13;
  GCNamedProfile *profile;
  GCNamedProfile *v15;
  GCMotion *v16;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  objc_super v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)GCController;
  v5 = -[GCController init](&v24, sel_init);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)&off_254DEBB20);
    hidServices = v5->_hidServices;
    v5->_hidServices = v6;

    v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isExtended"));
    v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasMotion"));
    v5->_deviceHash = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("deviceHash"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vendorName"));
    v10 = objc_claimAutoreleasedReturnValue();
    vendorName = v5->_vendorName;
    v5->_vendorName = (NSString *)v10;

    if (gc_isInternalBuild())
    {
      getGCLogger();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = -[GCController deviceHash](v5, "deviceHash");
        *(_DWORD *)buf = 134217984;
        v26 = v19;
        _os_log_impl(&dword_215181000, v18, OS_LOG_TYPE_INFO, "DeviceHash: %lu", buf, 0xCu);
      }

    }
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        -[GCController vendorName](v5, "vendorName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v26 = (uint64_t)v21;
        _os_log_impl(&dword_215181000, v20, OS_LOG_TYPE_INFO, "VendorName: %@", buf, 0xCu);

      }
    }
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        -[GCController debugName](v5, "debugName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v26 = (uint64_t)v23;
        _os_log_impl(&dword_215181000, v22, OS_LOG_TYPE_INFO, "DebugName: %@", buf, 0xCu);

      }
    }
    objc_storeStrong((id *)&v5->_handlerQueue, MEMORY[0x24BDAC9B8]);
    if (v8)
      v12 = GCExtendedGamepadSnapshot;
    else
      v12 = GCGamepadSnapshot;
    v13 = objc_msgSend([v12 alloc], "initWithController:", v5);
    profile = v5->_profile;
    v5->_profile = (GCNamedProfile *)v13;

    if (v9 && -[GCNamedProfile conformsToProtocol:](v5->_profile, "conformsToProtocol:", &unk_254DC5518))
    {
      v15 = v5->_profile;
      v16 = -[GCMotion initWithController:]([GCMotion alloc], "initWithController:", v5);
      if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasCompass")))
        -[GCMotion _setCompassEnabled:](v16, "_setCompassEnabled:", 1);
      -[GCNamedProfile set_motion:](v15, "set_motion:", v16);

    }
    -[GCController setPlayerIndex:](v5, "setPlayerIndex:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("playerIndex")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[GCController extendedGamepad](self, "extendedGamepad");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v5 != 0, CFSTR("isExtended"));

  -[GCController motion](self, "motion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v6 != 0, CFSTR("hasMotion"));

  -[GCController motion](self, "motion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(v7, "hasAttitudeAndRotationRate"), CFSTR("hasCompass"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[GCController playerIndex](self, "playerIndex"), CFSTR("playerIndex"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[GCController deviceHash](self, "deviceHash"), CFSTR("deviceHash"));
  -[GCController vendorName](self, "vendorName");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("vendorName"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCNamedProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
}

- (NSArray)hidServices
{
  return (NSArray *)self->_hidServices;
}

- (void)setHidServices:(id)a3
{
  objc_storeStrong((id *)&self->_hidServices, a3);
}

- (NSString)physicalDeviceUniqueID
{
  return self->_physicalDeviceUniqueID;
}

- (void)setPhysicalDeviceUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_physicalDeviceUniqueID, a3);
}

- (BOOL)physicalDeviceUsesCompass
{
  return self->_physicalDeviceUsesCompass;
}

- (void)setPhysicalDeviceUsesCompass:(BOOL)a3
{
  self->_physicalDeviceUsesCompass = a3;
}

- (unint64_t)deviceHash
{
  unint64_t result;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (!self->_profile)
    return 0;
  result = self->_deviceHash;
  if (!result)
  {
    if (!-[NSMutableArray count](self->_hidServices, "count")
      || (-[NSMutableArray objectAtIndexedSubscript:](self->_hidServices, "objectAtIndexedSubscript:", 0),
          (v4 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      self->_deviceHash = -[GCController hash](self, "hash");
      return self->_deviceHash;
    }
    v5 = (void *)v4;
    if (-[GCController isATVRemote](self, "isATVRemote"))
    {
      -[GCController profile](self, "profile");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[GCController profile](self, "profile");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_15:
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v8;
            _os_log_impl(&dword_215181000, v21, OS_LOG_TYPE_DEFAULT, "hashBase = %@", buf, 0xCu);
          }

        }
        self->_deviceHash = objc_msgSend(v8, "hash");

        return self->_deviceHash;
      }
      -[GCController profile](self, "profile");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "deviceType") == 4)
      {
        -[GCController hidServices](self, "hidServices");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "registryID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "description");
        v15 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v15;
      }
    }
    else
    {
      objc_msgSend(v5, "stringPropertyForKey:", CFSTR("PhysicalDeviceUniqueID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v16;
      if (v16)
      {
        v11 = v16;
        v8 = v11;
      }
      else
      {
        objc_msgSend(v5, "numberPropertyForKey:", CFSTR("LocationID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "numberPropertyForKey:", CFSTR("VendorID"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "numberPropertyForKey:", CFSTR("ProductID"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "registryID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("%@ %@ %@ %@"), v18, v19, v17, v20);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }

    goto LABEL_15;
  }
  return result;
}

- (void)setDeviceHash:(unint64_t)a3
{
  self->_deviceHash = a3;
}

- (NSString)debugName
{
  NSString *debugName;
  void *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;

  if (self->_vendorName || self->_deviceHash)
  {
    debugName = self->_debugName;
    if (!debugName)
    {
      -[GCController productCategory](self, "productCategory");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("%@ (0x%02lx)"), v4, self->_deviceHash);
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      v6 = self->_debugName;
      self->_debugName = v5;

      debugName = self->_debugName;
    }
    v7 = debugName;
  }
  else
  {
    -[GCController description](self, "description");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)setDebugName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (BOOL)isForwarded
{
  return self->_forwarded;
}

- (void)setForwarded:(BOOL)a3
{
  self->_forwarded = a3;
}

- (BOOL)areAllHIDDevicesConnected
{
  return self->_allHIDDevicesConnected;
}

- (void)setAllHIDDevicesConnected:(BOOL)a3
{
  self->_allHIDDevicesConnected = a3;
}

- (BOOL)isPublished
{
  return self->_published;
}

- (void)setPublished:(BOOL)a3
{
  self->_published = a3;
}

- (BOOL)_legacy_isAttachedToDevice
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;
  void *v7;
  void *v8;
  int v9;
  char v10;

  if (!-[NSMutableArray count](self->_hidServices, "count"))
    return 0;
  -[NSMutableArray objectAtIndexedSubscript:](self->_hidServices, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberPropertyForKey:", CFSTR("GameControllerFormFitting"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 0;
  -[NSMutableArray objectAtIndexedSubscript:](self->_hidServices, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberPropertyForKey:", CFSTR("IAPHIDAccessoryCategory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "intValue");
  if (v9 == 3)
    v10 = 1;
  else
    v10 = v5;
  if (v9 == 4)
    v6 = 1;
  else
    v6 = v10;

  return v6;
}

- (id)_legacy_vendorName
{
  id *p_vendorName;
  GCNamedProfile *profile;
  __CFString *v5;
  _BOOL4 allHIDDevicesConnected;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;

  p_vendorName = (id *)&self->_vendorName;
  if (self->_vendorName)
    goto LABEL_16;
  profile = self->_profile;
  v5 = CFSTR("Generic Controller");
  if (profile)
  {
    if (!-[GCNamedProfile conformsToProtocol:](profile, "conformsToProtocol:", &unk_254DCB1F0))
    {
      if (!-[NSMutableArray count](self->_hidServices, "count"))
      {
        if (-[GCNamedProfile conformsToProtocol:](self->_profile, "conformsToProtocol:", &unk_254DC5518))
        {
          -[GCNamedProfile name](self->_profile, "name");
          v10 = objc_claimAutoreleasedReturnValue();
          v7 = *p_vendorName;
          *p_vendorName = (id)v10;
        }
        else
        {
          v7 = *p_vendorName;
          *p_vendorName = CFSTR("Generic Controller");
        }
        goto LABEL_15;
      }
      -[NSMutableArray objectAtIndexedSubscript:](self->_hidServices, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringPropertyForKey:", CFSTR("Product"));
      v7 = (id)objc_claimAutoreleasedReturnValue();

      objc_storeStrong(p_vendorName, v7);
      v8 = *p_vendorName;
      if (*p_vendorName)
      {
LABEL_15:

LABEL_16:
        v5 = (__CFString *)*p_vendorName;
        return v5;
      }
LABEL_9:
      *p_vendorName = v5;

      goto LABEL_15;
    }
    if (!-[GCController displayTrueSiriRemoteName](self, "displayTrueSiriRemoteName"))
    {
      v7 = *p_vendorName;
      *p_vendorName = CFSTR("Remote");
      goto LABEL_15;
    }
    allHIDDevicesConnected = self->_allHIDDevicesConnected;
    VendorNameForATVProfile(self->_profile);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("%@%@"), v7, &stru_24D2B85A8);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (allHIDDevicesConnected)
    {
      v8 = *p_vendorName;
      goto LABEL_9;
    }

  }
  return v5;
}

- (void)setVendorName:(id)a3
{
  objc_storeStrong((id *)&self->_vendorName, a3);
}

- (BOOL)displayTrueSiriRemoteName
{
  if (displayTrueSiriRemoteName_onceToken != -1)
    dispatch_once(&displayTrueSiriRemoteName_onceToken, &__block_literal_global_216);
  return displayTrueSiriRemoteName_displayTrueSiriRemoteName;
}

void __49__GCController_Legacy__displayTrueSiriRemoteName__block_invoke()
{
  id v0;

  +[NSUserDefaults standardUserDefaults](&off_254DEF040, "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  displayTrueSiriRemoteName_displayTrueSiriRemoteName = objc_msgSend(v0, "BOOLForKey:", CFSTR("displayTrueSiriRemoteName"));

}

- (id)_legacy_productCategory
{
  return (id)-[GCNamedProfile productCategory](self->_profile, "productCategory");
}

- (BOOL)_legacy_isEqualToController:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  BOOL v19;
  id v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD block[4];
  id v33;
  GCController *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[GCController deviceHash](self, "deviceHash");
  if (v5 == objc_msgSend(v4, "deviceHash"))
  {
    v21 = v4;
    objc_msgSend(v4, "hidServices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v43 = 0;
      v44 = &v43;
      v45 = 0x3032000000;
      v46 = __Block_byref_object_copy__8;
      v47 = __Block_byref_object_dispose__8;
      v48 = 0;
      v37 = 0;
      v38 = &v37;
      v39 = 0x3032000000;
      v40 = __Block_byref_object_copy__8;
      v41 = __Block_byref_object_dispose__8;
      v42 = 0;
      +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "controllersQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __52__GCController_Legacy___legacy_isEqualToController___block_invoke;
      block[3] = &unk_24D2B5B68;
      v35 = &v43;
      v36 = &v37;
      v33 = v4;
      v34 = self;
      dispatch_barrier_sync(v9, block);

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      obj = (id)v44[5];
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v50, 16);
      if (v10)
      {
        v23 = *(_QWORD *)v29;
        while (1)
        {
          v11 = 0;
LABEL_6:
          if (*(_QWORD *)v29 != v23)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v11), "numberPropertyForKey:", CFSTR("LocationID"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v13 = (id)v38[5];
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v49, 16);
          if (!v14)
            break;
          v15 = *(_QWORD *)v25;
LABEL_10:
          v16 = 0;
          while (1)
          {
            if (*(_QWORD *)v25 != v15)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v16), "numberPropertyForKey:", CFSTR("LocationID"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v12, "isEqualToNumber:", v17);

            if ((v18 & 1) != 0)
              break;
            if (v14 == ++v16)
            {
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v49, 16);
              if (v14)
                goto LABEL_10;
              goto LABEL_21;
            }
          }

          if (++v11 != v10)
            goto LABEL_6;
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v50, 16);
          v19 = 1;
          if (!v10)
            goto LABEL_24;
        }
LABEL_21:

        v19 = 0;
      }
      else
      {
        v19 = 1;
      }
LABEL_24:

      _Block_object_dispose(&v37, 8);
      _Block_object_dispose(&v43, 8);

    }
    else
    {
      v19 = 1;
    }
    v4 = v21;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

void __52__GCController_Legacy___legacy_isEqualToController___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "hidServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 40), "hidServices");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v9, "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (void)_legacy_invalidateDescription
{
  NSString *description;
  NSString *debugName;

  description = self->_description;
  self->_description = 0;

  debugName = self->_debugName;
  self->_debugName = 0;

}

- (id)_legacy_description
{
  NSString *description;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  void *v11;

  description = self->_description;
  if (!description)
  {
    -[GCController vendorName](self, "vendorName");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4 || (v5 = (void *)v4, v6 = -[GCController deviceHash](self, "deviceHash"), v5, !v6))
    {
      -[GCController productCategory](self, "productCategory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<GCController %p ('%@' - 0x%lx)>"), self, v11, -[GCController deviceHash](self, "deviceHash"));
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();

      return v10;
    }
    -[GCController productCategory](self, "productCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<GCController %p ('%@' - 0x%lx)>"), self, v7, -[GCController deviceHash](self, "deviceHash"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_description;
    self->_description = v8;

    description = self->_description;
  }
  v10 = description;
  return v10;
}

- (void)_legacy_handleEvent:(__IOHIDEvent *)a3
{
  -[GCNamedProfile _legacy_handleEvent:](self->_profile, "_legacy_handleEvent:", a3);
}

- (void)createInputBufferForDevice:(__IOHIDDevice *)a3 withSize:(unint64_t)a4
{
  return 0;
}

- (void)addServiceRefs:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a3, "hidServices", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableArray addObject:](self->_hidServices, "addObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)addServiceRefsWithDevice:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a3, "hidServices", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableArray addObject:](self->_hidServices, "addObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)addServiceRef:(id)a3
{
  -[NSMutableArray addObject:](self->_hidServices, "addObject:", a3);
}

- (BOOL)hasServiceRef:(__IOHIDServiceClient *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[GCController hidServices](self, "hidServices", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((__IOHIDServiceClient *)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "service") == a3)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)removeServiceRef:(__IOHIDServiceClient *)a3
{
  void *v5;
  NSObject *v6;
  _QWORD v7[6];

  if (-[GCController hasServiceRef:](self, "hasServiceRef:"))
  {
    +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "controllersQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __41__GCController_Legacy__removeServiceRef___block_invoke;
    v7[3] = &unk_24D2B4240;
    v7[4] = self;
    v7[5] = a3;
    dispatch_barrier_sync(v6, v7);

  }
}

void __41__GCController_Legacy__removeServiceRef___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "copy");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "service", (_QWORD)v9) == *(_QWORD *)(a1 + 40))
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "removeObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)clearServiceRef
{
  -[NSMutableArray removeAllObjects](self->_hidServices, "removeAllObjects");
}

- (BOOL)isATVRemote
{
  void *v3;
  void *v4;
  char v5;

  -[GCController profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[GCController profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_254DCB1F0);

  return v5;
}

- (unsigned)sampleRate
{
  void *v3;
  char v4;
  void *v5;
  unsigned int v6;

  -[GCController profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[GCController profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sampleRate");

  return v6;
}

- (int64_t)_legacy_playerIndex
{
  return self->_playerIndex;
}

- (void)_legacy_setPlayerIndex:(int64_t)a3
{
  if (a3 < 0)
    a3 = -1;
  self->_playerIndex = a3;
  -[GCNamedProfile setPlayerIndex:](self->_profile, "setPlayerIndex:");
}

- (id)_legacy_input
{
  _GCControllerInputComponent *legacy_input;
  void *v4;
  void *v5;
  GCController *v7;
  GCControllerLiveInput *v8;
  void *v9;
  GCControllerLiveInput *v10;
  void *v11;
  _GCDevicePhysicalInput *v12;
  void *v13;
  _GCDevicePhysicalInput *v14;
  _GCDevicePhysicalInput *v15;
  void *v16;
  _GCDevicePhysicalInput *v17;
  _GCControllerInputComponent *v18;
  void *v19;
  void *v20;
  _GCControllerInputComponent *v21;
  _GCControllerInputComponent *v22;
  const char *v23;
  void *v24;
  void *v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  legacy_input = self->_legacy_input;
  if (legacy_input)
  {
    -[_GCDevicePhysicalInputComponent defaultPhysicalInput]((id *)&legacy_input->super.super.isa, a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputBase facade]((uint64_t)v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7 = self;
    objc_sync_enter(v7);
    if (!self->_legacy_input)
    {
      v8 = [GCControllerLiveInput alloc];
      v9 = (void *)objc_opt_new();
      v10 = -[_GCDevicePhysicalInputFacade initWithParameters:](v8, "initWithParameters:", v9);

      +[NSSet set](&off_254DEBEC0, "set");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = [_GCDevicePhysicalInput alloc];
      +[NSSet set](&off_254DEBEC0, "set");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[_GCDevicePhysicalInput initWithFacade:elements:attributes:](v12, "initWithFacade:elements:attributes:", v10, v11, v13);

      v15 = [_GCDevicePhysicalInput alloc];
      +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("unmapped"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[_GCDevicePhysicalInput initWithFacade:elements:attributes:](v15, "initWithFacade:elements:attributes:", v10, v11, v16);

      v18 = [_GCControllerInputComponent alloc];
      +[NSUUID UUID](&off_254DEEE48, "UUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v14;
      v26[1] = v17;
      +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v26, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[_GCDevicePhysicalInputComponent initWithIdentifier:physicalInputs:](v18, "initWithIdentifier:physicalInputs:", v19, v20);
      v22 = self->_legacy_input;
      self->_legacy_input = v21;

    }
    objc_sync_exit(v7);

    -[_GCDevicePhysicalInputComponent defaultPhysicalInput]((id *)&self->_legacy_input->super.super.isa, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputBase facade]((uint64_t)v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    return v25;
  }
}

- (id)_legacy_physicalInputProfileName
{
  void *v2;
  void *v3;

  -[GCController profile](self, "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_legacy_physicalInputProfile
{
  return self->_profile;
}

- (id)_legacy_gamepad
{
  GCNamedProfile *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = self->_profile;
  else
    v3 = 0;
  return v3;
}

- (id)_legacy_microGamepad
{
  char isKindOfClass;
  GCNamedProfile *profile;
  char v5;
  GCNamedProfile *v6;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  profile = self->_profile;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    v5 = objc_opt_isKindOfClass();
    profile = self->_profile;
    if ((v5 & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v6 = 0;
        return v6;
      }
      profile = self->_profile;
    }
  }
  v6 = profile;
  return v6;
}

- (id)_legacy_extendedGamepad
{
  GCNamedProfile *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self->_profile;
  else
    v3 = 0;
  return v3;
}

- (id)_legacy_keyboard
{
  GCNamedProfile *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self->_profile;
  else
    v3 = 0;
  return v3;
}

- (id)_legacy_mouse
{
  GCNamedProfile *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self->_profile;
  else
    v3 = 0;
  return v3;
}

- (id)_legacy_motion
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[GCNamedProfile performSelector:](self->_profile, "performSelector:", sel__motion);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_legacy_batteryStatus
{
  return 0;
}

@end
