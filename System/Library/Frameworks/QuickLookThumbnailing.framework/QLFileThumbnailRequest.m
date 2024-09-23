@implementation QLFileThumbnailRequest

- (QLFileThumbnailRequest)initWithItem:(id)a3 maximumSize:(CGSize)a4 minimumSize:(double)a5 scale:(double)a6 options:(id)a7 generationData:(id)a8
{
  CGFloat height;
  CGFloat width;
  id v16;
  id v17;
  id v18;
  QLFileThumbnailRequest *v19;
  QLFileThumbnailRequest *v20;
  QLFileThumbnailRequest *v21;
  objc_super v23;

  height = a4.height;
  width = a4.width;
  v16 = a3;
  v17 = a7;
  v18 = a8;
  v23.receiver = self;
  v23.super_class = (Class)QLFileThumbnailRequest;
  v19 = -[QLFileThumbnailRequest init](&v23, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_maximumSize.width = width;
    v19->_maximumSize.height = height;
    v19->_minimumSize.width = a5;
    v19->_minimumSize.height = a5;
    v19->_scale = a6;
    objc_storeStrong((id *)&v19->_item, a3);
    objc_storeStrong((id *)&v20->_generationData, a8);
    objc_storeStrong((id *)&v20->_options, a7);
    v21 = v20;
  }

  return v20;
}

- (NSURL)fileURL
{
  void *v2;
  void *v3;

  -[QLFileThumbnailRequest item](self, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (id)contentType
{
  void *v2;
  void *v3;
  void *v4;

  -[QLFileThumbnailRequest item](self, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p maximumSize=(%.2f, %.2f) minimumSize=(%.2f,%.2f) scale=%.1f item=%@>"), objc_opt_class(), self, *(_QWORD *)&self->_maximumSize.width, *(_QWORD *)&self->_maximumSize.height, *(_QWORD *)&self->_minimumSize.width, *(_QWORD *)&self->_minimumSize.height, *(_QWORD *)&self->_scale, self->_item);
}

- (unint64_t)badgeType
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", CFSTR("BadgeType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "intValue");

  return v3;
}

- (int)iconFlavor
{
  void *v2;
  int v3;

  -[NSDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", CFSTR("IconFlavor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (int)interpolationQuality
{
  void *v2;
  int v3;

  -[NSDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", CFSTR("InterpolationQuality"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (BOOL)wantsLowQuality
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", CFSTR("WantsLowQuality"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)thirdPartyVideoDecodersAllowed
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", CFSTR("ThirdPartyVideoDecodersAllowed"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (QLFileThumbnailRequest)initWithCoder:(id)a3
{
  id v3;
  QLFileThumbnailRequest *v4;
  float v5;
  CGFloat v6;
  float v7;
  float v8;
  CGFloat v9;
  float v10;
  uint64_t v11;
  QLThumbnailItem *item;
  uint64_t v13;
  NSDictionary *options;
  uint64_t v15;
  NSDictionary *generationData;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)QLFileThumbnailRequest;
  v3 = a3;
  v4 = -[QLFileThumbnailRequest init](&v18, sel_init);
  objc_msgSend(v3, "decodeFloatForKey:", CFSTR("maxW"), v18.receiver, v18.super_class);
  v6 = v5;
  objc_msgSend(v3, "decodeFloatForKey:", CFSTR("maxH"));
  v4->_maximumSize.width = v6;
  v4->_maximumSize.height = v7;
  objc_msgSend(v3, "decodeFloatForKey:", CFSTR("min"));
  v9 = v8;
  v4->_minimumSize.width = v9;
  v4->_minimumSize.height = v9;
  objc_msgSend(v3, "decodeFloatForKey:", CFSTR("s"));
  v4->_scale = v10;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("i"));
  v11 = objc_claimAutoreleasedReturnValue();
  item = v4->_item;
  v4->_item = (QLThumbnailItem *)v11;

  objc_msgSend(v3, "decodePropertyListForKey:", CFSTR("o"));
  v13 = objc_claimAutoreleasedReturnValue();
  options = v4->_options;
  v4->_options = (NSDictionary *)v13;

  objc_msgSend(v3, "decodePropertyListForKey:", CFSTR("g"));
  v15 = objc_claimAutoreleasedReturnValue();

  generationData = v4->_generationData;
  v4->_generationData = (NSDictionary *)v15;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  float width;
  double v5;
  CGFloat height;
  CGFloat v7;
  double scale;
  id v9;

  width = self->_maximumSize.width;
  v9 = a3;
  *(float *)&v5 = width;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("maxW"), v5);
  height = self->_maximumSize.height;
  *(float *)&height = height;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("maxH"), height);
  v7 = self->_minimumSize.width;
  *(float *)&v7 = v7;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("min"), v7);
  scale = self->_scale;
  *(float *)&scale = scale;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("s"), scale);
  objc_msgSend(v9, "encodeObject:forKey:", self->_item, CFSTR("i"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_options, CFSTR("o"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_generationData, CFSTR("g"));

}

- (CGSize)maximumSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maximumSize.width;
  height = self->_maximumSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaximumSize:(CGSize)a3
{
  self->_maximumSize = a3;
}

- (CGSize)minimumSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minimumSize.width;
  height = self->_minimumSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMinimumSize:(CGSize)a3
{
  self->_minimumSize = a3;
}

- (CGFloat)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (QLThumbnailItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (NSDictionary)generationData
{
  return self->_generationData;
}

- (void)setGenerationData:(id)a3
{
  objc_storeStrong((id *)&self->_generationData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generationData, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
