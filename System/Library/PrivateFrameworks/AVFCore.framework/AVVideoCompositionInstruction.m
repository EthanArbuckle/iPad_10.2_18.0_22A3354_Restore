@implementation AVVideoCompositionInstruction

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(a1, "setVersion:", 1);
}

- (AVVideoCompositionInstruction)init
{
  AVVideoCompositionInstruction *v2;
  AVVideoCompositionInstructionInternal *v3;
  __int128 v4;
  _OWORD v6[3];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVVideoCompositionInstruction;
  v2 = -[AVVideoCompositionInstruction init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AVVideoCompositionInstructionInternal);
    v2->_instruction = v3;
    if (v3)
    {
      CFRetain(v3);
      v4 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
      v6[0] = *MEMORY[0x1E0CA2E40];
      v6[1] = v4;
      v6[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
      -[AVVideoCompositionInstruction setTimeRange:](v2, "setTimeRange:", v6);
      -[AVVideoCompositionInstruction setEnablePostProcessing:](v2, "setEnablePostProcessing:", 1);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (AVVideoCompositionInstruction)initWithCoder:(id)a3
{
  AVVideoCompositionInstruction *v4;
  AVVideoCompositionInstructionInternal *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AVVideoCompositionInstruction;
  v4 = -[AVVideoCompositionInstruction init](&v12, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(AVVideoCompositionInstructionInternal);
    v4->_instruction = v5;
    if (v5)
    {
      CFRetain(v5);
      v6 = (void *)MEMORY[0x1E0C99E60];
      v7 = objc_opt_class();
      v8 = objc_opt_class();
      v9 = objc_opt_class();
      v10 = objc_opt_class();
      -[AVVideoCompositionInstruction _setValuesFromDictionary:](v4, "_setValuesFromDictionary:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0), CFSTR("AVVideoCompositionInstruction")));
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
  objc_msgSend(a3, "encodeObject:forKey:", -[AVVideoCompositionInstruction dictionaryRepresentation](self, "dictionaryRepresentation"), CFSTR("AVVideoCompositionInstruction"));
}

- (BOOL)isEqual:(id)a3
{
  $11E8FAD63EF01618BAA11C8CE4E61C06 *p_timeRange;
  __int128 v6;
  __int128 v7;
  int v8;
  CGColor *backgroundColor;
  CGColor *v10;
  NSArray *layerInstructions;
  uint64_t v12;
  int enablePostProcessing;
  CMTimeRange v15;
  CMTimeRange range2;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_14;
  p_timeRange = &self->_instruction->timeRange;
  if (a3)
    objc_msgSend(a3, "timeRange");
  else
    memset(&range2, 0, sizeof(range2));
  v6 = *(_OWORD *)&p_timeRange->start.value;
  v7 = *(_OWORD *)&p_timeRange->duration.timescale;
  *(_OWORD *)&v15.start.epoch = *(_OWORD *)&p_timeRange->start.epoch;
  *(_OWORD *)&v15.duration.timescale = v7;
  *(_OWORD *)&v15.start.value = v6;
  v8 = CMTimeRangeEqual(&v15, &range2);
  if (v8)
  {
    backgroundColor = self->_instruction->backgroundColor;
    v10 = (CGColor *)objc_msgSend(a3, "backgroundColor");
    if (backgroundColor)
    {
      if (!CGColorEqualToColor(backgroundColor, v10))
        goto LABEL_14;
    }
    else if (v10)
    {
      goto LABEL_14;
    }
    layerInstructions = self->_instruction->layerInstructions;
    v12 = objc_msgSend(a3, "layerInstructions");
    if (layerInstructions)
    {
      if ((-[NSArray isEqual:](layerInstructions, "isEqual:", v12) & 1) != 0)
      {
LABEL_12:
        enablePostProcessing = self->_instruction->enablePostProcessing;
        LOBYTE(v8) = enablePostProcessing == objc_msgSend(a3, "enablePostProcessing");
        return v8;
      }
    }
    else if (!v12)
    {
      goto LABEL_12;
    }
LABEL_14:
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVVideoCompositionInstruction *v5;
  _OWORD v7[3];

  if (-[AVVideoCompositionInstruction isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
    return self;
  v5 = -[AVVideoCompositionInstruction init](+[AVVideoCompositionInstruction allocWithZone:](AVVideoCompositionInstruction, "allocWithZone:", a3), "init");
  if (v5)
  {
    if (self)
      -[AVVideoCompositionInstruction timeRange](self, "timeRange");
    else
      memset(v7, 0, sizeof(v7));
    -[AVVideoCompositionInstruction setTimeRange:](v5, "setTimeRange:", v7);
    -[AVVideoCompositionInstruction setBackgroundColor:](v5, "setBackgroundColor:", -[AVVideoCompositionInstruction backgroundColor](self, "backgroundColor"));
    -[AVVideoCompositionInstruction setLayerInstructions:](v5, "setLayerInstructions:", -[AVVideoCompositionInstruction layerInstructions](self, "layerInstructions"));
    -[AVVideoCompositionInstruction setRequiredSourceSampleDataTrackIDs:](v5, "setRequiredSourceSampleDataTrackIDs:", -[AVVideoCompositionInstruction requiredSourceSampleDataTrackIDs](self, "requiredSourceSampleDataTrackIDs"));
    -[AVVideoCompositionInstruction setEnablePostProcessing:](v5, "setEnablePostProcessing:", -[AVVideoCompositionInstruction enablePostProcessing](self, "enablePostProcessing"));
  }
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  AVMutableVideoCompositionInstruction *v4;
  _OWORD v6[3];

  v4 = -[AVVideoCompositionInstruction init](+[AVMutableVideoCompositionInstruction allocWithZone:](AVMutableVideoCompositionInstruction, "allocWithZone:", a3), "init");
  if (v4)
  {
    if (self)
      -[AVVideoCompositionInstruction timeRange](self, "timeRange");
    else
      memset(v6, 0, sizeof(v6));
    -[AVMutableVideoCompositionInstruction setTimeRange:](v4, "setTimeRange:", v6);
    -[AVMutableVideoCompositionInstruction setBackgroundColor:](v4, "setBackgroundColor:", -[AVVideoCompositionInstruction backgroundColor](self, "backgroundColor"));
    -[AVMutableVideoCompositionInstruction setLayerInstructions:](v4, "setLayerInstructions:", -[AVVideoCompositionInstruction layerInstructions](self, "layerInstructions"));
    -[AVMutableVideoCompositionInstruction setRequiredSourceSampleDataTrackIDs:](v4, "setRequiredSourceSampleDataTrackIDs:", -[AVVideoCompositionInstruction requiredSourceSampleDataTrackIDs](self, "requiredSourceSampleDataTrackIDs"));
    -[AVMutableVideoCompositionInstruction setEnablePostProcessing:](v4, "setEnablePostProcessing:", -[AVVideoCompositionInstruction enablePostProcessing](self, "enablePostProcessing"));
  }
  return v4;
}

- (id)_deepCopy
{
  id v3;
  NSArray *v4;
  NSArray *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (id)-[AVVideoCompositionInstruction mutableCopy](self, "mutableCopy");
  v4 = -[AVVideoCompositionInstruction layerInstructions](self, "layerInstructions");
  v5 = -[AVVideoCompositionInstruction requiredSourceSampleDataTrackIDs](self, "requiredSourceSampleDataTrackIDs");
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v4, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v4);
        objc_msgSend(v6, "addObject:", (id)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v10++), "copy"));
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }
  objc_msgSend(v3, "setLayerInstructions:", v6);
  if (-[AVVideoCompositionInstruction requiredSourceSampleDataTrackIDs](self, "requiredSourceSampleDataTrackIDs"))
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v5, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v5);
          objc_msgSend(v11, "addObject:", (id)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15++), "copy"));
        }
        while (v13 != v15);
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v13);
    }
    objc_msgSend(v3, "setRequiredSourceSampleDataTrackIDs:", v11);
  }
  return (id)objc_msgSend(v3, "copy");
}

- (void)dealloc
{
  AVVideoCompositionInstructionInternal *instruction;
  CGColor *backgroundColor;
  objc_super v5;

  instruction = self->_instruction;
  if (instruction)
  {
    backgroundColor = instruction->backgroundColor;
    if (backgroundColor)
    {
      CFRelease(backgroundColor);
      instruction = self->_instruction;
    }

    CFRelease(self->_instruction);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVVideoCompositionInstruction;
  -[AVVideoCompositionInstruction dealloc](&v5, sel_dealloc);
}

- (CMPersistentTrackID)passthroughTrackID
{
  return 0;
}

- (NSArray)requiredSourceTrackIDs
{
  NSArray *v3;
  NSArray *layerInstructions;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  layerInstructions = self->_instruction->layerInstructions;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](layerInstructions, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(layerInstructions);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "trackID");
        -[NSArray addObject:](v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9));
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](layerInstructions, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v3;
}

- (BOOL)containsTweening
{
  NSArray *layerInstructions;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  layerInstructions = self->_instruction->layerInstructions;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](layerInstructions, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(layerInstructions);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[AVVideoCompositionInstruction timeRange](self, "timeRange");
        v9 = (void *)objc_msgSend(v8, "dictionaryRepresentationWithTimeRange:", &v11);
        if (objc_msgSend(v9, "objectForKey:", CFSTR("TweenedAffineMatrix"))
          || objc_msgSend(v9, "objectForKey:", CFSTR("TweenedOpacity"))
          || objc_msgSend(v9, "objectForKey:", CFSTR("TweenedCropRectangle")))
        {
          LOBYTE(v4) = 1;
          return v4;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](layerInstructions, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      LOBYTE(v4) = 0;
      if (v5)
        continue;
      break;
    }
  }
  return v4;
}

- (CMTimeRange)timeRange
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)&self->start.timescale;
  v4 = *(_OWORD *)(v3 + 24);
  *(_OWORD *)&retstr->start.value = *(_OWORD *)(v3 + 8);
  *(_OWORD *)&retstr->start.epoch = v4;
  *(_OWORD *)&retstr->duration.timescale = *(_OWORD *)(v3 + 40);
  return self;
}

- (void)setTimeRange:(id *)a3
{
  AVVideoCompositionInstructionInternal *instruction;
  __int128 v4;
  __int128 v5;

  instruction = self->_instruction;
  v4 = *(_OWORD *)&a3->var0.var0;
  v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&instruction->timeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&instruction->timeRange.start.epoch = v5;
  *(_OWORD *)&instruction->timeRange.start.value = v4;
}

- (CGColorRef)backgroundColor
{
  return self->_instruction->backgroundColor;
}

- (void)setBackgroundColor:(CGColor *)a3
{
  AVVideoCompositionInstructionInternal *instruction;
  CGColor *backgroundColor;

  if (a3)
    CFRetain(a3);
  instruction = self->_instruction;
  backgroundColor = instruction->backgroundColor;
  if (backgroundColor)
  {
    CFRelease(backgroundColor);
    instruction = self->_instruction;
  }
  instruction->backgroundColor = a3;
}

- (NSArray)layerInstructions
{
  return self->_instruction->layerInstructions;
}

- (void)setLayerInstructions:(id)a3
{
  NSArray *layerInstructions;

  layerInstructions = self->_instruction->layerInstructions;
  if (layerInstructions != a3)
  {

    self->_instruction->layerInstructions = (NSArray *)objc_msgSend(a3, "copy");
  }
}

- (BOOL)enablePostProcessing
{
  return self->_instruction->enablePostProcessing;
}

- (void)setEnablePostProcessing:(BOOL)a3
{
  self->_instruction->enablePostProcessing = a3;
}

- (id)blendingTransferFunction
{
  return self->_instruction->blendingTransferFunction;
}

- (void)setBlendingTransferFunction:(id)a3
{
  AVVideoCompositionInstructionInternal *instruction;
  NSString *blendingTransferFunction;

  if (a3)
    CFRetain(a3);
  instruction = self->_instruction;
  blendingTransferFunction = instruction->blendingTransferFunction;
  if (blendingTransferFunction)
  {
    CFRelease(blendingTransferFunction);
    instruction = self->_instruction;
  }
  instruction->blendingTransferFunction = (NSString *)a3;
}

- (NSArray)requiredSourceSampleDataTrackIDs
{
  return self->_instruction->requiredSourceSampleDataTrackIDs;
}

- (void)setRequiredSourceSampleDataTrackIDs:(id)a3
{
  NSArray *requiredSourceSampleDataTrackIDs;

  requiredSourceSampleDataTrackIDs = self->_instruction->requiredSourceSampleDataTrackIDs;
  if (requiredSourceSampleDataTrackIDs != a3)
  {

    self->_instruction->requiredSourceSampleDataTrackIDs = (NSArray *)objc_msgSend(a3, "copy");
  }
}

- (id)dictionaryRepresentation
{
  void *v3;
  const __CFAllocator *v4;
  CFDictionaryRef v5;
  CFDictionaryRef v6;
  CGColor *backgroundColor;
  const CGFloat *Components;
  CGColorSpace *ColorSpace;
  float v10;
  float v11;
  float v12;
  float v13;
  void *v14;
  CGColorSpace *v15;
  CFDataRef v16;
  CFDataRef v17;
  uint64_t v18;
  void *v19;
  NSArray *layerInstructions;
  uint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  AVVideoCompositionInstruction *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CMTimeRange time;
  CMTime v37;
  CMTimeRange v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 5);
  memset(&v38, 0, sizeof(v38));
  if (self)
    -[AVVideoCompositionInstruction timeRange](self, "timeRange");
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  *(_OWORD *)&time.start.value = *(_OWORD *)&v38.start.value;
  time.start.epoch = v38.start.epoch;
  v5 = CMTimeCopyAsDictionary(&time.start, v4);
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("StartTime"));
  if (v5)
    CFRelease(v5);
  time = v38;
  CMTimeRangeGetEnd(&v37, &time);
  v6 = CMTimeCopyAsDictionary(&v37, v4);
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("EndTime"));
  if (v6)
    CFRelease(v6);
  if (-[AVVideoCompositionInstruction requiredSourceSampleDataTrackIDs](self, "requiredSourceSampleDataTrackIDs"))
    objc_msgSend(v3, "setObject:forKey:", -[AVVideoCompositionInstruction requiredSourceSampleDataTrackIDs](self, "requiredSourceSampleDataTrackIDs"), CFSTR("RequiredSampleDataTrackIDArray"));
  backgroundColor = self->_instruction->backgroundColor;
  if (backgroundColor)
  {
    Components = CGColorGetComponents(backgroundColor);
    ColorSpace = CGColorGetColorSpace(self->_instruction->backgroundColor);
    if (CGColorSpaceGetModel(ColorSpace) == kCGColorSpaceModelRGB)
    {
      v10 = *Components;
      v11 = Components[1];
      v12 = Components[2];
      v13 = Components[3];
      v14 = NSArrayFromRGBAComponents(v10, v11, v12, v13);
      if (v14)
        objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("BackgroundColorARGB"));
      v15 = CGColorGetColorSpace(self->_instruction->backgroundColor);
      if (v15)
      {
        v16 = CGColorSpaceCopyICCData(v15);
        if (v16)
        {
          v17 = v16;
          objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("BackgroundColorICCProfile"));
          CFRelease(v17);
        }
      }
    }
  }
  v18 = -[NSArray count](self->_instruction->layerInstructions, "count");
  if (v18 >= 1)
  {
    v31 = v3;
    v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v18);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v30 = self;
    layerInstructions = self->_instruction->layerInstructions;
    v21 = -[NSArray countByEnumeratingWithState:objects:count:](layerInstructions, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    if (v21)
    {
      v22 = v21;
      LOBYTE(v23) = 0;
      v24 = *(_QWORD *)v33;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v33 != v24)
            objc_enumerationMutation(layerInstructions);
          v26 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v25);
          time = v38;
          v27 = (void *)objc_msgSend(v26, "dictionaryRepresentationWithTimeRange:", &time);
          if (v27)
            objc_msgSend(v19, "addObject:", v27);
          v23 = v23
             || objc_msgSend(v27, "objectForKey:", CFSTR("TweenedAffineMatrix"))
             || objc_msgSend(v27, "objectForKey:", CFSTR("TweenedOpacity"))
             || objc_msgSend(v27, "objectForKey:", CFSTR("TweenedCropRectangle")) != 0;
          ++v25;
        }
        while (v22 != v25);
        v28 = -[NSArray countByEnumeratingWithState:objects:count:](layerInstructions, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
        v22 = v28;
      }
      while (v28);
    }
    else
    {
      v23 = 0;
    }
    v3 = v31;
    if (objc_msgSend(v19, "count"))
      objc_msgSend(v31, "setObject:forKey:", v19, CFSTR("LayerStack"));
    self = v30;
    if (v23)
      objc_msgSend(v31, "setObject:forKey:", *MEMORY[0x1E0C9AE50], CFSTR("ContainsTweening"));
  }
  if (!-[AVVideoCompositionInstruction enablePostProcessing](self, "enablePostProcessing"))
    objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x1E0C9AE40], CFSTR("EnablePostProcessing"));
  return v3;
}

- (void)_setValuesFromDictionary:(id)a3
{
  CGColorSpaceRef v5;
  __int128 v6;
  const __CFDictionary *v7;
  uint64_t v8;
  const __CFDictionary *v9;
  CGColorSpace *v10;
  CGColorSpaceRef v11;
  void *v12;
  CGColorRef v13;
  CGColorRef v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  AVVideoCompositionLayerInstruction *v23;
  void *v24;
  uint64_t v25;
  CGColorSpace *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CMTime lhs;
  __int128 v32;
  _BYTE v33[32];
  _BYTE v34[128];
  CMTime rhs;
  _BYTE v36[32];
  __int128 v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  v6 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v32 = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)v33 = v6;
  *(_OWORD *)&v33[16] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  *(_OWORD *)v36 = v32;
  *(_OWORD *)&v36[16] = v6;
  v37 = *(_OWORD *)&v33[16];
  -[AVVideoCompositionInstruction setTimeRange:](self, "setTimeRange:", v36);
  -[AVVideoCompositionInstruction setBackgroundColor:](self, "setBackgroundColor:", 0);
  -[AVVideoCompositionInstruction setLayerInstructions:](self, "setLayerInstructions:", 0);
  -[AVVideoCompositionInstruction setEnablePostProcessing:](self, "setEnablePostProcessing:", 1);
  -[AVVideoCompositionInstruction setRequiredSourceSampleDataTrackIDs:](self, "setRequiredSourceSampleDataTrackIDs:", MEMORY[0x1E0C9AA60]);
  v7 = (const __CFDictionary *)objc_msgSend(a3, "objectForKey:", CFSTR("StartTime"));
  v8 = objc_msgSend(a3, "objectForKey:", CFSTR("EndTime"));
  if (v7)
  {
    v9 = (const __CFDictionary *)v8;
    if (v8)
    {
      CMTimeMakeFromDictionary((CMTime *)&v32, v7);
      CMTimeMakeFromDictionary(&lhs, v9);
      *(_OWORD *)&rhs.value = v32;
      rhs.epoch = *(_QWORD *)v33;
      CMTimeSubtract((CMTime *)v36, &lhs, &rhs);
      *(_QWORD *)&v33[24] = *(_QWORD *)&v36[16];
      *(_OWORD *)&v33[8] = *(_OWORD *)v36;
      *(_OWORD *)v36 = v32;
      *(_OWORD *)&v36[16] = *(_OWORD *)v33;
      v37 = *(_OWORD *)&v33[16];
      -[AVVideoCompositionInstruction setTimeRange:](self, "setTimeRange:", v36);
    }
  }
  if (objc_msgSend(a3, "objectForKey:", CFSTR("BackgroundColorICCProfile")))
  {
    v10 = (CGColorSpace *)MEMORY[0x19403223C]();
    v11 = v10;
    if (v10)
      CFRetain(v10);
    if (v5)
      CFRelease(v5);
    if (v11)
      CFRelease(v11);
  }
  else
  {
    v11 = v5;
  }
  v12 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("BackgroundColorARGB"));
  if (v12)
  {
    memset(v36, 0, sizeof(v36));
    rhs.value = 0;
    *(_QWORD *)&rhs.timescale = 0;
    NSArrayGetRGBAComponents(v12, &rhs, (_DWORD *)&rhs.value + 1, &rhs.timescale, (_DWORD *)((unint64_t)&rhs | 0xC));
    *(float64x2_t *)v36 = vcvtq_f64_f32((float32x2_t)rhs.value);
    *(float64x2_t *)&v36[16] = vcvt_hight_f64_f32(*(float32x4_t *)&rhs.value);
    v13 = CGColorCreate(v11, (const CGFloat *)v36);
    if (v13)
    {
      v14 = v13;
      -[AVVideoCompositionInstruction setBackgroundColor:](self, "setBackgroundColor:", v13);
      CFRelease(v14);
    }
  }
  v15 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("LayerStack"));
  v16 = objc_msgSend(v15, "count");
  if (v16 >= 1)
  {
    v26 = v11;
    v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v16);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v28;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(v15);
          v22 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v21);
          v23 = objc_alloc_init(AVVideoCompositionLayerInstruction);
          *(_OWORD *)v36 = v32;
          *(_OWORD *)&v36[16] = *(_OWORD *)v33;
          v37 = *(_OWORD *)&v33[16];
          -[AVVideoCompositionLayerInstruction _setValuesFromDictionary:timeRange:](v23, "_setValuesFromDictionary:timeRange:", v22, v36);
          objc_msgSend(v17, "addObject:", v23);
          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
      }
      while (v19);
    }
    -[AVVideoCompositionInstruction setLayerInstructions:](self, "setLayerInstructions:", v17);
    v11 = v26;
  }
  v24 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("EnablePostProcessing"));
  if (v24)
    -[AVVideoCompositionInstruction setEnablePostProcessing:](self, "setEnablePostProcessing:", objc_msgSend(v24, "BOOLValue"));
  v25 = objc_msgSend(a3, "objectForKey:", CFSTR("RequiredSampleDataTrackIDArray"));
  if (v25)
    -[AVVideoCompositionInstruction setRequiredSourceSampleDataTrackIDs:](self, "setRequiredSourceSampleDataTrackIDs:", v25);
  CGColorSpaceRelease(v11);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVVideoCompositionInstruction %@"), objc_msgSend(-[AVVideoCompositionInstruction dictionaryRepresentation](self, "dictionaryRepresentation"), "description"));
}

@end
