@implementation CAMHistogramResult

- (CAMHistogramResult)initWithHistogramObject:(id)a3 forDeviceFormat:(id)a4
{
  id v7;
  id v8;
  CAMHistogramResult *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  NSString *uniqueIdentifier;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  signed int MediaSubType;
  uint64_t v21;
  int v22;
  uint64_t v23;
  double v24;
  double v25;
  unint64_t v26;
  uint64_t v27;
  char *v28;
  unsigned int v29;
  unint64_t v30;
  uint64_t v31;
  char *v32;
  unsigned int v33;
  _QWORD block[4];
  signed int v36;
  objc_super v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v37.receiver = self;
  v37.super_class = (Class)CAMHistogramResult;
  v9 = -[CAMHistogramResult init](&v37, sel_init);
  if (v9)
  {
    objc_msgSend(v7, "lumaHistogramData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "lumaHistogramBinCount");
    if (v11)
    {
      if (objc_msgSend(v10, "length"))
      {
        objc_storeStrong((id *)&v9->__metadataHistogramObject, a3);
        objc_msgSend(v7, "type");
        v12 = objc_claimAutoreleasedReturnValue();
        uniqueIdentifier = v9->_uniqueIdentifier;
        v9->_uniqueIdentifier = (NSString *)v12;

        MEMORY[0x1E0C80A78]();
        v15 = (char *)block - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
        objc_msgSend(v10, "getBytes:length:", v15, objc_msgSend(v10, "length"));
        v16 = 0;
        v17 = 0;
        do
          v17 += *(unsigned int *)&v15[4 * v16++];
        while (v11 != v16);
        if (v17 <= 1)
          v18 = 1;
        else
          v18 = v17;
        v19 = vcvtmd_u64_f64((double)v11 * 0.0390625);
        MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)objc_msgSend(v8, "formatDescription"));
        v21 = 0;
        if (MediaSubType <= 875704437)
        {
          if (MediaSubType <= 645424687)
          {
            v23 = 0;
            if (MediaSubType == 641230384)
              goto LABEL_28;
            if (MediaSubType != 641234480)
            {
LABEL_40:
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __62__CAMHistogramResult_initWithHistogramObject_forDeviceFormat___block_invoke;
              block[3] = &__block_descriptor_36_e5_v8__0l;
              v36 = MediaSubType;
              if (initWithHistogramObject_forDeviceFormat__onceToken != -1)
                dispatch_once(&initWithHistogramObject_forDeviceFormat__onceToken, block);
              v21 = 0;
              v23 = 0;
              goto LABEL_28;
            }
            goto LABEL_27;
          }
          if (MediaSubType == 645424688)
          {
            v23 = 0;
            goto LABEL_28;
          }
          if (MediaSubType == 645428784)
            goto LABEL_27;
          v22 = 875704422;
        }
        else
        {
          if (MediaSubType <= 2016686639)
          {
            if (MediaSubType != 875704438 && MediaSubType != 1882468912)
            {
              v22 = 1885745712;
              goto LABEL_23;
            }
LABEL_27:
            v23 = 10;
            v21 = 8;
            goto LABEL_28;
          }
          if (MediaSubType == 2016686640 || MediaSubType == 2016686642)
            goto LABEL_27;
          v22 = 2019963440;
        }
LABEL_23:
        v23 = 0;
        if (MediaSubType != v22)
          goto LABEL_40;
LABEL_28:
        v24 = 0.0;
        v25 = 0.0;
        v26 = v21 + v19;
        if (v26)
        {
          v27 = 0;
          v28 = v15;
          do
          {
            v29 = *(_DWORD *)v28;
            v28 += 4;
            v27 += v29;
            --v26;
          }
          while (v26);
          v25 = (double)v27;
        }
        v30 = v23 + v19;
        if (v23 + v19)
        {
          v31 = 0;
          v32 = &v15[4 * v11 - 4];
          do
          {
            v33 = *(_DWORD *)v32;
            v32 -= 4;
            v31 += v33;
            --v30;
          }
          while (v30);
          v24 = (double)v31;
        }
        v9->_shadowClipping = v25 / (double)v18;
        v9->_highlightClipping = v24 / (double)v18;
        v11 = v9;
        goto LABEL_37;
      }
      v11 = 0;
    }
LABEL_37:

    goto LABEL_38;
  }
  v11 = 0;
LABEL_38:

  return (CAMHistogramResult *)v11;
}

void __62__CAMHistogramResult_initWithHistogramObject_forDeviceFormat___block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __62__CAMHistogramResult_initWithHistogramObject_forDeviceFormat___block_invoke_cold_1(a1, v2);

}

- (NSString)metadataType
{
  void *v2;
  void *v3;

  -[CAMHistogramResult _metadataHistogramObject](self, "_metadataHistogramObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (double)shadowClipping
{
  return self->_shadowClipping;
}

- (double)highlightClipping
{
  return self->_highlightClipping;
}

- (AVMetadataVideoPreviewHistogramObject)_metadataHistogramObject
{
  return self->__metadataHistogramObject;
}

- (void)set_metadataHistogramObject:(id)a3
{
  objc_storeStrong((id *)&self->__metadataHistogramObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__metadataHistogramObject, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

void __62__CAMHistogramResult_initWithHistogramObject_forDeviceFormat___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 32);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "CAMHistogramResult received with unsupported pixel format type: %d", (uint8_t *)v3, 8u);
}

@end
