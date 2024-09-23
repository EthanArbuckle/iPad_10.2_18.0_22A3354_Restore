@implementation MPMediaQuerySection

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setSectionIndexTitleIndex:(unint64_t)a3
{
  self->_sectionIndexTitleIndex = a3;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPMediaQuerySection;
  return -[MPMediaQuerySection init](&v3, sel_init);
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)sectionIndexTitleIndex
{
  return self->_sectionIndexTitleIndex;
}

- (NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (MPMediaQuerySection)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("MPMediaQuerySection is a read-only object"));

  return 0;
}

- (id)description
{
  void *v3;
  NSString *title;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPMediaQuerySection;
  -[MPMediaQuerySection description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  title = self->_title;
  NSStringFromRange(self->_range);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" title=%@, range=%@, sectionIndexTitleIndex=%lu"), title, v5, self->_sectionIndexTitleIndex);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (MPMediaQuerySection)initWithCoder:(id)a3
{
  id v4;
  MPMediaQuerySection *v5;
  void *v6;

  v4 = a3;
  v5 = -[MPMediaQuerySection _init](self, "_init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPTitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaQuerySection setTitle:](v5, "setTitle:", v6);

    -[MPMediaQuerySection setRange:](v5, "setRange:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPRangeLocation")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPRangeLength")));
    -[MPMediaQuerySection setSectionIndexTitleIndex:](v5, "setSectionIndexTitleIndex:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPSectionIndex")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("MPTitle"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_range.location, CFSTR("MPRangeLocation"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_range.length, CFSTR("MPRangeLength"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sectionIndexTitleIndex, CFSTR("MPSectionIndex"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_init");
  objc_msgSend(v4, "setTitle:", self->_title);
  objc_msgSend(v4, "setRange:", self->_range.location, self->_range.length);
  objc_msgSend(v4, "setSectionIndexTitleIndex:", self->_sectionIndexTitleIndex);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
