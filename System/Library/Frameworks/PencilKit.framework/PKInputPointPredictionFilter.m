@implementation PKInputPointPredictionFilter

- (void)addInputPoint:(id *)a3
{
  __int128 *p_halfPredictionTimeIntervalPoint;
  double predictionTimeInterval;
  double var7;
  double v7;
  double v8;
  PKInputPointPredictor *predictor;
  PKInputPointPredictor *v10;
  PKInputPointPredictor *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  PKInputPointPredictor *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _OWORD v29[8];
  __int128 v30[8];
  $AED72EE27E42738B07AF948989CC969A v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  if (self)
  {
    p_halfPredictionTimeIntervalPoint = (__int128 *)a3;
    predictionTimeInterval = self->_predictionTimeInterval;
    if (predictionTimeInterval != 0.0)
    {
      ++self->super._numInputPoints;
      var7 = a3->var7;
      v7 = predictionTimeInterval * 0.5 + var7;
      v8 = predictionTimeInterval + var7;
      predictor = self->_predictor;
      if (!predictor)
      {
        v10 = objc_alloc_init(PKInputPointPredictor);
        v11 = self->_predictor;
        self->_predictor = v10;

        predictor = self->_predictor;
      }
      v12 = p_halfPredictionTimeIntervalPoint[5];
      v30[4] = p_halfPredictionTimeIntervalPoint[4];
      v30[5] = v12;
      v13 = p_halfPredictionTimeIntervalPoint[7];
      v30[6] = p_halfPredictionTimeIntervalPoint[6];
      v30[7] = v13;
      v14 = p_halfPredictionTimeIntervalPoint[1];
      v30[0] = *p_halfPredictionTimeIntervalPoint;
      v30[1] = v14;
      v15 = p_halfPredictionTimeIntervalPoint[3];
      v30[2] = p_halfPredictionTimeIntervalPoint[2];
      v30[3] = v15;
      -[PKInputPointPredictor predictedPointForPoint:timestamp:]((uint64_t)predictor, v30, &v31, v7);
      v16 = v36;
      *(_OWORD *)&self->_halfPredictionTimeIntervalPoint.timestamp = v35;
      *(_OWORD *)&self->_halfPredictionTimeIntervalPoint.estimationUpdateIndex = v16;
      v17 = v38;
      *(_OWORD *)&self->_halfPredictionTimeIntervalPoint.hasEstimatedAltitudeAndAzimuth = v37;
      *(_OWORD *)&self->_halfPredictionTimeIntervalPoint.estimatedActiveInputProperties = v17;
      v18 = v32;
      self->_halfPredictionTimeIntervalPoint.var0 = v31;
      *(_OWORD *)&self->_halfPredictionTimeIntervalPoint.force = v18;
      v19 = v34;
      *(_OWORD *)&self->_halfPredictionTimeIntervalPoint.altitude = v33;
      *(_OWORD *)&self->_halfPredictionTimeIntervalPoint.directionAngle = v19;
      v20 = self->_predictor;
      v21 = p_halfPredictionTimeIntervalPoint[5];
      v29[4] = p_halfPredictionTimeIntervalPoint[4];
      v29[5] = v21;
      v22 = p_halfPredictionTimeIntervalPoint[7];
      v29[6] = p_halfPredictionTimeIntervalPoint[6];
      v29[7] = v22;
      v23 = p_halfPredictionTimeIntervalPoint[1];
      v29[0] = *p_halfPredictionTimeIntervalPoint;
      v29[1] = v23;
      v24 = p_halfPredictionTimeIntervalPoint[3];
      v29[2] = p_halfPredictionTimeIntervalPoint[2];
      v29[3] = v24;
      -[PKInputPointPredictor predictedPointAtTimestamp:defaultPoint:]((uint64_t)v20, (uint64_t)v29, &v31, v8);
      v25 = v36;
      *(_OWORD *)&self->_fullPredictionTimeIntervalPoint.timestamp = v35;
      *(_OWORD *)&self->_fullPredictionTimeIntervalPoint.estimationUpdateIndex = v25;
      v26 = v38;
      *(_OWORD *)&self->_fullPredictionTimeIntervalPoint.hasEstimatedAltitudeAndAzimuth = v37;
      *(_OWORD *)&self->_fullPredictionTimeIntervalPoint.estimatedActiveInputProperties = v26;
      v27 = v32;
      self->_fullPredictionTimeIntervalPoint.var0 = v31;
      *(_OWORD *)&self->_fullPredictionTimeIntervalPoint.force = v27;
      v28 = v34;
      *(_OWORD *)&self->_fullPredictionTimeIntervalPoint.altitude = v33;
      *(_OWORD *)&self->_fullPredictionTimeIntervalPoint.directionAngle = v28;
      if (self->_useHalfPredictionTimeInterval)
        p_halfPredictionTimeIntervalPoint = (__int128 *)&self->_halfPredictionTimeIntervalPoint;
      else
        p_halfPredictionTimeIntervalPoint = (__int128 *)&self->_fullPredictionTimeIntervalPoint;
    }
    memmove(&self->super._filteredPoint, p_halfPredictionTimeIntervalPoint, 0x80uLL);
  }
}

- (void)resetFilter
{
  PKInputPointPredictor *predictor;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKInputPointPredictionFilter;
  -[PKInputPointBaseFilter resetFilter](&v4, sel_resetFilter);
  predictor = self->_predictor;
  if (predictor)
    predictor->_numPoints = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictor, 0);
}

@end
