@implementation _ICNAAttachmentReportToNote

- (_ICNAAttachmentReportToNote)init
{
  _ICNAAttachmentReportToNote *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *countOfAttachmentByUTI;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_ICNAAttachmentReportToNote;
  v2 = -[_ICNAAttachmentReportToNote init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    countOfAttachmentByUTI = v2->_countOfAttachmentByUTI;
    v2->_countOfAttachmentByUTI = v3;

  }
  return v2;
}

- (void)reportAttachmentTypeUTI:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v4 = a3;
    -[_ICNAAttachmentReportToNote countOfAttachmentByUTI](self, "countOfAttachmentByUTI");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7 + 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICNAAttachmentReportToNote countOfAttachmentByUTI](self, "countOfAttachmentByUTI");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v4);

    -[_ICNAAttachmentReportToNote setCountOfAttachments:](self, "setCountOfAttachments:", -[_ICNAAttachmentReportToNote countOfAttachments](self, "countOfAttachments") + 1);
  }
}

- (void)reportDrawingWithSnapshotData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "countOfInlineDrawingV1FingerStrokes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICNAAttachmentReportToNote setCountOfInlineDrawingV1FingerStrokes:](self, "setCountOfInlineDrawingV1FingerStrokes:", -[_ICNAAttachmentReportToNote countOfInlineDrawingV1FingerStrokes](self, "countOfInlineDrawingV1FingerStrokes")+ objc_msgSend(v5, "integerValue"));

  objc_msgSend(v4, "countOfInlineDrawingV1PencilStrokes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICNAAttachmentReportToNote setCountOfInlineDrawingV1PencilStrokes:](self, "setCountOfInlineDrawingV1PencilStrokes:", -[_ICNAAttachmentReportToNote countOfInlineDrawingV1PencilStrokes](self, "countOfInlineDrawingV1PencilStrokes")+ objc_msgSend(v6, "integerValue"));

  objc_msgSend(v4, "countOfInlineDrawingV2FingerStrokes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICNAAttachmentReportToNote setCountOfInlineDrawingV2FingerStrokes:](self, "setCountOfInlineDrawingV2FingerStrokes:", -[_ICNAAttachmentReportToNote countOfInlineDrawingV2FingerStrokes](self, "countOfInlineDrawingV2FingerStrokes")+ objc_msgSend(v7, "integerValue"));

  objc_msgSend(v4, "countOfInlineDrawingV2PencilStrokes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICNAAttachmentReportToNote setCountOfInlineDrawingV2PencilStrokes:](self, "setCountOfInlineDrawingV2PencilStrokes:", -[_ICNAAttachmentReportToNote countOfInlineDrawingV2PencilStrokes](self, "countOfInlineDrawingV2PencilStrokes")+ objc_msgSend(v8, "integerValue"));

  objc_msgSend(v4, "countOfFullscreenDrawingStrokes");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[_ICNAAttachmentReportToNote setCountOfFullscreenDrawingStrokes:](self, "setCountOfFullscreenDrawingStrokes:", -[_ICNAAttachmentReportToNote countOfFullscreenDrawingStrokes](self, "countOfFullscreenDrawingStrokes")+ objc_msgSend(v9, "integerValue"));
}

- (NSMutableDictionary)countOfAttachmentByUTI
{
  return self->_countOfAttachmentByUTI;
}

- (void)setCountOfAttachmentByUTI:(id)a3
{
  objc_storeStrong((id *)&self->_countOfAttachmentByUTI, a3);
}

- (unint64_t)countOfAttachments
{
  return self->_countOfAttachments;
}

- (void)setCountOfAttachments:(unint64_t)a3
{
  self->_countOfAttachments = a3;
}

- (unint64_t)countOfInlineDrawingV1PencilStrokes
{
  return self->_countOfInlineDrawingV1PencilStrokes;
}

- (void)setCountOfInlineDrawingV1PencilStrokes:(unint64_t)a3
{
  self->_countOfInlineDrawingV1PencilStrokes = a3;
}

- (unint64_t)countOfInlineDrawingV1FingerStrokes
{
  return self->_countOfInlineDrawingV1FingerStrokes;
}

- (void)setCountOfInlineDrawingV1FingerStrokes:(unint64_t)a3
{
  self->_countOfInlineDrawingV1FingerStrokes = a3;
}

- (unint64_t)countOfInlineDrawingV2PencilStrokes
{
  return self->_countOfInlineDrawingV2PencilStrokes;
}

- (void)setCountOfInlineDrawingV2PencilStrokes:(unint64_t)a3
{
  self->_countOfInlineDrawingV2PencilStrokes = a3;
}

- (unint64_t)countOfInlineDrawingV2FingerStrokes
{
  return self->_countOfInlineDrawingV2FingerStrokes;
}

- (void)setCountOfInlineDrawingV2FingerStrokes:(unint64_t)a3
{
  self->_countOfInlineDrawingV2FingerStrokes = a3;
}

- (unint64_t)countOfFullscreenDrawingStrokes
{
  return self->_countOfFullscreenDrawingStrokes;
}

- (void)setCountOfFullscreenDrawingStrokes:(unint64_t)a3
{
  self->_countOfFullscreenDrawingStrokes = a3;
}

- (BOOL)hasDeepLink
{
  return self->_hasDeepLink;
}

- (void)setHasDeepLink:(BOOL)a3
{
  self->_hasDeepLink = a3;
}

- (BOOL)hasSafariHighlight
{
  return self->_hasSafariHighlight;
}

- (void)setHasSafariHighlight:(BOOL)a3
{
  self->_hasSafariHighlight = a3;
}

- (BOOL)hasImages
{
  return self->_hasImages;
}

- (void)setHasImages:(BOOL)a3
{
  self->_hasImages = a3;
}

- (BOOL)hasMathUsage
{
  return self->_hasMathUsage;
}

- (void)setHasMathUsage:(BOOL)a3
{
  self->_hasMathUsage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countOfAttachmentByUTI, 0);
}

@end
