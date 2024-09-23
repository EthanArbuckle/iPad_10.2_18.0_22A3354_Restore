@implementation GKChallengePlayerCell

- (void)drawRect:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GKChallengePlayerCell;
  -[GKChallengePlayerCell drawRect:](&v9, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallengePlayerCell seperatorLine](self, "seperatorLine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[GKChallengePlayerCell chevronImageView](self, "chevronImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClipsToBounds:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallengePlayerCell chevronImageView](self, "chevronImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v7);

}

- (UIImageView)chevronImageView
{
  return self->_chevronImageView;
}

- (void)setChevronImageView:(id)a3
{
  objc_storeStrong((id *)&self->_chevronImageView, a3);
}

- (UIView)seperatorLine
{
  return self->_seperatorLine;
}

- (void)setSeperatorLine:(id)a3
{
  objc_storeStrong((id *)&self->_seperatorLine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seperatorLine, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
}

@end
