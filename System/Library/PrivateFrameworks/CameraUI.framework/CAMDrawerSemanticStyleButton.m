@implementation CAMDrawerSemanticStyleButton

- (int64_t)controlType
{
  return 10;
}

- (id)imageNameForCurrentState
{
  return CFSTR("CAMSemanticStyleDrawerButton");
}

- (void)setOn:(BOOL)a3
{
  if (self->_on != a3)
  {
    self->_on = a3;
    -[CAMControlDrawerButton updateImage](self, "updateImage");
  }
}

- (void)setSemanticStyle:(id)a3
{
  -[CAMDrawerSemanticStyleButton setSemanticStyle:animated:](self, "setSemanticStyle:animated:", a3, 0);
}

- (void)setSemanticStyle:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;

  v4 = a4;
  v7 = a3;
  if (!-[CAMSemanticStyle isEqualToSemanticStyle:](self->_semanticStyle, "isEqualToSemanticStyle:"))
  {
    objc_storeStrong((id *)&self->_semanticStyle, a3);
    -[CAMControlDrawerButton updateImageAnimated:](self, "updateImageAnimated:", v4);
  }

}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (BOOL)shouldShowSlashForCurrentState
{
  void *v2;
  char v3;

  -[CAMDrawerSemanticStyleButton semanticStyle](self, "semanticStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCustomizable") ^ 1;

  return v3;
}

- (BOOL)isOn
{
  return self->_on;
}

- (CAMSemanticStyle)semanticStyle
{
  return self->_semanticStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semanticStyle, 0);
}

@end
