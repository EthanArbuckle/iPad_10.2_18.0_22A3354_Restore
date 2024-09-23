@implementation MADVIVisualSearchGatingResultItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVIVisualSearchGatingResultItem)initWithNormalizedBoundingBox:(CGRect)a3 andDomains:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  MADVIVisualSearchGatingResultItem *v11;
  MADVIVisualSearchGatingResultItem *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MADVIVisualSearchGatingResultItem;
  v11 = -[MADVIVisualSearchGatingResultItem init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_normalizedBoundingBox.origin.x = x;
    v11->_normalizedBoundingBox.origin.y = y;
    v11->_normalizedBoundingBox.size.width = width;
    v11->_normalizedBoundingBox.size.height = height;
    objc_storeStrong((id *)&v11->_domains, a4);
  }

  return v12;
}

- (MADVIVisualSearchGatingResultItem)initWithCoder:(id)a3
{
  id v4;
  MADVIVisualSearchGatingResultItem *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *domains;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MADVIVisualSearchGatingResultItem;
  v5 = -[MADVIVisualSearchGatingResultItem init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeRectForKey:", CFSTR("NormalizedBoundingBox"));
    v5->_normalizedBoundingBox.origin.x = v6;
    v5->_normalizedBoundingBox.origin.y = v7;
    v5->_normalizedBoundingBox.size.width = v8;
    v5->_normalizedBoundingBox.size.height = v9;
    v10 = (void *)MEMORY[0x1E0C99E60];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("Domains"));
    v13 = objc_claimAutoreleasedReturnValue();
    domains = v5->_domains;
    v5->_domains = (NSArray *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  id v8;

  x = self->_normalizedBoundingBox.origin.x;
  y = self->_normalizedBoundingBox.origin.y;
  width = self->_normalizedBoundingBox.size.width;
  height = self->_normalizedBoundingBox.size.height;
  v8 = a3;
  objc_msgSend(v8, "encodeRect:forKey:", CFSTR("NormalizedBoundingBox"), x, y, width, height);
  objc_msgSend(v8, "encodeObject:forKey:", self->_domains, CFSTR("Domains"));

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

  objc_msgSend(v3, "appendFormat:", CFSTR("normalizedBoundingBox: %0.2fx%0.2f @ (%0.2f, %0.2f), "), *(_QWORD *)&self->_normalizedBoundingBox.size.width, *(_QWORD *)&self->_normalizedBoundingBox.size.height, *(_QWORD *)&self->_normalizedBoundingBox.origin.x, *(_QWORD *)&self->_normalizedBoundingBox.origin.y);
  objc_msgSend(v3, "appendFormat:", CFSTR("domains: %@>"), self->_domains);
  return v3;
}

- (CGRect)normalizedBoundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedBoundingBox.origin.x;
  y = self->_normalizedBoundingBox.origin.y;
  width = self->_normalizedBoundingBox.size.width;
  height = self->_normalizedBoundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSArray)domains
{
  return self->_domains;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domains, 0);
}

@end
