@implementation TestImage

- (NSURL)file
{
  return self->_file;
}

- (void)setFile:(id)a3
{
  objc_storeStrong((id *)&self->_file, a3);
}

- (NSString)assetName
{
  return self->_assetName;
}

- (void)setAssetName:(id)a3
{
  objc_storeStrong((id *)&self->_assetName, a3);
}

- (UIView)drawingOverlay
{
  return self->_drawingOverlay;
}

- (void)setDrawingOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_drawingOverlay, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawingOverlay, 0);
  objc_storeStrong((id *)&self->_assetName, 0);
  objc_storeStrong((id *)&self->_file, 0);
}

@end
