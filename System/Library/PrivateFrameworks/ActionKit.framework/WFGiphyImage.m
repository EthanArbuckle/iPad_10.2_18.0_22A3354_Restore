@implementation WFGiphyImage

- (NSURL)url
{
  return self->_url;
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (WFImage)cachedImage
{
  return self->_cachedImage;
}

- (void)setCachedImage:(id)a3
{
  objc_storeStrong((id *)&self->_cachedImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedImage, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)JSONKeyPathsByPropertyKey
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCE70], "mtl_identityPropertyMapWithModel:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "setObject:forKey:", CFSTR("size"), CFSTR("fileSize"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("mp4"), CFSTR("videoURL"));
  return v3;
}

+ (id)JSONTransformerForKey:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("url")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("videoURL")))
  {
    objc_msgSend(MEMORY[0x24BDD1970], "mtl_URLValueTransformer");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("fileSize")) & 1) == 0
      && (objc_msgSend(v3, "isEqualToString:", CFSTR("width")) & 1) == 0
      && !objc_msgSend(v3, "isEqualToString:", CFSTR("height")))
    {
      v5 = 0;
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x24BEC3A10], "transformerUsingForwardBlock:reverseBlock:", &__block_literal_global_266, &__block_literal_global_270);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_9:

  return v5;
}

uint64_t __38__WFGiphyImage_JSONTransformerForKey___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(a2, "unsignedLongValue"));
}

uint64_t __38__WFGiphyImage_JSONTransformerForKey___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = (void *)MEMORY[0x24BDD14A8];
  v5 = a2;
  objc_msgSend(v4, "decimalDigitCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invertedSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *a3 = objc_msgSend(v5, "rangeOfCharacterFromSet:", v7) == 0x7FFFFFFFFFFFFFFFLL;

  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = objc_msgSend(v5, "integerValue");

  return objc_msgSend(v8, "numberWithInteger:", v9);
}

@end
