@implementation _GEODirectionsServiceRequestBuilder_DrivingToWalkingTransition

- (int)directionsRequestFeedbackPurpose
{
  void *v2;
  int v3;

  -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hasArrived"))
    v3 = 13;
  else
    v3 = 14;

  return v3;
}

@end
