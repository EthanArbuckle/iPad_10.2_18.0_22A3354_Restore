@implementation ARLightEstimationData

- (double)timestamp
{
  void *v3;
  double v4;
  void *v5;
  double v6;

  -[ARLightEstimationData lightEstimate](self, "lightEstimate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = -1.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ARLightEstimationData lightEstimate](self, "lightEstimate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timestamp");
    v4 = v6;

  }
  return v4;
}

- (ARLightEstimate)lightEstimate
{
  return self->_lightEstimate;
}

- (void)setLightEstimate:(id)a3
{
  objc_storeStrong((id *)&self->_lightEstimate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lightEstimate, 0);
}

@end
