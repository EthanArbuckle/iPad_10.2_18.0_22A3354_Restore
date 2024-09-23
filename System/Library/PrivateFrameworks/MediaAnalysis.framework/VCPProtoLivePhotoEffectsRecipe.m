@implementation VCPProtoLivePhotoEffectsRecipe

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  VCPProtoLivePhotoEffectsRecipe *v8;
  const __CFDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CMTime v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AutoLoop"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Bounce"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LongExposure"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Stabilize"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NormStabilizeInstructions"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[VCPProtoLivePhotoVariationParams resultFromLegacyDictionary:](VCPProtoLivePhotoVariationParams, "resultFromLegacyDictionary:", v27);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[VCPProtoLivePhotoVariationParams resultFromLegacyDictionary:](VCPProtoLivePhotoVariationParams, "resultFromLegacyDictionary:", v26);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[VCPProtoLivePhotoVariationParams resultFromLegacyDictionary:](VCPProtoLivePhotoVariationParams, "resultFromLegacyDictionary:", v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[VCPProtoLivePhotoVariationParams resultFromLegacyDictionary:](VCPProtoLivePhotoVariationParams, "resultFromLegacyDictionary:", v24);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = 0;
    if (v31 && v30 && v29 && v6)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stabCropRect"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      memset(&v36, 0, sizeof(v36));
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("outputFrameDur"));
      v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CMTimeMakeFromDictionary(&v36, v9);

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("frameInstructions"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_alloc_init(VCPProtoLivePhotoEffectsRecipe);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Version"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPProtoLivePhotoEffectsRecipe setVersion:](v8, "setVersion:", objc_msgSend(v10, "intValue"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MinVersion"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPProtoLivePhotoEffectsRecipe setMinVersion:](v8, "setMinVersion:", objc_msgSend(v11, "intValue"));

      -[VCPProtoLivePhotoEffectsRecipe setAutoloop:](v8, "setAutoloop:", v31);
      -[VCPProtoLivePhotoEffectsRecipe setBounce:](v8, "setBounce:", v30);
      -[VCPProtoLivePhotoEffectsRecipe setLongexposure:](v8, "setLongexposure:", v29);
      -[VCPProtoLivePhotoEffectsRecipe setStabilize:](v8, "setStabilize:", v7);
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("X"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPProtoLivePhotoEffectsRecipe setCropRectX:](v8, "setCropRectX:", objc_msgSend(v12, "intValue"));

      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("Y"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPProtoLivePhotoEffectsRecipe setCropRectY:](v8, "setCropRectY:", objc_msgSend(v13, "intValue"));

      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("Width"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPProtoLivePhotoEffectsRecipe setCropRectWidth:](v8, "setCropRectWidth:", objc_msgSend(v14, "intValue"));

      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("Height"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPProtoLivePhotoEffectsRecipe setCropRectHeight:](v8, "setCropRectHeight:", objc_msgSend(v15, "intValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stabilizeResult"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPProtoLivePhotoEffectsRecipe setStabilizeResult:](v8, "setStabilizeResult:", objc_msgSend(v16, "intValue"));

      -[VCPProtoLivePhotoEffectsRecipe setOutputFrameDurValue:](v8, "setOutputFrameDurValue:", v36.value);
      -[VCPProtoLivePhotoEffectsRecipe setTimeScale:](v8, "setTimeScale:", v36.timescale);
      -[VCPProtoLivePhotoEffectsRecipe setEpoch:](v8, "setEpoch:", v36.epoch);
      -[VCPProtoLivePhotoEffectsRecipe setFlags:](v8, "setFlags:", v36.flags);
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v17 = v23;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v33 != v19)
              objc_enumerationMutation(v17);
            +[VCPProtoLivePhotoFrameInstruction resultFromLegacyDictionary:](VCPProtoLivePhotoFrameInstruction, "resultFromLegacyDictionary:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[VCPProtoLivePhotoEffectsRecipe addFrameInstructions:](v8, "addFrameInstructions:", v21);

          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        }
        while (v18);
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)exportToLegacyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CFDictionaryRef v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  CMTime v28;
  CMTime time;
  _QWORD v30[4];
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  memset(&v28, 0, sizeof(v28));
  CMTimeMakeWithEpoch(&v28, -[VCPProtoLivePhotoEffectsRecipe outputFrameDurValue](self, "outputFrameDurValue"), -[VCPProtoLivePhotoEffectsRecipe timeScale](self, "timeScale"), -[VCPProtoLivePhotoEffectsRecipe epoch](self, "epoch"));
  v28.flags = -[VCPProtoLivePhotoEffectsRecipe flags](self, "flags");
  v30[0] = CFSTR("X");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCPProtoLivePhotoEffectsRecipe cropRectX](self, "cropRectX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v3;
  v30[1] = CFSTR("Y");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCPProtoLivePhotoEffectsRecipe cropRectY](self, "cropRectY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v4;
  v30[2] = CFSTR("Width");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCPProtoLivePhotoEffectsRecipe cropRectWidth](self, "cropRectWidth"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v5;
  v30[3] = CFSTR("Height");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCPProtoLivePhotoEffectsRecipe cropRectHeight](self, "cropRectHeight"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; -[VCPProtoLivePhotoEffectsRecipe frameInstructionsCount](self, "frameInstructionsCount") > i; ++i)
  {
    -[VCPProtoLivePhotoEffectsRecipe frameInstructions](self, "frameInstructions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", i);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[VCPProtoLivePhotoEffectsRecipe exportToLegacyDictionaryFromFrameInstruction:](self, "exportToLegacyDictionaryFromFrameInstruction:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v12);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  time = v28;
  v14 = CMTimeCopyAsDictionary(&time, 0);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("outputFrameDur"));

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v7, CFSTR("stabCropRect"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCPProtoLivePhotoEffectsRecipe stabilizeResult](self, "stabilizeResult"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("stabilizeResult"));

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, CFSTR("frameInstructions"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoLivePhotoEffectsRecipe autoloop](self, "autoloop");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoLivePhotoEffectsRecipe exportToLegacyDictionaryFromParam:withLoopFlavor:](self, "exportToLegacyDictionaryFromParam:withLoopFlavor:", v17, CFSTR("AutoLoop"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("AutoLoop"));

  -[VCPProtoLivePhotoEffectsRecipe bounce](self, "bounce");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoLivePhotoEffectsRecipe exportToLegacyDictionaryFromParam:withLoopFlavor:](self, "exportToLegacyDictionaryFromParam:withLoopFlavor:", v19, CFSTR("Bounce"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, CFSTR("Bounce"));

  -[VCPProtoLivePhotoEffectsRecipe longexposure](self, "longexposure");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoLivePhotoEffectsRecipe exportToLegacyDictionaryFromParam:withLoopFlavor:](self, "exportToLegacyDictionaryFromParam:withLoopFlavor:", v21, CFSTR("LongExposure"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, CFSTR("LongExposure"));

  -[VCPProtoLivePhotoEffectsRecipe stabilize](self, "stabilize");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoLivePhotoEffectsRecipe exportToLegacyDictionaryFromParam:withLoopFlavor:](self, "exportToLegacyDictionaryFromParam:withLoopFlavor:", v23, CFSTR("Stabilize"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v24, CFSTR("Stabilize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCPProtoLivePhotoEffectsRecipe version](self, "version"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v25, CFSTR("Version"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCPProtoLivePhotoEffectsRecipe minVersion](self, "minVersion"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v26, CFSTR("MinVersion"));

  objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, CFSTR("NormStabilizeInstructions"));
  return v16;
}

- (id)exportToLegacyDictionaryFromFrameInstruction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  CFDictionaryRef v6;
  CMTime v8;
  CMTime time;

  v3 = a3;
  objc_msgSend(v3, "exportToLegacyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  memset(&v8, 0, sizeof(v8));
  CMTimeMake(&v8, objc_msgSend(v3, "timeValue"), objc_msgSend(v3, "timeScale"));
  v8.epoch = objc_msgSend(v3, "epoch");
  v8.flags = objc_msgSend(v3, "flags");
  time = v8;
  v6 = CMTimeCopyAsDictionary(&time, 0);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("rawTime"));

  return v5;
}

- (id)exportToLegacyDictionaryFromParam:(id)a3 withLoopFlavor:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  objc_msgSend(a3, "exportToLegacyDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Params"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, CFSTR("loopFlavor"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E6B71EE0, CFSTR("loopEnergy"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("Params"));

  return v7;
}

- (void)setEpoch:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_epoch = a3;
}

- (void)setHasEpoch:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEpoch
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setFlags:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_flags = a3;
}

- (void)setHasFlags:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFlags
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearFrameInstructions
{
  -[NSMutableArray removeAllObjects](self->_frameInstructions, "removeAllObjects");
}

- (void)addFrameInstructions:(id)a3
{
  id v4;
  NSMutableArray *frameInstructions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  frameInstructions = self->_frameInstructions;
  v8 = v4;
  if (!frameInstructions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_frameInstructions;
    self->_frameInstructions = v6;

    v4 = v8;
    frameInstructions = self->_frameInstructions;
  }
  -[NSMutableArray addObject:](frameInstructions, "addObject:", v4);

}

- (unint64_t)frameInstructionsCount
{
  return -[NSMutableArray count](self->_frameInstructions, "count");
}

- (id)frameInstructionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_frameInstructions, "objectAtIndex:", a3);
}

+ (Class)frameInstructionsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoLivePhotoEffectsRecipe;
  -[VCPProtoLivePhotoEffectsRecipe description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoLivePhotoEffectsRecipe dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char has;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  VCPProtoLivePhotoVariationParams *autoloop;
  void *v22;
  VCPProtoLivePhotoVariationParams *bounce;
  void *v24;
  VCPProtoLivePhotoVariationParams *longexposure;
  void *v26;
  VCPProtoLivePhotoVariationParams *stabilize;
  void *v28;
  void *v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_stabilizeResult);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("stabilizeResult"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_outputFrameDurValue);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("outputFrameDurValue"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_cropRectX);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("cropRectX"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_cropRectY);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("cropRectY"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_cropRectHeight);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("cropRectHeight"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_cropRectWidth);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("cropRectWidth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_timeScale);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("timeScale"));

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_epoch);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("epoch"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_flags);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("flags"));

  }
  if (-[NSMutableArray count](self->_frameInstructions, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_frameInstructions, "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v15 = self->_frameInstructions;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v33 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v32);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("frameInstructions"));
  }
  autoloop = self->_autoloop;
  if (autoloop)
  {
    -[VCPProtoLivePhotoVariationParams dictionaryRepresentation](autoloop, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("autoloop"));

  }
  bounce = self->_bounce;
  if (bounce)
  {
    -[VCPProtoLivePhotoVariationParams dictionaryRepresentation](bounce, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("bounce"));

  }
  longexposure = self->_longexposure;
  if (longexposure)
  {
    -[VCPProtoLivePhotoVariationParams dictionaryRepresentation](longexposure, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("longexposure"));

  }
  stabilize = self->_stabilize;
  if (stabilize)
  {
    -[VCPProtoLivePhotoVariationParams dictionaryRepresentation](stabilize, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("stabilize"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_minVersion, (_QWORD)v32);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("minVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_version);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("version"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoLivePhotoEffectsRecipeReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt64Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_frameInstructions;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  PBDataWriterWriteSubmessage();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  _DWORD *v10;

  v4 = a3;
  v4[24] = self->_stabilizeResult;
  *((_QWORD *)v4 + 2) = self->_outputFrameDurValue;
  v4[12] = self->_cropRectX;
  v4[13] = self->_cropRectY;
  v4[10] = self->_cropRectHeight;
  v4[11] = self->_cropRectWidth;
  v4[25] = self->_timeScale;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_epoch;
    *((_BYTE *)v4 + 108) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[14] = self->_flags;
    *((_BYTE *)v4 + 108) |= 2u;
  }
  v10 = v4;
  if (-[VCPProtoLivePhotoEffectsRecipe frameInstructionsCount](self, "frameInstructionsCount"))
  {
    objc_msgSend(v10, "clearFrameInstructions");
    v6 = -[VCPProtoLivePhotoEffectsRecipe frameInstructionsCount](self, "frameInstructionsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[VCPProtoLivePhotoEffectsRecipe frameInstructionsAtIndex:](self, "frameInstructionsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addFrameInstructions:", v9);

      }
    }
  }
  objc_msgSend(v10, "setAutoloop:", self->_autoloop);
  objc_msgSend(v10, "setBounce:", self->_bounce);
  objc_msgSend(v10, "setLongexposure:", self->_longexposure);
  objc_msgSend(v10, "setStabilize:", self->_stabilize);
  v10[20] = self->_minVersion;
  v10[26] = self->_version;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  *(_DWORD *)(v5 + 96) = self->_stabilizeResult;
  *(_QWORD *)(v5 + 16) = self->_outputFrameDurValue;
  *(_DWORD *)(v5 + 48) = self->_cropRectX;
  *(_DWORD *)(v5 + 52) = self->_cropRectY;
  *(_DWORD *)(v5 + 40) = self->_cropRectHeight;
  *(_DWORD *)(v5 + 44) = self->_cropRectWidth;
  *(_DWORD *)(v5 + 100) = self->_timeScale;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_epoch;
    *(_BYTE *)(v5 + 108) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_flags;
    *(_BYTE *)(v5 + 108) |= 2u;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = self->_frameInstructions;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend((id)v6, "addFrameInstructions:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  v14 = -[VCPProtoLivePhotoVariationParams copyWithZone:](self->_autoloop, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v14;

  v16 = -[VCPProtoLivePhotoVariationParams copyWithZone:](self->_bounce, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v16;

  v18 = -[VCPProtoLivePhotoVariationParams copyWithZone:](self->_longexposure, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v18;

  v20 = -[VCPProtoLivePhotoVariationParams copyWithZone:](self->_stabilize, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v20;

  *(_DWORD *)(v6 + 80) = self->_minVersion;
  *(_DWORD *)(v6 + 104) = self->_version;
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *frameInstructions;
  VCPProtoLivePhotoVariationParams *autoloop;
  VCPProtoLivePhotoVariationParams *bounce;
  VCPProtoLivePhotoVariationParams *longexposure;
  VCPProtoLivePhotoVariationParams *stabilize;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    || self->_stabilizeResult != *((_DWORD *)v4 + 24)
    || self->_outputFrameDurValue != *((_QWORD *)v4 + 2)
    || self->_cropRectX != *((_DWORD *)v4 + 12)
    || self->_cropRectY != *((_DWORD *)v4 + 13)
    || self->_cropRectHeight != *((_DWORD *)v4 + 10)
    || self->_cropRectWidth != *((_DWORD *)v4 + 11)
    || self->_timeScale != *((_DWORD *)v4 + 25))
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 1) == 0 || self->_epoch != *((_QWORD *)v4 + 1))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 108) & 1) != 0)
  {
LABEL_31:
    v10 = 0;
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 2) == 0 || self->_flags != *((_DWORD *)v4 + 14))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 108) & 2) != 0)
  {
    goto LABEL_31;
  }
  frameInstructions = self->_frameInstructions;
  if ((unint64_t)frameInstructions | *((_QWORD *)v4 + 8)
    && !-[NSMutableArray isEqual:](frameInstructions, "isEqual:"))
  {
    goto LABEL_31;
  }
  autoloop = self->_autoloop;
  if ((unint64_t)autoloop | *((_QWORD *)v4 + 3))
  {
    if (!-[VCPProtoLivePhotoVariationParams isEqual:](autoloop, "isEqual:"))
      goto LABEL_31;
  }
  bounce = self->_bounce;
  if ((unint64_t)bounce | *((_QWORD *)v4 + 4))
  {
    if (!-[VCPProtoLivePhotoVariationParams isEqual:](bounce, "isEqual:"))
      goto LABEL_31;
  }
  longexposure = self->_longexposure;
  if ((unint64_t)longexposure | *((_QWORD *)v4 + 9))
  {
    if (!-[VCPProtoLivePhotoVariationParams isEqual:](longexposure, "isEqual:"))
      goto LABEL_31;
  }
  stabilize = self->_stabilize;
  if ((unint64_t)stabilize | *((_QWORD *)v4 + 11))
  {
    if (!-[VCPProtoLivePhotoVariationParams isEqual:](stabilize, "isEqual:"))
      goto LABEL_31;
  }
  if (self->_minVersion != *((_DWORD *)v4 + 20))
    goto LABEL_31;
  v10 = self->_version == *((_DWORD *)v4 + 26);
LABEL_32:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_epoch;
  else
    v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761 * self->_flags;
  else
    v4 = 0;
  v5 = (2654435761 * self->_outputFrameDurValue) ^ (2654435761 * self->_stabilizeResult) ^ (2654435761
                                                                                              * self->_cropRectX) ^ (2654435761 * self->_cropRectY) ^ (2654435761 * self->_cropRectHeight) ^ (2654435761 * self->_cropRectWidth) ^ (2654435761 * self->_timeScale);
  v6 = v3 ^ v4 ^ -[NSMutableArray hash](self->_frameInstructions, "hash");
  v7 = v6 ^ -[VCPProtoLivePhotoVariationParams hash](self->_autoloop, "hash");
  v8 = v7 ^ -[VCPProtoLivePhotoVariationParams hash](self->_bounce, "hash");
  v9 = v8 ^ -[VCPProtoLivePhotoVariationParams hash](self->_longexposure, "hash");
  return v5 ^ v9 ^ -[VCPProtoLivePhotoVariationParams hash](self->_stabilize, "hash") ^ (2654435761 * self->_minVersion) ^ (2654435761 * self->_version);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  VCPProtoLivePhotoVariationParams *autoloop;
  uint64_t v13;
  VCPProtoLivePhotoVariationParams *bounce;
  uint64_t v15;
  VCPProtoLivePhotoVariationParams *longexposure;
  uint64_t v17;
  VCPProtoLivePhotoVariationParams *stabilize;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  self->_stabilizeResult = *((_DWORD *)v4 + 24);
  self->_outputFrameDurValue = *((_QWORD *)v4 + 2);
  self->_cropRectX = *((_DWORD *)v4 + 12);
  self->_cropRectY = *((_DWORD *)v4 + 13);
  self->_cropRectHeight = *((_DWORD *)v4 + 10);
  self->_cropRectWidth = *((_DWORD *)v4 + 11);
  self->_timeScale = *((_DWORD *)v4 + 25);
  v6 = *((_BYTE *)v4 + 108);
  if ((v6 & 1) != 0)
  {
    self->_epoch = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 108);
  }
  if ((v6 & 2) != 0)
  {
    self->_flags = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 2u;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = *((id *)v4 + 8);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        -[VCPProtoLivePhotoEffectsRecipe addFrameInstructions:](self, "addFrameInstructions:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), (_QWORD)v20);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  autoloop = self->_autoloop;
  v13 = *((_QWORD *)v5 + 3);
  if (autoloop)
  {
    if (v13)
      -[VCPProtoLivePhotoVariationParams mergeFrom:](autoloop, "mergeFrom:");
  }
  else if (v13)
  {
    -[VCPProtoLivePhotoEffectsRecipe setAutoloop:](self, "setAutoloop:");
  }
  bounce = self->_bounce;
  v15 = *((_QWORD *)v5 + 4);
  if (bounce)
  {
    if (v15)
      -[VCPProtoLivePhotoVariationParams mergeFrom:](bounce, "mergeFrom:");
  }
  else if (v15)
  {
    -[VCPProtoLivePhotoEffectsRecipe setBounce:](self, "setBounce:");
  }
  longexposure = self->_longexposure;
  v17 = *((_QWORD *)v5 + 9);
  if (longexposure)
  {
    if (v17)
      -[VCPProtoLivePhotoVariationParams mergeFrom:](longexposure, "mergeFrom:");
  }
  else if (v17)
  {
    -[VCPProtoLivePhotoEffectsRecipe setLongexposure:](self, "setLongexposure:");
  }
  stabilize = self->_stabilize;
  v19 = *((_QWORD *)v5 + 11);
  if (stabilize)
  {
    if (v19)
      -[VCPProtoLivePhotoVariationParams mergeFrom:](stabilize, "mergeFrom:");
  }
  else if (v19)
  {
    -[VCPProtoLivePhotoEffectsRecipe setStabilize:](self, "setStabilize:");
  }
  self->_minVersion = *((_DWORD *)v5 + 20);
  self->_version = *((_DWORD *)v5 + 26);

}

- (int)stabilizeResult
{
  return self->_stabilizeResult;
}

- (void)setStabilizeResult:(int)a3
{
  self->_stabilizeResult = a3;
}

- (int64_t)outputFrameDurValue
{
  return self->_outputFrameDurValue;
}

- (void)setOutputFrameDurValue:(int64_t)a3
{
  self->_outputFrameDurValue = a3;
}

- (int)cropRectX
{
  return self->_cropRectX;
}

- (void)setCropRectX:(int)a3
{
  self->_cropRectX = a3;
}

- (int)cropRectY
{
  return self->_cropRectY;
}

- (void)setCropRectY:(int)a3
{
  self->_cropRectY = a3;
}

- (int)cropRectHeight
{
  return self->_cropRectHeight;
}

- (void)setCropRectHeight:(int)a3
{
  self->_cropRectHeight = a3;
}

- (int)cropRectWidth
{
  return self->_cropRectWidth;
}

- (void)setCropRectWidth:(int)a3
{
  self->_cropRectWidth = a3;
}

- (int)timeScale
{
  return self->_timeScale;
}

- (void)setTimeScale:(int)a3
{
  self->_timeScale = a3;
}

- (int64_t)epoch
{
  return self->_epoch;
}

- (int)flags
{
  return self->_flags;
}

- (NSMutableArray)frameInstructions
{
  return self->_frameInstructions;
}

- (void)setFrameInstructions:(id)a3
{
  objc_storeStrong((id *)&self->_frameInstructions, a3);
}

- (VCPProtoLivePhotoVariationParams)autoloop
{
  return self->_autoloop;
}

- (void)setAutoloop:(id)a3
{
  objc_storeStrong((id *)&self->_autoloop, a3);
}

- (VCPProtoLivePhotoVariationParams)bounce
{
  return self->_bounce;
}

- (void)setBounce:(id)a3
{
  objc_storeStrong((id *)&self->_bounce, a3);
}

- (VCPProtoLivePhotoVariationParams)longexposure
{
  return self->_longexposure;
}

- (void)setLongexposure:(id)a3
{
  objc_storeStrong((id *)&self->_longexposure, a3);
}

- (VCPProtoLivePhotoVariationParams)stabilize
{
  return self->_stabilize;
}

- (void)setStabilize:(id)a3
{
  objc_storeStrong((id *)&self->_stabilize, a3);
}

- (int)minVersion
{
  return self->_minVersion;
}

- (void)setMinVersion:(int)a3
{
  self->_minVersion = a3;
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stabilize, 0);
  objc_storeStrong((id *)&self->_longexposure, 0);
  objc_storeStrong((id *)&self->_frameInstructions, 0);
  objc_storeStrong((id *)&self->_bounce, 0);
  objc_storeStrong((id *)&self->_autoloop, 0);
}

@end
