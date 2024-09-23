@implementation PHASEBlendNodeDefinition

- (PHASEBlendNodeDefinition)init
{
  -[PHASEBlendNodeDefinition doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEBlendNodeDefinition)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEBlendNodeDefinition)initWithBlendMetaParameterDefinition:(PHASENumberMetaParameterDefinition *)blendMetaParameterDefinition identifier:(NSString *)identifier
{
  PHASENumberMetaParameterDefinition *v6;
  NSString *v7;
  PHASEBlendNodeDefinition *v8;
  PHASEBlendNodeDefinition *v9;
  PHASEBlendNodeDefinition *v10;

  v6 = blendMetaParameterDefinition;
  v7 = identifier;
  v8 = -[PHASEBlendNodeDefinition initWithBlendMetaParameterDefinition:](self, "initWithBlendMetaParameterDefinition:", v6);
  v9 = v8;
  if (v8)
  {
    -[PHASEDefinition setIdentifier:](v8, "setIdentifier:", v7);
    v10 = v9;
  }

  return v9;
}

- (PHASEBlendNodeDefinition)initWithBlendMetaParameterDefinition:(PHASENumberMetaParameterDefinition *)blendMetaParameterDefinition
{
  PHASENumberMetaParameterDefinition *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  PHASEBlendNodeDefinition *v10;
  objc_super v12;

  v5 = blendMetaParameterDefinition;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("API Misuse"), CFSTR("Cannot create a blend node definition with a nil blendMetaParameterDefinition"));
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  v12.receiver = self;
  v12.super_class = (Class)PHASEBlendNodeDefinition;
  v6 = -[PHASEDefinition initInternal](&v12, sel_initInternal);
  if (!v6)
  {
    self = 0;
    goto LABEL_6;
  }
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = (void *)*((_QWORD *)v6 + 4);
  *((_QWORD *)v6 + 4) = v7;

  objc_storeStrong((id *)v6 + 2, blendMetaParameterDefinition);
  v9 = (void *)*((_QWORD *)v6 + 3);
  *((_QWORD *)v6 + 3) = 0;

  self = (PHASEBlendNodeDefinition *)v6;
  v10 = self;
LABEL_7:

  return v10;
}

- (PHASEBlendNodeDefinition)initDistanceBlendWithSpatialMixerDefinition:(PHASESpatialMixerDefinition *)spatialMixerDefinition identifier:(NSString *)identifier
{
  PHASESpatialMixerDefinition *v6;
  NSString *v7;
  PHASEBlendNodeDefinition *v8;
  PHASEBlendNodeDefinition *v9;
  PHASEBlendNodeDefinition *v10;

  v6 = spatialMixerDefinition;
  v7 = identifier;
  v8 = -[PHASEBlendNodeDefinition initDistanceBlendWithSpatialMixerDefinition:](self, "initDistanceBlendWithSpatialMixerDefinition:", v6);
  v9 = v8;
  if (v8)
  {
    -[PHASEDefinition setIdentifier:](v8, "setIdentifier:", v7);
    v10 = v9;
  }

  return v9;
}

- (PHASEBlendNodeDefinition)initDistanceBlendWithSpatialMixerDefinition:(PHASESpatialMixerDefinition *)spatialMixerDefinition
{
  PHASESpatialMixerDefinition *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  PHASEBlendNodeDefinition *v10;
  objc_super v12;

  v5 = spatialMixerDefinition;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("API Misuse"), CFSTR("Cannot create a blend node definition with a nil spatialMixerDefinition"));
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  v12.receiver = self;
  v12.super_class = (Class)PHASEBlendNodeDefinition;
  v6 = -[PHASEDefinition initInternal](&v12, sel_initInternal);
  if (!v6)
  {
    self = 0;
    goto LABEL_6;
  }
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = (void *)*((_QWORD *)v6 + 4);
  *((_QWORD *)v6 + 4) = v7;

  v9 = (void *)*((_QWORD *)v6 + 2);
  *((_QWORD *)v6 + 2) = 0;

  objc_storeStrong((id *)v6 + 3, spatialMixerDefinition);
  self = (PHASEBlendNodeDefinition *)v6;
  v10 = self;
LABEL_7:

  return v10;
}

- (id)children
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_ranges;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++) + 8), (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  return v3;
}

- (void)addRangeForInputValuesBelow:(double)value fullGainAtValue:(double)fullGainAtValue fadeCurveType:(PHASECurveType)fadeCurveType subtree:(PHASESoundEventNodeDefinition *)subtree
{
  BlendRange *v9;
  PHASEEnvelopeSegment *v10;
  PHASEEnvelope *v11;
  void *v12;
  uint64_t v18;
  PHASEEnvelope *blendEnvelope;
  PHASESoundEventNodeDefinition *v22;

  v22 = subtree;
  v9 = objc_alloc_init(BlendRange);
  v10 = -[PHASEEnvelopeSegment initWithEndPoint:curveType:]([PHASEEnvelopeSegment alloc], "initWithEndPoint:curveType:", fadeCurveType, value);
  v11 = [PHASEEnvelope alloc];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __asm { FMOV            V0.2D, #1.0 }
  v18 = -[PHASEEnvelope initWithStartPoint:segments:](v11, "initWithStartPoint:segments:", v12, fullGainAtValue);
  blendEnvelope = v9->blendEnvelope;
  v9->blendEnvelope = (PHASEEnvelope *)v18;

  objc_storeStrong((id *)&v9->subtree, subtree);
  -[NSMutableArray addObject:](self->_ranges, "addObject:", v9);

}

- (void)addRangeForInputValuesBetween:(double)lowValue highValue:(double)highValue fullGainAtLowValue:(double)fullGainAtLowValue fullGainAtHighValue:(double)fullGainAtHighValue lowFadeCurveType:(PHASECurveType)lowFadeCurveType highFadeCurveType:(PHASECurveType)highFadeCurveType subtree:(PHASESoundEventNodeDefinition *)subtree
{
  BlendRange *v13;
  PHASEEnvelopeSegment *v14;
  PHASEEnvelopeSegment *v20;
  PHASEEnvelopeSegment *v21;
  PHASEEnvelopeSegment *v22;
  void *v23;
  PHASEEnvelope *v24;
  PHASEEnvelope *blendEnvelope;
  PHASESoundEventNodeDefinition *v28;

  v28 = subtree;
  v13 = objc_alloc_init(BlendRange);
  v14 = [PHASEEnvelopeSegment alloc];
  __asm { FMOV            V0.2D, #1.0 }
  v20 = -[PHASEEnvelopeSegment initWithEndPoint:curveType:](v14, "initWithEndPoint:curveType:", lowFadeCurveType, fullGainAtLowValue);
  v21 = -[PHASEEnvelopeSegment initWithEndPoint:curveType:]([PHASEEnvelopeSegment alloc], "initWithEndPoint:curveType:", highFadeCurveType, highValue);
  if (fullGainAtLowValue == fullGainAtHighValue)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v20, fullGainAtHighValue, fullGainAtLowValue, v21, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = -[PHASEEnvelopeSegment initWithEndPoint:curveType:]([PHASEEnvelopeSegment alloc], "initWithEndPoint:curveType:", 1668435054, fullGainAtHighValue);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v20, v22, v21, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v24 = -[PHASEEnvelope initWithStartPoint:segments:]([PHASEEnvelope alloc], "initWithStartPoint:segments:", v23, lowValue);
  blendEnvelope = v13->blendEnvelope;
  v13->blendEnvelope = v24;

  objc_storeStrong((id *)&v13->subtree, subtree);
  -[NSMutableArray addObject:](self->_ranges, "addObject:", v13);

}

- (void)addRangeForInputValuesAbove:(double)value fullGainAtValue:(double)fullGainAtValue fadeCurveType:(PHASECurveType)fadeCurveType subtree:(PHASESoundEventNodeDefinition *)subtree
{
  BlendRange *v9;
  PHASEEnvelopeSegment *v10;
  PHASEEnvelopeSegment *v16;
  PHASEEnvelope *v17;
  void *v18;
  uint64_t v19;
  PHASEEnvelope *blendEnvelope;
  PHASESoundEventNodeDefinition *v23;

  v23 = subtree;
  v9 = objc_alloc_init(BlendRange);
  v10 = [PHASEEnvelopeSegment alloc];
  __asm { FMOV            V0.2D, #1.0 }
  v16 = -[PHASEEnvelopeSegment initWithEndPoint:curveType:](v10, "initWithEndPoint:curveType:", fadeCurveType, fullGainAtValue);
  v17 = [PHASEEnvelope alloc];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PHASEEnvelope initWithStartPoint:segments:](v17, "initWithStartPoint:segments:", v18, value);
  blendEnvelope = v9->blendEnvelope;
  v9->blendEnvelope = (PHASEEnvelope *)v19;

  objc_storeStrong((id *)&v9->subtree, subtree);
  -[NSMutableArray addObject:](self->_ranges, "addObject:", v9);

}

- (void)addRangeWithEnvelope:(PHASEEnvelope *)envelope subtree:(PHASESoundEventNodeDefinition *)subtree
{
  PHASESoundEventNodeDefinition *v7;
  BlendRange *v8;
  PHASEEnvelope *v9;

  v9 = envelope;
  v7 = subtree;
  v8 = objc_alloc_init(BlendRange);
  objc_storeStrong((id *)&v8->blendEnvelope, envelope);
  objc_storeStrong((id *)&v8->subtree, subtree);
  -[NSMutableArray addObject:](self->_ranges, "addObject:", v8);

}

- (PHASENumberMetaParameterDefinition)blendParameterDefinition
{
  return self->_blendParameterDefinition;
}

- (PHASESpatialMixerDefinition)spatialMixerDefinitionForDistance
{
  return self->_spatialMixerDefinitionForDistance;
}

- (NSMutableArray)ranges
{
  return self->_ranges;
}

- (void)setRanges:(id)a3
{
  objc_storeStrong((id *)&self->_ranges, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ranges, 0);
  objc_storeStrong((id *)&self->_spatialMixerDefinitionForDistance, 0);
  objc_storeStrong((id *)&self->_blendParameterDefinition, 0);
}

@end
