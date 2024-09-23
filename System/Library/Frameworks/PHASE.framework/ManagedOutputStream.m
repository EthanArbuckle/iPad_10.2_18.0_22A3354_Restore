@implementation ManagedOutputStream

- (ManagedOutputStream)initWithPaused:(BOOL)a3 attributedTo:(id)a4 definition:(id)a5 renderBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  ManagedOutputStream *v14;
  ManagedOutputStream *v15;
  void *v16;
  id renderBlock;
  objc_super v19;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ManagedOutputStream;
  v14 = -[ManagedOutputStream init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_streamPaused = a3;
    objc_storeStrong((id *)&v14->_definition, a5);
    v16 = _Block_copy(v13);
    renderBlock = v15->_renderBlock;
    v15->_renderBlock = v16;

    objc_storeStrong((id *)&v15->_attributedClientID, a4);
  }

  return v15;
}

- (BOOL)isStreamPaused
{
  return self->_streamPaused;
}

- (void)setStreamPaused:(BOOL)a3
{
  self->_streamPaused = a3;
}

- (BOOL)isControllerPaused
{
  return self->_controllerPaused;
}

- (void)setControllerPaused:(BOOL)a3
{
  self->_controllerPaused = a3;
}

- (PHASEExternalOutputStreamDefinition)definition
{
  return self->_definition;
}

- (void)setDefinition:(id)a3
{
  objc_storeStrong((id *)&self->_definition, a3);
}

- (id)renderBlock
{
  return self->_renderBlock;
}

- (void)setRenderBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUUID)attributedClientID
{
  return self->_attributedClientID;
}

- (void)setAttributedClientID:(id)a3
{
  objc_storeStrong((id *)&self->_attributedClientID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedClientID, 0);
  objc_storeStrong(&self->_renderBlock, 0);
  objc_storeStrong((id *)&self->_definition, 0);
}

@end
