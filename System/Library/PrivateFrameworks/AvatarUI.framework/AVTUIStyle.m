@implementation AVTUIStyle

+ (id)lightStyle
{
  AVTUIStyle *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(AVTUIStyle);
  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTUIStyle setTextColor:](v2, "setTextColor:", v3);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTUIStyle setBackgroundColor:](v2, "setBackgroundColor:", v4);

  return v2;
}

+ (id)darkStyle
{
  AVTUIStyle *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(AVTUIStyle);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTUIStyle setBackgroundColor:](v2, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTUIStyle setTextColor:](v2, "setTextColor:", v4);

  return v2;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
