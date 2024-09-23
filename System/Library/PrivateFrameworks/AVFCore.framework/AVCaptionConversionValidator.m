@implementation AVCaptionConversionValidator

+ (AVCaptionConversionValidator)captionConversionValidatorWithCaptions:(NSArray *)captions timeRange:(CMTimeRange *)timeRange conversionSettings:(NSDictionary *)conversionSettings
{
  id v8;
  __int128 v9;
  _OWORD v11[3];

  v8 = objc_alloc((Class)objc_opt_class());
  v9 = *(_OWORD *)&timeRange->start.epoch;
  v11[0] = *(_OWORD *)&timeRange->start.value;
  v11[1] = v9;
  v11[2] = *(_OWORD *)&timeRange->duration.timescale;
  return (AVCaptionConversionValidator *)(id)objc_msgSend(v8, "initWithCaptions:timeRange:conversionSettings:", captions, v11, conversionSettings);
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

- (AVCaptionConversionValidator)initWithCaptions:(NSArray *)captions timeRange:(CMTimeRange *)timeRange conversionSettings:(NSDictionary *)conversionSettings
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  AVCaptionConversionValidator *v16;
  void *v17;
  uint64_t v18;
  _QWORD *validatorInternal;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  _QWORD *v23;
  NSObject *v24;
  dispatch_queue_t v25;
  _QWORD *v26;
  AVCaptionConversionValidator *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  objc_super v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!-[AVCaptionConversionValidator _isConversionToClosedCaptions:](self, "_isConversionToClosedCaptions:", conversionSettings))
  {
    v28 = self;
    v34 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("supports conversions only to mediaType 'clcp' and mediaSubType 'c608'"), v29, v30, v31, v32, v33, (uint64_t)v35.receiver), 0);
    objc_exception_throw(v34);
  }
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](captions, "count"));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](captions, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v37;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(captions);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v14), "copy");
        if (v15)
          objc_msgSend(v10, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](captions, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v12);
  }
  v35.receiver = self;
  v35.super_class = (Class)AVCaptionConversionValidator;
  v16 = -[AVCaptionConversionValidator init](&v35, sel_init);
  if (v16)
  {
    v17 = malloc_type_calloc(1uLL, 0x68uLL, 0x10800408555C317uLL);
    v16->_validatorInternal = v17;
    if (v17)
    {
      *(_QWORD *)v16->_validatorInternal = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v16);
      v18 = objc_msgSend(v10, "copy");
      validatorInternal = v16->_validatorInternal;
      validatorInternal[1] = v18;
      v20 = *(_OWORD *)&timeRange->start.value;
      v21 = *(_OWORD *)&timeRange->duration.timescale;
      *((_OWORD *)validatorInternal + 2) = *(_OWORD *)&timeRange->start.epoch;
      *((_OWORD *)validatorInternal + 3) = v21;
      *((_OWORD *)validatorInternal + 1) = v20;
      v22 = -[NSDictionary copy](conversionSettings, "copy");
      v23 = v16->_validatorInternal;
      v23[8] = v22;
      v23[11] = 0;
      v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v25 = dispatch_queue_create("com.apple.avcaptionconversionvalidator", v24);
      v26 = v16->_validatorInternal;
      v26[9] = v25;
      v26[10] = 0;
      *((_QWORD *)v16->_validatorInternal + 12) = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    }
    else
    {

      return 0;
    }
  }
  return v16;
}

- (void)dealloc
{
  id *validatorInternal;
  dispatch_object_t *v4;
  objc_super v5;

  validatorInternal = (id *)self->_validatorInternal;
  if (validatorInternal)
  {

    v4 = (dispatch_object_t *)self->_validatorInternal;
    if (v4[9])
    {
      dispatch_release(v4[9]);
      v4 = (dispatch_object_t *)self->_validatorInternal;
    }
    free(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVCaptionConversionValidator;
  -[AVCaptionConversionValidator dealloc](&v5, sel_dealloc);
}

- (AVCaptionConversionValidatorStatus)status
{
  NSObject *v2;
  AVCaptionConversionValidatorStatus v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v2 = *((_QWORD *)self->_validatorInternal + 9);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__AVCaptionConversionValidator_status__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v2, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__AVCaptionConversionValidator_status__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 88);
  return result;
}

- (NSArray)captions
{
  return (NSArray *)*((_QWORD *)self->_validatorInternal + 1);
}

- (CMTimeRange)timeRange
{
  _OWORD *v3;
  __int128 v4;

  v3 = *(_OWORD **)&self->start.timescale;
  v4 = v3[2];
  *(_OWORD *)&retstr->start.value = v3[1];
  *(_OWORD *)&retstr->start.epoch = v4;
  *(_OWORD *)&retstr->duration.timescale = v3[3];
  return self;
}

- (void)_completeValidation
{
  NSObject *v2;
  uint64_t v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = 0;
  v2 = *((_QWORD *)self->_validatorInternal + 9);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__AVCaptionConversionValidator__completeValidation__block_invoke;
  v4[3] = &unk_1E302FDB0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(v2, v4);
  v3 = v6[5];
  if (v3)
  {
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);

  }
  _Block_object_dispose(&v5, 8);
}

uint64_t __51__AVCaptionConversionValidator__completeValidation__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(uint64_t *)(v1 + 88) <= 1)
  {
    *(_QWORD *)(v1 + 88) = 2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                            + 8)
                                                                                + 80);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 80) = 0;
  }
  return result;
}

- (void)_issueWarningForFigDictionary:(__CFDictionary *)a3
{
  AVCaptionConversionWarning *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[8];
  _QWORD v8[3];
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v4 = +[AVCaptionConversionWarning captionConversionWarningWithFigDictionary:](AVCaptionConversionWarning, "captionConversionWarningWithFigDictionary:", a3);
  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  v15 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 1;
  v5 = *((_QWORD *)self->_validatorInternal + 9);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__AVCaptionConversionValidator__issueWarningForFigDictionary___block_invoke;
  v7[3] = &unk_1E302FF70;
  v7[6] = v8;
  v7[7] = &v10;
  v7[4] = self;
  v7[5] = v4;
  dispatch_sync(v5, v7);
  if (v4)
  {
    v6 = v11[5];
    if (v6)
      (*(void (**)(uint64_t, AVCaptionConversionWarning *))(v6 + 16))(v6, v4);
  }
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v10, 8);
}

_QWORD *__62__AVCaptionConversionValidator__issueWarningForFigDictionary___block_invoke(_QWORD *result)
{
  *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 88) < 2;
  if (*(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(result[7] + 8) + 40) = *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 80);
    if (result[5])
      return (_QWORD *)objc_msgSend(*(id *)(*(_QWORD *)(result[4] + 8) + 96), "addObject:");
  }
  return result;
}

- (void)validateCaptionConversionWithWarningHandler:(void *)handler
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFAllocator *v14;
  _OWORD *validatorInternal;
  __int128 v16;
  CFDictionaryRef v17;
  uint64_t CMBaseObject;
  unsigned int (*v19)(uint64_t, _QWORD, CFDictionaryRef);
  NSObject *global_queue;
  void *v21;
  uint64_t v22[6];
  CMTimeRange range;
  uint64_t (*v24)(uint64_t, void *);
  uint64_t v25;
  _QWORD block[6];
  CFTypeRef v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v27 = 0;
  v6 = *((_QWORD *)self->_validatorInternal + 9);
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__AVCaptionConversionValidator_validateCaptionConversionWithWarningHandler___block_invoke;
  block[3] = &unk_1E302FDB0;
  block[4] = self;
  block[5] = &v28;
  dispatch_sync(v6, block);
  if (*((_BYTE *)v29 + 24))
  {
    v21 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("cannot be called after caption conversion validation has started"), v8, v9, v10, v11, v12, v22[0]), 0);
    objc_exception_throw(v21);
  }
  if (!-[AVCaptionConversionValidator _isConversionToClosedCaptions:](self, "_isConversionToClosedCaptions:", *((_QWORD *)self->_validatorInternal + 8))|| (v13 = *(_QWORD *)self->_validatorInternal, v24 = handleCaptionConversionWarning, v25 = v13, *((_QWORD *)self->_validatorInternal + 10) = objc_msgSend(handler, "copy"), v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00], FigCLCPCaptionConversionValidatorCreate()))
  {
    v17 = 0;
  }
  else
  {
    validatorInternal = self->_validatorInternal;
    v16 = validatorInternal[2];
    *(_OWORD *)&range.start.value = validatorInternal[1];
    *(_OWORD *)&range.start.epoch = v16;
    *(_OWORD *)&range.duration.timescale = validatorInternal[3];
    v17 = CMTimeRangeCopyAsDictionary(&range, v14);
    CMBaseObject = FigCaptionConversionValidatorGetCMBaseObject();
    v19 = *(unsigned int (**)(uint64_t, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 56);
    if (v19 && !v19(CMBaseObject, *MEMORY[0x1E0CC3F98], v17))
    {
      CFRetain(v27);
      global_queue = dispatch_get_global_queue(0, 0);
      v22[0] = v7;
      v22[1] = 3221225472;
      v22[2] = (uint64_t)__76__AVCaptionConversionValidator_validateCaptionConversionWithWarningHandler___block_invoke_2;
      v22[3] = (uint64_t)&unk_1E302FE78;
      v22[4] = v13;
      v22[5] = (uint64_t)v27;
      dispatch_async(global_queue, v22);
      goto LABEL_9;
    }
  }
  -[AVCaptionConversionValidator stopValidating](self, "stopValidating");
LABEL_9:
  if (v17)
    CFRelease(v17);
  if (v27)
    CFRelease(v27);
  _Block_object_dispose(&v28, 8);
}

uint64_t __76__AVCaptionConversionValidator_validateCaptionConversionWithWarningHandler___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(uint64_t *)(v1 + 88) < 1)
    *(_QWORD *)(v1 + 88) = 1;
  else
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __76__AVCaptionConversionValidator_validateCaptionConversionWithWarningHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, _OWORD *, _QWORD);
  void *v12;
  uint64_t v13;
  void (*v14)(uint64_t, _QWORD);
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[3];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "referencedObject"), "captions");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v9 = *(_QWORD *)(a1 + 40);
        v10 = objc_msgSend(v8, "_figCaptionData", v16, v17, v18);
        if (v8)
        {
          objc_msgSend(v8, "timeRange");
        }
        else
        {
          v17 = 0u;
          v18 = 0u;
          v16 = 0u;
        }
        v11 = *(void (**)(uint64_t, uint64_t, _OWORD *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
        if (v11)
        {
          v23[0] = v16;
          v23[1] = v17;
          v23[2] = v18;
          v11(v9, v10, v23, 0);
        }
        if (++v5 == 25)
        {
          v12 = (void *)objc_msgSend(*(id *)(a1 + 32), "referencedObject");
          if (!v12 || objc_msgSend(v12, "status") > 1)
            goto LABEL_17;
          v5 = 0;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v4);
  }
LABEL_17:
  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(void (**)(uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
  if (v14)
    v14(v13, 0);
  CFRelease(*(CFTypeRef *)(a1 + 40));
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "referencedObject"), "_completeValidation");
}

- (void)stopValidating
{
  NSObject *v2;
  void *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = 0;
  v2 = *((_QWORD *)self->_validatorInternal + 9);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__AVCaptionConversionValidator_stopValidating__block_invoke;
  v4[3] = &unk_1E302FDB0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(v2, v4);
  v3 = (void *)v6[5];
  if (v3)

  _Block_object_dispose(&v5, 8);
}

uint64_t __46__AVCaptionConversionValidator_stopValidating__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(uint64_t *)(v1 + 88) <= 1)
  {
    *(_QWORD *)(v1 + 88) = 3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                            + 8)
                                                                                + 80);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 80) = 0;
  }
  return result;
}

- (NSArray)warnings
{
  NSObject *v2;
  NSArray *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__13;
  v10 = __Block_byref_object_dispose__14;
  v11 = 0;
  v2 = *((_QWORD *)self->_validatorInternal + 9);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__AVCaptionConversionValidator_warnings__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v2, v5);
  v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__AVCaptionConversionValidator_warnings__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 96), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

+ (id)mutableCaptionArray
{
  return (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
}

@end
