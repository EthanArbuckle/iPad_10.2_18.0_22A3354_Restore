@implementation FSContainerIdentifier

- (FSVolumeIdentifier)volumeIdentifier
{
  void *v3;
  FSVolumeIdentifier *v4;
  void *v5;
  void *v6;
  FSVolumeIdentifier *v7;

  -[FSEntityIdentifier qualifier](self, "qualifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = [FSVolumeIdentifier alloc];
  -[FSEntityIdentifier uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[FSEntityIdentifier qualifier](self, "qualifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[FSEntityIdentifier initWithUUID:data:](v4, "initWithUUID:data:", v5, v6);

  }
  else
  {
    v7 = -[FSEntityIdentifier initWithUUID:](v4, "initWithUUID:", v5);
  }

  return v7;
}

@end
