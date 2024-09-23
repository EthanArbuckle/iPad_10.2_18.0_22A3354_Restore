@implementation FCCoverArt

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_images, 0);
}

- (FCCoverArt)initWithJSONString:(id)a3
{
  void *v4;
  FCCoverArt *v5;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FCCoverArt initWithJSONData:](self, "initWithJSONData:", v4);

  return v5;
}

- (FCCoverArt)initWithJSONData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  FCCoverArt *v7;
  void *v8;
  uint64_t v9;
  NSArray *images;
  FCCoverArt *v11;
  objc_super v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, &v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v14;
    if (v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      v11 = 0;
      v5 = v6;
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)FCCoverArt;
      v7 = -[FCCoverArt init](&v13, sel_init);
      if (v7)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("coverArt"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        FCCoverArtImagesFromUnprocessedImages(v8);
        v9 = objc_claimAutoreleasedReturnValue();
        images = v7->_images;
        v7->_images = (NSArray *)v9;

      }
      self = v7;
      v11 = self;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSArray)images
{
  return self->_images;
}

@end
