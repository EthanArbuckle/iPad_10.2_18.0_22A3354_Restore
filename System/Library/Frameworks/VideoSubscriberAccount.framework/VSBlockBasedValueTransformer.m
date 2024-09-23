@implementation VSBlockBasedValueTransformer

- (VSBlockBasedValueTransformer)init
{
  VSBlockBasedValueTransformer *v2;
  uint64_t v3;
  id transformationBlock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSBlockBasedValueTransformer;
  v2 = -[VSBlockBasedValueTransformer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(&__block_literal_global_46, "copy");
    transformationBlock = v2->_transformationBlock;
    v2->_transformationBlock = (id)v3;

  }
  return v2;
}

id __36__VSBlockBasedValueTransformer_init__block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

- (id)transformedValue:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;

  v4 = a3;
  -[VSBlockBasedValueTransformer transformationBlock](self, "transformationBlock");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v5)[2](v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)reverseTransformedValue:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;

  v4 = a3;
  -[VSBlockBasedValueTransformer reverseTransformationBlock](self, "reverseTransformationBlock");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v5)[2](v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)transformationBlock
{
  return self->_transformationBlock;
}

- (void)setTransformationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)reverseTransformationBlock
{
  return self->_reverseTransformationBlock;
}

- (void)setReverseTransformationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reverseTransformationBlock, 0);
  objc_storeStrong(&self->_transformationBlock, 0);
}

@end
