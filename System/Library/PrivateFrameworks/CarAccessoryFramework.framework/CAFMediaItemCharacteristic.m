@implementation CAFMediaItemCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFMediaItemCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFMediaItem)mediaItemValue
{
  CAFMediaItem *v3;
  void *v4;
  CAFMediaItem *v5;

  v3 = [CAFMediaItem alloc];
  -[CAFDictionaryCharacteristic dictionaryValue](self, "dictionaryValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAFMediaItem initWithDictionary:](v3, "initWithDictionary:", v4);

  return v5;
}

- (void)setMediaItemValue:(id)a3
{
  id v4;

  objc_msgSend(a3, "dictionaryRepresentation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CAFDictionaryCharacteristic setDictionaryValue:](self, "setDictionaryValue:", v4);

}

- (id)formattedValue
{
  void *v2;
  void *v3;

  -[CAFMediaItemCharacteristic mediaItemValue](self, "mediaItemValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("MediaItem");
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x24BDBD1A8];
}

@end
