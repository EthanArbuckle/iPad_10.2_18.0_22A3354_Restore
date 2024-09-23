@implementation DRPasteAnnouncementContinuityEndpoint

- (DRPasteAnnouncementContinuityEndpoint)initWithDeviceName:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DRPasteAnnouncementContinuityEndpoint;
  return (DRPasteAnnouncementContinuityEndpoint *)-[DRPasteAnnouncementEndpoint _initWithLocalizedName:](&v4, sel__initWithLocalizedName_, a3);
}

- (NSString)deviceName
{
  return self->super._localizedName;
}

- (BOOL)isSimilarToContinuityEndpoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[DRPasteAnnouncementContinuityEndpoint deviceName](self, "deviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[DRPasteAnnouncementContinuityEndpoint deviceName](self, "deviceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v9;
}

@end
