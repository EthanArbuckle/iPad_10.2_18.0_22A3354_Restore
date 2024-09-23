@implementation FBSDataResetRequest

- (FBSDataResetRequest)initWithMode:(int64_t)a3 options:(int64_t)a4 reason:(id)a5
{
  id v8;
  FBSDataResetRequest *v9;
  FBSDataResetRequest *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)FBSDataResetRequest;
  v9 = -[FBSDataResetRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[FBSDataResetRequest setMode:](v9, "setMode:", a3);
    -[FBSDataResetRequest setOptions:](v10, "setOptions:", a4);
    -[FBSDataResetRequest setReason:](v10, "setReason:", v8);
  }

  return v10;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
