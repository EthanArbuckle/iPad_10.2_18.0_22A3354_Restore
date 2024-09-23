@implementation FIUIDiscreteSizingLabel

- (void)setText:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FIUIDiscreteSizingLabel;
  -[FIUIDiscreteSizingLabel setText:](&v5, sel_setText_, a3);
  -[FIUIDiscreteSizingLabel delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "discreteSizingLabelDidChangeText:", self);

}

- (FIUIDiscreteSizingLabelDelegate)delegate
{
  return (FIUIDiscreteSizingLabelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
