@implementation CNObjectTracker

+ (BOOL)isSupported
{
  return objc_msgSend(MEMORY[0x24BE74BA8], "isSupported");
}

- (CNObjectTracker)initWithCommandQueue:(id)commandQueue
{
  id v4;
  CNObjectTracker *v5;
  uint64_t v6;
  PTTapToTrack *internalTapToTrack;
  CNObjectTracker *v8;
  objc_super v10;

  v4 = commandQueue;
  v10.receiver = self;
  v10.super_class = (Class)CNObjectTracker;
  v5 = -[CNObjectTracker init](&v10, sel_init);
  if (v5
    && (v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE74BA8]), "initWithCommandQueue:", v4),
        internalTapToTrack = v5->_internalTapToTrack,
        v5->_internalTapToTrack = (PTTapToTrack *)v6,
        internalTapToTrack,
        !v5->_internalTapToTrack))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (CNBoundsPrediction)findObjectAtPoint:(CGPoint)point sourceImage:(CVPixelBufferRef)sourceImage
{
  void *v4;
  void *v5;

  -[PTTapToTrack getRectForPoint:colorBuffer:](self->_internalTapToTrack, "getRectForPoint:colorBuffer:", sourceImage, point.x, point.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNBoundsPrediction _predictionFromInternal:](CNBoundsPrediction, "_predictionFromInternal:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNBoundsPrediction *)v5;
}

- (BOOL)startTrackingAt:(CMTime *)time within:(CGRect)normalizedBounds sourceImage:(CVPixelBufferRef)sourceImage sourceDisparity:(CVPixelBufferRef)sourceDisparity
{
  PTTapToTrack *internalTapToTrack;
  CMTime v8;

  internalTapToTrack = self->_internalTapToTrack;
  v8 = *time;
  return -[PTTapToTrack addDetectionAndStartTrackingRect:time:colorBuffer:disparityBuffer:](internalTapToTrack, "addDetectionAndStartTrackingRect:time:colorBuffer:disparityBuffer:", &v8, sourceImage, sourceDisparity, normalizedBounds.origin.x, normalizedBounds.origin.y, normalizedBounds.size.width, normalizedBounds.size.height);
}

- (CNBoundsPrediction)continueTrackingAt:(CMTime *)time sourceImage:(CVPixelBufferRef)sourceImage sourceDisparity:(CVPixelBufferRef)sourceDisparity
{
  PTTapToTrack *internalTapToTrack;
  void *v6;
  void *v7;
  CMTime v9;

  internalTapToTrack = self->_internalTapToTrack;
  v9 = *time;
  -[PTTapToTrack addDetectionForNextFrameAt:colorBuffer:disparityBuffer:](internalTapToTrack, "addDetectionForNextFrameAt:colorBuffer:disparityBuffer:", &v9, sourceImage, sourceDisparity);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNBoundsPrediction _predictionFromInternal:](CNBoundsPrediction, "_predictionFromInternal:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNBoundsPrediction *)v7;
}

- (CNDetectionTrack)finishDetectionTrack
{
  void *v2;
  void *v3;

  -[PTTapToTrack finalizeTrack](self->_internalTapToTrack, "finalizeTrack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNDetectionTrack _trackFromInternal:](CNDetectionTrack, "_trackFromInternal:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNDetectionTrack *)v3;
}

- (void)resetDetectionTrack
{
  -[PTTapToTrack resetTrack](self->_internalTapToTrack, "resetTrack");
}

- (PTTapToTrack)internalTapToTrack
{
  return (PTTapToTrack *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternalTapToTrack:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalTapToTrack, 0);
}

@end
