@implementation VNCoreSceneUnderstandingDetectorFeatureConfiguration

- (VNCoreSceneUnderstandingDetectorFeatureConfiguration)initWithObservationsRecipient:(id)a3
{
  id v5;
  VNCoreSceneUnderstandingDetectorFeatureConfiguration *v6;
  VNCoreSceneUnderstandingDetectorFeatureConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VNCoreSceneUnderstandingDetectorFeatureConfiguration;
  v6 = -[VNCoreSceneUnderstandingDetectorFeatureConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_observationsRecipient, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithObservationsRecipient:", self->_observationsRecipient);
}

- (BOOL)isEqual:(id)a3
{
  VNCoreSceneUnderstandingDetectorFeatureConfiguration *v4;
  VNCoreSceneUnderstandingDetectorFeatureConfiguration *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (VNCoreSceneUnderstandingDetectorFeatureConfiguration *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNCoreSceneUnderstandingDetectorFeatureConfiguration observationsRecipient](self, "observationsRecipient");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNCoreSceneUnderstandingDetectorFeatureConfiguration observationsRecipient](v5, "observationsRecipient");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (VNObservationsRecipient)observationsRecipient
{
  return self->_observationsRecipient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationsRecipient, 0);
}

@end
