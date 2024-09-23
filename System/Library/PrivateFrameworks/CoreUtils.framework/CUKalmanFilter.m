@implementation CUKalmanFilter

- (CUKalmanFilter)initWithConfiguration:(id)a3
{
  id v5;
  CUKalmanFilter *v6;
  CUKalmanFilter *v7;
  CUKalmanFilter *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CUKalmanFilter;
  v6 = -[CUKalmanFilter init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    *(int64x2_t *)&v7->_stateX = vdupq_n_s64(0x7FF8000000000000uLL);
    v8 = v7;
  }

  return v7;
}

- (double)updateWithValue:(double)a3
{
  double result;

  -[CUKalmanFilter updateWithValue:control:](self, "updateWithValue:control:", a3, 0.0);
  return result;
}

- (double)updateWithValue:(double)a3 control:(double)a4
{
  double v7;
  double v8;
  double stateX;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double result;

  -[CUKalmanConfiguration paramA](self->_config, "paramA", self->_stateX);
  v8 = v7;
  stateX = self->_stateX;
  -[CUKalmanConfiguration paramB](self->_config, "paramB");
  v11 = v10 * a4 + v8 * stateX;
  v12 = v8 * self->_stateU;
  -[CUKalmanConfiguration paramR](self->_config, "paramR");
  v14 = v13 + v12 * v8;
  -[CUKalmanConfiguration paramC](self->_config, "paramC");
  v16 = v15;
  v17 = v14 * v15;
  -[CUKalmanConfiguration paramQ](self->_config, "paramQ");
  v19 = v17 * (1.0 / (v18 + v17 * v16));
  result = v11 + v19 * (a3 - v16 * v11);
  self->_stateX = result;
  self->_stateU = v14 + -(v19 * v16) * v14;
  return result;
}

- (double)stateX
{
  return self->_stateX;
}

- (double)stateU
{
  return self->_stateU;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
}

@end
