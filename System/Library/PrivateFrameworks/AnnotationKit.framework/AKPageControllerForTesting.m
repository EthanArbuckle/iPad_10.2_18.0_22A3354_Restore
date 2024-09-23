@implementation AKPageControllerForTesting

- (AKPageControllerForTesting)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKPageControllerForTesting;
  return (AKPageControllerForTesting *)-[AKPageController initForTesting](&v3, sel_initForTesting);
}

- (id)controller
{
  return (id)MEMORY[0x24BEDD108](self, sel_testingController);
}

- (unint64_t)pageIndex
{
  return MEMORY[0x24BEDD108](self, sel_testingPageIndex);
}

- (id)pageModelController
{
  return (id)MEMORY[0x24BEDD108](self, sel_testingPageModelController);
}

- (id)layerPresentationManager
{
  return (id)MEMORY[0x24BEDD108](self, sel_testingLayerPresentationManager);
}

- (id)geometryHelper
{
  return (id)MEMORY[0x24BEDD108](self, sel_testingGeometryHelper);
}

- (id)overlayView
{
  return (id)MEMORY[0x24BEDD108](self, sel_testingOverlayView);
}

- (CGRect)maxPageRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 100.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 100.0;
  result.size.height = v5;
  result.size.width = v2;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)modelBaseScaleFactor
{
  return 1.0;
}

- (AKController)testingController
{
  return (AKController *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTestingController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (unint64_t)testingPageIndex
{
  return self->_testingPageIndex;
}

- (void)setTestingPageIndex:(unint64_t)a3
{
  self->_testingPageIndex = a3;
}

- (AKPageModelController)testingPageModelController
{
  return (AKPageModelController *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTestingPageModelController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (AKLayerPresentationManager)testingLayerPresentationManager
{
  return (AKLayerPresentationManager *)objc_getProperty(self, a2, 120, 1);
}

- (void)setTestingLayerPresentationManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (AKGeometryHelper)testingGeometryHelper
{
  return (AKGeometryHelper *)objc_getProperty(self, a2, 128, 1);
}

- (void)setTestingGeometryHelper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (UIView)testingOverlayView
{
  return (UIView *)objc_getProperty(self, a2, 136, 1);
}

- (void)setTestingOverlayView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testingOverlayView, 0);
  objc_storeStrong((id *)&self->_testingGeometryHelper, 0);
  objc_storeStrong((id *)&self->_testingLayerPresentationManager, 0);
  objc_storeStrong((id *)&self->_testingPageModelController, 0);
  objc_storeStrong((id *)&self->_testingController, 0);
}

@end
