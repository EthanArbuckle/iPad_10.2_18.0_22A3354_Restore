@implementation MLProgramTrainingDelta

- (MLProgramTrainingDelta)initWithFlattenedModelUpdate:(id)a3
{
  id v5;
  MLProgramTrainingDelta *v6;
  MLProgramTrainingDelta *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLProgramTrainingDelta;
  v6 = -[MLProgramTrainingDelta init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_flattenedModelUpdate, a3);

  return v7;
}

- (NSData)flattenedModelUpdate
{
  return self->_flattenedModelUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flattenedModelUpdate, 0);
}

@end
