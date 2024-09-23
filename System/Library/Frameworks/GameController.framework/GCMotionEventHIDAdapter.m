@implementation GCMotionEventHIDAdapter

void __51___GCMotionEventHIDAdapter_initWithSource_service___block_invoke(uint64_t a1)
{
  uint64_t IntegerValue;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int Type;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (IOHIDEventGetType() == 1)
  {
    IntegerValue = IOHIDEventGetIntegerValue();
    v3 = IOHIDEventGetIntegerValue();
    if (IntegerValue == 65280 && v3 == 59)
    {
      v4 = *(_QWORD *)(a1 + 32);
      if (!v4 || v4 == IOHIDEventGetSenderID() || IOHIDEventGetSenderID() == -1)
      {
        v5 = (void *)objc_opt_new();
        objc_msgSend(v5, "setTimestamp:", IOHIDEventGetTimeStamp());
        IOHIDEventGetChildren();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v22;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v22 != v9)
                objc_enumerationMutation(v6);
              Type = IOHIDEventGetType();
              switch(Type)
              {
                case 10:
                  objc_msgSend(v5, "setHasAttitude:", 1);
                  IOHIDEventGetFloatValue();
                  objc_msgSend(v5, "setAttitudeX:");
                  IOHIDEventGetFloatValue();
                  objc_msgSend(v5, "setAttitudeY:");
                  IOHIDEventGetFloatValue();
                  objc_msgSend(v5, "setAttitudeZ:");
                  IOHIDEventGetFloatValue();
                  objc_msgSend(v5, "setAttitudeW:");
                  break;
                case 13:
                  objc_msgSend(v5, "setHasAccelerometer:", 1);
                  IOHIDEventGetDoubleValue();
                  objc_msgSend(v5, "setAccelerometerX:");
                  IOHIDEventGetDoubleValue();
                  objc_msgSend(v5, "setAccelerometerY:");
                  IOHIDEventGetDoubleValue();
                  objc_msgSend(v5, "setAccelerometerZ:");
                  break;
                case 20:
                  objc_msgSend(v5, "setHasGyro:", 1);
                  IOHIDEventGetDoubleValue();
                  objc_msgSend(v5, "setGyroPitch:");
                  IOHIDEventGetDoubleValue();
                  objc_msgSend(v5, "setGyroYaw:");
                  IOHIDEventGetDoubleValue();
                  objc_msgSend(v5, "setGyroRoll:");
                  break;
              }
              ++v10;
            }
            while (v8 != v10);
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
          }
          while (v8);
        }
        objc_getProperty(*(id *)(a1 + 40), sel_observers, 24, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v18;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v18 != v15)
                objc_enumerationMutation(v12);
              (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++) + 16))();
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v14);
        }

      }
    }
  }
}

void __48___GCMotionEventHIDAdapter_observeMotionEvents___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x2199DEBB0](*(_QWORD *)(a1 + 40));
  v4 = objc_msgSend(v2, "containsObject:", v3);

  if (v4)
  {
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "observers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "mutableCopy");

      v7 = (void *)MEMORY[0x2199DEBB0](*(_QWORD *)(a1 + 40));
      objc_msgSend(v6, "removeObject:", v7);

      objc_msgSend(*(id *)(a1 + 32), "setObservers:", v6);
      objc_msgSend(*(id *)(a1 + 32), "observers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x2199DEBB0](*(_QWORD *)(a1 + 40));
      v10 = objc_msgSend(v8, "containsObject:", v9);

    }
    while ((v10 & 1) != 0);
  }
}

@end
