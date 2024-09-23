@implementation AVCaptureVideoSettingsValidator

+ (BOOL)validateVideoSettings:(id)a3 allowingFeatures:(unint64_t)a4 validPixelKeys:(id)a5 validPixelFormats:(id)a6 validCodecKeys:(id)a7 validCodecs:(id)a8 exceptionReason:(id *)a9
{
  char v9;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __CFString *v31;
  void *v32;
  void *v33;
  uint64_t v34;

  v9 = a4;
  if (!a3)
  {
    if ((a4 & 1) == 0)
    {
      LOBYTE(v15) = 0;
      v31 = CFSTR("nil settings");
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  v15 = objc_msgSend(a3, "count") | a4 & 2;
  if (!v15)
  {
    v31 = CFSTR("source passthru (empty dictionary) is not supported");
    goto LABEL_40;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v15) = 0;
    v31 = CFSTR("not a dictionary");
    goto LABEL_40;
  }
  v16 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9040]), "intValue");
  v17 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2C58]);
  if ((_DWORD)v16)
    v18 = v17 == 0;
  else
    v18 = 1;
  if (!v18)
  {
    LOBYTE(v15) = 0;
    v31 = CFSTR("kCVPixelBufferPixelFormatTypeKey and AVVideoCodecKey may not both be specified");
    goto LABEL_40;
  }
  v19 = (void *)v17;
  if ((_DWORD)v16)
    v20 = 0;
  else
    v20 = v17 == 0;
  if (v20)
  {
    LOBYTE(v15) = 0;
    v31 = CFSTR("Either kCVPixelBufferPixelFormatTypeKey or AVVideoCodecKey must be specified");
    goto LABEL_40;
  }
  if ((v9 & 4) != 0 && (_DWORD)v16)
  {
    if (!a5
      || (v21 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a5),
          v22 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", objc_msgSend(a3, "allKeys")),
          objc_msgSend(v22, "minusSet:", v21),
          !objc_msgSend(v22, "count")))
    {
      if (a6
        && (objc_msgSend(a6, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16)) & 1) == 0)
      {
        v31 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported pixel format type specified: %@. Supported pixel format types are %@"), AVStringForOSType(), a6);
LABEL_51:
        LOBYTE(v15) = 0;
        goto LABEL_40;
      }
      goto LABEL_39;
    }
    v32 = (void *)MEMORY[0x1E0CB3940];
    v33 = v22;
    v34 = v21;
LABEL_50:
    v31 = (__CFString *)objc_msgSend(v32, "stringWithFormat:", CFSTR("Unsupported keys specified: %@. Supported keys are %@"), v33, v34);
    goto LABEL_51;
  }
  if ((v9 & 8) == 0 || !v17)
  {
    if ((_DWORD)v16)
    {
      LOBYTE(v15) = 0;
      v31 = CFSTR("kCVPixelBufferPixelFormatTypeKey is unsupported");
      goto LABEL_40;
    }
    if (v17)
    {
      LOBYTE(v15) = 0;
      v31 = CFSTR("AVVideoCodecKey is unsupported");
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  if (!a7)
  {
LABEL_34:
    if (a8 && (objc_msgSend(a8, "containsObject:", v19) & 1) == 0)
    {
      v31 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported codec specified: %@. Supported codecs are %@"), v19, a8);
      goto LABEL_51;
    }
LABEL_39:
    v31 = 0;
    LOBYTE(v15) = 1;
    goto LABEL_40;
  }
  v23 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a7);
  v24 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", objc_msgSend(a3, "allKeys"));
  objc_msgSend(v24, "minusSet:", v23);
  if ((v9 & 0x10) == 0
    || (objc_msgSend(v19, "isEqual:", *MEMORY[0x1E0CF2C90]) & 1) == 0
    && (objc_msgSend(v19, "isEqual:", *MEMORY[0x1E0CF2C88]) & 1) == 0
    && !objc_msgSend(v19, "isEqual:", AVStringForOSType()))
  {
    goto LABEL_56;
  }
  v25 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2C98]);
  v26 = *MEMORY[0x1E0CF2CE0];
  if (v25)
  {
    v27 = (void *)v25;
    v28 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CF2CE0]);
    v29 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", objc_msgSend(v27, "allKeys"));
    objc_msgSend(v29, "minusSet:", v28);
    if (objc_msgSend(v29, "count"))
    {
      v31 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported AVVideoCompressionProperties specified: %@. Supported keys are %@"), v29, v28);
      goto LABEL_51;
    }
  }
  if (!objc_msgSend(v24, "containsObject:", v26) || !objc_msgSend(v24, "count"))
  {
LABEL_56:
    if (objc_msgSend(v24, "count"))
    {
      v32 = (void *)MEMORY[0x1E0CB3940];
      v33 = v24;
      v34 = v23;
      goto LABEL_50;
    }
    goto LABEL_34;
  }
  LOBYTE(v15) = 0;
  v31 = CFSTR("AVVideoQualityKey is present at the top level instead of inside the AVVideoCompressionPropertiesKey sub-dictionary");
LABEL_40:
  if (a9)
    *a9 = v31;
  return v15;
}

@end
