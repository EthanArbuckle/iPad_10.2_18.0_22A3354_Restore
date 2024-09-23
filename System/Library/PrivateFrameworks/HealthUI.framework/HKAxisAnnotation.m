@implementation HKAxisAnnotation

- (HKAxisAnnotation)initWithAnnotation:(id)a3 position:(id)a4
{
  id v7;
  id v8;
  HKAxisAnnotation *v9;
  HKAxisAnnotation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKAxisAnnotation;
  v9 = -[HKAxisAnnotation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_annotationText, a3);
    objc_storeStrong(&v10->_position, a4);
  }

  return v10;
}

- (NSAttributedString)annotationText
{
  return self->_annotationText;
}

- (id)position
{
  return self->_position;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_position, 0);
  objc_storeStrong((id *)&self->_annotationText, 0);
}

@end
