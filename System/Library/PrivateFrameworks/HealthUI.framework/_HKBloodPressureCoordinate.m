@implementation _HKBloodPressureCoordinate

- (_HKBloodPressureCoordinate)initWithSystolicCoordinate:(id)a3 diastolicCoordinate:(id)a4 userInfo:(id)a5
{
  id v9;
  id v10;
  id v11;
  _HKBloodPressureCoordinate *v12;
  _HKBloodPressureCoordinate *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_HKBloodPressureCoordinate;
  v12 = -[_HKBloodPressureCoordinate init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_systolicCoordinate, a3);
    objc_storeStrong((id *)&v13->_diastolicCoordinate, a4);
    objc_storeStrong((id *)&v13->_userInfo, a5);
  }

  return v13;
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  _BOOL8 v4;
  HKMinMaxCoordinate *systolicCoordinate;
  __int128 v8;
  id v9;
  HKMinMaxCoordinate *diastolicCoordinate;
  __int128 v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v4 = a4;
  systolicCoordinate = self->_systolicCoordinate;
  v8 = *(_OWORD *)&a3->c;
  v15 = *(_OWORD *)&a3->a;
  v16 = v8;
  v17 = *(_OWORD *)&a3->tx;
  v9 = -[HKMinMaxCoordinate copyWithTransform:roundToViewScale:](systolicCoordinate, "copyWithTransform:roundToViewScale:", &v15);
  diastolicCoordinate = self->_diastolicCoordinate;
  v11 = *(_OWORD *)&a3->c;
  v15 = *(_OWORD *)&a3->a;
  v16 = v11;
  v17 = *(_OWORD *)&a3->tx;
  v12 = -[HKMinMaxCoordinate copyWithTransform:roundToViewScale:](diastolicCoordinate, "copyWithTransform:roundToViewScale:", &v15, v4);
  v13 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSystolicCoordinate:diastolicCoordinate:userInfo:", v9, v12, self->_userInfo);

  return v13;
}

- (double)startXValue
{
  HKMinMaxCoordinate *systolicCoordinate;
  double result;

  systolicCoordinate = self->_systolicCoordinate;
  if (!systolicCoordinate)
    systolicCoordinate = self->_diastolicCoordinate;
  -[HKMinMaxCoordinate startXValue](systolicCoordinate, "startXValue");
  return result;
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)_HKBloodPressureCoordinate;
  -[_HKBloodPressureCoordinate description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ { systolic(%@), diastolic(%@} }"), v4, self->_systolicCoordinate, self->_diastolicCoordinate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (HKMinMaxCoordinate)systolicCoordinate
{
  return self->_systolicCoordinate;
}

- (HKMinMaxCoordinate)diastolicCoordinate
{
  return self->_diastolicCoordinate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diastolicCoordinate, 0);
  objc_storeStrong((id *)&self->_systolicCoordinate, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
