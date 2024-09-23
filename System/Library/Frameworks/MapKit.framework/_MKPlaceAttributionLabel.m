@implementation _MKPlaceAttributionLabel

- (id)attributionWithString:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = a3;
  -[_MKPlaceAttributionLabel image](self, "image");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CEA258]);
    -[_MKPlaceAttributionLabel image](self, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v6);

    v7 = *MEMORY[0x1E0C9D538];
    v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[_MKPlaceAttributionLabel image](self, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "size");
    objc_msgSend(v5, "setBounds:", v7, v8, v10, v11);

  }
  v12 = v4;
  -[_MKPlaceAttributionLabel imagePlaceholder](self, "imagePlaceholder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[_MKPlaceAttributionLabel imagePlaceholder](self, "imagePlaceholder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsSeparatedByString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v12;
    if (objc_msgSend(v15, "count"))
    {
      objc_msgSend(v15, "objectAtIndex:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if ((unint64_t)objc_msgSend(v15, "count") < 2)
    {
      v17 = 0;
    }
    else
    {
      objc_msgSend(v15, "objectAtIndex:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v17 = 0;
    v16 = v12;
  }
  v18 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  if (objc_msgSend(v16, "length"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v16);
    objc_msgSend(v18, "appendAttributedString:", v19);

  }
  -[_MKPlaceAttributionLabel image](self, "image");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "appendAttributedString:", v21);

    v22 = *MEMORY[0x1E0CEA068];
    v23 = (void *)MEMORY[0x1E0CB37E8];
    -[_MKPlaceAttributionLabel imageBaselineOffset](self, "imageBaselineOffset");
    objc_msgSend(v23, "numberWithDouble:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAttribute:value:range:", v22, v24, objc_msgSend(v18, "length") - 1, 1);

  }
  if (objc_msgSend(v17, "length"))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v17);
    objc_msgSend(v18, "appendAttributedString:", v25);

  }
  return v18;
}

- (UIImage)image
{
  return self->image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->image, a3);
}

- (double)imageBaselineOffset
{
  return self->imageBaselineOffset;
}

- (void)setImageBaselineOffset:(double)a3
{
  self->imageBaselineOffset = a3;
}

- (NSString)imagePlaceholder
{
  return self->imagePlaceholder;
}

- (void)setImagePlaceholder:(id)a3
{
  objc_storeStrong((id *)&self->imagePlaceholder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->imagePlaceholder, 0);
  objc_storeStrong((id *)&self->image, 0);
}

@end
