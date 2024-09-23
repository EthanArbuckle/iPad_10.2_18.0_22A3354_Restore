@implementation VNDetectBarcodesRequest

- (id)_newVNBarcodeSymbologyQRDescriptorForACBSBarcodeInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D834A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D83468]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D834C0]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (v7 = objc_msgSend(v6, "intValue"), v7 <= 3))
      {
        v9 = kErrorCorrectionLevels[v7];
        objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D834D0]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D834C8]);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDE0]), "initWithPayload:symbolVersion:maskPattern:errorCorrectionLevel:", v4, objc_msgSend(v10, "integerValue"), objc_msgSend(v11, "unsignedCharValue"), v9);
          else
            v8 = 0;

        }
        else
        {
          v8 = 0;
        }

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_newVNBarcodeSymbologyAztecDescriptorForACBSBarcodeInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D834A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D83468]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D83460]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D83458]);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D83450]);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DD60]), "initWithPayload:isCompact:layerCount:dataCodewordCount:", v4, objc_msgSend(v6, "BOOLValue"), objc_msgSend(v7, "integerValue"), objc_msgSend(v8, "integerValue"));
          else
            v9 = 0;

        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_newVNBarcodeSymbologyPDF417DescriptorForACBSBarcodeInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D834A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D83468]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D83480]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v10 = 0;
      }
      else
      {
        v7 = objc_msgSend(v6, "BOOLValue");
        objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D83470]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D83478]);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDD8]), "initWithPayload:isCompact:rowCount:columnCount:", v4, v7, objc_msgSend(v8, "integerValue"), objc_msgSend(v9, "integerValue"));
          else
            v10 = 0;

        }
        else
        {
          v10 = 0;
        }

      }
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_newVNBarcodeSymbologyQRDescriptorForMRCDescriptor:(__MRCDescriptor *)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  const __CFNumber *v7;
  const __CFNumber *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const __CFNumber *v12;
  const __CFNumber *v13;
  const __CFNumber *v14;
  const __CFNumber *v15;
  id v16;
  unsigned __int8 v18;
  uint64_t v19;
  unsigned int valuePtr;

  v5 = MRCDescriptorCopyAttribute();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (const __CFNumber *)MRCDescriptorCopyAttribute();
    v8 = v7;
    if (v7)
    {
      valuePtr = 0;
      CFNumberGetValue(v7, kCFNumberIntType, &valuePtr);
      CFRelease(v8);
      if (valuePtr < 4)
      {
        v11 = kErrorCorrectionLevels[valuePtr];
        v12 = (const __CFNumber *)MRCDescriptorCopyAttribute();
        v13 = v12;
        if (v12)
        {
          v19 = 0;
          CFNumberGetValue(v12, kCFNumberNSIntegerType, &v19);
          CFRelease(v13);
          v14 = (const __CFNumber *)MRCDescriptorCopyAttribute();
          v15 = v14;
          if (v14)
          {
            v18 = 0;
            CFNumberGetValue(v14, kCFNumberCharType, &v18);
            CFRelease(v15);
            v16 = objc_alloc(MEMORY[0x1E0C9DDE0]);
            v10 = (void *)objc_msgSend(v16, "initWithPayload:symbolVersion:maskPattern:errorCorrectionLevel:", v6, v19, v18, v11);
LABEL_20:

            return v10;
          }
          if (a4)
          {
            +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 17, CFSTR("QRMaskPattern data is missing"));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_18;
          }
        }
        else if (a4)
        {
          +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 17, CFSTR("QRSymbolVersion data is missing"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_18;
        }
      }
      else if (a4)
      {
        +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 2, CFSTR("QRErrorCorrectionLevel data is invalid"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
        v10 = 0;
        *a4 = v9;
        goto LABEL_20;
      }
    }
    else if (a4)
    {
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 17, CFSTR("QRErrorCorrectionLevel data is missing"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    v10 = 0;
    goto LABEL_20;
  }
  if (!a4)
    return 0;
  +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 17, CFSTR("Payload data is missing"));
  v10 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  return v10;
}

- (id)_newVNBarcodeSymbologyAztecDescriptorForMRCDescriptor:(__MRCDescriptor *)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  const void *v7;
  const void *v8;
  const __CFNumber *v9;
  const __CFNumber *v10;
  const __CFNumber *v11;
  const __CFNumber *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t valuePtr;

  v5 = MRCDescriptorCopyAttribute();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (const void *)MRCDescriptorCopyAttribute();
    v8 = v7;
    if (v7)
    {
      CFRelease(v7);
      v9 = (const __CFNumber *)MRCDescriptorCopyAttribute();
      v10 = v9;
      if (v9)
      {
        valuePtr = 0;
        CFNumberGetValue(v9, kCFNumberNSIntegerType, &valuePtr);
        CFRelease(v10);
        v11 = (const __CFNumber *)MRCDescriptorCopyAttribute();
        v12 = v11;
        if (v11)
        {
          v17 = 0;
          CFNumberGetValue(v11, kCFNumberNSIntegerType, &v17);
          CFRelease(v12);
          v13 = objc_alloc(MEMORY[0x1E0C9DD60]);
          v14 = (void *)objc_msgSend(v13, "initWithPayload:isCompact:layerCount:dataCodewordCount:", v6, v8 == (const void *)*MEMORY[0x1E0C9AE50], valuePtr, v17);
LABEL_17:

          return v14;
        }
        if (a4)
        {
          +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 17, CFSTR("CodewordCount data is missing"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
LABEL_16:
        v14 = 0;
        goto LABEL_17;
      }
      if (!a4)
        goto LABEL_16;
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 17, CFSTR("LayerCount data is missing"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!a4)
        goto LABEL_16;
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 17, CFSTR("IsCompact data is missing"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_15:
    v14 = 0;
    *a4 = v15;
    goto LABEL_17;
  }
  if (!a4)
    return 0;
  +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 17, CFSTR("Payload data is missing"));
  v14 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  return v14;
}

- (id)_newVNBarcodeSymbologyPDF417DescriptorForMRCDescriptor:(__MRCDescriptor *)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  const void *v7;
  const void *v8;
  const __CFNumber *v9;
  const __CFNumber *v10;
  const __CFNumber *v11;
  const __CFNumber *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t valuePtr;

  v5 = MRCDescriptorCopyAttribute();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (const void *)MRCDescriptorCopyAttribute();
    v8 = v7;
    if (v7)
    {
      CFRelease(v7);
      v9 = (const __CFNumber *)MRCDescriptorCopyAttribute();
      v10 = v9;
      if (v9)
      {
        valuePtr = 0;
        CFNumberGetValue(v9, kCFNumberNSIntegerType, &valuePtr);
        CFRelease(v10);
        v11 = (const __CFNumber *)MRCDescriptorCopyAttribute();
        v12 = v11;
        if (v11)
        {
          v17 = 0;
          CFNumberGetValue(v11, kCFNumberNSIntegerType, &v17);
          CFRelease(v12);
          v13 = objc_alloc(MEMORY[0x1E0C9DDD8]);
          v14 = (void *)objc_msgSend(v13, "initWithPayload:isCompact:rowCount:columnCount:", v6, v8 == (const void *)*MEMORY[0x1E0C9AE50], valuePtr, v17);
LABEL_17:

          return v14;
        }
        if (a4)
        {
          +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 17, CFSTR("ColumnCount data is missing"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
LABEL_16:
        v14 = 0;
        goto LABEL_17;
      }
      if (!a4)
        goto LABEL_16;
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 17, CFSTR("RowCount data is missing"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!a4)
        goto LABEL_16;
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 17, CFSTR("IsCompact data is missing"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_15:
    v14 = 0;
    *a4 = v15;
    goto LABEL_17;
  }
  if (!a4)
    return 0;
  +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 17, CFSTR("Payload data is missing"));
  v14 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  return v14;
}

- (int)_ACBarcodeRecognizerLocateMode
{
  __CFString *v3;
  unint64_t v4;
  int v5;
  void *value;

  -[VNDetectBarcodesRequest locateMode](self, "locateMode");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = -[VNRequest detectionLevel](self, "detectionLevel");
    if (v4 > 2)
    {
      v3 = 0;
LABEL_9:
      v5 = 9;
      goto LABEL_10;
    }
    v3 = off_1E4545360[v4];
  }
  if (-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::onceToken != -1)
    dispatch_once(&-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::onceToken, &__block_literal_global_104);
  value = 0;
  if (!NSMapMember((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, v3, 0, &value))
    goto LABEL_9;
  v5 = (int)value;
LABEL_10:

  return v5;
}

- (ACBSConfig)_createACBSConfigAndReturnError:(id *)a3
{
  uint64_t v5;
  ACBSConfig *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  VNDetectBarcodesRequest *v17;
  id *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = ACBSConfigCreate();
  if (!v5)
  {
    if (a3)
    {
      +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
      v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    return 0;
  }
  v6 = (ACBSConfig *)v5;
  -[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode](self, "_ACBarcodeRecognizerLocateMode");
  ACBSConfigSetLocateMode();
  ACBSConfigSetMaxQRModuleSamples();
  ACBSConfigSetFailedLocationsEnabled();
  -[VNDetectBarcodesRequest symbologies](self, "symbologies");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19 || !objc_msgSend(v19, "count"))
  {
    if (a3)
    {
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 5, CFSTR("barcode detection requires at least one element in the symbologies property"));
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_21:
    ACBSConfigFree();
    return 0;
  }
  v17 = self;
  v18 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v19, "count"));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v19;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v21;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11);
        +[VNDetectBarcodesRequest _ourBarcodeSymbologyToACBSBarcodeTypeMap](VNDetectBarcodesRequest, "_ourBarcodeSymbologyToACBSBarcodeTypeMap");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          if (v18)
          {
            v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ is not a supported barcode symbology"), v12);
            +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 5, v15);
            *v18 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_21;
        }
        objc_msgSend(v7, "addObject:", v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v9)
        continue;
      break;
    }
  }

  ACBSConfigSetSymbologiesEnabled();
  -[VNDetectBarcodesRequest stopAtFirstPyramidWith2DCode](v17, "stopAtFirstPyramidWith2DCode");
  ACBSConfigSetStopsAtFirstPyramidWith2DCode();

  return v6;
}

- (int64_t)_MRCLocateMode
{
  __CFString *v3;
  unint64_t v4;
  int64_t v5;
  void *value;

  -[VNDetectBarcodesRequest locateMode](self, "locateMode");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = -[VNRequest detectionLevel](self, "detectionLevel");
    if (v4 > 2)
    {
      v3 = 0;
LABEL_9:
      v5 = 9;
      goto LABEL_10;
    }
    v3 = off_1E4545360[v4];
  }
  if (-[VNDetectBarcodesRequest _MRCLocateMode]::onceToken != -1)
    dispatch_once(&-[VNDetectBarcodesRequest _MRCLocateMode]::onceToken, &__block_literal_global_112_11129);
  value = 0;
  if (!NSMapMember((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, v3, 0, &value))
    goto LABEL_9;
  v5 = (int64_t)value;
LABEL_10:

  return v5;
}

- (id)_createMRCDecoderOptionsForRevision:(unint64_t)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  CFIndex v10;
  CFMutableArrayRef Mutable;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  const void *v18;
  void *v19;
  uint64_t v20;
  void *v22;
  void *v23;
  id *v24;
  id obj;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", -[VNDetectBarcodesRequest _MRCLocateMode](self, "_MRCLocateMode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D83258]);

    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E459C958, *MEMORY[0x1E0D83240]);
    if (-[VNDetectBarcodesRequest coalesceCompositeSymbologies](self, "coalesceCompositeSymbologies"))
      objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D83260]);
    -[VNDetectBarcodesRequest symbologies](self, "symbologies");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26 && objc_msgSend(v26, "count"))
    {
      v24 = a4;
      v10 = objc_msgSend(v26, "count");
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v10, MEMORY[0x1E0C9B378]);
      if (Mutable)
      {
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        obj = v26;
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v28;
          while (2)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v28 != v13)
                objc_enumerationMutation(obj);
              v15 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
              if ((uint64_t)a3 > 3737841663)
              {
                switch(a3)
                {
                  case 0xDECAF000uLL:
                    +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapPrivate](VNDetectBarcodesRequest, "_ourBarcodeSymbologyToMRCSymbologyMapPrivate");
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "objectForKeyedSubscript:", v15);
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    break;
                  case 0xDECAF001uLL:
                    +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3Private](VNDetectBarcodesRequest, "_ourBarcodeSymbologyToMRCSymbologyMapRev3Private");
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "objectForKeyedSubscript:", v15);
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    break;
                  case 0xDECAF002uLL:
                    +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4Private](VNDetectBarcodesRequest, "_ourBarcodeSymbologyToMRCSymbologyMapRev4Private");
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "objectForKeyedSubscript:", v15);
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    break;
                  default:
                    goto LABEL_36;
                }
              }
              else
              {
                switch(a3)
                {
                  case 2uLL:
                    +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMap](VNDetectBarcodesRequest, "_ourBarcodeSymbologyToMRCSymbologyMap");
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "objectForKeyedSubscript:", v15);
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    break;
                  case 3uLL:
                    +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3](VNDetectBarcodesRequest, "_ourBarcodeSymbologyToMRCSymbologyMapRev3");
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "objectForKeyedSubscript:", v15);
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    break;
                  case 4uLL:
                    +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4](VNDetectBarcodesRequest, "_ourBarcodeSymbologyToMRCSymbologyMapRev4");
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "objectForKeyedSubscript:", v15);
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    break;
                  default:
                    goto LABEL_36;
                }
              }
              v18 = v17;

              if (!v18)
              {
LABEL_36:
                if (v24)
                {
                  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ is not a supported barcode symbology"), v15);
                  +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 5, v22);
                  *v24 = (id)objc_claimAutoreleasedReturnValue();

                }
                CFRelease(Mutable);

                goto LABEL_41;
              }
              CFArrayAppendValue(Mutable, v18);
            }
            v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
            if (v12)
              continue;
            break;
          }
        }

        objc_msgSend(v8, "setObject:forKeyedSubscript:", Mutable, *MEMORY[0x1E0D83270]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNDetectBarcodesRequest stopAtFirstPyramidWith2DCode](self, "stopAtFirstPyramidWith2DCode"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D83268]);

        v20 = 0x20000;
        if ((uint64_t)a3 > 3737841664)
        {
          if (a3 != 3737841665)
          {
            if (a3 != 3737841666)
            {
LABEL_48:
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v20);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D83248]);

              return v8;
            }
LABEL_46:
            v20 = 0x40000;
            goto LABEL_48;
          }
        }
        else if (a3 != 3)
        {
          if (a3 != 4)
            goto LABEL_48;
          goto LABEL_46;
        }
        v20 = 196608;
        goto LABEL_48;
      }
      if (a4)
      {
        +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else if (a4)
    {
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 5, CFSTR("barcode detection requires at least one element in the symbologies property"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_41:

  }
  else if (a4)
  {
    +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    return 0;
  }
  v8 = 0;
  return v8;
}

- (id)newBarcodeObservationForMRCDescriptor:(__MRCDescriptor *)a3 roiCroppingPixelRect:(CGRect)a4 originatingRequestSpecifier:(id)a5 error:(id *)a6
{
  double height;
  double width;
  id v11;
  const void *v12;
  void *v13;
  NSString *v14;
  SEL v15;
  void *v16;
  VNBarcodeObservation *v17;
  const __CFArray *v18;
  const __CFArray *v19;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v21;
  const __CFDictionary *v22;
  const __CFDictionary *v23;
  int v24;
  void *v25;
  VNBarcodeObservation *v26;
  const __CFNumber *v27;
  const __CFNumber *v28;
  double v29;
  VNBarcodeObservation *v30;
  int valuePtr;
  CGPoint v33;
  CGPoint v34;
  CGPoint v35;
  CGPoint point;

  height = a4.size.height;
  width = a4.size.width;
  v11 = a5;
  v12 = (const void *)MRCDescriptorCopyAttribute();
  if (v12)
  {
    +[VNDetectBarcodesRequest barcodeSymbologyForMRCSymbology:](VNDetectBarcodesRequest, "barcodeSymbologyForMRCSymbology:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v12);
    if (!v13)
    {
      if (a6)
      {
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unknown barcode type of '%@'"), v12);
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v25);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      v17 = 0;
      goto LABEL_31;
    }
    v14 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("_new%@DescriptorForMRCDescriptor:error:"), v13);
    v15 = NSSelectorFromString(v14);
    if (v15 && (objc_opt_respondsToSelector() & 1) != 0)
      v16 = (void *)((uint64_t (*)(VNDetectBarcodesRequest *, SEL, __MRCDescriptor *, id *))-[VNDetectBarcodesRequest methodForSelector:](self, "methodForSelector:", v15))(self, v15, a3, a6);
    else
      v16 = 0;

    v35 = (CGPoint)*MEMORY[0x1E0C9D538];
    point = v35;
    v33 = v35;
    v34 = v35;
    v18 = (const __CFArray *)MRCDescriptorCopyAttribute();
    v19 = v18;
    if (v18)
    {
      if (CFArrayGetCount(v18) == 4)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v19, 0);
        CGPointMakeWithDictionaryRepresentation(ValueAtIndex, &point);
        v21 = (const __CFDictionary *)CFArrayGetValueAtIndex(v19, 1);
        CGPointMakeWithDictionaryRepresentation(v21, &v35);
        v22 = (const __CFDictionary *)CFArrayGetValueAtIndex(v19, 2);
        CGPointMakeWithDictionaryRepresentation(v22, &v34);
        v23 = (const __CFDictionary *)CFArrayGetValueAtIndex(v19, 3);
        CGPointMakeWithDictionaryRepresentation(v23, &v33);
        v24 = 1;
      }
      else if (a6)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("invalid barcode location information"));
        v24 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = 0;
      }
      CFRelease(v19);
      if (v24)
      {
        point.x = point.x / width;
        point.y = (height - point.y) / height;
        v35.x = v35.x / width;
        v35.y = (height - v35.y) / height;
        v34.x = v34.x / width;
        v34.y = (height - v34.y) / height;
        v33.x = v33.x / width;
        v33.y = (height - v33.y) / height;
        v26 = [VNBarcodeObservation alloc];
        v17 = -[VNBarcodeObservation initWithOriginatingRequestSpecifier:symbology:descriptor:mrcDescriptor:topLeft:topRight:bottomRight:bottomLeft:](v26, "initWithOriginatingRequestSpecifier:symbology:descriptor:mrcDescriptor:topLeft:topRight:bottomRight:bottomLeft:", v11, v13, v16, a3, point.x, point.y, v33.x, v33.y, v34.x, v34.y, v35.x, v35.y);
        if (v17)
        {
          v27 = (const __CFNumber *)MRCDescriptorCopyAttribute();
          v28 = v27;
          if (v27)
          {
            valuePtr = 0;
            CFNumberGetValue(v27, kCFNumberFloatType, &valuePtr);
            LODWORD(v29) = valuePtr;
            -[VNObservation setConfidence:](v17, "setConfidence:", v29);
            CFRelease(v28);
          }
          v30 = v17;
        }
        else if (a6)
        {
          +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_30;
      }
    }
    else if (a6)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("barcode location is not available"));
      v17 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

LABEL_31:
      goto LABEL_32;
    }
    v17 = 0;
    goto LABEL_30;
  }
  if (a6)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("barcode type is not available"));
    v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
LABEL_32:

  return v17;
}

- (id)_machineReadableCodesDetectedInImageBuffer:(id)a3 originatingRequestSpecifier:(id)a4 inContext:(id)a5 mrcDetector:(id)a6 error:(id *)a7
{
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  unint64_t v25;
  double v26;
  double v27;
  double height;
  double width;
  id v30;
  __CVBuffer *v31;
  unint64_t v32;
  VNImageRequestHandler *v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  VNRecognizeDocumentElementsRequest *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  VNRecognizeDocumentElementsRequest *v53;
  const void *v54;
  uint64_t DescriptorCount;
  uint64_t v56;
  id v57;
  void *v58;
  BOOL v59;
  int v60;
  void *v62;
  id obj;
  VNRecognizeDocumentElementsRequest *v64;
  void *v65;
  __CVBuffer *texture;
  CFTypeRef cf;
  void *v68;
  void *v69;
  id v70;
  __CVBuffer *pixelBuffer;
  double x;
  double y;
  id v74;
  VNImageRequestHandler *v75;
  id v76;
  id v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  id v83;
  _QWORD v84[5];
  id v85;
  _BYTE v86[128];
  _QWORD v87[3];
  CGRect v88;
  CGRect v89;

  v87[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v78 = a4;
  v77 = a5;
  v76 = a6;
  -[VNDetectBarcodesRequest _createMRCDecoderOptionsForRevision:error:](self, "_createMRCDecoderOptionsForRevision:error:", -[VNRequest revision](self, "revision"), a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = objc_msgSend(v12, "width");
    v15 = objc_msgSend(v12, "height");
    v84[0] = MEMORY[0x1E0C809B0];
    v84[1] = 3221225472;
    v84[2] = __126__VNDetectBarcodesRequest__machineReadableCodesDetectedInImageBuffer_originatingRequestSpecifier_inContext_mrcDetector_error___block_invoke;
    v84[3] = &unk_1E4548D28;
    v84[4] = self;
    if (+[VNValidationUtilities validateNonZeroImageWidth:height:componentNameProvidingBlock:error:](VNValidationUtilities, "validateNonZeroImageWidth:height:componentNameProvidingBlock:error:", v14, v15, v84, a7))
    {
      -[VNImageBasedRequest regionOfInterestPixelRectForWidth:height:](self, "regionOfInterestPixelRectForWidth:height:", v14, v15);
      v19 = v18;
      v21 = v20;
      v22 = v16;
      v23 = v17;
      if (v16 >= v17)
        v24 = v16;
      else
        v24 = v17;
      v25 = -[VNRequest maximumProcessingDimensionOnTheLongSide](self, "maximumProcessingDimensionOnTheLongSide");
      v26 = 1.0;
      if (v25)
      {
        v27 = (double)v25;
        height = v23;
        width = v22;
        x = v19;
        y = v21;
        if (v24 > (double)v25)
        {
          v26 = v27 / v24;
          v88.origin.x = v19 * (v27 / v24);
          v88.origin.y = v21 * v26;
          v88.size.width = v22 * v26;
          v88.size.height = v23 * v26;
          v89 = CGRectIntegral(v88);
          x = v89.origin.x;
          y = v89.origin.y;
          width = v89.size.width;
          height = v89.size.height;
        }
      }
      else
      {
        height = v23;
        width = v22;
        x = v19;
        y = v21;
      }
      v83 = 0;
      v31 = (__CVBuffer *)objc_msgSend(v12, "croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:", (unint64_t)width, (unint64_t)height, 875704422, 0, a7, &v83, v19, v21, v22, v23);
      v74 = v83;
      pixelBuffer = v31;
      if (!v31)
      {
        v30 = 0;
LABEL_52:

        goto LABEL_53;
      }
      objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "addPointer:", v74);
      objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "addPointer:", v12);
      v70 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      CVPixelBufferGetWidth(v31);
      CVPixelBufferGetHeight(v31);
      cf = (CFTypeRef)MRCSampleCreateWithCVPixelBuffer();
      if (!cf)
      {
        if (a7)
        {
          +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", CFSTR("Failed to create MRCSample"));
          v30 = 0;
          *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_51:

          CVPixelBufferRelease(pixelBuffer);
          goto LABEL_52;
        }
LABEL_49:
        v30 = 0;
        goto LABEL_51;
      }
      objc_msgSend(v77, "session");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0x1E0C99000;
      if (-[VNDetectBarcodesRequest useSegmentationPregating](self, "useSegmentationPregating")
        && !-[VNDetectBarcodesRequest useMLDetector](self, "useMLDetector"))
      {
        v33 = [VNImageRequestHandler alloc];
        v75 = -[VNImageRequestHandler initWithCVPixelBuffer:options:session:](v33, "initWithCVPixelBuffer:options:session:", pixelBuffer, MEMORY[0x1E0C9AA70], v65);
        v64 = objc_alloc_init(VNRecognizeDocumentElementsRequest);
        -[VNImageBasedRequest applyConfigurationOfRequest:](v64, "applyConfigurationOfRequest:", self);
        -[VNRequest setRevision:](v64, "setRevision:", 1);
        -[VNRecognizeDocumentElementsRequest machineReadableCodeElements](v64, "machineReadableCodeElements");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setRecognize:", 1);

        -[VNRecognizeDocumentElementsRequest machineReadableCodeElements](v64, "machineReadableCodeElements");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setGenerateSegmentationMask:", 1);

        v87[0] = v64;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = -[VNImageRequestHandler performRequests:error:](v75, "performRequests:error:", v36, 0);

        if (v37)
        {
          -[VNRequest results](v64, "results");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "firstObject");
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v62, "segmentationMask");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          texture = CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v39, "pixelBuffer"));

          v81 = 0u;
          v82 = 0u;
          v79 = 0u;
          v80 = 0u;
          objc_msgSend(v62, "labels");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v79, v86, 16);
          if (v41)
          {
            v42 = *(_QWORD *)v80;
            obj = v40;
            while (2)
            {
              for (i = 0; i != v41; ++i)
              {
                if (*(_QWORD *)v80 != v42)
                  objc_enumerationMutation(obj);
                v44 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
                objc_msgSend(v44, "identifier");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v45, "isEqualToString:", CFSTR("VNRecognizeDocumentElementIdentifierAppCode")))
                {

LABEL_32:
                  goto LABEL_33;
                }
                objc_msgSend(v44, "identifier");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = objc_msgSend(v46, "isEqualToString:", CFSTR("VNRecognizeDocumentElementIdentifierQRCode"));

                if ((v47 & 1) != 0)
                  goto LABEL_32;
              }
              v40 = obj;
              v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v86, 16);
              if (v41)
                continue;
              break;
            }
          }

          v48 = v64;
          goto LABEL_46;
        }
        texture = 0;
LABEL_33:

        v32 = 0x1E0C99000uLL;
      }
      else
      {
        texture = 0;
      }
      v75 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](self, "newDefaultDetectorOptionsForRequestRevision:session:", -[VNRequest resolvedRevision](self, "resolvedRevision"), v65);
      v85 = v12;
      objc_msgSend(*(id *)(v32 + 3360), "arrayWithObjects:count:", &v85, 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNImageRequestHandler setObject:forKeyedSubscript:](v75, "setObject:forKeyedSubscript:", v49, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

      -[VNImageRequestHandler setObject:forKeyedSubscript:](v75, "setObject:forKeyedSubscript:", v13, CFSTR("VNMRCDetectorProcessOption_MRCDecoderOptions"));
      -[VNImageRequestHandler setObject:forKeyedSubscript:](v75, "setObject:forKeyedSubscript:", cf, CFSTR("VNMRCDetectorProcessOption_MRCSample"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNDetectBarcodesRequest useMLDetector](self, "useMLDetector"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNImageRequestHandler setObject:forKeyedSubscript:](v75, "setObject:forKeyedSubscript:", v50, CFSTR("VNMRCDetectorProcessOption_UseMLBasedDetector"));

      if (texture)
        -[VNImageRequestHandler setObject:forKeyedSubscript:](v75, "setObject:forKeyedSubscript:", texture, CFSTR("VNMRCDetectorProcessOption_SegmentationMask"));
      if (v26 != 1.0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNImageRequestHandler setObject:forKeyedSubscript:](v75, "setObject:forKeyedSubscript:", v51, CFSTR("VNMRCDetectorProcessOption_MaxDimensionSideScale"));

      }
      v52 = objc_msgSend(v77, "qosClass");
      -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
      objc_msgSend(v76, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v52, v75, self, a7, 0);
      v53 = (VNRecognizeDocumentElementsRequest *)objc_claimAutoreleasedReturnValue();
      v48 = v53;
      if (v53 && -[VNRecognizeDocumentElementsRequest count](v53, "count"))
      {
        -[VNRecognizeDocumentElementsRequest objectAtIndexedSubscript:](v48, "objectAtIndexedSubscript:", 0);
        v54 = (const void *)objc_claimAutoreleasedReturnValue();

        if (v54)
        {
          DescriptorCount = MRCDecoderResultGetDescriptorCount();
          if (DescriptorCount < 1)
          {
LABEL_45:
            v60 = 0;
            v59 = 1;
          }
          else
          {
            v56 = 0;
            while (1)
            {
              v57 = -[VNDetectBarcodesRequest newBarcodeObservationForMRCDescriptor:roiCroppingPixelRect:originatingRequestSpecifier:error:](self, "newBarcodeObservationForMRCDescriptor:roiCroppingPixelRect:originatingRequestSpecifier:error:", MRCDecoderResultGetDescriptorAtIndex(), v78, a7, x, y, width, height);
              v58 = v57;
              v59 = v57 != 0;
              if (!v57)
                break;
              objc_msgSend(v57, "setRequestImageBuffers:", v68);
              objc_msgSend(v58, "setRequestImageBuffersCacheKeys:", v69);
              objc_msgSend(v70, "addObject:", v58);

              if (DescriptorCount == ++v56)
                goto LABEL_45;
            }
            v60 = 1;
          }
          CFRelease(v54);
          if (!v59)
          {
LABEL_48:

            CVPixelBufferRelease(texture);
            CFRelease(cf);
            if (!v60)
            {
              v30 = v70;
              goto LABEL_51;
            }
            goto LABEL_49;
          }
        }
LABEL_47:
        v60 = 0;
        goto LABEL_48;
      }
LABEL_46:

      goto LABEL_47;
    }
  }
  v30 = 0;
LABEL_53:

  return v30;
}

- (BOOL)_getCornerPointsFromCodeLocationPoints:(id)a3 bottomLeft:(CGPoint *)a4 topLeft:(CGPoint *)a5 topRight:(CGPoint *)a6 bottomRight:(CGPoint *)a7
{
  id v11;
  void *v12;
  const __CFDictionary *v13;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  const __CFDictionary *v16;
  BOOL v17;

  v11 = a3;
  v12 = v11;
  if (v11 && objc_msgSend(v11, "count") == 4)
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (CGPointMakeWithDictionaryRepresentation(v13, a4))
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
      v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      if (CGPointMakeWithDictionaryRepresentation(v14, a5))
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
        v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        if (CGPointMakeWithDictionaryRepresentation(v15, a6))
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", 3);
          v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          v17 = CGPointMakeWithDictionaryRepresentation(v16, a7);

        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)newBarcodeObservationForACBSBarcodeInfo:(id)a3 imageWidth:(unint64_t)a4 imageHeight:(unint64_t)a5 roiCroppingPixelRect:(CGRect)a6 originatingRequestSpecifier:(id)a7 error:(id *)a8
{
  double height;
  double y;
  double x;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSString *v20;
  SEL v21;
  void *v22;
  void *v23;
  VNBarcodeObservation *v24;
  void *v25;
  BOOL v26;
  VNBarcodeObservation *v27;
  void *v28;
  void *v29;
  VNBarcodeObservation *v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;

  height = a6.size.height;
  y = a6.origin.y;
  x = a6.origin.x;
  v16 = a3;
  v17 = a7;
  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D834B0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    +[VNDetectBarcodesRequest barcodeSymbologyForACBSBarcodeType:](VNDetectBarcodesRequest, "barcodeSymbologyForACBSBarcodeType:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      if (a8)
      {
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unknown barcode type of '%@'"), v18);
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v31);
        *a8 = (id)objc_claimAutoreleasedReturnValue();

      }
      v24 = 0;
      goto LABEL_27;
    }
    v20 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("_new%@DescriptorForACBSBarcodeInfo:"), v19);
    v21 = NSSelectorFromString(v20);
    if (v21 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v22 = (void *)((uint64_t (*)(VNDetectBarcodesRequest *, SEL, id))-[VNDetectBarcodesRequest methodForSelector:](self, "methodForSelector:", v21))(self, v21, v16);
      if (v22)
      {
LABEL_11:

        v35 = *MEMORY[0x1E0C9D538];
        v36 = v35;
        v33 = v35;
        v34 = v35;
        objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D83498]);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[VNDetectBarcodesRequest _getCornerPointsFromCodeLocationPoints:bottomLeft:topLeft:topRight:bottomRight:](self, "_getCornerPointsFromCodeLocationPoints:bottomLeft:topLeft:topRight:bottomRight:", v25, &v36, &v35, &v34, &v33);

        if (v26)
        {
          *(double *)&v36 = (x + *(double *)&v36) / (double)a4;
          *((double *)&v36 + 1) = (y + height - *((double *)&v36 + 1)) / (double)a5;
          *(double *)&v35 = (x + *(double *)&v35) / (double)a4;
          *((double *)&v35 + 1) = (y + height - *((double *)&v35 + 1)) / (double)a5;
          *(double *)&v34 = (x + *(double *)&v34) / (double)a4;
          *((double *)&v34 + 1) = (y + height - *((double *)&v34 + 1)) / (double)a5;
          *(double *)&v33 = (x + *(double *)&v33) / (double)a4;
          *((double *)&v33 + 1) = (y + height - *((double *)&v33 + 1)) / (double)a5;
          v27 = [VNBarcodeObservation alloc];
          v24 = -[VNBarcodeObservation initWithOriginatingRequestSpecifier:symbology:descriptor:topLeft:topRight:bottomRight:bottomLeft:](v27, "initWithOriginatingRequestSpecifier:symbology:descriptor:topLeft:topRight:bottomRight:bottomLeft:", v17, v19, v22, v36, v33, v34, v35);
          if (v24)
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D834B8]);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v28;
            if (v28)
            {
              objc_msgSend(v28, "floatValue");
              -[VNObservation setConfidence:](v24, "setConfidence:");
            }
            -[VNBarcodeObservation setACBSBarcodeInfo:](v24, "setACBSBarcodeInfo:", v16);
            v30 = v24;

          }
          else if (a8)
          {
            +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
            *a8 = (id)objc_claimAutoreleasedReturnValue();
          }

        }
        else if (a8)
        {
          +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("barcode location is not available"));
          v24 = 0;
          *a8 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v24 = 0;
        }

LABEL_27:
        goto LABEL_28;
      }
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unable to create a barcode descriptor for %@"), v19);
      -[VNRequest recordWarning:value:](self, "recordWarning:value:", CFSTR("VNDetectBarcodesRequest"), v23);
    }
    else
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("creation of a barcode descriptor for %@ is not supported"), v19);
      -[VNRequest recordWarning:value:](self, "recordWarning:value:", CFSTR("VNDetectBarcodesRequest"), v23);
    }

    v22 = 0;
    goto LABEL_11;
  }
  if (a8)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("barcode type is not available"));
    v24 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }
LABEL_28:

  return v24;
}

- (id)_barcodesDetectedInImageBuffer:(id)a3 usingACBSConfig:(ACBSConfig *)a4 originatingRequestSpecifier:(id)a5 error:(id *)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __CVBuffer *v20;
  int v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  id v31;
  void *v32;
  id obj;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  _QWORD v45[5];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v39 = a5;
  v10 = objc_msgSend(v9, "width");
  v11 = objc_msgSend(v9, "height");
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __108__VNDetectBarcodesRequest__barcodesDetectedInImageBuffer_usingACBSConfig_originatingRequestSpecifier_error___block_invoke;
  v45[3] = &unk_1E4548D28;
  v45[4] = self;
  if (+[VNValidationUtilities validateNonZeroImageWidth:height:componentNameProvidingBlock:error:](VNValidationUtilities, "validateNonZeroImageWidth:height:componentNameProvidingBlock:error:", v10, v11, v45, a6))
  {
    -[VNImageBasedRequest regionOfInterestPixelRectForWidth:height:](self, "regionOfInterestPixelRectForWidth:height:", v10, v11);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v44 = 0;
    v20 = (__CVBuffer *)objc_msgSend(v9, "croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:", (unint64_t)v16, (unint64_t)v18, 875704422, 0, a6, &v44);
    v36 = v44;
    if (!v20)
    {
LABEL_28:

      goto LABEL_29;
    }
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addPointer:", v36);
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addPointer:", v9);
    objc_msgSend(v9, "orientation");
    v35 = (void *)ACBSCreateFrameInfoBySearchingForBarcodesInCVPixelBuffer();
    if (v35)
    {
      v21 = 1;
    }
    else if (a6)
    {
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 9, CFSTR("failed to analyze image"));
      v35 = 0;
      v21 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = 0;
      v21 = 0;
    }
    CVPixelBufferRelease(v20);
    if (!v21)
    {
      v20 = 0;
LABEL_27:

      goto LABEL_28;
    }
    v22 = *MEMORY[0x1E0D83488];
    objc_msgSend(v35, "objectForKeyedSubscript:", *MEMORY[0x1E0D83488]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "integerValue");

    if (v24)
    {
      objc_msgSend(v35, "objectForKeyedSubscript:", v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNRequest recordWarning:value:](self, "recordWarning:value:", v22, v25);
    }
    else
    {
      objc_msgSend(v35, "objectForKeyedSubscript:", *MEMORY[0x1E0D83490]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "count");
      if (v26)
      {
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v26);
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        obj = v25;
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
        if (v28)
        {
          v29 = *(_QWORD *)v41;
          while (2)
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v41 != v29)
                objc_enumerationMutation(obj);
              v31 = -[VNDetectBarcodesRequest newBarcodeObservationForACBSBarcodeInfo:imageWidth:imageHeight:roiCroppingPixelRect:originatingRequestSpecifier:error:](self, "newBarcodeObservationForACBSBarcodeInfo:imageWidth:imageHeight:roiCroppingPixelRect:originatingRequestSpecifier:error:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i), v10, v11, v39, a6, v13, v15, v17, v19);
              v32 = v31;
              if (!v31)
              {

                v20 = 0;
                goto LABEL_25;
              }
              objc_msgSend(v31, "setRequestImageBuffers:", v38);
              objc_msgSend(v32, "setRequestImageBuffersCacheKeys:", v37);
              objc_msgSend(v27, "addObject:", v32);

            }
            v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
            if (v28)
              continue;
            break;
          }
        }

        v20 = v27;
LABEL_25:

        v25 = obj;
        goto LABEL_26;
      }
    }
    v20 = (__CVBuffer *)MEMORY[0x1E0C9AA60];
LABEL_26:

    goto LABEL_27;
  }
  v20 = 0;
LABEL_29:

  return v20;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3 - 2 < 3 || a3 - 3737841664u < 3)
  {
    v4 = CFSTR("VNMRCDetectorType");
LABEL_4:
    v5 = v4;
    return v4;
  }
  if (a3 == 1)
  {
    v4 = &stru_1E4549388;
    goto LABEL_4;
  }
  if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    v4 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  BOOL v17;
  ACBSConfig *v19;

  v8 = a4;
  objc_msgSend(v8, "imageBufferAndReturnError:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    && -[VNRequest validateImageBuffer:ofNonZeroWidth:andHeight:error:](self, "validateImageBuffer:ofNonZeroWidth:andHeight:error:", v9, 0, 0, a5))
  {
    +[VNRequestSpecifier specifierForRequestClass:revision:error:](VNRequestSpecifier, "specifierForRequestClass:revision:error:", objc_opt_class(), a3, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v17 = 0;
LABEL_19:

      goto LABEL_20;
    }
    if (a3 - 2 >= 3 && a3 - 3737841664u >= 3)
    {
      if (a3 == 1)
      {
        v19 = -[VNDetectBarcodesRequest _createACBSConfigAndReturnError:](self, "_createACBSConfigAndReturnError:", a5);
        if (v19)
        {
          -[VNDetectBarcodesRequest _barcodesDetectedInImageBuffer:usingACBSConfig:originatingRequestSpecifier:error:](self, "_barcodesDetectedInImageBuffer:usingACBSConfig:originatingRequestSpecifier:error:", v9, v19, v10, a5);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          ACBSConfigFree();
          if (v14)
          {
LABEL_11:
            v15 = &__block_literal_global_86_33184;
            objc_msgSend(v14, "sortedArrayWithOptions:usingComparator:", 16, &__block_literal_global_86_33184);
            v16 = objc_claimAutoreleasedReturnValue();

            v14 = (void *)v16;
LABEL_12:
            -[VNRequest setResults:](self, "setResults:", v14);
            v17 = 1;
LABEL_18:

            goto LABEL_19;
          }
LABEL_17:
          v17 = 0;
          goto LABEL_18;
        }
      }
      else if (a5)
      {
        +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", a3, self);
        v14 = 0;
        v17 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
    }
    else
    {
      objc_msgSend(v8, "session");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](self, "newDefaultDetectorOptionsForRequestRevision:session:", a3, v11);
      objc_msgSend(v11, "detectorOfType:configuredWithOptions:error:", CFSTR("VNMRCDetectorType"), v12, a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[VNDetectBarcodesRequest _machineReadableCodesDetectedInImageBuffer:originatingRequestSpecifier:inContext:mrcDetector:error:](self, "_machineReadableCodesDetectedInImageBuffer:originatingRequestSpecifier:inContext:mrcDetector:error:", v9, v10, v8, v13, a5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          if (a3 - 3737841664u >= 3 && a3 - 2 > 2
            || +[VisionCoreRuntimeUtilities linkTimeOrRunTimeAtLeastVersion:](VNRuntimeUtilities, "linkTimeOrRunTimeAtLeastVersion:", 393216))
          {
            goto LABEL_12;
          }
          goto LABEL_11;
        }
        goto LABEL_17;
      }

    }
    v14 = 0;
    goto LABEL_17;
  }
  v17 = 0;
LABEL_20:

  return v17;
}

- (id)availableLocateModesAndReturnError:(id *)a3
{
  NSUInteger v5;
  void *v7;
  id v9;

  v5 = -[VNRequest revision](self, "revision");
  if (v5 - 2 >= 3 && v5 - 3737841664u >= 3)
  {
    if (v5 == 1)
    {
      +[VNDetectBarcodesRequest availableLocateModesRev1](VNDetectBarcodesRequest, "availableLocateModesRev1");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (a3)
    {
      +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", -[VNRequest revision](self, "revision"), self);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v7 = 0;
      *a3 = v9;
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    +[VNDetectBarcodesRequest availableLocateModesRev2](VNDetectBarcodesRequest, "availableLocateModesRev2");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (NSArray)symbologies
{
  void *v2;
  void *v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "symbologies");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)supportedSymbologiesAndReturnError:(NSError *)error
{
  uint64_t v5;
  void *v6;
  NSError *v7;

  v5 = -[VNRequest revision](self, "revision");
  if (v5 > 3737841663)
  {
    switch(v5)
    {
      case 3737841664:
        +[VNDetectBarcodesRequest supportedSymbologiesRev2Private](VNDetectBarcodesRequest, "supportedSymbologiesRev2Private");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 3737841665:
        +[VNDetectBarcodesRequest supportedSymbologiesRev3Private](VNDetectBarcodesRequest, "supportedSymbologiesRev3Private");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 3737841666:
        +[VNDetectBarcodesRequest supportedSymbologiesRev4Private](VNDetectBarcodesRequest, "supportedSymbologiesRev4Private");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
LABEL_13:
        if (error)
        {
          +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", -[VNRequest revision](self, "revision"), self);
          v7 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
          v6 = 0;
          *error = v7;
        }
        else
        {
          v6 = 0;
        }
        break;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        +[VNDetectBarcodesRequest supportedSymbologiesRev1](VNDetectBarcodesRequest, "supportedSymbologiesRev1");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 2:
        +[VNDetectBarcodesRequest supportedSymbologiesRev2](VNDetectBarcodesRequest, "supportedSymbologiesRev2");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 3:
        +[VNDetectBarcodesRequest supportedSymbologiesRev3](VNDetectBarcodesRequest, "supportedSymbologiesRev3");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 4:
        +[VNDetectBarcodesRequest supportedSymbologiesRev4](VNDetectBarcodesRequest, "supportedSymbologiesRev4");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        goto LABEL_13;
    }
  }
  return (NSArray *)v6;
}

- (void)setSymbologies:(NSArray *)symbologies
{
  void *v4;
  NSArray *v5;

  v5 = symbologies;
  if (-[NSArray count](v5, "count"))
  {
    -[VNRequest configuration](self, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSymbologies:", v5);

  }
}

- (NSString)locateMode
{
  void *v2;
  void *v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locateMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setLocateMode:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocateMode:", v5);

}

- (BOOL)stopAtFirstPyramidWith2DCode
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "stopAtFirstPyramidWith2DCode");

  return v3;
}

- (void)setStopAtFirstPyramidWith2DCode:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStopAtFirstPyramidWith2DCode:", v3);

}

- (BOOL)useMLDetector
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useMLDetector");

  return v3;
}

- (void)setUseMLDetector:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseMLDetector:", v3);

}

- (BOOL)coalesceCompositeSymbologies
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "coalesceCompositeSymbologies");

  return v3;
}

- (void)setCoalesceCompositeSymbologies:(BOOL)coalesceCompositeSymbologies
{
  _BOOL8 v3;
  id v4;

  v3 = coalesceCompositeSymbologies;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCoalesceCompositeSymbologies:", v3);

}

- (id)supportedComputeStageDevicesAndReturnError:(id *)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  __CFString *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = -[VNRequest resolvedRevision](self, "resolvedRevision");
  if (v5 <= 3737841663)
  {
    if ((unint64_t)(v5 - 1) >= 2)
    {
      if ((unint64_t)(v5 - 3) >= 2)
        goto LABEL_11;
LABEL_6:
      -[VNDetectBarcodesRequest _createMRCDecoderOptionsForRevision:error:](self, "_createMRCDecoderOptionsForRevision:error:", v5, a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = MRCContextCopySupportedComputeDevicesForDecoderUsingOptions();
        v8 = (void *)v7;
        if (v7)
        {
          v16 = CFSTR("VNComputeStageMain");
          v17 = v7;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
          return v9;
        }
        if (a3)
        {
          v13 = objc_alloc(MEMORY[0x1E0CB3940]);
          v14 = (__CFString *)CFErrorCopyDescription(0);
          v15 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("No compute devices found: %@"), v14);

          +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v15);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

        }
        CFRelease(0);
      }
      v9 = 0;
      goto LABEL_18;
    }
    goto LABEL_10;
  }
  if ((unint64_t)(v5 - 3737841665) < 2)
    goto LABEL_6;
  if (v5 == 3737841664)
  {
LABEL_10:
    v18 = CFSTR("VNComputeStageMain");
    +[VNComputeDeviceUtilities allCPUComputeDevices](VNComputeDeviceUtilities, "allCPUComputeDevices", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    return v11;
  }
LABEL_11:
  if (a3)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", v5, self);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  objc_super v15;

  v4 = a3;
  -[VNDetectBarcodesRequest locateMode](self, "locateMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locateMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
    goto LABEL_7;
  v7 = -[VNDetectBarcodesRequest stopAtFirstPyramidWith2DCode](self, "stopAtFirstPyramidWith2DCode");
  if (v7 != objc_msgSend(v4, "stopAtFirstPyramidWith2DCode"))
    goto LABEL_7;
  v8 = -[VNDetectBarcodesRequest useMLDetector](self, "useMLDetector");
  if (v8 != objc_msgSend(v4, "useMLDetector"))
    goto LABEL_7;
  v9 = -[VNDetectBarcodesRequest coalesceCompositeSymbologies](self, "coalesceCompositeSymbologies");
  if (v9 != objc_msgSend(v4, "coalesceCompositeSymbologies"))
    goto LABEL_7;
  -[VNDetectBarcodesRequest symbologies](self, "symbologies");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "symbologies");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = VisionCoreEquivalentOrNilUnorderedArrays();

  if ((v12 & 1) != 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)VNDetectBarcodesRequest;
    v13 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v15, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
LABEL_7:
    v13 = 0;
  }

  return v13;
}

- (BOOL)warmUpSession:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VNDetectBarcodesRequest;
  if (-[VNRequest warmUpSession:error:](&v16, sel_warmUpSession_error_, v6, a4))
  {
    v7 = -[VNRequest resolvedRevision](self, "resolvedRevision");
    -[VNDetectBarcodesRequest applicableDetectorTypeForRevision:error:](self, "applicableDetectorTypeForRevision:error:", v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if ((objc_msgSend(v8, "isEqualToString:", &stru_1E4549388) & 1) != 0)
      {
LABEL_6:
        v14 = 1;
LABEL_10:

        goto LABEL_11;
      }
      v10 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](self, "newDefaultDetectorOptionsForRequestRevision:session:", v7, v6);
      objc_msgSend(v6, "detectorOfType:configuredWithOptions:error:", v9, v10, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = objc_msgSend(v11, "warmUpSession:withOptions:error:", v6, v10, a4);

        if ((v13 & 1) != 0)
          goto LABEL_6;
      }
      else
      {

      }
    }
    v14 = 0;
    goto LABEL_10;
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  VNDetectBarcodesRequest *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = (VNDetectBarcodesRequest *)a3;
  if (self != v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)VNDetectBarcodesRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v7, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VNDetectBarcodesRequest symbologies](v4, "symbologies");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNDetectBarcodesRequest setSymbologies:](self, "setSymbologies:", v5);

      -[VNDetectBarcodesRequest locateMode](v4, "locateMode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNDetectBarcodesRequest setLocateMode:](self, "setLocateMode:", v6);

      -[VNDetectBarcodesRequest setStopAtFirstPyramidWith2DCode:](self, "setStopAtFirstPyramidWith2DCode:", -[VNDetectBarcodesRequest stopAtFirstPyramidWith2DCode](v4, "stopAtFirstPyramidWith2DCode"));
      -[VNDetectBarcodesRequest setUseMLDetector:](self, "setUseMLDetector:", -[VNDetectBarcodesRequest useMLDetector](v4, "useMLDetector"));
    }
  }

}

- (void)resolvedRevisionDidChangeFromRevision:(unint64_t)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNDetectBarcodesRequest;
  -[VNRequest resolvedRevisionDidChangeFromRevision:](&v5, sel_resolvedRevisionDidChangeFromRevision_, a3);
  -[VNRequest configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultSymbologiesForRevision:", -[VNRequest resolvedRevision](self, "resolvedRevision"));

}

- (BOOL)useSegmentationPregating
{
  return self->_useSegmentationPregating;
}

- (void)setUseSegmentationPregating:(BOOL)a3
{
  self->_useSegmentationPregating = a3;
}

NSString *__108__VNDetectBarcodesRequest__barcodesDetectedInImageBuffer_usingACBSConfig_originatingRequestSpecifier_error___block_invoke()
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

NSString *__126__VNDetectBarcodesRequest__machineReadableCodesDetectedInImageBuffer_originatingRequestSpecifier_inContext_mrcDetector_error___block_invoke()
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

void __41__VNDetectBarcodesRequest__MRCLocateMode__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 1282, 10);
  v1 = (void *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable;
  -[VNDetectBarcodesRequest _MRCLocateMode]::mapTable = v0;

  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterOneVertical"), (const void *)2);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterOneVerticalThick"), (const void *)3);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterThreeVertical"), (const void *)4);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterThreeVerticalCrossed"), (const void *)5);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterOneHorizontal"), (const void *)6);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterOneHorizontalThick"), (const void *)7);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterThreeHorizontal"), (const void *)8);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterThreeHorizontalCrossed"), (const void *)9);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterOneEachDirection"), (const void *)0xA);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterThreeEachDirection"), (const void *)0xB);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterFiveEachDirection"), (const void *)0xC);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterThreeEachDirectionAndCoverageAndDiagonals"), (const void *)0xD);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterThreeVerticalAndCoverageAndDiagonals"), (const void *)0xE);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterThreeHorizontalAndCoverageAndDiagonals"), (const void *)0xF);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeRegularIntervalHorizontal"), (const void *)0x11);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeRegularIntervalVertical"), (const void *)0x12);
}

void __57__VNDetectBarcodesRequest__ACBarcodeRecognizerLocateMode__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 1282, 10);
  v1 = (void *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable;
  -[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable = v0;

  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterOneVertical"), (const void *)2);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterOneVerticalThick"), (const void *)3);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterThreeVertical"), (const void *)4);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterThreeVerticalCrossed"), (const void *)5);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterOneHorizontal"), (const void *)6);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterOneHorizontalThick"), (const void *)7);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterThreeHorizontal"), (const void *)8);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterThreeHorizontalCrossed"), (const void *)9);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterOneEachDirection"), (const void *)0xA);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterThreeEachDirection"), (const void *)0xB);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterFiveEachDirection"), (const void *)0xC);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterThreeEachDirectionAndCoverageAndDiagonals"), (const void *)0xD);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterThreeVerticalAndCoverageAndDiagonals"), (const void *)0xE);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeCenterThreeHorizontalAndCoverageAndDiagonals"), (const void *)0xF);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeFastSearch"), (const void *)0x10);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeRegularIntervalHorizontal"), (const void *)0x11);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, CFSTR("VNDetectBarcodesLocateModeRegularIntervalVertical"), (const void *)0x12);
}

+ (id)privateRevisionsSet
{
  if (+[VNDetectBarcodesRequest privateRevisionsSet]::onceToken != -1)
    dispatch_once(&+[VNDetectBarcodesRequest privateRevisionsSet]::onceToken, &__block_literal_global_11243);
  return (id)+[VNDetectBarcodesRequest privateRevisionsSet]::ourPrivateRevisions;
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  if (a3 - 3737841664u > 2)
    return 0;
  else
    return off_1E4545348[a3 - 3737841664u];
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)ACBSBarcodeTypeForBarcodeSymbology:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (v3)
  {
    +[VNDetectBarcodesRequest _ourBarcodeSymbologyToACBSBarcodeTypeMap](VNDetectBarcodesRequest, "_ourBarcodeSymbologyToACBSBarcodeTypeMap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)barcodeSymbologyForACBSBarcodeType:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (v3)
  {
    +[VNDetectBarcodesRequest _ourACBSBarcodeTypeToBarcodeSymbologyMap](VNDetectBarcodesRequest, "_ourACBSBarcodeTypeToBarcodeSymbologyMap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (__CFString)MRCSymbologyForBarcodeSymbology:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;

  v3 = a3;
  if (v3)
  {
    +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4Private](VNDetectBarcodesRequest, "_ourBarcodeSymbologyToMRCSymbologyMapRev4Private");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)barcodeSymbologyForMRCSymbology:(__CFString *)a3
{
  void *v3;
  void *v4;

  v3 = a3;
  if (a3)
  {
    +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4Private](VNDetectBarcodesRequest, "_ourMRCSymbologyToBarcodeSymbologyMapRev4Private");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (id)_ourACBSBarcodeTypeToBarcodeSymbologyMap
{
  if (+[VNDetectBarcodesRequest _ourACBSBarcodeTypeToBarcodeSymbologyMap]::onceToken != -1)
    dispatch_once(&+[VNDetectBarcodesRequest _ourACBSBarcodeTypeToBarcodeSymbologyMap]::onceToken, &__block_literal_global_25_11235);
  return (id)+[VNDetectBarcodesRequest _ourACBSBarcodeTypeToBarcodeSymbologyMap]::ourACBSBarcodeTypeToBarcodeSymbologyMap;
}

+ (id)_ourBarcodeSymbologyToACBSBarcodeTypeMap
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD block[4];
  void *v12;

  v2 = (void *)MEMORY[0x1E0C99E08];
  +[VNDetectBarcodesRequest _ourACBSBarcodeTypeToBarcodeSymbologyMap](VNDetectBarcodesRequest, "_ourACBSBarcodeTypeToBarcodeSymbologyMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__VNDetectBarcodesRequest__ourBarcodeSymbologyToACBSBarcodeTypeMap__block_invoke;
  block[3] = &unk_1E45455C8;
  v12 = v4;
  v5 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToACBSBarcodeTypeMap]::onceToken;
  v6 = v4;
  v7 = v6;
  if (v5 == -1)
  {
    v8 = v6;
  }
  else
  {
    dispatch_once(&+[VNDetectBarcodesRequest _ourBarcodeSymbologyToACBSBarcodeTypeMap]::onceToken, block);
    v8 = v12;
  }
  v9 = (id)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToACBSBarcodeTypeMap]::ourBarcodeSymbologyToACBSBarcodeTypeMap;

  return v9;
}

+ (id)_allBarcodeSymbologiesRev1
{
  if (+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev1]::onceToken != -1)
    dispatch_once(&+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev1]::onceToken, &__block_literal_global_29_11234);
  return (id)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev1]::_allBarcodeSymbologiesRev1;
}

+ (id)supportedSymbologiesRev1
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v12;

  +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev1](VNDetectBarcodesRequest, "_allBarcodeSymbologiesRev1");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v2;
  if (v2)
  {
    v10 = v2;
  }
  else
  {
    VNValidatedLog(4, (uint64_t)CFSTR("Unable to obtain the supported barcode symbologies"), v3, v4, v5, v6, v7, v8, v12);
    v10 = (id)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

+ (id)_ourMRCSymbologyToBarcodeSymbologyMap
{
  if (+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMap]::onceToken != -1)
    dispatch_once(&+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMap]::onceToken, &__block_literal_global_32);
  return (id)+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMap]::ourMRCSymbologyToBarcodeSymbologyMap;
}

+ (id)_ourBarcodeSymbologyToMRCSymbologyMap
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD block[4];
  void *v12;

  v2 = (void *)MEMORY[0x1E0C99E08];
  +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMap](VNDetectBarcodesRequest, "_ourMRCSymbologyToBarcodeSymbologyMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMap__block_invoke;
  block[3] = &unk_1E45455C8;
  v12 = v4;
  v5 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMap]::onceToken;
  v6 = v4;
  v7 = v6;
  if (v5 == -1)
  {
    v8 = v6;
  }
  else
  {
    dispatch_once(&+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMap]::onceToken, block);
    v8 = v12;
  }
  v9 = (id)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMap]::ourBarcodeSymbologyToMRCSymbologyMap;

  return v9;
}

+ (id)_allBarcodeSymbologiesRev2
{
  if (+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2]::onceToken != -1)
    dispatch_once(&+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2]::onceToken, &__block_literal_global_33);
  return (id)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2]::_allBarcodeSymbologiesRev2;
}

+ (id)supportedSymbologiesRev2
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v12;

  +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2](VNDetectBarcodesRequest, "_allBarcodeSymbologiesRev2");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v2;
  if (v2)
  {
    v10 = v2;
  }
  else
  {
    VNValidatedLog(4, (uint64_t)CFSTR("Unable to obtain the supported barcode symbologies"), v3, v4, v5, v6, v7, v8, v12);
    v10 = (id)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

+ (id)_ourMRCSymbologyToBarcodeSymbologyMapPrivate
{
  if (+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapPrivate]::onceToken != -1)
    dispatch_once(&+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapPrivate]::onceToken, &__block_literal_global_34);
  return (id)+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapPrivate]::ourMRCSymbologyToBarcodeSymbologyMapPrivate;
}

+ (id)_ourBarcodeSymbologyToMRCSymbologyMapPrivate
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD block[4];
  void *v12;

  v2 = (void *)MEMORY[0x1E0C99E08];
  +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapPrivate](VNDetectBarcodesRequest, "_ourMRCSymbologyToBarcodeSymbologyMapPrivate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapPrivate__block_invoke;
  block[3] = &unk_1E45455C8;
  v12 = v4;
  v5 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapPrivate]::onceToken;
  v6 = v4;
  v7 = v6;
  if (v5 == -1)
  {
    v8 = v6;
  }
  else
  {
    dispatch_once(&+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapPrivate]::onceToken, block);
    v8 = v12;
  }
  v9 = (id)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapPrivate]::ourBarcodeSymbologyToMRCSymbologyMapPrivate;

  return v9;
}

+ (id)_allBarcodeSymbologiesRev2Private
{
  if (+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2Private]::onceToken != -1)
    dispatch_once(&+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2Private]::onceToken, &__block_literal_global_35);
  return (id)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2Private]::_allBarcodeSymbologiesRev2Private;
}

+ (id)supportedSymbologiesRev2Private
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v12;

  +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2Private](VNDetectBarcodesRequest, "_allBarcodeSymbologiesRev2Private");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v2;
  if (v2)
  {
    v10 = v2;
  }
  else
  {
    VNValidatedLog(4, (uint64_t)CFSTR("Unable to obtain the supported barcode symbologies"), v3, v4, v5, v6, v7, v8, v12);
    v10 = (id)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

+ (id)_ourMRCSymbologyToBarcodeSymbologyMapRev3
{
  if (+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3]::onceToken != -1)
    dispatch_once(&+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3]::onceToken, &__block_literal_global_36_11233);
  return (id)+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3]::ourMRCSymbologyToBarcodeSymbologyMapRev3;
}

+ (id)_ourBarcodeSymbologyToMRCSymbologyMapRev3
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD block[4];
  void *v12;

  v2 = (void *)MEMORY[0x1E0C99E08];
  +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3](VNDetectBarcodesRequest, "_ourMRCSymbologyToBarcodeSymbologyMapRev3");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev3__block_invoke;
  block[3] = &unk_1E45455C8;
  v12 = v4;
  v5 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3]::onceToken;
  v6 = v4;
  v7 = v6;
  if (v5 == -1)
  {
    v8 = v6;
  }
  else
  {
    dispatch_once(&+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3]::onceToken, block);
    v8 = v12;
  }
  v9 = (id)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3]::ourBarcodeSymbologyToMRCSymbologyMapRevision3;

  return v9;
}

+ (id)_allBarcodeSymbologiesRev3
{
  if (+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3]::onceToken != -1)
    dispatch_once(&+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3]::onceToken, &__block_literal_global_37_11232);
  return (id)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3]::_allBarcodeSymbologiesRev3;
}

+ (id)supportedSymbologiesRev3
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v12;

  +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3](VNDetectBarcodesRequest, "_allBarcodeSymbologiesRev3");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v2;
  if (v2)
  {
    v10 = v2;
  }
  else
  {
    VNValidatedLog(4, (uint64_t)CFSTR("Unable to obtain the supported barcode symbologies"), v3, v4, v5, v6, v7, v8, v12);
    v10 = (id)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

+ (id)_ourMRCSymbologyToBarcodeSymbologyMapRev3Private
{
  if (+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3Private]::onceToken != -1)
    dispatch_once(&+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3Private]::onceToken, &__block_literal_global_38);
  return (id)+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3Private]::ourMRCSymbologyToBarcodeSymbologyMapRev3Private;
}

+ (id)_ourBarcodeSymbologyToMRCSymbologyMapRev3Private
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD block[4];
  void *v12;

  v2 = (void *)MEMORY[0x1E0C99E08];
  +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3Private](VNDetectBarcodesRequest, "_ourMRCSymbologyToBarcodeSymbologyMapRev3Private");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev3Private__block_invoke;
  block[3] = &unk_1E45455C8;
  v12 = v4;
  v5 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3Private]::onceToken;
  v6 = v4;
  v7 = v6;
  if (v5 == -1)
  {
    v8 = v6;
  }
  else
  {
    dispatch_once(&+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3Private]::onceToken, block);
    v8 = v12;
  }
  v9 = (id)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3Private]::ourBarcodeSymbologyToMRCSymbologyMapRevision3Private;

  return v9;
}

+ (id)_allBarcodeSymbologiesRev3Private
{
  if (+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3Private]::onceToken != -1)
    dispatch_once(&+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3Private]::onceToken, &__block_literal_global_39_11231);
  return (id)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3Private]::_allBarcodeSymbologiesRev3;
}

+ (id)supportedSymbologiesRev3Private
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v12;

  +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3Private](VNDetectBarcodesRequest, "_allBarcodeSymbologiesRev3Private");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v2;
  if (v2)
  {
    v10 = v2;
  }
  else
  {
    VNValidatedLog(4, (uint64_t)CFSTR("Unable to obtain the supported barcode symbologies"), v3, v4, v5, v6, v7, v8, v12);
    v10 = (id)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

+ (id)_ourMRCSymbologyToBarcodeSymbologyMapRev4
{
  if (+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4]::onceToken != -1)
    dispatch_once(&+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4]::onceToken, &__block_literal_global_40);
  return (id)+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4]::ourMRCSymbologyToBarcodeSymbologyMapRev4;
}

+ (id)_ourBarcodeSymbologyToMRCSymbologyMapRev4
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD block[4];
  void *v12;

  v2 = (void *)MEMORY[0x1E0C99E08];
  +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4](VNDetectBarcodesRequest, "_ourMRCSymbologyToBarcodeSymbologyMapRev4");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev4__block_invoke;
  block[3] = &unk_1E45455C8;
  v12 = v4;
  v5 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4]::onceToken;
  v6 = v4;
  v7 = v6;
  if (v5 == -1)
  {
    v8 = v6;
  }
  else
  {
    dispatch_once(&+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4]::onceToken, block);
    v8 = v12;
  }
  v9 = (id)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4]::ourBarcodeSymbologyToMRCSymbologyMapRev4;

  return v9;
}

+ (id)_allBarcodeSymbologiesRev4
{
  if (+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4]::onceToken != -1)
    dispatch_once(&+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4]::onceToken, &__block_literal_global_41);
  return (id)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4]::_allBarcodeSymbologiesRev4;
}

+ (id)supportedSymbologiesRev4
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v12;

  +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4](VNDetectBarcodesRequest, "_allBarcodeSymbologiesRev4");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v2;
  if (v2)
  {
    v10 = v2;
  }
  else
  {
    VNValidatedLog(4, (uint64_t)CFSTR("Unable to obtain the supported barcode symbologies"), v3, v4, v5, v6, v7, v8, v12);
    v10 = (id)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

+ (id)_ourMRCSymbologyToBarcodeSymbologyMapRev4Private
{
  if (+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4Private]::onceToken != -1)
    dispatch_once(&+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4Private]::onceToken, &__block_literal_global_42);
  return (id)+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4Private]::ourMRCSymbologyToBarcodeSymbologyMapRev4Private;
}

+ (id)_ourBarcodeSymbologyToMRCSymbologyMapRev4Private
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD block[4];
  void *v12;

  v2 = (void *)MEMORY[0x1E0C99E08];
  +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4Private](VNDetectBarcodesRequest, "_ourMRCSymbologyToBarcodeSymbologyMapRev4Private");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev4Private__block_invoke;
  block[3] = &unk_1E45455C8;
  v12 = v4;
  v5 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4Private]::onceToken;
  v6 = v4;
  v7 = v6;
  if (v5 == -1)
  {
    v8 = v6;
  }
  else
  {
    dispatch_once(&+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4Private]::onceToken, block);
    v8 = v12;
  }
  v9 = (id)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4Private]::ourBarcodeSymbologyToMRCSymbologyMapRev4Private;

  return v9;
}

+ (id)_allBarcodeSymbologiesRev4Private
{
  if (+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4Private]::onceToken != -1)
    dispatch_once(&+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4Private]::onceToken, &__block_literal_global_43);
  return (id)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4Private]::_allBarcodeSymbologiesRev4Private;
}

+ (id)supportedSymbologiesRev4Private
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v12;

  +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4Private](VNDetectBarcodesRequest, "_allBarcodeSymbologiesRev4Private");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v2;
  if (v2)
  {
    v10 = v2;
  }
  else
  {
    VNValidatedLog(4, (uint64_t)CFSTR("Unable to obtain the supported barcode symbologies"), v3, v4, v5, v6, v7, v8, v12);
    v10 = (id)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

+ (NSArray)supportedSymbologies
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v12;

  +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev1](VNDetectBarcodesRequest, "_allBarcodeSymbologiesRev1");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v2;
  if (v2)
  {
    v10 = v2;
  }
  else
  {
    VNValidatedLog(4, (uint64_t)CFSTR("Unable to obtain the supported barcode symbologies"), v3, v4, v5, v6, v7, v8, v12);
    v10 = (id)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v10;
}

+ (id)availableLocateModesRev1
{
  if (+[VNDetectBarcodesRequest availableLocateModesRev1]::onceToken != -1)
    dispatch_once(&+[VNDetectBarcodesRequest availableLocateModesRev1]::onceToken, &__block_literal_global_145);
  return (id)+[VNDetectBarcodesRequest availableLocateModesRev1]::ourAvailableLocateModesRev1;
}

+ (id)availableLocateModesRev2
{
  if (+[VNDetectBarcodesRequest availableLocateModesRev2]::onceToken != -1)
    dispatch_once(&+[VNDetectBarcodesRequest availableLocateModesRev2]::onceToken, &__block_literal_global_146_11227);
  return (id)+[VNDetectBarcodesRequest availableLocateModesRev2]::ourAvailableLocateModesRev2;
}

+ (NSArray)availableLocateModes
{
  NSUInteger v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  uint64_t v12;

  v2 = +[VNRequest defaultRevision](VNDetectBarcodesRequest, "defaultRevision");
  if (v2 - 2 >= 3 && v2 - 3737841664u >= 3)
  {
    if (v2 == 1)
    {
      +[VNDetectBarcodesRequest availableLocateModesRev1](VNDetectBarcodesRequest, "availableLocateModesRev1");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      VNValidatedLog(4, (uint64_t)CFSTR("Unable to obtain the supported barcode symbologies"), v3, v4, v5, v6, v7, v8, v12);
      v10 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    +[VNDetectBarcodesRequest availableLocateModesRev2](VNDetectBarcodesRequest, "availableLocateModesRev2");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)v10;
}

void __51__VNDetectBarcodesRequest_availableLocateModesRev2__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[17];

  v2[16] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("VNDetectBarcodesLocateModeCenterOneVertical");
  v2[1] = CFSTR("VNDetectBarcodesLocateModeCenterOneVerticalThick");
  v2[2] = CFSTR("VNDetectBarcodesLocateModeCenterThreeVertical");
  v2[3] = CFSTR("VNDetectBarcodesLocateModeCenterThreeVerticalCrossed");
  v2[4] = CFSTR("VNDetectBarcodesLocateModeCenterOneHorizontal");
  v2[5] = CFSTR("VNDetectBarcodesLocateModeCenterOneHorizontalThick");
  v2[6] = CFSTR("VNDetectBarcodesLocateModeCenterThreeHorizontal");
  v2[7] = CFSTR("VNDetectBarcodesLocateModeCenterThreeHorizontalCrossed");
  v2[8] = CFSTR("VNDetectBarcodesLocateModeCenterOneEachDirection");
  v2[9] = CFSTR("VNDetectBarcodesLocateModeCenterThreeEachDirection");
  v2[10] = CFSTR("VNDetectBarcodesLocateModeCenterFiveEachDirection");
  v2[11] = CFSTR("VNDetectBarcodesLocateModeCenterThreeEachDirectionAndCoverageAndDiagonals");
  v2[12] = CFSTR("VNDetectBarcodesLocateModeCenterThreeVerticalAndCoverageAndDiagonals");
  v2[13] = CFSTR("VNDetectBarcodesLocateModeCenterThreeHorizontalAndCoverageAndDiagonals");
  v2[14] = CFSTR("VNDetectBarcodesLocateModeRegularIntervalHorizontal");
  v2[15] = CFSTR("VNDetectBarcodesLocateModeRegularIntervalVertical");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 16);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNDetectBarcodesRequest availableLocateModesRev2]::ourAvailableLocateModesRev2;
  +[VNDetectBarcodesRequest availableLocateModesRev2]::ourAvailableLocateModesRev2 = v0;

}

void __51__VNDetectBarcodesRequest_availableLocateModesRev1__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[18];

  v2[17] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("VNDetectBarcodesLocateModeCenterOneVertical");
  v2[1] = CFSTR("VNDetectBarcodesLocateModeCenterOneVerticalThick");
  v2[2] = CFSTR("VNDetectBarcodesLocateModeCenterThreeVertical");
  v2[3] = CFSTR("VNDetectBarcodesLocateModeCenterThreeVerticalCrossed");
  v2[4] = CFSTR("VNDetectBarcodesLocateModeCenterOneHorizontal");
  v2[5] = CFSTR("VNDetectBarcodesLocateModeCenterOneHorizontalThick");
  v2[6] = CFSTR("VNDetectBarcodesLocateModeCenterThreeHorizontal");
  v2[7] = CFSTR("VNDetectBarcodesLocateModeCenterThreeHorizontalCrossed");
  v2[8] = CFSTR("VNDetectBarcodesLocateModeCenterOneEachDirection");
  v2[9] = CFSTR("VNDetectBarcodesLocateModeCenterThreeEachDirection");
  v2[10] = CFSTR("VNDetectBarcodesLocateModeCenterFiveEachDirection");
  v2[11] = CFSTR("VNDetectBarcodesLocateModeCenterThreeEachDirectionAndCoverageAndDiagonals");
  v2[12] = CFSTR("VNDetectBarcodesLocateModeCenterThreeVerticalAndCoverageAndDiagonals");
  v2[13] = CFSTR("VNDetectBarcodesLocateModeCenterThreeHorizontalAndCoverageAndDiagonals");
  v2[14] = CFSTR("VNDetectBarcodesLocateModeFastSearch");
  v2[15] = CFSTR("VNDetectBarcodesLocateModeRegularIntervalHorizontal");
  v2[16] = CFSTR("VNDetectBarcodesLocateModeRegularIntervalVertical");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 17);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNDetectBarcodesRequest availableLocateModesRev1]::ourAvailableLocateModesRev1;
  +[VNDetectBarcodesRequest availableLocateModesRev1]::ourAvailableLocateModesRev1 = v0;

}

void __60__VNDetectBarcodesRequest__allBarcodeSymbologiesRev4Private__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4Private](VNDetectBarcodesRequest, "_ourBarcodeSymbologyToMRCSymbologyMapRev4Private");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sortedArrayUsingSelector:", sel_compare_);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4Private]::_allBarcodeSymbologiesRev4Private;
  +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4Private]::_allBarcodeSymbologiesRev4Private = v2;

}

void __75__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev4Private__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4Private](VNDetectBarcodesRequest, "_ourMRCSymbologyToBarcodeSymbologyMapRev4Private");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev4Private__block_invoke_2;
  v5[3] = &unk_1E4545160;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4Private]::ourBarcodeSymbologyToMRCSymbologyMapRev4Private;
  +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4Private]::ourBarcodeSymbologyToMRCSymbologyMapRev4Private = v3;

}

uint64_t __75__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev4Private__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

void __75__VNDetectBarcodesRequest__ourMRCSymbologyToBarcodeSymbologyMapRev4Private__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[25];
  _QWORD v15[26];

  v15[25] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D83388];
  v14[0] = *MEMORY[0x1E0D83370];
  v14[1] = v0;
  v15[0] = CFSTR("VNBarcodeSymbologyAztec");
  v15[1] = CFSTR("VNBarcodeSymbologyCode39");
  v1 = *MEMORY[0x1E0D83398];
  v14[2] = *MEMORY[0x1E0D83390];
  v14[3] = v1;
  v15[2] = CFSTR("VNBarcodeSymbologyCode39Checksum");
  v15[3] = CFSTR("VNBarcodeSymbologyCode39FullASCII");
  v2 = *MEMORY[0x1E0D833A8];
  v14[4] = *MEMORY[0x1E0D833A0];
  v14[5] = v2;
  v15[4] = CFSTR("VNBarcodeSymbologyCode39FullASCIIChecksum");
  v15[5] = CFSTR("VNBarcodeSymbologyCode93");
  v3 = *MEMORY[0x1E0D83380];
  v14[6] = *MEMORY[0x1E0D833B0];
  v14[7] = v3;
  v15[6] = CFSTR("VNBarcodeSymbologyCode93i");
  v15[7] = CFSTR("VNBarcodeSymbologyCode128");
  v4 = *MEMORY[0x1E0D833C8];
  v14[8] = *MEMORY[0x1E0D833B8];
  v14[9] = v4;
  v15[8] = CFSTR("VNBarcodeSymbologyDataMatrix");
  v15[9] = CFSTR("VNBarcodeSymbologyEAN8");
  v5 = *MEMORY[0x1E0D833E8];
  v14[10] = *MEMORY[0x1E0D833C0];
  v14[11] = v5;
  v15[10] = CFSTR("VNBarcodeSymbologyEAN13");
  v15[11] = CFSTR("VNBarcodeSymbologyI2of5");
  v6 = *MEMORY[0x1E0D833F8];
  v14[12] = *MEMORY[0x1E0D833F0];
  v14[13] = v6;
  v15[12] = CFSTR("VNBarcodeSymbologyI2of5Checksum");
  v15[13] = CFSTR("VNBarcodeSymbologyITF14");
  v7 = *MEMORY[0x1E0D83440];
  v14[14] = *MEMORY[0x1E0D83418];
  v14[15] = v7;
  v15[14] = CFSTR("VNBarcodeSymbologyPDF417");
  v15[15] = CFSTR("VNBarcodeSymbologyQR");
  v8 = *MEMORY[0x1E0D83368];
  v14[16] = *MEMORY[0x1E0D83448];
  v14[17] = v8;
  v15[16] = CFSTR("VNBarcodeSymbologyUPCE");
  v15[17] = CFSTR("VNBarcodeSymbologyAppClipCode");
  v9 = *MEMORY[0x1E0D833D0];
  v14[18] = *MEMORY[0x1E0D83378];
  v14[19] = v9;
  v15[18] = CFSTR("VNBarcodeSymbologyCodabar");
  v15[19] = CFSTR("VNBarcodeSymbologyGS1DataBar");
  v10 = *MEMORY[0x1E0D833E0];
  v14[20] = *MEMORY[0x1E0D833D8];
  v14[21] = v10;
  v15[20] = CFSTR("VNBarcodeSymbologyGS1DataBarExpanded");
  v15[21] = CFSTR("VNBarcodeSymbologyGS1DataBarLimited");
  v11 = *MEMORY[0x1E0D83410];
  v14[22] = *MEMORY[0x1E0D83408];
  v14[23] = v11;
  v15[22] = CFSTR("VNBarcodeSymbologyMicroPDF417");
  v15[23] = CFSTR("VNBarcodeSymbologyMicroQR");
  v14[24] = *MEMORY[0x1E0D83400];
  v15[24] = CFSTR("VNBarcodeSymbologyMSIPlessey");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 25);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4Private]::ourMRCSymbologyToBarcodeSymbologyMapRev4Private;
  +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4Private]::ourMRCSymbologyToBarcodeSymbologyMapRev4Private = v12;

}

void __53__VNDetectBarcodesRequest__allBarcodeSymbologiesRev4__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4](VNDetectBarcodesRequest, "_ourBarcodeSymbologyToMRCSymbologyMapRev4");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sortedArrayUsingSelector:", sel_compare_);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4]::_allBarcodeSymbologiesRev4;
  +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4]::_allBarcodeSymbologiesRev4 = v2;

}

void __68__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev4__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4](VNDetectBarcodesRequest, "_ourMRCSymbologyToBarcodeSymbologyMapRev4");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev4__block_invoke_2;
  v5[3] = &unk_1E4545160;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4]::ourBarcodeSymbologyToMRCSymbologyMapRev4;
  +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4]::ourBarcodeSymbologyToMRCSymbologyMapRev4 = v3;

}

uint64_t __68__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev4__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

void __68__VNDetectBarcodesRequest__ourMRCSymbologyToBarcodeSymbologyMapRev4__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[24];
  _QWORD v15[25];

  v15[24] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D83388];
  v14[0] = *MEMORY[0x1E0D83370];
  v14[1] = v0;
  v15[0] = CFSTR("VNBarcodeSymbologyAztec");
  v15[1] = CFSTR("VNBarcodeSymbologyCode39");
  v1 = *MEMORY[0x1E0D83398];
  v14[2] = *MEMORY[0x1E0D83390];
  v14[3] = v1;
  v15[2] = CFSTR("VNBarcodeSymbologyCode39Checksum");
  v15[3] = CFSTR("VNBarcodeSymbologyCode39FullASCII");
  v2 = *MEMORY[0x1E0D833A8];
  v14[4] = *MEMORY[0x1E0D833A0];
  v14[5] = v2;
  v15[4] = CFSTR("VNBarcodeSymbologyCode39FullASCIIChecksum");
  v15[5] = CFSTR("VNBarcodeSymbologyCode93");
  v3 = *MEMORY[0x1E0D83380];
  v14[6] = *MEMORY[0x1E0D833B0];
  v14[7] = v3;
  v15[6] = CFSTR("VNBarcodeSymbologyCode93i");
  v15[7] = CFSTR("VNBarcodeSymbologyCode128");
  v4 = *MEMORY[0x1E0D833C8];
  v14[8] = *MEMORY[0x1E0D833B8];
  v14[9] = v4;
  v15[8] = CFSTR("VNBarcodeSymbologyDataMatrix");
  v15[9] = CFSTR("VNBarcodeSymbologyEAN8");
  v5 = *MEMORY[0x1E0D833E8];
  v14[10] = *MEMORY[0x1E0D833C0];
  v14[11] = v5;
  v15[10] = CFSTR("VNBarcodeSymbologyEAN13");
  v15[11] = CFSTR("VNBarcodeSymbologyI2of5");
  v6 = *MEMORY[0x1E0D833F8];
  v14[12] = *MEMORY[0x1E0D833F0];
  v14[13] = v6;
  v15[12] = CFSTR("VNBarcodeSymbologyI2of5Checksum");
  v15[13] = CFSTR("VNBarcodeSymbologyITF14");
  v7 = *MEMORY[0x1E0D83440];
  v14[14] = *MEMORY[0x1E0D83418];
  v14[15] = v7;
  v15[14] = CFSTR("VNBarcodeSymbologyPDF417");
  v15[15] = CFSTR("VNBarcodeSymbologyQR");
  v8 = *MEMORY[0x1E0D83378];
  v14[16] = *MEMORY[0x1E0D83448];
  v14[17] = v8;
  v15[16] = CFSTR("VNBarcodeSymbologyUPCE");
  v15[17] = CFSTR("VNBarcodeSymbologyCodabar");
  v9 = *MEMORY[0x1E0D833D8];
  v14[18] = *MEMORY[0x1E0D833D0];
  v14[19] = v9;
  v15[18] = CFSTR("VNBarcodeSymbologyGS1DataBar");
  v15[19] = CFSTR("VNBarcodeSymbologyGS1DataBarExpanded");
  v10 = *MEMORY[0x1E0D83408];
  v14[20] = *MEMORY[0x1E0D833E0];
  v14[21] = v10;
  v15[20] = CFSTR("VNBarcodeSymbologyGS1DataBarLimited");
  v15[21] = CFSTR("VNBarcodeSymbologyMicroPDF417");
  v11 = *MEMORY[0x1E0D83400];
  v14[22] = *MEMORY[0x1E0D83410];
  v14[23] = v11;
  v15[22] = CFSTR("VNBarcodeSymbologyMicroQR");
  v15[23] = CFSTR("VNBarcodeSymbologyMSIPlessey");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 24);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4]::ourMRCSymbologyToBarcodeSymbologyMapRev4;
  +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4]::ourMRCSymbologyToBarcodeSymbologyMapRev4 = v12;

}

void __60__VNDetectBarcodesRequest__allBarcodeSymbologiesRev3Private__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3Private](VNDetectBarcodesRequest, "_ourBarcodeSymbologyToMRCSymbologyMapRev3Private");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sortedArrayUsingSelector:", sel_compare_);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3Private]::_allBarcodeSymbologiesRev3;
  +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3Private]::_allBarcodeSymbologiesRev3 = v2;

}

void __75__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev3Private__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3Private](VNDetectBarcodesRequest, "_ourMRCSymbologyToBarcodeSymbologyMapRev3Private");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev3Private__block_invoke_2;
  v5[3] = &unk_1E4545160;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3Private]::ourBarcodeSymbologyToMRCSymbologyMapRevision3Private;
  +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3Private]::ourBarcodeSymbologyToMRCSymbologyMapRevision3Private = v3;

}

uint64_t __75__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev3Private__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

void __75__VNDetectBarcodesRequest__ourMRCSymbologyToBarcodeSymbologyMapRev3Private__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[24];
  _QWORD v15[25];

  v15[24] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D83370];
  v14[0] = *MEMORY[0x1E0D83368];
  v14[1] = v0;
  v15[0] = CFSTR("VNBarcodeSymbologyAppClipCode");
  v15[1] = CFSTR("VNBarcodeSymbologyAztec");
  v1 = *MEMORY[0x1E0D83390];
  v14[2] = *MEMORY[0x1E0D83388];
  v14[3] = v1;
  v15[2] = CFSTR("VNBarcodeSymbologyCode39");
  v15[3] = CFSTR("VNBarcodeSymbologyCode39Checksum");
  v2 = *MEMORY[0x1E0D833A0];
  v14[4] = *MEMORY[0x1E0D83398];
  v14[5] = v2;
  v15[4] = CFSTR("VNBarcodeSymbologyCode39FullASCII");
  v15[5] = CFSTR("VNBarcodeSymbologyCode39FullASCIIChecksum");
  v3 = *MEMORY[0x1E0D833B0];
  v14[6] = *MEMORY[0x1E0D833A8];
  v14[7] = v3;
  v15[6] = CFSTR("VNBarcodeSymbologyCode93");
  v15[7] = CFSTR("VNBarcodeSymbologyCode93i");
  v4 = *MEMORY[0x1E0D833B8];
  v14[8] = *MEMORY[0x1E0D83380];
  v14[9] = v4;
  v15[8] = CFSTR("VNBarcodeSymbologyCode128");
  v15[9] = CFSTR("VNBarcodeSymbologyDataMatrix");
  v5 = *MEMORY[0x1E0D833C0];
  v14[10] = *MEMORY[0x1E0D833C8];
  v14[11] = v5;
  v15[10] = CFSTR("VNBarcodeSymbologyEAN8");
  v15[11] = CFSTR("VNBarcodeSymbologyEAN13");
  v6 = *MEMORY[0x1E0D833F0];
  v14[12] = *MEMORY[0x1E0D833E8];
  v14[13] = v6;
  v15[12] = CFSTR("VNBarcodeSymbologyI2of5");
  v15[13] = CFSTR("VNBarcodeSymbologyI2of5Checksum");
  v7 = *MEMORY[0x1E0D83418];
  v14[14] = *MEMORY[0x1E0D833F8];
  v14[15] = v7;
  v15[14] = CFSTR("VNBarcodeSymbologyITF14");
  v15[15] = CFSTR("VNBarcodeSymbologyPDF417");
  v8 = *MEMORY[0x1E0D83448];
  v14[16] = *MEMORY[0x1E0D83440];
  v14[17] = v8;
  v15[16] = CFSTR("VNBarcodeSymbologyQR");
  v15[17] = CFSTR("VNBarcodeSymbologyUPCE");
  v9 = *MEMORY[0x1E0D833D0];
  v14[18] = *MEMORY[0x1E0D83378];
  v14[19] = v9;
  v15[18] = CFSTR("VNBarcodeSymbologyCodabar");
  v15[19] = CFSTR("VNBarcodeSymbologyGS1DataBar");
  v10 = *MEMORY[0x1E0D833E0];
  v14[20] = *MEMORY[0x1E0D833D8];
  v14[21] = v10;
  v15[20] = CFSTR("VNBarcodeSymbologyGS1DataBarExpanded");
  v15[21] = CFSTR("VNBarcodeSymbologyGS1DataBarLimited");
  v11 = *MEMORY[0x1E0D83410];
  v14[22] = *MEMORY[0x1E0D83408];
  v14[23] = v11;
  v15[22] = CFSTR("VNBarcodeSymbologyMicroPDF417");
  v15[23] = CFSTR("VNBarcodeSymbologyMicroQR");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 24);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3Private]::ourMRCSymbologyToBarcodeSymbologyMapRev3Private;
  +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3Private]::ourMRCSymbologyToBarcodeSymbologyMapRev3Private = v12;

}

void __53__VNDetectBarcodesRequest__allBarcodeSymbologiesRev3__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3](VNDetectBarcodesRequest, "_ourBarcodeSymbologyToMRCSymbologyMapRev3");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sortedArrayUsingSelector:", sel_compare_);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3]::_allBarcodeSymbologiesRev3;
  +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3]::_allBarcodeSymbologiesRev3 = v2;

}

void __68__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev3__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3](VNDetectBarcodesRequest, "_ourMRCSymbologyToBarcodeSymbologyMapRev3");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev3__block_invoke_2;
  v5[3] = &unk_1E4545160;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3]::ourBarcodeSymbologyToMRCSymbologyMapRevision3;
  +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3]::ourBarcodeSymbologyToMRCSymbologyMapRevision3 = v3;

}

uint64_t __68__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev3__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

void __68__VNDetectBarcodesRequest__ourMRCSymbologyToBarcodeSymbologyMapRev3__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[23];
  _QWORD v14[24];

  v14[23] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D83388];
  v13[0] = *MEMORY[0x1E0D83370];
  v13[1] = v0;
  v14[0] = CFSTR("VNBarcodeSymbologyAztec");
  v14[1] = CFSTR("VNBarcodeSymbologyCode39");
  v1 = *MEMORY[0x1E0D83398];
  v13[2] = *MEMORY[0x1E0D83390];
  v13[3] = v1;
  v14[2] = CFSTR("VNBarcodeSymbologyCode39Checksum");
  v14[3] = CFSTR("VNBarcodeSymbologyCode39FullASCII");
  v2 = *MEMORY[0x1E0D833A8];
  v13[4] = *MEMORY[0x1E0D833A0];
  v13[5] = v2;
  v14[4] = CFSTR("VNBarcodeSymbologyCode39FullASCIIChecksum");
  v14[5] = CFSTR("VNBarcodeSymbologyCode93");
  v3 = *MEMORY[0x1E0D83380];
  v13[6] = *MEMORY[0x1E0D833B0];
  v13[7] = v3;
  v14[6] = CFSTR("VNBarcodeSymbologyCode93i");
  v14[7] = CFSTR("VNBarcodeSymbologyCode128");
  v4 = *MEMORY[0x1E0D833C8];
  v13[8] = *MEMORY[0x1E0D833B8];
  v13[9] = v4;
  v14[8] = CFSTR("VNBarcodeSymbologyDataMatrix");
  v14[9] = CFSTR("VNBarcodeSymbologyEAN8");
  v5 = *MEMORY[0x1E0D833E8];
  v13[10] = *MEMORY[0x1E0D833C0];
  v13[11] = v5;
  v14[10] = CFSTR("VNBarcodeSymbologyEAN13");
  v14[11] = CFSTR("VNBarcodeSymbologyI2of5");
  v6 = *MEMORY[0x1E0D833F8];
  v13[12] = *MEMORY[0x1E0D833F0];
  v13[13] = v6;
  v14[12] = CFSTR("VNBarcodeSymbologyI2of5Checksum");
  v14[13] = CFSTR("VNBarcodeSymbologyITF14");
  v7 = *MEMORY[0x1E0D83440];
  v13[14] = *MEMORY[0x1E0D83418];
  v13[15] = v7;
  v14[14] = CFSTR("VNBarcodeSymbologyPDF417");
  v14[15] = CFSTR("VNBarcodeSymbologyQR");
  v8 = *MEMORY[0x1E0D83378];
  v13[16] = *MEMORY[0x1E0D83448];
  v13[17] = v8;
  v14[16] = CFSTR("VNBarcodeSymbologyUPCE");
  v14[17] = CFSTR("VNBarcodeSymbologyCodabar");
  v9 = *MEMORY[0x1E0D833D8];
  v13[18] = *MEMORY[0x1E0D833D0];
  v13[19] = v9;
  v14[18] = CFSTR("VNBarcodeSymbologyGS1DataBar");
  v14[19] = CFSTR("VNBarcodeSymbologyGS1DataBarExpanded");
  v10 = *MEMORY[0x1E0D83408];
  v13[20] = *MEMORY[0x1E0D833E0];
  v13[21] = v10;
  v14[20] = CFSTR("VNBarcodeSymbologyGS1DataBarLimited");
  v14[21] = CFSTR("VNBarcodeSymbologyMicroPDF417");
  v13[22] = *MEMORY[0x1E0D83410];
  v14[22] = CFSTR("VNBarcodeSymbologyMicroQR");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 23);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3]::ourMRCSymbologyToBarcodeSymbologyMapRev3;
  +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3]::ourMRCSymbologyToBarcodeSymbologyMapRev3 = v11;

}

void __60__VNDetectBarcodesRequest__allBarcodeSymbologiesRev2Private__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapPrivate](VNDetectBarcodesRequest, "_ourBarcodeSymbologyToMRCSymbologyMapPrivate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sortedArrayUsingSelector:", sel_compare_);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2Private]::_allBarcodeSymbologiesRev2Private;
  +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2Private]::_allBarcodeSymbologiesRev2Private = v2;

}

void __71__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapPrivate__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapPrivate](VNDetectBarcodesRequest, "_ourMRCSymbologyToBarcodeSymbologyMapPrivate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapPrivate__block_invoke_2;
  v5[3] = &unk_1E4545160;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapPrivate]::ourBarcodeSymbologyToMRCSymbologyMapPrivate;
  +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapPrivate]::ourBarcodeSymbologyToMRCSymbologyMapPrivate = v3;

}

uint64_t __71__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapPrivate__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

void __71__VNDetectBarcodesRequest__ourMRCSymbologyToBarcodeSymbologyMapPrivate__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[24];
  _QWORD v15[25];

  v15[24] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D83388];
  v14[0] = *MEMORY[0x1E0D83370];
  v14[1] = v0;
  v15[0] = CFSTR("VNBarcodeSymbologyAztec");
  v15[1] = CFSTR("VNBarcodeSymbologyCode39");
  v1 = *MEMORY[0x1E0D83398];
  v14[2] = *MEMORY[0x1E0D83390];
  v14[3] = v1;
  v15[2] = CFSTR("VNBarcodeSymbologyCode39Checksum");
  v15[3] = CFSTR("VNBarcodeSymbologyCode39FullASCII");
  v2 = *MEMORY[0x1E0D833A8];
  v14[4] = *MEMORY[0x1E0D833A0];
  v14[5] = v2;
  v15[4] = CFSTR("VNBarcodeSymbologyCode39FullASCIIChecksum");
  v15[5] = CFSTR("VNBarcodeSymbologyCode93");
  v3 = *MEMORY[0x1E0D83380];
  v14[6] = *MEMORY[0x1E0D833B0];
  v14[7] = v3;
  v15[6] = CFSTR("VNBarcodeSymbologyCode93i");
  v15[7] = CFSTR("VNBarcodeSymbologyCode128");
  v4 = *MEMORY[0x1E0D833C8];
  v14[8] = *MEMORY[0x1E0D833B8];
  v14[9] = v4;
  v15[8] = CFSTR("VNBarcodeSymbologyDataMatrix");
  v15[9] = CFSTR("VNBarcodeSymbologyEAN8");
  v5 = *MEMORY[0x1E0D833E8];
  v14[10] = *MEMORY[0x1E0D833C0];
  v14[11] = v5;
  v15[10] = CFSTR("VNBarcodeSymbologyEAN13");
  v15[11] = CFSTR("VNBarcodeSymbologyI2of5");
  v6 = *MEMORY[0x1E0D833F8];
  v14[12] = *MEMORY[0x1E0D833F0];
  v14[13] = v6;
  v15[12] = CFSTR("VNBarcodeSymbologyI2of5Checksum");
  v15[13] = CFSTR("VNBarcodeSymbologyITF14");
  v7 = *MEMORY[0x1E0D83440];
  v14[14] = *MEMORY[0x1E0D83418];
  v14[15] = v7;
  v15[14] = CFSTR("VNBarcodeSymbologyPDF417");
  v15[15] = CFSTR("VNBarcodeSymbologyQR");
  v8 = *MEMORY[0x1E0D83368];
  v14[16] = *MEMORY[0x1E0D83448];
  v14[17] = v8;
  v15[16] = CFSTR("VNBarcodeSymbologyUPCE");
  v15[17] = CFSTR("VNBarcodeSymbologyAppClipCode");
  v9 = *MEMORY[0x1E0D833D0];
  v14[18] = *MEMORY[0x1E0D83378];
  v14[19] = v9;
  v15[18] = CFSTR("VNBarcodeSymbologyCodabar");
  v15[19] = CFSTR("VNBarcodeSymbologyGS1DataBar");
  v10 = *MEMORY[0x1E0D833E0];
  v14[20] = *MEMORY[0x1E0D833D8];
  v14[21] = v10;
  v15[20] = CFSTR("VNBarcodeSymbologyGS1DataBarExpanded");
  v15[21] = CFSTR("VNBarcodeSymbologyGS1DataBarLimited");
  v11 = *MEMORY[0x1E0D83410];
  v14[22] = *MEMORY[0x1E0D83408];
  v14[23] = v11;
  v15[22] = CFSTR("VNBarcodeSymbologyMicroPDF417");
  v15[23] = CFSTR("VNBarcodeSymbologyMicroQR");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 24);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapPrivate]::ourMRCSymbologyToBarcodeSymbologyMapPrivate;
  +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapPrivate]::ourMRCSymbologyToBarcodeSymbologyMapPrivate = v12;

}

void __53__VNDetectBarcodesRequest__allBarcodeSymbologiesRev2__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMap](VNDetectBarcodesRequest, "_ourBarcodeSymbologyToMRCSymbologyMap");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sortedArrayUsingSelector:", sel_compare_);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2]::_allBarcodeSymbologiesRev2;
  +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2]::_allBarcodeSymbologiesRev2 = v2;

}

void __64__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMap__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMap](VNDetectBarcodesRequest, "_ourMRCSymbologyToBarcodeSymbologyMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMap__block_invoke_2;
  v5[3] = &unk_1E4545160;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMap]::ourBarcodeSymbologyToMRCSymbologyMap;
  +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMap]::ourBarcodeSymbologyToMRCSymbologyMap = v3;

}

uint64_t __64__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMap__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

void __64__VNDetectBarcodesRequest__ourMRCSymbologyToBarcodeSymbologyMap__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[23];
  _QWORD v14[24];

  v14[23] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D83388];
  v13[0] = *MEMORY[0x1E0D83370];
  v13[1] = v0;
  v14[0] = CFSTR("VNBarcodeSymbologyAztec");
  v14[1] = CFSTR("VNBarcodeSymbologyCode39");
  v1 = *MEMORY[0x1E0D83398];
  v13[2] = *MEMORY[0x1E0D83390];
  v13[3] = v1;
  v14[2] = CFSTR("VNBarcodeSymbologyCode39Checksum");
  v14[3] = CFSTR("VNBarcodeSymbologyCode39FullASCII");
  v2 = *MEMORY[0x1E0D833A8];
  v13[4] = *MEMORY[0x1E0D833A0];
  v13[5] = v2;
  v14[4] = CFSTR("VNBarcodeSymbologyCode39FullASCIIChecksum");
  v14[5] = CFSTR("VNBarcodeSymbologyCode93");
  v3 = *MEMORY[0x1E0D83380];
  v13[6] = *MEMORY[0x1E0D833B0];
  v13[7] = v3;
  v14[6] = CFSTR("VNBarcodeSymbologyCode93i");
  v14[7] = CFSTR("VNBarcodeSymbologyCode128");
  v4 = *MEMORY[0x1E0D833C8];
  v13[8] = *MEMORY[0x1E0D833B8];
  v13[9] = v4;
  v14[8] = CFSTR("VNBarcodeSymbologyDataMatrix");
  v14[9] = CFSTR("VNBarcodeSymbologyEAN8");
  v5 = *MEMORY[0x1E0D833E8];
  v13[10] = *MEMORY[0x1E0D833C0];
  v13[11] = v5;
  v14[10] = CFSTR("VNBarcodeSymbologyEAN13");
  v14[11] = CFSTR("VNBarcodeSymbologyI2of5");
  v6 = *MEMORY[0x1E0D833F8];
  v13[12] = *MEMORY[0x1E0D833F0];
  v13[13] = v6;
  v14[12] = CFSTR("VNBarcodeSymbologyI2of5Checksum");
  v14[13] = CFSTR("VNBarcodeSymbologyITF14");
  v7 = *MEMORY[0x1E0D83440];
  v13[14] = *MEMORY[0x1E0D83418];
  v13[15] = v7;
  v14[14] = CFSTR("VNBarcodeSymbologyPDF417");
  v14[15] = CFSTR("VNBarcodeSymbologyQR");
  v8 = *MEMORY[0x1E0D83378];
  v13[16] = *MEMORY[0x1E0D83448];
  v13[17] = v8;
  v14[16] = CFSTR("VNBarcodeSymbologyUPCE");
  v14[17] = CFSTR("VNBarcodeSymbologyCodabar");
  v9 = *MEMORY[0x1E0D833D8];
  v13[18] = *MEMORY[0x1E0D833D0];
  v13[19] = v9;
  v14[18] = CFSTR("VNBarcodeSymbologyGS1DataBar");
  v14[19] = CFSTR("VNBarcodeSymbologyGS1DataBarExpanded");
  v10 = *MEMORY[0x1E0D83408];
  v13[20] = *MEMORY[0x1E0D833E0];
  v13[21] = v10;
  v14[20] = CFSTR("VNBarcodeSymbologyGS1DataBarLimited");
  v14[21] = CFSTR("VNBarcodeSymbologyMicroPDF417");
  v13[22] = *MEMORY[0x1E0D83410];
  v14[22] = CFSTR("VNBarcodeSymbologyMicroQR");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 23);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMap]::ourMRCSymbologyToBarcodeSymbologyMap;
  +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMap]::ourMRCSymbologyToBarcodeSymbologyMap = v11;

}

void __53__VNDetectBarcodesRequest__allBarcodeSymbologiesRev1__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  +[VNDetectBarcodesRequest _ourBarcodeSymbologyToACBSBarcodeTypeMap](VNDetectBarcodesRequest, "_ourBarcodeSymbologyToACBSBarcodeTypeMap");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sortedArrayUsingSelector:", sel_compare_);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev1]::_allBarcodeSymbologiesRev1;
  +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev1]::_allBarcodeSymbologiesRev1 = v2;

}

void __67__VNDetectBarcodesRequest__ourBarcodeSymbologyToACBSBarcodeTypeMap__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  +[VNDetectBarcodesRequest _ourACBSBarcodeTypeToBarcodeSymbologyMap](VNDetectBarcodesRequest, "_ourACBSBarcodeTypeToBarcodeSymbologyMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__VNDetectBarcodesRequest__ourBarcodeSymbologyToACBSBarcodeTypeMap__block_invoke_2;
  v5[3] = &unk_1E4545160;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToACBSBarcodeTypeMap]::ourBarcodeSymbologyToACBSBarcodeTypeMap;
  +[VNDetectBarcodesRequest _ourBarcodeSymbologyToACBSBarcodeTypeMap]::ourBarcodeSymbologyToACBSBarcodeTypeMap = v3;

}

uint64_t __67__VNDetectBarcodesRequest__ourBarcodeSymbologyToACBSBarcodeTypeMap__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

void __67__VNDetectBarcodesRequest__ourACBSBarcodeTypeToBarcodeSymbologyMap__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[17];
  _QWORD v11[18];

  v11[17] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D834E8];
  v10[0] = *MEMORY[0x1E0D834D8];
  v10[1] = v0;
  v11[0] = CFSTR("VNBarcodeSymbologyAztec");
  v11[1] = CFSTR("VNBarcodeSymbologyCode39");
  v1 = *MEMORY[0x1E0D834F8];
  v10[2] = *MEMORY[0x1E0D834F0];
  v10[3] = v1;
  v11[2] = CFSTR("VNBarcodeSymbologyCode39Checksum");
  v11[3] = CFSTR("VNBarcodeSymbologyCode39FullASCII");
  v2 = *MEMORY[0x1E0D83508];
  v10[4] = *MEMORY[0x1E0D83500];
  v10[5] = v2;
  v11[4] = CFSTR("VNBarcodeSymbologyCode39FullASCIIChecksum");
  v11[5] = CFSTR("VNBarcodeSymbologyCode93");
  v3 = *MEMORY[0x1E0D834E0];
  v10[6] = *MEMORY[0x1E0D83510];
  v10[7] = v3;
  v11[6] = CFSTR("VNBarcodeSymbologyCode93i");
  v11[7] = CFSTR("VNBarcodeSymbologyCode128");
  v4 = *MEMORY[0x1E0D83528];
  v10[8] = *MEMORY[0x1E0D83518];
  v10[9] = v4;
  v11[8] = CFSTR("VNBarcodeSymbologyDataMatrix");
  v11[9] = CFSTR("VNBarcodeSymbologyEAN8");
  v5 = *MEMORY[0x1E0D83530];
  v10[10] = *MEMORY[0x1E0D83520];
  v10[11] = v5;
  v11[10] = CFSTR("VNBarcodeSymbologyEAN13");
  v11[11] = CFSTR("VNBarcodeSymbologyI2of5");
  v6 = *MEMORY[0x1E0D83540];
  v10[12] = *MEMORY[0x1E0D83538];
  v10[13] = v6;
  v11[12] = CFSTR("VNBarcodeSymbologyI2of5Checksum");
  v11[13] = CFSTR("VNBarcodeSymbologyITF14");
  v7 = *MEMORY[0x1E0D83550];
  v10[14] = *MEMORY[0x1E0D83548];
  v10[15] = v7;
  v11[14] = CFSTR("VNBarcodeSymbologyPDF417");
  v11[15] = CFSTR("VNBarcodeSymbologyQR");
  v10[16] = *MEMORY[0x1E0D83558];
  v11[16] = CFSTR("VNBarcodeSymbologyUPCE");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 17);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)+[VNDetectBarcodesRequest _ourACBSBarcodeTypeToBarcodeSymbologyMap]::ourACBSBarcodeTypeToBarcodeSymbologyMap;
  +[VNDetectBarcodesRequest _ourACBSBarcodeTypeToBarcodeSymbologyMap]::ourACBSBarcodeTypeToBarcodeSymbologyMap = v8;

}

void __46__VNDetectBarcodesRequest_privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  void *v9;

  VNRequestPrivateRevisionsSet(0xDECAF000uLL, a2, a3, a4, a5, a6, a7, a8, 3737841665);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)+[VNDetectBarcodesRequest privateRevisionsSet]::ourPrivateRevisions;
  +[VNDetectBarcodesRequest privateRevisionsSet]::ourPrivateRevisions = v8;

}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNDetectBarcodesRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end
