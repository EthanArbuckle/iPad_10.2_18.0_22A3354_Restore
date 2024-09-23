@implementation HFValueTransformer

- (id)transformedValueForValue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;

  v4 = a3;
  if (-[HFValueTransformer valueClass](self, "valueClass"))
  {
    -[HFValueTransformer valueClass](self, "valueClass");
    v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v4 = v6;

  }
  -[HFValueTransformer transformBlock](self, "transformBlock");
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v7)[2](v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (Class)valueClass
{
  return self->_valueClass;
}

- (id)transformBlock
{
  return self->_transformBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reverseTransformBlock, 0);
  objc_storeStrong(&self->_transformBlock, 0);
  objc_storeStrong((id *)&self->_valueClass, 0);
}

+ (id)transformerForValueClass:(Class)a3 transformBlock:(id)a4 reverseTransformBlock:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFValueTransformer.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transformBlock"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFValueTransformer.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reverseTransformBlock"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setValueClass:", a3);
  objc_msgSend(v12, "setTransformBlock:", v9);
  objc_msgSend(v12, "setReverseTransformBlock:", v11);

  return v12;
}

- (void)setValueClass:(Class)a3
{
  objc_storeStrong((id *)&self->_valueClass, a3);
}

- (void)setTransformBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setReverseTransformBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

+ (id)identityTransformer
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setTransformBlock:", &__block_literal_global_186);
  objc_msgSend(v2, "setReverseTransformBlock:", &__block_literal_global_9_13);
  return v2;
}

id __41__HFValueTransformer_identityTransformer__block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id __41__HFValueTransformer_identityTransformer__block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

- (id)valueForTransformedValue:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;

  v4 = a3;
  -[HFValueTransformer reverseTransformBlock](self, "reverseTransformBlock");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v5)[2](v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)reverseTransformBlock
{
  return self->_reverseTransformBlock;
}

@end
