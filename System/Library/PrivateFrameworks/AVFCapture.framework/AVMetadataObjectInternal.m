@implementation AVMetadataObjectInternal

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void)setTime:(id *)a3
{
  objc_copyStruct(&self->_time, a3, 24, 1, 0);
}

- (void)setOriginalMetadataObject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void)setInput:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void)setDuration:(id *)a3
{
  objc_copyStruct(&self->_duration, a3, 24, 1, 0);
}

- (void)setDetectionSource:(int64_t)a3
{
  self->_detectionSource = a3;
}

- (void)setBounds:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_bounds, &v3, 32, 1, 0);
}

- (AVMetadataObjectInternal)init
{
  AVMetadataObjectInternal *result;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  CGSize v6;
  int64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVMetadataObjectInternal;
  result = -[AVMetadataObjectInternal init](&v8, sel_init);
  if (result)
  {
    v3 = MEMORY[0x1E0CA2E18];
    v4 = *MEMORY[0x1E0CA2E18];
    *(_OWORD *)&result->_time.value = *MEMORY[0x1E0CA2E18];
    v5 = MEMORY[0x1E0C9D648];
    *(_OWORD *)&result->_duration.value = v4;
    v6 = *(CGSize *)(v5 + 16);
    result->_bounds.origin = *(CGPoint *)v5;
    v7 = *(_QWORD *)(v3 + 16);
    result->_time.epoch = v7;
    result->_duration.epoch = v7;
    result->_bounds.size = v6;
    result->_syntheticFocusMode = 0;
    result->_detectionSource = 0;
    result->_groupID = -1;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetadataObjectInternal;
  -[AVMetadataObjectInternal dealloc](&v3, sel_dealloc);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_time, 24, 1, 0);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_duration, 24, 1, 0);
  return result;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_bounds, 32, 1, 0);
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

- (AVCaptureInput)input
{
  return (AVCaptureInput *)objc_getProperty(self, a2, 96, 1);
}

- (AVMetadataObject)originalMetadataObject
{
  return (AVMetadataObject *)objc_getProperty(self, a2, 104, 1);
}

- (int64_t)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(int64_t)a3
{
  self->_groupID = a3;
}

- (unint64_t)syntheticFocusMode
{
  return self->_syntheticFocusMode;
}

- (void)setSyntheticFocusMode:(unint64_t)a3
{
  self->_syntheticFocusMode = a3;
}

- (int64_t)detectionSource
{
  return self->_detectionSource;
}

@end
