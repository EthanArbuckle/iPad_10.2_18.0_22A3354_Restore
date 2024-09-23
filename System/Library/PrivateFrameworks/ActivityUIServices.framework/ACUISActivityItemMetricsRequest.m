@implementation ACUISActivityItemMetricsRequest

+ (ACUISActivityItemMetricsRequest)new
{
  return 0;
}

- (ACUISActivityItemMetricsRequest)init
{

  return 0;
}

- (ACUISActivityItemMetricsRequest)initWithWidth:(id)a3 height:(id)a4 cornerRadius:(double)a5
{
  return -[ACUISActivityItemMetricsRequest initWithWidth:height:cornerRadius:edgeInsets:clipMargin:](self, "initWithWidth:height:cornerRadius:edgeInsets:clipMargin:", a3, a4, 0, a5, 0.0);
}

- (ACUISActivityItemMetricsRequest)initWithWidth:(id)a3 height:(id)a4 cornerRadius:(double)a5 edgeInsets:(id)a6
{
  return -[ACUISActivityItemMetricsRequest initWithWidth:height:cornerRadius:edgeInsets:clipMargin:](self, "initWithWidth:height:cornerRadius:edgeInsets:clipMargin:", a3, a4, a6, a5, 0.0);
}

- (ACUISActivityItemMetricsRequest)initWithWidth:(id)a3 height:(id)a4 cornerRadius:(double)a5 edgeInsets:(id)a6 clipMargin:(double)a7
{
  id v12;
  id v13;
  id v14;
  _TtC18ActivityUIServices26ActivityItemMetricsRequest *v15;
  void *v16;
  void *v17;
  void *v18;
  _TtC18ActivityUIServices26ActivityItemMetricsRequest *v19;
  ACUISActivityItemMetricsRequest *v20;

  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = [_TtC18ActivityUIServices26ActivityItemMetricsRequest alloc];
  objc_msgSend(v14, "_sizeDimensionRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "_sizeDimensionRequest");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "_edgeInsets");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[ActivityItemMetricsRequest initWithWidth:height:cornerRadius:edgeInsets:clipMargin:scaleFactor:](v15, "initWithWidth:height:cornerRadius:edgeInsets:clipMargin:scaleFactor:", v16, v17, v18, a5, a7, 1.0);
  v20 = -[ACUISActivityItemMetricsRequest _initWithItemMetrics:](self, "_initWithItemMetrics:", v19);

  return v20;
}

- (ACUISActivityItemMetricsRequest)initWithWidth:(id)a3 height:(id)a4 cornerRadius:(double)a5 edgeInsets:(id)a6 clipMargin:(double)a7 scaleFactor:(double)a8
{
  id v14;
  id v15;
  id v16;
  _TtC18ActivityUIServices26ActivityItemMetricsRequest *v17;
  void *v18;
  void *v19;
  void *v20;
  _TtC18ActivityUIServices26ActivityItemMetricsRequest *v21;
  ACUISActivityItemMetricsRequest *v22;

  v14 = a6;
  v15 = a4;
  v16 = a3;
  v17 = [_TtC18ActivityUIServices26ActivityItemMetricsRequest alloc];
  objc_msgSend(v16, "_sizeDimensionRequest");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "_sizeDimensionRequest");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "_edgeInsets");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[ActivityItemMetricsRequest initWithWidth:height:cornerRadius:edgeInsets:clipMargin:scaleFactor:](v17, "initWithWidth:height:cornerRadius:edgeInsets:clipMargin:scaleFactor:", v18, v19, v20, a5, a7, a8);
  v22 = -[ACUISActivityItemMetricsRequest _initWithItemMetrics:](self, "_initWithItemMetrics:", v21);

  return v22;
}

- (id)_initWithItemMetrics:(id)a3
{
  id v4;
  ACUISActivityItemMetricsRequest *v5;
  uint64_t v6;
  _TtC18ActivityUIServices26ActivityItemMetricsRequest *itemMetricsRequest;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACUISActivityItemMetricsRequest;
  v5 = -[ACUISActivityItemMetricsRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    itemMetricsRequest = v5->_itemMetricsRequest;
    v5->_itemMetricsRequest = (_TtC18ActivityUIServices26ActivityItemMetricsRequest *)v6;

  }
  return v5;
}

- (void)setWidthRequest:(id)a3
{
  _TtC18ActivityUIServices26ActivityItemMetricsRequest *itemMetricsRequest;
  id v4;

  itemMetricsRequest = self->_itemMetricsRequest;
  objc_msgSend(a3, "_sizeDimensionRequest");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ActivityItemMetricsRequest setWidthRequest:](itemMetricsRequest, "setWidthRequest:", v4);

}

- (ACUISSizeDimensionRequest)widthRequest
{
  ACUISSizeDimensionRequest *v3;
  void *v4;
  ACUISSizeDimensionRequest *v5;

  v3 = [ACUISSizeDimensionRequest alloc];
  -[ActivityItemMetricsRequest widthRequest](self->_itemMetricsRequest, "widthRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ACUISSizeDimensionRequest initWithDimensionRequest:](v3, "initWithDimensionRequest:", v4);

  return v5;
}

- (void)setHeightRequest:(id)a3
{
  _TtC18ActivityUIServices26ActivityItemMetricsRequest *itemMetricsRequest;
  id v4;

  itemMetricsRequest = self->_itemMetricsRequest;
  objc_msgSend(a3, "_sizeDimensionRequest");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ActivityItemMetricsRequest setHeightRequest:](itemMetricsRequest, "setHeightRequest:", v4);

}

- (ACUISSizeDimensionRequest)heightRequest
{
  ACUISSizeDimensionRequest *v3;
  void *v4;
  ACUISSizeDimensionRequest *v5;

  v3 = [ACUISSizeDimensionRequest alloc];
  -[ActivityItemMetricsRequest heightRequest](self->_itemMetricsRequest, "heightRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ACUISSizeDimensionRequest initWithDimensionRequest:](v3, "initWithDimensionRequest:", v4);

  return v5;
}

- (double)cornerRadius
{
  double result;

  -[ActivityItemMetricsRequest cornerRadius](self->_itemMetricsRequest, "cornerRadius");
  return result;
}

- (void)setCornerRadius:(double)a3
{
  -[ActivityItemMetricsRequest setCornerRadius:](self->_itemMetricsRequest, "setCornerRadius:", a3);
}

- (ACUISEdgeInsets)edgeInsets
{
  ACUISEdgeInsets *v3;
  void *v4;
  id v5;

  v3 = [ACUISEdgeInsets alloc];
  -[ActivityItemMetricsRequest edgeInsets](self->_itemMetricsRequest, "edgeInsets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ACUISEdgeInsets _initWithEdgeInsets:](v3, "_initWithEdgeInsets:", v4);

  return (ACUISEdgeInsets *)v5;
}

- (void)setEdgeInsets:(id)a3
{
  _TtC18ActivityUIServices26ActivityItemMetricsRequest *itemMetricsRequest;
  id v4;

  itemMetricsRequest = self->_itemMetricsRequest;
  objc_msgSend(a3, "_edgeInsets");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ActivityItemMetricsRequest setEdgeInsets:](itemMetricsRequest, "setEdgeInsets:", v4);

}

- (double)clipMargin
{
  double result;

  -[ActivityItemMetricsRequest clipMargin](self->_itemMetricsRequest, "clipMargin");
  return result;
}

- (void)setClipMargin:(double)a3
{
  -[ActivityItemMetricsRequest setClipMargin:](self->_itemMetricsRequest, "setClipMargin:", a3);
}

- (CGSize)initialSize
{
  double v2;
  double v3;
  CGSize result;

  -[ActivityItemMetricsRequest initialSize](self->_itemMetricsRequest, "initialSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)scaleFactor
{
  double result;

  -[ActivityItemMetricsRequest scaleFactor](self->_itemMetricsRequest, "scaleFactor");
  return result;
}

- (void)setScaleFactor:(double)a3
{
  -[ActivityItemMetricsRequest setScaleFactor:](self->_itemMetricsRequest, "setScaleFactor:", a3);
}

- (BOOL)isEqual:(id)a3
{
  ACUISActivityItemMetricsRequest *v4;
  BOOL v5;

  v4 = (ACUISActivityItemMetricsRequest *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[ActivityItemMetricsRequest isEqual:](self->_itemMetricsRequest, "isEqual:", v4->_itemMetricsRequest);
  }

  return v5;
}

- (unint64_t)hash
{
  return -[ActivityItemMetricsRequest hash](self->_itemMetricsRequest, "hash");
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_itemMetricsRequest, CFSTR("metrics"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_activityItemMetricsRequest
{
  return self->_itemMetricsRequest;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ACUISActivityItemMetricsRequest *v4;
  void *v5;
  id v6;

  v4 = +[ACUISActivityItemMetricsRequest allocWithZone:](ACUISActivityItemMetricsRequest, "allocWithZone:", a3);
  v5 = (void *)-[ActivityItemMetricsRequest copy](self->_itemMetricsRequest, "copy");
  v6 = -[ACUISActivityItemMetricsRequest _initWithItemMetrics:](v4, "_initWithItemMetrics:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACUISActivityItemMetricsRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ACUISActivityItemMetricsRequest *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemMetricsRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ACUISActivityItemMetricsRequest _initWithItemMetrics:](self, "_initWithItemMetrics:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_itemMetricsRequest, CFSTR("itemMetricsRequest"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemMetricsRequest, 0);
}

@end
