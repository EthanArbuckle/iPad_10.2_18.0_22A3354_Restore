@implementation AVMediaContentRatings

+ (id)contentRatingsDictionary
{
  if (contentRatingsDictionary_onceToken != -1)
    dispatch_once(&contentRatingsDictionary_onceToken, &__block_literal_global_23983);
  return (id)contentRatingsDictionary__contentRatingsDictionary;
}

+ (id)_imageNameForRating:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_1E5BB5F88);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[AVMediaContentRatings contentRatingsDictionary](AVMediaContentRatings, "contentRatingsDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)imageForRating:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "_imageNameForRating:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0DC3870];
    AVBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:inBundle:compatibleWithTraitCollection:", v3, v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isRatingImageMask:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a1, "_imageNameForRating:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSuffix:", CFSTR("_mask"));

  return v4;
}

+ (id)displayStringForRating:(id)a3
{
  return (id)objc_msgSend(a3, "uppercaseString");
}

+ (id)imageForMetadataItem:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageForRating:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)displayStringForMetadataItem:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "displayStringForRating:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)isImageMaskForMetadataItem:(id)a3
{
  void *v4;

  objc_msgSend(a3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "isRatingImageMask:", v4);

  return (char)a1;
}

void __49__AVMediaContentRatings_contentRatingsDictionary__block_invoke()
{
  void *v0;

  v0 = (void *)contentRatingsDictionary__contentRatingsDictionary;
  contentRatingsDictionary__contentRatingsDictionary = (uint64_t)&unk_1E5BF43A8;

}

@end
