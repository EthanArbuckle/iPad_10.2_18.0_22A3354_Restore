@implementation PKTextInputLanguageSelectionToken

+ (id)tokenWithStore:(id)a3
{
  id v4;
  id *v5;

  v4 = a3;
  v5 = (id *)objc_alloc_init((Class)a1);
  objc_storeWeak(v5 + 1, v4);

  return v5;
}

- (void)invalidate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  objc_msgSend(WeakRetained, "removeObserver:", self);

}

- (void)dealloc
{
  objc_super v3;

  -[PKTextInputLanguageSelectionToken invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKTextInputLanguageSelectionToken;
  -[PKTextInputLanguageSelectionToken dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_store);
}

@end
