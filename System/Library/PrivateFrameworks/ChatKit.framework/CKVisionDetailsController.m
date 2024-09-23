@implementation CKVisionDetailsController

- (CKVisionDetailsController)initWithConversation:(id)a3 context:(int64_t)a4
{
  CKVisionDetailsController *v5;
  CKVisionDetailsController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKVisionDetailsController;
  v5 = -[CKDetailsController initWithConversation:](&v8, sel_initWithConversation_, a3);
  v6 = v5;
  if (v5)
    -[CKVisionDetailsController setContext:](v5, "setContext:", a4);
  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKVisionDetailsController;
  v6 = -[CKDetailsController tableView:numberOfRowsInSection:](&v8, sel_tableView_numberOfRowsInSection_, a3);
  if ((unint64_t)(a4 - 9) <= 2 && -[CKVisionDetailsController context](self, "context") == 1)
    return 0;
  return (int64_t)v6;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  double v7;
  double v8;
  objc_super v10;

  v6 = a3;
  if (-[CKVisionDetailsController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v6, a4))
  {
    v10.receiver = self;
    v10.super_class = (Class)CKVisionDetailsController;
    -[CKDetailsController tableView:heightForFooterInSection:](&v10, sel_tableView_heightForFooterInSection_, v6, a4);
    v8 = v7;
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (id)reuseIdentifierForCellInSection:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKVisionDetailsController;
  -[CKDetailsController reuseIdentifierForCellInSection:](&v4, sel_reuseIdentifierForCellInSection_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldShowKTSection
{
  objc_super v4;

  if (-[CKVisionDetailsController context](self, "context"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)CKVisionDetailsController;
  return -[CKDetailsController shouldShowKTSection](&v4, sel_shouldShowKTSection);
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

@end
