@implementation _NUFaceDetectionResult

- (NSArray)faces
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFaces:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)imageSize
{
  int64_t v2;
  int64_t v3;
  _QWORD v4[2];
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  objc_copyStruct(v4, &self->_imageSize, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setImageSize:(id)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3;

  v3 = a3;
  objc_copyStruct(&self->_imageSize, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faces, 0);
}

@end
