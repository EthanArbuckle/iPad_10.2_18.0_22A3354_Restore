@implementation NSObject(AXPropertyListCoersion)

- (id)_axRecursivelyPropertyListCoercedRepresentationWithError:()AXPropertyListCoersion
{
  CFTypeID v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t Type;
  const __AXValue *v13;
  AXValueType v14;
  CGColorSpace *ColorSpace;
  uint64_t Model;
  size_t NumberOfComponents;
  const CGFloat *Components;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  __int128 valuePtr;
  __int128 v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (smugglingDictionaryForCoreFoundationObject_onceToken != -1)
    dispatch_once(&smugglingDictionaryForCoreFoundationObject_onceToken, &__block_literal_global_13);
  v5 = CFGetTypeID(cf);
  if (v5 == smugglingDictionaryForCoreFoundationObject_CFBooleanTypeID)
  {
    *(_QWORD *)&valuePtr = AXSerializeSmuggledTypeCFBoolean;
    v31 = CFSTR("SmugType");
    v32 = CFSTR("Value");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", CFBooleanGetValue((CFBooleanRef)cf));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)&valuePtr + 1) = v6;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &valuePtr, &v31, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

    goto LABEL_12;
  }
  if (v5 == smugglingDictionaryForCoreFoundationObject_CFUUIDTypeID)
  {
    smugglingDictionaryForCFUUID((const __CFUUID *)cf);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v8 = (void *)v7;
    goto LABEL_12;
  }
  if (v5 == smugglingDictionaryForCoreFoundationObject_AXUIElementTypeID)
  {
    v9 = *(_QWORD *)(cf + 20);
    v10 = *(_QWORD *)(cf + 28);
    LODWORD(v26) = bswap32(*((_DWORD *)cf + 4));
    v27 = bswap64(v10);
    v28 = bswap64(v9);
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendBytes:length:", &v26, 4);
    objc_msgSend(v6, "appendBytes:length:", &v28, 8);
    objc_msgSend(v6, "appendBytes:length:", &v27, 8);
    v31 = CFSTR("SmugType");
    v32 = CFSTR("Value");
    *(_QWORD *)&valuePtr = AXSerializeSmuggledTypeAXUIElement;
    *((_QWORD *)&valuePtr + 1) = v6;
    goto LABEL_10;
  }
  if (v5 == smugglingDictionaryForCoreFoundationObject_AXValueTypeID)
  {
    Type = AXValueGetType((AXValueRef)cf);
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    switch((int)Type)
    {
      case 1:
        valuePtr = 0uLL;
        v13 = (const __AXValue *)cf;
        v14 = kAXValueTypeCGPoint;
        goto LABEL_35;
      case 2:
        valuePtr = 0uLL;
        v13 = (const __AXValue *)cf;
        v14 = kAXValueTypeCGSize;
        goto LABEL_35;
      case 3:
        valuePtr = 0u;
        v30 = 0u;
        AXValueGetValue((AXValueRef)cf, kAXValueTypeCGRect, &valuePtr);
        v31 = (const __CFString *)bswap64(valuePtr);
        v27 = bswap64(v30);
        v28 = bswap64(*((unint64_t *)&valuePtr + 1));
        v26 = bswap64(*((unint64_t *)&v30 + 1));
        objc_msgSend(v6, "appendBytes:length:", &v31, 8);
        objc_msgSend(v6, "appendBytes:length:", &v28, 8);
        objc_msgSend(v6, "appendBytes:length:", &v27, 8);
        v22 = &v26;
        goto LABEL_36;
      case 4:
        valuePtr = 0uLL;
        v13 = (const __AXValue *)cf;
        v14 = kAXValueTypeCFRange;
LABEL_35:
        AXValueGetValue(v13, v14, &valuePtr);
        v31 = (const __CFString *)bswap64(valuePtr);
        v28 = bswap64(*((unint64_t *)&valuePtr + 1));
        objc_msgSend(v6, "appendBytes:length:", &v31, 8);
        v22 = &v28;
LABEL_36:
        v23 = v6;
        v24 = 8;
        goto LABEL_37;
      case 5:
        LODWORD(valuePtr) = 0;
        AXValueGetValue((AXValueRef)cf, kAXValueTypeAXError, &valuePtr);
        LODWORD(v31) = bswap32(valuePtr);
        v22 = (unint64_t *)&v31;
        v23 = v6;
        v24 = 4;
LABEL_37:
        objc_msgSend(v23, "appendBytes:length:", v22, v24);
        break;
      default:
        break;
    }
    v21 = AXSerializeSmuggledTypeAXValue;
LABEL_39:
    *(_QWORD *)&valuePtr = v21;
    v31 = CFSTR("SmugType");
    v32 = CFSTR("ValueType");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", Type);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = CFSTR("Value");
    *((_QWORD *)&valuePtr + 1) = v25;
    *(_QWORD *)&v30 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &valuePtr, &v31, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  if (v5 == smugglingDictionaryForCoreFoundationObject_CGColorTypeID)
  {
    ColorSpace = CGColorGetColorSpace((CGColorRef)cf);
    Model = CGColorSpaceGetModel(ColorSpace);
    if (Model >= 3)
    {
      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AXSerialize3ErrorDomain"), 3, 0);
        v8 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
LABEL_12:
      if (v8)
        return v8;
      goto LABEL_13;
    }
    Type = Model;
    NumberOfComponents = CGColorGetNumberOfComponents((CGColorRef)cf);
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    Components = CGColorGetComponents((CGColorRef)cf);
    if (NumberOfComponents)
    {
      v19 = (unint64_t *)Components;
      do
      {
        v20 = *v19++;
        *(_QWORD *)&valuePtr = bswap64(v20);
        objc_msgSend(v6, "appendBytes:length:", &valuePtr, 8);
        --NumberOfComponents;
      }
      while (NumberOfComponents);
    }
    v21 = AXSerializeSmuggledTypeCGColor;
    goto LABEL_39;
  }
  if (v5 == smugglingDictionaryForCoreFoundationObject_CGPathTypeID)
  {
    smugglingDictionaryForCGPath((const CGPath *)cf);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v5 == smugglingDictionaryForCoreFoundationObject_CTFontTypeID)
  {
    smugglingDictionaryForCTFont((const __CTFont *)cf, (uint64_t)a3);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v5 == smugglingDictionaryForCoreFoundationObject_CFNullTypeID)
  {
    smugglingDictionaryForCFNull();
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v5 == smugglingDictionaryForCoreFoundationObject_CFURLTypeID)
  {
    smugglingDictionaryForCFURL((const __CFURL *)cf);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_13:
  if (*a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AXSerialize3ErrorDomain"), 1, 0);
  v8 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return v8;
}

- (uint64_t)_axRecursivelyReconstitutedRepresentationFromPropertyListWithError:()AXPropertyListCoersion
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AXSerialize3ErrorDomain"), 1, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (uint64_t)_axDictionaryKeyReplacementRepresentation
{
  return 0;
}

- (uint64_t)_axReconstitutedRepresentationForDictionaryKeyReplacement
{
  return 0;
}

@end
