@implementation DTDSCSymbolicatorCache

- (DTDSCSymbolicatorCache)init
{
  DTDSCSymbolicatorCache *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DTDSCSymbolicatorCache;
  v2 = -[DTDSCSymbolicatorCache init](&v4, sel_init);
  if (v2)
    v2->_sharedCacheUUIDSymbolicators = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BE28948]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_sharedCacheUUIDSymbolicators);
  v3.receiver = self;
  v3.super_class = (Class)DTDSCSymbolicatorCache;
  -[DTDSCSymbolicatorCache dealloc](&v3, sel_dealloc);
}

- (_CSTypeRef)symbolicatorForSharedCacheUUID:(id)a3
{
  id v4;
  unint64_t *Value;
  unint64_t v6;
  unint64_t v7;
  int v8;
  __CFDictionary *sharedCacheUUIDSymbolicators;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v18[16];
  uint64_t v19;
  _CSTypeRef result;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  Value = (unint64_t *)CFDictionaryGetValue(self->_sharedCacheUUIDSymbolicators, v4);
  if (Value)
  {
    v6 = *Value;
    v7 = Value[1];
  }
  else
  {
    objc_msgSend(v4, "getUUIDBytes:", v18);
    v12 = 0;
    v13 = &v12;
    v14 = 0x3010000000;
    v16 = 0;
    v17 = 0;
    v15 = &unk_222BF3AAB;
    CSSymbolicatorForeachSharedCache();
    v8 = CSIsNull();
    sharedCacheUUIDSymbolicators = self->_sharedCacheUUIDSymbolicators;
    if (v8)
    {
      CFDictionarySetValue(sharedCacheUUIDSymbolicators, v4, &unk_222BD25C0);
      v6 = 0;
      v7 = 0;
    }
    else
    {
      CFDictionarySetValue(sharedCacheUUIDSymbolicators, v4, v13 + 4);
      CSRelease();
      v6 = v13[4];
      v7 = v13[5];
    }
    _Block_object_dispose(&v12, 8);
  }

  v10 = v6;
  v11 = v7;
  result._opaque_2 = v11;
  result._opaque_1 = v10;
  return result;
}

@end
