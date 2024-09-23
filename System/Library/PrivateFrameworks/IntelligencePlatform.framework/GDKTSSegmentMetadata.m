@implementation GDKTSSegmentMetadata

- (GDKTSSegmentMetadata)initWithSegmentId:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  GDKTSSegmentMetadata *v7;
  uint64_t v8;
  NSString *segmentId;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GDKTSSegmentMetadata;
  v7 = -[GDKTSSegmentMetadata init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_copy(v4, v5, v6);
    segmentId = v7->_segmentId;
    v7->_segmentId = (NSString *)v8;

  }
  return v7;
}

- (NSString)segmentId
{
  return self->_segmentId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentId, 0);
}

@end
