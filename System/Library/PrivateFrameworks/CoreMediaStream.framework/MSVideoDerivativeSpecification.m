@implementation MSVideoDerivativeSpecification

- (MSVideoDerivativeSpecification)initWithDictionary:(id)a3
{
  id v4;
  MSVideoDerivativeSpecification *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  NSString *v10;
  uint64_t v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MSVideoDerivativeSpecification;
  v5 = -[MSVideoDerivativeSpecification init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("cellular"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_useCellular = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("powerRequired"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_powerRequired = objc_msgSend(v7, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("bitRate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v5->_bitRate = v9;

    v10 = (NSString *)(id)objc_msgSend(v4, "objectForKey:", CFSTR("videoType"));
    v5->_videoType = v10;
    if (-[NSString isEqualToString:](v10, "isEqualToString:", CFSTR("PosterFrame")))
    {
      v11 = 5;
    }
    else if (-[NSString isEqualToString:](v5->_videoType, "isEqualToString:", CFSTR("360p")))
    {
      v11 = 6;
    }
    else
    {
      if (!-[NSString isEqualToString:](v5->_videoType, "isEqualToString:", CFSTR("720p")))
      {
        v5->_mediaAssetType = 0;
        goto LABEL_9;
      }
      v11 = 7;
    }
    v5->_mediaAssetType = v11;
  }
LABEL_9:

  return v5;
}

- (BOOL)useCellular
{
  return self->_useCellular;
}

- (BOOL)powerRequired
{
  return self->_powerRequired;
}

- (double)bitRate
{
  return self->_bitRate;
}

- (NSString)videoType
{
  return self->_videoType;
}

- (unint64_t)mediaAssetType
{
  return self->_mediaAssetType;
}

+ (id)videoDerivativeSpecificationsWithDictionaryArray:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__MSVideoDerivativeSpecification_videoDerivativeSpecificationsWithDictionaryArray___block_invoke;
  v8[3] = &unk_1E95BCFE8;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

void __83__MSVideoDerivativeSpecification_videoDerivativeSpecificationsWithDictionaryArray___block_invoke(uint64_t a1, void *a2)
{
  MSVideoDerivativeSpecification *v3;
  id v4;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = -[MSVideoDerivativeSpecification initWithDictionary:]([MSVideoDerivativeSpecification alloc], "initWithDictionary:", v4);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  }
}

@end
