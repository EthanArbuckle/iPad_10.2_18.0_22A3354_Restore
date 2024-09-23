@implementation PKAutoRefineLogEntry

- (id)initWithRefinedStrokes:(void *)a3 originalStrokes:(void *)a4 unchangedStrokes:(void *)a5 debugInfo:
{
  id v10;
  id v11;
  id v12;
  id v13;
  id *v14;
  objc_super v16;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (a1)
  {
    v16.receiver = a1;
    v16.super_class = (Class)PKAutoRefineLogEntry;
    v14 = (id *)objc_msgSendSuper2(&v16, sel_init);
    a1 = v14;
    if (v14)
    {
      objc_storeStrong(v14 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
      objc_storeStrong(a1 + 4, a5);
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_unchangedStrokes, 0);
  objc_storeStrong((id *)&self->_originalStrokes, 0);
  objc_storeStrong((id *)&self->_refinedStrokes, 0);
}

@end
