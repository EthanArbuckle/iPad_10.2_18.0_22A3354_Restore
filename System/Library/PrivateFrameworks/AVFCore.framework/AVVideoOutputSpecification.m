@implementation AVVideoOutputSpecification

- (AVVideoOutputSpecification)initWithTagCollections:(id)a3
{
  AVVideoOutputSpecification *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CFTypeID v10;
  AVVideoOutputSpecification *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  AVVideoOutputSpecification *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)AVVideoOutputSpecification;
  v5 = -[AVVideoOutputSpecification init](&v27, sel_init);
  if (v5)
  {
    if (a3 && objc_msgSend(a3, "count"))
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (!v6)
        goto LABEL_12;
      v7 = v6;
      v8 = *(_QWORD *)v24;
      while (1)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(a3);
          v10 = CFGetTypeID(*(CFTypeRef *)(*((_QWORD *)&v23 + 1) + 8 * v9));
          if (v10 != CMTagCollectionGetTypeID())
          {
            v12 = v5;
            v18 = (void *)MEMORY[0x1E0C99DA0];
            v19 = *MEMORY[0x1E0C99778];
            v20 = CFSTR("tagCollections can only contains elements of type CMTagCollectionRef");
            goto LABEL_15;
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (!v7)
        {
LABEL_12:
          v5->_tagCollections = (NSArray *)objc_msgSend(a3, "copy");
          v5->_tagCollectionToOutputSettingsMapping = (NSMutableDictionary *)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          return v5;
        }
      }
    }
    v22 = v5;
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99778];
    v20 = CFSTR("tagCollections must not be nil or empty");
LABEL_15:
    v21 = (void *)objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v5, a2, (uint64_t)v20, v13, v14, v15, v16, v17, v23), 0);
    objc_exception_throw(v21);
  }
  return v5;
}

- (AVVideoOutputSpecification)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVVideoOutputSpecification;
  return -[AVVideoOutputSpecification init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVVideoOutputSpecification;
  -[AVVideoOutputSpecification dealloc](&v3, sel_dealloc);
}

- (NSArray)preferredTagCollections
{
  return (NSArray *)(id)-[NSArray copy](self->_tagCollections, "copy");
}

- (NSDictionary)defaultPixelBufferAttributes
{
  return (NSDictionary *)-[AVDecodedVideoSettingsForFig pixelBufferAttributes](self->_defaultOutputSettings, "pixelBufferAttributes");
}

- (id)_videoOutputSettingsFromDictionaryRepresentation:(id)a3 exceptionReason:(id *)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  void *v16;

  v16 = 0;
  if (!a3)
    return 0;
  v7 = +[AVVideoOutputSettings _videoOutputSettingsWithVideoSettingsDictionary:exceptionReason:](AVVideoOutputSettings, "_videoOutputSettingsWithVideoSettingsDictionary:exceptionReason:", a3, &v16);
  v8 = v16;
  if (v16)
    goto LABEL_8;
  if (objc_msgSend(v7, "willYieldCompressedSamples"))
  {
    v8 = (void *)AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("AVVideoOutputSpecification does not support compressed output"), v9, v10, v11, v12, v13, v15);
    if (!v8)
      return v7;
    goto LABEL_8;
  }
  v8 = v16;
  if (v16)
  {
LABEL_8:
    v7 = 0;
    *a4 = v8;
  }
  return v7;
}

- (void)setOutputSettings:(id)a3 forTagCollection:(OpaqueCMTagCollection *)a4
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  OpaqueCMTagCollection *v17;
  uint64_t v18;

  v18 = 0;
  if (!-[NSArray containsObject:](-[AVVideoOutputSpecification preferredTagCollections](self, "preferredTagCollections"), "containsObject:", a4))
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    v17 = a4;
    -[AVVideoOutputSpecification preferredTagCollections](self, "preferredTagCollections");
    v14 = objc_msgSend(v15, "stringWithFormat:", CFSTR("Invalid mapping, called with tagCollection (%@) that does not match any tagCollection in preferredTagCollections (%@)"));
LABEL_5:
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, v14, v9, v10, v11, v12, v13, (uint64_t)v17), 0);
    objc_exception_throw(v16);
  }
  v8 = -[AVVideoOutputSpecification _videoOutputSettingsFromDictionaryRepresentation:exceptionReason:](self, "_videoOutputSettingsFromDictionaryRepresentation:exceptionReason:", a3, &v18);
  v14 = v18;
  if (v18)
    goto LABEL_5;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tagCollectionToOutputSettingsMapping, "setObject:forKeyedSubscript:", v8, a4);
}

- (NSDictionary)defaultOutputSettings
{
  return (NSDictionary *)-[AVDecodedVideoSettingsForFig outputSettingsDictionary](self->_defaultOutputSettings, "outputSettingsDictionary");
}

- (void)setDefaultOutputSettings:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v13 = 0;

  self->_defaultOutputSettings = (AVDecodedVideoSettingsForFig *)-[AVVideoOutputSpecification _videoOutputSettingsFromDictionaryRepresentation:exceptionReason:](self, "_videoOutputSettingsFromDictionaryRepresentation:exceptionReason:", a3, &v13);
  if (v13)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, v13, v6, v7, v8, v9, v10, v12), 0);
    objc_exception_throw(v11);
  }
}

- (id)_pixelBufferAttributesForTagCollection:(OpaqueCMTagCollection *)a3
{
  return (id)objc_msgSend(-[AVVideoOutputSpecification _outputSettingsForTagCollection:](self, "_outputSettingsForTagCollection:", a3), "pixelBufferAttributes");
}

- (id)_outputSettingsForTagCollection:(OpaqueCMTagCollection *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tagCollectionToOutputSettingsMapping, "objectForKeyedSubscript:", a3), "copy");
  if (!v4)
    v4 = (void *)-[AVDecodedVideoSettingsForFig copy](self->_defaultOutputSettings, "copy");
  return v4;
}

- (id)_videoColorPropertiesForTagCollection:(OpaqueCMTagCollection *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[AVVideoOutputSpecification _outputSettingsForTagCollection:](self, "_outputSettingsForTagCollection:", a3), "videoSettingsDictionary"), "objectForKeyedSubscript:", CFSTR("AVVideoColorPropertiesKey")), "copy");
}

- (id)_allowWideColorForTagCollection:(OpaqueCMTagCollection *)a3
{
  return (id)objc_msgSend((id)objc_msgSend(-[AVVideoOutputSpecification _outputSettingsForTagCollection:](self, "_outputSettingsForTagCollection:", a3), "videoSettingsDictionary"), "objectForKeyedSubscript:", CFSTR("AVVideoAllowWideColorKey"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVVideoOutputSpecification *v4;

  v4 = objc_alloc_init(AVVideoOutputSpecification);
  v4->_defaultOutputSettings = (AVDecodedVideoSettingsForFig *)-[AVDecodedVideoSettingsForFig copy](self->_defaultOutputSettings, "copy");
  v4->_tagCollectionToOutputSettingsMapping = (NSMutableDictionary *)-[NSMutableDictionary copy](self->_tagCollectionToOutputSettingsMapping, "copy");
  v4->_tagCollections = (NSArray *)-[NSArray copy](-[AVVideoOutputSpecification preferredTagCollections](self, "preferredTagCollections"), "copy");
  return v4;
}

@end
