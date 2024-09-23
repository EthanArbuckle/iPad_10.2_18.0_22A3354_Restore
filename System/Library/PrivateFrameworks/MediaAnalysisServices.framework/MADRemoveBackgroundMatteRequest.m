@implementation MADRemoveBackgroundMatteRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADRemoveBackgroundMatteRequest)init
{
  MADRemoveBackgroundMatteRequest *v2;
  uint64_t v3;
  NSIndexSet *instances;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MADRemoveBackgroundMatteRequest;
  v2 = -[MADRemoveBackgroundMatteRequest init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v3 = objc_claimAutoreleasedReturnValue();
    instances = v2->_instances;
    v2->_instances = (NSIndexSet *)v3;

  }
  return v2;
}

- (MADRemoveBackgroundMatteRequest)initWithCoder:(id)a3
{
  id v4;
  MADRemoveBackgroundMatteRequest *v5;
  uint64_t v6;
  NSIndexSet *instances;
  uint64_t v8;
  NSNumber *imageType;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADRemoveBackgroundMatteRequest;
  v5 = -[MADRequest initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Instances"));
    v6 = objc_claimAutoreleasedReturnValue();
    instances = v5->_instances;
    v5->_instances = (NSIndexSet *)v6;

    v5->_inPlace = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("InPlace"));
    v5->_cropResult = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CropResult"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ImageType"));
    v8 = objc_claimAutoreleasedReturnValue();
    imageType = v5->_imageType;
    v5->_imageType = (NSNumber *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADRemoveBackgroundMatteRequest;
  v4 = a3;
  -[MADRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_instances, CFSTR("Instances"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_inPlace, CFSTR("InPlace"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_cropResult, CFSTR("CropResult"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageType, CFSTR("ImageType"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  if (self->_instances)
    objc_msgSend(v3, "appendFormat:", CFSTR("instances: %@, "), self->_instances);
  objc_msgSend(v3, "appendFormat:", CFSTR("inPlace: %d, "), self->_inPlace);
  objc_msgSend(v3, "appendFormat:", CFSTR("cropResult: %d, "), self->_cropResult);
  if (self->_imageType)
    objc_msgSend(v3, "appendFormat:", CFSTR("imageType: %@, "), self->_imageType);
  -[MADRequest results](self, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("results: %@, "), v6);

  -[MADRequest error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("error: %@>"), v7);

  return v3;
}

- (MADRemoveBackgroundMatteResult)result
{
  void *v2;
  void *v3;

  -[MADRequest results](self, "results");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MADRemoveBackgroundMatteResult *)v3;
}

- (NSIndexSet)instances
{
  return self->_instances;
}

- (void)setInstances:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)inPlace
{
  return self->_inPlace;
}

- (void)setInPlace:(BOOL)a3
{
  self->_inPlace = a3;
}

- (BOOL)cropResult
{
  return self->_cropResult;
}

- (void)setCropResult:(BOOL)a3
{
  self->_cropResult = a3;
}

- (NSNumber)imageType
{
  return self->_imageType;
}

- (void)setImageType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageType, 0);
  objc_storeStrong((id *)&self->_instances, 0);
}

@end
