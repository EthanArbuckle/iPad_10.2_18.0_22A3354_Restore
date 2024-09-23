@implementation GCExtendedGamepadSnapshot

- (NSData)snapshotData
{
  return (NSData *)(id)-[NSData copy](self->snapshotData, "copy");
}

- (void)setSnapshotData:(NSData *)snapshotData
{
  NSData *v4;
  NSData *v5;
  NSData *v6;
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
  double v19;
  void *v20;
  double v21;
  GCExtendedGamepadSnapshotData v22;

  v4 = snapshotData;
  memset(&v22, 0, sizeof(v22));
  if (GCExtendedGamepadSnapshotDataFromNSData(&v22, v4))
  {
    v5 = (NSData *)-[NSData copy](v4, "copy");
    v6 = self->snapshotData;
    self->snapshotData = v5;

    -[GCExtendedGamepad dpad](self, "dpad");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile setDpad:x:y:](self, "setDpad:x:y:", v7, v22.dpadX, v22.dpadY);

    -[GCExtendedGamepad buttonA](self, "buttonA");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile setButton:value:](self, "setButton:value:", v8, v22.buttonA);

    -[GCExtendedGamepad buttonB](self, "buttonB");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile setButton:value:](self, "setButton:value:", v9, v22.buttonB);

    -[GCExtendedGamepad buttonX](self, "buttonX");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile setButton:value:](self, "setButton:value:", v10, v22.buttonX);

    -[GCExtendedGamepad buttonY](self, "buttonY");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile setButton:value:](self, "setButton:value:", v11, v22.buttonY);

    -[GCExtendedGamepad leftThumbstick](self, "leftThumbstick");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile setDpad:x:y:](self, "setDpad:x:y:", v12, v22.leftThumbstickX, v22.leftThumbstickY);

    -[GCExtendedGamepad rightThumbstick](self, "rightThumbstick");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile setDpad:x:y:](self, "setDpad:x:y:", v13, v22.rightThumbstickX, v22.rightThumbstickY);

    -[GCExtendedGamepad leftShoulder](self, "leftShoulder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile setButton:value:](self, "setButton:value:", v14, v22.leftShoulder);

    -[GCExtendedGamepad rightShoulder](self, "rightShoulder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile setButton:value:](self, "setButton:value:", v15, v22.rightShoulder);

    -[GCExtendedGamepad leftTrigger](self, "leftTrigger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile setButton:value:](self, "setButton:value:", v16, v22.leftTrigger);

    -[GCExtendedGamepad rightTrigger](self, "rightTrigger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile setButton:value:](self, "setButton:value:", v17, v22.rightTrigger);

    if (v22.version >= 0x101u && v22.supportsClickableThumbsticks)
    {
      -[GCExtendedGamepad rightThumbstickButton](self, "rightThumbstickButton");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22.rightThumbstickButton)
        v19 = 1.0;
      else
        v19 = 0.0;
      -[GCPhysicalInputProfile setButton:value:](self, "setButton:value:", v18, v19);

      -[GCExtendedGamepad leftThumbstickButton](self, "leftThumbstickButton");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22.leftThumbstickButton)
        v21 = 1.0;
      else
        v21 = 0.0;
      -[GCPhysicalInputProfile setButton:value:](self, "setButton:value:", v20, v21);

    }
  }

}

- (GCExtendedGamepadSnapshot)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCExtendedGamepadSnapshot;
  return -[GCPhysicalInputProfile init](&v3, sel_init);
}

- (GCExtendedGamepadSnapshot)initWithSnapshotData:(NSData *)data
{
  return -[GCExtendedGamepadSnapshot initWithController:snapshotData:](self, "initWithController:snapshotData:", 0, data);
}

- (GCExtendedGamepadSnapshot)initWithController:(GCController *)controller snapshotData:(NSData *)data
{
  GCController *v6;
  NSData *v7;
  NSData *v8;
  int v9;
  GCExtendedGamepadSnapshot *v10;
  GCExtendedGamepadSnapshot *v11;
  uint64_t i;
  GCExtendedGamepadSnapshot *v13;
  objc_super v15;
  _BYTE snapshotData[64];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int16 v45;
  __int16 v46;
  int v47;

  v6 = controller;
  v7 = data;
  v8 = v7;
  v47 = 0;
  if (v7)
  {
    -[NSData getBytes:length:](v7, "getBytes:length:", &v47, 4);
    if ((unsigned __int16)v47 > 0x100u)
    {
      memset(snapshotData, 0, 63);
      if (GCExtendedGamepadSnapshotDataFromNSData((GCExtendedGamepadSnapshotData *)snapshotData, v8))
      {
        v9 = snapshotData[60];
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        memset(snapshotData, 0, sizeof(snapshotData));
        GCExtendedGamepadInitInfoMake(snapshotData);
        if (v9)
        {
          v45 = 257;
          v46 = 257;
        }
        goto LABEL_8;
      }
LABEL_13:
      v13 = 0;
      goto LABEL_14;
    }
  }
  memset(snapshotData, 0, 60);
  if (!GCExtendedGamepadSnapShotDataV100FromNSData((GCExtendedGamepadSnapShotDataV100 *)snapshotData, v8))
    goto LABEL_13;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  memset(snapshotData, 0, sizeof(snapshotData));
  GCExtendedGamepadInitInfoMake(snapshotData);
LABEL_8:
  v15.receiver = self;
  v15.super_class = (Class)GCExtendedGamepadSnapshot;
  v10 = -[GCExtendedGamepad initWithController:initInfo:](&v15, sel_initWithController_initInfo_, v6, snapshotData);
  v11 = v10;
  if (v10)
    -[GCExtendedGamepadSnapshot setSnapshotData:](v10, "setSnapshotData:", v8);
  self = v11;
  for (i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((id *)&snapshotData[i]);
  v13 = self;
LABEL_14:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->snapshotData, 0);
}

@end
