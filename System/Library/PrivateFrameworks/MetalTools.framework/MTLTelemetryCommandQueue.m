@implementation MTLTelemetryCommandQueue

- (id)commandBuffer
{
  MTLDevice *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];

  v3 = -[MTLToolsObject device](self, "device");
  if (!-[MTLDevice enableTelemetry](v3, "enableTelemetry"))
    return 0;
  v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBuffer");
  if (!v4)
    return 0;
  v5 = v4;
  v6 = *((_QWORD *)v3 + 91);
  if (v6)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__MTLTelemetryCommandQueue_commandBuffer__block_invoke;
    block[3] = &unk_24F795440;
    block[4] = v3;
    dispatch_sync(v6, block);
  }
  return -[MTLTelemetryCommandBuffer initWithCommandBuffer:commandQueue:descriptor:]([MTLTelemetryCommandBuffer alloc], "initWithCommandBuffer:commandQueue:descriptor:", v5, self, 0);
}

uint64_t __41__MTLTelemetryCommandQueue_commandBuffer__block_invoke(uint64_t result)
{
  ++**(_DWORD **)(*(_QWORD *)(result + 32) + 112);
  return result;
}

- (id)commandBufferWithUnretainedReferences
{
  MTLDevice *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];

  v3 = -[MTLToolsObject device](self, "device");
  if (!-[MTLDevice enableTelemetry](v3, "enableTelemetry"))
    return 0;
  v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBuffer");
  if (!v4)
    return 0;
  v5 = v4;
  v6 = *((_QWORD *)v3 + 91);
  if (v6)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__MTLTelemetryCommandQueue_commandBufferWithUnretainedReferences__block_invoke;
    block[3] = &unk_24F795440;
    block[4] = v3;
    dispatch_sync(v6, block);
  }
  return -[MTLTelemetryCommandBuffer initWithCommandBuffer:commandQueue:descriptor:]([MTLTelemetryCommandBuffer alloc], "initWithCommandBuffer:commandQueue:descriptor:", v5, self, 0);
}

uint64_t __65__MTLTelemetryCommandQueue_commandBufferWithUnretainedReferences__block_invoke(uint64_t result)
{
  ++**(_DWORD **)(*(_QWORD *)(result + 32) + 112);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 112) + 4);
  return result;
}

- (id)commandBufferWithDescriptor:(id)a3
{
  MTLDevice *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v10[6];

  v5 = -[MTLToolsObject device](self, "device");
  if (!-[MTLDevice enableTelemetry](v5, "enableTelemetry"))
    return 0;
  v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBufferWithDescriptor:", -[MTLToolsDevice unwrapMTLCommandBufferDescriptor:alwaysCopy:](self->super.super._device, "unwrapMTLCommandBufferDescriptor:alwaysCopy:", a3, 0));
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *((_QWORD *)v5 + 91);
  if (v8)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __56__MTLTelemetryCommandQueue_commandBufferWithDescriptor___block_invoke;
    v10[3] = &unk_24F7953B0;
    v10[4] = v5;
    v10[5] = a3;
    dispatch_sync(v8, v10);
  }
  return -[MTLTelemetryCommandBuffer initWithCommandBuffer:commandQueue:descriptor:]([MTLTelemetryCommandBuffer alloc], "initWithCommandBuffer:commandQueue:descriptor:", v7, self, a3);
}

uint64_t __56__MTLTelemetryCommandQueue_commandBufferWithDescriptor___block_invoke(uint64_t a1)
{
  uint64_t result;

  ++**(_DWORD **)(*(_QWORD *)(a1 + 32) + 112);
  result = objc_msgSend(*(id *)(a1 + 40), "retainedReferences");
  if ((result & 1) == 0)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) + 4);
  return result;
}

@end
