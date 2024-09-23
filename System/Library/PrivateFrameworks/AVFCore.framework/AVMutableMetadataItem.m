@implementation AVMutableMetadataItem

- (void)setDataType:(NSString *)dataType
{
  NSString *v3;
  void *v6;
  uint64_t v7;

  v3 = self->super._priv->dataType;
  if (v3 != dataType)
  {

    self->super._priv->dataType = (NSString *)-[NSString copy](dataType, "copy");
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", self->super._priv->extras);
    objc_msgSend(v6, "setValue:forKey:", dataType, *MEMORY[0x1E0CC4778]);
    if (dataType)
      v7 = *MEMORY[0x1E0CC4738];
    else
      v7 = 0;
    objc_msgSend(v6, "setValue:forKey:", v7, *MEMORY[0x1E0CC4780]);
    objc_msgSend(v6, "removeObjectForKey:", *MEMORY[0x1E0CC4770]);
    objc_msgSend(v6, "removeObjectForKey:", *MEMORY[0x1E0CC4768]);
    -[AVMutableMetadataItem setExtraAttributes:](self, "setExtraAttributes:", v6);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[AVMetadataItem _initWithFigMetadataDictionary:]([AVMetadataItem alloc], "_initWithFigMetadataDictionary:", -[AVMetadataItem _figMetadataDictionary](self, "_figMetadataDictionary"));
}

- (AVMetadataKeySpace)keySpace
{
  return self->super._priv->keySpace;
}

- (id)key
{
  return self->super._priv->key;
}

- (CMTime)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(*(_QWORD *)&self->timescale
                                                                                      + 88);
  return self;
}

- (NSDate)startDate
{
  return self->super._priv->startDate;
}

- (NSLocale)locale
{
  return self->super._priv->locale;
}

- (NSDictionary)extraAttributes
{
  return self->super._priv->extras;
}

- (NSString)extendedLanguageTag
{
  return self->super._priv->extendedLanguageTag;
}

- (CMTime)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(*(_QWORD *)&self->timescale
                                                                                      + 112);
  return self;
}

- (id)value
{
  return self->super._priv->value;
}

- (void)setKeySpace:(AVMetadataKeySpace)keySpace
{
  NSString *v3;

  v3 = self->super._priv->keySpace;
  if (v3 != keySpace)
  {

    self->super._priv->keySpace = (NSString *)-[NSString copy](keySpace, "copy");
    -[AVMetadataItem _updateCommonKey](self, "_updateCommonKey");
    -[AVMetadataItem _updateIdentifier](self, "_updateIdentifier");
  }
}

- (void)setKey:(id)key
{
  NSObject *v3;

  v3 = self->super._priv->key;
  if (v3 != key)
  {

    self->super._priv->key = objc_msgSend(key, "copyWithZone:", -[AVMutableMetadataItem zone](self, "zone"));
    -[AVMetadataItem _updateCommonKey](self, "_updateCommonKey");
    -[AVMetadataItem _updateIdentifier](self, "_updateIdentifier");
  }
}

- (void)setValue:(id)value
{
  NSObject *v3;

  v3 = self->super._priv->value;
  if (v3 != value)
  {

    self->super._priv->value = objc_msgSend(value, "copyWithZone:", -[AVMutableMetadataItem zone](self, "zone"));
  }
}

- (void)setIdentifier:(AVMetadataIdentifier)identifier
{
  NSString *v3;
  id v7;
  NSString *v8;
  BOOL v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  NSString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = self->super._priv->identifier;
  if (v3 != identifier)
  {

    self->super._priv->identifier = 0;
    v7 = +[AVMetadataItem keyForIdentifier:](AVMetadataItem, "keyForIdentifier:", identifier);
    v8 = +[AVMetadataItem keySpaceForIdentifier:](AVMetadataItem, "keySpaceForIdentifier:", identifier);
    if (v8)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
    {
      v11 = (void *)MEMORY[0x1E0C99DA0];
      v12 = *MEMORY[0x1E0C99778];
      v13 = NSStringFromSelector(sel_identifierForKey_keySpace_);
      v19 = (void *)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Bad identifier. Identifier should be of the form \"<keySpace>/<key>\". Try using +%@ to generate an identifier from key and keySpace."), v14, v15, v16, v17, v18, (uint64_t)v13), 0);
      objc_exception_throw(v19);
    }
    v10 = v8;
    self->super._priv->identifier = (NSString *)-[NSString copy](identifier, "copy");
    -[AVMutableMetadataItem setKey:](self, "setKey:", v7);
    -[AVMutableMetadataItem setKeySpace:](self, "setKeySpace:", v10);
  }
}

- (void)setExtraAttributes:(NSDictionary *)extraAttributes
{
  NSDictionary *extras;

  extras = self->super._priv->extras;
  if (extras != extraAttributes)
  {

    self->super._priv->extras = (NSDictionary *)-[NSDictionary copy](extraAttributes, "copy");
  }
}

- (void)setExtendedLanguageTag:(NSString *)extendedLanguageTag
{
  NSString *v3;

  v3 = self->super._priv->extendedLanguageTag;
  if (v3 != extendedLanguageTag)
  {

    self->super._priv->extendedLanguageTag = (NSString *)-[NSString copy](extendedLanguageTag, "copy");
    -[AVMetadataItem _updateLanguageInformationFromExtendedLanguageTag:](self, "_updateLanguageInformationFromExtendedLanguageTag:", extendedLanguageTag);
  }
}

+ (AVMutableMetadataItem)metadataItem
{
  return objc_alloc_init(AVMutableMetadataItem);
}

- (AVMetadataIdentifier)identifier
{
  AVMetadataIdentifier result;

  result = self->super._priv->identifier;
  if (!result)
  {
    -[AVMetadataItem _updateIdentifier](self, "_updateIdentifier");
    return self->super._priv->identifier;
  }
  return result;
}

- (id)languageCode
{
  return self->super._priv->languageCode;
}

- (NSString)dataType
{
  return self->super._priv->dataType;
}

- (void)setPreferredStorageLocation:(id)a3
{
  AVMetadataItemInternal *priv;
  NSString *preferredStorageLocation;

  priv = self->super._priv;
  preferredStorageLocation = priv->preferredStorageLocation;
  if (preferredStorageLocation != a3)
  {

    self->super._priv->preferredStorageLocation = (NSString *)objc_msgSend(a3, "copy");
    priv = self->super._priv;
  }
  priv->preferredStorageLocationWasSet = 1;
}

+ (id)keyPathsForValuesAffectingIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("key"), CFSTR("keySpace"), 0);
}

- (void)setLocale:(NSLocale *)locale
{
  NSLocale *v3;

  v3 = self->super._priv->locale;
  if (v3 != locale)
  {

    self->super._priv->locale = (NSLocale *)-[NSLocale copy](locale, "copy");
    -[AVMetadataItem _updateLanguageInformationFromLocale:](self, "_updateLanguageInformationFromLocale:", locale);
  }
}

- (void)setTime:(CMTime *)time
{
  AVMetadataItemInternal *priv;
  __int128 v4;

  priv = self->super._priv;
  v4 = *(_OWORD *)&time->value;
  priv->time.epoch = time->epoch;
  *(_OWORD *)&priv->time.value = v4;
}

- (void)setDuration:(CMTime *)duration
{
  AVMetadataItemInternal *priv;
  __int128 v4;

  priv = self->super._priv;
  v4 = *(_OWORD *)&duration->value;
  priv->duration.epoch = duration->epoch;
  *(_OWORD *)&priv->duration.value = v4;
}

- (void)setStartDate:(NSDate *)startDate
{
  NSDate *v3;

  v3 = self->super._priv->startDate;
  if (v3 != startDate)
  {

    self->super._priv->startDate = (NSDate *)-[NSDate copy](startDate, "copy");
  }
}

@end
