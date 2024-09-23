@implementation GTMTLReplaySharedBufferRange

- (GTMTLReplaySharedBufferRange)initWithBuffer:(id)a3
{
  id v5;
  GTMTLReplaySharedBufferRange *v6;
  GTMTLReplaySharedBufferRange *v7;
  id v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTMTLReplaySharedBufferRange;
  v6 = -[GTMTLReplaySharedBufferRange init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_heapBuffer, a3);
    v8 = objc_msgSend(v5, "length");
    v7->_heapRange.location = 0;
    v7->_heapRange.length = (NSUInteger)v8;
  }

  return v7;
}

- (GTMTLReplaySharedBufferRange)initWithHeap:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  GTMTLReplaySharedBufferRange *v9;
  GTMTLReplaySharedBufferRange *v10;
  uint64_t v11;
  MTLBuffer *heapBuffer;
  objc_super v14;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GTMTLReplaySharedBufferRange;
  v9 = -[GTMTLReplaySharedBufferRange init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_heap, a3);
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "buffer"));
    heapBuffer = v10->_heapBuffer;
    v10->_heapBuffer = (MTLBuffer *)v11;

    v10->_heapRange.location = location;
    v10->_heapRange.length = length;
  }

  return v10;
}

- (id)heapBuffer
{
  return self->_heapBuffer;
}

- (unint64_t)heapLocation
{
  return self->_heapRange.location;
}

- (void)contents
{
  return (char *)-[MTLBuffer contents](self->_heapBuffer, "contents") + self->_heapRange.location;
}

- (unint64_t)length
{
  return self->_heapRange.length;
}

- (id)data
{
  GTMTLReplaySharedBufferHeap *v3;
  MTLBuffer *v4;
  id v5;
  MTLBuffer *v6;
  char *v7;
  NSUInteger location;
  NSUInteger length;
  char *v10;
  GTMTLReplaySharedBufferHeap *v11;
  MTLBuffer *v12;
  id v13;
  _QWORD v15[4];
  MTLBuffer *v16;
  GTMTLReplaySharedBufferHeap *v17;

  v3 = self->_heap;
  v4 = self->_heapBuffer;
  v5 = objc_alloc((Class)NSData);
  v6 = objc_retainAutorelease(v4);
  v7 = (char *)-[MTLBuffer contents](v6, "contents");
  location = self->_heapRange.location;
  length = self->_heapRange.length;
  v10 = &v7[location];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __36__GTMTLReplaySharedBufferRange_data__block_invoke;
  v15[3] = &unk_7261A0;
  v16 = v6;
  v17 = v3;
  v11 = v3;
  v12 = v6;
  v13 = objc_msgSend(v5, "initWithBytesNoCopy:length:deallocator:", v10, length, v15);

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heapBuffer, 0);
  objc_storeStrong((id *)&self->_heap, 0);
}

id __36__GTMTLReplaySharedBufferRange_data__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "length");
  return objc_msgSend(*(id *)(a1 + 40), "buffer");
}

@end
