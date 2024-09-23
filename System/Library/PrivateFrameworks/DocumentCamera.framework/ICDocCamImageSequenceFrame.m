@implementation ICDocCamImageSequenceFrame

- (__CVBuffer)pb
{
  return self->_pb;
}

- (void)setPb:(__CVBuffer *)a3
{
  self->_pb = a3;
}

- (NSDictionary)frameOptions
{
  return self->_frameOptions;
}

- (void)setFrameOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameOptions, 0);
}

@end
