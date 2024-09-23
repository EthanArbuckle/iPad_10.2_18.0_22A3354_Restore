@implementation AVMediaSelectionKeyValueOption

- (BOOL)isPlayable
{
  return 1;
}

- (id)dictionary
{
  return self->_dictionary;
}

- (AVMediaSelectionKeyValueOption)initWithAsset:(id)a3 group:(id)a4 dictionary:(id)a5
{
  AVMediaSelectionKeyValueOption *v7;
  AVMediaSelectionKeyValueOption *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVMediaSelectionKeyValueOption;
  v7 = -[AVMediaSelectionOption initWithGroup:](&v10, sel_initWithGroup_, a4);
  v8 = v7;
  if (v7)
  {
    if (a4 && a5)
    {
      v7->_groupID = (id)objc_msgSend(a4, "_groupID");
      v8->_groupMediaType = (id)objc_msgSend((id)objc_msgSend(a4, "_groupMediaType"), "copy");
      v8->_optionMediaType = (NSString *)objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC5F10]), "copy");
      v8->_dictionary = (NSDictionary *)objc_msgSend(a5, "copy");
      v8->_localizedMediaSelectionOptionDisplayNames = (NSDictionary *)objc_msgSend((id)objc_msgSend(a4, "_localizedMediaSelectionOptionDisplayNames"), "copy");
      v8->_weakReferenceToGroup = (AVWeakReference *)(id)objc_msgSend(a4, "_weakReference");
    }
    else
    {

      return 0;
    }
  }
  return v8;
}

- (id)group
{
  return -[AVWeakReference referencedObject](self->_weakReferenceToGroup, "referencedObject");
}

- (id)commonMetadata
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", *MEMORY[0x1E0CC5F18]);
  if (v3)
  {
    v15 = v3;
    v4 = -[NSDictionary objectForKey:](self->_localizedMediaSelectionOptionDisplayNames, "objectForKey:", v3);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    v18 = *MEMORY[0x1E0CC47B0];
    v17 = *MEMORY[0x1E0CC47A8];
    v16 = *MEMORY[0x1E0CC47E8];
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v21;
      v8 = *MEMORY[0x1E0CC4798];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v21 != v7)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          v11 = objc_msgSend(v4, "objectForKey:", v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v19, "addObject:", +[AVMetadataItem _metadataItemWithFigMetadataDictionary:](AVMetadataItem, "_metadataItemWithFigMetadataDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("mdta"), v18, CFSTR("com.apple.quicktime.displayname"), v17, v11, v16, v10, v8, 0)));
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v6);
    }
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = -[AVMediaSelectionKeyValueOption locale](self, "locale");
    objc_msgSend(v19, "addObject:", +[AVMetadataItem _metadataItemWithFigMetadataDictionary:](AVMetadataItem, "_metadataItemWithFigMetadataDictionary:", objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", CFSTR("m3u8"), v18, CFSTR("NAME"), v17, v15, v16, v13, *MEMORY[0x1E0CC47C0], 0)));
  }
  return v19;
}

- (id)locale
{
  id result;

  result = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", *MEMORY[0x1E0CC5EE0]);
  if (result)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", result);
  return result;
}

- (id)mediaType
{
  return self->_optionMediaType;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  id groupID;
  uint64_t v8;
  id groupMediaType;

  if (self == a3)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = objc_msgSend(a3, "_groupID");
  groupID = self->_groupID;
  if (groupID)
  {
    if ((objc_msgSend(groupID, "isEqual:", v5) & 1) == 0)
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  v8 = objc_msgSend(a3, "_groupMediaType");
  groupMediaType = self->_groupMediaType;
  if (groupMediaType)
  {
    if ((objc_msgSend(groupMediaType, "isEqual:", v8) & 1) != 0)
      return -[NSDictionary isEqual:](self->_dictionary, "isEqual:", objc_msgSend(a3, "dictionary"));
  }
  else if (!v8)
  {
    return -[NSDictionary isEqual:](self->_dictionary, "isEqual:", objc_msgSend(a3, "dictionary"));
  }
  return 0;
}

- (id)_groupMediaType
{
  return self->_groupMediaType;
}

- (id)_groupID
{
  return self->_groupID;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMediaSelectionKeyValueOption;
  -[AVMediaSelectionOption dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(self->_groupID, "hash");
  v4 = objc_msgSend(self->_groupMediaType, "hash") ^ v3;
  return v4 ^ -[NSDictionary hash](self->_dictionary, "hash");
}

- (id)availableMetadataFormats
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (id)metadataForFormat:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array", a3);
}

@end
