@implementation SCNProgramSemanticInfo

+ (id)infoWithSemantic:(id)a3 options:(id)a4
{
  id v6;

  v6 = objc_alloc_init((Class)a1);
  objc_msgSend(v6, "setSemantic:", a3);
  objc_msgSend(v6, "setOptions:", a4);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[SCNProgramSemanticInfo semantic](self, "semantic"), CFSTR("semantic"));
  objc_msgSend(a3, "encodeObject:forKey:", -[SCNProgramSemanticInfo options](self, "options"), CFSTR("options"));
}

- (SCNProgramSemanticInfo)initWithCoder:(id)a3
{
  SCNProgramSemanticInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCNProgramSemanticInfo;
  v4 = -[SCNProgramSemanticInfo init](&v6, sel_init);
  if (v4)
  {
    -[SCNProgramSemanticInfo setSemantic:](v4, "setSemantic:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("semantic")));
    -[SCNProgramSemanticInfo setOptions:](v4, "setOptions:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("options")));
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNProgramSemanticInfo;
  -[SCNProgramSemanticInfo dealloc](&v3, sel_dealloc);
}

- (NSString)semantic
{
  return self->_semantic;
}

- (void)setSemantic:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
