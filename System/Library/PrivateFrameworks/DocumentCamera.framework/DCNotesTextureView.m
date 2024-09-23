@implementation DCNotesTextureView

- (void)setImage:(id)a3
{
  UIImage *v4;
  UIImage *image;
  id v6;

  v4 = (UIImage *)a3;
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithPatternImage:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[DCNotesTextureView setBackgroundColor:](self, "setBackgroundColor:", v6);
  image = self->_image;
  self->_image = v4;

}

- (UIImage)image
{
  return self->_image;
}

- (CGSize)phase
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_phase, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPhase:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_phase, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
