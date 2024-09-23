@implementation FTCinematicTapRequest

- (FTCinematicTapRequest)init
{
  FTCinematicTapRequest *v2;
  FTCinematicTapRequest *v3;
  FTCinematicTapRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FTCinematicTapRequest;
  v2 = -[FTCinematicTapRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[FTCinematicTapRequest setTapPoint:](v2, "setTapPoint:", -1.0, -1.0);
    -[FTCinematicTapRequest setTrackId:](v3, "setTrackId:", -1);
    v4 = v3;
  }

  return v3;
}

- (CGPoint)tapPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_tapPoint.x;
  y = self->_tapPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTapPoint:(CGPoint)a3
{
  self->_tapPoint = a3;
}

- (int64_t)trackId
{
  return self->_trackId;
}

- (void)setTrackId:(int64_t)a3
{
  self->_trackId = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
