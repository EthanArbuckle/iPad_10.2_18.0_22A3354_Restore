@implementation GetPropertyData

CFIndex __brokeredPlugin_GetPropertyData_block_invoke(uint64_t a1)
{
  CFIndex result;
  unint64_t v3;
  unint64_t v4;
  CFIndex v5;
  const void *ValueAtIndex;
  uint64_t (*v7)(const void *);

  result = CFArrayGetCount(*(CFArrayRef *)(*(_QWORD *)(a1 + 40) + 40));
  v3 = *(unsigned int *)(a1 + 56);
  if (result >= (uint64_t)(v3 >> 2))
    v4 = v3 >> 2;
  else
    v4 = result;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) >= 1)
  {
    v5 = 0;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 40) + 40), v5);
      v7 = *(uint64_t (**)(const void *))(*(_QWORD *)(CMBaseObjectGetVTable((uint64_t)ValueAtIndex) + 16) + 8);
      if (v7)
        result = v7(ValueAtIndex);
      else
        result = 0;
      *(_DWORD *)(*(_QWORD *)(a1 + 48) + 4 * v5++) = result;
    }
    while (v5 < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  }
  return result;
}

uint64_t __brokeredPlugin_GetPropertyData_block_invoke_2(uint64_t a1)
{
  CFIndex Count;
  CFIndex v3;
  CFIndex v4;
  const void *v5;
  const void *ValueAtIndex;
  uint64_t (*v7)(const void *);
  const void *v8;
  int v9;
  uint64_t (*v10)(const void *);
  uint64_t result;

  Count = CFArrayGetCount(*(CFArrayRef *)(*(_QWORD *)(a1 + 32) + 40));
  if (Count < 1)
    goto LABEL_13;
  v3 = Count;
  v4 = 0;
  v5 = **(const void ***)(a1 + 40);
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 32) + 40), v4);
    v7 = *(uint64_t (**)(const void *))(*(_QWORD *)(CMBaseObjectGetVTable((uint64_t)ValueAtIndex) + 24) + 8);
    if (v7)
      break;
    if (FigCFEqual(v5, 0))
      goto LABEL_11;
LABEL_9:
    if (v3 == ++v4)
      goto LABEL_13;
  }
  v8 = (const void *)v7(ValueAtIndex);
  v9 = FigCFEqual(v5, v8);
  if (v8)
    CFRelease(v8);
  if (!v9)
    goto LABEL_9;
LABEL_11:
  v10 = *(uint64_t (**)(const void *))(*(_QWORD *)(CMBaseObjectGetVTable((uint64_t)ValueAtIndex) + 16) + 8);
  if (!v10)
  {
LABEL_13:
    result = 0;
    goto LABEL_14;
  }
  result = v10(ValueAtIndex);
LABEL_14:
  **(_DWORD **)(a1 + 48) = result;
  return result;
}

CFIndex __plugin_GetPropertyData_block_invoke(uint64_t a1)
{
  CFIndex result;
  unint64_t v3;
  unint64_t v4;
  CFIndex v5;
  const void *ValueAtIndex;
  uint64_t (*v7)(const void *);

  result = CFArrayGetCount(*(CFArrayRef *)(*(_QWORD *)(a1 + 40) + 24));
  v3 = *(unsigned int *)(a1 + 56);
  if (result >= (uint64_t)(v3 >> 2))
    v4 = v3 >> 2;
  else
    v4 = result;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) >= 1)
  {
    v5 = 0;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 40) + 24), v5);
      v7 = *(uint64_t (**)(const void *))(*(_QWORD *)(CMBaseObjectGetVTable((uint64_t)ValueAtIndex) + 16) + 8);
      if (v7)
        result = v7(ValueAtIndex);
      else
        result = 0;
      *(_DWORD *)(*(_QWORD *)(a1 + 48) + 4 * v5++) = result;
    }
    while (v5 < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  }
  return result;
}

uint64_t __plugin_GetPropertyData_block_invoke_2(uint64_t a1)
{
  CFIndex Count;
  CFIndex v3;
  CFIndex v4;
  const void *v5;
  const void *ValueAtIndex;
  uint64_t (*v7)(const void *);
  const void *v8;
  int v9;
  uint64_t (*v10)(const void *);
  uint64_t result;

  Count = CFArrayGetCount(*(CFArrayRef *)(*(_QWORD *)(a1 + 32) + 24));
  if (Count < 1)
    goto LABEL_13;
  v3 = Count;
  v4 = 0;
  v5 = **(const void ***)(a1 + 40);
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 32) + 24), v4);
    v7 = *(uint64_t (**)(const void *))(*(_QWORD *)(CMBaseObjectGetVTable((uint64_t)ValueAtIndex) + 24) + 8);
    if (v7)
      break;
    if (FigCFEqual(v5, 0))
      goto LABEL_11;
LABEL_9:
    if (v3 == ++v4)
      goto LABEL_13;
  }
  v8 = (const void *)v7(ValueAtIndex);
  v9 = FigCFEqual(v5, v8);
  if (v8)
    CFRelease(v8);
  if (!v9)
    goto LABEL_9;
LABEL_11:
  v10 = *(uint64_t (**)(const void *))(*(_QWORD *)(CMBaseObjectGetVTable((uint64_t)ValueAtIndex) + 16) + 8);
  if (!v10)
  {
LABEL_13:
    result = 0;
    goto LABEL_14;
  }
  result = v10(ValueAtIndex);
LABEL_14:
  **(_DWORD **)(a1 + 48) = result;
  return result;
}

void __endpointCentricPlugin_GetPropertyData_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const __CFDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  int v18;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(v2 + 64);
  v4 = *(const __CFDictionary **)(v2 + 72);
  v6 = *(_QWORD *)(v3 + 8);
  v7 = *(_QWORD *)(v6 + 24);
  if (v5)
    ++v7;
  *(_QWORD *)(v6 + 24) = v7;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += CFDictionaryGetCount(v4);
  v8 = malloc_type_calloc(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 8uLL, 0x2004093837F09uLL);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(v10 + 64);
  if (v11)
  {
    *v8 = v11;
    v10 = *(_QWORD *)(a1 + 40);
    v11 = 1;
  }
  CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(v10 + 72), 0, (const void **)&v8[v11]);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(_QWORD *)(v12 + 24);
  if (v13 >= (unint64_t)*(unsigned int *)(a1 + 64) >> 2)
    v13 = (unint64_t)*(unsigned int *)(a1 + 64) >> 2;
  *(_QWORD *)(v12 + 24) = v13;
  v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v14 >= 1)
  {
    for (i = 0; i < v14; ++i)
    {
      v16 = v9[i];
      v17 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable(v16) + 16) + 8);
      if (v17)
        v18 = v17(v16);
      else
        v18 = 0;
      *(_DWORD *)(*(_QWORD *)(a1 + 48) + 4 * i) = v18;
      v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    }
  }
  **(_DWORD **)(a1 + 56) = 4 * v14;
  free(v9);
}

void __endpointCentricPlugin_GetPropertyData_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  CFIndex Count;
  int64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  const void *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  int v16;
  unsigned int v17;
  int v18;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(v2 + 64);
  Count = CFDictionaryGetCount(*(CFDictionaryRef *)(v2 + 72));
  if (v3)
    v5 = Count + 1;
  else
    v5 = Count;
  v6 = malloc_type_calloc(v5, 8uLL, 0x2004093837F09uLL);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(v8 + 64);
  if (v9)
  {
    *v6 = v9;
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 1;
  }
  CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(v8 + 72), 0, (const void **)&v6[v9]);
  if (v5 >= 1)
  {
    v10 = 0;
    while (1)
    {
      v11 = v7[v10];
      v12 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable(v11) + 24) + 8);
      v13 = v12 ? (const void *)v12(v11) : 0;
      if (!FigCFEqual(**(CFTypeRef **)(a1 + 48), v13))
        break;
      v14 = v7[v10];
      v15 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable(v14) + 16) + 8);
      if (!v15)
        break;
      v16 = v15(v14);
      if (v13)
        goto LABEL_16;
LABEL_17:
      if (++v10 >= v5 || v16)
        goto LABEL_21;
    }
    v16 = 0;
    if (!v13)
      goto LABEL_17;
LABEL_16:
    CFRelease(v13);
    goto LABEL_17;
  }
  v16 = 0;
LABEL_21:
  v17 = *(_DWORD *)(a1 + 72);
  **(_DWORD **)(a1 + 56) = 4;
  if (v17 < 4)
  {
    v18 = 561211770;
  }
  else
  {
    v18 = 0;
    **(_DWORD **)(a1 + 64) = v16;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v18;
  free(v7);
}

@end
