@implementation AVVideoCompositionLayerInstruction

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(a1, "setVersion:", 1);
}

- (AVVideoCompositionLayerInstruction)init
{
  AVVideoCompositionLayerInstruction *v2;
  AVVideoCompositionLayerInstructionInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVVideoCompositionLayerInstruction;
  v2 = -[AVVideoCompositionLayerInstruction init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AVVideoCompositionLayerInstructionInternal);
    v2->_layerInstruction = v3;
    if (v3)
    {
      CFRetain(v3);
      v2->_layerInstruction->trackID = 0;
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (AVVideoCompositionLayerInstruction)initWithCoder:(id)a3
{
  AVVideoCompositionLayerInstruction *v4;
  AVVideoCompositionLayerInstructionInternal *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)AVVideoCompositionLayerInstruction;
  v4 = -[AVVideoCompositionLayerInstruction init](&v23, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(AVVideoCompositionLayerInstructionInternal);
    v4->_layerInstruction = v5;
    if (v5)
    {
      CFRetain(v5);
      -[AVVideoCompositionLayerInstruction setTrackID:](v4, "setTrackID:", objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AVVideoCompositionLayerTrackID")), "intValue"));
      v6 = (void *)MEMORY[0x1E0C99E60];
      v7 = objc_opt_class();
      v8 = objc_opt_class();
      v9 = objc_opt_class();
      v10 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0), CFSTR("AVVideoCompositionLayerTransformRamps"));
      -[AVVideoCompositionLayerInstruction _setTransformRamps:](v4, "_setTransformRamps:", _rampArrayWithTimeRangesAsValues(v10));
      v11 = (void *)MEMORY[0x1E0C99E60];
      v12 = objc_opt_class();
      v13 = objc_opt_class();
      v14 = objc_opt_class();
      v15 = objc_opt_class();
      v16 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, objc_opt_class(), 0), CFSTR("AVVideoCompositionLayerOpacityRamps"));
      -[AVVideoCompositionLayerInstruction _setOpacityRamps:](v4, "_setOpacityRamps:", _rampArrayWithTimeRangesAsValues(v16));
      v17 = (void *)MEMORY[0x1E0C99E60];
      v18 = objc_opt_class();
      v19 = objc_opt_class();
      v20 = objc_opt_class();
      v21 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v17, "setWithObjects:", v18, v19, v20, objc_opt_class(), 0), CFSTR("AVVideoCompositionLayerCropRectangleRamps"));
      -[AVVideoCompositionLayerInstruction _setCropRectangleRamps:](v4, "_setCropRectangleRamps:", _rampArrayWithTimeRangesAsValues(v21));
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_layerInstruction->trackID), CFSTR("AVVideoCompositionLayerTrackID"));
  objc_msgSend(a3, "encodeObject:forKey:", _rampArrayWithTimeRangesAsDictionaries(self->_layerInstruction->transformRamps), CFSTR("AVVideoCompositionLayerTransformRamps"));
  objc_msgSend(a3, "encodeObject:forKey:", _rampArrayWithTimeRangesAsDictionaries(self->_layerInstruction->opacityRamps), CFSTR("AVVideoCompositionLayerOpacityRamps"));
  objc_msgSend(a3, "encodeObject:forKey:", _rampArrayWithTimeRangesAsDictionaries(self->_layerInstruction->cropRectangleRamps), CFSTR("AVVideoCompositionLayerCropRectangleRamps"));
}

- (BOOL)isEqual:(id)a3
{
  int trackID;
  AVVideoCompositionLayerInstructionInternal *layerInstruction;
  NSMutableArray *transformRamps;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *opacityRamps;
  uint64_t v11;
  NSMutableArray *cropRectangleRamps;
  uint64_t v13;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  trackID = self->_layerInstruction->trackID;
  if (trackID != objc_msgSend(a3, "trackID"))
    goto LABEL_11;
  layerInstruction = self->_layerInstruction;
  transformRamps = layerInstruction->transformRamps;
  v8 = *(_QWORD *)(*((_QWORD *)a3 + 1) + 16);
  if (transformRamps)
  {
    LODWORD(v9) = -[NSMutableArray isEqual:](transformRamps, "isEqual:", v8);
    if (!(_DWORD)v9)
      return v9;
    layerInstruction = self->_layerInstruction;
  }
  else if (v8)
  {
    goto LABEL_11;
  }
  opacityRamps = layerInstruction->opacityRamps;
  v11 = *(_QWORD *)(*((_QWORD *)a3 + 1) + 24);
  if (opacityRamps)
  {
    LODWORD(v9) = -[NSMutableArray isEqual:](opacityRamps, "isEqual:", v11);
    if (!(_DWORD)v9)
      return v9;
    layerInstruction = self->_layerInstruction;
    goto LABEL_13;
  }
  if (v11)
  {
LABEL_11:
    LOBYTE(v9) = 0;
    return v9;
  }
LABEL_13:
  cropRectangleRamps = layerInstruction->cropRectangleRamps;
  v13 = *(_QWORD *)(*((_QWORD *)a3 + 1) + 32);
  if (cropRectangleRamps)
    LOBYTE(v9) = -[NSMutableArray isEqual:](cropRectangleRamps, "isEqual:", v13);
  else
    return v13 == 0;
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVVideoCompositionLayerInstruction *v5;

  if (-[AVVideoCompositionLayerInstruction isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
    return self;
  v5 = -[AVVideoCompositionLayerInstruction init](+[AVVideoCompositionLayerInstruction allocWithZone:](AVVideoCompositionLayerInstruction, "allocWithZone:", a3), "init");
  if (v5)
  {
    -[AVVideoCompositionLayerInstruction setTrackID:](v5, "setTrackID:", -[AVVideoCompositionLayerInstruction trackID](self, "trackID"));
    -[AVVideoCompositionLayerInstruction _setTransformRamps:](v5, "_setTransformRamps:", self->_layerInstruction->transformRamps);
    -[AVVideoCompositionLayerInstruction _setOpacityRamps:](v5, "_setOpacityRamps:", self->_layerInstruction->opacityRamps);
    -[AVVideoCompositionLayerInstruction _setCropRectangleRamps:](v5, "_setCropRectangleRamps:", self->_layerInstruction->cropRectangleRamps);
  }
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  AVMutableVideoCompositionLayerInstruction *v4;

  v4 = -[AVVideoCompositionLayerInstruction init](+[AVMutableVideoCompositionLayerInstruction allocWithZone:](AVMutableVideoCompositionLayerInstruction, "allocWithZone:", a3), "init");
  if (v4)
  {
    -[AVMutableVideoCompositionLayerInstruction setTrackID:](v4, "setTrackID:", -[AVVideoCompositionLayerInstruction trackID](self, "trackID"));
    -[AVVideoCompositionLayerInstruction _setTransformRamps:](v4, "_setTransformRamps:", self->_layerInstruction->transformRamps);
    -[AVVideoCompositionLayerInstruction _setOpacityRamps:](v4, "_setOpacityRamps:", self->_layerInstruction->opacityRamps);
    -[AVVideoCompositionLayerInstruction _setCropRectangleRamps:](v4, "_setCropRectangleRamps:", self->_layerInstruction->cropRectangleRamps);
  }
  return v4;
}

- (void)dealloc
{
  AVVideoCompositionLayerInstructionInternal *layerInstruction;
  objc_super v4;

  layerInstruction = self->_layerInstruction;
  if (layerInstruction)
  {

    CFRelease(self->_layerInstruction);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVVideoCompositionLayerInstruction;
  -[AVVideoCompositionLayerInstruction dealloc](&v4, sel_dealloc);
}

- (CMPersistentTrackID)trackID
{
  return self->_layerInstruction->trackID;
}

- (void)setTrackID:(int)a3
{
  self->_layerInstruction->trackID = a3;
}

- (void)_setTransformRamps:(id)a3
{
  NSMutableArray *transformRamps;

  transformRamps = self->_layerInstruction->transformRamps;
  if (transformRamps != a3)
  {

    self->_layerInstruction->transformRamps = (NSMutableArray *)objc_msgSend(a3, "copy");
  }
}

- (void)_setOpacityRamps:(id)a3
{
  NSMutableArray *opacityRamps;

  opacityRamps = self->_layerInstruction->opacityRamps;
  if (opacityRamps != a3)
  {

    self->_layerInstruction->opacityRamps = (NSMutableArray *)objc_msgSend(a3, "copy");
  }
}

- (void)_setCropRectangleRamps:(id)a3
{
  NSMutableArray *cropRectangleRamps;

  cropRectangleRamps = self->_layerInstruction->cropRectangleRamps;
  if (cropRectangleRamps != a3)
  {

    self->_layerInstruction->cropRectangleRamps = (NSMutableArray *)objc_msgSend(a3, "copy");
  }
}

- (void)_setTransformRampFromStartTransform:(CGAffineTransform *)a3 toEndTransform:(CGAffineTransform *)a4 timeRange:(id *)a5 selector:(SEL)a6
{
  NSMutableArray *transformRamps;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableArray *v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  id v25;
  __int128 v26;
  uint64_t v27;
  void *v28;
  int32_t v29;
  NSMutableArray *v30;
  void *v31;
  uint64_t v32;
  CMTime time2;
  CMTime time1;
  _QWORD v35[4];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;

  transformRamps = self->_layerInstruction->transformRamps;
  v12 = *(_OWORD *)&a5->var0.var3;
  v39 = *(_OWORD *)&a5->var0.var0;
  v40 = v12;
  v41 = *(_OWORD *)&a5->var1.var1;
  if (AVRampsIncludesRampThatOverlapsTimeRange(transformRamps, &v39))
  {
    v31 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a6, (uint64_t)CFSTR("The timeRange of a transform ramp must not overlap the timeRange of an existing transform ramp."), v13, v14, v15, v16, v17, v32), 0);
    objc_exception_throw(v31);
  }
  v18 = self->_layerInstruction->transformRamps;
  if (!v18)
  {
    self->_layerInstruction->transformRamps = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    v18 = self->_layerInstruction->transformRamps;
  }
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __108__AVVideoCompositionLayerInstruction__setTransformRampFromStartTransform_toEndTransform_timeRange_selector___block_invoke;
  v35[3] = &__block_descriptor_80_e15_B32__0_8Q16_B24l;
  v19 = *(_OWORD *)&a5->var0.var3;
  v36 = *(_OWORD *)&a5->var0.var0;
  v37 = v19;
  v38 = *(_OWORD *)&a5->var1.var1;
  v20 = -[NSMutableArray indexOfObjectPassingTest:](v18, "indexOfObjectPassingTest:", v35);
  v21 = *(_OWORD *)&a5->var0.var3;
  v39 = *(_OWORD *)&a5->var0.var0;
  v40 = v21;
  v41 = *(_OWORD *)&a5->var1.var1;
  v22 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTimeRange:", &v39);
  v23 = (void *)MEMORY[0x1E0C99D80];
  v24 = *(_OWORD *)&a3->c;
  v39 = *(_OWORD *)&a3->a;
  v40 = v24;
  v41 = *(_OWORD *)&a3->tx;
  v25 = (id)FigCreate3x2MatrixArrayFromCGAffineTransform();
  v26 = *(_OWORD *)&a4->c;
  v39 = *(_OWORD *)&a4->a;
  v40 = v26;
  v41 = *(_OWORD *)&a4->tx;
  v27 = objc_msgSend(v23, "dictionaryWithObjectsAndKeys:", v25, CFSTR("StartTransform"), (id)FigCreate3x2MatrixArrayFromCGAffineTransform(), CFSTR("EndTransform"), 0);
  if (v20 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray addObject:](self->_layerInstruction->transformRamps, "addObject:", v22);
    -[NSMutableArray addObject:](self->_layerInstruction->transformRamps, "addObject:", v27);
  }
  else
  {
    v40 = 0u;
    v41 = 0u;
    v39 = 0u;
    v28 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->transformRamps, "objectAtIndex:", v20);
    if (v28)
    {
      objc_msgSend(v28, "CMTimeRangeValue");
    }
    else
    {
      v40 = 0u;
      v41 = 0u;
      v39 = 0u;
    }
    *(_OWORD *)&time1.value = v39;
    time1.epoch = v40;
    time2 = (CMTime)a5->var0;
    v29 = CMTimeCompare(&time1, &time2);
    v30 = self->_layerInstruction->transformRamps;
    if (v29)
    {
      -[NSMutableArray insertObject:atIndex:](v30, "insertObject:atIndex:", v22, v20);
      -[NSMutableArray insertObject:atIndex:](self->_layerInstruction->transformRamps, "insertObject:atIndex:", v27, v20 + 1);
    }
    else
    {
      -[NSMutableArray replaceObjectAtIndex:withObject:](v30, "replaceObjectAtIndex:withObject:", v20, v22);
      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_layerInstruction->transformRamps, "replaceObjectAtIndex:withObject:", v20 + 1, v27);
    }
  }
}

BOOL __108__AVVideoCompositionLayerInstruction__setTransformRampFromStartTransform_toEndTransform_timeRange_selector___block_invoke(uint64_t a1, void *a2, char a3, _BYTE *a4)
{
  _BOOL8 result;
  int32_t v7;
  CMTime v8;
  CMTime time1;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  if ((a3 & 1) != 0)
    return 0;
  if (a2)
  {
    objc_msgSend(a2, "CMTimeRangeValue");
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
  v7 = CMTimeCompare(&time1, &v8);
  result = v7 >= 0;
  if ((v7 & 0x80000000) == 0)
    *a4 = 1;
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3 atTime:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE start[32];
  __int128 v19;
  CMTimeRange v20;

  if ((a4->var2 & 0x1D) != 1)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("The time of a transform setting must be numeric."), (uint64_t)a4, v4, v5, v6, v7, v15), 0);
    objc_exception_throw(v14);
  }
  *($3CC8671D27C23BF42ADDB32F2B5E48AE *)start = *a4;
  v15 = *MEMORY[0x1E0CA2E30];
  *(_QWORD *)&v16 = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
  CMTimeRangeMake(&v20, (CMTime *)start, (CMTime *)&v15);
  v11 = *(_OWORD *)&a3->c;
  *(_OWORD *)start = *(_OWORD *)&a3->a;
  *(_OWORD *)&start[16] = v11;
  v13 = *(_OWORD *)&a3->a;
  v12 = *(_OWORD *)&a3->c;
  v19 = *(_OWORD *)&a3->tx;
  v15 = v13;
  v16 = v12;
  v17 = *(_OWORD *)&a3->tx;
  -[AVVideoCompositionLayerInstruction _setTransformRampFromStartTransform:toEndTransform:timeRange:selector:](self, "_setTransformRampFromStartTransform:toEndTransform:timeRange:selector:", start, &v15, &v20, a2);
}

- (void)setTransformRampFromStartTransform:(CGAffineTransform *)a3 toEndTransform:(CGAffineTransform *)a4 timeRange:(id *)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  _OWORD v12[3];
  _OWORD v13[3];
  _OWORD v14[3];

  if ((a5->var0.var2 & 0x1D) != 1 || (a5->var1.var2 & 0x1D) != 1)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("The timeRange of a transform ramp must have a numeric start time and a numeric duration."), (uint64_t)a4, (uint64_t)a5, v5, v6, v7, *(uint64_t *)&v12[0]), 0);
    objc_exception_throw(v11);
  }
  v8 = *(_OWORD *)&a3->c;
  v14[0] = *(_OWORD *)&a3->a;
  v14[1] = v8;
  v14[2] = *(_OWORD *)&a3->tx;
  v9 = *(_OWORD *)&a4->c;
  v13[0] = *(_OWORD *)&a4->a;
  v13[1] = v9;
  v13[2] = *(_OWORD *)&a4->tx;
  v10 = *(_OWORD *)&a5->var0.var3;
  v12[0] = *(_OWORD *)&a5->var0.var0;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&a5->var1.var1;
  -[AVVideoCompositionLayerInstruction _setTransformRampFromStartTransform:toEndTransform:timeRange:selector:](self, "_setTransformRampFromStartTransform:toEndTransform:timeRange:selector:", v14, v13, v12, a2);
}

- (BOOL)getTransformRampForTime:(CMTime *)time startTransform:(CGAffineTransform *)startTransform endTransform:(CGAffineTransform *)endTransform timeRange:(CMTimeRange *)timeRange
{
  AVVideoCompositionLayerInstructionInternal *layerInstruction;
  NSMutableArray *transformRamps;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  __int128 v24;
  CMTime v26;
  CMTime lhs;
  CMTime v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  CMTime v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  CMTimeScale timescale;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if ((time->flags & 0x1D) == 1)
  {
    layerInstruction = self->_layerInstruction;
    if (layerInstruction->transformRamps)
    {
      v34 = 0;
      v35 = &v34;
      v36 = 0x2020000000;
      v37 = 0x7FFFFFFFFFFFFFFFLL;
      transformRamps = layerInstruction->transformRamps;
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __100__AVVideoCompositionLayerInstruction_getTransformRampForTime_startTransform_endTransform_timeRange___block_invoke;
      v32[3] = &unk_1E30326B8;
      v33 = *time;
      v32[4] = &v34;
      v12 = -[NSMutableArray indexOfObjectPassingTest:](transformRamps, "indexOfObjectPassingTest:", v32);
      if (v35[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
        v13 = v12;
        if (v12 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_15;
        v14 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->transformRamps, "objectAtIndex:", v12);
        if (v14)
        {
          objc_msgSend(v14, "CMTimeRangeValue");
          flags = DWORD1(v31);
          epoch = *((_QWORD *)&v31 + 1);
        }
        else
        {
          epoch = 0;
          flags = 0;
          v30 = 0u;
          v31 = 0u;
          v29 = 0u;
        }
        v38 = v29;
        v39 = v30;
        timescale = v31;
      }
      else
      {
        v18 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->transformRamps, "objectAtIndex:");
        if (v18)
        {
          objc_msgSend(v18, "CMTimeRangeValue");
          flags = DWORD1(v31);
          epoch = *((_QWORD *)&v31 + 1);
        }
        else
        {
          epoch = 0;
          flags = 0;
          v30 = 0u;
          v31 = 0u;
          v29 = 0u;
        }
        v38 = v29;
        v39 = v30;
        timescale = v31;
        v13 = v35[3];
      }
      if (v13 != 0x7FFFFFFFFFFFFFFELL)
      {
        v19 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->transformRamps, "objectAtIndex:");
        v20 = v19;
        if (startTransform)
        {
          objc_msgSend(v19, "objectForKey:", CFSTR("StartTransform"));
          FigGetCGAffineTransformFrom3x2MatrixArray();
          v21 = v30;
          *(_OWORD *)&startTransform->a = v29;
          *(_OWORD *)&startTransform->c = v21;
          *(_OWORD *)&startTransform->tx = v31;
        }
        if (endTransform)
        {
          objc_msgSend(v20, "objectForKey:", CFSTR("EndTransform"));
          FigGetCGAffineTransformFrom3x2MatrixArray();
          v22 = v30;
          *(_OWORD *)&endTransform->a = v29;
          *(_OWORD *)&endTransform->c = v22;
          *(_OWORD *)&endTransform->tx = v31;
        }
        if (timeRange)
        {
          if ((~flags & 5) == 0
            && v13 + 2 < (unint64_t)-[NSMutableArray count](self->_layerInstruction->transformRamps, "count"))
          {
            v30 = 0u;
            v31 = 0u;
            v29 = 0u;
            v23 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->transformRamps, "objectAtIndex:");
            if (v23)
            {
              objc_msgSend(v23, "CMTimeRangeValue");
            }
            else
            {
              v30 = 0u;
              v31 = 0u;
              v29 = 0u;
            }
            *(_OWORD *)&lhs.value = v29;
            lhs.epoch = v30;
            *(_OWORD *)&v26.value = v38;
            v26.epoch = v39;
            CMTimeSubtract(&v28, &lhs, &v26);
            *((_QWORD *)&v39 + 1) = v28.value;
            flags = v28.flags;
            timescale = v28.timescale;
            epoch = v28.epoch;
          }
          v24 = v39;
          *(_OWORD *)&timeRange->start.value = v38;
          *(_OWORD *)&timeRange->start.epoch = v24;
          timeRange->duration.timescale = timescale;
          timeRange->duration.flags = flags;
          timeRange->duration.epoch = epoch;
        }
        v17 = 1;
        goto LABEL_29;
      }
LABEL_15:
      v17 = 0;
LABEL_29:
      _Block_object_dispose(&v34, 8);
      return v17;
    }
  }
  return 0;
}

BOOL __100__AVVideoCompositionLayerInstruction_getTransformRampForTime_startTransform_endTransform_timeRange___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  int32_t v7;
  _BOOL8 result;
  uint64_t v9;
  CMTime v10;
  CMTimeRange range;
  CMTimeRange v12;

  if ((a3 & 1) != 0)
    return 0;
  memset(&v12, 0, sizeof(v12));
  if (a2)
    objc_msgSend(a2, "CMTimeRangeValue");
  range = v12;
  v10 = *(CMTime *)(a1 + 40);
  if (CMTimeRangeContainsTime(&range, &v10))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&v12.start.value;
  range.start.epoch = v12.start.epoch;
  v10 = *(CMTime *)(a1 + 40);
  v7 = CMTimeCompare(&range.start, &v10);
  result = v7 > 0;
  if (v7 < 1)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_QWORD *)(v9 + 24) < a3)
      *(_QWORD *)(v9 + 24) = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    *a4 = 1;
  }
  return result;
}

- (void)_setOpacityRampFromStartOpacity:(float)a3 toEndOpacity:(float)a4 timeRange:(id *)a5 selector:(SEL)a6
{
  NSMutableArray *opacityRamps;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableArray *v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int32_t v25;
  NSMutableArray *v26;
  void *v27;
  $3CC8671D27C23BF42ADDB32F2B5E48AE var0;
  CMTime time1;
  _DWORD v30[2];
  _QWORD v31[4];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

  opacityRamps = self->_layerInstruction->opacityRamps;
  v12 = *(_OWORD *)&a5->var0.var3;
  v35 = *(_OWORD *)&a5->var0.var0;
  v36 = v12;
  v37 = *(_OWORD *)&a5->var1.var1;
  if (AVRampsIncludesRampThatOverlapsTimeRange(opacityRamps, &v35))
  {
    v27 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a6, (uint64_t)CFSTR("The timeRange of an opacity ramp must not overlap the timeRange of an existing opacity ramp."), v13, v14, v15, v16, v17, var0.var0), 0);
    objc_exception_throw(v27);
  }
  v18 = self->_layerInstruction->opacityRamps;
  if (!v18)
  {
    self->_layerInstruction->opacityRamps = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    v18 = self->_layerInstruction->opacityRamps;
  }
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __102__AVVideoCompositionLayerInstruction__setOpacityRampFromStartOpacity_toEndOpacity_timeRange_selector___block_invoke;
  v31[3] = &__block_descriptor_80_e15_B32__0_8Q16_B24l;
  v19 = *(_OWORD *)&a5->var0.var3;
  v32 = *(_OWORD *)&a5->var0.var0;
  v33 = v19;
  v34 = *(_OWORD *)&a5->var1.var1;
  v20 = -[NSMutableArray indexOfObjectPassingTest:](v18, "indexOfObjectPassingTest:", v31);
  v21 = *(_OWORD *)&a5->var0.var3;
  v35 = *(_OWORD *)&a5->var0.var0;
  v36 = v21;
  v37 = *(_OWORD *)&a5->var1.var1;
  v22 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTimeRange:", &v35);
  *(float *)v30 = a3;
  *(float *)&v30[1] = a4;
  v23 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v30, 8);
  if (v20 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray addObject:](self->_layerInstruction->opacityRamps, "addObject:", v22);
    -[NSMutableArray addObject:](self->_layerInstruction->opacityRamps, "addObject:", v23);
  }
  else
  {
    v36 = 0u;
    v37 = 0u;
    v35 = 0u;
    v24 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->opacityRamps, "objectAtIndex:", v20);
    if (v24)
    {
      objc_msgSend(v24, "CMTimeRangeValue");
    }
    else
    {
      v36 = 0u;
      v37 = 0u;
      v35 = 0u;
    }
    *(_OWORD *)&time1.value = v35;
    time1.epoch = v36;
    var0 = a5->var0;
    v25 = CMTimeCompare(&time1, (CMTime *)&var0);
    v26 = self->_layerInstruction->opacityRamps;
    if (v25)
    {
      -[NSMutableArray insertObject:atIndex:](v26, "insertObject:atIndex:", v22, v20);
      -[NSMutableArray insertObject:atIndex:](self->_layerInstruction->opacityRamps, "insertObject:atIndex:", v23, v20 + 1);
    }
    else
    {
      -[NSMutableArray replaceObjectAtIndex:withObject:](v26, "replaceObjectAtIndex:withObject:", v20, v22);
      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_layerInstruction->opacityRamps, "replaceObjectAtIndex:withObject:", v20 + 1, v23);
    }
  }
}

BOOL __102__AVVideoCompositionLayerInstruction__setOpacityRampFromStartOpacity_toEndOpacity_timeRange_selector___block_invoke(uint64_t a1, void *a2, char a3, _BYTE *a4)
{
  _BOOL8 result;
  int32_t v7;
  CMTime v8;
  CMTime time1;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  if ((a3 & 1) != 0)
    return 0;
  if (a2)
  {
    objc_msgSend(a2, "CMTimeRangeValue");
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
  v7 = CMTimeCompare(&time1, &v8);
  result = v7 >= 0;
  if ((v7 & 0x80000000) == 0)
    *a4 = 1;
  return result;
}

- (void)setOpacity:(float)a3 atTime:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v12;
  double v13;
  void *v14;
  CMTime v15;
  CMTime start;
  CMTimeRange v17;

  if ((a4->var2 & 0x1D) != 1)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("The time of an opacity setting must be numeric."), v4, v5, v6, v7, v8, v15.value), 0);
    objc_exception_throw(v14);
  }
  start = *(CMTime *)a4;
  v15 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E30];
  CMTimeRangeMake(&v17, &start, &v15);
  *(float *)&v12 = a3;
  *(float *)&v13 = a3;
  -[AVVideoCompositionLayerInstruction _setOpacityRampFromStartOpacity:toEndOpacity:timeRange:selector:](self, "_setOpacityRampFromStartOpacity:toEndOpacity:timeRange:selector:", &v17, a2, v12, v13);
}

- (void)setOpacityRampFromStartOpacity:(float)a3 toEndOpacity:(float)a4 timeRange:(id *)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  void *v11;
  _OWORD v12[3];

  if ((a5->var0.var2 & 0x1D) != 1 || (a5->var1.var2 & 0x1D) != 1)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("The timeRange of an opacity ramp must have a numeric start time and a numeric duration."), v5, v6, v7, v8, v9, *(uint64_t *)&v12[0]), 0);
    objc_exception_throw(v11);
  }
  v10 = *(_OWORD *)&a5->var0.var3;
  v12[0] = *(_OWORD *)&a5->var0.var0;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&a5->var1.var1;
  -[AVVideoCompositionLayerInstruction _setOpacityRampFromStartOpacity:toEndOpacity:timeRange:selector:](self, "_setOpacityRampFromStartOpacity:toEndOpacity:timeRange:selector:", v12, a2);
}

- (BOOL)getOpacityRampForTime:(CMTime *)time startOpacity:(float *)startOpacity endOpacity:(float *)endOpacity timeRange:(CMTimeRange *)timeRange
{
  AVVideoCompositionLayerInstructionInternal *layerInstruction;
  NSMutableArray *opacityRamps;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  CMTime v23;
  CMTime lhs;
  CMTime v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  CMTime v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  CMTimeScale timescale;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if ((time->flags & 0x1D) == 1)
  {
    layerInstruction = self->_layerInstruction;
    if (layerInstruction->opacityRamps)
    {
      v32 = 0;
      v33 = &v32;
      v34 = 0x2020000000;
      v35 = 0x7FFFFFFFFFFFFFFFLL;
      opacityRamps = layerInstruction->opacityRamps;
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __94__AVVideoCompositionLayerInstruction_getOpacityRampForTime_startOpacity_endOpacity_timeRange___block_invoke;
      v30[3] = &unk_1E30326B8;
      v31 = *time;
      v30[4] = &v32;
      v12 = -[NSMutableArray indexOfObjectPassingTest:](opacityRamps, "indexOfObjectPassingTest:", v30);
      if (v33[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
        v13 = v12;
        if (v12 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_15;
        v14 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->opacityRamps, "objectAtIndex:", v12);
        if (v14)
        {
          objc_msgSend(v14, "CMTimeRangeValue");
          flags = DWORD1(v29);
          epoch = *((_QWORD *)&v29 + 1);
        }
        else
        {
          epoch = 0;
          flags = 0;
          v28 = 0u;
          v29 = 0u;
          v27 = 0u;
        }
        v36 = v27;
        v37 = v28;
        timescale = v29;
      }
      else
      {
        v18 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->opacityRamps, "objectAtIndex:");
        if (v18)
        {
          objc_msgSend(v18, "CMTimeRangeValue");
          flags = DWORD1(v29);
          epoch = *((_QWORD *)&v29 + 1);
        }
        else
        {
          epoch = 0;
          flags = 0;
          v28 = 0u;
          v29 = 0u;
          v27 = 0u;
        }
        v36 = v27;
        v37 = v28;
        timescale = v29;
        v13 = v33[3];
      }
      if (v13 != 0x7FFFFFFFFFFFFFFELL)
      {
        v19 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->opacityRamps, "objectAtIndex:");
        v26 = 0x3F8000003F800000;
        if (v19)
          objc_msgSend(v19, "getBytes:length:", &v26, 8);
        if (startOpacity)
          *(_DWORD *)startOpacity = v26;
        if (endOpacity)
          *endOpacity = *((float *)&v26 + 1);
        if (timeRange)
        {
          if ((~flags & 5) == 0
            && v13 + 2 < (unint64_t)-[NSMutableArray count](self->_layerInstruction->opacityRamps, "count"))
          {
            v28 = 0u;
            v29 = 0u;
            v27 = 0u;
            v20 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->opacityRamps, "objectAtIndex:");
            if (v20)
            {
              objc_msgSend(v20, "CMTimeRangeValue");
            }
            else
            {
              v28 = 0u;
              v29 = 0u;
              v27 = 0u;
            }
            *(_OWORD *)&lhs.value = v27;
            lhs.epoch = v28;
            *(_OWORD *)&v23.value = v36;
            v23.epoch = v37;
            CMTimeSubtract(&v25, &lhs, &v23);
            *((_QWORD *)&v37 + 1) = v25.value;
            flags = v25.flags;
            timescale = v25.timescale;
            epoch = v25.epoch;
          }
          v21 = v37;
          *(_OWORD *)&timeRange->start.value = v36;
          *(_OWORD *)&timeRange->start.epoch = v21;
          timeRange->duration.timescale = timescale;
          timeRange->duration.flags = flags;
          timeRange->duration.epoch = epoch;
        }
        v17 = 1;
        goto LABEL_31;
      }
LABEL_15:
      v17 = 0;
LABEL_31:
      _Block_object_dispose(&v32, 8);
      return v17;
    }
  }
  return 0;
}

BOOL __94__AVVideoCompositionLayerInstruction_getOpacityRampForTime_startOpacity_endOpacity_timeRange___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  int32_t v7;
  _BOOL8 result;
  uint64_t v9;
  CMTime v10;
  CMTimeRange range;
  CMTimeRange v12;

  if ((a3 & 1) != 0)
    return 0;
  memset(&v12, 0, sizeof(v12));
  if (a2)
    objc_msgSend(a2, "CMTimeRangeValue");
  range = v12;
  v10 = *(CMTime *)(a1 + 40);
  if (CMTimeRangeContainsTime(&range, &v10))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&v12.start.value;
  range.start.epoch = v12.start.epoch;
  v10 = *(CMTime *)(a1 + 40);
  v7 = CMTimeCompare(&range.start, &v10);
  result = v7 > 0;
  if (v7 < 1)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_QWORD *)(v9 + 24) < a3)
      *(_QWORD *)(v9 + 24) = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    *a4 = 1;
  }
  return result;
}

- (void)_setCropRectangleRampFromStartCropRectangle:(CGRect)a3 toEndCropRectangle:(CGRect)a4 timeRange:(id *)a5 selector:(SEL)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  NSMutableArray *cropRectangleRamps;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSMutableArray *v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  void *v29;
  const __CFDictionary *v30;
  uint64_t v31;
  void *v32;
  int32_t v33;
  NSMutableArray *v34;
  void *v35;
  uint64_t v36;
  CMTime time2;
  CMTime time1;
  _QWORD v39[4];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  CGRect v46;
  CGRect v47;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3.size.height;
  v13 = a3.size.width;
  v14 = a3.origin.y;
  v15 = a3.origin.x;
  cropRectangleRamps = self->_layerInstruction->cropRectangleRamps;
  v18 = *(_OWORD *)&a5->var0.var3;
  v43 = *(_OWORD *)&a5->var0.var0;
  v44 = v18;
  v45 = *(_OWORD *)&a5->var1.var1;
  if (AVRampsIncludesRampThatOverlapsTimeRange(cropRectangleRamps, &v43))
  {
    v35 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a6, (uint64_t)CFSTR("The timeRange of a crop rectangle ramp must not overlap the timeRange of an existing crop rectangle ramp."), v19, v20, v21, v22, v23, v36), 0);
    objc_exception_throw(v35);
  }
  v24 = self->_layerInstruction->cropRectangleRamps;
  if (!v24)
  {
    self->_layerInstruction->cropRectangleRamps = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    v24 = self->_layerInstruction->cropRectangleRamps;
  }
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __120__AVVideoCompositionLayerInstruction__setCropRectangleRampFromStartCropRectangle_toEndCropRectangle_timeRange_selector___block_invoke;
  v39[3] = &__block_descriptor_80_e15_B32__0_8Q16_B24l;
  v25 = *(_OWORD *)&a5->var0.var3;
  v40 = *(_OWORD *)&a5->var0.var0;
  v41 = v25;
  v42 = *(_OWORD *)&a5->var1.var1;
  v26 = -[NSMutableArray indexOfObjectPassingTest:](v24, "indexOfObjectPassingTest:", v39);
  v27 = *(_OWORD *)&a5->var0.var3;
  v43 = *(_OWORD *)&a5->var0.var0;
  v44 = v27;
  v45 = *(_OWORD *)&a5->var1.var1;
  v28 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTimeRange:", &v43);
  v29 = (void *)MEMORY[0x1E0C99D80];
  v46.origin.x = v15;
  v46.origin.y = v14;
  v46.size.width = v13;
  v46.size.height = v12;
  v30 = CGRectCreateDictionaryRepresentation(v46);
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  v31 = objc_msgSend(v29, "dictionaryWithObjectsAndKeys:", v30, CFSTR("StartCropRectangle"), CGRectCreateDictionaryRepresentation(v47), CFSTR("EndCropRectangle"), 0);
  if (v26 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray addObject:](self->_layerInstruction->cropRectangleRamps, "addObject:", v28);
    -[NSMutableArray addObject:](self->_layerInstruction->cropRectangleRamps, "addObject:", v31);
  }
  else
  {
    v44 = 0u;
    v45 = 0u;
    v43 = 0u;
    v32 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->cropRectangleRamps, "objectAtIndex:", v26);
    if (v32)
    {
      objc_msgSend(v32, "CMTimeRangeValue");
    }
    else
    {
      v44 = 0u;
      v45 = 0u;
      v43 = 0u;
    }
    *(_OWORD *)&time1.value = v43;
    time1.epoch = v44;
    time2 = (CMTime)a5->var0;
    v33 = CMTimeCompare(&time1, &time2);
    v34 = self->_layerInstruction->cropRectangleRamps;
    if (v33)
    {
      -[NSMutableArray insertObject:atIndex:](v34, "insertObject:atIndex:", v28, v26);
      -[NSMutableArray insertObject:atIndex:](self->_layerInstruction->cropRectangleRamps, "insertObject:atIndex:", v31, v26 + 1);
    }
    else
    {
      -[NSMutableArray replaceObjectAtIndex:withObject:](v34, "replaceObjectAtIndex:withObject:", v26, v28);
      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_layerInstruction->cropRectangleRamps, "replaceObjectAtIndex:withObject:", v26 + 1, v31);
    }
  }
}

BOOL __120__AVVideoCompositionLayerInstruction__setCropRectangleRampFromStartCropRectangle_toEndCropRectangle_timeRange_selector___block_invoke(uint64_t a1, void *a2, char a3, _BYTE *a4)
{
  _BOOL8 result;
  int32_t v7;
  CMTime v8;
  CMTime time1;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  if ((a3 & 1) != 0)
    return 0;
  if (a2)
  {
    objc_msgSend(a2, "CMTimeRangeValue");
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
  v7 = CMTimeCompare(&time1, &v8);
  result = v7 >= 0;
  if ((v7 & 0x80000000) == 0)
    *a4 = 1;
  return result;
}

- (void)setCropRectangle:(CGRect)a3 atTime:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double height;
  double width;
  double y;
  double x;
  void *v15;
  CMTime v16;
  CMTime start;
  CMTimeRange v18;

  if ((a4->var2 & 0x1D) != 1)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("The time of a crop rectangle setting must be numeric."), v4, v5, v6, v7, v8, v16.value), 0);
    objc_exception_throw(v15);
  }
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  start = *(CMTime *)a4;
  v16 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E30];
  CMTimeRangeMake(&v18, &start, &v16);
  -[AVVideoCompositionLayerInstruction _setCropRectangleRampFromStartCropRectangle:toEndCropRectangle:timeRange:selector:](self, "_setCropRectangleRampFromStartCropRectangle:toEndCropRectangle:timeRange:selector:", &v18, a2, x, y, width, height, x, y, width, height);
}

- (void)setCropRectangleRampFromStartCropRectangle:(CGRect)a3 toEndCropRectangle:(CGRect)a4 timeRange:(id *)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  void *v11;
  _OWORD v12[3];

  if ((a5->var0.var2 & 0x1D) != 1 || (a5->var1.var2 & 0x1D) != 1)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("The timeRange of a crop rectangle ramp must have a numeric start time and a numeric duration."), v5, v6, v7, v8, v9, *(uint64_t *)&v12[0]), 0);
    objc_exception_throw(v11);
  }
  v10 = *(_OWORD *)&a5->var0.var3;
  v12[0] = *(_OWORD *)&a5->var0.var0;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&a5->var1.var1;
  -[AVVideoCompositionLayerInstruction _setCropRectangleRampFromStartCropRectangle:toEndCropRectangle:timeRange:selector:](self, "_setCropRectangleRampFromStartCropRectangle:toEndCropRectangle:timeRange:selector:", v12, a2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (BOOL)getCropRectangleRampForTime:(CMTime *)time startCropRectangle:(CGRect *)startCropRectangle endCropRectangle:(CGRect *)endCropRectangle timeRange:(CMTimeRange *)timeRange
{
  NSMutableArray *cropRectangleRamps;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFDictionary *v20;
  CGSize size;
  const __CFDictionary *v22;
  CGSize v23;
  void *v24;
  CGSize v25;
  CMTime v27;
  CMTime lhs;
  CMTime v29;
  CGRect rect;
  __int128 v31;
  _QWORD v32[5];
  CMTime v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  CGRect v38;
  CMTimeScale timescale;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if ((time->flags & 0x1D) == 1)
  {
    cropRectangleRamps = self->_layerInstruction->cropRectangleRamps;
    if (cropRectangleRamps)
    {
      v34 = 0;
      v35 = &v34;
      v36 = 0x2020000000;
      v37 = 0x7FFFFFFFFFFFFFFFLL;
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __112__AVVideoCompositionLayerInstruction_getCropRectangleRampForTime_startCropRectangle_endCropRectangle_timeRange___block_invoke;
      v32[3] = &unk_1E30326B8;
      v33 = *time;
      v32[4] = &v34;
      v11 = -[NSMutableArray indexOfObjectPassingTest:](cropRectangleRamps, "indexOfObjectPassingTest:", v32);
      if (v35[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
        v12 = v11;
        if (v11 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_15;
        v13 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->cropRectangleRamps, "objectAtIndex:", v11);
        if (v13)
        {
          objc_msgSend(v13, "CMTimeRangeValue");
          flags = DWORD1(v31);
          epoch = *((_QWORD *)&v31 + 1);
        }
        else
        {
          epoch = 0;
          flags = 0;
          v31 = 0u;
          memset(&rect, 0, sizeof(rect));
        }
        v38 = rect;
        timescale = v31;
      }
      else
      {
        v17 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->cropRectangleRamps, "objectAtIndex:");
        if (v17)
        {
          objc_msgSend(v17, "CMTimeRangeValue");
          flags = DWORD1(v31);
          epoch = *((_QWORD *)&v31 + 1);
        }
        else
        {
          epoch = 0;
          flags = 0;
          v31 = 0u;
          memset(&rect, 0, sizeof(rect));
        }
        v38 = rect;
        timescale = v31;
        v12 = v35[3];
      }
      if (v12 != 0x7FFFFFFFFFFFFFFELL)
      {
        v18 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->cropRectangleRamps, "objectAtIndex:");
        v19 = v18;
        if (startCropRectangle)
        {
          v20 = (const __CFDictionary *)objc_msgSend(v18, "objectForKey:", CFSTR("StartCropRectangle"));
          memset(&rect, 0, sizeof(rect));
          CGRectMakeWithDictionaryRepresentation(v20, &rect);
          size = rect.size;
          startCropRectangle->origin = rect.origin;
          startCropRectangle->size = size;
        }
        if (endCropRectangle)
        {
          v22 = (const __CFDictionary *)objc_msgSend(v19, "objectForKey:", CFSTR("EndCropRectangle"));
          memset(&rect, 0, sizeof(rect));
          CGRectMakeWithDictionaryRepresentation(v22, &rect);
          v23 = rect.size;
          endCropRectangle->origin = rect.origin;
          endCropRectangle->size = v23;
        }
        if (timeRange)
        {
          if ((~flags & 5) == 0
            && v12 + 2 < (unint64_t)-[NSMutableArray count](self->_layerInstruction->cropRectangleRamps, "count"))
          {
            v31 = 0u;
            memset(&rect, 0, sizeof(rect));
            v24 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->cropRectangleRamps, "objectAtIndex:");
            if (v24)
            {
              objc_msgSend(v24, "CMTimeRangeValue");
            }
            else
            {
              v31 = 0u;
              memset(&rect, 0, sizeof(rect));
            }
            *(CGPoint *)&lhs.value = rect.origin;
            lhs.epoch = *(_QWORD *)&rect.size.width;
            v27 = *(CMTime *)&v38.origin.x;
            CMTimeSubtract(&v29, &lhs, &v27);
            *(_QWORD *)&v38.size.height = v29.value;
            flags = v29.flags;
            timescale = v29.timescale;
            epoch = v29.epoch;
          }
          v25 = v38.size;
          *(CGPoint *)&timeRange->start.value = v38.origin;
          *(CGSize *)&timeRange->start.epoch = v25;
          timeRange->duration.timescale = timescale;
          timeRange->duration.flags = flags;
          timeRange->duration.epoch = epoch;
        }
        v16 = 1;
        goto LABEL_29;
      }
LABEL_15:
      v16 = 0;
LABEL_29:
      _Block_object_dispose(&v34, 8);
      return v16;
    }
  }
  return 0;
}

BOOL __112__AVVideoCompositionLayerInstruction_getCropRectangleRampForTime_startCropRectangle_endCropRectangle_timeRange___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  int32_t v7;
  _BOOL8 result;
  uint64_t v9;
  CMTime v10;
  CMTimeRange range;
  CMTimeRange v12;

  if ((a3 & 1) != 0)
    return 0;
  memset(&v12, 0, sizeof(v12));
  if (a2)
    objc_msgSend(a2, "CMTimeRangeValue");
  range = v12;
  v10 = *(CMTime *)(a1 + 40);
  if (CMTimeRangeContainsTime(&range, &v10))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&v12.start.value;
  range.start.epoch = v12.start.epoch;
  v10 = *(CMTime *)(a1 + 40);
  v7 = CMTimeCompare(&range.start, &v10);
  result = v7 > 0;
  if (v7 < 1)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_QWORD *)(v9 + 24) < a3)
      *(_QWORD *)(v9 + 24) = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    *a4 = 1;
  }
  return result;
}

- (id)dictionaryRepresentationWithTimeRange:(id *)a3
{
  void *v5;
  double Seconds;
  CFNumberRef v7;
  CFNumberRef v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  __int128 v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int32_t v18;
  __int128 *v19;
  __int128 v20;
  __int128 *v21;
  id v22;
  double v23;
  void *v24;
  Float64 v25;
  unint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  void *v32;
  void *v33;
  __int128 v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGAffineTransform *p_time2;
  uint64_t i;
  void *v42;
  uint64_t v43;
  void *v44;
  Float64 v45;
  void *v46;
  Float64 v47;
  void *v48;
  Float64 v49;
  void *v50;
  Float64 v51;
  unint64_t v52;
  double v53;
  void *v54;
  unint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  uint64_t v60;
  double v61;
  void *v62;
  Float64 v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  void *v68;
  __int128 v69;
  void *v70;
  void *v71;
  __int128 v72;
  void *v73;
  double v74;
  Float64 v75;
  void *v76;
  Float64 v77;
  double v78;
  void *v79;
  Float64 v80;
  double v81;
  void *v82;
  Float64 v83;
  double v84;
  void *v85;
  Float64 v86;
  double v87;
  unint64_t v88;
  unint64_t v89;
  void *v90;
  CGFloat v91;
  CGFloat v92;
  CGFloat v93;
  CGFloat v94;
  const __CFDictionary *v95;
  const __CFString *v96;
  void *v97;
  void *v98;
  const __CFDictionary *v99;
  CGFloat a;
  CGFloat b;
  CGFloat c;
  CGFloat d;
  const __CFDictionary *v104;
  CGFloat v105;
  CGFloat v106;
  CGFloat v107;
  CGFloat v108;
  void *v109;
  int32_t v110;
  double *v111;
  const __CFDictionary *v112;
  double v113;
  void *v114;
  Float64 v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t v118;
  __int128 v119;
  void *v120;
  __int128 v121;
  void *v122;
  const __CFDictionary *v123;
  double v124;
  double v125;
  double v126;
  double v127;
  const __CFDictionary *v128;
  void *v129;
  CGFloat v130;
  CGFloat v131;
  CGFloat v132;
  CGFloat v133;
  __int128 v134;
  const __CFDictionary *v135;
  Float64 v136;
  CGFloat v137;
  CGFloat v138;
  CGFloat v139;
  CGFloat v140;
  void *v141;
  uint64_t v142;
  void *v143;
  Float64 v144;
  void *v145;
  Float64 v146;
  void *v147;
  Float64 v148;
  void *v149;
  Float64 v150;
  void *v152;
  double v153;
  double v154;
  double v155;
  CMTime *v156;
  double v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  uint64_t v164;
  double v165;
  CMTime *rect1[2];
  double rect1a;
  __int128 v168;
  __int128 v169;
  double v170;
  __int128 v171;
  __int128 v172;
  double v173;
  uint64_t v174;
  __int128 v175;
  double v176;
  unint64_t v177;
  uint64_t v178;
  unint64_t v179;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *p_var1;
  CMTime v181;
  CMTime v182;
  CMTime v183;
  CMTime v184;
  CMTime v185;
  CMTime v186;
  CMTime v187;
  CMTime v188;
  CMTime v189;
  CMTime v190;
  CMTime v191;
  CMTime v192;
  CMTime v193;
  CMTime v194;
  CMTime v195;
  CMTime v196;
  CMTime v197;
  CMTime v198;
  CMTime v199;
  CMTime v200;
  CMTime v201;
  CMTime v202;
  CMTime v203;
  CMTime v204;
  CMTime v205;
  CMTime v206;
  CMTime v207;
  CMTime v208;
  CMTime v209;
  CMTime lhs;
  CMTime v211;
  CMTime v212;
  CGAffineTransform v213;
  CMTime v214;
  CMTime v215;
  CMTime v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  CGAffineTransform v220;
  CMTimeRange v221;
  CGAffineTransform v222;
  CMTime v223;
  CMTime rhs;
  CMTime v225;
  CMTime time1;
  _OWORD v227[3];
  CMTime v228;
  CGAffineTransform v229;
  _BYTE v230[32];
  __int128 v231;
  _BYTE v232[32];
  __int128 v233;
  CGAffineTransform v234;
  CMTimeRange v235;
  CGAffineTransform time2;
  __int128 time;
  _BYTE time_16[56];
  uint64_t v239;
  CGRect v240;
  CGRect v241;
  CGRect v242;
  CGRect v243;
  CGRect v244;

  v239 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
  time = *(_OWORD *)&a3->var1.var0;
  *(_QWORD *)time_16 = a3->var1.var3;
  Seconds = CMTimeGetSeconds((CMTime *)&time);
  v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &self->_layerInstruction->trackID);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("SourceVideoTrackID"));
    CFRelease(v8);
  }
  p_var1 = &a3->var1;
  v9 = -[NSMutableArray count](self->_layerInstruction->transformRamps, "count");
  v10 = MEMORY[0x1E0CA2E68];
  v165 = Seconds;
  v152 = v5;
  if (v9 < 2
    || (v11 = v9,
        time = *(_OWORD *)&p_var1->var0,
        *(_QWORD *)time_16 = a3->var1.var3,
        *(_OWORD *)&time2.a = *MEMORY[0x1E0CA2E68],
        time2.c = *(CGFloat *)(MEMORY[0x1E0CA2E68] + 16),
        !CMTimeCompare((CMTime *)&time, (CMTime *)&time2)))
  {
    v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    time = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)time_16 = v13;
    *(_OWORD *)&time_16[16] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v14 = (id)FigCreate3x2MatrixArrayFromCGAffineTransform();
    v15 = v5;
LABEL_8:
    objc_msgSend(v15, "setObject:forKey:", v14, CFSTR("ConstantAffineMatrix"));
    goto LABEL_51;
  }
  v177 = v11 >> 1;
  v233 = 0u;
  memset(v232, 0, sizeof(v232));
  v12 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->transformRamps, "objectAtIndex:", 0);
  if (v12)
  {
    objc_msgSend(v12, "CMTimeRangeValue");
  }
  else
  {
    v233 = 0u;
    memset(v232, 0, sizeof(v232));
  }
  v16 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->transformRamps, "objectAtIndex:", 1);
  v231 = 0u;
  memset(v230, 0, sizeof(v230));
  objc_msgSend(v16, "objectForKey:", CFSTR("StartTransform"));
  FigGetCGAffineTransformFrom3x2MatrixArray();
  memset(&v229, 0, sizeof(v229));
  objc_msgSend(v16, "objectForKey:", CFSTR("EndTransform"));
  FigGetCGAffineTransformFrom3x2MatrixArray();
  if (v177 == 1)
  {
    time = *(_OWORD *)v232;
    *(_QWORD *)time_16 = *(_QWORD *)&v232[16];
    *(_OWORD *)&time2.a = *(_OWORD *)&a3->var0.var0;
    *(_QWORD *)&time2.c = a3->var0.var3;
    if (!CMTimeCompare((CMTime *)&time, (CMTime *)&time2))
    {
      time = *(_OWORD *)v230;
      *(_OWORD *)time_16 = *(_OWORD *)&v230[16];
      *(_OWORD *)&time_16[16] = v231;
      time2 = v229;
      if (CGAffineTransformEqualToTransform((CGAffineTransform *)&time, &time2))
      {
        time = *(_OWORD *)v230;
        *(_OWORD *)time_16 = *(_OWORD *)&v230[16];
        *(_OWORD *)&time_16[16] = v231;
        v14 = (id)FigCreate3x2MatrixArrayFromCGAffineTransform();
        v15 = v5;
        goto LABEL_8;
      }
    }
  }
  v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3 * v177);
  time = *(_OWORD *)v232;
  *(_QWORD *)time_16 = *(_QWORD *)&v232[16];
  *(_OWORD *)&time2.a = *(_OWORD *)&a3->var0.var0;
  *(_QWORD *)&time2.c = a3->var0.var3;
  v18 = CMTimeCompare((CMTime *)&time, (CMTime *)&time2);
  v19 = (__int128 *)MEMORY[0x1E0C9BAA8];
  if (v18 >= 1)
  {
    v20 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    time = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)time_16 = v20;
    *(_OWORD *)&time_16[16] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v21 = (__int128 *)MEMORY[0x1E0C9BAA8];
    v22 = (id)FigCreate3x2MatrixArrayFromCGAffineTransform();
    LODWORD(v23) = 0;
    objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23));
    objc_msgSend(v17, "addObject:", v22);
    v24 = (void *)MEMORY[0x1E0CB37E8];
    time = *(_OWORD *)v232;
    *(_QWORD *)time_16 = *(_QWORD *)&v232[16];
    *(_OWORD *)&time2.a = *(_OWORD *)&a3->var0.var0;
    *(_QWORD *)&time2.c = a3->var0.var3;
    CMTimeSubtract(&v228, (CMTime *)&time, (CMTime *)&time2);
    v25 = CMTimeGetSeconds(&v228) / Seconds;
    *(float *)&v25 = v25;
    objc_msgSend(v17, "addObject:", objc_msgSend(v24, "numberWithFloat:", v25));
    objc_msgSend(v17, "addObject:", v22);
    v19 = v21;
  }
  v26 = 0;
  v27 = v177;
  if (v177 <= 1)
    v27 = 1;
  v174 = v27;
  v28 = 0uLL;
  v168 = v19[1];
  v171 = *v19;
  *(_OWORD *)rect1 = v19[2];
  v161 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v163 = *MEMORY[0x1E0CA2E40];
  v159 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  do
  {
    v29 = 2 * v26;
    v227[2] = v28;
    v227[1] = v28;
    v227[0] = v28;
    v30 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->transformRamps, "objectAtIndex:", 2 * v26);
    if (v30)
      objc_msgSend(v30, "CMTimeRangeValue");
    else
      memset(v227, 0, sizeof(v227));
    time = v227[0];
    *(_OWORD *)time_16 = v227[1];
    *(_OWORD *)&time_16[16] = v227[2];
    CMTimeRangeGetEnd(&time1, (CMTimeRange *)&time);
    v31 = *(_OWORD *)&a3->var0.var3;
    time = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)time_16 = v31;
    *(_OWORD *)&time_16[16] = *(_OWORD *)&a3->var1.var1;
    CMTimeRangeGetEnd(&v225, (CMTimeRange *)&time);
    if (CMTimeCompare(&time1, &v225) >= 1)
    {
      time = v227[0];
      *(_QWORD *)time_16 = *(_QWORD *)&v227[1];
      *(_OWORD *)&time2.a = *(_OWORD *)&a3->var0.var0;
      *(_QWORD *)&time2.c = a3->var0.var3;
      CMTimeSubtract(&rhs, (CMTime *)&time, (CMTime *)&time2);
      *(_OWORD *)&time2.a = *(_OWORD *)&p_var1->var0;
      *(_QWORD *)&time2.c = a3->var1.var3;
      CMTimeSubtract((CMTime *)&time, (CMTime *)&time2, &rhs);
      *(_OWORD *)((char *)&v227[1] + 8) = time;
      *((_QWORD *)&v227[2] + 1) = *(_QWORD *)time_16;
    }
    memset(&v223, 0, sizeof(v223));
    time = v227[0];
    *(_OWORD *)time_16 = v227[1];
    *(_OWORD *)&time_16[16] = v227[2];
    CMTimeRangeGetEnd(&v223, (CMTimeRange *)&time);
    v32 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->transformRamps, "objectAtIndex:", (2 * v26) | 1);
    memset(&v222, 0, sizeof(v222));
    objc_msgSend(v32, "objectForKey:", CFSTR("StartTransform"));
    FigGetCGAffineTransformFrom3x2MatrixArray();
    memset(&v221, 0, sizeof(v221));
    objc_msgSend(v32, "objectForKey:", CFSTR("EndTransform"));
    FigGetCGAffineTransformFrom3x2MatrixArray();
    *(_OWORD *)&v220.a = v171;
    *(_OWORD *)&v220.c = v168;
    *(_OWORD *)&v220.tx = *(_OWORD *)rect1;
    v217 = v163;
    v218 = v161;
    ++v26;
    v219 = v159;
    if (v26 < v177)
    {
      v33 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->transformRamps, "objectAtIndex:", v29 + 2);
      if (v33)
      {
        objc_msgSend(v33, "CMTimeRangeValue");
      }
      else
      {
        memset(time_16, 0, 32);
        time = 0u;
      }
      v217 = time;
      v218 = *(_OWORD *)time_16;
      v219 = *(_OWORD *)&time_16[16];
      CMTimeRangeGetEnd(&v216, (CMTimeRange *)&time);
      v34 = *(_OWORD *)&a3->var0.var3;
      time = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)time_16 = v34;
      *(_OWORD *)&time_16[16] = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetEnd(&v215, (CMTimeRange *)&time);
      if (CMTimeCompare(&v216, &v215) >= 1)
      {
        time = v217;
        *(_QWORD *)time_16 = v218;
        *(_OWORD *)&time2.a = *(_OWORD *)&a3->var0.var0;
        *(_QWORD *)&time2.c = a3->var0.var3;
        CMTimeSubtract(&v214, (CMTime *)&time, (CMTime *)&time2);
        time = *(_OWORD *)&p_var1->var0;
        *(_QWORD *)time_16 = a3->var1.var3;
        CMTimeSubtract((CMTime *)((char *)&v218 + 8), (CMTime *)&time, &v214);
      }
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_layerInstruction->transformRamps, "objectAtIndex:", v29 + 3), "objectForKey:", CFSTR("StartTransform"));
      FigGetCGAffineTransformFrom3x2MatrixArray();
      time = v217;
      *(_QWORD *)time_16 = v218;
      *(_OWORD *)&time2.a = *(_OWORD *)&v223.value;
      *(_QWORD *)&time2.c = v223.epoch;
      if (CMTimeCompare((CMTime *)&time, (CMTime *)&time2) < 0)
      {
        time = *(_OWORD *)((char *)&v227[1] + 8);
        *(_QWORD *)time_16 = *((_QWORD *)&v227[2] + 1);
        v35 = CMTimeGetSeconds((CMTime *)&time);
        *(_OWORD *)&time2.a = v217;
        *(_QWORD *)&time2.c = v218;
        *(_OWORD *)&v235.start.value = v227[0];
        v235.start.epoch = *(_QWORD *)&v227[1];
        CMTimeSubtract((CMTime *)&time, (CMTime *)&time2, &v235.start);
        *((_QWORD *)&v227[2] + 1) = *(_QWORD *)time_16;
        *(_OWORD *)((char *)&v227[1] + 8) = time;
        time = v227[0];
        *(_OWORD *)time_16 = v227[1];
        *(_OWORD *)&time_16[16] = v227[2];
        CMTimeRangeGetEnd((CMTime *)&time2, (CMTimeRange *)&time);
        *(_OWORD *)&v223.value = *(_OWORD *)&time2.a;
        v223.epoch = *(_QWORD *)&time2.c;
        time = *(_OWORD *)((char *)&v227[1] + 8);
        *(_QWORD *)time_16 = *((_QWORD *)&v227[2] + 1);
        v36 = CMTimeGetSeconds((CMTime *)&time);
        memset(&v213, 0, sizeof(v213));
        time2 = v222;
        v235 = v221;
        avvc_CGAffineTransformDecompose((uint64_t)&time2, (uint64_t)&time);
        avvc_CGAffineTransformDecompose((uint64_t)&v235, (uint64_t)&time2);
        if ((*(double *)&time >= 0.0 || time2.b >= 0.0) && (*((double *)&time + 1) >= 0.0 || time2.a >= 0.0))
        {
          v37 = *(double *)time_16;
        }
        else
        {
          *(double *)&time = -*(double *)&time;
          *((double *)&time + 1) = -*((double *)&time + 1);
          v37 = *(double *)time_16 + dbl_19357CE30[*(double *)time_16 < 0.0];
        }
        v38 = fmod(v37, 6.28318531);
        *(double *)time_16 = v38;
        v39 = fmod(time2.c, 6.28318531);
        time2.c = v39;
        if (vabdd_f64(v38, v39) > 3.14159265)
        {
          if (v38 <= v39)
          {
            p_time2 = &time2;
          }
          else
          {
            v39 = v38;
            p_time2 = (CGAffineTransform *)&time;
          }
          p_time2->c = v39 + -6.28318531;
        }
        for (i = 0; i != 72; i += 8)
          *(double *)&time_16[i - 16] = *(double *)&time_16[i - 16]
                                      + v36 / v35 * (*(double *)((char *)&time2.a + i) - *(double *)&time_16[i - 16]);
        v213 = *(CGAffineTransform *)&time_16[8];
        v235 = *(CMTimeRange *)&time_16[8];
        CGAffineTransformRotate(&v213, (CGAffineTransform *)&v235, *(CGFloat *)time_16);
        v234 = v213;
        CGAffineTransformScale((CGAffineTransform *)&v235, &v234, *(CGFloat *)&time, *((CGFloat *)&time + 1));
        v213 = (CGAffineTransform)v235;
        v42 = (void *)MEMORY[0x1E0C99D80];
        v43 = objc_msgSend(v32, "objectForKey:", CFSTR("StartTransform"));
        time = *(_OWORD *)&v213.a;
        *(_OWORD *)time_16 = *(_OWORD *)&v213.c;
        *(_OWORD *)&time_16[16] = *(_OWORD *)&v213.tx;
        v32 = (void *)objc_msgSend(v42, "dictionaryWithObjectsAndKeys:", v43, CFSTR("StartTransform"), (id)FigCreate3x2MatrixArrayFromCGAffineTransform(), CFSTR("EndTransform"), 0);
        Seconds = v165;
      }
    }
    v44 = (void *)MEMORY[0x1E0CB37E8];
    time = v227[0];
    *(_QWORD *)time_16 = *(_QWORD *)&v227[1];
    *(_OWORD *)&time2.a = *(_OWORD *)&a3->var0.var0;
    *(_QWORD *)&time2.c = a3->var0.var3;
    CMTimeSubtract(&v212, (CMTime *)&time, (CMTime *)&time2);
    v45 = CMTimeGetSeconds(&v212) / Seconds;
    *(float *)&v45 = v45;
    objc_msgSend(v17, "addObject:", objc_msgSend(v44, "numberWithFloat:", v45));
    objc_msgSend(v17, "addObject:", objc_msgSend(v32, "objectForKey:", CFSTR("StartTransform")));
    v46 = (void *)MEMORY[0x1E0CB37E8];
    time = v227[0];
    *(_OWORD *)time_16 = v227[1];
    *(_OWORD *)&time_16[16] = v227[2];
    CMTimeRangeGetEnd(&lhs, (CMTimeRange *)&time);
    time = *(_OWORD *)&a3->var0.var0;
    *(_QWORD *)time_16 = a3->var0.var3;
    CMTimeSubtract(&v211, &lhs, (CMTime *)&time);
    v47 = CMTimeGetSeconds(&v211) / Seconds;
    *(float *)&v47 = v47;
    objc_msgSend(v17, "addObject:", objc_msgSend(v46, "numberWithFloat:", v47));
    objc_msgSend(v17, "addObject:", objc_msgSend(v32, "objectForKey:", CFSTR("EndTransform")));
    if (v26 < v177)
    {
      time = v217;
      *(_QWORD *)time_16 = v218;
      *(_OWORD *)&time2.a = *(_OWORD *)&v223.value;
      *(_QWORD *)&time2.c = v223.epoch;
      if (CMTimeCompare((CMTime *)&time, (CMTime *)&time2) >= 1)
      {
        time = *(_OWORD *)&v221.start.value;
        *(_OWORD *)time_16 = *(_OWORD *)&v221.start.epoch;
        *(_OWORD *)&time_16[16] = *(_OWORD *)&v221.duration.timescale;
        time2 = v220;
        if (!CGAffineTransformEqualToTransform((CGAffineTransform *)&time, &time2))
        {
          v48 = (void *)MEMORY[0x1E0CB37E8];
          time = v227[0];
          *(_OWORD *)time_16 = v227[1];
          *(_OWORD *)&time_16[16] = v227[2];
          CMTimeRangeGetEnd(&v208, (CMTimeRange *)&time);
          time = *(_OWORD *)&a3->var0.var0;
          *(_QWORD *)time_16 = a3->var0.var3;
          CMTimeSubtract(&v209, &v208, (CMTime *)&time);
          v49 = CMTimeGetSeconds(&v209) / Seconds;
          *(float *)&v49 = v49;
          objc_msgSend(v17, "addObject:", objc_msgSend(v48, "numberWithFloat:", v49));
          objc_msgSend(v17, "addObject:", objc_msgSend(v32, "objectForKey:", CFSTR("EndTransform")));
          v50 = (void *)MEMORY[0x1E0CB37E8];
          time = v217;
          *(_QWORD *)time_16 = v218;
          *(_OWORD *)&time2.a = *(_OWORD *)&a3->var0.var0;
          *(_QWORD *)&time2.c = a3->var0.var3;
          CMTimeSubtract(&v207, (CMTime *)&time, (CMTime *)&time2);
          v51 = CMTimeGetSeconds(&v207) / Seconds;
          *(float *)&v51 = v51;
          objc_msgSend(v17, "addObject:", objc_msgSend(v50, "numberWithFloat:", v51));
          objc_msgSend(v17, "addObject:", objc_msgSend(v32, "objectForKey:", CFSTR("EndTransform")));
        }
      }
    }
    v28 = 0uLL;
  }
  while (v26 != v174);
  objc_msgSend(v5, "setObject:forKey:", v17, CFSTR("TweenedAffineMatrix"), 0.0);
  v10 = MEMORY[0x1E0CA2E68];
LABEL_51:
  v52 = -[NSMutableArray count](self->_layerInstruction->opacityRamps, "count");
  if (v52 <= 1)
  {
    v54 = (void *)MEMORY[0x1E0CB37E8];
    LODWORD(v53) = 1.0;
LABEL_53:
    objc_msgSend(v5, "setObject:forKey:", objc_msgSend(v54, "numberWithFloat:", v53), CFSTR("ConstantOpacity"));
    goto LABEL_86;
  }
  v55 = v52 >> 1;
  memset(time_16, 0, 32);
  time = 0u;
  v56 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->opacityRamps, "objectAtIndex:", 0);
  if (v56)
  {
    objc_msgSend(v56, "CMTimeRangeValue");
  }
  else
  {
    memset(time_16, 0, 32);
    time = 0u;
  }
  v57 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->opacityRamps, "objectAtIndex:", 1);
  *(_QWORD *)&v227[0] = 0x3F8000003F800000;
  objc_msgSend(v57, "getBytes:length:", v227, 8);
  if (v55 == 1)
  {
    *(_OWORD *)&time2.a = time;
    time2.c = *(CGFloat *)time_16;
    *(_OWORD *)&v235.start.value = *(_OWORD *)&a3->var0.var0;
    v235.start.epoch = a3->var0.var3;
    if (!CMTimeCompare((CMTime *)&time2, &v235.start))
    {
      LODWORD(v53) = v227[0];
      if (*(float *)v227 == *((float *)v227 + 1))
      {
        v54 = (void *)MEMORY[0x1E0CB37E8];
        goto LABEL_53;
      }
    }
  }
  v58 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3 * v55);
  *(_OWORD *)&time2.a = time;
  time2.c = *(CGFloat *)time_16;
  *(_OWORD *)&v235.start.value = *(_OWORD *)&a3->var0.var0;
  v235.start.epoch = a3->var0.var3;
  if (CMTimeCompare((CMTime *)&time2, &v235.start) >= 1)
  {
    LODWORD(v59) = 1.0;
    v60 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v59);
    LODWORD(v61) = 0;
    objc_msgSend(v58, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v61));
    objc_msgSend(v58, "addObject:", v60);
    v62 = (void *)MEMORY[0x1E0CB37E8];
    *(_OWORD *)&time2.a = time;
    time2.c = *(CGFloat *)time_16;
    *(_OWORD *)&v235.start.value = *(_OWORD *)&a3->var0.var0;
    v235.start.epoch = a3->var0.var3;
    CMTimeSubtract(&v206, (CMTime *)&time2, &v235.start);
    v63 = CMTimeGetSeconds(&v206) / Seconds;
    *(float *)&v63 = v63;
    objc_msgSend(v58, "addObject:", objc_msgSend(v62, "numberWithFloat:", v63));
    objc_msgSend(v58, "addObject:", v60);
  }
  v64 = 0;
  if (v55 <= 1)
    v65 = 1;
  else
    v65 = v55;
  v178 = v65;
  v66 = 1;
  v67 = 0uLL;
  v172 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v175 = *MEMORY[0x1E0CA2E40];
  v169 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  do
  {
    *(_OWORD *)&time2.tx = v67;
    *(_OWORD *)&time2.c = v67;
    *(_OWORD *)&time2.a = v67;
    v68 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->opacityRamps, "objectAtIndex:", v66 - 1);
    if (v68)
      objc_msgSend(v68, "CMTimeRangeValue");
    else
      memset(&time2, 0, sizeof(time2));
    v235 = (CMTimeRange)time2;
    CMTimeRangeGetEnd(&v205, &v235);
    v69 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&v235.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&v235.start.epoch = v69;
    *(_OWORD *)&v235.duration.timescale = *(_OWORD *)&a3->var1.var1;
    CMTimeRangeGetEnd(&v204, &v235);
    if (CMTimeCompare(&v205, &v204) >= 1)
    {
      *(_OWORD *)&v235.start.value = *(_OWORD *)&time2.a;
      v235.start.epoch = *(_QWORD *)&time2.c;
      *(_OWORD *)&v234.a = *(_OWORD *)&a3->var0.var0;
      *(_QWORD *)&v234.c = a3->var0.var3;
      CMTimeSubtract(&v203, &v235.start, (CMTime *)&v234);
      *(_OWORD *)&v234.a = *(_OWORD *)&p_var1->var0;
      *(_QWORD *)&v234.c = a3->var1.var3;
      CMTimeSubtract(&v235.start, (CMTime *)&v234, &v203);
      *(_OWORD *)&time2.d = *(_OWORD *)&v235.start.value;
      *(_QWORD *)&time2.ty = v235.start.epoch;
    }
    memset(v232, 0, 24);
    v235 = (CMTimeRange)time2;
    CMTimeRangeGetEnd((CMTime *)v232, &v235);
    v70 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->opacityRamps, "objectAtIndex:", v66);
    v222.a = 0.00781250185;
    objc_msgSend(v70, "getBytes:length:", &v222, 8);
    v221.start.value = 0x3F8000003F800000;
    *(_OWORD *)&v235.start.value = v175;
    *(_OWORD *)&v235.start.epoch = v172;
    *(_OWORD *)&v235.duration.timescale = v169;
    if (++v64 < v55)
    {
      v71 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->opacityRamps, "objectAtIndex:", v66 + 1);
      if (v71)
        objc_msgSend(v71, "CMTimeRangeValue");
      else
        memset(&v234, 0, sizeof(v234));
      v235 = (CMTimeRange)v234;
      CMTimeRangeGetEnd(&v202, (CMTimeRange *)&v234);
      v72 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&v234.a = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&v234.c = v72;
      *(_OWORD *)&v234.tx = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetEnd(&v201, (CMTimeRange *)&v234);
      if (CMTimeCompare(&v202, &v201) >= 1)
      {
        *(_OWORD *)&v234.a = *(_OWORD *)&v235.start.value;
        *(_QWORD *)&v234.c = v235.start.epoch;
        *(_OWORD *)v230 = *(_OWORD *)&a3->var0.var0;
        *(_QWORD *)&v230[16] = a3->var0.var3;
        CMTimeSubtract(&v200, (CMTime *)&v234, (CMTime *)v230);
        *(_OWORD *)&v234.a = *(_OWORD *)&p_var1->var0;
        *(_QWORD *)&v234.c = a3->var1.var3;
        CMTimeSubtract(&v235.duration, (CMTime *)&v234, &v200);
      }
      v73 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->opacityRamps, "objectAtIndex:", v66 + 2);
      if (v73)
        objc_msgSend(v73, "getBytes:length:", &v221, 8);
      *(_OWORD *)&v234.a = *(_OWORD *)&v235.start.value;
      *(_QWORD *)&v234.c = v235.start.epoch;
      *(_OWORD *)v230 = *(_OWORD *)v232;
      *(_QWORD *)&v230[16] = *(_QWORD *)&v232[16];
      if (CMTimeCompare((CMTime *)&v234, (CMTime *)v230) < 0)
      {
        *(_OWORD *)&v234.a = *(_OWORD *)&time2.d;
        v234.c = time2.ty;
        v74 = CMTimeGetSeconds((CMTime *)&v234);
        *(_OWORD *)v230 = *(_OWORD *)&v235.start.value;
        *(_QWORD *)&v230[16] = v235.start.epoch;
        *(_OWORD *)&v229.a = *(_OWORD *)&time2.a;
        v229.c = time2.c;
        CMTimeSubtract((CMTime *)&v234, (CMTime *)v230, (CMTime *)&v229);
        time2.ty = v234.c;
        *(_OWORD *)&time2.d = *(_OWORD *)&v234.a;
        v234 = time2;
        CMTimeRangeGetEnd((CMTime *)v230, (CMTimeRange *)&v234);
        *(_OWORD *)v232 = *(_OWORD *)v230;
        *(_QWORD *)&v232[16] = *(_QWORD *)&v230[16];
        *(_OWORD *)&v234.a = *(_OWORD *)&time2.d;
        v234.c = time2.ty;
        v75 = CMTimeGetSeconds((CMTime *)&v234);
        *(float *)&v75 = v75 * (float)(*((float *)&v222.a + 1) - *(float *)&v222.a) / v74 + *(float *)&v222.a;
        HIDWORD(v222.a) = LODWORD(v75);
      }
    }
    v76 = (void *)MEMORY[0x1E0CB37E8];
    *(_OWORD *)&v234.a = *(_OWORD *)&time2.a;
    v234.c = time2.c;
    *(_OWORD *)v230 = *(_OWORD *)&a3->var0.var0;
    *(_QWORD *)&v230[16] = a3->var0.var3;
    CMTimeSubtract(&v199, (CMTime *)&v234, (CMTime *)v230);
    v77 = CMTimeGetSeconds(&v199) / Seconds;
    *(float *)&v77 = v77;
    objc_msgSend(v58, "addObject:", objc_msgSend(v76, "numberWithFloat:", v77));
    LODWORD(v78) = LODWORD(v222.a);
    objc_msgSend(v58, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v78));
    v79 = (void *)MEMORY[0x1E0CB37E8];
    v234 = time2;
    CMTimeRangeGetEnd(&v197, (CMTimeRange *)&v234);
    *(_OWORD *)&v234.a = *(_OWORD *)&a3->var0.var0;
    *(_QWORD *)&v234.c = a3->var0.var3;
    CMTimeSubtract(&v198, &v197, (CMTime *)&v234);
    v80 = CMTimeGetSeconds(&v198) / Seconds;
    *(float *)&v80 = v80;
    objc_msgSend(v58, "addObject:", objc_msgSend(v79, "numberWithFloat:", v80));
    LODWORD(v81) = HIDWORD(v222.a);
    objc_msgSend(v58, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v81));
    if (v64 < v55)
    {
      *(_OWORD *)&v234.a = *(_OWORD *)&v235.start.value;
      *(_QWORD *)&v234.c = v235.start.epoch;
      *(_OWORD *)v230 = *(_OWORD *)v232;
      *(_QWORD *)&v230[16] = *(_QWORD *)&v232[16];
      if (CMTimeCompare((CMTime *)&v234, (CMTime *)v230) >= 1 && *((float *)&v222.a + 1) != *(float *)&v221.start.value)
      {
        v82 = (void *)MEMORY[0x1E0CB37E8];
        v234 = time2;
        CMTimeRangeGetEnd(&v195, (CMTimeRange *)&v234);
        *(_OWORD *)&v234.a = *(_OWORD *)&a3->var0.var0;
        *(_QWORD *)&v234.c = a3->var0.var3;
        CMTimeSubtract(&v196, &v195, (CMTime *)&v234);
        v83 = CMTimeGetSeconds(&v196) / Seconds;
        *(float *)&v83 = v83;
        objc_msgSend(v58, "addObject:", objc_msgSend(v82, "numberWithFloat:", v83));
        LODWORD(v84) = HIDWORD(v222.a);
        objc_msgSend(v58, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v84));
        v85 = (void *)MEMORY[0x1E0CB37E8];
        *(_OWORD *)&v234.a = *(_OWORD *)&v235.start.value;
        *(_QWORD *)&v234.c = v235.start.epoch;
        *(_OWORD *)v230 = *(_OWORD *)&a3->var0.var0;
        *(_QWORD *)&v230[16] = a3->var0.var3;
        CMTimeSubtract(&v194, (CMTime *)&v234, (CMTime *)v230);
        v86 = CMTimeGetSeconds(&v194) / Seconds;
        *(float *)&v86 = v86;
        objc_msgSend(v58, "addObject:", objc_msgSend(v85, "numberWithFloat:", v86));
        LODWORD(v87) = HIDWORD(v222.a);
        objc_msgSend(v58, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v87));
      }
    }
    v66 += 2;
    v67 = 0uLL;
  }
  while (v178 != v64);
  objc_msgSend(v5, "setObject:forKey:", v58, CFSTR("TweenedOpacity"), 0.0);
  v10 = MEMORY[0x1E0CA2E68];
LABEL_86:
  v88 = -[NSMutableArray count](self->_layerInstruction->cropRectangleRamps, "count");
  if (v88 < 2
    || (v89 = v88,
        time = *(_OWORD *)&p_var1->var0,
        *(_QWORD *)time_16 = a3->var1.var3,
        *(_OWORD *)&time2.a = *(_OWORD *)v10,
        time2.c = *(CGFloat *)(v10 + 16),
        !CMTimeCompare((CMTime *)&time, (CMTime *)&time2)))
  {
    v91 = *MEMORY[0x1E0C9D5E0];
    v92 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    v93 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    v94 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
LABEL_91:
    v95 = CGRectCreateDictionaryRepresentation(*(CGRect *)&v91);
    v96 = CFSTR("ConstantCropRectangle");
    v97 = v5;
    goto LABEL_122;
  }
  v179 = v89 >> 1;
  memset(time_16, 0, 32);
  time = 0u;
  v90 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->cropRectangleRamps, "objectAtIndex:", 0);
  if (v90)
  {
    objc_msgSend(v90, "CMTimeRangeValue");
  }
  else
  {
    memset(time_16, 0, 32);
    time = 0u;
  }
  v98 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->cropRectangleRamps, "objectAtIndex:", 1);
  v99 = (const __CFDictionary *)objc_msgSend(v98, "objectForKey:", CFSTR("StartCropRectangle"));
  memset(&time2, 0, 32);
  CGRectMakeWithDictionaryRepresentation(v99, (CGRect *)&time2);
  a = time2.a;
  b = time2.b;
  c = time2.c;
  d = time2.d;
  v104 = (const __CFDictionary *)objc_msgSend(v98, "objectForKey:", CFSTR("EndCropRectangle"));
  memset(&time2, 0, 32);
  CGRectMakeWithDictionaryRepresentation(v104, (CGRect *)&time2);
  if (v179 == 1)
  {
    v105 = time2.a;
    v106 = time2.b;
    v107 = time2.c;
    v108 = time2.d;
    *(_OWORD *)&time2.a = time;
    time2.c = *(CGFloat *)time_16;
    *(_OWORD *)&v235.start.value = *(_OWORD *)&a3->var0.var0;
    v235.start.epoch = a3->var0.var3;
    if (!CMTimeCompare((CMTime *)&time2, &v235.start))
    {
      v240.origin.x = a;
      v240.origin.y = b;
      v240.size.width = c;
      v240.size.height = d;
      v243.origin.x = v105;
      v243.origin.y = v106;
      v243.size.width = v107;
      v243.size.height = v108;
      if (CGRectEqualToRect(v240, v243))
      {
        v91 = a;
        v92 = b;
        v93 = c;
        v94 = d;
        goto LABEL_91;
      }
    }
  }
  v109 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3 * v179);
  *(_OWORD *)&time2.a = time;
  time2.c = *(CGFloat *)time_16;
  *(_OWORD *)&v235.start.value = *(_OWORD *)&a3->var0.var0;
  v235.start.epoch = a3->var0.var3;
  v110 = CMTimeCompare((CMTime *)&time2, &v235.start);
  v111 = (double *)MEMORY[0x1E0C9D5E0];
  if (v110 >= 1)
  {
    v112 = CGRectCreateDictionaryRepresentation(*MEMORY[0x1E0C9D5E0]);
    LODWORD(v113) = 0;
    objc_msgSend(v109, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v113));
    objc_msgSend(v109, "addObject:", v112);
    v114 = (void *)MEMORY[0x1E0CB37E8];
    *(_OWORD *)&time2.a = time;
    time2.c = *(CGFloat *)time_16;
    *(_OWORD *)&v235.start.value = *(_OWORD *)&a3->var0.var0;
    v235.start.epoch = a3->var0.var3;
    CMTimeSubtract(&v193, (CMTime *)&time2, &v235.start);
    v115 = CMTimeGetSeconds(&v193) / v165;
    *(float *)&v115 = v115;
    objc_msgSend(v109, "addObject:", objc_msgSend(v114, "numberWithFloat:", v115));
    objc_msgSend(v109, "addObject:", v112);
  }
  v116 = 0;
  v156 = *((CMTime **)v111 + 1);
  v157 = *v111;
  v154 = v111[3];
  v155 = v111[2];
  v117 = v89 >> 1;
  if (v179 <= 1)
    v117 = 1;
  v164 = v117;
  v118 = 1;
  v119 = 0uLL;
  v160 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v162 = *MEMORY[0x1E0CA2E40];
  v158 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  do
  {
    *(_OWORD *)&time2.tx = v119;
    *(_OWORD *)&time2.c = v119;
    *(_OWORD *)&time2.a = v119;
    v120 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->cropRectangleRamps, "objectAtIndex:", v118 - 1);
    if (v120)
      objc_msgSend(v120, "CMTimeRangeValue");
    else
      memset(&time2, 0, sizeof(time2));
    v235 = (CMTimeRange)time2;
    CMTimeRangeGetEnd(&v192, &v235);
    v121 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&v235.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&v235.start.epoch = v121;
    *(_OWORD *)&v235.duration.timescale = *(_OWORD *)&a3->var1.var1;
    CMTimeRangeGetEnd(&v191, &v235);
    if (CMTimeCompare(&v192, &v191) >= 1)
    {
      *(_OWORD *)&v235.start.value = *(_OWORD *)&time2.a;
      v235.start.epoch = *(_QWORD *)&time2.c;
      *(_OWORD *)&v234.a = *(_OWORD *)&a3->var0.var0;
      *(_QWORD *)&v234.c = a3->var0.var3;
      CMTimeSubtract(&v190, &v235.start, (CMTime *)&v234);
      *(_OWORD *)&v234.a = *(_OWORD *)&p_var1->var0;
      *(_QWORD *)&v234.c = a3->var1.var3;
      CMTimeSubtract(&v235.start, (CMTime *)&v234, &v190);
      *(_OWORD *)&time2.d = *(_OWORD *)&v235.start.value;
      *(_QWORD *)&time2.ty = v235.start.epoch;
    }
    memset(v232, 0, 24);
    v235 = (CMTimeRange)time2;
    CMTimeRangeGetEnd((CMTime *)v232, &v235);
    v122 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->cropRectangleRamps, "objectAtIndex:", v118);
    v123 = (const __CFDictionary *)objc_msgSend(v122, "objectForKey:", CFSTR("StartCropRectangle"));
    memset(&v235, 0, 32);
    CGRectMakeWithDictionaryRepresentation(v123, (CGRect *)&v235);
    v124 = *(double *)&v235.start.value;
    v125 = *(double *)&v235.start.timescale;
    v126 = *(double *)&v235.start.epoch;
    v127 = *(double *)&v235.duration.value;
    v128 = (const __CFDictionary *)objc_msgSend(v122, "objectForKey:", CFSTR("EndCropRectangle"));
    memset(&v235, 0, 32);
    CGRectMakeWithDictionaryRepresentation(v128, (CGRect *)&v235);
    v176 = *(double *)&v235.start.value;
    v173 = *(double *)&v235.start.timescale;
    v170 = *(double *)&v235.start.epoch;
    rect1a = *(double *)&v235.duration.value;
    *(_OWORD *)&v235.start.value = v162;
    *(_OWORD *)&v235.start.epoch = v160;
    ++v116;
    *(_OWORD *)&v235.duration.timescale = v158;
    if (v116 >= v179)
    {
      v131 = *(double *)&v156;
      v130 = v157;
      v132 = v154;
      v133 = v155;
    }
    else
    {
      v129 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->cropRectangleRamps, "objectAtIndex:", v118 + 1);
      if (v129)
        objc_msgSend(v129, "CMTimeRangeValue");
      else
        memset(&v234, 0, sizeof(v234));
      v235 = (CMTimeRange)v234;
      CMTimeRangeGetEnd(&v189, (CMTimeRange *)&v234);
      v134 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&v234.a = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&v234.c = v134;
      *(_OWORD *)&v234.tx = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetEnd(&v188, (CMTimeRange *)&v234);
      if (CMTimeCompare(&v189, &v188) >= 1)
      {
        *(_OWORD *)&v234.a = *(_OWORD *)&v235.start.value;
        *(_QWORD *)&v234.c = v235.start.epoch;
        *(_OWORD *)v230 = *(_OWORD *)&a3->var0.var0;
        *(_QWORD *)&v230[16] = a3->var0.var3;
        CMTimeSubtract(&v187, (CMTime *)&v234, (CMTime *)v230);
        *(_OWORD *)&v234.a = *(_OWORD *)&p_var1->var0;
        *(_QWORD *)&v234.c = a3->var1.var3;
        CMTimeSubtract(&v235.duration, (CMTime *)&v234, &v187);
      }
      v135 = (const __CFDictionary *)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_layerInstruction->cropRectangleRamps, "objectAtIndex:", v118 + 2), "objectForKey:", CFSTR("StartCropRectangle"));
      memset(&v234, 0, 32);
      CGRectMakeWithDictionaryRepresentation(v135, (CGRect *)&v234);
      v130 = v234.a;
      v131 = v234.b;
      v133 = v234.c;
      v132 = v234.d;
      *(_OWORD *)&v234.a = *(_OWORD *)&v235.start.value;
      *(_QWORD *)&v234.c = v235.start.epoch;
      *(_OWORD *)v230 = *(_OWORD *)v232;
      *(_QWORD *)&v230[16] = *(_QWORD *)&v232[16];
      if (CMTimeCompare((CMTime *)&v234, (CMTime *)v230) < 0)
      {
        *(_OWORD *)&v234.a = *(_OWORD *)&time2.d;
        v234.c = time2.ty;
        v153 = CMTimeGetSeconds((CMTime *)&v234);
        *(_OWORD *)v230 = *(_OWORD *)&v235.start.value;
        *(_QWORD *)&v230[16] = v235.start.epoch;
        *(_OWORD *)&v229.a = *(_OWORD *)&time2.a;
        v229.c = time2.c;
        CMTimeSubtract((CMTime *)&v234, (CMTime *)v230, (CMTime *)&v229);
        time2.ty = v234.c;
        *(_OWORD *)&time2.d = *(_OWORD *)&v234.a;
        v234 = time2;
        CMTimeRangeGetEnd((CMTime *)v230, (CMTimeRange *)&v234);
        *(_OWORD *)v232 = *(_OWORD *)v230;
        *(_QWORD *)&v232[16] = *(_QWORD *)&v230[16];
        *(_OWORD *)&v234.a = *(_OWORD *)&time2.d;
        v234.c = time2.ty;
        v136 = CMTimeGetSeconds((CMTime *)&v234) / v153;
        v137 = v124 + v136 * (v176 - v124);
        v138 = v125 + v136 * (v173 - v125);
        v139 = v126 + v136 * (v170 - v126);
        v140 = v127 + v136 * (rect1a - v127);
        v141 = (void *)MEMORY[0x1E0C99D80];
        v142 = objc_msgSend(v122, "objectForKey:", CFSTR("StartCropRectangle"));
        v241.origin.x = v137;
        v241.origin.y = v138;
        v241.size.width = v139;
        v241.size.height = v140;
        v122 = (void *)objc_msgSend(v141, "dictionaryWithObjectsAndKeys:", v142, CFSTR("StartCropRectangle"), CGRectCreateDictionaryRepresentation(v241), CFSTR("EndCropRectangle"), 0);
      }
    }
    v143 = (void *)MEMORY[0x1E0CB37E8];
    *(_OWORD *)&v234.a = *(_OWORD *)&time2.a;
    v234.c = time2.c;
    *(_OWORD *)v230 = *(_OWORD *)&a3->var0.var0;
    *(_QWORD *)&v230[16] = a3->var0.var3;
    CMTimeSubtract(&v186, (CMTime *)&v234, (CMTime *)v230);
    v144 = CMTimeGetSeconds(&v186) / v165;
    *(float *)&v144 = v144;
    objc_msgSend(v109, "addObject:", objc_msgSend(v143, "numberWithFloat:", v144));
    objc_msgSend(v109, "addObject:", objc_msgSend(v122, "objectForKey:", CFSTR("StartCropRectangle")));
    v145 = (void *)MEMORY[0x1E0CB37E8];
    v234 = time2;
    CMTimeRangeGetEnd(&v184, (CMTimeRange *)&v234);
    *(_OWORD *)&v234.a = *(_OWORD *)&a3->var0.var0;
    *(_QWORD *)&v234.c = a3->var0.var3;
    CMTimeSubtract(&v185, &v184, (CMTime *)&v234);
    v146 = CMTimeGetSeconds(&v185) / v165;
    *(float *)&v146 = v146;
    objc_msgSend(v109, "addObject:", objc_msgSend(v145, "numberWithFloat:", v146));
    objc_msgSend(v109, "addObject:", objc_msgSend(v122, "objectForKey:", CFSTR("EndCropRectangle")));
    if (v116 < v179)
    {
      *(_OWORD *)&v234.a = *(_OWORD *)&v235.start.value;
      *(_QWORD *)&v234.c = v235.start.epoch;
      *(_OWORD *)v230 = *(_OWORD *)v232;
      *(_QWORD *)&v230[16] = *(_QWORD *)&v232[16];
      if (CMTimeCompare((CMTime *)&v234, (CMTime *)v230) >= 1)
      {
        v242.origin.x = v176;
        v242.origin.y = v173;
        v242.size.width = v170;
        v242.size.height = rect1a;
        v244.origin.x = v130;
        v244.origin.y = v131;
        v244.size.width = v133;
        v244.size.height = v132;
        if (!CGRectEqualToRect(v242, v244))
        {
          v147 = (void *)MEMORY[0x1E0CB37E8];
          v234 = time2;
          CMTimeRangeGetEnd(&v182, (CMTimeRange *)&v234);
          *(_OWORD *)&v234.a = *(_OWORD *)&a3->var0.var0;
          *(_QWORD *)&v234.c = a3->var0.var3;
          CMTimeSubtract(&v183, &v182, (CMTime *)&v234);
          v148 = CMTimeGetSeconds(&v183) / v165;
          *(float *)&v148 = v148;
          objc_msgSend(v109, "addObject:", objc_msgSend(v147, "numberWithFloat:", v148));
          objc_msgSend(v109, "addObject:", objc_msgSend(v122, "objectForKey:", CFSTR("EndCropRectangle")));
          v149 = (void *)MEMORY[0x1E0CB37E8];
          *(_OWORD *)&v234.a = *(_OWORD *)&v235.start.value;
          *(_QWORD *)&v234.c = v235.start.epoch;
          *(_OWORD *)v230 = *(_OWORD *)&a3->var0.var0;
          *(_QWORD *)&v230[16] = a3->var0.var3;
          CMTimeSubtract(&v181, (CMTime *)&v234, (CMTime *)v230);
          v150 = CMTimeGetSeconds(&v181) / v165;
          *(float *)&v150 = v150;
          objc_msgSend(v109, "addObject:", objc_msgSend(v149, "numberWithFloat:", v150));
          objc_msgSend(v109, "addObject:", objc_msgSend(v122, "objectForKey:", CFSTR("EndCropRectangle")));
        }
      }
    }
    v118 += 2;
    v119 = 0uLL;
  }
  while (v164 != v116);
  v96 = CFSTR("TweenedCropRectangle");
  v5 = v152;
  v97 = v152;
  v95 = (const __CFDictionary *)v109;
LABEL_122:
  objc_msgSend(v97, "setObject:forKey:", v95, v96);
  return v5;
}

- (void)_setValuesFromDictionary:(id)a3 timeRange:(id *)a4
{
  const __CFNumber *v7;
  const __CFNumber *v8;
  CFTypeID v9;
  uint64_t v10;
  __int128 v11;
  void *v12;
  void *v13;
  float v14;
  const __CFDictionary *v15;
  const __CFDictionary *v16;
  double x;
  double y;
  double width;
  double height;
  CGPoint *p_var1;
  float Seconds;
  void *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  float v28;
  float v29;
  float v30;
  float v31;
  CMTime *p_rect;
  CMTime *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  float v39;
  float v40;
  float v41;
  float v42;
  CMTime *p_t2;
  CMTime *v44;
  int v45;
  int v46;
  int v47;
  int v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  float v56;
  float v57;
  float v58;
  float v59;
  CMTime *v60;
  CMTime *v61;
  const __CFDictionary *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  const __CFDictionary *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  float v72;
  CMTimeRange v73;
  CMTime v74;
  CMTime v75;
  CMTime v76;
  CMTime v77;
  CMTimeRange v78;
  CMTime v79;
  CMTime v80;
  CMTime v81;
  CMTime v82;
  CGAffineTransform duration;
  CMTimeRange v84;
  CMTime v85;
  CMTime lhs;
  CMTime v87;
  CMTime v88;
  CMTime rhs;
  CMTime var0;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGRect rect;
  __int128 v94;
  _DWORD valuePtr[3];

  -[AVVideoCompositionLayerInstruction setTrackID:](self, "setTrackID:", 0);
  -[AVVideoCompositionLayerInstruction _setTransformRamps:](self, "_setTransformRamps:", 0);
  -[AVVideoCompositionLayerInstruction _setOpacityRamps:](self, "_setOpacityRamps:", 0);
  -[AVVideoCompositionLayerInstruction _setCropRectangleRamps:](self, "_setCropRectangleRamps:", 0);
  valuePtr[0] = 0;
  v7 = (const __CFNumber *)objc_msgSend(a3, "objectForKey:", CFSTR("SourceVideoTrackID"));
  if (v7)
  {
    v8 = v7;
    v9 = CFGetTypeID(v7);
    if (v9 == CFNumberGetTypeID())
    {
      if (CFNumberGetValue(v8, kCFNumberSInt32Type, valuePtr))
        -[AVVideoCompositionLayerInstruction setTrackID:](self, "setTrackID:", valuePtr[0]);
    }
  }
  v10 = objc_msgSend(a3, "objectForKey:", CFSTR("ConstantAffineMatrix"));
  if (v10)
  {
    v94 = 0u;
    memset(&rect, 0, sizeof(rect));
    FigGetCGAffineTransformFrom3x2MatrixArray();
    memset(&t1, 0, sizeof(t1));
    v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&t2.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&t2.c = v11;
    *(_OWORD *)&t2.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    if (!CGAffineTransformEqualToTransform(&t1, &t2))
    {
      *(CGPoint *)&t1.a = rect.origin;
      *(CGSize *)&t1.c = rect.size;
      *(_OWORD *)&t1.tx = v94;
      *(_OWORD *)&t2.a = *(_OWORD *)&a4->var0.var0;
      *(_QWORD *)&t2.c = a4->var0.var3;
      -[AVVideoCompositionLayerInstruction setTransform:atTime:](self, "setTransform:atTime:", &t1, &t2);
    }
  }
  v12 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("ConstantOpacity"));
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "floatValue");
    if (v14 != 1.0)
    {
      rect.origin = *(CGPoint *)&a4->var0.var0;
      *(_QWORD *)&rect.size.width = a4->var0.var3;
      -[AVVideoCompositionLayerInstruction setOpacity:atTime:](self, "setOpacity:atTime:", &rect);
    }
  }
  v15 = (const __CFDictionary *)objc_msgSend(a3, "objectForKey:", CFSTR("ConstantCropRectangle"));
  v16 = v15;
  if (v15)
  {
    memset(&rect, 0, sizeof(rect));
    CGRectMakeWithDictionaryRepresentation(v15, &rect);
    x = rect.origin.x;
    y = rect.origin.y;
    width = rect.size.width;
    height = rect.size.height;
    if (!CGRectEqualToRect(rect, *MEMORY[0x1E0C9D5E0]))
    {
      rect.origin = *(CGPoint *)&a4->var0.var0;
      *(_QWORD *)&rect.size.width = a4->var0.var3;
      -[AVVideoCompositionLayerInstruction setCropRectangle:atTime:](self, "setCropRectangle:atTime:", &rect, x, y, width, height);
    }
  }
  p_var1 = (CGPoint *)&a4->var1;
  rect.origin = *(CGPoint *)&a4->var1.var0;
  *(_QWORD *)&rect.size.width = a4->var1.var3;
  Seconds = CMTimeGetSeconds((CMTime *)&rect);
  if (!v10)
  {
    v23 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("TweenedAffineMatrix"));
    if (v23)
    {
      v24 = v23;
      v25 = objc_msgSend(v23, "count");
      if (v25 >= 4)
      {
        v26 = v25 >> 2;
        v27 = 3;
        do
        {
          objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", v27 - 3), "floatValue");
          v29 = v28;
          objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", v27 - 1), "floatValue");
          v31 = v30;
          memset(&var0, 0, sizeof(var0));
          if (v27 == 3)
          {
            var0 = (CMTime)a4->var0;
          }
          else
          {
            CMTimeMakeWithSeconds(&rhs, (float)(v29 * Seconds), 600);
            rect.origin = *(CGPoint *)&a4->var0.var0;
            *(_QWORD *)&rect.size.width = a4->var0.var3;
            CMTimeAdd(&var0, (CMTime *)&rect, &rhs);
          }
          memset(&v88, 0, sizeof(v88));
          if (v26 == 1)
          {
            rect.origin = *(CGPoint *)&var0.value;
            *(_QWORD *)&rect.size.width = var0.epoch;
            *(_OWORD *)&t1.a = *(_OWORD *)&a4->var0.var0;
            *(_QWORD *)&t1.c = a4->var0.var3;
            CMTimeSubtract(&v87, (CMTime *)&rect, (CMTime *)&t1);
            rect.origin = *p_var1;
            *(_QWORD *)&rect.size.width = a4->var1.var3;
            p_rect = (CMTime *)&rect;
            v33 = &v87;
          }
          else
          {
            CMTimeMakeWithSeconds(&v85, (float)(v31 * Seconds), 600);
            rect.origin = *(CGPoint *)&a4->var0.var0;
            *(_QWORD *)&rect.size.width = a4->var0.var3;
            CMTimeAdd(&lhs, (CMTime *)&rect, &v85);
            rect.origin = *(CGPoint *)&var0.value;
            *(_QWORD *)&rect.size.width = var0.epoch;
            p_rect = &lhs;
            v33 = (CMTime *)&rect;
          }
          CMTimeSubtract(&v88, p_rect, v33);
          v94 = 0u;
          memset(&rect, 0, sizeof(rect));
          objc_msgSend(v24, "objectAtIndex:", v27 - 2);
          FigGetCGAffineTransformFrom3x2MatrixArray();
          memset(&t1, 0, sizeof(t1));
          objc_msgSend(v24, "objectAtIndex:", v27);
          FigGetCGAffineTransformFrom3x2MatrixArray();
          *(_OWORD *)&t2.a = *(_OWORD *)&var0.value;
          *(_QWORD *)&t2.c = var0.epoch;
          *(CMTime *)&duration.a = v88;
          CMTimeRangeMake(&v84, (CMTime *)&t2, (CMTime *)&duration);
          *(CGPoint *)&t2.a = rect.origin;
          *(CGSize *)&t2.c = rect.size;
          *(_OWORD *)&t2.tx = v94;
          duration = t1;
          -[AVVideoCompositionLayerInstruction setTransformRampFromStartTransform:toEndTransform:timeRange:](self, "setTransformRampFromStartTransform:toEndTransform:timeRange:", &t2, &duration, &v84);
          v27 += 4;
          --v26;
        }
        while (v26);
      }
    }
  }
  if (!v13)
  {
    v34 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("TweenedOpacity"));
    if (v34)
    {
      v35 = v34;
      v36 = objc_msgSend(v34, "count");
      if (v36 >= 4)
      {
        v37 = v36 >> 2;
        v38 = 3;
        do
        {
          objc_msgSend((id)objc_msgSend(v35, "objectAtIndex:", v38 - 3), "floatValue");
          v40 = v39;
          objc_msgSend((id)objc_msgSend(v35, "objectAtIndex:", v38 - 1), "floatValue");
          v42 = v41;
          memset(&rect, 0, 24);
          if (v38 == 3)
          {
            rect.origin = *(CGPoint *)&a4->var0.var0;
            *(_QWORD *)&rect.size.width = a4->var0.var3;
          }
          else
          {
            CMTimeMakeWithSeconds(&v82, (float)(v40 * Seconds), 600);
            *(_OWORD *)&t1.a = *(_OWORD *)&a4->var0.var0;
            *(_QWORD *)&t1.c = a4->var0.var3;
            CMTimeAdd((CMTime *)&rect, (CMTime *)&t1, &v82);
          }
          memset(&t1, 0, 24);
          if (v37 == 1)
          {
            *(CGPoint *)&t2.a = rect.origin;
            t2.c = rect.size.width;
            *(_OWORD *)&duration.a = *(_OWORD *)&a4->var0.var0;
            *(_QWORD *)&duration.c = a4->var0.var3;
            CMTimeSubtract(&v81, (CMTime *)&t2, (CMTime *)&duration);
            *(CGPoint *)&t2.a = *p_var1;
            *(_QWORD *)&t2.c = a4->var1.var3;
            p_t2 = (CMTime *)&t2;
            v44 = &v81;
          }
          else
          {
            CMTimeMakeWithSeconds(&v79, (float)(v42 * Seconds), 600);
            *(_OWORD *)&t2.a = *(_OWORD *)&a4->var0.var0;
            *(_QWORD *)&t2.c = a4->var0.var3;
            CMTimeAdd(&v80, (CMTime *)&t2, &v79);
            *(CGPoint *)&t2.a = rect.origin;
            t2.c = rect.size.width;
            p_t2 = &v80;
            v44 = (CMTime *)&t2;
          }
          CMTimeSubtract((CMTime *)&t1, p_t2, v44);
          objc_msgSend((id)objc_msgSend(v35, "objectAtIndex:", v38 - 2), "floatValue");
          v46 = v45;
          objc_msgSend((id)objc_msgSend(v35, "objectAtIndex:", v38), "floatValue");
          v48 = v47;
          *(CGPoint *)&t2.a = rect.origin;
          t2.c = rect.size.width;
          *(_OWORD *)&duration.a = *(_OWORD *)&t1.a;
          duration.c = t1.c;
          CMTimeRangeMake(&v78, (CMTime *)&t2, (CMTime *)&duration);
          LODWORD(v49) = v46;
          LODWORD(v50) = v48;
          -[AVVideoCompositionLayerInstruction setOpacityRampFromStartOpacity:toEndOpacity:timeRange:](self, "setOpacityRampFromStartOpacity:toEndOpacity:timeRange:", &v78, v49, v50);
          v38 += 4;
          --v37;
        }
        while (v37);
      }
    }
  }
  if (!v16)
  {
    v51 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("TweenedCropRectangle"));
    if (v51)
    {
      v52 = v51;
      v53 = objc_msgSend(v51, "count");
      if (v53 >= 4)
      {
        v54 = v53 >> 2;
        v55 = 3;
        v72 = Seconds;
        do
        {
          objc_msgSend((id)objc_msgSend(v52, "objectAtIndex:", v55 - 3), "floatValue");
          v57 = v56;
          objc_msgSend((id)objc_msgSend(v52, "objectAtIndex:", v55 - 1), "floatValue");
          v59 = v58;
          memset(&t1, 0, 24);
          if (v55 == 3)
          {
            *(_OWORD *)&t1.a = *(_OWORD *)&a4->var0.var0;
            *(_QWORD *)&t1.c = a4->var0.var3;
          }
          else
          {
            CMTimeMakeWithSeconds(&v77, (float)(v57 * Seconds), 600);
            rect.origin = *(CGPoint *)&a4->var0.var0;
            *(_QWORD *)&rect.size.width = a4->var0.var3;
            CMTimeAdd((CMTime *)&t1, (CMTime *)&rect, &v77);
          }
          memset(&t2, 0, 24);
          if (v54 == 1)
          {
            rect.origin = *(CGPoint *)&t1.a;
            rect.size.width = t1.c;
            *(_OWORD *)&duration.a = *(_OWORD *)&a4->var0.var0;
            *(_QWORD *)&duration.c = a4->var0.var3;
            CMTimeSubtract(&v76, (CMTime *)&rect, (CMTime *)&duration);
            rect.origin = *p_var1;
            *(_QWORD *)&rect.size.width = a4->var1.var3;
            v60 = (CMTime *)&rect;
            v61 = &v76;
          }
          else
          {
            CMTimeMakeWithSeconds(&v74, (float)(v59 * Seconds), 600);
            rect.origin = *(CGPoint *)&a4->var0.var0;
            *(_QWORD *)&rect.size.width = a4->var0.var3;
            CMTimeAdd(&v75, (CMTime *)&rect, &v74);
            rect.origin = *(CGPoint *)&t1.a;
            rect.size.width = t1.c;
            v60 = &v75;
            v61 = (CMTime *)&rect;
          }
          CMTimeSubtract((CMTime *)&t2, v60, v61);
          v62 = (const __CFDictionary *)objc_msgSend(v52, "objectAtIndex:", v55 - 2);
          memset(&rect, 0, sizeof(rect));
          CGRectMakeWithDictionaryRepresentation(v62, &rect);
          v63 = rect.origin.x;
          v64 = rect.origin.y;
          v65 = rect.size.width;
          v66 = rect.size.height;
          v67 = (const __CFDictionary *)objc_msgSend(v52, "objectAtIndex:", v55);
          memset(&rect, 0, sizeof(rect));
          CGRectMakeWithDictionaryRepresentation(v67, &rect);
          v68 = rect.origin.x;
          v69 = rect.origin.y;
          v70 = rect.size.width;
          v71 = rect.size.height;
          rect.origin = *(CGPoint *)&t1.a;
          rect.size.width = t1.c;
          *(_OWORD *)&duration.a = *(_OWORD *)&t2.a;
          duration.c = t2.c;
          CMTimeRangeMake(&v73, (CMTime *)&rect, (CMTime *)&duration);
          -[AVVideoCompositionLayerInstruction setCropRectangleRampFromStartCropRectangle:toEndCropRectangle:timeRange:](self, "setCropRectangleRampFromStartCropRectangle:toEndCropRectangle:timeRange:", &v73, v63, v64, v65, v66, v68, v69, v70, v71);
          v55 += 4;
          --v54;
          Seconds = v72;
        }
        while (v54);
      }
    }
  }
}

@end
