@implementation MCNearbyPeerTableViewHeader

- (MCNearbyPeerTableViewHeader)initWithTitle:(id)a3
{
  MCNearbyPeerTableViewHeader *v4;
  UILabel *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCNearbyPeerTableViewHeader;
  v4 = -[MCNearbyPeerTableViewHeader initWithFrame:](&v7, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  if (v4)
  {
    -[MCNearbyPeerTableViewHeader setBackgroundColor:](v4, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
    -[MCNearbyPeerTableViewHeader setAutoresizingMask:](v4, "setAutoresizingMask:", 2);
    v5 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    v4->_text = v5;
    -[UILabel setFont:](v5, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 14.0));
    v4->_spinner = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 2);
    -[UILabel setTextColor:](v4->_text, "setTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.3, 1.0));
    -[UIActivityIndicatorView setHidesWhenStopped:](v4->_spinner, "setHidesWhenStopped:", 1);
    -[UILabel setBackgroundColor:](v4->_text, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
    -[UILabel setText:](v4->_text, "setText:", objc_msgSend(a3, "uppercaseString"));
    -[MCNearbyPeerTableViewHeader addSubview:](v4, "addSubview:", v4->_text);
    -[MCNearbyPeerTableViewHeader addSubview:](v4, "addSubview:", v4->_spinner);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MCNearbyPeerTableViewHeader;
  -[MCNearbyPeerTableViewHeader dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MCNearbyPeerTableViewHeader;
  -[MCNearbyPeerTableViewHeader layoutSubviews](&v9, sel_layoutSubviews);
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  v4 = v3;
  v6 = v5;
  -[UILabel sizeToFit](self->_text, "sizeToFit");
  -[UILabel frame](self->_text, "frame");
  v8 = v7 + 15.0 + 10.0;
  -[UILabel setFrame:](self->_text, "setFrame:", 15.0, 16.5);
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", v8, 14.5, v4, v6);
  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
}

@end
