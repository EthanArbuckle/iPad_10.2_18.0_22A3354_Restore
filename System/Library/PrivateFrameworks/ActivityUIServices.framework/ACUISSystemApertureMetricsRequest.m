@implementation ACUISSystemApertureMetricsRequest

+ (ACUISSystemApertureMetricsRequest)new
{
  return 0;
}

- (ACUISSystemApertureMetricsRequest)init
{

  return 0;
}

- (ACUISSystemApertureMetricsRequest)initWithObstructionSize:(CGSize)a3 obstructionTopMargin:(double)a4 expandedMetricsRequest:(id)a5 compactLeadingMetricsRequest:(id)a6 compactTrailingMetricsRequest:(id)a7 minimalMetricsRequest:(id)a8
{
  double height;
  double width;
  id v15;
  id v16;
  id v17;
  id v18;
  ACUISSystemApertureMetricsRequest *v19;
  _TtC18ActivityUIServices28SystemApertureMetricsRequest *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _TtC18ActivityUIServices28SystemApertureMetricsRequest *metricsRequest;
  objc_super v28;

  height = a3.height;
  width = a3.width;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v28.receiver = self;
  v28.super_class = (Class)ACUISSystemApertureMetricsRequest;
  v19 = -[ACUISSystemApertureMetricsRequest init](&v28, sel_init);
  if (v19)
  {
    v20 = [_TtC18ActivityUIServices28SystemApertureMetricsRequest alloc];
    objc_msgSend(v15, "_activityItemMetricsRequest");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_activityItemMetricsRequest");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_activityItemMetricsRequest");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_activityItemMetricsRequest");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[SystemApertureMetricsRequest initWithObstructionSize:obstructionTopMargin:expandedMetricsRequest:compactLeadingMetricsRequest:compactTrailingMetricsRequest:minimalMetricsRequest:](v20, "initWithObstructionSize:obstructionTopMargin:expandedMetricsRequest:compactLeadingMetricsRequest:compactTrailingMetricsRequest:minimalMetricsRequest:", v21, v22, v23, v24, width, height, a4);
    metricsRequest = v19->_metricsRequest;
    v19->_metricsRequest = (_TtC18ActivityUIServices28SystemApertureMetricsRequest *)v25;

  }
  return v19;
}

- (ACUISSystemApertureMetricsRequest)initWithObstructionSize:(CGSize)a3 expandedMetricsRequest:(id)a4 compactLeadingMetricsRequest:(id)a5 compactTrailingMetricsRequest:(id)a6 minimalMetricsRequest:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  id v16;
  ACUISSystemApertureMetricsRequest *v17;
  _TtC18ActivityUIServices28SystemApertureMetricsRequest *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _TtC18ActivityUIServices28SystemApertureMetricsRequest *metricsRequest;
  objc_super v26;

  height = a3.height;
  width = a3.width;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)ACUISSystemApertureMetricsRequest;
  v17 = -[ACUISSystemApertureMetricsRequest init](&v26, sel_init);
  if (v17)
  {
    v18 = [_TtC18ActivityUIServices28SystemApertureMetricsRequest alloc];
    objc_msgSend(v13, "_activityItemMetricsRequest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_activityItemMetricsRequest");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_activityItemMetricsRequest");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_activityItemMetricsRequest");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[SystemApertureMetricsRequest initWithObstructionSize:obstructionTopMargin:expandedMetricsRequest:compactLeadingMetricsRequest:compactTrailingMetricsRequest:minimalMetricsRequest:](v18, "initWithObstructionSize:obstructionTopMargin:expandedMetricsRequest:compactLeadingMetricsRequest:compactTrailingMetricsRequest:minimalMetricsRequest:", v19, v20, v21, v22, width, height, 0.0);
    metricsRequest = v17->_metricsRequest;
    v17->_metricsRequest = (_TtC18ActivityUIServices28SystemApertureMetricsRequest *)v23;

  }
  return v17;
}

- (ACUISSystemApertureMetricsRequest)initWithObstructionSize:(CGSize)a3 expandedMetricsRequest:(id)a4 compactMetricsRequest:(id)a5 minimalMetricsRequest:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ACUISSystemApertureMetricsRequest *v18;

  height = a3.height;
  width = a3.width;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v14, "edgeInsets");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTrailing:", 0.0);
  objc_msgSend(v14, "setEdgeInsets:", v15);
  v16 = (void *)objc_msgSend(v12, "copy");

  objc_msgSend(v16, "edgeInsets");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLeading:", 0.0);
  objc_msgSend(v16, "setEdgeInsets:", v17);
  v18 = -[ACUISSystemApertureMetricsRequest initWithObstructionSize:expandedMetricsRequest:compactLeadingMetricsRequest:compactTrailingMetricsRequest:minimalMetricsRequest:](self, "initWithObstructionSize:expandedMetricsRequest:compactLeadingMetricsRequest:compactTrailingMetricsRequest:minimalMetricsRequest:", v13, v14, v16, v11, width, height);

  return v18;
}

- (id)_initWithMetricsRequest:(id)a3
{
  id v5;
  ACUISSystemApertureMetricsRequest *v6;
  ACUISSystemApertureMetricsRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACUISSystemApertureMetricsRequest;
  v6 = -[ACUISSystemApertureMetricsRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_metricsRequest, a3);

  return v7;
}

- (CGSize)obstructionSize
{
  double v2;
  double v3;
  CGSize result;

  -[SystemApertureMetricsRequest obstructionSize](self->_metricsRequest, "obstructionSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setObstructionSize:(CGSize)a3
{
  -[SystemApertureMetricsRequest setObstructionSize:](self->_metricsRequest, "setObstructionSize:", a3.width, a3.height);
}

- (double)obstructionTopMargin
{
  double result;

  -[SystemApertureMetricsRequest obstructionTopMargin](self->_metricsRequest, "obstructionTopMargin");
  return result;
}

- (void)setObstructionTopMargin:(double)a3
{
  -[SystemApertureMetricsRequest setObstructionTopMargin:](self->_metricsRequest, "setObstructionTopMargin:", a3);
}

- (void)setExpandedMetricsRequest:(id)a3
{
  id v4;

  objc_msgSend(a3, "_activityItemMetricsRequest");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SystemApertureMetricsRequest setExpandedMetricsRequest:](self->_metricsRequest, "setExpandedMetricsRequest:", v4);

}

- (ACUISActivityItemMetricsRequest)expandedMetricsRequest
{
  ACUISActivityItemMetricsRequest *v3;
  void *v4;
  id v5;

  v3 = [ACUISActivityItemMetricsRequest alloc];
  -[SystemApertureMetricsRequest expandedMetricsRequest](self->_metricsRequest, "expandedMetricsRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ACUISActivityItemMetricsRequest _initWithItemMetrics:](v3, "_initWithItemMetrics:", v4);

  return (ACUISActivityItemMetricsRequest *)v5;
}

- (void)setCompactLeadingMetricsRequest:(id)a3
{
  id v4;

  objc_msgSend(a3, "_activityItemMetricsRequest");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SystemApertureMetricsRequest setCompactLeadingMetricsRequest:](self->_metricsRequest, "setCompactLeadingMetricsRequest:", v4);

}

- (ACUISActivityItemMetricsRequest)compactLeadingMetricsRequest
{
  ACUISActivityItemMetricsRequest *v3;
  void *v4;
  id v5;

  v3 = [ACUISActivityItemMetricsRequest alloc];
  -[SystemApertureMetricsRequest compactLeadingMetricsRequest](self->_metricsRequest, "compactLeadingMetricsRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ACUISActivityItemMetricsRequest _initWithItemMetrics:](v3, "_initWithItemMetrics:", v4);

  return (ACUISActivityItemMetricsRequest *)v5;
}

- (void)setCompactTrailingMetricsRequest:(id)a3
{
  id v4;

  objc_msgSend(a3, "_activityItemMetricsRequest");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SystemApertureMetricsRequest setCompactTrailingMetricsRequest:](self->_metricsRequest, "setCompactTrailingMetricsRequest:", v4);

}

- (ACUISActivityItemMetricsRequest)compactTrailingMetricsRequest
{
  ACUISActivityItemMetricsRequest *v3;
  void *v4;
  id v5;

  v3 = [ACUISActivityItemMetricsRequest alloc];
  -[SystemApertureMetricsRequest compactTrailingMetricsRequest](self->_metricsRequest, "compactTrailingMetricsRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ACUISActivityItemMetricsRequest _initWithItemMetrics:](v3, "_initWithItemMetrics:", v4);

  return (ACUISActivityItemMetricsRequest *)v5;
}

- (void)setCompactMetricsRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = (id)objc_msgSend(v4, "copy");
  objc_msgSend(v8, "edgeInsets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTrailing:", 0.0);
  objc_msgSend(v8, "setEdgeInsets:", v5);
  -[ACUISSystemApertureMetricsRequest setCompactLeadingMetricsRequest:](self, "setCompactLeadingMetricsRequest:", v8);
  v6 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v6, "edgeInsets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeading:", 0.0);
  objc_msgSend(v6, "setEdgeInsets:", v7);
  -[ACUISSystemApertureMetricsRequest setCompactLeadingMetricsRequest:](self, "setCompactLeadingMetricsRequest:", v6);

}

- (ACUISActivityItemMetricsRequest)compactMetricsRequest
{
  ACUISActivityItemMetricsRequest *v3;
  void *v4;
  id v5;

  v3 = [ACUISActivityItemMetricsRequest alloc];
  -[SystemApertureMetricsRequest compactLeadingMetricsRequest](self->_metricsRequest, "compactLeadingMetricsRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ACUISActivityItemMetricsRequest _initWithItemMetrics:](v3, "_initWithItemMetrics:", v4);

  return (ACUISActivityItemMetricsRequest *)v5;
}

- (void)setMinimalMetricsRequest:(id)a3
{
  id v4;

  objc_msgSend(a3, "_activityItemMetricsRequest");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SystemApertureMetricsRequest setMinimalMetricsRequest:](self->_metricsRequest, "setMinimalMetricsRequest:", v4);

}

- (ACUISActivityItemMetricsRequest)minimalMetricsRequest
{
  ACUISActivityItemMetricsRequest *v3;
  void *v4;
  id v5;

  v3 = [ACUISActivityItemMetricsRequest alloc];
  -[SystemApertureMetricsRequest minimalMetricsRequest](self->_metricsRequest, "minimalMetricsRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ACUISActivityItemMetricsRequest _initWithItemMetrics:](v3, "_initWithItemMetrics:", v4);

  return (ACUISActivityItemMetricsRequest *)v5;
}

- (BOOL)isEqual:(id)a3
{
  ACUISSystemApertureMetricsRequest *v4;
  BOOL v5;

  v4 = (ACUISSystemApertureMetricsRequest *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[SystemApertureMetricsRequest isEqual:](self->_metricsRequest, "isEqual:", v4->_metricsRequest);
  }

  return v5;
}

- (unint64_t)hash
{
  return -[SystemApertureMetricsRequest hash](self->_metricsRequest, "hash");
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

- (id)_systemApertureMetricsRequest
{
  return self->_metricsRequest;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ACUISSystemApertureMetricsRequest *v4;
  void *v5;
  id v6;

  v4 = +[ACUISSystemApertureMetricsRequest allocWithZone:](ACUISSystemApertureMetricsRequest, "allocWithZone:", a3);
  v5 = (void *)-[SystemApertureMetricsRequest copy](self->_metricsRequest, "copy");
  v6 = -[ACUISSystemApertureMetricsRequest _initWithMetricsRequest:](v4, "_initWithMetricsRequest:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACUISSystemApertureMetricsRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ACUISSystemApertureMetricsRequest *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metricsRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ACUISSystemApertureMetricsRequest _initWithMetricsRequest:](self, "_initWithMetricsRequest:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_metricsRequest, CFSTR("metricsRequest"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsRequest, 0);
}

@end
