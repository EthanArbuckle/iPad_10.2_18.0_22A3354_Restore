@implementation _JavascriptOperation

- (_JavascriptOperation)initWithJavascript:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  _JavascriptOperation *v9;
  _JavascriptOperation *v10;
  void *v11;
  id completion;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_JavascriptOperation;
  v9 = -[_JavascriptOperation init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_javascript, a3);
    v11 = _Block_copy(v8);
    completion = v10->_completion;
    v10->_completion = v11;

  }
  return v10;
}

- (void)submitJavascript:(id)a3 finishBlock:(id)a4
{
  id v6;
  NSString *javascript;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  javascript = self->_javascript;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53___JavascriptOperation_submitJavascript_finishBlock___block_invoke;
  v9[3] = &unk_1E9C45FF8;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(a3, "evaluateJavaScript:completionHandler:", javascript, v9);

}

- (NSString)javascript
{
  return self->_javascript;
}

- (void)setJavascript:(id)a3
{
  objc_storeStrong((id *)&self->_javascript, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_javascript, 0);
}

@end
