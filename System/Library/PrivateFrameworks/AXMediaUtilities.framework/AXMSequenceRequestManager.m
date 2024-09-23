@implementation AXMSequenceRequestManager

- (VNSequenceRequestHandler)sequenceRequestHandler
{
  VNSequenceRequestHandler *sequenceRequestHandler;
  void *v4;
  objc_class *v5;
  VNSequenceRequestHandler *v6;
  VNSequenceRequestHandler *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  sequenceRequestHandler = self->_sequenceRequestHandler;
  if (!sequenceRequestHandler)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getVNSequenceRequestHandlerClass_softClass;
    v13 = getVNSequenceRequestHandlerClass_softClass;
    if (!getVNSequenceRequestHandlerClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getVNSequenceRequestHandlerClass_block_invoke;
      v9[3] = &unk_1E625C4E8;
      v9[4] = &v10;
      __getVNSequenceRequestHandlerClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (VNSequenceRequestHandler *)objc_alloc_init(v5);
    v7 = self->_sequenceRequestHandler;
    self->_sequenceRequestHandler = v6;

    sequenceRequestHandler = self->_sequenceRequestHandler;
  }
  return sequenceRequestHandler;
}

- (void)setSequenceRequestHandler:(id)a3
{
  objc_storeStrong((id *)&self->_sequenceRequestHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceRequestHandler, 0);
}

@end
