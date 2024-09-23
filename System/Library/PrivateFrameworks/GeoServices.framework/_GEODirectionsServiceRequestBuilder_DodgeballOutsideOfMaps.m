@implementation _GEODirectionsServiceRequestBuilder_DodgeballOutsideOfMaps

- (int)directionsRequestFeedbackPurpose
{
  return 8;
}

- (void)setMiscFieldsInDirectionsRequest:(id)a3
{
  objc_msgSend(a3, "setNonRecommendedRoutesOption:", 2);
}

@end
