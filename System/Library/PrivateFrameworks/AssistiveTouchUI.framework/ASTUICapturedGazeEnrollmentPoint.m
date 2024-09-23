@implementation ASTUICapturedGazeEnrollmentPoint

- (CGPoint)groundTruthPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_groundTruthPoint.x;
  y = self->_groundTruthPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setGroundTruthPoint:(CGPoint)a3
{
  self->_groundTruthPoint = a3;
}

- (CGPoint)predictedPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_predictedPoint.x;
  y = self->_predictedPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPredictedPoint:(CGPoint)a3
{
  self->_predictedPoint = a3;
}

- (NSString)positionName
{
  return self->_positionName;
}

- (void)setPositionName:(id)a3
{
  objc_storeStrong((id *)&self->_positionName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_positionName, 0);
}

@end
