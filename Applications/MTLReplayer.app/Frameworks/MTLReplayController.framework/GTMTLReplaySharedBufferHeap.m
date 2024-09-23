@implementation GTMTLReplaySharedBufferHeap

- (GTMTLReplaySharedBufferHeap)initWithBuffer:(id)a3 resourcePool:(id)a4
{
  id v7;
  id v8;
  GTMTLReplaySharedBufferHeap *v9;
  GTMTLReplaySharedBufferHeap *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GTMTLReplaySharedBufferHeap;
  v9 = -[GTMTLReplaySharedBufferHeap init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_buffer, a3);
    objc_storeStrong((id *)&v10->_resourcePool, a4);
  }

  return v10;
}

- (id)buffer
{
  return self->_buffer;
}

- (void)dealloc
{
  objc_super v3;

  -[GTMTLReplaySharedResourcePool reclaimBuffer:](self->_resourcePool, "reclaimBuffer:", self->_buffer);
  v3.receiver = self;
  v3.super_class = (Class)GTMTLReplaySharedBufferHeap;
  -[GTMTLReplaySharedBufferHeap dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourcePool, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
