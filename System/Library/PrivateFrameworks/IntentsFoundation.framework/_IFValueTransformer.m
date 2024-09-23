@implementation _IFValueTransformer

- (_IFValueTransformer)initWithForwardTransformation:(id)a3 reverseTransformation:(id)a4
{
  id v6;
  id v7;
  _IFValueTransformer *v8;
  uint64_t v9;
  id forwardTransformation;
  uint64_t v11;
  id reverseTransformation;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_IFValueTransformer;
  v8 = -[_IFValueTransformer init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    forwardTransformation = v8->_forwardTransformation;
    v8->_forwardTransformation = (id)v9;

    v11 = objc_msgSend(v7, "copy");
    reverseTransformation = v8->_reverseTransformation;
    v8->_reverseTransformation = (id)v11;

  }
  return v8;
}

- (id)transformedValue:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;

  v4 = a3;
  -[_IFValueTransformer forwardTransformation](self, "forwardTransformation");
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
  -[_IFValueTransformer reverseTransformation](self, "reverseTransformation");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v5)[2](v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)forwardTransformation
{
  return self->_forwardTransformation;
}

- (id)reverseTransformation
{
  return self->_reverseTransformation;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reverseTransformation, 0);
  objc_storeStrong(&self->_forwardTransformation, 0);
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

@end
