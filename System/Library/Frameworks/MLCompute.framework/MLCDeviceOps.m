@implementation MLCDeviceOps

- (MLCDeviceOps)initWithSource:(id)a3 secondarySource:(id)a4 result:(id)a5 batchSize:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  MLCDeviceOps *v14;
  MLCDeviceOps *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MLCDeviceOps;
  v14 = -[MLCDeviceOps init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong(&v14->_source, a3);
    objc_storeStrong(&v15->_secondarySource, a4);
    objc_storeStrong(&v15->_result, a5);
    v15->_batchSize = a6;
    *(_WORD *)&v15->_sourceOfForwardNeededForGradient = 0;
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[MLCDeviceOps source](self, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCDeviceOps secondarySource](self, "secondarySource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCDeviceOps result](self, "result");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithSource:secondarySource:result:batchSize:", v5, v6, v7, -[MLCDeviceOps batchSize](self, "batchSize"));

  return v8;
}

- (id)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong(&self->_source, a3);
}

- (id)secondarySource
{
  return self->_secondarySource;
}

- (void)setSecondarySource:(id)a3
{
  objc_storeStrong(&self->_secondarySource, a3);
}

- (id)tertiarySource
{
  return self->_tertiarySource;
}

- (void)setTertiarySource:(id)a3
{
  objc_storeStrong(&self->_tertiarySource, a3);
}

- (id)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong(&self->_result, a3);
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (BOOL)sourceOfForwardNeededForGradient
{
  return self->_sourceOfForwardNeededForGradient;
}

- (void)setSourceOfForwardNeededForGradient:(BOOL)a3
{
  self->_sourceOfForwardNeededForGradient = a3;
}

- (BOOL)resultOfForwardNeededForGradient
{
  return self->_resultOfForwardNeededForGradient;
}

- (void)setResultOfForwardNeededForGradient:(BOOL)a3
{
  self->_resultOfForwardNeededForGradient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_result, 0);
  objc_storeStrong(&self->_tertiarySource, 0);
  objc_storeStrong(&self->_secondarySource, 0);
  objc_storeStrong(&self->_source, 0);
}

@end
