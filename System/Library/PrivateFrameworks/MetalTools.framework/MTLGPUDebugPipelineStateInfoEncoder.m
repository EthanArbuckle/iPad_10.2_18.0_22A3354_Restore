@implementation MTLGPUDebugPipelineStateInfoEncoder

- (MTLGPUDebugPipelineStateInfoEncoder)initWithDevice:(id)a3
{
  MTLGPUDebugPipelineStateInfoEncoder *v4;
  void *v5;
  id v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTLGPUDebugPipelineStateInfoEncoder;
  v4 = -[MTLGPUDebugPipelineStateInfoEncoder init](&v9, sel_init);
  v5 = (void *)MEMORY[0x22E309364]();
  v6 = objc_alloc_init(MEMORY[0x24BDDD4C0]);
  objc_msgSend(v6, "setArrayLength:", 0);
  objc_msgSend(v6, "setAccess:", 1);
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 11);
  objc_msgSend(v6, "setIndex:", 0);
  objc_msgSend(v6, "setDataType:", 78);
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  objc_msgSend(v6, "setIndex:", 1);
  objc_msgSend(v6, "setDataType:", 79);
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  objc_msgSend(v6, "setIndex:", 2);
  objc_msgSend(v6, "setDataType:", 30);
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  objc_msgSend(v6, "setIndex:", 3);
  objc_msgSend(v6, "setDataType:", 30);
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  objc_msgSend(v6, "setIndex:", 4);
  objc_msgSend(v6, "setDataType:", 30);
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  objc_msgSend(v6, "setIndex:", 5);
  objc_msgSend(v6, "setDataType:", 30);
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  objc_msgSend(v6, "setIndex:", 6);
  objc_msgSend(v6, "setDataType:", 30);
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  objc_msgSend(v6, "setIndex:", 7);
  objc_msgSend(v6, "setDataType:", 30);
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  objc_msgSend(v6, "setIndex:", 8);
  objc_msgSend(v6, "setDataType:", 30);
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  objc_msgSend(v6, "setIndex:", 9);
  objc_msgSend(v6, "setDataType:", 30);
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  objc_msgSend(v6, "setIndex:", 10);
  objc_msgSend(v6, "setDataType:", 30);
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  objc_msgSend(v6, "setIndex:", 11);
  objc_msgSend(v6, "setDataType:", 29);
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  objc_msgSend(v6, "setIndex:", 12);
  objc_msgSend(v6, "setDataType:", 29);
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  objc_msgSend(v6, "setIndex:", 13);
  objc_msgSend(v6, "setDataType:", 30);
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  objc_msgSend(v6, "setIndex:", 14);
  objc_msgSend(v6, "setDataType:", 30);
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  objc_msgSend(v6, "setIndex:", 15);
  objc_msgSend(v6, "setDataType:", 30);
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  objc_msgSend(v6, "setIndex:", 16);
  objc_msgSend(v6, "setDataType:", 30);
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(v6, "copy"));
  v4->_argumentEncoder = (MTLArgumentEncoder *)objc_msgSend((id)objc_msgSend(a3, "baseObject"), "newArgumentEncoderWithArguments:", v7);
  objc_autoreleasePoolPop(v5);
  return v4;
}

- (void)setArgumentBuffer:(id)a3 offset:(unint64_t)a4
{
  -[MTLArgumentEncoder setArgumentBuffer:offset:](self->_argumentEncoder, "setArgumentBuffer:offset:", objc_msgSend(a3, "baseObject"), objc_msgSend(a3, "offset") + a4);
}

- (void)setRenderPipelineState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  -[MTLArgumentEncoder setRenderPipelineState:atIndex:](self->_argumentEncoder, "setRenderPipelineState:atIndex:", objc_msgSend(a3, "baseObject"), 0);
  *(_QWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 2) = a3;
  v5 = objc_msgSend(a3, "vertexFunctionData");
  *(_QWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 3) = v5;
  v6 = objc_msgSend((id)objc_msgSend(a3, "vertexConstantsBuffer"), "handleForOffset:", 0);
  *(_QWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 7) = v6;
  v7 = objc_msgSend(a3, "fragmentFunctionData");
  *(_QWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 5) = v7;
  v8 = objc_msgSend((id)objc_msgSend(a3, "fragmentConstantsBuffer"), "handleForOffset:", 0);
  *(_QWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 9) = v8;
  v9 = objc_msgSend(a3, "tileFunctionData");
  *(_QWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 6) = v9;
  v10 = objc_msgSend((id)objc_msgSend(a3, "tileConstantsBuffer"), "handleForOffset:", 0);
  *(_QWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 10) = v10;
  *(_QWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 4) = 0;
  *(_QWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 8) = 0;
  *(_DWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 11) = 0;
  *(_DWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 12) = 0;
  v11 = objc_msgSend(a3, "meshFunctionData");
  *(_QWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 14) = v11;
  v12 = objc_msgSend((id)objc_msgSend(a3, "meshConstantsBuffer"), "handleForOffset:", 0);
  *(_QWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 16) = v12;
  v13 = objc_msgSend(a3, "objectFunctionData");
  *(_QWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 13) = v13;
  v14 = objc_msgSend((id)objc_msgSend(a3, "objectConstantsBuffer"), "handleForOffset:", 0);
  *(_QWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 15) = v14;
}

- (void)setComputePipelineState:(id)a3
{
  id v3;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  -[MTLArgumentEncoder setComputePipelineState:atIndex:](self->_argumentEncoder, "setComputePipelineState:atIndex:", objc_msgSend(a3, "baseObject"), 1);
  *(_QWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 2) = v3;
  *(_QWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 3) = 0;
  *(_QWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 7) = 0;
  *(_QWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 5) = 0;
  *(_QWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 9) = 0;
  *(_QWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 6) = 0;
  *(_QWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 10) = 0;
  v5 = objc_msgSend(v3, "kernelFunctionData");
  *(_QWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 4) = v5;
  v6 = objc_msgSend((id)objc_msgSend(v3, "globalConstantsBuffer"), "handleForOffset:", 0);
  *(_QWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 8) = v6;
  LODWORD(v6) = objc_msgSend((id)objc_msgSend(v3, "debugInstrumentationData"), "threadgroupArgumentOffset");
  *(_DWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 11) = v6;
  LODWORD(v3) = objc_msgSend((id)objc_msgSend(v3, "debugInstrumentationData"), "activeThreadgroupMask");
  *(_DWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 12) = (_DWORD)v3;
  *(_QWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 14) = 0;
  *(_QWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 16) = 0;
  *(_QWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 13) = 0;
  *(_QWORD *)-[MTLArgumentEncoder constantDataAtIndex:](self->_argumentEncoder, "constantDataAtIndex:", 15) = 0;
}

- (unint64_t)encodedLength
{
  return -[MTLArgumentEncoder encodedLength](self->_argumentEncoder, "encodedLength");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLGPUDebugPipelineStateInfoEncoder;
  -[MTLGPUDebugPipelineStateInfoEncoder dealloc](&v3, sel_dealloc);
}

@end
