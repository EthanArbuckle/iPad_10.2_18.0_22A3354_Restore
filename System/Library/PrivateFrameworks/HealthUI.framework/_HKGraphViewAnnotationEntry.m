@implementation _HKGraphViewAnnotationEntry

- (NSAttributedString)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
  objc_storeStrong((id *)&self->_annotation, a3);
}

- (id)modelCoordinate
{
  return self->_modelCoordinate;
}

- (void)setModelCoordinate:(id)a3
{
  objc_storeStrong(&self->_modelCoordinate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_modelCoordinate, 0);
  objc_storeStrong((id *)&self->_annotation, 0);
}

@end
