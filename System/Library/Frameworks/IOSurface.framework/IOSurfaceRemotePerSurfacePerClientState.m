@implementation IOSurfaceRemotePerSurfacePerClientState

- (IOSurfaceRemotePerSurfacePerClientState)initWithSurface:(__IOSurfaceClient *)a3 mappedAddress:(void *)a4 mappedSize:(unint64_t)a5 extraData:(id)a6
{
  id v9;
  IOSurfaceRemotePerSurfacePerClientState *v10;
  void *v11;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)IOSurfaceRemotePerSurfacePerClientState;
  v9 = a6;
  v10 = -[IOSurfaceRemotePerSurfacePerClientState init](&v13, sel_init);
  v10->_surface = a3;
  v10->_refcount = 1;
  +[IOSurfaceRemotePerSurfaceGlobalState globalStateForSurface:mappedAddress:mappedSize:extraData:](IOSurfaceRemotePerSurfaceGlobalState, "globalStateForSurface:mappedAddress:mappedSize:extraData:", a3, a4, a5, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[IOSurfaceRemotePerSurfacePerClientState setGlobalState:](v10, "setGlobalState:", v11);
  return v10;
}

- (__IOSurfaceClient)surface
{
  return self->_surface;
}

- (unsigned)debugRefCount
{
  return self->_refcount;
}

- (void)addClientReferenceToSurfaceWithExtraData:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  ++self->_refcount;
  -[IOSurfaceRemotePerSurfacePerClientState globalState](self, "globalState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "mergeExtraData:", v6);

}

- (BOOL)removeClientReferenceToSurface
{
  unsigned int refcount;
  void *v5;
  void *v6;

  refcount = self->_refcount;
  if (!refcount)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[IOSurfaceRemotePerSurfacePerClientState removeClientReferenceToSurface]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("IOSurfaceRemoteServer.m"), 279, CFSTR("BUG: refcount is already zero"));

    refcount = self->_refcount;
  }
  self->_refcount = refcount - 1;
  IOSurfaceClientRelease(self->_surface);
  return self->_refcount == 0;
}

- (id)mergeExtraData:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IOSurfaceRemotePerSurfacePerClientState globalState](self, "globalState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mergeExtraData:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  while (self->_refcount)
    -[IOSurfaceRemotePerSurfacePerClientState removeClientReferenceToSurface](self, "removeClientReferenceToSurface");
  v3.receiver = self;
  v3.super_class = (Class)IOSurfaceRemotePerSurfacePerClientState;
  -[IOSurfaceRemotePerSurfacePerClientState dealloc](&v3, sel_dealloc);
}

- (IOSurfaceRemotePerSurfaceGlobalState)globalState
{
  return self->_globalState;
}

- (void)setGlobalState:(id)a3
{
  objc_storeStrong((id *)&self->_globalState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalState, 0);
}

@end
