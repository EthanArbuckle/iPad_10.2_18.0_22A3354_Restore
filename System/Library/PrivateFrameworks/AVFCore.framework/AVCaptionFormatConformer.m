@implementation AVCaptionFormatConformer

+ (AVCaptionFormatConformer)captionFormatConformerWithConversionSettings:(NSDictionary *)conversionSettings
{
  return (AVCaptionFormatConformer *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithConversionSettings:", conversionSettings);
}

- (BOOL)_isConversionToClosedCaptions:(id)a3
{
  void *v4;
  BOOL result;

  result = 0;
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVCaptionMediaTypeKey")), "isEqualToString:", CFSTR("clcp")))
  {
    v4 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVCaptionMediaSubTypeKey"));
    if ((objc_msgSend(v4, "isEqual:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 1664495672)) & 1) != 0
      || (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVCaptionMediaSubTypeKey")), "isEqual:", CFSTR("c608")) & 1) != 0)
    {
      return 1;
    }
  }
  return result;
}

- (AVCaptionFormatConformer)initWithConversionSettings:(NSDictionary *)conversionSettings
{
  AVCaptionFormatConformer *v5;
  void *v6;
  AVCaptionFormatConformer *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  if (!-[AVCaptionFormatConformer _isConversionToClosedCaptions:](self, "_isConversionToClosedCaptions:", conversionSettings))
  {
    v8 = self;
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("supports conversions only to mediaType 'clcp' and mediaSubType 'c608'"), v9, v10, v11, v12, v13, (uint64_t)v15.receiver), 0);
    objc_exception_throw(v14);
  }
  v15.receiver = self;
  v15.super_class = (Class)AVCaptionFormatConformer;
  v5 = -[AVCaptionFormatConformer init](&v15, sel_init);
  if (v5)
  {
    v6 = malloc_type_calloc(1uLL, 0x10uLL, 0x10200405F07FB98uLL);
    v5->_conformerInternal = v6;
    if (!v6 || FigCLCPCaptionFormatConformerCreate())
    {

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  CFTypeRef *conformerInternal;
  objc_super v4;

  conformerInternal = (CFTypeRef *)self->_conformerInternal;
  if (conformerInternal)
  {
    if (*conformerInternal)
    {
      CFRelease(*conformerInternal);
      conformerInternal = (CFTypeRef *)self->_conformerInternal;
    }
    free(conformerInternal);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVCaptionFormatConformer;
  -[AVCaptionFormatConformer dealloc](&v4, sel_dealloc);
}

- (BOOL)conformsCaptionTimeRange
{
  return *((_BYTE *)self->_conformerInternal + 8);
}

- (void)setConformsCaptionTimeRange:(BOOL)a3
{
  *((_BYTE *)self->_conformerInternal + 8) = a3;
}

- (AVCaption)conformedCaptionForCaption:(AVCaption *)caption error:(NSError *)outError
{
  OpaqueFigCaptionData *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, OpaqueFigCaptionData *, _OWORD *, CFTypeRef *, _OWORD *, _QWORD);
  signed int v11;
  AVCaption *v12;
  AVCaption *v13;
  __int128 *v14;
  __int128 v15;
  __int128 v16;
  _OWORD v18[3];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _OWORD v22[3];
  CFTypeRef cf;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _OWORD v27[3];

  v7 = -[AVCaption _figCaptionData](caption, "_figCaptionData");
  v25 = 0u;
  v26 = 0u;
  v24 = 0u;
  if (caption)
    -[AVCaption timeRange](caption, "timeRange");
  cf = 0;
  v8 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v22[0] = *MEMORY[0x1E0CA2E40];
  v22[1] = v8;
  v22[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  v9 = *(_QWORD *)self->_conformerInternal;
  v19 = v24;
  v20 = v25;
  v21 = v26;
  v10 = *(uint64_t (**)(uint64_t, OpaqueFigCaptionData *, _OWORD *, CFTypeRef *, _OWORD *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v10)
  {
    v11 = -12782;
    if (outError)
      goto LABEL_6;
LABEL_8:
    v12 = 0;
    goto LABEL_12;
  }
  v27[0] = v19;
  v27[1] = v20;
  v27[2] = v21;
  v11 = v10(v9, v7, v27, &cf, v22, 0);
  if (v11)
  {
    if (outError)
    {
LABEL_6:
      v12 = 0;
      *outError = (NSError *)AVLocalizedErrorWithUnderlyingOSStatus(v11, 0);
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  v13 = [AVCaption alloc];
  v14 = &v24;
  if (*((_BYTE *)self->_conformerInternal + 8))
    v14 = v22;
  v15 = v14[2];
  v16 = *v14;
  v18[1] = v14[1];
  v18[2] = v15;
  v18[0] = v16;
  v12 = -[AVCaption initWithFigCaptionData:timeRange:](v13, "initWithFigCaptionData:timeRange:", cf, v18);
LABEL_12:
  if (cf)
    CFRelease(cf);
  return v12;
}

@end
