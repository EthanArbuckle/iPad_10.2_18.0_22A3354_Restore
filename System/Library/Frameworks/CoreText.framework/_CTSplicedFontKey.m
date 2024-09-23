@implementation _CTSplicedFontKey

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v13;
  unint64_t hash;
  NSString *name;
  _BOOL4 v16;
  NSString *language;
  double lineHeightRatio;
  double v19;
  double lineSpacingOverride;
  double v21;
  int64_t legibilityWeight;
  int ignoreLegibilityWeight;
  unint64_t sizeCategory;
  NSString *design;
  double weight;
  double v27;
  double width;
  double v29;
  unsigned int grade;
  unsigned int platform;
  unsigned int modifier;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  if (self == a3)
  {
    LOBYTE(v16) = 1;
    return v16;
  }
  v34 = v5;
  v35 = v4;
  v36 = v3;
  if (!a3)
    goto LABEL_21;
  v13 = objc_opt_class();
  if (v13 != objc_opt_class())
    goto LABEL_21;
  hash = self->_hash;
  if (hash != objc_msgSend(a3, "hash"))
    goto LABEL_21;
  name = self->_name;
  if (name == (NSString *)objc_msgSend(a3, "name")
    || (v16 = -[NSString isEqualToString:](self->_name, "isEqualToString:", objc_msgSend(a3, "name"))))
  {
    language = self->_language;
    if (language == (NSString *)objc_msgSend(a3, "language", v10, v9, v6, v34, v35, v36, v7, v8)
      || (v16 = -[NSString isEqualToString:](self->_language, "isEqualToString:", objc_msgSend(a3, "language"))))
    {
      lineHeightRatio = self->_lineHeightRatio;
      objc_msgSend(a3, "lineHeightRatio");
      if (lineHeightRatio != v19)
        goto LABEL_21;
      lineSpacingOverride = self->_lineSpacingOverride;
      objc_msgSend(a3, "lineSpacingOverride");
      if (lineSpacingOverride != v21)
        goto LABEL_21;
      legibilityWeight = self->_legibilityWeight;
      if (legibilityWeight != objc_msgSend(a3, "legibilityWeight"))
        goto LABEL_21;
      ignoreLegibilityWeight = self->_ignoreLegibilityWeight;
      if (ignoreLegibilityWeight != objc_msgSend(a3, "ignoreLegibilityWeight"))
        goto LABEL_21;
      sizeCategory = self->_sizeCategory;
      if (sizeCategory != objc_msgSend(a3, "sizeCategory"))
        goto LABEL_21;
      design = self->_design;
      if (design == (NSString *)objc_msgSend(a3, "design")
        || (v16 = -[NSString isEqualToString:](self->_design, "isEqualToString:", objc_msgSend(a3, "design"))))
      {
        weight = self->_weight;
        objc_msgSend(a3, "weight");
        if (weight == v27)
        {
          width = self->_width;
          objc_msgSend(a3, "width");
          if (width == v29)
          {
            grade = self->_grade;
            if (grade == objc_msgSend(a3, "grade"))
            {
              platform = self->_platform;
              if (platform == objc_msgSend(a3, "platform"))
              {
                modifier = self->_modifier;
                LOBYTE(v16) = modifier == objc_msgSend(a3, "modifier");
                return v16;
              }
            }
          }
        }
LABEL_21:
        LOBYTE(v16) = 0;
      }
    }
  }
  return v16;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (NSString)design
{
  return self->_design;
}

- (double)width
{
  return self->_width;
}

- (double)weight
{
  return self->_weight;
}

- (unint64_t)sizeCategory
{
  return self->_sizeCategory;
}

- (unsigned)platform
{
  return self->_platform;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)modifier
{
  return self->_modifier;
}

- (double)lineSpacingOverride
{
  return self->_lineSpacingOverride;
}

- (double)lineHeightRatio
{
  return self->_lineHeightRatio;
}

- (int64_t)legibilityWeight
{
  return self->_legibilityWeight;
}

- (NSString)language
{
  return self->_language;
}

- (BOOL)ignoreLegibilityWeight
{
  return self->_ignoreLegibilityWeight;
}

- (unsigned)grade
{
  return self->_grade;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CTSplicedFontKey;
  -[_CTSplicedFontKey dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/<%p>/%lu/%g/%g"), self->_name, self, self->_sizeCategory, *(_QWORD *)&self->_weight, *(_QWORD *)&self->_width);
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (void)setLineHeightRatio:(double)a3
{
  self->_lineHeightRatio = a3;
}

- (void)setLineSpacingOverride:(double)a3
{
  self->_lineSpacingOverride = a3;
}

- (void)setLegibilityWeight:(int64_t)a3
{
  self->_legibilityWeight = a3;
}

- (void)setIgnoreLegibilityWeight:(BOOL)a3
{
  self->_ignoreLegibilityWeight = a3;
}

- (void)setSizeCategory:(unint64_t)a3
{
  self->_sizeCategory = a3;
}

- (void)setDesign:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (void)setWeight:(double)a3
{
  self->_weight = a3;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (void)setGrade:(unsigned int)a3
{
  self->_grade = a3;
}

- (void)setPlatform:(unsigned int)a3
{
  self->_platform = a3;
}

- (void)setModifier:(unsigned int)a3
{
  self->_modifier = a3;
}

- (NSString)variableSizeParameter
{
  return self->_variableSizeParameter;
}

- (void)setVariableSizeParameter:(id)a3
{
  self->_variableSizeParameter = (NSString *)a3;
}

@end
