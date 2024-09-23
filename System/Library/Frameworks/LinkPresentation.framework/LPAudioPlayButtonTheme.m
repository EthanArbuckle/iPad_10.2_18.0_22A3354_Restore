@implementation LPAudioPlayButtonTheme

- (LPAudioPlayButtonTheme)initWithKeyColor:(id)a3 secondaryColor:(id)a4 outerBorderColor:(id)a5 useInvertedInactiveState:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  LPAudioPlayButtonTheme *v14;
  LPAudioPlayButtonTheme *v15;
  LPAudioPlayButtonTheme *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)LPAudioPlayButtonTheme;
  v14 = -[LPAudioPlayButtonTheme init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_keyColor, a3);
    objc_storeStrong((id *)&v15->_secondaryColor, a4);
    objc_storeStrong((id *)&v15->_outerBorderColor, a5);
    v15->_useInvertedInactiveState = a6;
    v16 = v15;
  }

  return v15;
}

- (UIColor)keyColor
{
  return self->_keyColor;
}

- (UIColor)secondaryColor
{
  return self->_secondaryColor;
}

- (UIColor)outerBorderColor
{
  return self->_outerBorderColor;
}

- (BOOL)useInvertedInactiveState
{
  return self->_useInvertedInactiveState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerBorderColor, 0);
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_keyColor, 0);
}

@end
