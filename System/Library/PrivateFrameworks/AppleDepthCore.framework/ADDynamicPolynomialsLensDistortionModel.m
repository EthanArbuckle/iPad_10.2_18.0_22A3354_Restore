@implementation ADDynamicPolynomialsLensDistortionModel

- (BOOL)isEqual:(id)a3
{
  ADDynamicPolynomialsLensDistortionModel *v4;
  ADDynamicPolynomialsLensDistortionModel *v5;
  ADDynamicPolynomialsLensDistortionModel *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  float dynamicFactor;
  float v15;

  v4 = (ADDynamicPolynomialsLensDistortionModel *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_10;
  if (self == v4)
  {
    v12 = 1;
    goto LABEL_14;
  }
  if ((-[ADDynamicPolynomialsLensDistortionModel isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v6 = v5;
    -[ADPolynomialsLensDistortionModel distortionCenter](self, "distortionCenter");
    v8 = v7;
    v10 = v9;
    -[ADPolynomialsLensDistortionModel distortionCenter](v6, "distortionCenter");
    v12 = 0;
    if (v8 == v13 && v10 == v11)
      v12 = +[ADPolynomialsLensDistortionModel isEqualPolynomials:otherPolynomials:](ADPolynomialsLensDistortionModel, "isEqualPolynomials:otherPolynomials:", &self->super._polynomials, -[ADPolynomialsLensDistortionModel distortionPolynomials](v6, "distortionPolynomials"))&& (dynamicFactor = self->_dynamicFactor, -[ADDynamicPolynomialsLensDistortionModel dynamicFactor](v6, "dynamicFactor"), dynamicFactor == v15)&& +[ADPolynomialsLensDistortionModel isEqualPolynomials:otherPolynomials:](ADPolynomialsLensDistortionModel, "isEqualPolynomials:otherPolynomials:", &self->_polynomialsBase, -[ADDynamicPolynomialsLensDistortionModel distortionPolynomialsBase](v6, "distortionPolynomialsBase"))&& +[ADPolynomialsLensDistortionModel isEqualPolynomials:otherPolynomials:](ADPolynomialsLensDistortionModel, "isEqualPolynomials:otherPolynomials:", &self->_polynomialsDynamic, -[ADDynamicPolynomialsLensDistortionModel distortionPolynomialsDynamic](v6, "distortionPolynomialsDynamic"));

  }
  else
  {
LABEL_10:
    v12 = 0;
  }
LABEL_14:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  double v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ADDynamicPolynomialsLensDistortionModel;
  v3 = -[ADPolynomialsLensDistortionModel hash](&v9, sel_hash);
  *(float *)&v4 = self->_dynamicFactor;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 ^ (2 * objc_msgSend(v5, "hash"));

  v7 = v6 ^ (3
           * +[ADPolynomialsLensDistortionModel hashPolynomials:](ADPolynomialsLensDistortionModel, "hashPolynomials:", &self->_polynomialsBase));
  return v7 ^ (4
             * +[ADPolynomialsLensDistortionModel hashPolynomials:](ADPolynomialsLensDistortionModel, "hashPolynomials:", &self->_polynomialsDynamic));
}

- (void)updatePolynomials
{
  uint64_t v2;
  ADDistortionPolynomials *p_polynomialsBase;
  ADDistortionPolynomials *p_polynomialsDynamic;
  float *v5;

  v2 = 0;
  p_polynomialsBase = &self->_polynomialsBase;
  p_polynomialsDynamic = &self->_polynomialsDynamic;
  do
  {
    v5 = &self->super._polynomials.inverseOrders[v2];
    *v5 = p_polynomialsBase->inverseOrders[v2] + (float)(self->_dynamicFactor * p_polynomialsDynamic->inverseOrders[v2]);
    *(v5 - 8) = p_polynomialsBase->forwardOrders[v2]
              + (float)(self->_dynamicFactor * p_polynomialsDynamic->forwardOrders[v2]);
    ++v2;
  }
  while (v2 != 8);
}

- (const)distortionPolynomialsBase
{
  return &self->_polynomialsBase;
}

- (const)distortionPolynomialsDynamic
{
  return &self->_polynomialsDynamic;
}

- (void)setDistortionPolynomialsBase:(const ADDistortionPolynomials *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  id v6;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("distortionPolynomials cannot be nil"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  v3 = *(_OWORD *)&a3->inverseOrders[4];
  v5 = *(_OWORD *)a3->forwardOrders;
  v4 = *(_OWORD *)&a3->forwardOrders[4];
  *(_OWORD *)self->_polynomialsBase.inverseOrders = *(_OWORD *)a3->inverseOrders;
  *(_OWORD *)&self->_polynomialsBase.inverseOrders[4] = v3;
  *(_OWORD *)self->_polynomialsBase.forwardOrders = v5;
  *(_OWORD *)&self->_polynomialsBase.forwardOrders[4] = v4;
  -[ADDynamicPolynomialsLensDistortionModel updatePolynomials](self, "updatePolynomials");
}

- (void)setDistortionPolynomialsDynamic:(const ADDistortionPolynomials *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  id v6;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("distortionPolynomials cannot be nil"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  v3 = *(_OWORD *)&a3->inverseOrders[4];
  v5 = *(_OWORD *)a3->forwardOrders;
  v4 = *(_OWORD *)&a3->forwardOrders[4];
  *(_OWORD *)self->_polynomialsDynamic.inverseOrders = *(_OWORD *)a3->inverseOrders;
  *(_OWORD *)&self->_polynomialsDynamic.inverseOrders[4] = v3;
  *(_OWORD *)self->_polynomialsDynamic.forwardOrders = v5;
  *(_OWORD *)&self->_polynomialsDynamic.forwardOrders[4] = v4;
  -[ADDynamicPolynomialsLensDistortionModel updatePolynomials](self, "updatePolynomials");
}

- (void)setDistortionPolynomials:(const ADDistortionPolynomials *)a3
{
  uint64_t v4;
  float *inverseOrders;
  float *v6;
  _DWORD *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ADDynamicPolynomialsLensDistortionModel;
  -[ADPolynomialsLensDistortionModel setDistortionPolynomials:](&v8, sel_setDistortionPolynomials_, a3);
  v4 = 0;
  inverseOrders = self->super._polynomials.inverseOrders;
  do
  {
    v6 = &self->_polynomialsDynamic.inverseOrders[v4];
    *(v6 - 8) = 0.0;
    *v6 = 0.0;
    v7 = (_DWORD *)&self->_polynomialsBase.forwardOrders[v4];
    *v7 = LODWORD(inverseOrders[v4 - 8]);
    v7[8] = LODWORD(inverseOrders[v4++]);
  }
  while (v4 != 8);
}

- (void)setDynamicFactor:(float)a3
{
  self->_dynamicFactor = a3;
  -[ADDynamicPolynomialsLensDistortionModel updatePolynomials](self, "updatePolynomials");
}

- (id)copyWithZone:(_NSZone *)a3
{
  ADDynamicPolynomialsLensDistortionModel *v4;

  v4 = [ADDynamicPolynomialsLensDistortionModel alloc];
  -[ADPolynomialsLensDistortionModel distortionCenter](self, "distortionCenter");
  return -[ADDynamicPolynomialsLensDistortionModel initWithDistortionCenter:dynFactor:polynomialsBase:polynomialsDynamic:](v4, "initWithDistortionCenter:dynFactor:polynomialsBase:polynomialsDynamic:", &self->_polynomialsBase, &self->_polynomialsDynamic);
}

- (ADDynamicPolynomialsLensDistortionModel)initWithDistortionCenter:(CGPoint)a3 dynFactor:(float)a4 polynomialsBase:(const ADDistortionPolynomials *)a5 polynomialsDynamic:(const ADDistortionPolynomials *)a6
{
  double y;
  double x;
  ADDynamicPolynomialsLensDistortionModel *v11;
  ADDynamicPolynomialsLensDistortionModel *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v20;
  objc_super v21;

  if (!a5 || !a6)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("distortion polynomials cannot be nil"), 0, a3.x, a3.y);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
  }
  y = a3.y;
  x = a3.x;
  v21.receiver = self;
  v21.super_class = (Class)ADDynamicPolynomialsLensDistortionModel;
  v11 = -[ADDynamicPolynomialsLensDistortionModel init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    -[ADPolynomialsLensDistortionModel setDistortionCenter:](v11, "setDistortionCenter:", x, y);
    v13 = *(_OWORD *)&a5->inverseOrders[4];
    v15 = *(_OWORD *)a5->forwardOrders;
    v14 = *(_OWORD *)&a5->forwardOrders[4];
    *(_OWORD *)v12->_polynomialsBase.inverseOrders = *(_OWORD *)a5->inverseOrders;
    *(_OWORD *)&v12->_polynomialsBase.inverseOrders[4] = v13;
    *(_OWORD *)v12->_polynomialsBase.forwardOrders = v15;
    *(_OWORD *)&v12->_polynomialsBase.forwardOrders[4] = v14;
    v16 = *(_OWORD *)&a6->inverseOrders[4];
    v18 = *(_OWORD *)a6->forwardOrders;
    v17 = *(_OWORD *)&a6->forwardOrders[4];
    *(_OWORD *)v12->_polynomialsDynamic.inverseOrders = *(_OWORD *)a6->inverseOrders;
    *(_OWORD *)&v12->_polynomialsDynamic.inverseOrders[4] = v16;
    *(_OWORD *)v12->_polynomialsDynamic.forwardOrders = v18;
    *(_OWORD *)&v12->_polynomialsDynamic.forwardOrders[4] = v17;
    v12->_dynamicFactor = a4;
    -[ADDynamicPolynomialsLensDistortionModel updatePolynomials](v12, "updatePolynomials");
  }
  return v12;
}

- (float)dynamicFactor
{
  return self->_dynamicFactor;
}

@end
