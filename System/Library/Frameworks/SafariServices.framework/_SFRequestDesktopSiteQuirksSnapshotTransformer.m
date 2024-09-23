@implementation _SFRequestDesktopSiteQuirksSnapshotTransformer

- (id)objectFromData:(id)a3
{
  id v3;
  _SFRequestDesktopSiteQuirksSnapshot *v4;

  v3 = a3;
  v4 = -[_SFRequestDesktopSiteQuirksSnapshot initWithSnapshotData:error:]([_SFRequestDesktopSiteQuirksSnapshot alloc], "initWithSnapshotData:error:", v3, 0);

  return v4;
}

@end
