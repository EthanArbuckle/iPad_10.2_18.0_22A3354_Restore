@implementation ACUISActivityMetricsRequest

- (id)_initWithMetricsRequest:(id)a3
{
  id v4;
  ACUISActivityMetricsRequest *v5;
  uint64_t v6;
  _TtC18ActivityUIServices22ActivityMetricsRequest *metricsRequest;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACUISActivityMetricsRequest;
  v5 = -[ACUISActivityMetricsRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    metricsRequest = v5->_metricsRequest;
    v5->_metricsRequest = (_TtC18ActivityUIServices22ActivityMetricsRequest *)v6;

  }
  return v5;
}

- (ACUISActivityMetricsRequest)initWithLockScreenMetrics:(id)a3
{
  id v4;
  ACUISActivityMetricsRequest *v5;
  _TtC18ActivityUIServices22ActivityMetricsRequest *v6;
  void *v7;
  uint64_t v8;
  _TtC18ActivityUIServices22ActivityMetricsRequest *metricsRequest;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACUISActivityMetricsRequest;
  v5 = -[ACUISActivityMetricsRequest init](&v11, sel_init);
  if (v5)
  {
    v6 = [_TtC18ActivityUIServices22ActivityMetricsRequest alloc];
    objc_msgSend(v4, "_activityItemMetricsRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ActivityMetricsRequest initWithLockScreenMetrics:systemApertureMetrics:ambientMetrics:](v6, "initWithLockScreenMetrics:systemApertureMetrics:ambientMetrics:", v7, 0, 0);
    metricsRequest = v5->_metricsRequest;
    v5->_metricsRequest = (_TtC18ActivityUIServices22ActivityMetricsRequest *)v8;

  }
  return v5;
}

- (void)setAmbientMetrics:(id)a3
{
  id v4;

  objc_msgSend(a3, "_activityItemMetricsRequest");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ActivityMetricsRequest setAmbientMetrics:](self->_metricsRequest, "setAmbientMetrics:", v4);

}

- (ACUISActivityItemMetricsRequest)ambientMetrics
{
  ACUISActivityItemMetricsRequest *v3;
  void *v4;
  id v5;

  v3 = [ACUISActivityItemMetricsRequest alloc];
  -[ActivityMetricsRequest ambientMetrics](self->_metricsRequest, "ambientMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ACUISActivityItemMetricsRequest _initWithItemMetrics:](v3, "_initWithItemMetrics:", v4);

  return (ACUISActivityItemMetricsRequest *)v5;
}

- (void)setLockScreenMetrics:(id)a3
{
  id v4;

  objc_msgSend(a3, "_activityItemMetricsRequest");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ActivityMetricsRequest setLockScreenMetrics:](self->_metricsRequest, "setLockScreenMetrics:", v4);

}

- (ACUISActivityItemMetricsRequest)lockScreenMetrics
{
  ACUISActivityItemMetricsRequest *v3;
  void *v4;
  id v5;

  v3 = [ACUISActivityItemMetricsRequest alloc];
  -[ActivityMetricsRequest lockScreenMetrics](self->_metricsRequest, "lockScreenMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ACUISActivityItemMetricsRequest _initWithItemMetrics:](v3, "_initWithItemMetrics:", v4);

  return (ACUISActivityItemMetricsRequest *)v5;
}

- (void)setSystemApertureMetrics:(id)a3
{
  id v4;

  objc_msgSend(a3, "_systemApertureMetricsRequest");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ActivityMetricsRequest setSystemApertureMetrics:](self->_metricsRequest, "setSystemApertureMetrics:", v4);

}

- (ACUISSystemApertureMetricsRequest)systemApertureMetrics
{
  void *v3;
  ACUISSystemApertureMetricsRequest *v4;
  void *v5;
  id v6;

  -[ActivityMetricsRequest systemApertureMetrics](self->_metricsRequest, "systemApertureMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [ACUISSystemApertureMetricsRequest alloc];
    -[ActivityMetricsRequest systemApertureMetrics](self->_metricsRequest, "systemApertureMetrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ACUISSystemApertureMetricsRequest _initWithMetricsRequest:](v4, "_initWithMetricsRequest:", v5);

  }
  else
  {
    v6 = 0;
  }
  return (ACUISSystemApertureMetricsRequest *)v6;
}

- (BOOL)isEqual:(id)a3
{
  ACUISActivityMetricsRequest *v4;
  BOOL v5;

  v4 = (ACUISActivityMetricsRequest *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[ActivityMetricsRequest isEqual:](self->_metricsRequest, "isEqual:", v4->_metricsRequest);
  }

  return v5;
}

- (unint64_t)hash
{
  return -[ActivityMetricsRequest hash](self->_metricsRequest, "hash");
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_metricsRequest, CFSTR("metrics"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_activityMetricsRequest
{
  return self->_metricsRequest;
}

- (id)_ACUISItemMetricsRequestFromRequest:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[ACUISActivityItemMetricsRequest _initWithItemMetrics:]([ACUISActivityItemMetricsRequest alloc], "_initWithItemMetrics:", v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ACUISActivityMetricsRequest *v4;
  void *v5;
  id v6;

  v4 = [ACUISActivityMetricsRequest alloc];
  v5 = (void *)-[ActivityMetricsRequest copy](self->_metricsRequest, "copy");
  v6 = -[ACUISActivityMetricsRequest _initWithMetricsRequest:](v4, "_initWithMetricsRequest:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACUISActivityMetricsRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ACUISActivityMetricsRequest *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metrics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ACUISActivityMetricsRequest _initWithMetricsRequest:]([ACUISActivityMetricsRequest alloc], "_initWithMetricsRequest:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_metricsRequest, CFSTR("metrics"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsRequest, 0);
}

@end
