@implementation NSMorphologyPronoun

- (id)_morphunConstraints
{
  return @objc NSMorphology.morphunConstraints()(self, (uint64_t)a2, (void (*)(void))NSMorphologyPronoun.morphunConstraints());
}

- (NSMorphologyPronoun)initWithPronoun:(NSString *)pronoun morphology:(NSMorphology *)morphology dependentMorphology:(NSMorphology *)dependentMorphology
{
  NSMorphologyPronoun *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)NSMorphologyPronoun;
  v8 = -[NSMorphologyPronoun init](&v10, sel_init);
  if (v8)
  {
    v8->_pronoun = (NSString *)-[NSString copy](pronoun, "copy");
    v8->_morphology = (NSMorphology *)-[NSMorphology copy](morphology, "copy");
    v8->_dependentMorphology = (NSMorphology *)-[NSMorphology copy](dependentMorphology, "copy");
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSMorphologyPronoun;
  -[NSMorphologyPronoun dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;

  v3 = objc_msgSend((id)objc_opt_class(), "hash");
  v4 = -[NSString hash](-[NSMorphologyPronoun pronoun](self, "pronoun"), "hash") ^ v3;
  v5 = -[NSMorphology hash](-[NSMorphologyPronoun morphology](self, "morphology"), "hash");
  return v4 ^ v5 ^ -[NSMorphology hash](-[NSMorphologyPronoun dependentMorphology](self, "dependentMorphology"), "hash");
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  NSMorphology *v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[NSString isEqualToString:](-[NSMorphologyPronoun pronoun](self, "pronoun"), "isEqualToString:", objc_msgSend(a3, "pronoun"));
    if (v5)
    {
      v5 = -[NSMorphology isEqual:](-[NSMorphologyPronoun morphology](self, "morphology"), "isEqual:", objc_msgSend(a3, "morphology"));
      if (v5)
      {
        v6 = -[NSMorphologyPronoun dependentMorphology](self, "dependentMorphology");
        LOBYTE(v5) = v6 == (NSMorphology *)objc_msgSend(a3, "dependentMorphology")
                  || -[NSMorphology isEqual:](-[NSMorphologyPronoun dependentMorphology](self, "dependentMorphology"), "isEqual:", objc_msgSend(a3, "dependentMorphology"));
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSMorphology *dependentMorphology;

  objc_msgSend(a3, "encodeObject:forKey:", self->_pronoun, CFSTR("pronoun"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_morphology, CFSTR("morphology"));
  dependentMorphology = self->_dependentMorphology;
  if (dependentMorphology)
    objc_msgSend(a3, "encodeObject:forKey:", dependentMorphology, CFSTR("dependentMorphology"));
}

- (NSMorphologyPronoun)initWithCoder:(id)a3
{
  NSMorphologyPronoun *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSMorphologyPronoun;
  v4 = -[NSMorphologyPronoun init](&v6, sel_init);
  if (v4)
  {
    v4->_pronoun = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pronoun")), "copy");
    v4->_morphology = (NSMorphology *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("morphology")), "copy");
    v4->_dependentMorphology = (NSMorphology *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dependentMorphology")), "copy");
  }
  return v4;
}

- (NSString)pronoun
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSMorphology)morphology
{
  return (NSMorphology *)objc_getProperty(self, a2, 16, 1);
}

- (NSMorphology)dependentMorphology
{
  return (NSMorphology *)objc_getProperty(self, a2, 24, 1);
}

@end
