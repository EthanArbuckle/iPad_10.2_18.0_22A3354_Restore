@implementation ABVCardCardDAVParser

- (ABVCardCardDAVParser)initWithData:(id)a3 watchdogTimer:(id)a4 importOptions:(unint64_t)a5
{
  ABVCardCardDAVParser *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ABVCardCardDAVParser;
  v6 = -[ABVCardParser initWithData:watchdogTimer:](&v8, sel_initWithData_watchdogTimer_, a3, a4);
  if (v6)
  {
    v6->_unknownAttributes = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6->_importOptions = a5;
  }
  return v6;
}

- (ABVCardCardDAVParser)initWithData:(id)a3 watchdogTimer:(id)a4
{
  return -[ABVCardCardDAVParser initWithData:watchdogTimer:importOptions:](self, "initWithData:watchdogTimer:importOptions:", a3, a4, 0);
}

- (ABVCardCardDAVParser)initWithData:(id)a3 importOptions:(unint64_t)a4
{
  return -[ABVCardCardDAVParser initWithData:watchdogTimer:importOptions:](self, "initWithData:watchdogTimer:importOptions:", a3, +[ABVCardWatchdogTimer timerWithTimeProvider:](ABVCardWatchdogTimer, "timerWithTimeProvider:", objc_alloc_init(_ABVCardTimeProvider)), a4);
}

- (void)dealloc
{
  objc_super v3;

  self->_lastCropRectChecksum = 0;
  self->super._cropRectChecksum = 0;
  v3.receiver = self;
  v3.super_class = (Class)ABVCardCardDAVParser;
  -[ABVCardParser dealloc](&v3, sel_dealloc);
}

- (void)setLocalRecordHasAdditionalProperties:(BOOL)a3
{
  self->_localRecordHasAdditionalProperties = a3;
}

- (id)defaultLabel
{
  return 0;
}

- (id)defaultADRLabel
{
  return 0;
}

- (id)defaultURLLabel
{
  return 0;
}

- (BOOL)parseUID
{
  id v3;
  id v4;

  v3 = -[ABVCardParser parseSingleValue](self, "parseSingleValue");
  if (v3)
  {
    v4 = -[ABVCardParser _valueSetter](self, "_valueSetter");
    objc_msgSend(v4, "setValue:forProperty:", v3, kABPersonExternalUUIDProperty);
  }
  return v3 != 0;
}

- (BOOL)_handleUnknownTag:(id)a3 withValue:(id)a4
{
  id v7;

  if (!objc_msgSend(a3, "compare:options:", CFSTR("X-ADDRESSBOOKSERVER-KIND"), 1))
    objc_msgSend(-[ABVCardParser _valueSetter](self, "_valueSetter"), "setRecordIsGroup:", objc_msgSend(a4, "compare:options:", CFSTR("group"), 1) == 0);
  v7 = (id)-[NSMutableDictionary objectForKey:](self->_unknownAttributes, "objectForKey:", a3);
  if (!v7)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NSMutableDictionary setObject:forKey:](self->_unknownAttributes, "setObject:forKey:", v7, a3);

  }
  objc_msgSend(v7, "addObject:", a4);
  return 1;
}

- (BOOL)importToPerson:(void *)a3 removeExistingProperties:(BOOL)a4
{
  if (a4)
    self->_importOptions |= 1uLL;
  return -[ABVCardCardDAVParser importToPerson:](self, "importToPerson:", a3);
}

- (BOOL)importToPerson:(void *)a3
{
  ABVCardCardDAVValueSetter *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;

  v4 = -[ABVCardCardDAVValueSetter initWithPerson:options:]([ABVCardCardDAVValueSetter alloc], "initWithPerson:options:", a3, self->_importOptions);
  v5 = -[ABVCardParser importToValueSetter:](self, "importToValueSetter:", v4);
  if (-[NSMutableDictionary count](self->_unknownAttributes, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v6, "setOutputFormat:", 200);
    objc_msgSend(v6, "encodeObject:forKey:", self->_unknownAttributes, *MEMORY[0x1E0CB2CD0]);
    objc_msgSend(v6, "finishEncoding");
    v7 = objc_msgSend(v6, "encodedData");
    -[ABVCardCardDAVValueSetter setValue:forProperty:](v4, "setValue:forProperty:", v7, kABPersonExternalRepresentationProperty);

  }
  return v5;
}

- (BOOL)importToGroup:(void *)a3 removeExistingProperties:(BOOL)a4
{
  if (a4)
    self->_importOptions |= 1uLL;
  return -[ABVCardCardDAVParser importToGroup:](self, "importToGroup:", a3);
}

- (BOOL)importToGroup:(void *)a3
{
  ABVCardCardDAVValueSetter *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;

  v4 = -[ABVCardCardDAVValueSetter initWithGroup:options:]([ABVCardCardDAVValueSetter alloc], "initWithGroup:options:", a3, self->_importOptions);
  v5 = -[ABVCardParser importToValueSetter:](self, "importToValueSetter:", v4);
  if (-[NSMutableDictionary count](self->_unknownAttributes, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v6, "setOutputFormat:", 200);
    objc_msgSend(v6, "encodeObject:forKey:", self->_unknownAttributes, *MEMORY[0x1E0CB2CD0]);
    objc_msgSend(v6, "finishEncoding");
    v7 = objc_msgSend(v6, "encodedData");
    -[ABVCardCardDAVValueSetter setValue:forProperty:](v4, "setValue:forProperty:", v7, kABPersonExternalRepresentationProperty);

  }
  return v5;
}

- (void)createRecordInSource:(void *)a3 outRecordType:(unsigned int *)a4
{
  ABRecordRef v7;
  const void *v8;
  ABVCardCardDAVValueSetter *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;

  if (a3)
    v7 = ABPersonCreateInSource(a3);
  else
    v7 = ABPersonCreate();
  v8 = v7;
  v9 = -[ABVCardPersonValueSetter initWithPerson:]([ABVCardCardDAVValueSetter alloc], "initWithPerson:", v7);
  v10 = -[ABVCardParser importToValueSetter:](self, "importToValueSetter:", v9);
  if (-[NSMutableDictionary count](self->_unknownAttributes, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v11, "setOutputFormat:", 200);
    objc_msgSend(v11, "encodeObject:forKey:", self->_unknownAttributes, *MEMORY[0x1E0CB2CD0]);
    objc_msgSend(v11, "finishEncoding");
    v12 = objc_msgSend(v11, "encodedData");
    -[ABVCardCardDAVValueSetter setValue:forProperty:](v9, "setValue:forProperty:", v12, kABPersonExternalRepresentationProperty);

  }
  if (v10)
    v13 = -[ABVCardCardDAVValueSetter copyParsedRecordWithSource:outRecordType:](v9, "copyParsedRecordWithSource:outRecordType:", a3, a4);
  else
    v13 = 0;

  if (v8)
    CFRelease(v8);
  return v13;
}

- (void)noteLackOfValueForProperty:(unsigned int)a3
{
  const __CFString *v4;
  const __CFString *v5;
  CFTypeID v6;
  CFIndex Length;

  if ((self->_importOptions & 1) == 0)
  {
    v4 = -[ABVCardValueSetter valueForProperty:](self->super._valueSetter, "valueForProperty:", *(_QWORD *)&a3);
    if (v4)
    {
      v5 = v4;
      v6 = CFGetTypeID(v4);
      if (v6 == CFStringGetTypeID())
      {
        Length = CFStringGetLength(v5);
        goto LABEL_11;
      }
      if (v6 == CFDictionaryGetTypeID())
      {
        Length = CFDictionaryGetCount((CFDictionaryRef)v5);
        goto LABEL_11;
      }
      if (v6 == CFArrayGetTypeID())
      {
        Length = CFArrayGetCount((CFArrayRef)v5);
        goto LABEL_11;
      }
      if (v6 == CFSetGetTypeID())
      {
        Length = CFSetGetCount((CFSetRef)v5);
LABEL_11:
        if (Length <= 0)
          return;
        goto LABEL_12;
      }
      if (v6 != ABMultiValueGetTypeID() || ABMultiValueGetCount(v5) >= 1)
LABEL_12:
        -[ABVCardCardDAVParser setLocalRecordHasAdditionalProperties:](self, "setLocalRecordHasAdditionalProperties:", 1);
    }
  }
}

- (void)noteLackOfValueForImageData
{
  ABVCardValueSetter *valueSetter;

  valueSetter = self->super._valueSetter;
  if ((self->_importOptions & 1) != 0)
  {
    -[ABVCardValueSetter setImageData:](valueSetter, "setImageData:", 0);
  }
  else if (-[ABVCardValueSetter imageData](valueSetter, "imageData"))
  {
    -[ABVCardCardDAVParser setLocalRecordHasAdditionalProperties:](self, "setLocalRecordHasAdditionalProperties:", 1);
  }
}

- (void)cleanUpCardState
{
  objc_super v3;

  self->_lastCropRectX = self->super._cropRectX;
  self->_lastCropRectY = self->super._cropRectY;
  self->_lastCropRectWidth = self->super._cropRectWidth;
  self->_lastCropRectHeight = self->super._cropRectHeight;

  self->_lastCropRectChecksum = self->super._cropRectChecksum;
  v3.receiver = self;
  v3.super_class = (Class)ABVCardCardDAVParser;
  -[ABVCardParser cleanUpCardState](&v3, sel_cleanUpCardState);
}

- (BOOL)localRecordHasAdditionalProperties
{
  return self->_localRecordHasAdditionalProperties;
}

- (int)lastCropRectX
{
  return self->_lastCropRectX;
}

- (int)lastCropRectY
{
  return self->_lastCropRectY;
}

- (int)lastCropRectWidth
{
  return self->_lastCropRectWidth;
}

- (int)lastCropRectHeight
{
  return self->_lastCropRectHeight;
}

- (NSData)lastCropRectChecksum
{
  return (NSData *)objc_getProperty(self, a2, 368, 1);
}

@end
