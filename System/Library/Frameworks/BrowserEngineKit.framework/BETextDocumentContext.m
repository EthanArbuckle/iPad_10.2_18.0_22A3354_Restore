@implementation BETextDocumentContext

- (BETextDocumentContext)initWithSelectedText:(id)a3 contextBefore:(id)a4 contextAfter:(id)a5 markedText:(id)a6 selectedRangeInMarkedText:(_NSRange)a7
{
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  id v15;
  id v16;
  BETextDocumentContext *v17;
  objc_class *v18;
  id v19;
  id v20;
  id v21;
  NSUInteger v22;
  id v23;
  id v24;
  NSUInteger v25;
  UIWKDocumentContext *backingContext;
  NSUInteger v28;
  id v29;
  objc_super v30;

  length = a7.length;
  location = a7.location;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v30.receiver = self;
  v30.super_class = (Class)BETextDocumentContext;
  v17 = -[BETextDocumentContext init](&v30, sel_init);
  if (v17)
  {
    v18 = (objc_class *)MEMORY[0x24BEBDB40];
    v19 = v13;
    v20 = v14;
    v28 = length;
    v29 = v13;
    v21 = v15;
    v22 = location;
    v23 = v16;
    v24 = objc_alloc_init(v18);
    objc_msgSend(v24, "setSelectedText:", v19);

    objc_msgSend(v24, "setContextBefore:", v20);
    objc_msgSend(v24, "setContextAfter:", v21);

    objc_msgSend(v24, "setMarkedText:", v23);
    v25 = v22;
    v13 = v29;
    objc_msgSend(v24, "setSelectedRangeInMarkedText:", v25, v28);
    backingContext = v17->_backingContext;
    v17->_backingContext = (UIWKDocumentContext *)v24;

  }
  return v17;
}

- (BETextDocumentContext)initWithAttributedSelectedText:(id)a3 contextBefore:(id)a4 contextAfter:(id)a5 markedText:(id)a6 selectedRangeInMarkedText:(_NSRange)a7
{
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  id v15;
  id v16;
  BETextDocumentContext *v17;
  objc_class *v18;
  id v19;
  id v20;
  id v21;
  NSUInteger v22;
  id v23;
  id v24;
  NSUInteger v25;
  UIWKDocumentContext *backingContext;
  NSUInteger v28;
  id v29;
  objc_super v30;

  length = a7.length;
  location = a7.location;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v30.receiver = self;
  v30.super_class = (Class)BETextDocumentContext;
  v17 = -[BETextDocumentContext init](&v30, sel_init);
  if (v17)
  {
    v18 = (objc_class *)MEMORY[0x24BEBDB40];
    v19 = v13;
    v20 = v14;
    v28 = length;
    v29 = v13;
    v21 = v15;
    v22 = location;
    v23 = v16;
    v24 = objc_alloc_init(v18);
    objc_msgSend(v24, "setSelectedText:", v19);

    objc_msgSend(v24, "setContextBefore:", v20);
    objc_msgSend(v24, "setContextAfter:", v21);

    objc_msgSend(v24, "setMarkedText:", v23);
    v25 = v22;
    v13 = v29;
    objc_msgSend(v24, "setSelectedRangeInMarkedText:", v25, v28);
    backingContext = v17->_backingContext;
    v17->_backingContext = (UIWKDocumentContext *)v24;

  }
  return v17;
}

- (id)_uikitDocumentContext
{
  return self->_backingContext;
}

- (void)addTextRect:(CGRect)a3 forCharacterRange:(_NSRange)a4
{
  -[UIWKDocumentContext addTextRect:forCharacterRange:](self->_backingContext, "addTextRect:forCharacterRange:", a4.location, a4.length, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setAutocorrectedRanges:(id)a3
{
  -[UIWKDocumentContext setAutocorrectedRanges:](self->_backingContext, "setAutocorrectedRanges:", a3);
}

- (void)setAnnotatedText:(id)a3
{
  -[UIWKDocumentContext setAnnotatedText:](self->_backingContext, "setAnnotatedText:", a3);
}

- (NSArray)autocorrectedRanges
{
  return (NSArray *)-[UIWKDocumentContext autocorrectedRanges](self->_backingContext, "autocorrectedRanges");
}

- (id)annotatedText
{
  return (id)-[UIWKDocumentContext annotatedText](self->_backingContext, "annotatedText");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingContext, 0);
}

@end
