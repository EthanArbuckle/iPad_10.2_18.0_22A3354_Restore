@implementation AVAssetDownloadContentConfiguration

- (AVAssetDownloadContentConfiguration)init
{
  AVAssetDownloadContentConfiguration *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVAssetDownloadContentConfiguration;
  v2 = -[AVAssetDownloadContentConfiguration init](&v4, sel_init);
  if (v2)
  {
    v2->_variantQualifiers = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    v2->_mediaSelections = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVAssetDownloadContentConfiguration *v4;

  v4 = objc_alloc_init(AVAssetDownloadContentConfiguration);
  -[AVAssetDownloadContentConfiguration setVariantQualifiers:](v4, "setVariantQualifiers:", self->_variantQualifiers);
  -[AVAssetDownloadContentConfiguration setMediaSelections:](v4, "setMediaSelections:", self->_mediaSelections);
  return v4;
}

- (FigStreamingAssetDownloadContentConfig)_createFigContentConfigForEnvironmentalCondition:(int64_t)a3
{
  void *v5;
  NSArray *variantQualifiers;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  NSArray *mediaSelections;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CFTypeRef cf;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  cf = 0;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  variantQualifiers = self->_variantQualifiers;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](variantQualifiers, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(variantQualifiers);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if ((objc_msgSend(v12, "environmentalConditions") & a3) != 0
          || objc_msgSend(v12, "environmentalConditions") == a3)
        {
          if (objc_msgSend((id)objc_msgSend(v12, "_variant"), "_figAlternate"))
          {
            v13 = objc_msgSend((id)objc_msgSend(v12, "_variant"), "_figAlternate");
            goto LABEL_14;
          }
          objc_msgSend(v5, "addObject:", objc_msgSend(v12, "_figAssetVariantQualifier"));
          v9 = 1;
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](variantQualifiers, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
  v13 = 0;
  if (!a3 || (v9 & 1) != 0)
  {
LABEL_14:
    if (FigStreamingAssetDownloadContentConfigCreate())
      goto LABEL_37;
    if (v13)
    {
      if (FigStreamingAssetDownloadContentConfigSetAlternate())
        goto LABEL_37;
    }
    else if (objc_msgSend(v5, "count") && FigStreamingAssetDownloadContentConfigSetAlternateQualifiers())
    {
LABEL_37:
      if (cf)
        CFRelease(cf);
      return (FigStreamingAssetDownloadContentConfig *)cf;
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    mediaSelections = self->_mediaSelections;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](mediaSelections, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(mediaSelections);
          v20 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "_selectedMediaArray");
          if (v20)
          {
            v21 = v20;
            if (!v17)
              v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            objc_msgSend(v17, "addObject:", v21);
          }
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](mediaSelections, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      }
      while (v16);
      if (v17 && FigStreamingAssetDownloadContentConfigSetMediaSelections())
        goto LABEL_37;
    }
  }
  return (FigStreamingAssetDownloadContentConfig *)cf;
}

- (void)_serializeIntoDownloadConfig:(FigStreamingAssetDownloadConfig *)a3 environmentalCondition:(int64_t)a4
{
  FigStreamingAssetDownloadContentConfig *v5;
  FigStreamingAssetDownloadContentConfig *v6;

  v5 = -[AVAssetDownloadContentConfiguration _createFigContentConfigForEnvironmentalCondition:](self, "_createFigContentConfigForEnvironmentalCondition:", a4);
  if (v5)
  {
    v6 = v5;
    if (-[AVAssetDownloadContentConfiguration isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))FigStreamingAssetDownloadConfigSetPrimaryContentConfig();
    else
      FigStreamingAssetDownloadConfigAddAuxConfig();
    CFRelease(v6);
  }
}

- (void)_serializeIntoDownloadConfig:(FigStreamingAssetDownloadConfig *)a3 asset:(id)a4
{
  -[AVAssetDownloadContentConfiguration _serializeIntoDownloadConfig:environmentalCondition:](self, "_serializeIntoDownloadConfig:environmentalCondition:", a3, 0);
  -[AVAssetDownloadContentConfiguration _serializeIntoDownloadConfig:environmentalCondition:](self, "_serializeIntoDownloadConfig:environmentalCondition:", a3, 1);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetDownloadContentConfiguration;
  -[AVAssetDownloadContentConfiguration dealloc](&v3, sel_dealloc);
}

- (NSArray)variantQualifiers
{
  return self->_variantQualifiers;
}

- (void)setVariantQualifiers:(NSArray *)variantQualifiers
{
  objc_setProperty_nonatomic_copy(self, a2, variantQualifiers, 8);
}

- (NSArray)mediaSelections
{
  return self->_mediaSelections;
}

- (void)setMediaSelections:(NSArray *)mediaSelections
{
  objc_setProperty_nonatomic_copy(self, a2, mediaSelections, 16);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSArray *mediaSelections;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("supports only keyed archivers"), v6, v7, v8, v9, v10, v18), 0);
    objc_exception_throw(v17);
  }
  objc_msgSend(a3, "encodeObject:forKey:", self->_variantQualifiers, CFSTR("variantQualifiers"));
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  mediaSelections = self->_mediaSelections;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](mediaSelections, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(mediaSelections);
        objc_msgSend(v11, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16++), "propertyList"));
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](mediaSelections, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }
  objc_msgSend(a3, "encodeObject:forKey:", v11, CFSTR("mediaSelections"));
}

- (AVAssetDownloadContentConfiguration)initWithCoder:(id)a3
{
  AVAssetDownloadContentConfiguration *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  AVMediaSelection *v19;
  AVAssetDownloadContentConfiguration *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v21 = self;
    v27 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("supports only keyed archivers"), v22, v23, v24, v25, v26, v28), 0);
    objc_exception_throw(v27);
  }
  v33.receiver = self;
  v33.super_class = (Class)AVAssetDownloadContentConfiguration;
  v6 = -[AVAssetDownloadContentConfiguration init](&v33, sel_init);
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v6->_variantQualifiers = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0), CFSTR("variantQualifiers"));
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0), CFSTR("mediaSelections"));
    v6->_mediaSelections = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v30;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v30 != v17)
            objc_enumerationMutation(v14);
          v19 = -[AVMediaSelection initWithAsset:propertyList:]([AVMediaSelection alloc], "initWithAsset:propertyList:", 0, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v18));
          if (v19)
            -[NSArray addObject:](v6->_mediaSelections, "addObject:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v16);
    }
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
