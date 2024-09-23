@implementation NSSQLEntity_DerivedAttributesExtension

- (uint64_t)addDerivationKeypath:(void *)key forAttribute:
{
  uint64_t v5;
  id Value;

  if (result)
  {
    v5 = result;
    Value = (id)CFDictionaryGetValue(*(CFDictionaryRef *)(result + 16), key);
    if (!Value)
    {
      Value = objc_alloc_init(MEMORY[0x1E0C99E20]);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v5 + 16), key, Value);

    }
    result = objc_msgSend(a2, "count");
    if (result)
      return objc_msgSend(Value, "addObject:", a2);
  }
  return result;
}

- (NSSQLEntity_DerivedAttributesExtension)initWithEntity:(id)a3
{
  NSSQLEntity_DerivedAttributesExtension *v4;
  NSSQLEntity_DerivedAttributesExtension *v5;
  CFDictionaryKeyCallBacks v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSSQLEntity_DerivedAttributesExtension;
  v4 = -[NSSQLEntity_DerivedAttributesExtension init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_entity = (NSSQLEntity *)a3;
    memset(&v7, 0, 24);
    *(_OWORD *)&v7.copyDescription = *(_OWORD *)(MEMORY[0x1E0C9B390] + 24);
    v7.hash = *(CFDictionaryHashCallBack *)(MEMORY[0x1E0C9B390] + 40);
    v4->_derivedAttributes = CFDictionaryCreateMutable(0, 0, &v7, MEMORY[0x1E0C9B3A0]);
  }
  return v5;
}

- (void)dealloc
{
  __CFDictionary *derivedAttributes;
  objc_super v4;

  derivedAttributes = self->_derivedAttributes;
  if (derivedAttributes)
    CFRelease(derivedAttributes);

  self->_triggerSQL = 0;
  self->_migrationSQL = 0;
  v4.receiver = self;
  v4.super_class = (Class)NSSQLEntity_DerivedAttributesExtension;
  -[NSSQLEntity_DerivedAttributesExtension dealloc](&v4, sel_dealloc);
}

- (id)entity
{
  return self->_entity;
}

- (void)_generateTriggerSQL
{
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v7[5];

  if (a1)
  {
    if (!*(_QWORD *)(a1 + 24))
    {
      v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      *(_QWORD *)(a1 + 24) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      *(_QWORD *)(a1 + 32) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v3, CFSTR("dropStatements"));

      v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v4, CFSTR("dataStatements"));

      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v5, CFSTR("triggerCreationStatements"));

      v6 = *(void **)(a1 + 16);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __61__NSSQLEntity_DerivedAttributesExtension__generateTriggerSQL__block_invoke;
      v7[3] = &unk_1E1EE0B30;
      v7[4] = a1;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);
      objc_msgSend(v2, "drain");

    }
  }
}

@end
