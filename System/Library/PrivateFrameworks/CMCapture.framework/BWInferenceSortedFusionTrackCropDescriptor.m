@implementation BWInferenceSortedFusionTrackCropDescriptor

- (BWInferenceSortedFusionTrackCropDescriptor)initWithIdentifier:(char)a3 orderedFusionTrackIndex:(int)a4
{
  BWInferenceSortedFusionTrackCropDescriptor *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BWInferenceSortedFusionTrackCropDescriptor;
  result = -[BWInferenceSortedFusionTrackCropDescriptor init](&v7, sel_init);
  if (result)
  {
    result->_identifier = a3;
    result->_orderedFusionTrackIndex = a4;
  }
  return result;
}

- (char)identifier
{
  return self->_identifier;
}

- (CGRect)rectForSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  const __CFArray *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  __int128 v9;
  __int128 v10;
  CGRect result;

  v4 = (const __CFArray *)CMGetAttachment(a3, CFSTR("SortedFusionTrackerCrops"), 0);
  v9 = *MEMORY[0x1E0C9D628];
  v10 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  if (v4 && CFArrayGetCount(v4) > self->_orderedFusionTrackIndex)
    FigCFArrayGetCGRectAtIndex();
  v6 = *((double *)&v9 + 1);
  v5 = *(double *)&v9;
  v8 = *((double *)&v10 + 1);
  v7 = *(double *)&v10;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)applicableToSampleBuffer:(opaqueCMSampleBuffer *)a3 forMediaKey:(id)a4
{
  const __CFArray *v5;

  v5 = (const __CFArray *)CMGetAttachment(a3, CFSTR("SortedFusionTrackerCrops"), 0);
  if (v5)
    LOBYTE(v5) = CFArrayGetCount(v5) > self->_orderedFusionTrackIndex;
  return (char)v5;
}

- ($2825F4736939C4A6D3AD43837233062D)maxCropForDimensions:(id)a3
{
  return a3;
}

@end
