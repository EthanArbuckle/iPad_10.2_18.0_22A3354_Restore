@implementation BWRedEyeReductionRequest

- (BWRedEyeReductionRequest)initWithInput:(id)a3 delegate:(id)a4
{
  BWRedEyeReductionRequest *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWRedEyeReductionRequest;
  v6 = -[BWRedEyeReductionRequest init](&v8, sel_init);
  if (v6)
  {
    v6->_input = (BWRedEyeReductionControllerInput *)a3;
    v6->_delegate = (BWRedEyeReductionControllerDelegate *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWRedEyeReductionRequest;
  -[BWRedEyeReductionRequest dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p>: For %@"), objc_opt_class(), self, self->_input);
}

- (BWRedEyeReductionControllerInput)input
{
  return self->_input;
}

- (BWRedEyeReductionControllerDelegate)delegate
{
  return self->_delegate;
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

@end
