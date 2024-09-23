@implementation MUPhotoTileOverlay

- (BOOL)shouldBeShown
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[MUPhotoTileOverlay attributionTitle](self, "attributionTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = 1;
  }
  else
  {
    -[MUPhotoTileOverlay badgeTitle](self, "badgeTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v4 = 1;
    }
    else
    {
      -[MUPhotoTileOverlay tileTitle](self, "tileTitle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "length") != 0;

    }
  }

  return v4;
}

- (NSString)tileTitle
{
  return self->_tileTitle;
}

- (void)setTileTitle:(id)a3
{
  objc_storeStrong((id *)&self->_tileTitle, a3);
}

- (NSString)attributionTitle
{
  return self->_attributionTitle;
}

- (void)setAttributionTitle:(id)a3
{
  objc_storeStrong((id *)&self->_attributionTitle, a3);
}

- (NSString)badgeTitle
{
  return self->_badgeTitle;
}

- (void)setBadgeTitle:(id)a3
{
  objc_storeStrong((id *)&self->_badgeTitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeTitle, 0);
  objc_storeStrong((id *)&self->_attributionTitle, 0);
  objc_storeStrong((id *)&self->_tileTitle, 0);
}

@end
