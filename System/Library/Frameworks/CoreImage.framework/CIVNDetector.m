@implementation CIVNDetector

- (CIVNDetector)initWithContext:(id)a3 options:(id)a4
{
  CIVNDetector *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CIVNDetector;
  v5 = -[CIDetector init](&v7, sel_init, a3, a4);
  if (v5)
    v5->context = (CIContext *)a3;
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->context = 0;
  v3.receiver = self;
  v3.super_class = (Class)CIVNDetector;
  -[CIVNDetector dealloc](&v3, sel_dealloc);
}

- (id)featuresInImage:(id)a3 withContext:(id)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
