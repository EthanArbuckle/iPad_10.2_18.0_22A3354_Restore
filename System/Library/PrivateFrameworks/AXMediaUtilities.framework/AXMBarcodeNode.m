@implementation AXMBarcodeNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isSupported
{
  return 1;
}

+ (id)title
{
  return CFSTR("Barcode");
}

- (AVCaptureMetadataOutput)captureOutput
{
  return self->_captureOutput;
}

- (void)setCaptureOutput:(id)a3
{
  objc_storeStrong((id *)&self->_captureOutput, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureOutput, 0);
}

@end
