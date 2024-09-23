@implementation GCGamepadSnapshot

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
  GCGamepadSnapShotDataV100 v14;

  v4 = snapshotData;
  memset(&v14, 0, sizeof(v14));
  if (GCGamepadSnapShotDataV100FromNSData(&v14, v4))
  {
    v5 = (NSData *)-[NSData copy](v4, "copy");
    v6 = self->snapshotData;
    self->snapshotData = v5;

    -[GCGamepad dpad](self, "dpad");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile setDpad:x:y:](self, "setDpad:x:y:", v7, v14.dpadX, v14.dpadY);

    -[GCGamepad buttonA](self, "buttonA");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile setButton:value:](self, "setButton:value:", v8, v14.buttonA);

    -[GCGamepad buttonB](self, "buttonB");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile setButton:value:](self, "setButton:value:", v9, v14.buttonB);

    -[GCGamepad buttonX](self, "buttonX");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile setButton:value:](self, "setButton:value:", v10, v14.buttonX);

    -[GCGamepad buttonY](self, "buttonY");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile setButton:value:](self, "setButton:value:", v11, v14.buttonY);

    -[GCGamepad leftShoulder](self, "leftShoulder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile setButton:value:](self, "setButton:value:", v12, v14.leftShoulder);

    -[GCGamepad rightShoulder](self, "rightShoulder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile setButton:value:](self, "setButton:value:", v13, v14.rightShoulder);

  }
}

- (GCGamepadSnapshot)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCGamepadSnapshot;
  return -[GCPhysicalInputProfile init](&v3, sel_init);
}

- (GCGamepadSnapshot)initWithSnapshotData:(NSData *)data
{
  return -[GCGamepadSnapshot initWithController:snapshotData:](self, "initWithController:snapshotData:", 0, data);
}

- (GCGamepadSnapshot)initWithController:(GCController *)controller snapshotData:(NSData *)data
{
  GCController *v6;
  NSData *v7;
  GCGamepadSnapshot *v8;
  GCGamepadSnapshot *v9;
  GCGamepadSnapshot *v10;
  objc_super v12;
  GCGamepadSnapShotDataV100 snapshotData;

  v6 = controller;
  v7 = data;
  memset(&snapshotData, 0, sizeof(snapshotData));
  if (GCGamepadSnapShotDataV100FromNSData(&snapshotData, v7))
  {
    v12.receiver = self;
    v12.super_class = (Class)GCGamepadSnapshot;
    v8 = -[GCPhysicalInputProfile initWithController:](&v12, sel_initWithController_, v6);
    v9 = v8;
    if (v8)
      -[GCGamepadSnapshot setSnapshotData:](v8, "setSnapshotData:", v7);
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->snapshotData, 0);
}

@end
