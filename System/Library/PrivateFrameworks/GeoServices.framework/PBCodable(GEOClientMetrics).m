@implementation PBCodable(GEOClientMetrics)

- (void)setClientMetricsIfSupported:()GEOClientMetrics
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a1, "setClientMetrics:", v4);

}

@end
