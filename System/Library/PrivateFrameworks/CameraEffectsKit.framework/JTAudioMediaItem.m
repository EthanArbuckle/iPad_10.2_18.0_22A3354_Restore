@implementation JTAudioMediaItem

- (JTAudioMediaItem)init
{
  JTAudioMediaItem *v2;
  JTAudioMediaItem *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)JTAudioMediaItem;
  v2 = -[JFXMediaItem init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[JFXMediaItem setMediaType:](v2, "setMediaType:", 5);
  return v3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)JTAudioMediaItem;
  -[JFXMediaItem dealloc](&v2, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JTAudioMediaItem;
  -[JFXMediaItem description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)JTAudioMediaItem;
  return -[JFXMediaItem copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)JTAudioMediaItem;
  return -[JFXMediaItem isEqual:](&v4, sel_isEqual_, a3);
}

- (BOOL)hasAudibleCharacteristic
{
  return 1;
}

- (JTAudioMediaItem)initWithInfo:(id)a3 delegate:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)JTAudioMediaItem;
  return -[JFXMediaItem initWithInfo:delegate:](&v5, sel_initWithInfo_delegate_, a3, a4);
}

- (id)info
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCED8];
  v6.receiver = self;
  v6.super_class = (Class)JTAudioMediaItem;
  -[JFXMediaItem info](&v6, sel_info);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
