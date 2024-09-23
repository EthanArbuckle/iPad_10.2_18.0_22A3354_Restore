@implementation ASCredentialRequestBasicPaneViewController

- (ASCredentialRequestBasicPaneViewController)initWithTitle:(id)a3 titleStyle:(int64_t)a4 subtitle:(id)a5 subtitleStyle:(int64_t)a6 icon:(id)a7 iconStyle:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  ASCredentialRequestBasicPaneViewController *v17;
  uint64_t v18;
  NSString *title;
  uint64_t v20;
  NSString *subtitle;
  ASCredentialRequestBasicPaneViewController *v22;
  objc_super v24;

  v14 = a3;
  v15 = a5;
  v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)ASCredentialRequestBasicPaneViewController;
  v17 = -[ASCredentialRequestPaneViewController initRequiringTableView:](&v24, sel_initRequiringTableView_, 0);
  if (v17)
  {
    v18 = objc_msgSend(v14, "copy");
    title = v17->_title;
    v17->_title = (NSString *)v18;

    v17->_titleStyle = a4;
    v20 = objc_msgSend(v15, "copy");
    subtitle = v17->_subtitle;
    v17->_subtitle = (NSString *)v20;

    v17->_subtitleStyle = a6;
    objc_storeStrong((id *)&v17->_icon, a7);
    v17->_iconStyle = a8;
    v22 = v17;
  }

  return v17;
}

- (ASCredentialRequestBasicPaneViewController)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5
{
  return -[ASCredentialRequestBasicPaneViewController initWithTitle:titleStyle:subtitle:subtitleStyle:icon:iconStyle:](self, "initWithTitle:titleStyle:subtitle:subtitleStyle:icon:iconStyle:", a3, 0, a4, 1, a5, 0);
}

- (void)viewDidLoad
{
  ASCredentialRequestInfoLabelSubPane *v3;
  ASCredentialRequestInfoLabelSubPane *subtitleSubPane;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASCredentialRequestBasicPaneViewController;
  -[ASCredentialRequestPaneViewController viewDidLoad](&v6, sel_viewDidLoad);
  if (self->_subtitle)
  {
    v3 = -[ASCredentialRequestInfoLabelSubPane initWithString:labelStyle:]([ASCredentialRequestInfoLabelSubPane alloc], "initWithString:labelStyle:", self->_subtitle, self->_subtitleStyle);
    subtitleSubPane = self->_subtitleSubPane;
    self->_subtitleSubPane = v3;

  }
  -[ASCredentialRequestPaneViewController headerPaneContext](self, "headerPaneContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addIcon:iconStyle:title:titleStyle:subtitlePane:subtitleStyle:subtitleBottomSpacing:", self->_icon, self->_iconStyle, self->_title, self->_titleStyle, self->_subtitleSubPane, self->_subtitleStyle, 0);

  -[ASCredentialRequestPaneViewController sizeToFitPaneContent](self, "sizeToFitPaneContent");
}

- (void)updateSubtitle:(id)a3
{
  -[ASCredentialRequestInfoLabelSubPane setText:](self->_subtitleSubPane, "setText:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleSubPane, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
