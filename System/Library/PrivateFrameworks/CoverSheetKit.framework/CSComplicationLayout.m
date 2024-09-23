@implementation CSComplicationLayout

- (id)_initWithFramesByElement:(id)a3 draggedItemInsertionIndex:(int64_t)a4
{
  id v7;
  CSComplicationLayout *v8;
  CSComplicationLayout *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSComplicationLayout;
  v8 = -[CSComplicationLayout init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_framesByElement, a3);
    v9->_draggedItemInsertionIndex = a4;
  }

  return v9;
}

- (NSDictionary)framesByElement
{
  return self->_framesByElement;
}

- (int64_t)draggedItemInsertionIndex
{
  return self->_draggedItemInsertionIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_framesByElement, 0);
}

@end
