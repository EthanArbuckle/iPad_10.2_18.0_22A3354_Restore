@implementation HMBProcessingResult

- (HMBProcessingResult)initWithOptions:(id)a3 actions:(id)a4 mirrorOutputResult:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMBProcessingResult *v12;
  HMBProcessingResult *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMBProcessingResult;
  v12 = -[HMBProcessingResult init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_options, a3);
    objc_storeStrong((id *)&v13->_actions, a4);
    objc_storeStrong((id *)&v13->_mirrorOutputResult, a5);
  }

  return v13;
}

- (HMBProcessingOptions)options
{
  return self->_options;
}

- (NSArray)actions
{
  return self->_actions;
}

- (NAFuture)mirrorOutputResult
{
  return self->_mirrorOutputResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirrorOutputResult, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
