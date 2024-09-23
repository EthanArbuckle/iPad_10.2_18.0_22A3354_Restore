@implementation CRCameraReaderOutputInternal

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  NSString *v4;
  NSString *stringValue;
  void *v6;

  if (a3)
  {
    v4 = (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:");
    stringValue = self->_stringValue;
    self->_stringValue = v4;
  }
  else
  {
    -[CRCameraReaderOutputInternal type](self, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Attempt to set nil value for CROutputObject string value for object type %@"), v6);

    stringValue = self->_stringValue;
    self->_stringValue = 0;
  }

}

- (NSString)formattedStringValue
{
  return self->_formattedStringValue;
}

- (void)setFormattedStringValue:(id)a3
{
  NSString *v4;
  NSString *formattedStringValue;

  v4 = (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:", a3);
  formattedStringValue = self->_formattedStringValue;
  self->_formattedStringValue = v4;

}

- (NSArray)vertices
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setVertices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSAttributedString)overlayString
{
  return (NSAttributedString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setOverlayString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (CGRect)boundingBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_boundingBox, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBoundingBox:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_boundingBox, &v3, 32, 1, 0);
}

- (float)rotation
{
  return self->_rotation;
}

- (void)setRotation:(float)a3
{
  self->_rotation = a3;
}

- (NSArray)targetVertices
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTargetVertices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSString)capturePath
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setCapturePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSNumber)yearValue
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setYearValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSNumber)monthValue
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMonthValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSNumber)dayValue
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDayValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (UIImage)imageValue
{
  return (UIImage *)objc_getProperty(self, a2, 56, 1);
}

- (void)setImageValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayString, 0);
  objc_storeStrong((id *)&self->_formattedStringValue, 0);
  objc_storeStrong((id *)&self->_capturePath, 0);
  objc_storeStrong((id *)&self->_targetVertices, 0);
  objc_storeStrong((id *)&self->overlayString, 0);
  objc_storeStrong((id *)&self->_imageValue, 0);
  objc_storeStrong((id *)&self->_dayValue, 0);
  objc_storeStrong((id *)&self->_monthValue, 0);
  objc_storeStrong((id *)&self->_yearValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_vertices, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
