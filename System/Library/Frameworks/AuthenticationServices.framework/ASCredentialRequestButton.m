@implementation ASCredentialRequestButton

- (NSString)buttonText
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setButtonText:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (void)addTarget:(id)a3 action:(SEL)a4
{
  id v6;

  v6 = a3;
  -[ASCredentialRequestButton removeTarget:action:forControlEvents:](self, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);
  -[ASCredentialRequestButton addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", v6, a4, 64);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
