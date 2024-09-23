@implementation MTLBlitPassSampleBufferAttachmentDescriptorInternal

- (MTLBlitPassSampleBufferAttachmentDescriptorInternal)init
{
  MTLBlitPassSampleBufferAttachmentDescriptorInternal *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLBlitPassSampleBufferAttachmentDescriptorInternal;
  result = -[MTLBlitPassSampleBufferAttachmentDescriptorInternal init](&v3, sel_init);
  result->_private.startOfEncoderSampleIndex = -1;
  result->_private.endOfEncoderSampleIndex = -1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLBlitPassSampleBufferAttachmentDescriptorInternal;
  -[MTLBlitPassSampleBufferAttachmentDescriptorInternal dealloc](&v3, sel_dealloc);
}

- (const)_descriptorPrivate
{
  return &self->_private;
}

- (void)setSampleBuffer:(id)a3
{
  MTLCounterSampleBuffer *sampleBuffer;

  sampleBuffer = self->_private.sampleBuffer;
  if (sampleBuffer != a3)
  {

    self->_private.sampleBuffer = (MTLCounterSampleBuffer *)a3;
  }
}

- (id)sampleBuffer
{
  return self->_private.sampleBuffer;
}

- (void)setStartOfEncoderSampleIndex:(unint64_t)a3
{
  self->_private.startOfEncoderSampleIndex = a3;
}

- (unint64_t)startOfEncoderSampleIndex
{
  return self->_private.startOfEncoderSampleIndex;
}

- (void)setEndOfEncoderSampleIndex:(unint64_t)a3
{
  self->_private.endOfEncoderSampleIndex = a3;
}

- (unint64_t)endOfEncoderSampleIndex
{
  return self->_private.endOfEncoderSampleIndex;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTLBlitPassSampleBufferAttachmentDescriptorInternal *v4;

  v4 = objc_alloc_init(MTLBlitPassSampleBufferAttachmentDescriptorInternal);
  self = (MTLBlitPassSampleBufferAttachmentDescriptorInternal *)((char *)self + 8);
  v4->_private.sampleBuffer = self->super.super.isa;
  *(_OWORD *)&v4->_private.startOfEncoderSampleIndex = *(_OWORD *)&self->_private.sampleBuffer;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  int v6;
  MTLBlitPassSampleBufferAttachmentDescriptorPrivate *p_private;
  MTLCounterSampleBuffer **v8;

  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    Class = object_getClass(self);
    if (Class != object_getClass(a3))
    {
LABEL_3:
      LOBYTE(v6) = 0;
      return v6;
    }
    p_private = &self->_private;
    v8 = (MTLCounterSampleBuffer **)((char *)a3 + 8);
    if (p_private->sampleBuffer == *v8
      || (v6 = -[MTLCounterSampleBuffer isEqual:](p_private->sampleBuffer, "isEqual:")) != 0)
    {
      if ((MTLCounterSampleBuffer *)p_private->startOfEncoderSampleIndex != v8[1])
        goto LABEL_3;
      LOBYTE(v6) = p_private->endOfEncoderSampleIndex == (_QWORD)v8[2];
    }
  }
  return v6;
}

- (unint64_t)hash
{
  return _MTLHashState((int *)&self->_private, 0x18uLL);
}

@end
