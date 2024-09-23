@implementation VNRecognizeDocumentElementsRequestConfiguration

- (VNRecognizeDocumentElementsRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNRecognizeDocumentElementsRequestConfiguration *v3;
  VNRecognizeDocumentElementsRequestConfiguration *v4;
  VNRecognizeDocumentElementsRequestElementConfiguration *v5;
  VNRecognizeDocumentElementsRequestElementConfiguration *documentElements;
  VNRecognizeDocumentElementsRequestElementConfiguration *v7;
  VNRecognizeDocumentElementsRequestElementConfiguration *textElements;
  VNRecognizeDocumentElementsRequestElementConfiguration *v9;
  VNRecognizeDocumentElementsRequestElementConfiguration *machineReadableCodeElements;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VNRecognizeDocumentElementsRequestConfiguration;
  v3 = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v12, sel_initWithRequestClass_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_imageCropAndScaleOption = 2;
    v5 = +[VNRecognizeDocumentElementsRequestElementConfiguration newConfiguration](VNRecognizeDocumentElementsRequestElementConfiguration, "newConfiguration");
    documentElements = v4->_documentElements;
    v4->_documentElements = v5;

    v7 = +[VNRecognizeDocumentElementsRequestElementConfiguration newConfiguration](VNRecognizeDocumentElementsRequestElementConfiguration, "newConfiguration");
    textElements = v4->_textElements;
    v4->_textElements = v7;

    v9 = +[VNRecognizeDocumentElementsRequestElementConfiguration newConfiguration](VNRecognizeDocumentElementsRequestElementConfiguration, "newConfiguration");
    machineReadableCodeElements = v4->_machineReadableCodeElements;
    v4->_machineReadableCodeElements = v9;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VNRecognizeDocumentElementsRequestConfiguration;
  v4 = -[VNImageBasedRequestConfiguration copyWithZone:](&v13, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    v4[18] = self->_imageCropAndScaleOption;
    v6 = -[VNRecognizeDocumentElementsRequestElementConfiguration copy](self->_documentElements, "copy");
    v7 = (void *)v5[19];
    v5[19] = v6;

    v8 = -[VNRecognizeDocumentElementsRequestElementConfiguration copy](self->_textElements, "copy");
    v9 = (void *)v5[20];
    v5[20] = v8;

    v10 = -[VNRecognizeDocumentElementsRequestElementConfiguration copy](self->_machineReadableCodeElements, "copy");
    v11 = (void *)v5[21];
    v5[21] = v10;

  }
  return v5;
}

- (unint64_t)imageCropAndScaleOption
{
  return self->_imageCropAndScaleOption;
}

- (void)setImageCropAndScaleOption:(unint64_t)a3
{
  self->_imageCropAndScaleOption = a3;
}

- (VNRecognizeDocumentElementsRequestElementConfiguration)documentElements
{
  return (VNRecognizeDocumentElementsRequestElementConfiguration *)objc_getProperty(self, a2, 152, 1);
}

- (VNRecognizeDocumentElementsRequestElementConfiguration)textElements
{
  return (VNRecognizeDocumentElementsRequestElementConfiguration *)objc_getProperty(self, a2, 160, 1);
}

- (VNRecognizeDocumentElementsRequestElementConfiguration)machineReadableCodeElements
{
  return (VNRecognizeDocumentElementsRequestElementConfiguration *)objc_getProperty(self, a2, 168, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machineReadableCodeElements, 0);
  objc_storeStrong((id *)&self->_textElements, 0);
  objc_storeStrong((id *)&self->_documentElements, 0);
}

@end
