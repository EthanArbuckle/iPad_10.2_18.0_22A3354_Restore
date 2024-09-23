@implementation BWDeferredProcessorControllerInput

- (void)setContainer:(id)a3 photoIdentifier:(id)a4
{
  self->_container = (BWDeferredProcessingContainer *)a3;
  self->_photoIdentifier = (NSString *)objc_msgSend(a4, "copy");
  -[BWStillImageProcessorController currentRequestChanged](self->_processorController, "currentRequestChanged");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWDeferredProcessorControllerInput;
  -[BWStillImageProcessorControllerInput dealloc](&v3, sel_dealloc);
}

- (BWDeferredProcessorController)processorController
{
  return self->_processorController;
}

- (void)setProcessorController:(id)a3
{
  self->_processorController = (BWDeferredProcessorController *)a3;
}

- (BWDeferredProcessingContainer)container
{
  return self->_container;
}

- (NSString)photoIdentifier
{
  return self->_photoIdentifier;
}

@end
