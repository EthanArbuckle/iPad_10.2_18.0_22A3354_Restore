@implementation GCMicroGamepadSnapshot

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
  GCMicroGamepadSnapshotData snapshotDataa;

  v4 = snapshotData;
  memset(&snapshotDataa, 0, sizeof(snapshotDataa));
  if (GCMicroGamepadSnapshotDataFromNSData(&snapshotDataa, v4))
  {
    v5 = (NSData *)-[NSData copy](v4, "copy");
    v6 = self->snapshotData;
    self->snapshotData = v5;

    -[GCMicroGamepad dpad](self, "dpad");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile setDpad:x:y:](self, "setDpad:x:y:", v7, snapshotDataa.dpadX, snapshotDataa.dpadY);

    -[GCMicroGamepad buttonA](self, "buttonA");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile setButton:value:](self, "setButton:value:", v8, snapshotDataa.buttonA);

    -[GCMicroGamepad buttonX](self, "buttonX");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile setButton:value:](self, "setButton:value:", v9, snapshotDataa.buttonX);

  }
}

- (GCMicroGamepadSnapshot)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCMicroGamepadSnapshot;
  return -[GCPhysicalInputProfile init](&v3, sel_init);
}

- (GCMicroGamepadSnapshot)initWithSnapshotData:(NSData *)data
{
  return -[GCMicroGamepadSnapshot initWithController:snapshotData:](self, "initWithController:snapshotData:", 0, data);
}

- (GCMicroGamepadSnapshot)initWithController:(GCController *)controller snapshotData:(NSData *)data
{
  GCController *v6;
  NSData *v7;
  GCMicroGamepadSnapshot *v8;
  GCMicroGamepadSnapshot *v9;
  GCMicroGamepadSnapshot *v10;
  objc_super v12;
  GCMicroGamepadSnapshotData snapshotData;

  v6 = controller;
  v7 = data;
  memset(&snapshotData, 0, sizeof(snapshotData));
  if (GCMicroGamepadSnapshotDataFromNSData(&snapshotData, v7))
  {
    v12.receiver = self;
    v12.super_class = (Class)GCMicroGamepadSnapshot;
    v8 = -[GCPhysicalInputProfile initWithController:](&v12, sel_initWithController_, v6);
    v9 = v8;
    if (v8)
      -[GCMicroGamepadSnapshot setSnapshotData:](v8, "setSnapshotData:", v7);
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)supportsDpadTaps
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->snapshotData, 0);
}

@end
