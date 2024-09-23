@implementation CARInputDeviceManager

- (CARInputDeviceManager)initWithEndpointInputDevices:(id)a3 screenIDs:(id)a4 vehicleInformation:(id)a5 session:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CARInputDeviceManager *v14;
  CARInputDeviceManager *v15;
  uint64_t v16;
  NSArray *inputDevices;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CARInputDeviceManager;
  v14 = -[CARInputDeviceManager init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_session, v13);
    -[CARInputDeviceManager _generateInputDevicesWithEndpointInputDevices:screenIDs:vehicleInformation:](v15, "_generateInputDevicesWithEndpointInputDevices:screenIDs:vehicleInformation:", v10, v11, v12);
    v16 = objc_claimAutoreleasedReturnValue();
    inputDevices = v15->_inputDevices;
    v15->_inputDevices = (NSArray *)v16;

  }
  return v15;
}

- (id)_generateInputDevicesWithEndpointInputDevices:(id)a3 screenIDs:(id)a4 vehicleInformation:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  id v14;
  CFArrayRef v15;
  unint64_t v16;
  __IOHIDServiceClient *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __IOHIDServiceClient *v29;
  __IOHIDServiceClient *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  CARInputDeviceTouchpad *v36;
  void *v37;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id obj;
  __IOHIDEventSystemClient *cf;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _QWORD v57[2];
  _QWORD v58[2];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v7 = a4;
  v43 = a5;
  v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v47 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  cf = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v53;
    v11 = *MEMORY[0x1E0C9AE40];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v53 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
        v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v47, "setObject:forKey:", v14, v13);
        v57[0] = CFSTR("Built-In");
        v57[1] = CFSTR("displayUUID");
        v58[0] = v11;
        v58[1] = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
        IOHIDEventSystemClientSetMatching();
        v15 = IOHIDEventSystemClientCopyServices(cf);
        if (-[__CFArray count](v15, "count"))
        {
          v16 = 0;
          do
          {
            v17 = (__IOHIDServiceClient *)-[__CFArray objectAtIndex:](v15, "objectAtIndex:", v16);
            v18 = (void *)IOHIDServiceClientCopyProperty(v17, CFSTR("SerialNumber"));
            if (v18)
              objc_msgSend(v14, "setObject:forKey:", v17, v18);

            ++v16;
          }
          while (v16 < -[__CFArray count](v15, "count"));
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    }
    while (v9);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v19 = v40;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v49;
    v23 = *MEMORY[0x1E0CA39B8];
    v39 = *(_QWORD *)v49;
    v41 = v19;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v49 != v22)
          objc_enumerationMutation(v19);
        v25 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
        objc_msgSend(v25, "objectForKey:", v23, v39);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKey:", CFSTR("displayUUID"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "objectForKey:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = (__IOHIDServiceClient *)objc_msgSend(v28, "objectForKey:", v26);
        if (v29)
        {
          v30 = v29;
          v31 = (void *)IOHIDServiceClientCopyProperty(v29, CFSTR("PrimaryUsagePage"));
          v32 = (void *)IOHIDServiceClientCopyProperty(v30, CFSTR("PrimaryUsage"));
          if (objc_msgSend(v31, "integerValue") == 13 && objc_msgSend(v32, "integerValue") == 5)
          {
            if (v43)
            {
              -[CARInputDeviceManager _touchpadSettingsFromVehicleInformation:](self, "_touchpadSettingsFromVehicleInformation:");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = v33;
              if (v33)
              {
                objc_msgSend(v33, "objectForKey:", v26);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v35 = 0;
              }

            }
            else
            {
              v35 = 0;
            }
            v36 = -[CARInputDeviceTouchpad initWithServiceClient:UUID:settings:delegate:]([CARInputDeviceTouchpad alloc], "initWithServiceClient:UUID:settings:delegate:", v30, v26, v35, self);
            objc_msgSend(v42, "addObject:", v36);

            v22 = v39;
            v19 = v41;
          }

        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v21);
  }

  CFRelease(cf);
  v37 = (void *)objc_msgSend(v42, "copy");

  return v37;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CARInputDeviceManager inputDevices](self, "inputDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, input devices: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)vehicleInformationChanged:(id)a3
{
  void *v4;
  void *v5;

  -[CARInputDeviceManager _touchpadSettingsFromVehicleInformation:](self, "_touchpadSettingsFromVehicleInformation:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[CARInputDeviceManager _updateTouchpadSettings:](self, "_updateTouchpadSettings:", v4);
    v4 = v5;
  }

}

- (BOOL)touchpadCharacterRecognitionSupported
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__CARInputDeviceManager_touchpadCharacterRecognitionSupported__block_invoke;
  v4[3] = &unk_1E5429D48;
  v4[4] = &v5;
  -[CARInputDeviceManager _enumerateTouchpadsUsingBlock:](self, "_enumerateTouchpadsUsingBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __62__CARInputDeviceManager_touchpadCharacterRecognitionSupported__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "characterRecognitionSupported");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

- (id)touchpadWithSenderID:(unint64_t)a3
{
  void *v3;
  id v4;

  -[CARInputDeviceManager _inputDeviceWithSenderID:](self, "_inputDeviceWithSenderID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)performHapticType:(unint64_t)a3 deviceUUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[CARInputDeviceManager session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("hapticFeedbackType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("uuid");
  v11[0] = v8;
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sendCommand:withParameters:", CFSTR("performHapticFeedback"), v9);
}

- (void)_enumerateTouchpadsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[CARInputDeviceManager inputDevices](self, "inputDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__CARInputDeviceManager__enumerateTouchpadsUsingBlock___block_invoke;
  v7[3] = &unk_1E5429D70;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __55__CARInputDeviceManager__enumerateTouchpadsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_inputDeviceWithSenderID:(unint64_t)a3
{
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__9;
  v12 = __Block_byref_object_dispose__9;
  v13 = 0;
  -[CARInputDeviceManager inputDevices](self, "inputDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__CARInputDeviceManager__inputDeviceWithSenderID___block_invoke;
  v7[3] = &unk_1E5429D98;
  v7[4] = &v8;
  v7[5] = a3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __50__CARInputDeviceManager__inputDeviceWithSenderID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "senderID") == *(_QWORD *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)_updateTouchpadSettings:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__CARInputDeviceManager__updateTouchpadSettings___block_invoke;
  v6[3] = &unk_1E5429DC0;
  v7 = v4;
  v5 = v4;
  -[CARInputDeviceManager _enumerateTouchpadsUsingBlock:](self, "_enumerateTouchpadsUsingBlock:", v6);

}

void __49__CARInputDeviceManager__updateTouchpadSettings___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "updateSettingsWithSettings:", v5);
}

- (id)_touchpadSettingsFromVehicleInformation:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKey:", CFSTR("userPreferences"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  objc_msgSend(v3, "objectForKey:", CFSTR("touchpadSettings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_4:
    v4 = 0;
  }

  return v4;
}

- (id)_initWithInputDevices:(id)a3 session:(id)a4
{
  id v7;
  id v8;
  CARInputDeviceManager *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CARInputDeviceManager;
  v9 = -[CARInputDeviceManager init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_session, v8);
    objc_storeStrong(p_isa + 1, a3);
  }

  return p_isa;
}

- (NSArray)inputDevices
{
  return self->_inputDevices;
}

- (CARSession)session
{
  return (CARSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_inputDevices, 0);
}

@end
