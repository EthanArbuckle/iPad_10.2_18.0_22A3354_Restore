@implementation ASCompetitionMessageBubbleView

- (ASCompetitionMessageBubbleView)initWithFrame:(CGRect)a3
{
  ASCompetitionMessageBubbleView *v3;
  void *v4;
  uint64_t v5;
  UIImageView *backgroundView;
  void *v7;
  void *v8;
  uint64_t v9;
  UIImageView *messageBubbleView;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ASCompetitionMessageBubbleView;
  v3 = -[ASCompetitionMessageBubbleView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    MessageBubbleBackgroundPlatter();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v4);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (UIImageView *)v5;

    -[ASCompetitionMessageBubbleView addSubview:](v3, "addSubview:", v3->_backgroundView);
    objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("message.fill"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithRenderingMode:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v8);
    messageBubbleView = v3->_messageBubbleView;
    v3->_messageBubbleView = (UIImageView *)v9;

    objc_msgSend(MEMORY[0x24BEBD4B8], "as_lightCompetitionGold");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v3->_messageBubbleView, "setTintColor:", v11);

    -[ASCompetitionMessageBubbleView addSubview:](v3, "addSubview:", v3->_messageBubbleView);
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 30.0;
  result.height = v3;
  return result;
}

- (void)layoutSubviews
{
  double MidX;
  objc_super v4;
  CGRect v5;
  CGRect v6;

  v4.receiver = self;
  v4.super_class = (Class)ASCompetitionMessageBubbleView;
  -[ASCompetitionMessageBubbleView layoutSubviews](&v4, sel_layoutSubviews);
  -[UIImageView setFrame:](self->_backgroundView, "setFrame:", 0.0, 0.0, 30.0, 30.0);
  -[UIImageView setFrame:](self->_messageBubbleView, "setFrame:", 0.0, 0.0, 23.0, 18.5);
  -[UIImageView frame](self->_backgroundView, "frame");
  MidX = CGRectGetMidX(v5);
  -[UIImageView frame](self->_backgroundView, "frame");
  -[UIImageView setCenter:](self->_messageBubbleView, "setCenter:", MidX, CGRectGetMidY(v6) + 1.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageBubbleView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
