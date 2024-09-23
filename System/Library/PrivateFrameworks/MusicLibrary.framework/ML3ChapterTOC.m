@implementation ML3ChapterTOC

- (ML3ChapterTOC)initWithChapterDataRef:(ChapterData *)a3 track:(id)a4
{
  id v7;
  void *v8;
  ML3ChapterTOC *v9;
  objc_super v11;

  v7 = a4;
  objc_msgSend(v7, "valueForProperty:", CFSTR("item_extra.total_time_ms"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)ML3ChapterTOC;
  v9 = -[MLITChapterTOC initWithChapterDataRef:totalTimeInMS:](&v11, sel_initWithChapterDataRef_totalTimeInMS_, a3, objc_msgSend(v8, "unsignedIntValue"));

  if (v9)
    objc_storeStrong((id *)&v9->_track, a4);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_track, 0);
}

@end
