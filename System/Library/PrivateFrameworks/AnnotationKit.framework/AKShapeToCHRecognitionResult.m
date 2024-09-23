@implementation AKShapeToCHRecognitionResult

- (AKShapeToCHRecognitionResult)initWith:(int64_t)a3 result:(id)a4
{
  id v7;
  AKShapeToCHRecognitionResult *v8;
  AKShapeToCHRecognitionResult *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AKShapeToCHRecognitionResult;
  v8 = -[AKShapeToCHRecognitionResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_tag = a3;
    objc_storeStrong((id *)&v8->_result, a4);
  }

  return v9;
}

- (int64_t)tag
{
  return self->_tag;
}

- (void)setTag:(int64_t)a3
{
  self->_tag = a3;
}

- (CHRecognitionResult)result
{
  return (CHRecognitionResult *)objc_getProperty(self, a2, 24, 1);
}

- (void)setResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (UIBezierPath)doodlePath
{
  return (UIBezierPath *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDoodlePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (PKDrawing)inkDrawing
{
  return (PKDrawing *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInkDrawing:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (AKAnnotation)annotation
{
  return (AKAnnotation *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAnnotation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (CGRect)doodlePathBoundsInInputView
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_doodlePathBoundsInInputView, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setDoodlePathBoundsInInputView:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_doodlePathBoundsInInputView, &v3, 32, 1, 0);
}

- (BOOL)doodlePathIsPrestroked
{
  return self->_doodlePathIsPrestroked;
}

- (void)setDoodlePathIsPrestroked:(BOOL)a3
{
  self->_doodlePathIsPrestroked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotation, 0);
  objc_storeStrong((id *)&self->_inkDrawing, 0);
  objc_storeStrong((id *)&self->_doodlePath, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

@end
