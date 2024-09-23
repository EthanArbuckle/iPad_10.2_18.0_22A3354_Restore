@implementation AKControllerForTesting

- (AKControllerForTesting)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKControllerForTesting;
  return (AKControllerForTesting *)-[AKController initForTesting](&v3, sel_initForTesting);
}

- (void)updateOverlayViewAtIndex:(unint64_t)a3
{
  objc_super v5;

  NSLog(CFSTR("%s called during testing - are you sure this is what you want?"), a2, "-[AKControllerForTesting updateOverlayViewAtIndex:]");
  v5.receiver = self;
  v5.super_class = (Class)AKControllerForTesting;
  -[AKController updateOverlayViewAtIndex:](&v5, sel_updateOverlayViewAtIndex_, a3);
}

- (void)setOverlayShouldPixelate:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  NSLog(CFSTR("%s called during testing - are you sure this is what you want?"), a2, "-[AKControllerForTesting setOverlayShouldPixelate:]");
  v5.receiver = self;
  v5.super_class = (Class)AKControllerForTesting;
  -[AKController setOverlayShouldPixelate:](&v5, sel_setOverlayShouldPixelate_, v3);
}

- (void)performActionForSender:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  NSLog(CFSTR("%s called during testing - are you sure this is what you want?"), "-[AKControllerForTesting performActionForSender:]");
  v5.receiver = self;
  v5.super_class = (Class)AKControllerForTesting;
  -[AKController performActionForSender:](&v5, sel_performActionForSender_, v4);

}

- (BOOL)validateSender:(id)a3
{
  id v4;
  objc_super v6;

  v4 = a3;
  NSLog(CFSTR("%s called during testing - are you sure this is what you want?"), "-[AKControllerForTesting validateSender:]");
  v6.receiver = self;
  v6.super_class = (Class)AKControllerForTesting;
  LOBYTE(self) = -[AKController validateSender:](&v6, sel_validateSender_, v4);

  return (char)self;
}

+ (void)renderAnnotation:(id)a3 inContext:(CGContext *)a4
{
  id v6;
  objc_super v7;

  v6 = a3;
  NSLog(CFSTR("%s called during testing - are you sure this is what you want?"), "+[AKControllerForTesting renderAnnotation:inContext:]");
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___AKControllerForTesting;
  objc_msgSendSuper2(&v7, sel_renderAnnotation_inContext_, v6, a4);

}

- (void)reloadVisibleToolbarItemIdentifiers
{
  objc_super v3;

  NSLog(CFSTR("%s called during testing - are you sure this is what you want?"), a2, "-[AKControllerForTesting reloadVisibleToolbarItemIdentifiers]");
  v3.receiver = self;
  v3.super_class = (Class)AKControllerForTesting;
  -[AKController reloadVisibleToolbarItemIdentifiers](&v3, sel_reloadVisibleToolbarItemIdentifiers);
}

- (id)delegate
{
  return (id)MEMORY[0x24BEDD108](self, sel_testingDelegate);
}

- (id)modelController
{
  return (id)MEMORY[0x24BEDD108](self, sel_testingModelController);
}

- (id)toolbarView
{
  return (id)MEMORY[0x24BEDD108](self, sel_testingToolbarView);
}

- (id)overlayView
{
  return (id)MEMORY[0x24BEDD108](self, sel_testingOverlayView);
}

- (id)actionController
{
  return (id)MEMORY[0x24BEDD108](self, sel_testingActionController);
}

- (id)toolController
{
  return (id)MEMORY[0x24BEDD108](self, sel_testingToolController);
}

- (id)attributeController
{
  return (id)MEMORY[0x24BEDD108](self, sel_testingAttributeController);
}

- (id)undoController
{
  return (id)MEMORY[0x24BEDD108](self, sel_testingUndoController);
}

- (id)mainEventHandler
{
  return (id)MEMORY[0x24BEDD108](self, sel_testingMainEventHandler);
}

- (id)legacyDoodleController
{
  return (id)MEMORY[0x24BEDD108](self, sel_testingIntelligentSketchController);
}

- (id)signatureModelController
{
  return (id)MEMORY[0x24BEDD108](self, sel_testingSignatureModelController);
}

- (AKControllerDelegateProtocol)testingDelegate
{
  return (AKControllerDelegateProtocol *)objc_getProperty(self, a2, 288, 1);
}

- (void)setTestingDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (AKModelController)testingModelController
{
  return (AKModelController *)objc_getProperty(self, a2, 296, 1);
}

- (void)setTestingModelController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (AKActionController)testingActionController
{
  return (AKActionController *)objc_getProperty(self, a2, 304, 1);
}

- (void)setTestingActionController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (AKToolController)testingToolController
{
  return (AKToolController *)objc_getProperty(self, a2, 312, 1);
}

- (void)setTestingToolController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (AKAttributeController)testingAttributeController
{
  return (AKAttributeController *)objc_getProperty(self, a2, 320, 1);
}

- (void)setTestingAttributeController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (AKUndoController)testingUndoController
{
  return (AKUndoController *)objc_getProperty(self, a2, 328, 1);
}

- (void)setTestingUndoController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (AKMainEventHandler)testingMainEventHandler
{
  return (AKMainEventHandler *)objc_getProperty(self, a2, 336, 1);
}

- (void)setTestingMainEventHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (UIView)testingToolbarView
{
  return (UIView *)objc_getProperty(self, a2, 344, 1);
}

- (void)setTestingToolbarView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (UIView)testingOverlayView
{
  return (UIView *)objc_getProperty(self, a2, 352, 1);
}

- (void)setTestingOverlayView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (AKLegacyDoodleController)testingIntelligentSketchController
{
  return (AKLegacyDoodleController *)objc_getProperty(self, a2, 360, 1);
}

- (void)setTestingIntelligentSketchController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (AKSignatureModelController)testingSignatureModelController
{
  return (AKSignatureModelController *)objc_getProperty(self, a2, 368, 1);
}

- (void)setTestingSignatureModelController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testingSignatureModelController, 0);
  objc_storeStrong((id *)&self->_testingIntelligentSketchController, 0);
  objc_storeStrong((id *)&self->_testingOverlayView, 0);
  objc_storeStrong((id *)&self->_testingToolbarView, 0);
  objc_storeStrong((id *)&self->_testingMainEventHandler, 0);
  objc_storeStrong((id *)&self->_testingUndoController, 0);
  objc_storeStrong((id *)&self->_testingAttributeController, 0);
  objc_storeStrong((id *)&self->_testingToolController, 0);
  objc_storeStrong((id *)&self->_testingActionController, 0);
  objc_storeStrong((id *)&self->_testingModelController, 0);
  objc_storeStrong((id *)&self->_testingDelegate, 0);
}

@end
