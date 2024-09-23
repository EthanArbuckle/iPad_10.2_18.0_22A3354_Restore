@implementation AVTimeRangeForInterstitial

- (AVTimeRangeForInterstitial)initWithInterstice:(id)a3
{
  id v5;
  void *v6;
  AVTimeRangeForInterstitial *v7;
  AVTimeRangeForInterstitial *v8;
  void *v9;
  objc_super v11;
  _OWORD v12[3];

  v5 = a3;
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "timeRange");
  else
    memset(v12, 0, sizeof(v12));
  v11.receiver = self;
  v11.super_class = (Class)AVTimeRangeForInterstitial;
  v7 = -[AVTimeRange initWithCMTimeRange:](&v11, sel_initWithCMTimeRange_, v12);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_interstice, a3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[AVTimeRange startTime](v8, "startTime");
        -[AVTimeRange setMapTime:toDate:](v8, "setMapTime:toDate:", v9);
      }

    }
  }

  return v8;
}

- (AVInterstitialTimeRange)interstice
{
  return (AVInterstitialTimeRange *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interstice, 0);
}

@end
