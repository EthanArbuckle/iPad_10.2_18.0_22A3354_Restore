@implementation MLWrappedModel

- (MLWrappedModel)initWithInnerModel:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  MLWrappedModel *v8;
  objc_super v10;

  v5 = a3;
  objc_msgSend(v5, "modelDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)MLWrappedModel;
  v8 = -[MLModel initWithDescription:configuration:](&v10, sel_initWithDescription_configuration_, v6, v7);

  if (v8)
    objc_storeStrong((id *)&v8->_innerModel, a3);

  return v8;
}

- (void)clearInnerModelWithReason:(id)a3
{
  id v4;

  v4 = a3;
  -[MLWrappedModel setInnerModel:](self, "setInnerModel:", 0);
  -[MLWrappedModel setReason:](self, "setReason:", v4);

}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  -[MLWrappedModel innerModel](self, "innerModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    -[MLWrappedModel reason](self, "reason");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "exceptionWithName:reason:userInfo:", CFSTR("IllegalOperation"), v12, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v13);
  }
  -[MLWrappedModel innerModel](self, "innerModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predictionFromFeatures:error:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  -[MLWrappedModel innerModel](self, "innerModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    -[MLWrappedModel reason](self, "reason");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "exceptionWithName:reason:userInfo:", CFSTR("IllegalOperation"), v15, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v16);
  }
  -[MLWrappedModel innerModel](self, "innerModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predictionFromFeatures:options:error:", v8, v9, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)predictionsFromBatch:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  -[MLWrappedModel innerModel](self, "innerModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    -[MLWrappedModel reason](self, "reason");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "exceptionWithName:reason:userInfo:", CFSTR("IllegalOperation"), v12, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v13);
  }
  -[MLWrappedModel innerModel](self, "innerModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predictionsFromBatch:error:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  -[MLWrappedModel innerModel](self, "innerModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    -[MLWrappedModel reason](self, "reason");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "exceptionWithName:reason:userInfo:", CFSTR("IllegalOperation"), v15, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v16);
  }
  -[MLWrappedModel innerModel](self, "innerModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predictionsFromBatch:options:error:", v8, v9, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)parameterValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  -[MLWrappedModel innerModel](self, "innerModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    -[MLWrappedModel reason](self, "reason");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "exceptionWithName:reason:userInfo:", CFSTR("IllegalOperation"), v12, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v13);
  }
  -[MLWrappedModel innerModel](self, "innerModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parameterValueForKey:error:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (MLModel)innerModel
{
  return (MLModel *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInnerModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_innerModel, 0);
}

@end
