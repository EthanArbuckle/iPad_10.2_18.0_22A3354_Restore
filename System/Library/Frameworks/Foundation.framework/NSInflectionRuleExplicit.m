@implementation NSInflectionRuleExplicit

- (NSInflectionRuleExplicit)initWithMorphology:(NSMorphology *)morphology
{
  NSInflectionRuleExplicit *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSInflectionRuleExplicit;
  v4 = -[NSInflectionRule _init](&v6, sel__init);
  if (v4)
    v4->_morphology = (NSMorphology *)-[NSMorphology copy](morphology, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSInflectionRuleExplicit;
  -[NSInflectionRuleExplicit dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[NSInflectionRuleExplicit morphology](self, "morphology"), CFSTR("NS.Morphology"));
}

- (NSInflectionRuleExplicit)initWithCoder:(id)a3
{
  NSInflectionRuleExplicit *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSInflectionRuleExplicit;
  v4 = -[NSInflectionRule _init](&v6, sel__init);
  if (v4)
    v4->_morphology = (NSMorphology *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.Morphology"));
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = objc_msgSend((id)objc_opt_class(), "hash");
  return -[NSMorphology hash](-[NSInflectionRuleExplicit morphology](self, "morphology"), "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[NSMorphology isEqual:](-[NSInflectionRuleExplicit morphology](self, "morphology"), "isEqual:", objc_msgSend(a3, "morphology"));
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSInflectionRuleExplicit;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ { morphology = %@ }"), -[NSInflectionRuleExplicit description](&v3, sel_description), -[NSInflectionRuleExplicit morphology](self, "morphology"));
}

- (NSMorphology)morphology
{
  return (NSMorphology *)objc_getProperty(self, a2, 8, 1);
}

@end
