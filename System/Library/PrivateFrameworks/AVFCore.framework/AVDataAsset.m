@implementation AVDataAsset

+ (unint64_t)_dataLengthLimit
{
  return 10485760;
}

+ (id)_getFigAssetCreationOptionsFromDataAssetInitializationOptions:(id)a3 figAssetCreationFlags:(unint64_t *)a4
{
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a3)
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  else
    v6 = 0;
  v7 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetReferenceRestrictionsKey"));
  if (v7)
    v8 = 4 * (objc_msgSend(v7, "unsignedIntegerValue") & 0xF);
  else
    v8 = 8;
  *a4 = v8;
  v9 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetPreferNominalDurationsKey"));
  if (v9)
  {
    if ((objc_msgSend(v9, "BOOLValue") & 1) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  if ((dyld_program_sdk_at_least() & 1) == 0)
LABEL_9:
    *a4 |= 0x100uLL;
LABEL_10:
  v10 = objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetPreferPreciseDurationAndTimingKey"));
  if (v10)
    objc_msgSend(v6, "setObject:forKey:", v10, *MEMORY[0x1E0CC3830]);
  v11 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetAllowableTypeCategoriesKey"));
  if (v11)
    objc_msgSend(v6, "setObject:forKey:", v11, *MEMORY[0x1E0CC36B0]);
  if (+[AVAsset _assetCreationOptionsRequiresInProcessOperation:](AVAsset, "_assetCreationOptionsRequiresInProcessOperation:", a3))
  {
    v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    objc_msgSend(v6, "setObject:forKey:", v12, *MEMORY[0x1E0CC3870]);
  }
  if (+[AVAsset _assetCreationOptionsPrefersSandboxedOption:](AVAsset, "_assetCreationOptionsPrefersSandboxedOption:", a3))
  {
    v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    objc_msgSend(v6, "setObject:forKey:", v13, *MEMORY[0x1E0CC3838]);
  }
  return v6;
}

- (AVDataAsset)initWithData:(id)a3 contentType:(id)a4 options:(id)a5
{
  AVDataAsset *v9;
  void *v10;
  uint64_t BlockBufferWithCFDataNoCopy;
  uint64_t v12;
  AVUnreachableAssetInspectorLoader *v13;
  AVFigAssetInspectorLoader *v15;
  AVDataAsset *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  CFTypeRef v24;
  CFTypeRef cf;
  objc_super v26;

  if ((unint64_t)objc_msgSend(a3, "length") > 0xA00000)
  {
    v16 = self;
    v22 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Data length cannot exceed %llu bytes"), v17, v18, v19, v20, v21, 10485760), 0);
    objc_exception_throw(v22);
  }
  v26.receiver = self;
  v26.super_class = (Class)AVDataAsset;
  v9 = -[AVAsset init](&v26, sel_init);
  if (v9)
  {
    v24 = 0;
    cf = 0;
    v10 = (void *)objc_msgSend(a3, "copy");
    v9->_initializationOptions = (NSDictionary *)objc_msgSend(a5, "copy");
    v9->_allocateTracksOnceOnly = objc_alloc_init(AVDispatchOnce);
    objc_msgSend(v10, "length");
    BlockBufferWithCFDataNoCopy = FigCreateBlockBufferWithCFDataNoCopy();
    if ((_DWORD)BlockBufferWithCFDataNoCopy
      || ((v23 = 0,
           +[AVDataAsset _getFigAssetCreationOptionsFromDataAssetInitializationOptions:figAssetCreationFlags:](AVDataAsset, "_getFigAssetCreationOptionsFromDataAssetInitializationOptions:figAssetCreationFlags:", v9->_initializationOptions, &v23), !+[AVAsset _assetCreationOptionsRequiresInProcessOperation:](AVAsset, "_assetCreationOptionsRequiresInProcessOperation:", v9->_initializationOptions))? (v12 = FigAssetRemoteCreateWithBlockBuffer()): (v12 = FigAssetCreateWithBlockBuffer()), BlockBufferWithCFDataNoCopy = v12, (_DWORD)v12))
    {
      v13 = -[AVUnreachableAssetInspectorLoader initWithFigError:userInfo:]([AVUnreachableAssetInspectorLoader alloc], "initWithFigError:userInfo:", BlockBufferWithCFDataNoCopy, 0);
    }
    else
    {
      v15 = [AVFigAssetInspectorLoader alloc];
      v13 = -[AVFigAssetInspectorLoader initWithFigAsset:forAsset:](v15, "initWithFigAsset:forAsset:", v24, v9);
    }
    v9->_loader = &v13->super;
    if (cf)
      CFRelease(cf);
    if (v24)
      CFRelease(v24);

    if (!v9->_loader)
    {

      return 0;
    }
  }
  return v9;
}

- (AVDataAsset)initWithData:(id)a3 contentType:(id)a4
{
  return -[AVDataAsset initWithData:contentType:options:](self, "initWithData:contentType:options:", a3, a4, 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVDataAsset;
  -[AVAsset dealloc](&v3, sel_dealloc);
}

- (id)_assetInspectorLoader
{
  return self->_loader;
}

- (id)_assetInspector
{
  return -[AVAssetInspectorLoader assetInspector](self->_loader, "assetInspector");
}

- (OpaqueFigFormatReader)_copyFormatReader
{
  return -[AVAssetInspectorLoader _copyFormatReader](self->_loader, "_copyFormatReader");
}

- (Class)_classForTrackInspectors
{
  return -[AVAssetInspectorLoader _classForTrackInspectors](self->_loader, "_classForTrackInspectors");
}

- (id)tracks
{
  AVDispatchOnce *allocateTracksOnceOnly;
  _QWORD v5[5];

  allocateTracksOnceOnly = self->_allocateTracksOnceOnly;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __21__AVDataAsset_tracks__block_invoke;
  v5[3] = &unk_1E302FA10;
  v5[4] = self;
  -[AVDispatchOnce runBlockOnce:](allocateTracksOnceOnly, "runBlockOnce:", v5);
  return self->_tracks;
}

uint64_t __21__AVDataAsset_tracks__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_tracksWithClass:", objc_opt_class()), "copy");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = result;
  return result;
}

- (unint64_t)referenceRestrictions
{
  if (-[NSDictionary objectForKey:](self->_initializationOptions, "objectForKey:", CFSTR("AVAssetReferenceRestrictionsKey")))
  {
    return objc_msgSend(-[NSDictionary objectForKey:](self->_initializationOptions, "objectForKey:", CFSTR("AVAssetReferenceRestrictionsKey")), "unsignedIntegerValue");
  }
  else
  {
    return 2;
  }
}

- (BOOL)_requiresInProcessOperation
{
  return +[AVAsset _assetCreationOptionsRequiresInProcessOperation:](AVAsset, "_assetCreationOptionsRequiresInProcessOperation:", self->_initializationOptions);
}

@end
