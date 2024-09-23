@implementation DDRange

- (DDRange)initWithDOMRange:(id)a3
{
  id v4;
  DDRange *v5;
  uint64_t v6;
  DOMNode *node;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DDRange;
  v5 = -[DDRange init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "startContainer");
    v6 = objc_claimAutoreleasedReturnValue();
    node = v5->_node;
    v5->_node = (DOMNode *)v6;

    v5->_startOffset = (int)objc_msgSend(v4, "startOffset");
    v5->_endOffset = (int)objc_msgSend(v4, "endOffset");
  }

  return v5;
}

+ (id)rangeWithDOMRange:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDOMRange:", v4);

  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)DDRange;
  -[DDRange dealloc](&v2, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<DDRange: %@ [%ld - %ld]>"), self->_node, self->_startOffset, self->_endOffset);
}

- (DOMNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
  objc_storeStrong((id *)&self->_node, a3);
}

- (int64_t)startOffset
{
  return self->_startOffset;
}

- (void)setStartOffset:(int64_t)a3
{
  self->_startOffset = a3;
}

- (int64_t)endOffset
{
  return self->_endOffset;
}

- (void)setEndOffset:(int64_t)a3
{
  self->_endOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_node, 0);
}

@end
