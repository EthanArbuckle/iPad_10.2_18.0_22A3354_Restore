@implementation CHSketchRecognizer

- (CHSketchRecognizer)init
{
  CHSketchRecognizer *v2;
  CHRecognizer *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CHRecognizer *recognizer;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CHSketchRecognizer;
  v2 = -[CHSketchRecognizer init](&v10, sel_init);
  if (v2)
  {
    v3 = [CHRecognizer alloc];
    v7 = objc_msgSend_initWithMode_locale_(v3, v4, 3, 0, v5, v6);
    recognizer = v2->_recognizer;
    v2->_recognizer = (CHRecognizer *)v7;

  }
  return v2;
}

- (id)sketchRecognitionResultsForDrawing:(id)a3 options:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;

  v6 = a3;
  v10 = a4;
  if (self)
    objc_msgSend_recognitionResultsForDrawing_options_(self->_recognizer, v7, (uint64_t)v6, (uint64_t)v10, v8, v9);
  else
    objc_msgSend_recognitionResultsForDrawing_options_(0, v7, (uint64_t)v6, (uint64_t)v10, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)sketchRecognitionResultsForDrawing:(id)a3 options:(id)a4 shouldCancel:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  id v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v12 = a5;
  if (self)
    objc_msgSend_recognitionResultsForDrawing_options_shouldCancel_(self->_recognizer, v10, (uint64_t)v8, (uint64_t)v9, (uint64_t)v12, v11);
  else
    objc_msgSend_recognitionResultsForDrawing_options_shouldCancel_(0, v10, (uint64_t)v8, (uint64_t)v9, (uint64_t)v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)maxRecognitionResultCount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (self)
    self = (CHSketchRecognizer *)self->_recognizer;
  return objc_msgSend_maxRecognitionResultCount(self, a2, v2, v3, v4, v5);
}

- (void)setMaxRecognitionResultCount:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (self)
    self = (CHSketchRecognizer *)self->_recognizer;
  objc_msgSend_setMaxRecognitionResultCount_(self, a2, a3, v3, v4, v5);
}

- (CGSize)minimumDrawingSize
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  CGSize result;

  if (self)
    self = (CHSketchRecognizer *)self->_recognizer;
  objc_msgSend_minimumDrawingSize(self, a2, v2, v3, v4, v5);
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)setMinimumDrawingSize:(CGSize)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (self)
    self = (CHSketchRecognizer *)self->_recognizer;
  objc_msgSend_setMinimumDrawingSize_(self, a2, v3, v4, v5, v6, a3.width, a3.height);
}

- (BOOL)enableCachingIfAvailable
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (self)
    self = (CHSketchRecognizer *)self->_recognizer;
  return objc_msgSend_enableCachingIfAvailable(self, a2, v2, v3, v4, v5);
}

- (NSCharacterSet)activeCharacterSet
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (self)
    self = (CHSketchRecognizer *)self->_recognizer;
  objc_msgSend_activeCharacterSet(self, a2, v2, v3, v4, v5);
  return (NSCharacterSet *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setActiveCharacterSet:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CHRecognizer *recognizer;
  char *v9;

  v4 = (const char *)a3;
  if (self)
    recognizer = self->_recognizer;
  else
    recognizer = 0;
  v9 = (char *)v4;
  objc_msgSend_setActiveCharacterSet_(recognizer, v4, (uint64_t)v4, v5, v6, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizer, 0);
}

@end
