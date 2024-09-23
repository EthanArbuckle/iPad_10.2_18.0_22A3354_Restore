@implementation VCPCtrTracker

- (VCPCtrTracker)init
{
  VCPCtrTracker *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VCPCtrTracker;
  result = -[VCPCtrTracker init](&v3, sel_init);
  if (result)
  {
    result->P = 0;
    result->context = 0;
  }
  return result;
}

- (void)dealloc
{
  $4F4F0650DC9CCA3CEA69BA645FE1F4C0 *context;
  CGPoint *P;
  objc_super v5;

  context = self->context;
  if (context)
    ctrTrackerInitialization_freeContext(context);
  P = self->P;
  if (P)
    free(P);
  v5.receiver = self;
  v5.super_class = (Class)VCPCtrTracker;
  -[VCPCtrTracker dealloc](&v5, sel_dealloc);
}

- (void)setupTrackerWithReferenceFrame:(__CVBuffer *)a3 withROI:(CGPoint *)a4
{
  CGPoint *P;
  uint64_t i;
  $4F4F0650DC9CCA3CEA69BA645FE1F4C0 *context;
  $4F4F0650DC9CCA3CEA69BA645FE1F4C0 *v10;

  P = self->P;
  if (!P)
  {
    P = (CGPoint *)malloc_type_calloc(4uLL, 0x10uLL, 0x1000040451B5BE8uLL);
    self->P = P;
  }
  for (i = 0; i != 4; ++i)
    P[i] = a4[i];
  context = self->context;
  if (context)
  {
    ctrTrackerInitialization_cleanUpContext((uint64_t)context);
    v10 = self->context;
  }
  else
  {
    v10 = ($4F4F0650DC9CCA3CEA69BA645FE1F4C0 *)ctrTrackerInitialization_allocContext();
    self->context = v10;
  }
  ctrTrackerInitialization_setUpTracker(a3, (uint64_t *)v10, (float64x2_t *)a4);
}

- (void)trackInFrame:(__CVBuffer *)a3
{
  ctrTrackerComputation_trackNewFrame(a3, (uint64_t)self->context, (float64x2_t *)self->P, &self->stable, &self->lostTrack);
  self->_confidence = *(float *)self->context->var1;
}

- (CGPoint)box
{
  return self->P;
}

- (void)setBox:(CGPoint *)a3
{
  self->P = a3;
}

- (BOOL)stableInd
{
  return self->stable;
}

- (void)setStableInd:(BOOL)a3
{
  self->stable = a3;
}

- (BOOL)lostTrackInd
{
  return self->lostTrack;
}

- (void)setLostTrackInd:(BOOL)a3
{
  self->lostTrack = a3;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

@end
