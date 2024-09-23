@implementation MKAppleLogoImageView

- (id)initForMapType:(unint64_t)a3 forDarkMode:(BOOL)a4
{
  _BOOL8 v4;
  MKAppleLogoImageView *v6;
  void *v7;
  MKAppleLogoImageView *v8;
  objc_super v10;

  v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MKAppleLogoImageView;
  v6 = -[MKAppleLogoImageView init](&v10, sel_init);
  if (v6)
  {
    +[MKAppleLogoImageView logoForMapType:forDarkMode:](MKAppleLogoImageView, "logoForMapType:forDarkMode:", a3, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKAppleLogoImageView setImage:](v6, "setImage:", v7);

    v8 = v6;
  }

  return v6;
}

- (void)setImage:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKAppleLogoImageView;
  -[MKAppleLogoImageView setImage:](&v4, sel_setImage_, a3);
  -[MKAppleLogoImageView sizeToFit](self, "sizeToFit");
}

- (void)updateForMapType:(unint64_t)a3 darkMode:(BOOL)a4
{
  id v5;

  +[MKAppleLogoImageView logoForMapType:forDarkMode:](MKAppleLogoImageView, "logoForMapType:forDarkMode:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MKAppleLogoImageView setImage:](self, "setImage:", v5);

}

+ (id)logoForMapType:(unint64_t)a3 forDarkMode:(BOOL)a4
{
  const __CFString *v4;
  const __CFString *v5;

  v4 = CFSTR("Apple_Maps_blk");
  if (a4)
    v4 = CFSTR("Apple_Maps_wht");
  if (a3 == 107)
    v4 = CFSTR("Apple_Maps_wht");
  if (a3 - 1 >= 4)
    v5 = v4;
  else
    v5 = CFSTR("Apple_Maps_wht");
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", v5);
}

@end
