@implementation APEndpointDisplayDescriptionCopyProperty

uint64_t __APEndpointDisplayDescriptionCopyProperty_block_invoke(_QWORD *a1)
{
  const void *v2;
  uint64_t v3;
  uint64_t *v4;
  const __CFDictionary *v5;
  const __CFString *v6;
  uint64_t result;
  int v8;
  const __CFDictionary *v9;
  const __CFString *v10;
  CGFloat Int64;
  CGFloat v12;
  CGFloat v13;
  char v14;
  uint64_t *v15;
  uint64_t *v16;
  BOOL v17;
  char v18;
  char v19;
  char v20;
  const void *Value;
  uint64_t v22;
  CGSize v23;
  CGSize v24;
  CGSize v25;

  v3 = a1[5];
  v2 = (const void *)a1[6];
  v4 = (uint64_t *)a1[8];
  if (CFEqual(v2, CFSTR("EDID")))
  {
    v5 = *(const __CFDictionary **)(v3 + 24);
    v6 = CFSTR("edid");
LABEL_15:
    result = (uint64_t)CFDictionaryGetValue(v5, v6);
    if (result)
      result = (uint64_t)CFRetain((CFTypeRef)result);
    v8 = 0;
    *v4 = result;
    goto LABEL_18;
  }
  if (CFEqual(v2, CFSTR("UUID")))
  {
    v5 = *(const __CFDictionary **)(v3 + 24);
    v6 = CFSTR("uuid");
    goto LABEL_15;
  }
  if (CFEqual(v2, CFSTR("ViewAreas")))
  {
    v5 = *(const __CFDictionary **)(v3 + 24);
    v6 = CFSTR("viewAreas");
    goto LABEL_15;
  }
  if (CFEqual(v2, CFSTR("InitialViewArea")))
  {
    v5 = *(const __CFDictionary **)(v3 + 24);
    v6 = CFSTR("initialViewArea");
    goto LABEL_15;
  }
  if (CFEqual(v2, CFSTR("AdjacentViewAreas")))
  {
    v5 = *(const __CFDictionary **)(v3 + 24);
    v6 = CFSTR("adjacentViewAreas");
    goto LABEL_15;
  }
  if (CFEqual(v2, CFSTR("PrimaryInputDevice")))
  {
    v5 = *(const __CFDictionary **)(v3 + 24);
    v6 = CFSTR("primaryInputDevice");
    goto LABEL_15;
  }
  if (CFEqual(v2, CFSTR("MaxFPS")))
  {
LABEL_14:
    v5 = *(const __CFDictionary **)(v3 + 24);
    v6 = CFSTR("maxFPS");
    goto LABEL_15;
  }
  if (CFEqual(v2, CFSTR("SupportsRotation")))
  {
    v9 = *(const __CFDictionary **)(v3 + 24);
    v10 = CFSTR("rotation");
    goto LABEL_21;
  }
  if (CFEqual(v2, CFSTR("HDRInfo")))
  {
    v5 = *(const __CFDictionary **)(v3 + 24);
    v6 = CFSTR("HDRInfo");
    goto LABEL_15;
  }
  if (CFEqual(v2, CFSTR("receiverSupports444")))
  {
    v9 = *(const __CFDictionary **)(v3 + 24);
    v10 = CFSTR("receiverSupports444");
    goto LABEL_21;
  }
  if (CFEqual(v2, CFSTR("receiverSupportsHDRMirroring")))
  {
    v9 = *(const __CFDictionary **)(v3 + 24);
    v10 = CFSTR("receiverSupportsHDRMirroring");
    goto LABEL_21;
  }
  if (CFEqual(v2, CFSTR("IsOverscanned")))
  {
    v9 = *(const __CFDictionary **)(v3 + 24);
    v10 = CFSTR("overscanned");
LABEL_21:
    result = (uint64_t)CFDictionaryGetValue(v9, v10);
    if (!result)
      result = *MEMORY[0x1E0C9AE40];
    goto LABEL_23;
  }
  if (CFEqual(v2, CFSTR("RefreshRate")))
    goto LABEL_14;
  if (CFEqual(v2, CFSTR("PhysicalSize")))
  {
    Int64 = (double)CFDictionaryGetInt64();
    v23.height = (double)CFDictionaryGetInt64();
    v23.width = Int64;
    result = (uint64_t)CGSizeCreateDictionaryRepresentation(v23);
    *v4 = result;
    if (!result)
    {
      v8 = -71780;
LABEL_44:
      result = APSLogErrorAt();
      goto LABEL_18;
    }
    goto LABEL_25;
  }
  if (CFEqual(v2, CFSTR("PixelSize")))
  {
    v12 = (double)CFDictionaryGetInt64();
    v24.height = (double)CFDictionaryGetInt64();
    v24.width = v12;
    result = (uint64_t)CGSizeCreateDictionaryRepresentation(v24);
    *v4 = result;
    if (!result)
    {
      v8 = -71780;
      goto LABEL_44;
    }
LABEL_25:
    v8 = 0;
    goto LABEL_18;
  }
  if (CFEqual(v2, CFSTR("PixelSizeMax")))
  {
    v13 = (double)CFDictionaryGetInt64();
    v25.height = (double)CFDictionaryGetInt64();
    v25.width = v13;
    result = (uint64_t)CGSizeCreateDictionaryRepresentation(v25);
    *v4 = result;
    if (!result)
    {
      v8 = -71780;
      goto LABEL_44;
    }
    goto LABEL_25;
  }
  if (CFEqual(v2, CFSTR("SupportsKnobInput")))
  {
    v14 = CFDictionaryGetInt64();
    v15 = (uint64_t *)MEMORY[0x1E0C9AE50];
    v16 = (uint64_t *)MEMORY[0x1E0C9AE40];
    v17 = (v14 & 2) == 0;
    goto LABEL_53;
  }
  if (CFEqual(v2, CFSTR("SupportsLowFidelityTouch")))
  {
    v18 = CFDictionaryGetInt64();
    v15 = (uint64_t *)MEMORY[0x1E0C9AE50];
    v16 = (uint64_t *)MEMORY[0x1E0C9AE40];
    v17 = (v18 & 4) == 0;
    goto LABEL_53;
  }
  if (CFEqual(v2, CFSTR("SupportsHighFidelityTouch")))
  {
    v19 = CFDictionaryGetInt64();
    v15 = (uint64_t *)MEMORY[0x1E0C9AE50];
    v16 = (uint64_t *)MEMORY[0x1E0C9AE40];
    v17 = (v19 & 8) == 0;
    goto LABEL_53;
  }
  if (CFEqual(v2, CFSTR("SupportsTouchpadInput")))
  {
    v20 = CFDictionaryGetInt64();
    v15 = (uint64_t *)MEMORY[0x1E0C9AE50];
    v16 = (uint64_t *)MEMORY[0x1E0C9AE40];
    v17 = (v20 & 0x10) == 0;
LABEL_53:
    if (v17)
      v15 = v16;
    goto LABEL_55;
  }
  if (CFEqual(v2, CFSTR("cornerMasks")) || CFEqual(v2, CFSTR("IsNightMode")) || CFEqual(v2, CFSTR("IsLimitedUI")))
  {
    FigCFDictionaryGetBooleanIfPresent();
    v15 = (uint64_t *)MEMORY[0x1E0C9AE40];
LABEL_55:
    result = *v15;
LABEL_23:
    *v4 = result;
    if (result)
      result = (uint64_t)CFRetain((CFTypeRef)result);
    goto LABEL_25;
  }
  if (CFEqual(v2, CFSTR("LimitedUIElements")))
  {
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(v3 + 24), CFSTR("limitedUIElements"));
    if (Value)
    {
      v22 = (uint64_t)Value;
      result = (uint64_t)CFRetain(Value);
    }
    else
    {
      result = (uint64_t)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
      v22 = result;
      if (!result)
      {
        v8 = -71780;
        goto LABEL_44;
      }
    }
    v8 = 0;
    *v4 = v22;
    goto LABEL_18;
  }
  if (CFEqual(v2, CFSTR("Url")))
  {
    v5 = *(const __CFDictionary **)(v3 + 24);
    v6 = CFSTR("url");
    goto LABEL_15;
  }
  result = CFEqual(v2, CFSTR("InitialUrl"));
  if ((_DWORD)result)
  {
    v5 = *(const __CFDictionary **)(v3 + 24);
    v6 = CFSTR("initialURL");
    goto LABEL_15;
  }
  v8 = -71782;
  if (gLogCategory_APEndpointDisplayDescription <= 30)
  {
    if (gLogCategory_APEndpointDisplayDescription != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
      result = LogPrintF();
  }
LABEL_18:
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v8;
  return result;
}

@end
