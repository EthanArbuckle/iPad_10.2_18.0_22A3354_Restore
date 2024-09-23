@implementation GKBlendNoiseModifier

- (GKBlendNoiseModifier)init
{
  return -[GKBlendNoiseModifier initWithSelectionRangeLowerBound:selectionRangeUpperBound:selectionBoundaryBlendDistance:](self, "initWithSelectionRangeLowerBound:selectionRangeUpperBound:selectionBoundaryBlendDistance:", 0.0, 1.0, 0.0);
}

- (GKBlendNoiseModifier)initWithInputModuleCount:(unint64_t)a3
{
  return -[GKBlendNoiseModifier initWithSelectionRangeLowerBound:selectionRangeUpperBound:selectionBoundaryBlendDistance:](self, "initWithSelectionRangeLowerBound:selectionRangeUpperBound:selectionBoundaryBlendDistance:", a3, 0.0, 1.0, 0.0);
}

- (GKBlendNoiseModifier)initWithSelectionRangeLowerBound:(double)a3 selectionRangeUpperBound:(double)a4 selectionBoundaryBlendDistance:(double)a5
{
  GKBlendNoiseModifier *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GKBlendNoiseModifier;
  result = -[GKNoiseModifier initWithInputModuleCount:](&v9, sel_initWithInputModuleCount_, 3);
  if (result)
  {
    result->_lowerBound = a3;
    result->_upperBound = a4;
    result->_blendDistance = a5;
  }
  return result;
}

- (int)requiredInputModuleCount
{
  return 3;
}

- (double)valueAt:(GKBlendNoiseModifier *)self
{
  __int128 *v2;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  __int128 v14;
  __int128 v15;
  _OWORD v16[2];
  _OWORD v17[2];
  _OWORD v18[2];

  v14 = v2[1];
  v15 = *v2;
  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputModules, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v15;
  v18[1] = v14;
  objc_msgSend(v4, "valueAt:", v18);
  v6 = v5;

  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputModules, "objectAtIndexedSubscript:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v15;
  v17[1] = v14;
  objc_msgSend(v7, "valueAt:", v17);
  v9 = v8;

  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputModules, "objectAtIndexedSubscript:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v15;
  v16[1] = v14;
  objc_msgSend(v10, "valueAt:", v16);
  v12 = v11;

  if (self->_lowerBound > v12 || v12 > self->_upperBound)
    return v6;
  return v9;
}

- (id)cloneModule
{
  return -[GKBlendNoiseModifier initWithSelectionRangeLowerBound:selectionRangeUpperBound:selectionBoundaryBlendDistance:]([GKBlendNoiseModifier alloc], "initWithSelectionRangeLowerBound:selectionRangeUpperBound:selectionBoundaryBlendDistance:", self->_lowerBound, self->_upperBound, self->_blendDistance);
}

@end
