@implementation CSUObjectDetectionResult

- (CSUObjectDetectionResult)initWithCGRect:(CGRect)a3 score:(float)a4 label:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  CSUObjectDetectionResult *v13;
  CSUObjectDetectionResult *v14;
  CSUObjectDetectionResult *v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CSUObjectDetectionResult;
  v13 = -[CSUObjectDetectionResult init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_box.origin.x = x;
    v13->_box.origin.y = y;
    v13->_box.size.width = width;
    v13->_box.size.height = height;
    v13->_score = a4;
    objc_storeStrong((id *)&v13->_label, a5);
    v15 = v14;
  }

  return v14;
}

- (CGRect)box
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_box.origin.x;
  y = self->_box.origin.y;
  width = self->_box.size.width;
  height = self->_box.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (float)score
{
  return self->_score;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
