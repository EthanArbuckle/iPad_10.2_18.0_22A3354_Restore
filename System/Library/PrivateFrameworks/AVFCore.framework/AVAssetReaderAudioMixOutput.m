@implementation AVAssetReaderAudioMixOutput

+ (AVAssetReaderAudioMixOutput)assetReaderAudioMixOutputWithAudioTracks:(NSArray *)audioTracks audioSettings:(NSDictionary *)audioSettings
{
  return (AVAssetReaderAudioMixOutput *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAudioTracks:audioSettings:", audioTracks, audioSettings);
}

- (AVAssetReaderAudioMixOutput)init
{
  return -[AVAssetReaderAudioMixOutput initWithAudioTracks:audioSettings:](self, "initWithAudioTracks:audioSettings:", 0, 0);
}

- (AVAssetReaderAudioMixOutput)initWithAudioTracks:(NSArray *)audioTracks audioSettings:(NSDictionary *)audioSettings
{
  AVAssetReaderAudioMixOutput *v7;
  AVAssetReaderAudioMixOutput *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  AVAssetReaderAudioMixOutputInternal *v16;
  AVAudioOutputSettings *audioOutputSettings;
  AVAssetReaderAudioMixOutput *v18;
  AVAssetReaderAudioMixOutput *v20;
  AVAssetReaderAudioMixOutput *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  AVAssetReaderAudioMixOutput *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  AVAssetReaderAudioMixOutput *v38;
  AVAssetReaderAudioMixOutput *v39;
  AVAssetReaderAudioMixOutput *v40;
  uint64_t v41;
  const __CFString *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v47.receiver = self;
  v47.super_class = (Class)AVAssetReaderAudioMixOutput;
  v7 = -[AVAssetReaderOutput init](&v47, sel_init);
  v8 = v7;
  if (!audioTracks)
  {
    v31 = v7;
    v27 = (void *)MEMORY[0x1E0C99DA0];
    v28 = *MEMORY[0x1E0C99778];
    v37 = "audioTracks != nil";
LABEL_29:
    v30 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v32, v33, v34, v35, v36, (uint64_t)v37);
    goto LABEL_26;
  }
  if (!-[NSArray count](audioTracks, "count"))
  {
    v38 = v8;
    v27 = (void *)MEMORY[0x1E0C99DA0];
    v28 = *MEMORY[0x1E0C99778];
    v37 = "[audioTracks count] >= 1";
    goto LABEL_29;
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](audioTracks, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (!v9)
    goto LABEL_15;
  v10 = v9;
  v11 = 0;
  v12 = *(_QWORD *)v44;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v44 != v12)
        objc_enumerationMutation(audioTracks);
      v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
      if ((objc_msgSend((id)objc_msgSend(v14, "mediaType"), "isEqualToString:", CFSTR("soun")) & 1) == 0)
      {
        v20 = v8;
        v27 = (void *)MEMORY[0x1E0C99DA0];
        v28 = *MEMORY[0x1E0C99778];
        v29 = CFSTR("tracks must all have media type AVMediaTypeAudio");
        goto LABEL_25;
      }
      v15 = objc_msgSend(v14, "asset");
      if (v11)
      {
        if (v15 != v11)
        {
          v21 = v8;
          v27 = (void *)MEMORY[0x1E0C99DA0];
          v28 = *MEMORY[0x1E0C99778];
          v29 = CFSTR("tracks must all be part of the same AVAsset");
          goto LABEL_25;
        }
      }
      else
      {
        v11 = v15;
      }
    }
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](audioTracks, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  }
  while (v10);
LABEL_15:
  if (v8)
  {
    v16 = objc_alloc_init(AVAssetReaderAudioMixOutputInternal);
    v8->_audioMixOutputInternal = v16;
    if (!v16)
    {

      return 0;
    }
    CFRetain(v16);
    v8->_audioMixOutputInternal->audioTracks = (NSArray *)-[NSArray copyWithZone:](audioTracks, "copyWithZone:", -[AVAssetReaderAudioMixOutput zone](v8, "zone"));
    v8->_audioMixOutputInternal->audioCurvesForTracks = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSArray count](audioTracks, "count"));
    v8->_audioMixOutputInternal->audioTimePitchAlgorithmsForTracks = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSArray count](audioTracks, "count"));
    v8->_audioMixOutputInternal->audioTapProcessorsForTracks = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSArray count](audioTracks, "count"));
    v8->_audioMixOutputInternal->audioEffectsParametersForTracks = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSArray count](audioTracks, "count"));
    v8->_audioMixOutputInternal->audioTimePitchAlgorithm = (NSString *)CFSTR("Spectral");
    if (audioSettings)
    {
      v42 = 0;
      v8->_audioMixOutputInternal->audioOutputSettings = (AVAudioOutputSettings *)+[AVAudioOutputSettings _audioOutputSettingsWithAudioSettingsDictionary:exceptionReason:](AVAudioOutputSettings, "_audioOutputSettingsWithAudioSettingsDictionary:exceptionReason:", audioSettings, &v42);
      audioOutputSettings = v8->_audioMixOutputInternal->audioOutputSettings;
      if (audioOutputSettings)
      {
        if (!-[AVOutputSettings willYieldCompressedSamples](audioOutputSettings, "willYieldCompressedSamples"))
        {
          if (-[NSDictionary objectForKey:](audioSettings, "objectForKey:", *MEMORY[0x1E0C89968]))
          {
            v18 = v8;
            v27 = (void *)MEMORY[0x1E0C99DA0];
            v28 = *MEMORY[0x1E0C99778];
            v29 = CFSTR("AVAssetReaderOutput does not support AVSampleRateConverterAudioQualityKey");
            goto LABEL_25;
          }
          return v8;
        }
        v40 = v8;
        v27 = (void *)MEMORY[0x1E0C99DA0];
        v28 = *MEMORY[0x1E0C99778];
        v29 = CFSTR("AVAssetReaderOutput does not currently support compressed output");
      }
      else
      {
        v39 = v8;
        v27 = (void *)MEMORY[0x1E0C99DA0];
        v28 = *MEMORY[0x1E0C99778];
        v29 = v42;
      }
LABEL_25:
      v30 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, (uint64_t)v29, v22, v23, v24, v25, v26, v41);
LABEL_26:
      objc_exception_throw((id)objc_msgSend(v27, "exceptionWithName:reason:userInfo:", v28, v30, 0));
    }
  }
  return v8;
}

- (void)dealloc
{
  AVAssetReaderAudioMixOutputInternal *audioMixOutputInternal;
  objc_super v4;

  audioMixOutputInternal = self->_audioMixOutputInternal;
  if (audioMixOutputInternal)
  {

    CFRelease(self->_audioMixOutputInternal);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAssetReaderAudioMixOutput;
  -[AVAssetReaderOutput dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, audioTracks = %@, audioSettings = %@>"), NSStringFromClass(v4), self, -[AVAssetReaderAudioMixOutput audioTracks](self, "audioTracks"), -[AVAssetReaderAudioMixOutput audioSettings](self, "audioSettings"));
}

- (NSArray)audioTracks
{
  return self->_audioMixOutputInternal->audioTracks;
}

- (NSDictionary)audioSettings
{
  return -[AVAudioOutputSettings audioSettingsDictionary](self->_audioMixOutputInternal->audioOutputSettings, "audioSettingsDictionary");
}

- (id)_audioCurvesForTrack:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;

  if (!-[NSArray containsObject:](-[AVAssetReaderAudioMixOutput audioTracks](self, "audioTracks"), "containsObject:", a3))
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("track must be one of the tracks used to create the receiver"), v6, v7, v8, v9, v10, v13), 0);
    objc_exception_throw(v12);
  }
  return (id)-[NSMutableDictionary objectForKey:](self->_audioMixOutputInternal->audioCurvesForTracks, "objectForKey:", a3);
}

- (void)_setAudioCurves:(id)a3 forTrack:(id)a4
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableDictionary *audioCurvesForTracks;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;

  if (-[AVAssetReaderOutput _status](self, "_status") >= 1)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99768];
    v16 = CFSTR("cannot be called after reading has started");
    goto LABEL_8;
  }
  if (!-[NSArray containsObject:](-[AVAssetReaderAudioMixOutput audioTracks](self, "audioTracks"), "containsObject:", a4))
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v16 = CFSTR("track must be one of the tracks used to create the receiver");
LABEL_8:
    v17 = (void *)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v16, v8, v9, v10, v11, v12, v18), 0);
    objc_exception_throw(v17);
  }
  audioCurvesForTracks = self->_audioMixOutputInternal->audioCurvesForTracks;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](audioCurvesForTracks, "setObject:forKey:", a3, a4);
  else
    -[NSMutableDictionary removeObjectForKey:](audioCurvesForTracks, "removeObjectForKey:", a4);
}

- (id)_audioEffectsParametersForTrack:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;

  if (!-[NSArray containsObject:](-[AVAssetReaderAudioMixOutput audioTracks](self, "audioTracks"), "containsObject:", a3))
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("track must be one of the tracks used to create the receiver"), v6, v7, v8, v9, v10, v13), 0);
    objc_exception_throw(v12);
  }
  return (id)-[NSMutableDictionary objectForKey:](self->_audioMixOutputInternal->audioEffectsParametersForTracks, "objectForKey:", a3);
}

- (void)_setAudioEffectsParameters:(id)a3 forTrack:(id)a4
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableDictionary *audioEffectsParametersForTracks;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;

  if (-[AVAssetReaderOutput _status](self, "_status") >= 1)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99768];
    v16 = CFSTR("cannot be called after reading has started");
    goto LABEL_8;
  }
  if (!-[NSArray containsObject:](-[AVAssetReaderAudioMixOutput audioTracks](self, "audioTracks"), "containsObject:", a4))
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v16 = CFSTR("track must be one of the tracks used to create the receiver");
LABEL_8:
    v17 = (void *)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v16, v8, v9, v10, v11, v12, v18), 0);
    objc_exception_throw(v17);
  }
  audioEffectsParametersForTracks = self->_audioMixOutputInternal->audioEffectsParametersForTracks;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](audioEffectsParametersForTracks, "setObject:forKey:", a3, a4);
  else
    -[NSMutableDictionary removeObjectForKey:](audioEffectsParametersForTracks, "removeObjectForKey:", a4);
}

- (id)_audioTimePitchAlgorithmForTrack:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;

  if (!-[NSArray containsObject:](-[AVAssetReaderAudioMixOutput audioTracks](self, "audioTracks"), "containsObject:", a3))
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("track must be one of the tracks used to create the receiver"), v6, v7, v8, v9, v10, v13), 0);
    objc_exception_throw(v12);
  }
  return (id)-[NSMutableDictionary objectForKey:](self->_audioMixOutputInternal->audioTimePitchAlgorithmsForTracks, "objectForKey:", a3);
}

- (void)_setAudioTimePitchAlgorithm:(id)a3 forTrack:(id)a4
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  AVAssetReaderAudioMixOutputInternal *audioMixOutputInternal;
  NSMutableDictionary *audioTimePitchAlgorithmsForTracks;
  void *valid;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;

  if (-[AVAssetReaderOutput _status](self, "_status") >= 1)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99768];
    v18 = CFSTR("cannot be called after reading has started");
    goto LABEL_10;
  }
  if (!-[NSArray containsObject:](-[AVAssetReaderAudioMixOutput audioTracks](self, "audioTracks"), "containsObject:", a4))
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = CFSTR("track must be one of the tracks used to create the receiver");
    goto LABEL_10;
  }
  audioMixOutputInternal = self->_audioMixOutputInternal;
  audioTimePitchAlgorithmsForTracks = audioMixOutputInternal->audioTimePitchAlgorithmsForTracks;
  if (a3)
  {
    valid = (void *)AVGetValidAudioTimePitchAlgorithms();
    if ((objc_msgSend(valid, "containsObject:", a3) & 1) != 0)
    {
      -[NSMutableDictionary setObject:forKey:](audioTimePitchAlgorithmsForTracks, "setObject:forKey:", a3, a4);
      return;
    }
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v20 = objc_msgSend((id)objc_msgSend(valid, "allObjects"), "componentsJoinedByString:", CFSTR(", "));
    v18 = CFSTR("audioTimePitchAlgorithm must be one of: %@");
LABEL_10:
    v19 = (void *)objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v18, v8, v9, v10, v11, v12, v20), 0);
    objc_exception_throw(v19);
  }
  -[NSMutableDictionary removeObjectForKey:](audioMixOutputInternal->audioTimePitchAlgorithmsForTracks, "removeObjectForKey:", a4);
}

- (opaqueMTAudioProcessingTap)_audioTapProcessorForTrack:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;

  if (!-[NSArray containsObject:](-[AVAssetReaderAudioMixOutput audioTracks](self, "audioTracks"), "containsObject:", a3))
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("track must be one of the tracks used to create the receiver"), v6, v7, v8, v9, v10, v13), 0);
    objc_exception_throw(v12);
  }
  return (opaqueMTAudioProcessingTap *)-[NSMutableDictionary objectForKey:](self->_audioMixOutputInternal->audioTapProcessorsForTracks, "objectForKey:", a3);
}

- (void)_setAudioTapProcessor:(opaqueMTAudioProcessingTap *)a3 forTrack:(id)a4
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableDictionary *audioTapProcessorsForTracks;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;

  if (-[AVAssetReaderOutput _status](self, "_status") >= 1)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99768];
    v16 = CFSTR("cannot be called after reading has started");
    goto LABEL_8;
  }
  if (!-[NSArray containsObject:](-[AVAssetReaderAudioMixOutput audioTracks](self, "audioTracks"), "containsObject:", a4))
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v16 = CFSTR("track must be one of the tracks used to create the receiver");
LABEL_8:
    v17 = (void *)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v16, v8, v9, v10, v11, v12, v18), 0);
    objc_exception_throw(v17);
  }
  audioTapProcessorsForTracks = self->_audioMixOutputInternal->audioTapProcessorsForTracks;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](audioTapProcessorsForTracks, "setObject:forKey:", a3, a4);
  else
    -[NSMutableDictionary removeObjectForKey:](audioTapProcessorsForTracks, "removeObjectForKey:", a4);
}

- (AVAudioMix)audioMix
{
  return self->_audioMixOutputInternal->audioMix;
}

- (void)setAudioMix:(AVAudioMix *)audioMix
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AVAudioMix *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[AVAssetReaderOutput _status](self, "_status") >= 1)
  {
    v20 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("cannot be called after reading has started"), v6, v7, v8, v9, v10, v21), 0);
    objc_exception_throw(v20);
  }
  v11 = self->_audioMixOutputInternal->audioMix;
  if (v11 != audioMix)
  {

    self->_audioMixOutputInternal->audioMix = (AVAudioMix *)-[AVAudioMix copyWithZone:](audioMix, "copyWithZone:", -[AVAssetReaderAudioMixOutput zone](self, "zone"));
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = -[AVAssetReaderAudioMixOutput audioTracks](self, "audioTracks", 0);
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v18 = -[AVAudioMix audioMixInputParametersForTrackID:](self->_audioMixOutputInternal->audioMix, "audioMixInputParametersForTrackID:", objc_msgSend(v17, "trackID"));
          v19 = objc_msgSend(v18, "audioTapProcessor");
          -[AVAssetReaderAudioMixOutput _setAudioCurves:forTrack:](self, "_setAudioCurves:forTrack:", objc_msgSend(v18, "_figAudioCurves"), v17);
          -[AVAssetReaderAudioMixOutput _setAudioTimePitchAlgorithm:forTrack:](self, "_setAudioTimePitchAlgorithm:forTrack:", objc_msgSend(v18, "audioTimePitchAlgorithm"), v17);
          -[AVAssetReaderAudioMixOutput _setAudioTapProcessor:forTrack:](self, "_setAudioTapProcessor:forTrack:", v19, v17);
          -[AVAssetReaderAudioMixOutput _setAudioEffectsParameters:forTrack:](self, "_setAudioEffectsParameters:forTrack:", objc_msgSend(v18, "effects"), v17);
        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }
  }
}

- (AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm
{
  return self->_audioMixOutputInternal->audioTimePitchAlgorithm;
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
  v12 = self->_audioMixOutputInternal->audioTimePitchAlgorithm;
  if (v12 != audioTimePitchAlgorithm)
  {

    self->_audioMixOutputInternal->audioTimePitchAlgorithm = (NSString *)-[NSString copy](audioTimePitchAlgorithm, "copy");
  }
}

- (id)mediaType
{
  return (id)objc_msgSend(-[NSArray objectAtIndex:](-[AVAssetReaderAudioMixOutput audioTracks](self, "audioTracks"), "objectAtIndex:", 0), "mediaType");
}

- (id)_asset
{
  return (id)objc_msgSend(-[NSArray objectAtIndex:](-[AVAssetReaderAudioMixOutput audioTracks](self, "audioTracks"), "objectAtIndex:", 0), "asset");
}

- (BOOL)_enableTrackExtractionReturningError:(id *)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  id v15;
  opaqueMTAudioProcessingTap *v16;
  id v17;
  void *v18;
  uint64_t v19;
  AVAudioOutputSettings *audioOutputSettings;
  void *v21;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  const opaqueCMFormatDescription *v28;
  _DWORD *v29;
  id v30;
  BOOL result;
  const AudioStreamBasicDescription *StreamBasicDescription;
  uint64_t v33;
  __int128 v34;
  OpaqueFigAssetReader *v35;
  size_t v36;
  uint64_t (*v37)(OpaqueFigAssetReader *, void *, __int128 *, size_t, _DWORD *, AVAudioOutputSettings *, uint64_t, NSDictionary *, unsigned int *);
  NSDictionary *v38;
  uint64_t v39;
  NSArray *obj;
  uint64_t v42;
  void *v43;
  CMAudioFormatDescriptionRef formatDescriptionOut;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  size_t v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  unsigned int v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v57 = -1;
  v4 = -[AVAssetReaderAudioMixOutput audioTracks](self, "audioTracks");
  v43 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v4, "count"));
  v56 = 0;
  v54 = 0u;
  v55 = 0u;
  v53 = 0;
  v39 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", AVAssetReaderGetFigAssetReaderAudioTimePitchAlgorithmForAudioTimePitchAlgorithm(self->_audioMixOutputInternal->audioTimePitchAlgorithm), *MEMORY[0x1E0CC3AC0], 0);
  v38 = -[AVAssetReaderOutput _figAssetReaderExtractionOptions](self, "_figAssetReaderExtractionOptions");
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v4;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v50;
    v8 = *MEMORY[0x1E0CC3B70];
    v42 = *MEMORY[0x1E0CC3B58];
    v9 = *MEMORY[0x1E0CC3B68];
    v10 = *MEMORY[0x1E0CC3B60];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v50 != v7)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        v13 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (int)objc_msgSend(v12, "trackID")), v8);
        v14 = -[AVAssetReaderAudioMixOutput _audioCurvesForTrack:](self, "_audioCurvesForTrack:", v12);
        if (v14)
          objc_msgSend(v13, "setObject:forKey:", v14, v42);
        v15 = -[AVAssetReaderAudioMixOutput _audioTimePitchAlgorithmForTrack:](self, "_audioTimePitchAlgorithmForTrack:", v12);
        if (v15)
          objc_msgSend(v13, "setObject:forKey:", AVAssetReaderGetFigAssetReaderAudioTimePitchAlgorithmForAudioTimePitchAlgorithm(v15), v9);
        v16 = -[AVAssetReaderAudioMixOutput _audioTapProcessorForTrack:](self, "_audioTapProcessorForTrack:", v12);
        if (v16)
          objc_msgSend(v13, "setObject:forKey:", v16, v10);
        v17 = -[AVAssetReaderAudioMixOutput _audioEffectsParametersForTrack:](self, "_audioEffectsParametersForTrack:", v12);
        if (v17)
        {
          v18 = v17;
          v19 = objc_msgSend(v17, "indexOfObjectPassingTest:", &__block_literal_global_8);
          if (v19 != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v13, "setObject:forKey:", objc_msgSend((id)objc_msgSend(v18, "objectAtIndexedSubscript:", v19), "data"), CFSTR("AssetReaderSource_CinematicAudioParameters"));
        }
        objc_msgSend(v43, "addObject:", v13);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    }
    while (v6);
  }
  audioOutputSettings = self->_audioMixOutputInternal->audioOutputSettings;
  v21 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v22 = -[AVAssetReaderAudioMixOutput audioTracks](self, "audioTracks");
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v46 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(v21, "addObjectsFromArray:", objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * j), "formatDescriptions"));
      }
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    }
    while (v24);
  }
  formatDescriptionOut = 0;
  v27 = CMAudioFormatDescriptionCreateSummary((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFArrayRef)v21, 0, &formatDescriptionOut);
  v28 = formatDescriptionOut;
  if ((_DWORD)v27)
  {
    v29 = 0;
LABEL_26:
    free(v29);
    goto LABEL_27;
  }
  if (audioOutputSettings)
  {
    -[AVOutputSettings willYieldCompressedSamples](audioOutputSettings, "willYieldCompressedSamples");
    -[AVAudioOutputSettings getAudioStreamBasicDescription:forAudioFileTypeID:sourceFormatDescription:](audioOutputSettings, "getAudioStreamBasicDescription:forAudioFileTypeID:sourceFormatDescription:", &v54, 0, formatDescriptionOut);
    v29 = (_DWORD *)-[AVAudioOutputSettings copyAudioChannelLayoutForSourceFormatDescription:audioChannelLayoutSize:](audioOutputSettings, "copyAudioChannelLayoutForSourceFormatDescription:audioChannelLayoutSize:", formatDescriptionOut, &v53);
    audioOutputSettings = (AVAudioOutputSettings *)-[AVAudioOutputSettings audioOptions](audioOutputSettings, "audioOptions");
  }
  else
  {
    StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(formatDescriptionOut);
    v33 = *(_QWORD *)&StreamBasicDescription->mBitsPerChannel;
    v34 = *(_OWORD *)&StreamBasicDescription->mBytesPerPacket;
    v54 = *(_OWORD *)&StreamBasicDescription->mSampleRate;
    v55 = v34;
    v56 = v33;
    v29 = AVCopyBestAudioChannelLayoutFromFormatDescription(formatDescriptionOut, &v53);
  }
  v35 = -[AVAssetReaderOutput _figAssetReader](self, "_figAssetReader");
  v36 = v53;
  v37 = *(uint64_t (**)(OpaqueFigAssetReader *, void *, __int128 *, size_t, _DWORD *, AVAudioOutputSettings *, uint64_t, NSDictionary *, unsigned int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 88);
  if (!v37)
  {
    v27 = 4294954514;
    goto LABEL_26;
  }
  v27 = v37(v35, v43, &v54, v36, v29, audioOutputSettings, v39, v38, &v57);
  free(v29);
  if (!(_DWORD)v27)
  {
    -[AVAssetReaderOutput _setExtractionID:](self, "_setExtractionID:", v57);
    return 1;
  }
LABEL_27:
  if (!a3)
    return 0;
  v30 = +[AVAssetReader _errorForOSStatus:](AVAssetReader, "_errorForOSStatus:", v27);
  result = 0;
  *a3 = v30;
  return result;
}

uint64_t __68__AVAssetReaderAudioMixOutput__enableTrackExtractionReturningError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMemberOfClass:", objc_opt_class());
}

@end
