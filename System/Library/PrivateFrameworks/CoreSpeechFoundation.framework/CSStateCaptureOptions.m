@implementation CSStateCaptureOptions

- (CSStateCaptureOptions)initWithMutableBuilder:(id)a3
{
  void (**v4)(id, CSStateCaptureOptionsMutable *);
  CSStateCaptureOptions *v5;
  CSStateCaptureOptionsMutable *v6;
  uint64_t v7;
  NSString *stateDataTitle;
  uint64_t v9;
  NSDictionary *stateData;
  objc_super v12;

  v4 = (void (**)(id, CSStateCaptureOptionsMutable *))a3;
  v12.receiver = self;
  v12.super_class = (Class)CSStateCaptureOptions;
  v5 = -[CSStateCaptureOptions init](&v12, sel_init);
  v6 = objc_alloc_init(CSStateCaptureOptionsMutable);
  if (v5)
  {
    if (v4)
      v4[2](v4, v6);
    -[CSStateCaptureOptionsMutable stateDataTitle](v6, "stateDataTitle");
    v7 = objc_claimAutoreleasedReturnValue();
    stateDataTitle = v5->_stateDataTitle;
    v5->_stateDataTitle = (NSString *)v7;

    -[CSStateCaptureOptionsMutable stateData](v6, "stateData");
    v9 = objc_claimAutoreleasedReturnValue();
    stateData = v5->_stateData;
    v5->_stateData = (NSDictionary *)v9;

  }
  return v5;
}

- (NSString)stateDataTitle
{
  return self->_stateDataTitle;
}

- (NSDictionary)stateData
{
  return self->_stateData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateData, 0);
  objc_storeStrong((id *)&self->_stateDataTitle, 0);
}

@end
