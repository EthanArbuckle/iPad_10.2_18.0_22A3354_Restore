@implementation ICTextSearchingFindSession

- (ICTextSearchingFindSession)initWithTextView:(id)a3
{
  id v4;
  ICTextSearchingFindSession *v5;
  ICTextSearchingFindSession *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICTextSearchingFindSession;
  v5 = -[UITextSearchingFindSession initWithSearchableObject:](&v8, sel_initWithSearchableObject_, v4);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_textView, v4);

  return v6;
}

- (id)divergentResponder
{
  void *v2;
  void *v3;

  -[ICTextSearchingFindSession textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ICTextView)textView
{
  return (ICTextView *)objc_loadWeakRetained((id *)&self->_textView);
}

- (void)setTextView:(id)a3
{
  objc_storeWeak((id *)&self->_textView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textView);
}

@end
