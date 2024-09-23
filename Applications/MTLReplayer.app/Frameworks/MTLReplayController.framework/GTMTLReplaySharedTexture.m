@implementation GTMTLReplaySharedTexture

- (GTMTLReplaySharedTexture)initWithAllocatedSize:(unint64_t)a3 resourcePool:(id)a4
{
  id v7;
  GTMTLReplaySharedTexture *v8;
  GTMTLReplaySharedTexture *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GTMTLReplaySharedTexture;
  v8 = -[GTMTLReplaySharedTexture init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_allocatedSize = a3;
    objc_storeStrong((id *)&v8->_resourcePool, a4);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[GTMTLReplaySharedResourcePool reclaimAllocatedSize:](self->_resourcePool, "reclaimAllocatedSize:", self->_allocatedSize);
  v3.receiver = self;
  v3.super_class = (Class)GTMTLReplaySharedTexture;
  -[GTMTLReplaySharedTexture dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourcePool, 0);
}

@end
