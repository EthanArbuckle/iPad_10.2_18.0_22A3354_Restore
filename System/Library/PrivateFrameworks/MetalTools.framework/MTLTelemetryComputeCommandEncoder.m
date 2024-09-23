@implementation MTLTelemetryComputeCommandEncoder

- (MTLTelemetryComputeCommandEncoder)initWithComputeCommandEncoder:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5
{
  MTLTelemetryComputeCommandEncoder *v6;
  MTLTelemetryComputeCommandEncoder *v7;
  MTLDevice *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTLTelemetryComputeCommandEncoder;
  v6 = -[MTLToolsComputeCommandEncoder initWithComputeCommandEncoder:parent:descriptor:](&v10, sel_initWithComputeCommandEncoder_parent_descriptor_, a3, a4, a5);
  v7 = v6;
  if (v6)
  {
    v8 = -[MTLToolsObject device](v6, "device");
    v7->_telemetryDevice = (MTLTelemetryDevice *)v8;
    if (-[MTLDevice enableTelemetry](v8, "enableTelemetry"))
      v7->_telemetryCommandBuffer = (MTLTelemetryCommandBuffer *)a4;
  }
  return v7;
}

- (void)setComputePipelineState:(id)a3
{
  if (a3)
    objc_msgSend(a3, "accumulateUsage");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setComputePipelineState:", objc_msgSend(a3, "baseObject"));
}

- (void)accumDispatchDistribution:(unint64_t)a3 threadgroupsPerGrid:(id *)a4 threadsPerThreadgroup:(id *)a5 threadsPerGrid:(id *)a6
{
  unsigned int v9;
  MTLTelemetryDispatchDistributionRec *dispatchDistribution;
  unsigned int count;
  unint64_t var0;
  unsigned int v14;
  unint64_t var1;
  unsigned int v16;
  unint64_t var2;
  unsigned int v18;
  unint64_t v19;
  unsigned int v20;
  unint64_t v21;
  unsigned int v22;
  unint64_t v23;
  unsigned int v24;
  unint64_t v25;
  unsigned int v26;
  unint64_t v27;
  unsigned int v28;
  unint64_t v29;
  unsigned int v30;

  v9 = a3;
  if (-[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry"))
  {
    ++self->_ceDispatches;
    ++self->_telemetryCommandBuffer->cbDispatches;
    dispatchDistribution = self->_telemetryCommandBuffer->dispatchDistribution;
    if (!v9)
      goto LABEL_11;
    count = dispatchDistribution->var10.count;
    if (count)
    {
      if (dispatchDistribution->var10.max < v9)
        dispatchDistribution->var10.max = v9;
      if (dispatchDistribution->var10.min <= v9)
        goto LABEL_10;
    }
    else
    {
      dispatchDistribution->var10.max = v9;
    }
    dispatchDistribution->var10.min = v9;
LABEL_10:
    dispatchDistribution->var10.total += v9;
    dispatchDistribution->var10.count = count + 1;
LABEL_11:
    var0 = a4->var0;
    if (!a4->var0)
      goto LABEL_20;
    v14 = dispatchDistribution->var1.count;
    if (v14)
    {
      if (dispatchDistribution->var1.max < var0)
        dispatchDistribution->var1.max = var0;
      if (dispatchDistribution->var1.min <= var0)
        goto LABEL_19;
    }
    else
    {
      dispatchDistribution->var1.max = var0;
    }
    dispatchDistribution->var1.min = var0;
LABEL_19:
    dispatchDistribution->var1.total += var0;
    dispatchDistribution->var1.count = v14 + 1;
LABEL_20:
    var1 = a4->var1;
    if (!(_DWORD)var1)
      goto LABEL_29;
    v16 = dispatchDistribution->var2.count;
    if (v16)
    {
      if (dispatchDistribution->var2.max < var1)
        dispatchDistribution->var2.max = var1;
      if (dispatchDistribution->var2.min <= var1)
        goto LABEL_28;
    }
    else
    {
      dispatchDistribution->var2.max = var1;
    }
    dispatchDistribution->var2.min = var1;
LABEL_28:
    dispatchDistribution->var2.total += var1;
    dispatchDistribution->var2.count = v16 + 1;
LABEL_29:
    var2 = a4->var2;
    if (!(_DWORD)var2)
      goto LABEL_38;
    v18 = dispatchDistribution->var3.count;
    if (v18)
    {
      if (dispatchDistribution->var3.max < var2)
        dispatchDistribution->var3.max = var2;
      if (dispatchDistribution->var3.min <= var2)
        goto LABEL_37;
    }
    else
    {
      dispatchDistribution->var3.max = var2;
    }
    dispatchDistribution->var3.min = var2;
LABEL_37:
    dispatchDistribution->var3.total += var2;
    dispatchDistribution->var3.count = v18 + 1;
LABEL_38:
    v19 = a5->var0;
    if (!a5->var0)
      goto LABEL_47;
    v20 = dispatchDistribution->var7.count;
    if (v20)
    {
      if (dispatchDistribution->var7.max < v19)
        dispatchDistribution->var7.max = v19;
      if (dispatchDistribution->var7.min <= v19)
        goto LABEL_46;
    }
    else
    {
      dispatchDistribution->var7.max = v19;
    }
    dispatchDistribution->var7.min = v19;
LABEL_46:
    dispatchDistribution->var7.total += v19;
    dispatchDistribution->var7.count = v20 + 1;
LABEL_47:
    v21 = a5->var1;
    if (!(_DWORD)v21)
      goto LABEL_56;
    v22 = dispatchDistribution->var8.count;
    if (v22)
    {
      if (dispatchDistribution->var8.max < v21)
        dispatchDistribution->var8.max = v21;
      if (dispatchDistribution->var8.min <= v21)
        goto LABEL_55;
    }
    else
    {
      dispatchDistribution->var8.max = v21;
    }
    dispatchDistribution->var8.min = v21;
LABEL_55:
    dispatchDistribution->var8.total += v21;
    dispatchDistribution->var8.count = v22 + 1;
LABEL_56:
    v23 = a5->var2;
    if (!(_DWORD)v23)
      goto LABEL_65;
    v24 = dispatchDistribution->var9.count;
    if (v24)
    {
      if (dispatchDistribution->var9.max < v23)
        dispatchDistribution->var9.max = v23;
      if (dispatchDistribution->var9.min <= v23)
        goto LABEL_64;
    }
    else
    {
      dispatchDistribution->var9.max = v23;
    }
    dispatchDistribution->var9.min = v23;
LABEL_64:
    dispatchDistribution->var9.total += v23;
    dispatchDistribution->var9.count = v24 + 1;
LABEL_65:
    v25 = a6->var0;
    if (!a6->var0)
      goto LABEL_74;
    v26 = dispatchDistribution->var4.count;
    if (v26)
    {
      if (dispatchDistribution->var4.max < v25)
        dispatchDistribution->var4.max = v25;
      if (dispatchDistribution->var4.min <= v25)
        goto LABEL_73;
    }
    else
    {
      dispatchDistribution->var4.max = v25;
    }
    dispatchDistribution->var4.min = v25;
LABEL_73:
    dispatchDistribution->var4.total += v25;
    dispatchDistribution->var4.count = v26 + 1;
LABEL_74:
    v27 = a6->var1;
    if (!(_DWORD)v27)
      goto LABEL_83;
    v28 = dispatchDistribution->var5.count;
    if (v28)
    {
      if (dispatchDistribution->var5.max < v27)
        dispatchDistribution->var5.max = v27;
      if (dispatchDistribution->var5.min <= v27)
        goto LABEL_82;
    }
    else
    {
      dispatchDistribution->var5.max = v27;
    }
    dispatchDistribution->var5.min = v27;
LABEL_82:
    dispatchDistribution->var5.total += v27;
    dispatchDistribution->var5.count = v28 + 1;
LABEL_83:
    v29 = a6->var2;
    if (!(_DWORD)v29)
      return;
    v30 = dispatchDistribution->var6.count;
    if (v30)
    {
      if (dispatchDistribution->var6.max < v29)
        dispatchDistribution->var6.max = v29;
      if (dispatchDistribution->var6.min <= v29)
        goto LABEL_91;
    }
    else
    {
      dispatchDistribution->var6.max = v29;
    }
    dispatchDistribution->var6.min = v29;
LABEL_91:
    dispatchDistribution->var6.total += v29;
    dispatchDistribution->var6.count = v30 + 1;
  }
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  _QWORD v7[3];
  _QWORD v8[3];
  _QWORD v9[3];

  memset(v7, 0, sizeof(v7));
  memset(v8, 0, sizeof(v8));
  memset(v9, 0, sizeof(v9));
  -[MTLTelemetryComputeCommandEncoder accumDispatchDistribution:threadgroupsPerGrid:threadsPerThreadgroup:threadsPerGrid:](self, "accumDispatchDistribution:threadgroupsPerGrid:threadsPerThreadgroup:threadsPerGrid:", a3, v9, v8, v7);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setThreadgroupMemoryLength:atIndex:", a3, a4);
}

- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  id v7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v8;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v9;
  _QWORD v10[3];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12;

  memset(v10, 0, sizeof(v10));
  v12 = *a3;
  v11 = *a4;
  -[MTLTelemetryComputeCommandEncoder accumDispatchDistribution:threadgroupsPerGrid:threadsPerThreadgroup:threadsPerGrid:](self, "accumDispatchDistribution:threadgroupsPerGrid:threadsPerThreadgroup:threadsPerGrid:", 0, &v12, &v11, v10);
  v7 = -[MTLToolsObject baseObject](self, "baseObject");
  v9 = *a3;
  v8 = *a4;
  objc_msgSend(v7, "dispatchThreadgroups:threadsPerThreadgroup:", &v9, &v8);
}

- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5
{
  id v9;
  uint64_t v10;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11;
  _QWORD v12[3];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v13;
  _QWORD v14[3];

  memset(v12, 0, sizeof(v12));
  memset(v14, 0, sizeof(v14));
  v13 = *a5;
  -[MTLTelemetryComputeCommandEncoder accumDispatchDistribution:threadgroupsPerGrid:threadsPerThreadgroup:threadsPerGrid:](self, "accumDispatchDistribution:threadgroupsPerGrid:threadsPerThreadgroup:threadsPerGrid:", 0, v14, &v13, v12);
  v9 = -[MTLToolsObject baseObject](self, "baseObject");
  v10 = objc_msgSend(a3, "baseObject");
  v11 = *a5;
  objc_msgSend(v9, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", v10, a4, &v11);
}

- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  id v7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v8;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v9;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v10;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11;
  _QWORD v12[3];

  memset(v12, 0, sizeof(v12));
  v11 = *a4;
  v10 = *a3;
  -[MTLTelemetryComputeCommandEncoder accumDispatchDistribution:threadgroupsPerGrid:threadsPerThreadgroup:threadsPerGrid:](self, "accumDispatchDistribution:threadgroupsPerGrid:threadsPerThreadgroup:threadsPerGrid:", 0, v12, &v11, &v10);
  v7 = -[MTLToolsObject baseObject](self, "baseObject");
  v9 = *a3;
  v8 = *a4;
  objc_msgSend(v7, "dispatchThreads:threadsPerThreadgroup:", &v9, &v8);
}

- (void)dispatchThreadsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
  _QWORD v7[3];
  _QWORD v8[3];
  _QWORD v9[3];

  memset(v7, 0, sizeof(v7));
  memset(v8, 0, sizeof(v8));
  memset(v9, 0, sizeof(v9));
  -[MTLTelemetryComputeCommandEncoder accumDispatchDistribution:threadgroupsPerGrid:threadsPerThreadgroup:threadsPerGrid:](self, "accumDispatchDistribution:threadgroupsPerGrid:threadsPerThreadgroup:threadsPerGrid:", 0, v9, v8, v7);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "dispatchThreadsWithIndirectBuffer:indirectBufferOffset:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)endEncoding
{
  uint64_t ceDispatches;
  MTLTelemetryStatisticUIRec *computeEncoderDispatchDistribution;

  if (-[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry"))
  {
    ceDispatches = self->_ceDispatches;
    if ((_DWORD)ceDispatches)
    {
      computeEncoderDispatchDistribution = self->_telemetryCommandBuffer->computeEncoderDispatchDistribution;
      if (computeEncoderDispatchDistribution->count)
      {
        if (ceDispatches > computeEncoderDispatchDistribution->max)
        {
          computeEncoderDispatchDistribution->max = ceDispatches;
          computeEncoderDispatchDistribution = self->_telemetryCommandBuffer->computeEncoderDispatchDistribution;
        }
        if (ceDispatches >= computeEncoderDispatchDistribution->min)
          goto LABEL_10;
      }
      else
      {
        computeEncoderDispatchDistribution->max = ceDispatches;
        computeEncoderDispatchDistribution = self->_telemetryCommandBuffer->computeEncoderDispatchDistribution;
      }
      computeEncoderDispatchDistribution->min = ceDispatches;
LABEL_10:
      self->_telemetryCommandBuffer->computeEncoderDispatchDistribution->total += ceDispatches;
      ++self->_telemetryCommandBuffer->computeEncoderDispatchDistribution->count;
    }
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncoding");
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  unsigned int v7;
  MTLTelemetryStatisticUIRec *textureBindCount;

  if (-[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry"))
  {
    v7 = a4 + 1;
    if ((_DWORD)a4 != -1)
    {
      textureBindCount = self->_telemetryCommandBuffer->textureBindCount;
      if (textureBindCount->count)
      {
        if (v7 > textureBindCount->max)
        {
          textureBindCount->max = v7;
          textureBindCount = self->_telemetryCommandBuffer->textureBindCount;
        }
        if (v7 >= textureBindCount->min)
          goto LABEL_10;
      }
      else
      {
        textureBindCount->max = v7;
        textureBindCount = self->_telemetryCommandBuffer->textureBindCount;
      }
      textureBindCount->min = v7;
LABEL_10:
      self->_telemetryCommandBuffer->textureBindCount->total += v7;
      ++self->_telemetryCommandBuffer->textureBindCount->count;
    }
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTexture:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  _BOOL4 v8;
  unsigned int v9;
  MTLTelemetryStatisticUIRec *textureBindCount;
  _QWORD *v12;
  NSUInteger v13;
  void *v14;
  _BYTE v15[1024];
  uint64_t v16;

  length = a4.length;
  location = a4.location;
  v16 = *MEMORY[0x24BDAC8D0];
  v8 = -[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry");
  v9 = location + length;
  if (v8 && v9 != 0)
  {
    textureBindCount = self->_telemetryCommandBuffer->textureBindCount;
    if (textureBindCount->count)
    {
      if (textureBindCount->max < v9)
      {
        textureBindCount->max = v9;
        textureBindCount = self->_telemetryCommandBuffer->textureBindCount;
      }
      if (textureBindCount->min <= v9)
      {
LABEL_15:
        self->_telemetryCommandBuffer->textureBindCount->total += v9;
        ++self->_telemetryCommandBuffer->textureBindCount->count;
        if (!length)
          goto LABEL_18;
        goto LABEL_16;
      }
    }
    else
    {
      textureBindCount->max = v9;
      textureBindCount = self->_telemetryCommandBuffer->textureBindCount;
    }
    textureBindCount->min = v9;
    goto LABEL_15;
  }
  if (!length)
    goto LABEL_18;
LABEL_16:
  v12 = v15;
  v13 = length;
  do
  {
    v14 = (void *)*a3++;
    *v12++ = objc_msgSend(v14, "baseObject");
    --v13;
  }
  while (v13);
LABEL_18:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTextures:withRange:", v15, location, length);
}

- (void)memoryBarrierWithScope:(unint64_t)a3
{
  if (-[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry"))
    ++self->_telemetryCommandBuffer->cbMemoryBarriers;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "memoryBarrierWithScope:", a3);
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4
{
  if (-[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry"))
    ++self->_telemetryCommandBuffer->cbMemoryBarriers;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "memoryBarrierWithResources:count:", a3, a4);
}

@end
