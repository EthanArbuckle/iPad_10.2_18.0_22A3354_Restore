@implementation MPSGraphLSTMBaseOp

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desc, 0);
}

@end
