@implementation JTCaptureMediaItem

- (JTCaptureMediaItem)init
{
  JTCaptureMediaItem *v2;
  JTCaptureMediaItem *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)JTCaptureMediaItem;
  v2 = -[JFXMediaItem init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[JFXMediaItem setMediaType:](v2, "setMediaType:", 4);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)JTCaptureMediaItem;
  return -[JFXMediaItem copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)JTCaptureMediaItem;
  return -[JFXMediaItem isEqual:](&v4, sel_isEqual_, a3);
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JTCaptureMediaItem;
  return -[JFXMediaItem hash](&v3, sel_hash);
}

@end
