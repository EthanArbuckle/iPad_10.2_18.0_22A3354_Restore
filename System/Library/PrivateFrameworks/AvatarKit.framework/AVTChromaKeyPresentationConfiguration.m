@implementation AVTChromaKeyPresentationConfiguration

- (AVTChromaKeyPresentationConfiguration)init
{
  AVTChromaKeyPresentationConfiguration *v2;
  void *v3;

  v2 = -[AVTPresentationConfiguration _initWithStyle:](self, "_initWithStyle:", 3);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "greenColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTChromaKeyPresentationConfiguration setKeyColor:](v2, "setKeyColor:", v3);

  }
  return v2;
}

- (UIColor)keyColor
{
  return self->_keyColor;
}

- (void)setKeyColor:(id)a3
{
  UIColor *v5;
  __n128 v6;
  UIColor *v7;

  v5 = (UIColor *)a3;
  if (self->_keyColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_keyColor, a3);
    v6 = AVTGetColorComponentsMetal(self->_keyColor);
    v5 = v7;
    *(__n128 *)self->_shadableKeyColorComponents = v6;
  }

}

- (__n128)shadableKeyColorComponents
{
  return a1[2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyColor, 0);
}

@end
