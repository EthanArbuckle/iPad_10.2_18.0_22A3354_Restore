@implementation AVVCDuckFadeDuration

- (AVVCDuckFadeDuration)initWithFadeIn:(id)a3 fadeOut:(id)a4
{
  id v7;
  id v8;
  AVVCDuckFadeDuration *v9;
  AVVCDuckFadeDuration *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVVCDuckFadeDuration;
  v9 = -[AVVCDuckFadeDuration init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fadeIn, a3);
    objc_storeStrong((id *)&v10->_fadeOut, a4);
  }

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<fadeIn(%@), fadeOut(%@)>"), self->_fadeIn, self->_fadeOut);
}

- (NSNumber)fadeIn
{
  return self->_fadeIn;
}

- (void)setFadeIn:(id)a3
{
  objc_storeStrong((id *)&self->_fadeIn, a3);
}

- (NSNumber)fadeOut
{
  return self->_fadeOut;
}

- (void)setFadeOut:(id)a3
{
  objc_storeStrong((id *)&self->_fadeOut, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fadeOut, 0);
  objc_storeStrong((id *)&self->_fadeIn, 0);
}

@end
