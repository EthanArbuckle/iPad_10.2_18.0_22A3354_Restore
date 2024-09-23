@implementation CACentralTableViewCell

- (CACentralTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CACentralTableViewCell *v4;
  uint64_t v5;
  UIActivityIndicatorView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CACentralTableViewCell;
  v4 = -[CACentralTableViewCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v4->_deviceNameLabel = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    -[UILabel setFont:](v4->_deviceNameLabel, "setFont:", objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_deviceNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend((id)-[CACentralTableViewCell contentView](v4, "contentView"), "addSubview:", v4->_deviceNameLabel);
    v4->_connectionStatusLabel = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    -[UILabel setFont:](v4->_connectionStatusLabel, "setFont:", objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_connectionStatusLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setEnabled:](v4->_connectionStatusLabel, "setEnabled:", 0);
    -[UILabel setText:](v4->_connectionStatusLabel, "setText:", priv_getBTLELocalizedString((uint64_t)CFSTR("Not Connected"), (uint64_t)CFSTR("Not Connected")));
    objc_msgSend((id)-[CACentralTableViewCell contentView](v4, "contentView"), "addSubview:", v4->_connectionStatusLabel);
    v4->_inputLabel = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    v5 = *MEMORY[0x24BEBE1E0];
    -[UILabel setFont:](v4->_inputLabel, "setFont:", objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1E0]));
    -[UILabel setEnabled:](v4->_inputLabel, "setEnabled:", 0);
    -[UILabel setText:](v4->_inputLabel, "setText:", priv_getBTLELocalizedString((uint64_t)CFSTR("Input"), (uint64_t)CFSTR("Input")));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_inputLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend((id)-[CACentralTableViewCell contentView](v4, "contentView"), "addSubview:", v4->_inputLabel);
    v4->_slashLabel = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    -[UILabel setFont:](v4->_slashLabel, "setFont:", objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v5));
    -[UILabel setEnabled:](v4->_slashLabel, "setEnabled:", 0);
    -[UILabel setText:](v4->_slashLabel, "setText:", priv_getBTLELocalizedString((uint64_t)CFSTR("/"), (uint64_t)CFSTR("/")));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_slashLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend((id)-[CACentralTableViewCell contentView](v4, "contentView"), "addSubview:", v4->_slashLabel);
    v4->_outputLabel = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    -[UILabel setFont:](v4->_outputLabel, "setFont:", objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v5));
    -[UILabel setEnabled:](v4->_outputLabel, "setEnabled:", 0);
    -[UILabel setText:](v4->_outputLabel, "setText:", priv_getBTLELocalizedString((uint64_t)CFSTR("Output"), (uint64_t)CFSTR("Output")));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_outputLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend((id)-[CACentralTableViewCell contentView](v4, "contentView"), "addSubview:", v4->_outputLabel);
    v6 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 2);
    v4->_activityIndicator = v6;
    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIActivityIndicatorView setHidden:](v4->_activityIndicator, "setHidden:", 1);
    objc_msgSend((id)-[CACentralTableViewCell contentView](v4, "contentView"), "addSubview:", v4->_activityIndicator);
    -[CACentralTableViewCell createInitialConstraints](v4, "createInitialConstraints");
  }
  return v4;
}

- (void)createInitialConstraints
{
  NSDictionary *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = _NSDictionaryOfVariableBindings(CFSTR("_deviceNameLabel, _connectionStatusLabel, _inputLabel, _slashLabel, _outputLabel, _activityIndicator"), self->_deviceNameLabel, self->_connectionStatusLabel, self->_inputLabel, self->_slashLabel, self->_outputLabel, self->_activityIndicator, 0);
  -[CACentralTableViewCell setLabelConstraints:](self, "setLabelConstraints:", (id)objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-20-[_deviceNameLabel]-[_connectionStatusLabel]-|"), 2048, 0, v3));
  objc_msgSend((id)-[CACentralTableViewCell contentView](self, "contentView"), "addConstraints:", -[CACentralTableViewCell labelConstraints](self, "labelConstraints"));
  -[CACentralTableViewCell setActivityHConstraints:](self, "setActivityHConstraints:", objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[_activityIndicator]-|"), 0, 0, v3));
  -[CACentralTableViewCell setActivityVConstraints:](self, "setActivityVConstraints:", objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-8-[_activityIndicator]"), 0, 0, v3));
  v4 = (void *)-[CACentralTableViewCell contentView](self, "contentView");
  objc_msgSend(v4, "addConstraints:", objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-5-[_deviceNameLabel]-2-[_inputLabel]-5-|"), 0, 0, v3));
  v5 = (void *)-[CACentralTableViewCell contentView](self, "contentView");
  objc_msgSend(v5, "addConstraints:", objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-20-[_inputLabel]-2-[_slashLabel]-2-[_outputLabel]"), 2048, 0, v3));
  LODWORD(v6) = 1144766464;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_connectionStatusLabel, "setContentCompressionResistancePriority:forAxis:", 0, v6);
  LODWORD(v7) = 1132134400;
  -[UILabel setContentHuggingPriority:forAxis:](self->_connectionStatusLabel, "setContentHuggingPriority:forAxis:", 0, v7);
  LODWORD(v8) = 1144750080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_deviceNameLabel, "setContentCompressionResistancePriority:forAxis:", 0, v8);
  LODWORD(v9) = 1132068864;
  -[UILabel setContentHuggingPriority:forAxis:](self->_deviceNameLabel, "setContentHuggingPriority:forAxis:", 0, v9);
}

- (void)updateConstraints
{
  NSDictionary *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CACentralTableViewCell;
  -[CACentralTableViewCell updateConstraints](&v4, sel_updateConstraints);
  objc_msgSend((id)-[CACentralTableViewCell contentView](self, "contentView"), "removeConstraints:", -[CACentralTableViewCell labelConstraints](self, "labelConstraints"));
  v3 = _NSDictionaryOfVariableBindings(CFSTR("_deviceNameLabel, _connectionStatusLabel, _activityIndicator"), self->_deviceNameLabel, self->_connectionStatusLabel, self->_activityIndicator, 0);
  if (-[UIActivityIndicatorView isHidden](self->_activityIndicator, "isHidden"))
  {
    objc_msgSend((id)-[CACentralTableViewCell contentView](self, "contentView"), "removeConstraints:", -[CACentralTableViewCell activityHConstraints](self, "activityHConstraints"));
    objc_msgSend((id)-[CACentralTableViewCell contentView](self, "contentView"), "removeConstraints:", -[CACentralTableViewCell activityVConstraints](self, "activityVConstraints"));
    -[CACentralTableViewCell setLabelConstraints:](self, "setLabelConstraints:", objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-20-[_deviceNameLabel]-[_connectionStatusLabel]-|"), 2048, 0, v3));
  }
  else
  {
    -[CACentralTableViewCell setLabelConstraints:](self, "setLabelConstraints:", objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-20-[_deviceNameLabel]-[_connectionStatusLabel]-[_activityIndicator]-|"), 2048, 0, v3));
    -[CACentralTableViewCell setActivityHConstraints:](self, "setActivityHConstraints:", objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[_activityIndicator]-|"), 0, 0, v3));
    objc_msgSend((id)-[CACentralTableViewCell contentView](self, "contentView"), "addConstraints:", -[CACentralTableViewCell activityHConstraints](self, "activityHConstraints"));
    objc_msgSend((id)-[CACentralTableViewCell contentView](self, "contentView"), "addConstraints:", -[CACentralTableViewCell activityVConstraints](self, "activityVConstraints"));
  }
  objc_msgSend((id)-[CACentralTableViewCell contentView](self, "contentView"), "addConstraints:", -[CACentralTableViewCell labelConstraints](self, "labelConstraints"));
}

- (void)startIndicator
{
  if (!-[UIActivityIndicatorView isAnimating](self->_activityIndicator, "isAnimating"))
  {
    -[UIActivityIndicatorView setHidden:](self->_activityIndicator, "setHidden:", 0);
    -[CACentralTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
  }
}

- (void)stopIndicator
{
  if (-[UIActivityIndicatorView isAnimating](self->_activityIndicator, "isAnimating"))
  {
    -[UIActivityIndicatorView setHidden:](self->_activityIndicator, "setHidden:", 1);
    -[CACentralTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[UIActivityIndicatorView stopAnimating](self->_activityIndicator, "stopAnimating");
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CACentralTableViewCell;
  -[CACentralTableViewCell dealloc](&v3, sel_dealloc);
}

- (UILabel)deviceNameLabel
{
  return self->_deviceNameLabel;
}

- (void)setDeviceNameLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1024);
}

- (UILabel)connectionStatusLabel
{
  return self->_connectionStatusLabel;
}

- (void)setConnectionStatusLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1032);
}

- (UILabel)inputLabel
{
  return self->_inputLabel;
}

- (void)setInputLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1040);
}

- (UILabel)slashLabel
{
  return self->_slashLabel;
}

- (void)setSlashLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1048);
}

- (UILabel)outputLabel
{
  return self->_outputLabel;
}

- (void)setOutputLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1056);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1064);
}

- (NSArray)labelConstraints
{
  return self->_labelConstraints;
}

- (void)setLabelConstraints:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1072);
}

- (NSArray)activityHConstraints
{
  return self->_activityHConstraints;
}

- (void)setActivityHConstraints:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1080);
}

- (NSArray)activityVConstraints
{
  return self->_activityVConstraints;
}

- (void)setActivityVConstraints:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1088);
}

@end
