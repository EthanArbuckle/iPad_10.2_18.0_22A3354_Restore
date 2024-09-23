@implementation LSOpenResourceOperationDelegateGetXPCInterface

void ___LSOpenResourceOperationDelegateGetXPCInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDCE42A0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_LSOpenResourceOperationDelegateGetXPCInterface::result;
  _LSOpenResourceOperationDelegateGetXPCInterface::result = v0;

  v2 = (void *)_LSOpenResourceOperationDelegateGetXPCInterface::result;
  if (_LSOpenResourceOperationDelegateGetXPCInterface::result)
    goto LABEL_2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSXPCInterface *_LSOpenResourceOperationDelegateGetXPCInterface()_block_invoke");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("LSOpenOperation.mm"), 133, CFSTR("Failed to create XPC interface object."));

  v2 = (void *)_LSOpenResourceOperationDelegateGetXPCInterface::result;
  if (_LSOpenResourceOperationDelegateGetXPCInterface::result)
  {
LABEL_2:
    objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_openResourceOperation_didFinishCopyingResource_, 0, 0);
    objc_msgSend((id)_LSOpenResourceOperationDelegateGetXPCInterface::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_openResourceOperation_didFinishCopyingResource_, 1, 0);
  }
}

@end
