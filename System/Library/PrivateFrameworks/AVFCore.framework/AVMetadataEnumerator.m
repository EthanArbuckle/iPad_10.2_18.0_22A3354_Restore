@implementation AVMetadataEnumerator

+ (id)metadataEnumeratorWithMetadataReader:(OpaqueFigMetadataReader *)a3
{
  return -[AVMetadataEnumerator initWithMetadataReader:]([AVMetadataEnumerator alloc], "initWithMetadataReader:", a3);
}

+ (id)metadataEnumeratorWithArray:(id)a3 key:(id)a4 keySpace:(id)a5 locale:(id)a6
{
  return -[AVMetadataEnumerator initWithArray:key:keySpace:locale:]([AVMetadataEnumerator alloc], "initWithArray:key:keySpace:locale:", a3, a4, a5, a6);
}

- (AVMetadataEnumerator)initWithMetadataReader:(OpaqueFigMetadataReader *)a3
{
  return -[AVMetadataEnumerator initWithMetadataReader:array:key:keySpace:locale:](self, "initWithMetadataReader:array:key:keySpace:locale:", a3, 0, 0, 0, 0);
}

- (AVMetadataEnumerator)initWithArray:(id)a3 key:(id)a4 keySpace:(id)a5 locale:(id)a6
{
  return -[AVMetadataEnumerator initWithMetadataReader:array:key:keySpace:locale:](self, "initWithMetadataReader:array:key:keySpace:locale:", 0, a3, a4, a5, a6);
}

- (AVMetadataEnumerator)initWithMetadataReader:(OpaqueFigMetadataReader *)a3 array:(id)a4 key:(id)a5 keySpace:(id)a6 locale:(id)a7
{
  AVMetadataEnumerator *v12;
  uint64_t (*v13)(OpaqueFigMetadataReader *, _QWORD, _QWORD);
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AVMetadataEnumerator;
  v12 = -[AVMetadataEnumerator init](&v16, sel_init);
  if (v12)
  {
    if (a3)
    {
      v13 = *(uint64_t (**)(OpaqueFigMetadataReader *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 40);
      if (v13)
      {
        v14 = v13(a3, 0, 0);
        v12->_count = v14;
        if (v14 > 0)
        {
          -[AVMetadataEnumerator _setMetadataReader:](v12, "_setMetadataReader:", a3);
LABEL_8:
          -[AVMetadataEnumerator _setKey:](v12, "_setKey:", a5);
          -[AVMetadataEnumerator _setKeySpace:](v12, "_setKeySpace:", a6);
          -[AVMetadataEnumerator _setLocale:](v12, "_setLocale:", a7);
          return v12;
        }
      }
      else
      {
        v12->_count = 0;
      }
    }
    else if (a4)
    {
      -[AVMetadataEnumerator _setArrayEnumerator:](v12, "_setArrayEnumerator:", objc_msgSend(a4, "objectEnumerator"));
      goto LABEL_8;
    }

    return 0;
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[AVMetadataEnumerator _setKey:](self, "_setKey:", 0);
  -[AVMetadataEnumerator _setKeySpace:](self, "_setKeySpace:", 0);
  -[AVMetadataEnumerator _setLocale:](self, "_setLocale:", 0);
  -[AVMetadataEnumerator _setArrayEnumerator:](self, "_setArrayEnumerator:", 0);
  -[AVMetadataEnumerator _setMetadataReader:](self, "_setMetadataReader:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AVMetadataEnumerator;
  -[AVMetadataEnumerator dealloc](&v3, sel_dealloc);
}

- (void)_setMetadataReader:(OpaqueFigMetadataReader *)a3
{
  OpaqueFigMetadataReader *reader;

  if (a3)
    CFRetain(a3);
  reader = self->_reader;
  if (reader)
    CFRelease(reader);
  self->_reader = a3;
}

- (void)_setArrayEnumerator:(id)a3
{
  id v5;

  v5 = a3;

  self->_arrayEnumerator = (NSEnumerator *)a3;
}

- (void)_setKey:(id)a3
{
  id v5;

  v5 = a3;

  self->_key = a3;
}

- (void)_setKeySpace:(id)a3
{
  id v5;

  v5 = a3;

  self->_keySpace = (NSString *)a3;
}

- (void)_setLocale:(id)a3
{
  id v5;

  v5 = a3;

  self->_locale = (NSLocale *)a3;
}

- (id)nextObject
{
  id v3;
  int64_t index;
  id key;
  NSString *keySpace;
  NSLocale *locale;

  v3 = 0;
  while (1)
  {
    if (self->_reader)
    {
      index = self->_index;
      if (index < self->_count)
      {
        v3 = -[AVMetadataItem _initWithReader:itemIndex:]([AVMetadataItem alloc], "_initWithReader:itemIndex:", self->_reader, self->_index);
        index = self->_index;
      }
      self->_index = index + 1;
      goto LABEL_6;
    }
    if (self->_arrayEnumerator)
      break;
LABEL_6:
    if (!v3)
      return v3;
LABEL_7:
    key = self->_key;
    if (!key || objc_msgSend(key, "isEqual:", objc_msgSend(v3, "key")))
    {
      keySpace = self->_keySpace;
      if (!keySpace || -[NSString isEqualToString:](keySpace, "isEqualToString:", objc_msgSend(v3, "keySpace")))
      {
        locale = self->_locale;
        if (!locale
          || AVNSLocalesMatchAccordingToRFC4647FilteringRules(locale, (void *)objc_msgSend(v3, "locale")))
        {
          return v3;
        }
      }
    }
  }
  while (1)
  {
    v3 = -[NSEnumerator nextObject](self->_arrayEnumerator, "nextObject");
    if (!v3)
      return v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_7;
  }
}

@end
