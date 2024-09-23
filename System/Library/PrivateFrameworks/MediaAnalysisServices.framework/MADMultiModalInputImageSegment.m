@implementation MADMultiModalInputImageSegment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADMultiModalInputImageSegment)initWithSurface:(id)a3 seed:(id)a4
{
  id v7;
  id v8;
  MADMultiModalInputImageSegment *v9;
  MADMultiModalInputImageSegment *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MADMultiModalInputImageSegment;
  v9 = -[MADMultiModalInputImageSegment init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_surface, a3);
    objc_storeStrong((id *)&v10->_seed, a4);
  }

  return v10;
}

- (MADMultiModalInputImageSegment)initWithCoder:(id)a3
{
  id v4;
  MADMultiModalInputImageSegment *v5;
  uint64_t v6;
  IOSurface *surface;
  uint64_t v8;
  NSNumber *seed;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADMultiModalInputImageSegment;
  v5 = -[MADMultiModalInputSegment initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Surface"));
    v6 = objc_claimAutoreleasedReturnValue();
    surface = v5->_surface;
    v5->_surface = (IOSurface *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Seed"));
    v8 = objc_claimAutoreleasedReturnValue();
    seed = v5->_seed;
    v5->_seed = (NSNumber *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADMultiModalInputImageSegment;
  v4 = a3;
  -[MADMultiModalInputSegment encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_surface, CFSTR("Surface"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_seed, CFSTR("Seed"));

}

- (int64_t)type
{
  return 3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("surface: %@"), self->_surface);
  if (self->_seed)
    objc_msgSend(v3, "appendFormat:", CFSTR(", seed: %@"), self->_seed);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (IOSurface)surface
{
  return self->_surface;
}

- (NSNumber)seed
{
  return self->_seed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seed, 0);
  objc_storeStrong((id *)&self->_surface, 0);
}

@end
