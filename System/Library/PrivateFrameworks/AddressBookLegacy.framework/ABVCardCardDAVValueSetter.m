@implementation ABVCardCardDAVValueSetter

+ (__CFDictionary)_personToGroupPropertyMap
{
  __CFDictionary *result;

  result = (__CFDictionary *)_personToGroupPropertyMap_propertyMap;
  if (!_personToGroupPropertyMap_propertyMap)
  {
    _personToGroupPropertyMap_propertyMap = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, 0);
    CFDictionarySetValue((CFMutableDictionaryRef)_personToGroupPropertyMap_propertyMap, (const void *)kABPersonLastNameProperty, (const void *)kABGroupNameProperty);
    CFDictionarySetValue((CFMutableDictionaryRef)_personToGroupPropertyMap_propertyMap, (const void *)kABPersonExternalIdentifierProperty, (const void *)kABGroupExternalIdentifierProperty);
    CFDictionarySetValue((CFMutableDictionaryRef)_personToGroupPropertyMap_propertyMap, (const void *)kABPersonExternalUUIDProperty, (const void *)kABGroupExternalUUIDProperty);
    CFDictionarySetValue((CFMutableDictionaryRef)_personToGroupPropertyMap_propertyMap, (const void *)kABPersonExternalRepresentationProperty, (const void *)kABGroupExternalRepresentationProperty);
    return (__CFDictionary *)_personToGroupPropertyMap_propertyMap;
  }
  return result;
}

+ (int)groupPropertyForPersonProperty:(int)a3
{
  void *value;

  value = (void *)-1;
  CFDictionaryGetValueIfPresent((CFDictionaryRef)objc_msgSend(a1, "_personToGroupPropertyMap"), (const void *)a3, (const void **)&value);
  return (int)value;
}

- (BOOL)propertyIsValidForPerson:(unsigned int)a3
{
  return !self->_importingToExistingGroup
      || objc_msgSend((id)objc_opt_class(), "groupPropertyForPersonProperty:", *(_QWORD *)&a3) != -1;
}

- (void)copyParsedRecordWithSource:(void *)a3 outRecordType:(unsigned int *)a4
{
  ABRecordRef v6;
  CFTypeRef v7;
  const __CFDictionary *v8;
  CFIndex Count;
  const void **v10;
  ABPropertyID *v11;
  ABPropertyID v12;
  CFTypeRef v13;
  const void *v14;
  const void *v16[2];

  v16[1] = *(const void **)MEMORY[0x1E0C80C00];
  if (!self->_recordIsGroup)
  {
    v7 = CFRetain(self->super._person);
    if (!a4)
      return (void *)v7;
    goto LABEL_12;
  }
  if (a3)
    v6 = ABGroupCreateInSource(a3);
  else
    v6 = ABGroupCreate();
  v7 = v6;
  v8 = (const __CFDictionary *)objc_msgSend((id)objc_opt_class(), "_personToGroupPropertyMap");
  Count = CFDictionaryGetCount(v8);
  v10 = (const void **)((char *)v16 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = (ABPropertyID *)v10;
  CFDictionaryGetKeysAndValues(v8, v16, v10);
  if (Count >= 1)
  {
    do
    {
      v12 = *(_DWORD *)v10++;
      v13 = ABRecordCopyValue(self->super._person, v12);
      if (v13)
      {
        v14 = v13;
        ABRecordSetValue(v7, *v11, v13, 0);
        CFRelease(v14);
      }
      v11 += 2;
      --Count;
    }
    while (Count);
  }
  if (a4)
LABEL_12:
    *a4 = self->_recordIsGroup;
  return (void *)v7;
}

- (void)valueForProperty:(unsigned int)a3
{
  uint64_t v3;
  objc_super v6;

  v3 = *(_QWORD *)&a3;
  if (!-[ABVCardCardDAVValueSetter propertyIsValidForPerson:](self, "propertyIsValidForPerson:"))
    return 0;
  if (self->_importingToExistingGroup)
  {
    v3 = objc_msgSend((id)objc_opt_class(), "groupPropertyForPersonProperty:", v3);
    if ((_DWORD)v3 == -1)
      return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)ABVCardCardDAVValueSetter;
  return -[ABVCardPersonValueSetter valueForProperty:](&v6, sel_valueForProperty_, v3);
}

- (BOOL)setValue:(void *)a3 forProperty:(unsigned int)a4
{
  ABPropertyID v6;
  ABPropertyID v7;
  objc_super v9;

  if (self->_importingToExistingGroup)
  {
    v6 = objc_msgSend((id)objc_opt_class(), "groupPropertyForPersonProperty:", *(_QWORD *)&a4);
    if (v6 == -1)
    {
      return 0;
    }
    else
    {
      v7 = v6;
      if (ABRecordSetValue(self->super._person, v6, a3, 0))
        CFArrayAppendValue(self->super._properties, (const void *)v7);
      return 1;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ABVCardCardDAVValueSetter;
    return -[ABVCardPersonValueSetter setValue:forProperty:](&v9, sel_setValue_forProperty_, a3, *(_QWORD *)&a4);
  }
}

- (void)_drainExistingProperties
{
  const __CFArray *v3;
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  int v8;
  int v9;
  int v10;
  int v11;
  const void *ValueAtIndex;
  ABPropertyID v13;
  ABPropertyID v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;

  v3 = (const __CFArray *)objc_msgSend((id)objc_opt_class(), "supportedProperties");
  if (v3)
  {
    v4 = v3;
    Count = CFArrayGetCount(v3);
    if (Count >= 1)
    {
      v6 = Count;
      v7 = 0;
      v8 = kABGroupExternalIdentifierProperty;
      v9 = kABGroupExternalUUIDProperty;
      v10 = kABPersonExternalIdentifierProperty;
      v11 = kABPersonExternalUUIDProperty;
      v16 = kABPersonWallpaperProperty;
      v15 = kABPersonWallpaperURIProperty;
      v19 = kABPersonImageURIProperty;
      v18 = kABPersonImageHashProperty;
      v17 = kABPersonImageTypeProperty;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v4, v7);
        v13 = (int)ValueAtIndex;
        if (self->_importingToExistingGroup)
        {
          v14 = objc_msgSend((id)objc_opt_class(), "groupPropertyForPersonProperty:", ValueAtIndex);
          if (v14 == v8)
            goto LABEL_19;
          v13 = v14;
          if (v14 == -1 || v14 == v9)
            goto LABEL_19;
        }
        else if (v10 == (_DWORD)ValueAtIndex
               || v11 == (_DWORD)ValueAtIndex
               || !self->_wallpaperSupported && (v16 == (_DWORD)ValueAtIndex || v15 == (_DWORD)ValueAtIndex)
               || self->_isImageSyncFailedTimeSet
               && (v19 == (_DWORD)ValueAtIndex || v18 == (_DWORD)ValueAtIndex || v17 == (_DWORD)ValueAtIndex))
        {
          goto LABEL_19;
        }
        ABRecordRemoveValue(self->super._person, v13, 0);
LABEL_19:
        ++v7;
      }
      while (v6 != v7);
    }
  }
}

- (ABVCardCardDAVValueSetter)initWithPerson:(void *)a3 options:(unint64_t)a4
{
  char v4;
  ABVCardCardDAVValueSetter *v5;
  ABVCardCardDAVValueSetter *v6;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)ABVCardCardDAVValueSetter;
  v5 = -[ABVCardPersonValueSetter initWithPerson:](&v8, sel_initWithPerson_, a3);
  v6 = v5;
  if (v5)
  {
    v5->_wallpaperSupported = (v4 & 2) != 0;
    v5->_isImageSyncFailedTimeSet = -[ABVCardCardDAVValueSetter valueForProperty:](v5, "valueForProperty:", kABPersonImageSyncFailedTimeProperty) != 0;
    if ((v4 & 1) != 0)
      -[ABVCardCardDAVValueSetter _drainExistingProperties](v6, "_drainExistingProperties");
  }
  return v6;
}

- (ABVCardCardDAVValueSetter)initWithGroup:(void *)a3 options:(unint64_t)a4
{
  char v4;
  ABVCardCardDAVValueSetter *v5;
  ABVCardCardDAVValueSetter *v6;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)ABVCardCardDAVValueSetter;
  v5 = -[ABVCardPersonValueSetter initWithPerson:](&v8, sel_initWithPerson_, a3);
  v6 = v5;
  if (v5)
  {
    v5->_importingToExistingGroup = 1;
    if ((v4 & 1) != 0)
      -[ABVCardCardDAVValueSetter _drainExistingProperties](v5, "_drainExistingProperties");
  }
  return v6;
}

- (BOOL)setImageData:(id)a3 cropRectX:(int)a4 cropRectY:(int)a5 cropRectWidth:(int)a6 cropRectHeight:(int)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFDataRef v13;
  CFDataRef v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  const __CFString *v18;
  objc_super v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!self->_recordIsGroup)
  {
    v7 = *(_QWORD *)&a7;
    v8 = *(_QWORD *)&a6;
    v9 = *(_QWORD *)&a5;
    v10 = *(_QWORD *)&a4;
    v13 = ABPersonCopyImageDataWithFormat(self->super._person, (ABPersonImageFormat)5u);
    v14 = v13;
    if (v13 && -[__CFData isEqualToData:](v13, "isEqualToData:", a3))
    {
      if (ABImageUtilsOriginalSizeCropRectMatchesSyncedCropRect((uint64_t)self->super._person, (const __CFData *)a3, (double)(int)v10, (double)(int)v9, (double)(int)v8, (double)(int)v7))
      {
        v15 = ABOSLogGeneral();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          -[ABVCardCardDAVValueSetter setImageData:cropRectX:cropRectY:cropRectWidth:cropRectHeight:].cold.1(v15);
LABEL_13:

        return 1;
      }
      v16 = 1;
    }
    else
    {
      v16 = 0;
    }
    v17 = ABOSLogGeneral();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544642;
      v18 = CFSTR("NO");
      if (!v16)
        v18 = CFSTR("YES");
      v22 = v18;
      v23 = 1024;
      v24 = v10;
      v25 = 1024;
      v26 = v9;
      v27 = 1024;
      v28 = v8;
      v29 = 1024;
      v30 = v7;
      v31 = 2114;
      v32 = CFSTR("YES");
      _os_log_impl(&dword_19BC4B000, v17, OS_LOG_TYPE_DEFAULT, "[Likeness Update] Sync image changed: %{public}@, cropRect {%i, %i, %i, %i} changed: %{public}@. Updating sync image on person", buf, 0x2Eu);
    }
    v20.receiver = self;
    v20.super_class = (Class)ABVCardCardDAVValueSetter;
    -[ABVCardPersonValueSetter setImageData:cropRectX:cropRectY:cropRectWidth:cropRectHeight:](&v20, sel_setImageData_cropRectX_cropRectY_cropRectWidth_cropRectHeight_, a3, v10, v9, v8, v7);
    ABPersonSetImageDataDerivedFromFormatAndReturnError(self->super._person, 5);
    goto LABEL_13;
  }
  return 1;
}

- (id)imageData
{
  CFDataRef v2;

  if (self->_importingToExistingGroup || self->_recordIsGroup)
    v2 = 0;
  else
    v2 = ABPersonCopyImageDataWithFormat(self->super._person, (ABPersonImageFormat)5u);
  return v2;
}

- (BOOL)recordIsGroup
{
  return self->_recordIsGroup;
}

- (void)setRecordIsGroup:(BOOL)a3
{
  self->_recordIsGroup = a3;
}

- (void)setImageData:(os_log_t)log cropRectX:cropRectY:cropRectWidth:cropRectHeight:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19BC4B000, log, OS_LOG_TYPE_DEBUG, "[Likeness Update] Not setting image on person, as it hasn't changed", v1, 2u);
}

@end
