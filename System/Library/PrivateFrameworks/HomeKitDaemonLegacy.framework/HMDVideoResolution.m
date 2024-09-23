@implementation HMDVideoResolution

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageHeight, 0);
  objc_storeStrong((id *)&self->_imageWidth, 0);
}

- (NSNumber)imageWidth
{
  return self->_imageWidth;
}

- (NSNumber)imageHeight
{
  return self->_imageHeight;
}

+ (id)arrayWithResolutions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  HMDVideoResolution *v11;
  HMDVideoResolution *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [HMDVideoResolution alloc];
        v12 = -[HMDVideoResolution initWithResolution:](v11, "initWithResolution:", objc_msgSend(v10, "unsignedIntegerValue", (_QWORD)v14));
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (HMDVideoResolution)initWithResolution:(unint64_t)a3
{
  HMDVideoResolution *v4;
  HMDVideoResolution *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDVideoResolution;
  v4 = -[HMDVideoResolution init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_resolutionType = a3;
    -[HMDVideoResolution _extractWidthAndHeight](v4, "_extractWidthAndHeight");
  }
  return v5;
}

- (void)_extractWidthAndHeight
{
  NSNumber *v3;
  NSNumber *v4;
  NSNumber *imageWidth;
  NSNumber *v6;
  NSNumber *imageHeight;
  id v8;
  id v9;

  v8 = 0;
  v9 = 0;
  +[HMDVideoAttributes translateImageResolution:imageWidth:imageHeight:](HMDVideoAttributes, "translateImageResolution:imageWidth:imageHeight:", self, &v9, &v8);
  v3 = (NSNumber *)v9;
  v4 = (NSNumber *)v8;
  imageWidth = self->_imageWidth;
  self->_imageWidth = v3;
  v6 = v3;

  imageHeight = self->_imageHeight;
  self->_imageHeight = v4;

}

- (unint64_t)resolutionType
{
  return self->_resolutionType;
}

- (HMDVideoResolution)initWithCoder:(id)a3
{
  id v4;
  HMDVideoResolution *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDVideoResolution;
  v5 = -[HMDVideoResolution init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_%s"), "HMDVideoResolution", "resolutionType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_resolutionType = (int)objc_msgSend(v4, "decodeInt32ForKey:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;

  v4 = a3;
  v5 = -[HMDVideoResolution resolutionType](self, "resolutionType");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_%s"), "HMDVideoResolution", "resolutionType");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt32:forKey:", v5, v6);

}

- (BOOL)isEqual:(id)a3
{
  HMDVideoResolution *v4;
  unint64_t v5;
  BOOL v6;

  v4 = (HMDVideoResolution *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[HMDVideoResolution resolutionType](self, "resolutionType");
      v6 = v5 == -[HMDVideoResolution resolutionType](v4, "resolutionType");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  HMDVideoResolutionTypeAsString(-[HMDVideoResolution resolutionType](self, "resolutionType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  HMDVideoResolutionTypeAsString(-[HMDVideoResolution resolutionType](self, "resolutionType"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@ resolutionType = %@"), v6, v8);

}

- (HMDVideoResolution)initWithTLVData:(id)a3
{
  HMDVideoResolution *v3;
  HMDVideoResolution *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDVideoResolution;
  v3 = -[HAPNumberParser initWithTLVData:](&v6, sel_initWithTLVData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_resolutionType = -[HAPNumberParser decodedNumber](v3, "decodedNumber");
    -[HMDVideoResolution _extractWidthAndHeight](v4, "_extractWidthAndHeight");
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HMDVideoResolution initWithResolution:](+[HMDVideoResolution allocWithZone:](HMDVideoResolution, "allocWithZone:", a3), "initWithResolution:", -[HMDVideoResolution resolutionType](self, "resolutionType"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
