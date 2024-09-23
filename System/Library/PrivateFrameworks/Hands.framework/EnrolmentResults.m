@implementation EnrolmentResults

- (EnrolmentResults)init
{
  double v2;

  LODWORD(v2) = 0;
  return -[EnrolmentResults initWithEnrolmentHandRadiusEstimated:status:](self, "initWithEnrolmentHandRadiusEstimated:status:", 1, v2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[EnrolmentResults initWithEnrolmentResults:]([EnrolmentResults alloc], "initWithEnrolmentResults:", self);
}

- (EnrolmentResults)initWithEnrolmentResults:(id)a3
{
  id v4;
  int v5;
  int v6;
  uint64_t v7;
  double v8;
  EnrolmentResults *v9;

  v4 = a3;
  objc_msgSend(v4, "handRadiusEstimated");
  v6 = v5;
  v7 = objc_msgSend(v4, "status");
  LODWORD(v8) = v6;
  v9 = -[EnrolmentResults initWithEnrolmentHandRadiusEstimated:status:](self, "initWithEnrolmentHandRadiusEstimated:status:", v7, v8);

  return v9;
}

- (void)updateWithEnrolmentResults:(id)a3
{
  float v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "handRadiusEstimated");
  self->_handRadiusEstimated = v4;
  self->_status = objc_msgSend(v5, "status");

}

- (EnrolmentResults)initWithEnrolmentHandRadiusEstimated:(float)a3 status:(int64_t)a4
{
  EnrolmentResults *v6;
  EnrolmentResults *v7;
  FullHandEnrolmentData *v8;
  double v9;
  uint64_t v10;
  FullHandEnrolmentData *handEnrolmentData;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)EnrolmentResults;
  v6 = -[EnrolmentResults init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_handRadiusEstimated = a3;
    v6->_status = a4;
    v8 = [FullHandEnrolmentData alloc];
    *(float *)&v9 = a3;
    v10 = -[FullHandEnrolmentData initWithLeftHandEnrolmentData:rightHandEnrolmentData:handRadiusEstimated:](v8, "initWithLeftHandEnrolmentData:rightHandEnrolmentData:handRadiusEstimated:", 0, 0, v9);
    handEnrolmentData = v7->_handEnrolmentData;
    v7->_handEnrolmentData = (FullHandEnrolmentData *)v10;

  }
  return v7;
}

- (EnrolmentResults)initWithEnrolmentData:(id)a3 status:(int64_t)a4
{
  id v7;
  EnrolmentResults *v8;
  float v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EnrolmentResults;
  v8 = -[EnrolmentResults init](&v11, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "handRadiusEstimated");
    v8->_handRadiusEstimated = v9;
    v8->_status = a4;
    objc_storeStrong((id *)&v8->_handEnrolmentData, a3);
  }

  return v8;
}

- (float)handRadiusEstimated
{
  return self->_handRadiusEstimated;
}

- (FullHandEnrolmentData)handEnrolmentData
{
  return (FullHandEnrolmentData *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handEnrolmentData, 0);
}

@end
