@implementation MADVIVisualSearchResultItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVIVisualSearchResultItem)initWithNormalizedBoundingBox:(CGRect)a3 regionAttributes:(id)a4 andSearchSections:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  id v13;
  MADVIVisualSearchResultItem *v14;
  MADVIVisualSearchResultItem *v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MADVIVisualSearchResultItem;
  v14 = -[MADVIVisualSearchResultItem init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_normalizedBoundingBox.origin.x = x;
    v14->_normalizedBoundingBox.origin.y = y;
    v14->_normalizedBoundingBox.size.width = width;
    v14->_normalizedBoundingBox.size.height = height;
    objc_storeStrong((id *)&v14->_regionAttributes, a4);
    objc_storeStrong((id *)&v15->_searchSections, a5);
  }

  return v15;
}

- (MADVIVisualSearchResultItem)initWithCoder:(id)a3
{
  id v4;
  MADVIVisualSearchResultItem *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *regionAttributes;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSArray *searchSections;
  objc_super v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MADVIVisualSearchResultItem;
  v5 = -[MADVIVisualSearchResultItem init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeRectForKey:", CFSTR("NormalizedBoundingBox"));
    v5->_normalizedBoundingBox.origin.x = v6;
    v5->_normalizedBoundingBox.origin.y = v7;
    v5->_normalizedBoundingBox.size.width = v8;
    v5->_normalizedBoundingBox.size.height = v9;
    v10 = (void *)MEMORY[0x1E0C99E60];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("RegionAttributes"));
    v13 = objc_claimAutoreleasedReturnValue();
    regionAttributes = v5->_regionAttributes;
    v5->_regionAttributes = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v29[0] = objc_opt_class();
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v16 = (void *)getSFResultSectionClass_softClass_0;
    v28 = getSFResultSectionClass_softClass_0;
    if (!getSFResultSectionClass_softClass_0)
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __getSFResultSectionClass_block_invoke_0;
      v24[3] = &unk_1E97E2300;
      v24[4] = &v25;
      __getSFResultSectionClass_block_invoke_0((uint64_t)v24);
      v16 = (void *)v26[3];
    }
    v17 = objc_retainAutorelease(v16);
    _Block_object_dispose(&v25, 8);
    v29[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("SearchSections"));
    v20 = objc_claimAutoreleasedReturnValue();
    searchSections = v5->_searchSections;
    v5->_searchSections = (NSArray *)v20;

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
  objc_msgSend(v8, "encodeObject:forKey:", self->_regionAttributes, CFSTR("RegionAttributes"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_searchSections, CFSTR("SearchSections"));

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
  objc_msgSend(v3, "appendFormat:", CFSTR("regionAttributes: %@, "), self->_regionAttributes);
  objc_msgSend(v3, "appendFormat:", CFSTR("searchSections: %@>"), self->_searchSections);
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

- (NSArray)regionAttributes
{
  return self->_regionAttributes;
}

- (NSArray)searchSections
{
  return self->_searchSections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchSections, 0);
  objc_storeStrong((id *)&self->_regionAttributes, 0);
}

@end
