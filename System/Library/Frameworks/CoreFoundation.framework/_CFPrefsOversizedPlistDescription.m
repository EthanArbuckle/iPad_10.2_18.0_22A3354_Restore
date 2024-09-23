@implementation _CFPrefsOversizedPlistDescription

- (_QWORD)initWithDict:(const void *)a3 setKeys:(const void *)a4 andValues:(CFIndex)a5 count:
{
  _QWORD *v9;
  CFTypeRef v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v12.receiver = a1;
  v12.super_class = (Class)_CFPrefsOversizedPlistDescription;
  v9 = objc_msgSendSuper2(&v12, sel_init);
  if (v9)
  {
    if (a2)
      v10 = CFRetain(a2);
    else
      v10 = 0;
    v9[1] = v10;
    v9[2] = CFDictionaryCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, a3, a4, a5, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  return v9;
}

- (id)_descriptionOfDictionary:(__CFDictionary *)a3 withKeyRedaction:(BOOL)a4
{
  unint64_t Count;
  CFMutableArrayRef Mutable;
  const __CFArray *v8;
  uint64_t v9;
  __CFString *v10;
  CFIndex v11;
  CFTypeRef v12;
  _QWORD v14[5];
  _QWORD v15[7];
  BOOL v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  Count = CFDictionaryGetCount(a3);
  Mutable = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, Count, 0);
  v8 = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, Count, &kCFTypeArrayCallBacks);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79___CFPrefsOversizedPlistDescription__descriptionOfDictionary_withKeyRedaction___block_invoke;
  v15[3] = &unk_1E13379D0;
  v15[4] = &v17;
  v15[5] = Mutable;
  v16 = a4;
  v15[6] = v8;
  CFDictionaryApply(a3, (uint64_t)v15);
  CFRelease(Mutable);
  v10 = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0);
  if (CFArrayGetCount(v8) > 9)
    v11 = 10;
  else
    v11 = CFArrayGetCount(v8);
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __79___CFPrefsOversizedPlistDescription__descriptionOfDictionary_withKeyRedaction___block_invoke_2;
  v14[3] = &__block_descriptor_40_e13_v24__0r_v8_16l;
  v14[4] = v10;
  CFArrayApply((uint64_t)v8, 0, v11, (uint64_t)v14);
  if (CFArrayGetCount(v8) >= 11)
    CFStringAppendFormat(v10, 0, CFSTR("...\nTotal keys: %ld - Average approximate value size: %ld bytes"), Count, v18[3] / Count);
  CFRelease(v8);
  v12 = CFAutorelease(v10);
  _Block_object_dispose(&v17, 8);
  return (id)v12;
}

- (id)_descriptionWithKeyRedaction:(BOOL)a3
{
  _BOOL8 v3;
  __CFString *Mutable;
  __CFDictionary *existingValues;

  v3 = a3;
  Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0);
  if (CFDictionaryGetCount(self->newValues) >= 1)
    CFStringAppendFormat(Mutable, 0, CFSTR("Description of keys being set:\n%@\n"), -[_CFPrefsOversizedPlistDescription _descriptionOfDictionary:withKeyRedaction:](self, "_descriptionOfDictionary:withKeyRedaction:", self->newValues, v3));
  existingValues = self->existingValues;
  if (existingValues && CFDictionaryGetCount(existingValues) >= 1)
    CFStringAppendFormat(Mutable, 0, CFSTR("Description of keys already present:\n%@\n"), -[_CFPrefsOversizedPlistDescription _descriptionOfDictionary:withKeyRedaction:](self, "_descriptionOfDictionary:withKeyRedaction:", self->existingValues, v3));
  return (id)CFAutorelease(Mutable);
}

- (id)redactedDescription
{
  return -[_CFPrefsOversizedPlistDescription _descriptionWithKeyRedaction:](self, "_descriptionWithKeyRedaction:", 1);
}

- (id)description
{
  return -[_CFPrefsOversizedPlistDescription _descriptionWithKeyRedaction:](self, "_descriptionWithKeyRedaction:", 0);
}

- (void)dealloc
{
  __CFDictionary *existingValues;
  __CFDictionary *newValues;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  existingValues = self->existingValues;
  if (existingValues)
    CFRelease(existingValues);
  newValues = self->newValues;
  if (newValues)
    CFRelease(newValues);
  v5.receiver = self;
  v5.super_class = (Class)_CFPrefsOversizedPlistDescription;
  -[_CFPrefsOversizedPlistDescription dealloc](&v5, sel_dealloc);
}

@end
