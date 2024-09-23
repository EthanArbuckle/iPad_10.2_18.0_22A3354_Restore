@implementation HMIVideoAnalyzerBlob

- (HMIVideoAnalyzerBlob)initWithBoundingBox:(CGRect)a3 timeStamp:(id *)a4 blobArea:(float)a5 blobID:(unsigned __int16)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  HMIVideoAnalyzerBlob *result;
  __int128 v14;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)HMIVideoAnalyzerBlob;
  result = -[HMIVideoAnalyzerBlob init](&v15, sel_init);
  if (result)
  {
    result->_boundingBox.origin.x = x;
    result->_boundingBox.origin.y = y;
    result->_boundingBox.size.width = width;
    result->_boundingBox.size.height = height;
    v14 = *(_OWORD *)&a4->var0;
    result->_timeStamp.epoch = a4->var3;
    *(_OWORD *)&result->_timeStamp.value = v14;
    result->_blobArea = a5;
    result->_blobID = a6;
  }
  return result;
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

- (float)blobArea
{
  return self->_blobArea;
}

- (unsigned)blobID
{
  return self->_blobID;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeStamp
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_timeStamp, 24, 1, 0);
  return result;
}

@end
