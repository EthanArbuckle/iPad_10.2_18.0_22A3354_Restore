@implementation AVScheduledAudioParameters

- (AVScheduledAudioParameters)init
{
  AVScheduledAudioParameters *v2;
  AVScheduledAudioParametersInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVScheduledAudioParameters;
  v2 = -[AVScheduledAudioParameters init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AVScheduledAudioParametersInternal);
    v2->_scheduledParametersInternal = v3;
    if (v3)
    {
      CFRetain(v3);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  AVScheduledAudioParametersInternal *scheduledParametersInternal;
  objc_super v4;

  scheduledParametersInternal = self->_scheduledParametersInternal;
  if (scheduledParametersInternal)
  {

    CFRelease(self->_scheduledParametersInternal);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVScheduledAudioParameters;
  -[AVScheduledAudioParameters dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, volume mix: %@>"), NSStringFromClass(v4), self, -[AVScheduledAudioParameters _volumeCurveAsString](self, "_volumeCurveAsString"));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  AVMutableScheduledAudioParameters *v4;

  v4 = -[AVScheduledAudioParameters init](+[AVMutableScheduledAudioParameters allocWithZone:](AVMutableScheduledAudioParameters, "allocWithZone:", a3), "init");
  -[AVScheduledAudioParameters _setRamps:](v4, "_setRamps:", self->_scheduledParametersInternal->parameterRamps);
  return v4;
}

- (unint64_t)hash
{
  return -[NSMutableDictionary hash](self->_scheduledParametersInternal->parameterRamps, "hash");
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[NSMutableDictionary isEqual:](self->_scheduledParametersInternal->parameterRamps, "isEqual:", *(_QWORD *)(*((_QWORD *)a3 + 1) + 8));
  else
    return 0;
}

- (id)_volumeCurveKeysForScheduledRampClassNames
{
  if (_volumeCurveKeysForScheduledRampClassNames_onceToken != -1)
    dispatch_once(&_volumeCurveKeysForScheduledRampClassNames_onceToken, &__block_literal_global_28);
  return (id)_volumeCurveKeysForScheduledRampClassNames_figKeysForRampClassNames;
}

id __72__AVScheduledAudioParameters__volumeCurveKeysForScheduledRampClassNames__block_invoke()
{
  objc_class *v0;
  objc_class *v1;
  objc_class *v2;
  objc_class *v3;
  objc_class *v4;
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  id result;
  _QWORD v9[8];
  _QWORD v10[9];

  v10[8] = *MEMORY[0x1E0C80C00];
  v0 = (objc_class *)objc_opt_class();
  v9[0] = NSStringFromClass(v0);
  v10[0] = *MEMORY[0x1E0CC3E30];
  v1 = (objc_class *)objc_opt_class();
  v9[1] = NSStringFromClass(v1);
  v10[1] = *MEMORY[0x1E0CC3E00];
  v2 = (objc_class *)objc_opt_class();
  v9[2] = NSStringFromClass(v2);
  v10[2] = *MEMORY[0x1E0CC3DF0];
  v3 = (objc_class *)objc_opt_class();
  v9[3] = NSStringFromClass(v3);
  v10[3] = *MEMORY[0x1E0CC3E10];
  v4 = (objc_class *)objc_opt_class();
  v9[4] = NSStringFromClass(v4);
  v10[4] = *MEMORY[0x1E0CC3E08];
  v5 = (objc_class *)objc_opt_class();
  v9[5] = NSStringFromClass(v5);
  v10[5] = *MEMORY[0x1E0CC3DF8];
  v6 = (objc_class *)objc_opt_class();
  v9[6] = NSStringFromClass(v6);
  v10[6] = *MEMORY[0x1E0CC3E20];
  v7 = (objc_class *)objc_opt_class();
  v9[7] = NSStringFromClass(v7);
  v10[7] = *MEMORY[0x1E0CC3E28];
  result = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 8);
  _volumeCurveKeysForScheduledRampClassNames_figKeysForRampClassNames = (uint64_t)result;
  return result;
}

- (BOOL)_isScheduledRampClass:(id)a3
{
  return objc_msgSend(-[AVScheduledAudioParameters _volumeCurveKeysForScheduledRampClassNames](self, "_volumeCurveKeysForScheduledRampClassNames"), "objectForKey:", a3) != 0;
}

- (NSMutableDictionary)_ramps
{
  return self->_scheduledParametersInternal->parameterRamps;
}

- (void)_setRamps:(id)a3
{
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(a3);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[AVScheduledAudioParameters _isScheduledRampClass:](self, "_isScheduledRampClass:", v10))
        {
          v11 = (void *)objc_msgSend(a3, "objectForKey:", v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = (void *)objc_msgSend(v11, "mutableCopy");
            -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v12, v10);

          }
        }
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  self->_scheduledParametersInternal->parameterRamps = v5;
}

- (id)_rampsOfClass:(Class)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_scheduledParametersInternal->parameterRamps, "objectForKey:", NSStringFromClass(a3));
}

- (BOOL)getVolumeRampForTime:(id *)a3 startVolume:(float *)a4 endVolume:(float *)a5 timeRange:(id *)a6 rampMode:(int64_t *)a7
{
  uint64_t v13;
  id v14;
  void *v15;
  int v16;
  int v17;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v19;

  v13 = objc_opt_class();
  v19 = *a3;
  v14 = -[AVScheduledAudioParameters _getRampOfClass:forTime:timeRange:](self, "_getRampOfClass:forTime:timeRange:", v13, &v19, a6);
  v15 = v14;
  if (v14)
  {
    if (a4)
    {
      objc_msgSend(v14, "startVolume");
      *(_DWORD *)a4 = v16;
    }
    if (a5)
    {
      objc_msgSend(v15, "endVolume");
      *(_DWORD *)a5 = v17;
    }
    if (a7)
      *a7 = objc_msgSend(v15, "rampMode");
  }
  return v15 != 0;
}

- (BOOL)getVolumeRampForTime:(id *)a3 startVolume:(float *)a4 endVolume:(float *)a5 timeRange:(id *)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  v7 = *a3;
  return -[AVScheduledAudioParameters getVolumeRampForTime:startVolume:endVolume:timeRange:rampMode:](self, "getVolumeRampForTime:startVolume:endVolume:timeRange:rampMode:", &v7, a4, a5, a6, 0);
}

- (AVScheduledAudioParameters)initWithPropertyList:(id)a3
{
  AVScheduledAudioParameters *v4;
  uint64_t v5;
  uint64_t i;
  NSString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  void *v15;
  void *v17;
  uint64_t v18;
  id v19;
  AVScheduledAudioParameters *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = -[AVScheduledAudioParameters init](self, "init");
  if (v4)
  {
    v17 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v21 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v21)
      {
        v5 = *(_QWORD *)v27;
        v19 = a3;
        v20 = v4;
        v18 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v27 != v5)
              objc_enumerationMutation(a3);
            v7 = *(NSString **)(*((_QWORD *)&v26 + 1) + 8 * i);
            if (-[AVScheduledAudioParameters _isScheduledRampClass:](v4, "_isScheduledRampClass:", v7))
            {
              v8 = (void *)objc_msgSend(a3, "objectForKey:", v7);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v22 = 0u;
                v23 = 0u;
                v24 = 0u;
                v25 = 0u;
                v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
                if (v10)
                {
                  v11 = v10;
                  v12 = *(_QWORD *)v23;
                  do
                  {
                    for (j = 0; j != v11; ++j)
                    {
                      if (*(_QWORD *)v23 != v12)
                        objc_enumerationMutation(v8);
                      v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v15 = (void *)objc_msgSend(objc_alloc(NSClassFromString(v7)), "initWithPropertyList:", v14);
                        if (v14)
                          objc_msgSend(v9, "addObject:", v15);

                      }
                    }
                    v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
                  }
                  while (v11);
                }
                a3 = v19;
                v4 = v20;
                v5 = v18;
                if (objc_msgSend(v9, "count"))
                  objc_msgSend(v17, "setObject:forKey:", v9, v7);
              }
            }
          }
          v21 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        }
        while (v21);
      }
    }
    -[AVScheduledAudioParameters _setRamps:](v4, "_setRamps:", v17);
  }
  return v4;
}

- (id)propertyList
{
  AVScheduledAudioParameters *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableDictionary *obj;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v17 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = self;
  obj = self->_scheduledParametersInternal->parameterRamps;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v7);
        v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v10 = (void *)-[NSMutableDictionary objectForKey:](v3->_scheduledParametersInternal->parameterRamps, "objectForKey:", v8);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v19;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v19 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14++), "propertyList"));
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v12);
        }
        objc_msgSend(v17, "setObject:forKey:", v9, v8);
        ++v7;
      }
      while (v7 != v5);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v5);
  }
  return v17;
}

- (id)_getRampOfClass:(Class)a3 forTime:(id *)a4 timeRange:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  __int128 v15;
  CMTime v17;
  CMTime lhs;
  CMTime v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _OWORD v24[2];
  _QWORD v25[5];
  __int128 v26;
  int64_t var3;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  if ((a4->var2 & 0x1D) != 1)
    return 0;
  v7 = -[AVScheduledAudioParameters _rampsOfClass:](self, "_rampsOfClass:", a3);
  if (!v7)
    return 0;
  v8 = v7;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0x7FFFFFFFFFFFFFFFLL;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __101__AVScheduledAudioParameters_AVScheduledAudioParameters_Internal___getRampOfClass_forTime_timeRange___block_invoke;
  v25[3] = &unk_1E30326B8;
  v26 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  v25[4] = &v28;
  v9 = objc_msgSend(v7, "indexOfObjectPassingTest:", v25);
  if (v29[3] == 0x7FFFFFFFFFFFFFFFLL)
    v10 = v9;
  else
    v10 = v29[3];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0;
  }
  else
  {
    v12 = (void *)objc_msgSend(v8, "objectAtIndex:");
    v11 = v12;
    if (a5)
    {
      memset(v24, 0, sizeof(v24));
      v23 = 0u;
      if (v12)
      {
        objc_msgSend(v12, "timeRange");
        if ((~DWORD1(v24[1]) & 5) == 0)
        {
          v13 = objc_msgSend(v8, "count");
          if (v29[3] + 1 < v13)
          {
            v21 = 0u;
            v22 = 0u;
            v20 = 0u;
            v14 = (void *)objc_msgSend(v8, "objectAtIndex:");
            if (v14)
            {
              objc_msgSend(v14, "timeRange");
            }
            else
            {
              v21 = 0u;
              v22 = 0u;
              v20 = 0u;
            }
            *(_OWORD *)&lhs.value = v20;
            lhs.epoch = v21;
            *(_OWORD *)&v17.value = v23;
            v17.epoch = *(_QWORD *)&v24[0];
            CMTimeSubtract(&v19, &lhs, &v17);
            *(CMTime *)((char *)v24 + 8) = v19;
          }
        }
      }
      v15 = v24[0];
      *(_OWORD *)&a5->var0.var0 = v23;
      *(_OWORD *)&a5->var0.var3 = v15;
      *(_OWORD *)&a5->var1.var1 = v24[1];
    }
  }
  _Block_object_dispose(&v28, 8);
  return v11;
}

BOOL __101__AVScheduledAudioParameters_AVScheduledAudioParameters_Internal___getRampOfClass_forTime_timeRange___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  int32_t v7;
  uint64_t v8;
  CMTime v10;
  CMTimeRange range;
  CMTimeRange v12;

  memset(&v12, 0, sizeof(v12));
  if (a2)
    objc_msgSend(a2, "timeRange");
  range = v12;
  v10 = *(CMTime *)(a1 + 40);
  if (CMTimeRangeContainsTime(&range, &v10))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&v12.start.value;
  range.start.epoch = v12.start.epoch;
  v10 = *(CMTime *)(a1 + 40);
  v7 = CMTimeCompare(&range.start, &v10);
  if (v7 < 1)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_QWORD *)(v8 + 24) < a3)
      *(_QWORD *)(v8 + 24) = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    *a4 = 1;
  }
  return v7 > 0;
}

- (void)_setRamp:(id)a3
{
  objc_class *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableDictionary *parameterRamps;
  objc_class *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  CMTime v19;
  CMTime time1;
  _QWORD v21[4];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

  if (a3)
  {
    v6 = (objc_class *)objc_opt_class();
    if (-[AVScheduledAudioParameters _isScheduledRampClass:](self, "_isScheduledRampClass:", NSStringFromClass(v6)))
    {
      v7 = -[AVScheduledAudioParameters _rampsOfClass:](self, "_rampsOfClass:", objc_opt_class());
      v29 = 0u;
      v30 = 0u;
      v28 = 0u;
      objc_msgSend(a3, "timeRange");
      v25 = v28;
      v26 = v29;
      v27 = v30;
      if (AVScheduledParameterRampsIncludesRampThatOverlapsTimeRange(v7, &v25))
      {
        v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("The timeRange of a ramp must not overlap the timeRange of an existing ramp."), v8, v9, v10, v11, v12, v19.value), 0);
        objc_exception_throw(v18);
      }
      if (!v7)
      {
        v7 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        parameterRamps = self->_scheduledParametersInternal->parameterRamps;
        if (!parameterRamps)
        {
          self->_scheduledParametersInternal->parameterRamps = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
          parameterRamps = self->_scheduledParametersInternal->parameterRamps;
        }
        v14 = (objc_class *)objc_opt_class();
        -[NSMutableDictionary setObject:forKey:](parameterRamps, "setObject:forKey:", v7, NSStringFromClass(v14));
      }
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __76__AVScheduledAudioParameters_AVScheduledAudioParameters_Internal___setRamp___block_invoke;
      v21[3] = &__block_descriptor_80_e15_B32__0_8Q16_B24l;
      v22 = v28;
      v23 = v29;
      v24 = v30;
      v15 = objc_msgSend(v7, "indexOfObjectPassingTest:", v21);
      if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v7, "addObject:", a3);
      }
      else
      {
        v16 = v15;
        v26 = 0u;
        v27 = 0u;
        v25 = 0u;
        v17 = (void *)objc_msgSend(v7, "objectAtIndex:", v15);
        if (v17)
        {
          objc_msgSend(v17, "timeRange");
        }
        else
        {
          v26 = 0u;
          v27 = 0u;
          v25 = 0u;
        }
        *(_OWORD *)&time1.value = v25;
        time1.epoch = v26;
        *(_OWORD *)&v19.value = v28;
        v19.epoch = v29;
        if (CMTimeCompare(&time1, &v19))
          objc_msgSend(v7, "insertObject:atIndex:", a3, v16);
        else
          objc_msgSend(v7, "replaceObjectAtIndex:withObject:", v16, a3);
      }
    }
  }
}

BOOL __76__AVScheduledAudioParameters_AVScheduledAudioParameters_Internal___setRamp___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int32_t v6;
  CMTime v8;
  CMTime time1;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  if (a2)
  {
    objc_msgSend(a2, "timeRange");
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v10 = 0u;
  }
  *(_OWORD *)&time1.value = v10;
  time1.epoch = v11;
  v8 = *(CMTime *)(a1 + 32);
  v6 = CMTimeCompare(&time1, &v8);
  if ((v6 & 0x80000000) == 0)
    *a4 = 1;
  return v6 >= 0;
}

- (id)_audioCurveOfClass:(Class)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  CMTimeEpoch v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CMTime v23;
  CMTimeRange v24;
  CMTimeRange time2;
  CMTime v26;
  CMTimeRange time1;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CMTimeEpoch v32;

  v4 = -[AVScheduledAudioParameters _rampsOfClass:](self, "_rampsOfClass:");
  v5 = objc_msgSend(v4, "count");
  if (!v5)
    return 0;
  v6 = v5;
  v7 = objc_msgSend((id)-[objc_class _defaultAdditionalFigRepresentationObjects](a3, "_defaultAdditionalFigRepresentationObjects"), "count");
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (v7 + 2) * v6);
  v9 = (void *)objc_msgSend(v4, "objectAtIndex:", 0);
  if (v9)
  {
    objc_msgSend(v9, "timeRange");
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v28 = 0u;
  }
  v31 = v28;
  v32 = v29;
  *(_OWORD *)&time1.start.value = v28;
  time1.start.epoch = v29;
  v21 = *MEMORY[0x1E0CA2E68];
  *(_OWORD *)&time2.start.value = *MEMORY[0x1E0CA2E68];
  v10 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  time2.start.epoch = v10;
  if (CMTimeCompare(&time1.start, &time2.start) >= 1)
  {
    v11 = -[objc_class defaultValue](a3, "defaultValue");
    v12 = -[objc_class _defaultAdditionalFigRepresentationObjects](a3, "_defaultAdditionalFigRepresentationObjects");
    *(_OWORD *)&time1.start.value = v21;
    time1.start.epoch = v10;
    objc_msgSend(v8, "addObject:", NSDictionaryFromCMTime(&time1.start));
    objc_msgSend(v8, "addObject:", v11);
    objc_msgSend(v8, "addObjectsFromArray:", v12);
    *(_OWORD *)&time1.start.value = v31;
    time1.start.epoch = v32;
    objc_msgSend(v8, "addObject:", NSDictionaryFromCMTime(&time1.start));
    objc_msgSend(v8, "addObject:", v11);
    objc_msgSend(v8, "addObjectsFromArray:", v12);
  }
  if (v6 >= 1)
  {
    v13 = 0;
    v20 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    v22 = *MEMORY[0x1E0CA2E40];
    v19 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
    do
    {
      v14 = (void *)objc_msgSend(v4, "objectAtIndex:", v13, v19, v20);
      v15 = v14;
      memset(&time1, 0, sizeof(time1));
      if (v14)
        objc_msgSend(v14, "timeRange");
      memset(&v26, 0, sizeof(v26));
      time2 = time1;
      CMTimeRangeGetEnd(&v26, &time2);
      *(_OWORD *)&time2.start.value = v22;
      *(_OWORD *)&time2.start.epoch = v20;
      *(_OWORD *)&time2.duration.timescale = v19;
      if (++v13 >= v6)
      {
        v17 = 0;
      }
      else
      {
        v16 = (void *)objc_msgSend(v4, "objectAtIndex:", v13);
        v17 = v16;
        if (v16)
          objc_msgSend(v16, "timeRange");
        else
          memset(&v24, 0, sizeof(v24));
        time2 = v24;
        v23 = v26;
        if (CMTimeCompare(&v24.start, &v23) < 0)
        {
          *(_OWORD *)&v24.start.value = *(_OWORD *)&time2.start.value;
          v24.start.epoch = time2.start.epoch;
          v15 = (void *)objc_msgSend(v15, "scheduledParameterRampInterpolatedToTime:", &v24);
        }
      }
      *(_OWORD *)&v24.start.value = *(_OWORD *)&time1.start.value;
      v24.start.epoch = time1.start.epoch;
      objc_msgSend(v8, "addObject:", NSDictionaryFromCMTime(&v24.start));
      objc_msgSend(v8, "addObject:", objc_msgSend(v15, "startValue"));
      objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(v15, "_additionalFigRepresentationObjects"));
      if ((v26.flags & 0x1D) == 1)
      {
        v24.start = v26;
        objc_msgSend(v8, "addObject:", NSDictionaryFromCMTime(&v24.start));
        objc_msgSend(v8, "addObject:", objc_msgSend(v15, "endValue"));
        objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(v15, "_additionalFigRepresentationObjects"));
      }
      if (v17)
      {
        *(_OWORD *)&v24.start.value = *(_OWORD *)&time2.start.value;
        v24.start.epoch = time2.start.epoch;
        v23 = v26;
        if (CMTimeCompare(&v24.start, &v23) >= 1
          && (objc_msgSend((id)objc_msgSend(v15, "endValue"), "isEqual:", objc_msgSend(v17, "startValue")) & 1) == 0)
        {
          *(_OWORD *)&v24.start.value = *(_OWORD *)&time2.start.value;
          v24.start.epoch = time2.start.epoch;
          objc_msgSend(v8, "addObject:", NSDictionaryFromCMTime(&v24.start));
          objc_msgSend(v8, "addObject:", objc_msgSend(v15, "endValue"));
          objc_msgSend(v8, "addObjectsFromArray:", -[objc_class _defaultAdditionalFigRepresentationObjects](a3, "_defaultAdditionalFigRepresentationObjects"));
        }
      }
    }
    while (v6 != v13);
  }
  return v8;
}

- (id)_audioVolumeCurve
{
  return -[AVScheduledAudioParameters _audioCurveOfClass:](self, "_audioCurveOfClass:", objc_opt_class());
}

- (id)_figAudioCurves
{
  id result;
  id v4;
  void *v5;
  NSMutableDictionary *parameterRamps;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSString *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  result = (id)-[NSMutableDictionary count](self->_scheduledParametersInternal->parameterRamps, "count");
  if (result)
  {
    v4 = -[AVScheduledAudioParameters _volumeCurveKeysForScheduledRampClassNames](self, "_volumeCurveKeysForScheduledRampClassNames");
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    parameterRamps = self->_scheduledParametersInternal->parameterRamps;
    v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](parameterRamps, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(parameterRamps);
          v11 = *(NSString **)(*((_QWORD *)&v15 + 1) + 8 * i);
          v12 = objc_msgSend(v4, "objectForKey:", v11);
          if (v12)
          {
            v13 = v12;
            v14 = -[AVScheduledAudioParameters _audioCurveOfClass:](self, "_audioCurveOfClass:", NSClassFromString(v11));
            if (v14)
              objc_msgSend(v5, "setObject:forKey:", v14, v13);
          }
        }
        v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](parameterRamps, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }
    if (objc_msgSend(v5, "count"))
      return v5;
    else
      return 0;
  }
  return result;
}

- (id)_volumeCurveAsString
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t i;
  double Seconds;
  float v12;
  float v13;
  uint64_t v14;
  float v15;
  double v16;
  float v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v22;
  CMTime v23;
  CMTime time;

  v22 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = -[AVScheduledAudioParameters _audioVolumeCurve](self, "_audioVolumeCurve");
  v4 = objc_msgSend(v3, "count");
  if (v4 >= 3)
  {
    v5 = 0;
    v6 = v4 / 3;
    v7 = v4 / 3 - 1;
    v8 = &stru_1E303A378;
    v9 = 2;
    for (i = 4; ; i += 3)
    {
      CMTimeMakeFromDictionary(&time, (CFDictionaryRef)objc_msgSend(v3, "objectAtIndex:", i - 4));
      Seconds = CMTimeGetSeconds(&time);
      objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", i - 3), "floatValue");
      v13 = v12;
      v14 = objc_msgSend(v3, "objectAtIndex:", i - 2);
      v15 = 0.0;
      LODWORD(v16) = 0;
      if (v7 != v5)
      {
        CMTimeMakeFromDictionary(&v23, (CFDictionaryRef)objc_msgSend(v3, "objectAtIndex:", i - 1, v16));
        v15 = CMTimeGetSeconds(&v23);
        objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", i), "floatValue");
      }
      v17 = Seconds;
      if (v9 == 2)
        v18 = CFSTR("at");
      else
        v18 = CFSTR("through");
      v19 = &stru_1E303A378;
      v20 = v8;
      if (v7 <= v5)
        goto LABEL_16;
      if (v15 != v17)
        break;
      if (v13 != *(float *)&v16)
      {
        v19 = CFSTR(", changes instantaneously to ");
        v20 = &stru_1E303A378;
        v9 = 2;
LABEL_16:
        objc_msgSend(v22, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("volume %1.3f %@ time %1.3f%@%@"), v13, v18, v17, v8, v19));
        goto LABEL_17;
      }
      v9 = 0;
      v20 = &stru_1E303A378;
LABEL_17:
      ++v5;
      v8 = v20;
      if (v6 == v5)
        return v22;
    }
    if (v13 == *(float *)&v16)
    {
      v9 = 0;
      v19 = CFSTR(", holds steady at ");
      v20 = &stru_1E303A378;
    }
    else
    {
      v20 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" with %@ ramp style"), v14);
      v19 = CFSTR(", ramps to ");
      v9 = 1;
    }
    goto LABEL_16;
  }
  return v22;
}

@end
