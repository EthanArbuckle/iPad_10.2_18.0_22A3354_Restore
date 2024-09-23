@implementation KalmanFilter

- (KalmanFilter)init
{
  KalmanFilter *v2;
  KalmanFilter *v3;
  KalmanFilterPrivate *v4;
  KalmanFilterPrivate *kalmanFilterX;
  KalmanFilterPrivate *v6;
  KalmanFilterPrivate *kalmanFilterY;
  KalmanFilterPrivate *v8;
  KalmanFilterPrivate *kalmanFilterWidth;
  KalmanFilterPrivate *v10;
  KalmanFilterPrivate *kalmanFilterHeight;
  double v12;
  double v13;
  double v14;
  double v15;
  KalmanFilter *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)KalmanFilter;
  v2 = -[KalmanFilter init](&v18, sel_init);
  v3 = v2;
  if (!v2)
    goto LABEL_9;
  v2->_observationIdentifier = -1;
  v4 = objc_alloc_init(KalmanFilterPrivate);
  kalmanFilterX = v3->_kalmanFilterX;
  v3->_kalmanFilterX = v4;

  if (!v3->_kalmanFilterX)
    goto LABEL_8;
  v6 = objc_alloc_init(KalmanFilterPrivate);
  kalmanFilterY = v3->_kalmanFilterY;
  v3->_kalmanFilterY = v6;

  if (!v3->_kalmanFilterY)
    goto LABEL_8;
  v8 = objc_alloc_init(KalmanFilterPrivate);
  kalmanFilterWidth = v3->_kalmanFilterWidth;
  v3->_kalmanFilterWidth = v8;

  if (!v3->_kalmanFilterWidth
    || (v10 = objc_alloc_init(KalmanFilterPrivate),
        kalmanFilterHeight = v3->_kalmanFilterHeight,
        v3->_kalmanFilterHeight = v10,
        kalmanFilterHeight,
        !v3->_kalmanFilterHeight))
  {
LABEL_8:
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_9:
    v16 = 0;
    goto LABEL_7;
  }
  LODWORD(v12) = 1028443341;
  -[KalmanFilterPrivate setMeasurementNoise:](v3->_kalmanFilterX, "setMeasurementNoise:", v12);
  LODWORD(v13) = 1028443341;
  -[KalmanFilterPrivate setMeasurementNoise:](v3->_kalmanFilterY, "setMeasurementNoise:", v13);
  LODWORD(v14) = 1055286886;
  -[KalmanFilterPrivate setMeasurementNoise:](v3->_kalmanFilterWidth, "setMeasurementNoise:", v14);
  LODWORD(v15) = 1055286886;
  -[KalmanFilterPrivate setMeasurementNoise:](v3->_kalmanFilterHeight, "setMeasurementNoise:", v15);
  v3->_isFirstObservation = 1;
  v16 = v3;
LABEL_7:

  return v16;
}

- (void)addObservation:(id)a3
{
  id v4;
  double v5;
  float v6;
  double v7;
  float v8;
  double v9;
  float v10;
  double v11;
  double v12;
  float v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v4 = a3;
  v17 = v4;
  if (self->_isFirstObservation)
  {
    self->_observationIdentifier = objc_msgSend(v4, "oid");
    v4 = v17;
    self->_isFirstObservation = 0;
  }
  objc_msgSend(v4, "oid");
  objc_msgSend(v17, "bounds");
  v6 = v5;
  objc_msgSend(v17, "bounds");
  v8 = v7;
  objc_msgSend(v17, "bounds");
  v10 = v9 + (float)(v6 * 0.5);
  objc_msgSend(v17, "bounds");
  v12 = v11 + (float)(v8 * 0.5);
  v13 = v12;
  *(float *)&v12 = v10;
  -[KalmanFilterPrivate addObservation:](self->_kalmanFilterX, "addObservation:", v12);
  *(float *)&v14 = v13;
  -[KalmanFilterPrivate addObservation:](self->_kalmanFilterY, "addObservation:", v14);
  *(float *)&v15 = v6;
  -[KalmanFilterPrivate addObservation:](self->_kalmanFilterWidth, "addObservation:", v15);
  *(float *)&v16 = v8;
  -[KalmanFilterPrivate addObservation:](self->_kalmanFilterHeight, "addObservation:", v16);

}

- (CGRect)estimatedBounds
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[KalmanFilterPrivate estimatedObservation](self->_kalmanFilterWidth, "estimatedObservation");
  v4 = v3;
  -[KalmanFilterPrivate estimatedObservation](self->_kalmanFilterHeight, "estimatedObservation");
  v6 = v5;
  -[KalmanFilterPrivate estimatedObservation](self->_kalmanFilterX, "estimatedObservation");
  v8 = v7 - (float)(v4 * 0.5);
  -[KalmanFilterPrivate estimatedObservation](self->_kalmanFilterY, "estimatedObservation");
  v10 = v9 - (float)(v6 * 0.5);
  v11 = v8;
  v12 = v10;
  v13 = v4;
  v14 = v6;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (int)oid
{
  return self->_observationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kalmanFilterHeight, 0);
  objc_storeStrong((id *)&self->_kalmanFilterWidth, 0);
  objc_storeStrong((id *)&self->_kalmanFilterY, 0);
  objc_storeStrong((id *)&self->_kalmanFilterX, 0);
}

@end
