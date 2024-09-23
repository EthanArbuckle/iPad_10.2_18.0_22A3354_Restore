@implementation LSDisplayNameConstructor

void __83___LSDisplayNameConstructor_Private__initContentBitsWithDisplayName_treatAsFSName___block_invoke(uint64_t a1, CFStringInlineBuffer *buffer, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFIndex length;
  const UniChar *directUniCharBuffer;
  UniChar v13;
  const char *directCStringBuffer;
  CFIndex bufferedRangeStart;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFIndex v19;
  CFIndex v20;
  NSCharacterSet *v21;
  NSCharacterSet *v22;
  CFRange v23;

  if (a3)
  {
    v6 = 0;
    v7 = 0;
    v8 = 64;
    v9 = MEMORY[0x1E0C80978];
    while (1)
    {
      v10 = (unint64_t)v7 >= 4 ? 4 : v7;
      if ((v7 & 0x8000000000000000) == 0)
      {
        length = buffer->rangeToBuffer.length;
        if (length > v7)
          break;
      }
      if ((*(_BYTE *)(v9 + 62) & 4) == 0)
      {
        v13 = 0;
LABEL_29:
        _LSDNCGetForbiddenCharacters(0);
        v22 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
        if (_LSDNCCharacterSetContainsCharacterFromInlineBuffer(v22, v13, buffer, v7))
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) |= 0x40u;

      }
LABEL_32:
      ++v7;
      --v6;
      ++v8;
      if (a3 == v7)
        return;
    }
    directUniCharBuffer = buffer->directUniCharBuffer;
    if (directUniCharBuffer)
    {
      v13 = directUniCharBuffer[v7 + buffer->rangeToBuffer.location];
    }
    else
    {
      directCStringBuffer = buffer->directCStringBuffer;
      if (directCStringBuffer)
      {
        v13 = directCStringBuffer[buffer->rangeToBuffer.location + v7];
      }
      else
      {
        if (buffer->bufferedRangeEnd <= v7
          || (bufferedRangeStart = buffer->bufferedRangeStart, bufferedRangeStart > v7))
        {
          v16 = -v10;
          v17 = v10 + v6;
          v18 = v8 - v10;
          v19 = v7 + v16;
          v20 = v19 + 64;
          if (v19 + 64 >= length)
            v20 = buffer->rangeToBuffer.length;
          buffer->bufferedRangeStart = v19;
          buffer->bufferedRangeEnd = v20;
          if (length >= v18)
            length = v18;
          v23.length = length + v17;
          v23.location = v19 + buffer->rangeToBuffer.location;
          CFStringGetCharacters(buffer->theString, v23, buffer->buffer);
          bufferedRangeStart = buffer->bufferedRangeStart;
        }
        v13 = buffer->buffer[v7 - bufferedRangeStart];
      }
    }
    if (v13 <= 0x7Fu)
    {
      if ((*(_DWORD *)(v9 + 4 * v13 + 60) & 0x40000) != 0)
      {
        if (v13 == 58 && *(_BYTE *)(a1 + 40))
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) |= 0x10u;
        goto LABEL_32;
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) |= 8u;
      if (_LSDNCGetBiDiControlCharacters(void)::once != -1)
        dispatch_once(&_LSDNCGetBiDiControlCharacters(void)::once, &__block_literal_global_148);
      v21 = (NSCharacterSet *)(id)_LSDNCGetBiDiControlCharacters(void)::result;
      if (_LSDNCCharacterSetContainsCharacterFromInlineBuffer(v21, v13, buffer, v7))
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) |= 0x20u;

    }
    goto LABEL_29;
  }
}

void __123___LSDisplayNameConstructor_ConstructForAnyFile__displayNameConstructorsWithContextIfNeeded_bundle_bundleClass_node_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v6 = objc_msgSend(v9, "isEqual:", CFSTR("LSDefaultLocalizedValue"));
    if (*(_QWORD *)(a1 + 32) && *(_BYTE *)(a1 + 80))
    {
      objc_msgSend((id)objc_opt_class(), "concatenateBaseName:andExtension:", v5, *(_QWORD *)(a1 + 32));
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v7;
    }
    v8 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 56)), "initWithContextIfNeeded:node:isDirectory:bundleClass:desiredDisplayName:treatAsFSName:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 81), *(_QWORD *)(a1 + 72), v5, v6);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v9);

  }
}

uint64_t __55___LSDisplayNameConstructor_RTL__isStringNaturallyRTL___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = ubidi_getBaseDirection();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (_DWORD)result == 1;
  return result;
}

void __62___LSDisplayNameConstructor_Private__cleanSecondaryExtension___block_invoke(uint64_t a1)
{
  id v1;
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  __CFCharacterSet *Mutable;
  int ItemCount;
  const __CFAllocator *v9;
  int v10;
  int Item;
  const __CFString *v12;
  CFCharacterSetRef Copy;
  CFCharacterSetRef v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFAllocator *contentsDeallocator;
  UniChar v19[2048];
  uint64_t v20;
  CFRange v21;

  MEMORY[0x1E0C80A78](a1);
  v20 = *MEMORY[0x1E0C80C00];
  v1 = objc_alloc_init(MEMORY[0x1E0CB3780]);
  objc_msgSend(v1, "addCharactersInRange:", 0, 1);
  v2 = 0x1E0CB3000uLL;
  objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "formUnionWithCharacterSet:", v3);

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "formUnionWithCharacterSet:", v4);

  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "formUnionWithCharacterSet:", v5);

  v6 = v1;
  if (uset_openPattern())
  {
    Mutable = CFCharacterSetCreateMutable(0);
    if (Mutable)
    {
      ItemCount = uset_getItemCount();
      v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE30];
      if (ItemCount >= 1)
      {
        v10 = 0;
        contentsDeallocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE20];
        do
        {
          Item = uset_getItem();
          if (Item <= 0)
          {
            v21.location = 0;
            v21.length = 1;
            CFCharacterSetAddCharactersInRange(Mutable, v21);
          }
          else
          {
            v12 = CFStringCreateWithCharactersNoCopy(v9, v19, Item, contentsDeallocator);
            CFCharacterSetAddCharactersInString(Mutable, v12);
            CFRelease(v12);
          }
          ++v10;
        }
        while (ItemCount != v10);
      }
      Copy = CFCharacterSetCreateCopy(v9, Mutable);
      v2 = 0x1E0CB3000;
      v14 = Copy;
      CFRelease(Mutable);
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(v6, "formUnionWithCharacterSet:", v14);
    uset_close();

  }
  objc_msgSend(*(id *)(v2 + 1280), "illegalCharacterSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "formUnionWithCharacterSet:", v15);

  v16 = objc_msgSend(v6, "copy");
  v17 = (void *)-[_LSDisplayNameConstructor(Private) cleanSecondaryExtension:]::nonExtensionCharacters;
  -[_LSDisplayNameConstructor(Private) cleanSecondaryExtension:]::nonExtensionCharacters = v16;

}

void __62___LSDisplayNameConstructor_Private__cleanSecondaryExtension___block_invoke_2(uint64_t a1, CFStringInlineBuffer *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFIndex v13;
  const UniChar *directUniCharBuffer;
  UniChar v15;
  const char *directCStringBuffer;
  CFIndex bufferedRangeStart;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CFIndex v21;
  CFIndex length;
  UniChar v23;
  CFRange v24;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (a3)
  {
    v9 = 0;
    v10 = 0;
    v11 = 64;
    do
    {
      if ((unint64_t)v10 >= 4)
        v12 = 4;
      else
        v12 = v10;
      v23 = 0;
      if (v10 < 0 || (v13 = a2->rangeToBuffer.length, v13 <= v10))
      {
        v15 = 0;
      }
      else
      {
        directUniCharBuffer = a2->directUniCharBuffer;
        if (directUniCharBuffer)
        {
          v15 = directUniCharBuffer[v10 + a2->rangeToBuffer.location];
        }
        else
        {
          directCStringBuffer = a2->directCStringBuffer;
          if (directCStringBuffer)
          {
            v15 = directCStringBuffer[a2->rangeToBuffer.location + v10];
          }
          else
          {
            if (a2->bufferedRangeEnd <= v10 || (bufferedRangeStart = a2->bufferedRangeStart, bufferedRangeStart > v10))
            {
              v18 = -v12;
              v19 = v12 + v9;
              v20 = v11 - v12;
              v21 = v10 + v18;
              length = v21 + 64;
              if (v21 + 64 >= v13)
                length = a2->rangeToBuffer.length;
              a2->bufferedRangeStart = v21;
              a2->bufferedRangeEnd = length;
              if (v13 >= v20)
                v13 = v20;
              v24.length = v13 + v19;
              v24.location = v21 + a2->rangeToBuffer.location;
              CFStringGetCharacters(a2->theString, v24, a2->buffer);
              bufferedRangeStart = a2->bufferedRangeStart;
            }
            v15 = a2->buffer[v10 - bufferedRangeStart];
          }
        }
      }
      v23 = v15;
      if ((_LSDNCCharacterSetContainsCharacterFromInlineBuffer((NSCharacterSet *)-[_LSDisplayNameConstructor(Private) cleanSecondaryExtension:]::nonExtensionCharacters, v15, a2, v10) & 1) == 0)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendCharacters:length:", &v23, 1);
      ++v10;
      --v9;
      ++v11;
    }
    while (a3 != v10);
  }
}

@end
