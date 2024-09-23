@implementation ULOdometryStatus

- (ULOdometryStatus)initWithDate:(id)a3 deltaPositionX:(id)a4 deltaPositionY:(id)a5 deltaPositionZ:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ULOdometryStatus *v14;
  ULOdometryStatus *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ULOdometryStatus;
  v14 = -[ULOdometryStatus init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    -[ULOdometryStatus setStatusDate:](v14, "setStatusDate:", v10);
    if (v11)
      v16 = v11;
    else
      v16 = &unk_2511ED840;
    -[ULOdometryStatus setDeltaPositionX:](v15, "setDeltaPositionX:", v16);
    if (v12)
      v17 = v12;
    else
      v17 = &unk_2511ED840;
    -[ULOdometryStatus setDeltaPositionY:](v15, "setDeltaPositionY:", v17);
    if (v13)
      v18 = v13;
    else
      v18 = &unk_2511ED840;
    -[ULOdometryStatus setDeltaPositionZ:](v15, "setDeltaPositionZ:", v18);
  }

  return v15;
}

- (NSNumber)deltaPositionX
{
  return self->_deltaPositionX;
}

- (void)setDeltaPositionX:(id)a3
{
  objc_storeStrong((id *)&self->_deltaPositionX, a3);
}

- (NSNumber)deltaPositionY
{
  return self->_deltaPositionY;
}

- (void)setDeltaPositionY:(id)a3
{
  objc_storeStrong((id *)&self->_deltaPositionY, a3);
}

- (NSNumber)deltaPositionZ
{
  return self->_deltaPositionZ;
}

- (void)setDeltaPositionZ:(id)a3
{
  objc_storeStrong((id *)&self->_deltaPositionZ, a3);
}

- (NSDate)statusDate
{
  return self->_statusDate;
}

- (void)setStatusDate:(id)a3
{
  objc_storeStrong((id *)&self->_statusDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDate, 0);
  objc_storeStrong((id *)&self->_deltaPositionZ, 0);
  objc_storeStrong((id *)&self->_deltaPositionY, 0);
  objc_storeStrong((id *)&self->_deltaPositionX, 0);
}

@end
