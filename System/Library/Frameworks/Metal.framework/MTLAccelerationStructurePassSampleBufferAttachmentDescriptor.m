@implementation MTLAccelerationStructurePassSampleBufferAttachmentDescriptor

- (MTLAccelerationStructurePassSampleBufferAttachmentDescriptor)init
{
  MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLAccelerationStructurePassSampleBufferAttachmentDescriptor;
  result = -[MTLAccelerationStructurePassSampleBufferAttachmentDescriptor init](&v3, sel_init);
  if (result)
  {
    result->_startOfEncoderSampleIndex = -1;
    result->_endOfEncoderSampleIndex = -1;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLAccelerationStructurePassSampleBufferAttachmentDescriptor;
  -[MTLAccelerationStructurePassSampleBufferAttachmentDescriptor dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setSampleBuffer:", self->_sampleBuffer);
  objc_msgSend(v4, "setStartOfEncoderSampleIndex:", self->_startOfEncoderSampleIndex);
  objc_msgSend(v4, "setEndOfEncoderSampleIndex:", self->_endOfEncoderSampleIndex);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *Class;
  int v12;
  id v13;
  NSUInteger v14;
  NSUInteger v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    v17 = v5;
    v18 = v4;
    v19 = v3;
    Class = object_getClass(self);
    if (Class != object_getClass(a3))
    {
LABEL_3:
      LOBYTE(v12) = 0;
      return v12;
    }
    v13 = -[MTLAccelerationStructurePassSampleBufferAttachmentDescriptor sampleBuffer](self, "sampleBuffer");
    if (v13 == (id)objc_msgSend(a3, "sampleBuffer")
      || (v12 = objc_msgSend(-[MTLAccelerationStructurePassSampleBufferAttachmentDescriptor sampleBuffer](self, "sampleBuffer"), "isEqual:", objc_msgSend(a3, "sampleBuffer"))) != 0)
    {
      v14 = -[MTLAccelerationStructurePassSampleBufferAttachmentDescriptor startOfEncoderSampleIndex](self, "startOfEncoderSampleIndex", v6, v17, v18, v19, v7, v8);
      if (v14 != objc_msgSend(a3, "startOfEncoderSampleIndex"))
        goto LABEL_3;
      v15 = -[MTLAccelerationStructurePassSampleBufferAttachmentDescriptor endOfEncoderSampleIndex](self, "endOfEncoderSampleIndex");
      LOBYTE(v12) = v15 == objc_msgSend(a3, "endOfEncoderSampleIndex");
    }
  }
  return v12;
}

- (unint64_t)hash
{
  _QWORD v4[3];

  bzero(v4, 0x18uLL);
  v4[0] = objc_msgSend(-[MTLAccelerationStructurePassSampleBufferAttachmentDescriptor sampleBuffer](self, "sampleBuffer"), "hash");
  v4[1] = -[MTLAccelerationStructurePassSampleBufferAttachmentDescriptor startOfEncoderSampleIndex](self, "startOfEncoderSampleIndex");
  v4[2] = -[MTLAccelerationStructurePassSampleBufferAttachmentDescriptor endOfEncoderSampleIndex](self, "endOfEncoderSampleIndex");
  return _MTLHashState((int *)v4, 0x18uLL);
}

- (id)sampleBuffer
{
  return self->_sampleBuffer;
}

- (void)setSampleBuffer:(id)sampleBuffer
{
  objc_setProperty_nonatomic(self, a2, sampleBuffer, 8);
}

- (NSUInteger)startOfEncoderSampleIndex
{
  return self->_startOfEncoderSampleIndex;
}

- (void)setStartOfEncoderSampleIndex:(NSUInteger)startOfEncoderSampleIndex
{
  self->_startOfEncoderSampleIndex = startOfEncoderSampleIndex;
}

- (NSUInteger)endOfEncoderSampleIndex
{
  return self->_endOfEncoderSampleIndex;
}

- (void)setEndOfEncoderSampleIndex:(NSUInteger)endOfEncoderSampleIndex
{
  self->_endOfEncoderSampleIndex = endOfEncoderSampleIndex;
}

@end
