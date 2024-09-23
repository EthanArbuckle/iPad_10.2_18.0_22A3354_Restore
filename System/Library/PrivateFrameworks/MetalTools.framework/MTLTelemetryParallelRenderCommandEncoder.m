@implementation MTLTelemetryParallelRenderCommandEncoder

- (MTLTelemetryParallelRenderCommandEncoder)initWithBaseRenderPass:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5
{
  MTLTelemetryParallelRenderCommandEncoder *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTLTelemetryParallelRenderCommandEncoder;
  v7 = -[MTLToolsParallelRenderCommandEncoder initWithParallelRenderCommandEncoder:parent:descriptor:](&v9, sel_initWithParallelRenderCommandEncoder_parent_descriptor_, a3);
  if (v7)
  {
    v7->_descriptor = (MTLRenderPassDescriptor *)objc_msgSend(a5, "copy");
    v7->_telemetryDevice = (MTLTelemetryDevice *)-[MTLToolsObject device](v7, "device");
    v7->_telemetryCommandBuffer = (MTLTelemetryCommandBuffer *)a4;
    v7->_encoderCount = 0;
  }
  return v7;
}

- (id)renderCommandEncoder
{
  id result;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "renderCommandEncoder");
  if (result)
  {
    ++self->_encoderCount;
    return -[MTLTelemetryRenderCommandEncoder initWithRenderCommandEncoder:parent:commandBuffer:descriptor:]([MTLTelemetryRenderCommandEncoder alloc], "initWithRenderCommandEncoder:parent:commandBuffer:descriptor:", result, self, self->_telemetryCommandBuffer, self->_descriptor);
  }
  return result;
}

- (void)endEncoding
{
  uint64_t encoderCount;
  MTLTelemetryStatisticUIRec *parallellRenderEncoderDistribution;

  encoderCount = self->_encoderCount;
  if ((_DWORD)encoderCount)
  {
    parallellRenderEncoderDistribution = self->_telemetryCommandBuffer->parallellRenderEncoderDistribution;
    if (parallellRenderEncoderDistribution->count)
    {
      if (encoderCount > parallellRenderEncoderDistribution->max)
      {
        parallellRenderEncoderDistribution->max = encoderCount;
        parallellRenderEncoderDistribution = self->_telemetryCommandBuffer->parallellRenderEncoderDistribution;
      }
      if (encoderCount >= parallellRenderEncoderDistribution->min)
        goto LABEL_9;
    }
    else
    {
      parallellRenderEncoderDistribution->max = encoderCount;
      parallellRenderEncoderDistribution = self->_telemetryCommandBuffer->parallellRenderEncoderDistribution;
    }
    parallellRenderEncoderDistribution->min = encoderCount;
LABEL_9:
    self->_telemetryCommandBuffer->parallellRenderEncoderDistribution->total += encoderCount;
    ++self->_telemetryCommandBuffer->parallellRenderEncoderDistribution->count;
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncoding");
}

@end
