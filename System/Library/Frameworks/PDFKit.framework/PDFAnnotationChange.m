@implementation PDFAnnotationChange

- (PDFAnnotationChange)initWithAddedAnnotation:(id)a3
{
  id v5;
  PDFAnnotationChange *v6;
  PDFAnnotationChangePrivate *v7;
  PDFAnnotationChangePrivate *v8;
  uint64_t v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDFAnnotationChange;
  v6 = -[PDFAnnotationChange init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(PDFAnnotationChangePrivate);
    v8 = v6->_private;
    v6->_private = v7;

    v9 = sChangeCounter++;
    v6->_private->changeTimestamp = v9;
    v6->_private->changeType = 0;
    objc_storeStrong((id *)&v6->_private->annotation, a3);
  }

  return v6;
}

- (PDFAnnotationChange)initWithChangedAnnotation:(id)a3
{
  id v5;
  PDFAnnotationChange *v6;
  PDFAnnotationChangePrivate *v7;
  PDFAnnotationChangePrivate *v8;
  uint64_t v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDFAnnotationChange;
  v6 = -[PDFAnnotationChange init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(PDFAnnotationChangePrivate);
    v8 = v6->_private;
    v6->_private = v7;

    v9 = sChangeCounter++;
    v6->_private->changeTimestamp = v9;
    v6->_private->changeType = 1;
    objc_storeStrong((id *)&v6->_private->annotation, a3);
  }

  return v6;
}

- (PDFAnnotationChange)initWithRemovedAnnotation:(id)a3
{
  id v5;
  PDFAnnotationChange *v6;
  PDFAnnotationChangePrivate *v7;
  PDFAnnotationChangePrivate *v8;
  uint64_t v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDFAnnotationChange;
  v6 = -[PDFAnnotationChange init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(PDFAnnotationChangePrivate);
    v8 = v6->_private;
    v6->_private = v7;

    v9 = sChangeCounter++;
    v6->_private->changeTimestamp = v9;
    v6->_private->changeType = 2;
    objc_storeStrong((id *)&v6->_private->annotation, a3);
  }

  return v6;
}

- (PDFAnnotationChange)initWithReorderedAnnotation:(id)a3
{
  id v5;
  PDFAnnotationChange *v6;
  PDFAnnotationChangePrivate *v7;
  PDFAnnotationChangePrivate *v8;
  uint64_t v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDFAnnotationChange;
  v6 = -[PDFAnnotationChange init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(PDFAnnotationChangePrivate);
    v8 = v6->_private;
    v6->_private = v7;

    v9 = sChangeCounter++;
    v6->_private->changeTimestamp = v9;
    v6->_private->changeType = 3;
    objc_storeStrong((id *)&v6->_private->annotation, a3);
  }

  return v6;
}

- (PDFAnnotationChange)initWithReorderedAndChangedAnnotation:(id)a3
{
  id v5;
  PDFAnnotationChange *v6;
  PDFAnnotationChangePrivate *v7;
  PDFAnnotationChangePrivate *v8;
  uint64_t v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDFAnnotationChange;
  v6 = -[PDFAnnotationChange init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(PDFAnnotationChangePrivate);
    v8 = v6->_private;
    v6->_private = v7;

    v9 = sChangeCounter++;
    v6->_private->changeTimestamp = v9;
    v6->_private->changeType = 4;
    objc_storeStrong((id *)&v6->_private->annotation, a3);
  }

  return v6;
}

- (int)changeType
{
  return self->_private->changeType;
}

- (PDFAnnotation)annotation
{
  return self->_private->annotation;
}

- (unint64_t)changeTimestamp
{
  return self->_private->changeTimestamp;
}

- (id)description
{
  uint64_t changeType;
  __CFString *v4;
  void *v5;
  unint64_t changeTimestamp;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;

  changeType = self->_private->changeType;
  if (changeType > 4)
    v4 = 0;
  else
    v4 = off_24C25D130[changeType];
  v5 = (void *)MEMORY[0x24BDD17C8];
  changeTimestamp = self->_private->changeTimestamp;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation type](self->_private->annotation, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("PDFAnnotationChange - Type: %@  Timestamp: %llu  Annotation: %@/%@ (%p) "), v4, changeTimestamp, v8, v9, self->_private->annotation);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
