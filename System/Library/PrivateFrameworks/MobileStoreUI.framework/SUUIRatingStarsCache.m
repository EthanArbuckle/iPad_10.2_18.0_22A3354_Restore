@implementation SUUIRatingStarsCache

- (SUUIRatingStarsCache)initWithProperties:(int64_t)a3
{
  char v3;
  SUUIRatingStarsCache *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  UIImage *emptyStarImage;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  UIImage *filledStarImage;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  UIImage *halfStarImage;
  NSMutableDictionary *v24;
  NSMutableDictionary *cachedImages;
  objc_super v27;

  v3 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SUUIRatingStarsCache;
  v4 = -[SUUIRatingStarsCache init](&v27, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("Small");
    if ((v3 & 1) == 0)
      v6 = &stru_2511FF0C8;
    if ((v3 & 4) != 0)
      v7 = CFSTR("Large");
    else
      v7 = v6;
    if ((v3 & 0x10) != 0)
      v8 = CFSTR("Selected");
    else
      v8 = &stru_2511FF0C8;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@StarEmpty%@"), v7, v8);
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", v9, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemOrangeColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_flatImageWithColor:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    emptyStarImage = v4->_emptyStarImage;
    v4->_emptyStarImage = (UIImage *)v12;

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@StarFull%@"), v7, v8);
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", v14, v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemOrangeColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_flatImageWithColor:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    filledStarImage = v4->_filledStarImage;
    v4->_filledStarImage = (UIImage *)v17;

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@StarHalf%@"), v7, v8);
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", v19, v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemOrangeColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_flatImageWithColor:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    halfStarImage = v4->_halfStarImage;
    v4->_halfStarImage = (UIImage *)v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    cachedImages = v4->_cachedImages;
    v4->_cachedImages = v24;

  }
  return v4;
}

+ (id)cacheWithProperties:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (!cacheWithProperties__sCaches)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v6 = (void *)cacheWithProperties__sCaches;
    cacheWithProperties__sCaches = (uint64_t)v5;

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a3);
  objc_msgSend((id)cacheWithProperties__sCaches, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProperties:", a3);
    objc_msgSend((id)cacheWithProperties__sCaches, "setObject:forKey:", v8, v7);
  }

  return v8;
}

- (id)ratingStarsImageForRating:(double)a3
{
  float v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  unint64_t v20;
  double v21;
  uint64_t i;
  double v23;
  double v24;
  void *v25;
  CGSize v27;

  v4 = a3 * 10.0;
  v5 = (uint64_t)rintf(v4);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", v5);
  -[NSMutableDictionary objectForKey:](self->_cachedImages, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[UIImage size](self->_emptyStarImage, "size");
    v9 = v8;
    v11 = v10;
    -[UIImage size](self->_filledStarImage, "size");
    v13 = v12;
    v15 = v14;
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scale");
    v18 = v17;
    v27.width = v9 * 5.0;
    v27.height = v11;
    UIGraphicsBeginImageContextWithOptions(v27, 0, v18);

    v19 = 0.0;
    v20 = -2;
    do
    {
      -[UIImage drawInRect:](self->_emptyStarImage, "drawInRect:", v19, 0.0, v9, v11);
      v19 = v9 + v19;
      v20 += 2;
    }
    while (v20 < 8);
    v21 = 0.0;
    if (v5 >= 2)
    {
      for (i = 2; i <= v5; i += 2)
      {
        -[UIImage drawInRect:](self->_filledStarImage, "drawInRect:", v21, 0.0, v13, v15);
        v21 = v13 + v21;
      }
    }
    if ((v5 & 0x8000000000000001) == 1)
    {
      -[UIImage size](self->_halfStarImage, "size");
      -[UIImage drawInRect:](self->_halfStarImage, "drawInRect:", v21, 0.0, v23, v24);
    }
    UIGraphicsGetImageFromCurrentImageContext();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    if (v7)
      -[NSMutableDictionary setObject:forKey:](self->_cachedImages, "setObject:forKey:", v7, v6);
  }
  objc_msgSend(v7, "imageFlippedForRightToLeftLayoutDirection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_halfStarImage, 0);
  objc_storeStrong((id *)&self->_filledStarImage, 0);
  objc_storeStrong((id *)&self->_emptyStarImage, 0);
  objc_storeStrong((id *)&self->_cachedImages, 0);
}

@end
