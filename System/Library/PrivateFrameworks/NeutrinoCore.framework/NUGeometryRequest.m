@implementation NUGeometryRequest

- (NUGeometryRequest)initWithComposition:(id)a3
{
  NUGeometryRequest *v3;
  uint64_t v4;
  NUScalePolicy *scalePolicy;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUGeometryRequest;
  v3 = -[NURenderRequest initWithComposition:](&v7, sel_initWithComposition_, a3);
  +[NUFixedScalePolicy oneToOneScalePolicy](NUFixedScalePolicy, "oneToOneScalePolicy");
  v4 = objc_claimAutoreleasedReturnValue();
  scalePolicy = v3->_scalePolicy;
  v3->_scalePolicy = (NUScalePolicy *)v4;

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUGeometryRequest;
  v4 = -[NURenderRequest copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
    objc_storeStrong(v4 + 19, self->_scalePolicy);
  return v5;
}

- (id)newRenderJob
{
  return -[NURenderJob initWithRequest:]([NUGeometryJob alloc], "initWithRequest:", self);
}

- (int64_t)mediaComponentType
{
  void *v2;
  uint64_t v3;

  -[NURenderRequest composition](self, "composition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mediaType");

  if ((unint64_t)(v3 - 1) > 2)
    return 0;
  else
    return qword_1A671A1E8[v3 - 1];
}

- (NUScalePolicy)scalePolicy
{
  return (NUScalePolicy *)objc_getProperty(self, a2, 152, 1);
}

- (void)setScalePolicy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scalePolicy, 0);
}

@end
