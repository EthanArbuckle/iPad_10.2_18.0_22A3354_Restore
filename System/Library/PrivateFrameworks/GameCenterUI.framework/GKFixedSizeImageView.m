@implementation GKFixedSizeImageView

- (id)image
{
  return self->_actualImage;
}

- (void)setImage:(id)a3
{
  UIImage *v5;
  CGImage *v6;
  void *v7;
  UIImage *v8;

  v5 = (UIImage *)a3;
  if (self->_actualImage != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_actualImage, a3);
    v6 = -[UIImage CGImage](self->_actualImage, "CGImage");
    -[GKFixedSizeImageView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContents:", v6);

    -[UIView _gkSetNeedsRender](self, "_gkSetNeedsRender");
    v5 = v8;
  }

}

- (UIImage)actualImage
{
  return self->_actualImage;
}

- (void)setActualImage:(id)a3
{
  objc_storeStrong((id *)&self->_actualImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actualImage, 0);
}

@end
