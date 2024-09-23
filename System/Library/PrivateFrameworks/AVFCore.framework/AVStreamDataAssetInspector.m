@implementation AVStreamDataAssetInspector

- (AVStreamDataAssetInspector)initWithTrackIDs:(id)a3
{
  AVStreamDataAssetInspector *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVStreamDataAssetInspector;
  v4 = -[AVStreamDataAssetInspector init](&v6, sel_init);
  if (v4)
    v4->_trackIDs = (NSArray *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVStreamDataAssetInspector;
  -[AVStreamDataAssetInspector dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  return 1;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E10];
  return self;
}

- (BOOL)providesPreciseDurationAndTiming
{
  return 0;
}

- (int64_t)trackCount
{
  return -[NSArray count](self->_trackIDs, "count");
}

- (id)trackIDs
{
  return self->_trackIDs;
}

@end
