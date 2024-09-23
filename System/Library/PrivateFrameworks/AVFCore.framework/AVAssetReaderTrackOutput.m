@implementation AVAssetReaderTrackOutput

+ (AVAssetReaderTrackOutput)assetReaderTrackOutputWithTrack:(AVAssetTrack *)track outputSettings:(NSDictionary *)outputSettings
{
  return (AVAssetReaderTrackOutput *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTrack:outputSettings:", track, outputSettings);
}

- (AVAssetReaderTrackOutput)init
{
  return -[AVAssetReaderTrackOutput initWithTrack:outputSettings:](self, "initWithTrack:outputSettings:", 0, 0);
}

- (AVAssetReaderTrackOutput)initWithTrack:(AVAssetTrack *)track outputSettings:(NSDictionary *)outputSettings
{
  AVAssetReaderTrackOutput *v7;
  AVAssetReaderTrackOutput *v8;
  AVAssetReaderTrackOutputInternal *v9;
  uint64_t v10;
  uint64_t v11;
  AVOutputSettings *v12;
  AVAssetReaderTrackOutput *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  AVAssetReaderTrackOutput *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  AVAssetReaderTrackOutput *v30;
  objc_class *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  AVAssetReaderTrackOutput *v37;
  objc_class *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  AVAssetReaderTrackOutput *v44;
  AVAssetReaderTrackOutput *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  AVAssetReaderTrackOutput *v56;
  uint64_t v57;
  NSString *v58;
  NSString *v59;
  const __CFString *v60;
  objc_super v61;

  v61.receiver = self;
  v61.super_class = (Class)AVAssetReaderTrackOutput;
  v7 = -[AVAssetReaderOutput init](&v61, sel_init);
  v8 = v7;
  if (!track)
  {
    v23 = v7;
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v29 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v24, v25, v26, v27, v28, (uint64_t)"track != nil");
    goto LABEL_22;
  }
  if (v7)
  {
    v9 = objc_alloc_init(AVAssetReaderTrackOutputInternal);
    v8->_trackOutputInternal = v9;
    if (!v9)
    {

      return 0;
    }
    CFRetain(v9);
    v8->_trackOutputInternal->track = track;
    v8->_trackOutputInternal->audioTimePitchAlgorithm = (NSString *)CFSTR("Spectral");
    v10 = -[AVAssetTrack mediaType](v8->_trackOutputInternal->track, "mediaType");
    if (outputSettings)
    {
      v11 = v10;
      if (-[NSDictionary objectForKey:](outputSettings, "objectForKey:", CFSTR("AVVideoCleanApertureKey"))
        || -[NSDictionary objectForKey:](outputSettings, "objectForKey:", CFSTR("AVVideoPixelAspectRatioKey")))
      {
        v30 = v8;
        v19 = (void *)MEMORY[0x1E0C99DA0];
        v20 = *MEMORY[0x1E0C99778];
        v31 = (objc_class *)objc_opt_class();
        v58 = NSStringFromClass(v31);
        v29 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, (uint64_t)CFSTR("%@ does not currently support AVVideoCleanApertureKey or AVVideoPixelAspectRatioKey"), v32, v33, v34, v35, v36, (uint64_t)v58);
      }
      else
      {
        if (!-[NSDictionary objectForKey:](outputSettings, "objectForKey:", CFSTR("AVVideoScalingModeKey")))
        {
          v60 = 0;
          v8->_trackOutputInternal->outputSettings = (AVOutputSettings *)+[AVOutputSettings _outputSettingsWithOutputSettingsDictionary:mediaType:exceptionReason:](AVOutputSettings, "_outputSettingsWithOutputSettingsDictionary:mediaType:exceptionReason:", outputSettings, v11, &v60);
          v12 = v8->_trackOutputInternal->outputSettings;
          if (!v12)
          {
            v44 = v8;
            v19 = (void *)MEMORY[0x1E0C99DA0];
            v20 = *MEMORY[0x1E0C99778];
            v21 = v60;
            goto LABEL_21;
          }
          if (!-[NSSet containsObject:](-[AVOutputSettings compatibleMediaTypes](v12, "compatibleMediaTypes"), "containsObject:", v11))
          {
            v45 = v8;
            v46 = (void *)MEMORY[0x1E0C99DA0];
            v47 = *MEMORY[0x1E0C99778];
            v53 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, (uint64_t)CFSTR("Output settings are not compatible with media type %@"), v48, v49, v50, v51, v52, v11);
            v54 = v46;
            v55 = v47;
            goto LABEL_23;
          }
          if (-[AVOutputSettings willYieldCompressedSamples](v8->_trackOutputInternal->outputSettings, "willYieldCompressedSamples"))
          {
            v56 = v8;
            v19 = (void *)MEMORY[0x1E0C99DA0];
            v20 = *MEMORY[0x1E0C99778];
            v21 = CFSTR("AVAssetReaderOutput does not currently support compressed output");
            goto LABEL_21;
          }
          if (-[NSDictionary objectForKey:](outputSettings, "objectForKey:", *MEMORY[0x1E0C89968]))
          {
            v13 = v8;
            v19 = (void *)MEMORY[0x1E0C99DA0];
            v20 = *MEMORY[0x1E0C99778];
            v21 = CFSTR("AVAssetReaderOutput does not support AVSampleRateConverterAudioQualityKey");
LABEL_21:
            v29 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, (uint64_t)v21, v14, v15, v16, v17, v18, v57);
            goto LABEL_22;
          }
          return v8;
        }
        v37 = v8;
        v19 = (void *)MEMORY[0x1E0C99DA0];
        v20 = *MEMORY[0x1E0C99778];
        v38 = (objc_class *)objc_opt_class();
        v59 = NSStringFromClass(v38);
        v29 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, (uint64_t)CFSTR("%@ does not currently support AVVideoScalingModeKey"), v39, v40, v41, v42, v43, (uint64_t)v59);
      }
LABEL_22:
      v53 = v29;
      v54 = v19;
      v55 = v20;
LABEL_23:
      objc_exception_throw((id)objc_msgSend(v54, "exceptionWithName:reason:userInfo:", v55, v53, 0));
    }
  }
  return v8;
}

- (void)dealloc
{
  AVAssetReaderTrackOutputInternal *trackOutputInternal;
  objc_super v4;

  trackOutputInternal = self->_trackOutputInternal;
  if (trackOutputInternal)
  {

    CFRelease(self->_trackOutputInternal);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAssetReaderTrackOutput;
  -[AVAssetReaderOutput dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, track = %@, outputSettings = %@>"), NSStringFromClass(v4), self, -[AVAssetReaderTrackOutput track](self, "track"), -[AVAssetReaderTrackOutput outputSettings](self, "outputSettings"));
}

- (AVAssetTrack)track
{
  return self->_trackOutputInternal->track;
}

- (NSDictionary)outputSettings
{
  return -[AVOutputSettings outputSettingsDictionary](self->_trackOutputInternal->outputSettings, "outputSettingsDictionary");
}

- (AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm
{
  return self->_trackOutputInternal->audioTimePitchAlgorithm;
}

- (void)setAudioTimePitchAlgorithm:(AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *valid;
  NSString *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (-[AVAssetReaderOutput _status](self, "_status") >= 1)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99768];
    v15 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("cannot be called after reading has started"), v6, v7, v8, v9, v10, v26);
    v16 = v13;
    v17 = v14;
    goto LABEL_8;
  }
  valid = (void *)AVGetValidAudioTimePitchAlgorithms();
  if ((objc_msgSend(valid, "containsObject:", audioTimePitchAlgorithm) & 1) == 0)
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99778];
    v20 = objc_msgSend((id)objc_msgSend(valid, "allObjects"), "componentsJoinedByString:", CFSTR(", "));
    v15 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("audioTimePitchAlgorithm must be one of: %@"), v21, v22, v23, v24, v25, v20);
    v16 = v18;
    v17 = v19;
LABEL_8:
    objc_exception_throw((id)objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, v15, 0));
  }
  v12 = self->_trackOutputInternal->audioTimePitchAlgorithm;
  if (v12 != audioTimePitchAlgorithm)
  {

    self->_trackOutputInternal->audioTimePitchAlgorithm = (NSString *)-[NSString copy](audioTimePitchAlgorithm, "copy");
  }
}

- (void)_setAttachedAdaptor:(id)a3
{

  self->_trackOutputInternal->weakReferenceToAttachedAdaptor = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", a3);
}

- (id)_attachedAdaptor
{
  return -[AVWeakReference referencedObject](self->_trackOutputInternal->weakReferenceToAttachedAdaptor, "referencedObject");
}

- (BOOL)_isAttachedToAdaptor
{
  return -[AVWeakReference referencedObject](self->_trackOutputInternal->weakReferenceToAttachedAdaptor, "referencedObject") != 0;
}

- (void)setAppliesPreferredTrackTransform:(BOOL)a3
{
  self->_trackOutputInternal->appliesPreferredTrackTransform = a3;
}

- (BOOL)appliesPreferredTrackTransform
{
  return self->_trackOutputInternal->appliesPreferredTrackTransform;
}

- (void)setLimitsImageQueueCapacityToOneFrame:(BOOL)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;

  if ((objc_msgSend(-[AVAssetReaderTrackOutput mediaType](self, "mediaType"), "isEqualToString:", CFSTR("vide")) & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = CFSTR("cannot use limitsImageQueueCapacityToOneFrame for non video media type");
    goto LABEL_6;
  }
  if (-[AVAssetReaderOutput _status](self, "_status") >= 1)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = CFSTR("cannot be called after reading has started");
LABEL_6:
    v14 = (void *)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v13, v6, v7, v8, v9, v10, v15), 0);
    objc_exception_throw(v14);
  }
  self->_trackOutputInternal->limitsImageQueueCapacityToOneFrame = a3;
}

- (BOOL)limitsImageQueueCapacityToOneFrame
{
  return self->_trackOutputInternal->limitsImageQueueCapacityToOneFrame;
}

- (id)mediaType
{
  return -[AVAssetTrack mediaType](-[AVAssetReaderTrackOutput track](self, "track"), "mediaType");
}

- (opaqueCMSampleBuffer)copyNextSampleBuffer
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  objc_super v11;

  if (-[AVAssetReaderTrackOutput _isAttachedToAdaptor](self, "_isAttachedToAdaptor"))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("cannot copy sample buffers when attached to an adaptor"), v4, v5, v6, v7, v8, (uint64_t)v11.receiver), 0);
    objc_exception_throw(v10);
  }
  v11.receiver = self;
  v11.super_class = (Class)AVAssetReaderTrackOutput;
  return -[AVAssetReaderOutput copyNextSampleBuffer](&v11, sel_copyNextSampleBuffer);
}

- (opaqueCMSampleBuffer)_copyNextSampleBufferForAdaptor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetReaderTrackOutput;
  return -[AVAssetReaderOutput copyNextSampleBuffer](&v3, sel_copyNextSampleBuffer);
}

- (id)_asset
{
  return -[AVAssetTrack asset](-[AVAssetReaderTrackOutput track](self, "track"), "asset");
}

- (BOOL)_trimsSampleDurations
{
  if (self->_trackOutputInternal->outputSettings)
    return 1;
  else
    return objc_msgSend(-[AVAssetReaderTrackOutput mediaType](self, "mediaType"), "isEqual:", CFSTR("soun"));
}

- (id)_formatDescriptions
{
  return -[AVAssetTrack formatDescriptions](-[AVAssetReaderTrackOutput track](self, "track"), "formatDescriptions");
}

- (id)_figAssetReaderExtractionOptions
{
  id v4;
  _BOOL4 v5;
  _QWORD *v6;
  AVOutputSettings *outputSettings;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)AVAssetReaderTrackOutput;
  v4 = (id)-[NSDictionary mutableCopy](-[AVAssetReaderOutput _figAssetReaderExtractionOptions](&v28, sel__figAssetReaderExtractionOptions), "mutableCopy");
  v5 = -[AVAssetReaderTrackOutput appliesPreferredTrackTransform](self, "appliesPreferredTrackTransform");
  v6 = (_QWORD *)MEMORY[0x1E0CC3B18];
  if (!v5)
    v6 = (_QWORD *)MEMORY[0x1E0CC3B20];
  objc_msgSend(v4, "setObject:forKey:", *v6, *MEMORY[0x1E0CC3B00]);
  outputSettings = self->_trackOutputInternal->outputSettings;
  if ((objc_msgSend(-[AVAssetReaderTrackOutput mediaType](self, "mediaType"), "isEqualToString:", CFSTR("vide")) & 1) == 0
    && (objc_msgSend(-[AVAssetReaderTrackOutput mediaType](self, "mediaType"), "isEqualToString:", CFSTR("auxv")) & 1) == 0
    && !objc_msgSend(-[AVAssetReaderTrackOutput mediaType](self, "mediaType"), "isEqualToString:", CFSTR("scen")))
  {
    if (!-[AVAssetReaderTrackOutput limitsImageQueueCapacityToOneFrame](self, "limitsImageQueueCapacityToOneFrame"))
      return v4;
    goto LABEL_30;
  }
  v8 = objc_msgSend((id)-[AVOutputSettings frameRateConversionAlgorithm](outputSettings, "frameRateConversionAlgorithm"), "isEqualToString:", CFSTR("AVVideoFrameRateConversionAlgorithmFast"));
  v9 = (_QWORD *)MEMORY[0x1E0CC5C98];
  if (!v8)
    v9 = (_QWORD *)MEMORY[0x1E0CC5CA0];
  objc_msgSend(v4, "setObject:forKey:", *v9, *MEMORY[0x1E0CC5CC0]);
  if (-[AVOutputSettings conformsToProtocol:](outputSettings, "conformsToProtocol:", &unk_1EE2DE458))
  {
    v10 = -[AVOutputSettings fieldMode](outputSettings, "fieldMode");
    if (v10)
      objc_msgSend(v4, "setObject:forKey:", v10, *MEMORY[0x1E0CC3AF0]);
  }
  v11 = -[NSDictionary objectForKey:](-[AVAssetReaderTrackOutput outputSettings](self, "outputSettings"), "objectForKey:", CFSTR("AVVideoEmitSequencesAtSyncFramesOnly"));
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v24 = (void *)MEMORY[0x1E0C99DA0];
      v25 = *MEMORY[0x1E0C99778];
      v26 = CFSTR("AVVideoEmitSequencesAtSyncFramesOnly value must be NSNumber");
      goto LABEL_32;
    }
    objc_msgSend(v4, "setObject:forKey:", v11, *MEMORY[0x1E0CC5CB0]);
  }
  v17 = -[NSDictionary objectForKey:](-[AVAssetReaderTrackOutput outputSettings](self, "outputSettings"), "objectForKey:", CFSTR("AVVideoMinimumIntervalForSyncFrames"));
  if (v17)
    objc_msgSend(v4, "setObject:forKey:", v17, *MEMORY[0x1E0CC5CB8]);
  v18 = -[NSDictionary objectForKey:](-[AVAssetReaderTrackOutput outputSettings](self, "outputSettings"), "objectForKey:", CFSTR("AVVideoAverageIntervalForSyncFramesKey"));
  if (v18)
  {
    v19 = v18;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v24 = (void *)MEMORY[0x1E0C99DA0];
      v25 = *MEMORY[0x1E0C99778];
      v26 = CFSTR("AVVideoAverageIntervalForSyncFramesKey value must be NSDictionary");
      goto LABEL_32;
    }
    objc_msgSend(v4, "setObject:forKey:", v19, *MEMORY[0x1E0CC5CA8]);
    if (v17)
    {
      v24 = (void *)MEMORY[0x1E0C99DA0];
      v25 = *MEMORY[0x1E0C99778];
      v26 = CFSTR("cannot use AVVideoMinimumIntervalForSyncFrames and AVVideoAverageIntervalForSyncFramesKey at the same time");
      goto LABEL_32;
    }
  }
  v20 = -[NSDictionary objectForKey:](-[AVAssetReaderTrackOutput outputSettings](self, "outputSettings"), "objectForKey:", CFSTR("AVVideoDecompressionPropertiesKey"));
  v21 = *MEMORY[0x1E0CED398];
  v22 = objc_msgSend(v20, "objectForKey:", *MEMORY[0x1E0CED398]);
  if (v22)
    objc_msgSend(v4, "setObject:forKey:", v22, v21);
  if (-[AVAssetReaderTrackOutput limitsImageQueueCapacityToOneFrame](self, "limitsImageQueueCapacityToOneFrame"))
  {
    if (v11)
    {
      if (objc_msgSend(v11, "integerValue") == 1)
      {
        objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CC3AF8]);
        return v4;
      }
      v24 = (void *)MEMORY[0x1E0C99DA0];
      v25 = *MEMORY[0x1E0C99778];
      v26 = CFSTR("cannot use limitsImageQueueCapacityToOneFrame without AVVideoEmitSequencesAtSyncFramesOnly set to 1");
LABEL_32:
      v27 = (void *)objc_msgSend(v24, "exceptionWithName:reason:userInfo:", v25, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v26, v12, v13, v14, v15, v16, (uint64_t)v28.receiver), 0);
      objc_exception_throw(v27);
    }
LABEL_30:
    v24 = (void *)MEMORY[0x1E0C99DA0];
    v25 = *MEMORY[0x1E0C99778];
    v26 = CFSTR("cannot use limitsImageQueueCapacityToOneFrame without AVVideoEmitSequencesAtSyncFramesOnly");
    goto LABEL_32;
  }
  return v4;
}

- (unsigned)_getUniformMediaSubtypeIfExists
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  FourCharCode MediaSubType;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = -[AVAssetTrack formatDescriptions](-[AVAssetReaderTrackOutput track](self, "track"), "formatDescriptions");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
LABEL_3:
    v7 = 0;
    v8 = v5;
    while (1)
    {
      if (*(_QWORD *)v12 != v6)
        objc_enumerationMutation(v2);
      MediaSubType = CMFormatDescriptionGetMediaSubType(*(CMFormatDescriptionRef *)(*((_QWORD *)&v11 + 1) + 8 * v7));
      v5 = MediaSubType;
      if (v8)
      {
        if (v8 != MediaSubType)
          break;
      }
      ++v7;
      v8 = MediaSubType;
      if (v4 == v7)
      {
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v4)
          goto LABEL_3;
        return v5;
      }
    }
  }
  return 0;
}

- (BOOL)_enableTrackExtractionReturningError:(id *)a3
{
  OpaqueFigAssetReader *v5;
  uint64_t v6;
  id v7;
  AVOutputSettings *outputSettings;
  id v9;
  id *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t (*v16)(OpaqueFigAssetReader *, _QWORD, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, void *, _QWORD, __int128 *, id, unsigned int *);
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t (*v22)(OpaqueFigAssetReader *, uint64_t, uint64_t, id, __int128 *, id, unsigned int *);
  uint64_t (*v23)(OpaqueFigAssetReader *, uint64_t, id, unsigned int *);
  uint64_t v24;
  BOOL result;
  id v26;
  _BOOL4 v27;
  NSArray *v28;
  uint64_t v29;
  unsigned int v30;
  int v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(OpaqueFigAssetReader *, _QWORD, __int128 *, uint64_t, void *, uint64_t, uint64_t, id, unsigned int *);
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  unsigned int v51;

  v51 = -1;
  v5 = -[AVAssetReaderOutput _figAssetReader](self, "_figAssetReader");
  v6 = -[AVAssetTrack trackID](-[AVAssetReaderTrackOutput track](self, "track"), "trackID");
  v7 = -[AVAssetReaderTrackOutput _figAssetReaderExtractionOptions](self, "_figAssetReaderExtractionOptions");
  outputSettings = self->_trackOutputInternal->outputSettings;
  if (outputSettings)
  {
    if ((objc_msgSend(-[AVAssetReaderTrackOutput mediaType](self, "mediaType"), "isEqualToString:", CFSTR("vide")) & 1) != 0
      || (objc_msgSend(-[AVAssetReaderTrackOutput mediaType](self, "mediaType"), "isEqualToString:", CFSTR("auxv")) & 1) != 0
      || objc_msgSend(-[AVAssetReaderTrackOutput mediaType](self, "mediaType"), "isEqualToString:", CFSTR("scen")))
    {
      if (-[AVOutputSettings willYieldCompressedSamples](outputSettings, "willYieldCompressedSamples"))
      {
        v41 = v6;
        v9 = v7;
        v10 = a3;
        v40 = -[AVOutputSettings videoCodecType](outputSettings, "videoCodecType");
        v11 = -[AVOutputSettings width](outputSettings, "width");
        v12 = -[AVOutputSettings height](outputSettings, "height");
        v13 = -[AVOutputSettings videoEncoderSpecification](outputSettings, "videoEncoderSpecification");
        v14 = -[AVOutputSettings pixelTransferProperties](outputSettings, "pixelTransferProperties");
        v15 = (void *)-[AVOutputSettings videoCompressionProperties](outputSettings, "videoCompressionProperties");
        if (v14)
        {
          v15 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v15);
          objc_msgSend(v15, "setObject:forKey:", v14, *MEMORY[0x1E0CED148]);
        }
        -[AVOutputSettings minimumFrameDuration](outputSettings, "minimumFrameDuration");
        v16 = *(uint64_t (**)(OpaqueFigAssetReader *, _QWORD, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, void *, _QWORD, __int128 *, id, unsigned int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 72);
        if (v16)
        {
          v44 = v49;
          *(_QWORD *)&v45 = v50;
          v17 = v16(v5, v41, v11, v12, 0, v40, v13, v15, 0, &v44, v9, &v51);
          a3 = v10;
          if (!(_DWORD)v17)
            goto LABEL_18;
        }
        else
        {
          v17 = 4294954514;
          a3 = v10;
        }
        goto LABEL_22;
      }
      v20 = -[AVOutputSettings pixelBufferAttributes](outputSettings, "pixelBufferAttributes");
      v21 = +[AVAssetReaderOutput _figAssetReaderVideoScalingPropertiesFromVideoSettings:withFormatDescription:](AVAssetReaderOutput, "_figAssetReaderVideoScalingPropertiesFromVideoSettings:withFormatDescription:", outputSettings, -[AVAssetReaderTrackOutput _formatDescriptions](self, "_formatDescriptions"));
      -[AVOutputSettings minimumFrameDuration](outputSettings, "minimumFrameDuration");
      v22 = *(uint64_t (**)(OpaqueFigAssetReader *, uint64_t, uint64_t, id, __int128 *, id, unsigned int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
      if (v22)
      {
        v44 = v47;
        *(_QWORD *)&v45 = v48;
        v19 = v22(v5, v6, v20, v21, &v44, v7, &v51);
        goto LABEL_17;
      }
LABEL_20:
      v17 = 4294954514;
      goto LABEL_22;
    }
    if (objc_msgSend(-[AVAssetReaderTrackOutput mediaType](self, "mediaType"), "isEqualToString:", CFSTR("soun")))
    {
      v27 = -[AVOutputSettings willYieldCompressedSamples](outputSettings, "willYieldCompressedSamples");
      v28 = -[AVAssetTrack formatDescriptions](-[AVAssetReaderTrackOutput track](self, "track"), "formatDescriptions");
      v42 = v6;
      if (-[NSArray count](v28, "count"))
        v29 = -[NSArray objectAtIndex:](v28, "objectAtIndex:", 0);
      else
        v29 = 0;
      v46 = 0;
      v44 = 0u;
      v45 = 0u;
      v43 = 0;
      v34 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", AVAssetReaderGetFigAssetReaderAudioTimePitchAlgorithmForAudioTimePitchAlgorithm(self->_trackOutputInternal->audioTimePitchAlgorithm), *MEMORY[0x1E0CC3AC0], 0);
      -[AVOutputSettings getAudioStreamBasicDescription:forAudioFileTypeID:sourceFormatDescription:](outputSettings, "getAudioStreamBasicDescription:forAudioFileTypeID:sourceFormatDescription:", &v44, 0, v29);
      v35 = (void *)-[AVOutputSettings copyAudioChannelLayoutForSourceFormatDescription:audioChannelLayoutSize:](outputSettings, "copyAudioChannelLayoutForSourceFormatDescription:audioChannelLayoutSize:", v29, &v43);
      v36 = -[AVOutputSettings audioOptions](outputSettings, "audioOptions");
      v37 = v43;
      v38 = *(_QWORD *)(CMBaseObjectGetVTable() + 16);
      if (v27)
      {
        v39 = *(uint64_t (**)(OpaqueFigAssetReader *, _QWORD, __int128 *, uint64_t, void *, uint64_t, uint64_t, id, unsigned int *))(v38 + 56);
        if (!v39)
        {
LABEL_39:
          v17 = 4294954514;
          goto LABEL_42;
        }
      }
      else
      {
        v39 = *(uint64_t (**)(OpaqueFigAssetReader *, _QWORD, __int128 *, uint64_t, void *, uint64_t, uint64_t, id, unsigned int *))(v38 + 112);
        if (!v39)
          goto LABEL_39;
      }
      v17 = v39(v5, v42, &v44, v37, v35, v36, v34, v7, &v51);
LABEL_42:
      free(v35);
      if (!(_DWORD)v17)
        goto LABEL_18;
      goto LABEL_22;
    }
    if (objc_msgSend(-[AVAssetReaderTrackOutput mediaType](self, "mediaType"), "isEqualToString:", CFSTR("text")))
    {
      v30 = -[AVAssetReaderTrackOutput _getUniformMediaSubtypeIfExists](self, "_getUniformMediaSubtypeIfExists");
      v31 = 1634301044;
    }
    else
    {
      if (!objc_msgSend(-[AVAssetReaderTrackOutput mediaType](self, "mediaType"), "isEqualToString:", CFSTR("clcp")))
      {
LABEL_35:
        v24 = 0xFFFFFFFFLL;
        goto LABEL_19;
      }
      v30 = -[AVAssetReaderTrackOutput _getUniformMediaSubtypeIfExists](self, "_getUniformMediaSubtypeIfExists");
      v31 = 1664495672;
    }
    if (v30 != v31)
      goto LABEL_35;
    v32 = -[AVAssetReaderTrackOutput _attachedAdaptor](self, "_attachedAdaptor");
    if (!v32)
      goto LABEL_35;
    v33 = v32;
    if (-[NSDictionary count](-[AVOutputSettings outputSettingsDictionary](outputSettings, "outputSettingsDictionary"), "count"))
    {
      goto LABEL_35;
    }
    v18 = v33;
LABEL_12:
    v19 = objc_msgSend(v18, "addExtractionForOutput:figAssetReader:options:withOutputExtactionID:", self, v5, v7, &v51);
    goto LABEL_17;
  }
  v18 = -[AVAssetReaderTrackOutput _attachedAdaptor](self, "_attachedAdaptor");
  if (v18)
    goto LABEL_12;
  v23 = *(uint64_t (**)(OpaqueFigAssetReader *, uint64_t, id, unsigned int *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                  + 16)
                                                                                      + 24);
  if (!v23)
    goto LABEL_20;
  v19 = v23(v5, v6, v7, &v51);
LABEL_17:
  v17 = v19;
  if (!(_DWORD)v19)
  {
LABEL_18:
    v24 = v51;
LABEL_19:
    -[AVAssetReaderOutput _setExtractionID:](self, "_setExtractionID:", v24);
    return 1;
  }
LABEL_22:
  if (!a3)
    return 0;
  v26 = +[AVAssetReader _errorForOSStatus:](AVAssetReader, "_errorForOSStatus:", v17);
  result = 0;
  *a3 = v26;
  return result;
}

@end
