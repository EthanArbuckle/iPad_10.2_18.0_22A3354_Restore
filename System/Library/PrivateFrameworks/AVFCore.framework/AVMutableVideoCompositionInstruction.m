@implementation AVMutableVideoCompositionInstruction

+ (AVMutableVideoCompositionInstruction)videoCompositionInstruction
{
  return (AVMutableVideoCompositionInstruction *)objc_alloc_init((Class)a1);
}

- (CMTimeRange)timeRange
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMutableVideoCompositionInstruction;
  return (CMTimeRange *)-[CMTimeRange timeRange](&v4, sel_timeRange);
}

- (void)setTimeRange:(CMTimeRange *)timeRange
{
  __int128 v3;
  _OWORD v4[3];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMutableVideoCompositionInstruction;
  v3 = *(_OWORD *)&timeRange->start.epoch;
  v4[0] = *(_OWORD *)&timeRange->start.value;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&timeRange->duration.timescale;
  -[AVVideoCompositionInstruction setTimeRange:](&v5, sel_setTimeRange_, v4);
}

- (CGColorRef)backgroundColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoCompositionInstruction;
  return -[AVVideoCompositionInstruction backgroundColor](&v3, sel_backgroundColor);
}

- (void)setBackgroundColor:(CGColorRef)backgroundColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoCompositionInstruction;
  -[AVVideoCompositionInstruction setBackgroundColor:](&v3, sel_setBackgroundColor_, backgroundColor);
}

- (NSArray)layerInstructions
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoCompositionInstruction;
  return -[AVVideoCompositionInstruction layerInstructions](&v3, sel_layerInstructions);
}

- (void)setLayerInstructions:(NSArray *)layerInstructions
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoCompositionInstruction;
  -[AVVideoCompositionInstruction setLayerInstructions:](&v3, sel_setLayerInstructions_, layerInstructions);
}

- (BOOL)enablePostProcessing
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoCompositionInstruction;
  return -[AVVideoCompositionInstruction enablePostProcessing](&v3, sel_enablePostProcessing);
}

- (void)setEnablePostProcessing:(BOOL)enablePostProcessing
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoCompositionInstruction;
  -[AVVideoCompositionInstruction setEnablePostProcessing:](&v3, sel_setEnablePostProcessing_, enablePostProcessing);
}

- (NSArray)requiredSourceSampleDataTrackIDs
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoCompositionInstruction;
  return -[AVVideoCompositionInstruction requiredSourceSampleDataTrackIDs](&v3, sel_requiredSourceSampleDataTrackIDs);
}

- (void)setRequiredSourceSampleDataTrackIDs:(NSArray *)requiredSourceSampleDataTrackIDs
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoCompositionInstruction;
  -[AVVideoCompositionInstruction setRequiredSourceSampleDataTrackIDs:](&v3, sel_setRequiredSourceSampleDataTrackIDs_, requiredSourceSampleDataTrackIDs);
}

@end
