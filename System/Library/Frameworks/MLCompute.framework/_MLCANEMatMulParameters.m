@implementation _MLCANEMatMulParameters

+ (id)matMulUnitParametersWith:(id)a3 transposeXParams:(id)a4 transposeYParams:(id)a5 finalTransposeParams:(id)a6 gocParams:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMatMulParams:transposeXParams:transposeYParams:finalTransposeParams:gocParams:", v16, v15, v14, v13, v12);

  return v17;
}

- (_MLCANEMatMulParameters)initWithMatMulParams:(id)a3 transposeXParams:(id)a4 transposeYParams:(id)a5 finalTransposeParams:(id)a6 gocParams:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  _MLCANEMatMulParameters *v17;
  _MLCANEMatMulParameters *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)_MLCANEMatMulParameters;
  v17 = -[_MLCANEMatMulParameters init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_matMulParams, a3);
    objc_storeStrong((id *)&v18->_transposeXParams, a4);
    objc_storeStrong((id *)&v18->_transposeYParams, a5);
    objc_storeStrong((id *)&v18->_finalTransposeParams, a6);
    objc_storeStrong((id *)&v18->_gocParams, a7);
  }

  return v18;
}

- (NSDictionary)matMulParams
{
  return self->_matMulParams;
}

- (NSDictionary)transposeXParams
{
  return self->_transposeXParams;
}

- (NSDictionary)transposeYParams
{
  return self->_transposeYParams;
}

- (NSDictionary)finalTransposeParams
{
  return self->_finalTransposeParams;
}

- (NSDictionary)gocParams
{
  return self->_gocParams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gocParams, 0);
  objc_storeStrong((id *)&self->_finalTransposeParams, 0);
  objc_storeStrong((id *)&self->_transposeYParams, 0);
  objc_storeStrong((id *)&self->_transposeXParams, 0);
  objc_storeStrong((id *)&self->_matMulParams, 0);
}

@end
