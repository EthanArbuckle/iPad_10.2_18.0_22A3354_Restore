@implementation CHSFontSpecification

- (CHSFontSpecification)init
{
  CHSFontSpecification *v2;
  CHSFontSpecification *v3;
  NSString *name;
  NSNumber *size;
  NSNumber *weight;
  NSArray *fontFeatures;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CHSFontSpecification;
  v2 = -[CHSFontSpecification init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = 0;

    size = v3->_size;
    v3->_design = 0;
    v3->_size = 0;

    weight = v3->_weight;
    v3->_weight = 0;

    fontFeatures = v3->_fontFeatures;
    v3->_fontFeatures = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v3;
}

- (id)_initWithFontSpecification:(id)a3
{
  id *v4;
  CHSFontSpecification *v5;
  CHSFontSpecification *v6;

  v4 = (id *)a3;
  v5 = -[CHSFontSpecification init](self, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_name, v4[1]);
    v6->_design = (unint64_t)v4[2];
    objc_storeStrong((id *)&v6->_size, v4[3]);
    objc_storeStrong((id *)&v6->_weight, v4[4]);
    objc_storeStrong((id *)&v6->_fontFeatures, v4[5]);
  }

  return v6;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t);
  void *v11;
  id v12;
  CHSFontSpecification *v13;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __35__CHSFontSpecification_description__block_invoke;
  v11 = &unk_1E2A5A290;
  v4 = v3;
  v12 = v4;
  v13 = self;
  v5 = (id)objc_msgSend(v4, "modifyProem:", &v8);
  objc_msgSend(v4, "build", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

id __35__CHSFontSpecification_description__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const __CFString *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("name"), 1);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    if ((unint64_t)(v3 - 2) > 3)
      v4 = CFSTR("monospaced");
    else
      v4 = off_1E2A5B2F8[v3 - 2];
    objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", v4, CFSTR("design"));
    v2 = *(_QWORD *)(a1 + 40);
  }
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(v2 + 24), CFSTR("size"), 1);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("weight"), 1);
}

- (BOOL)isEqual:(id)a3
{
  CHSFontSpecification *v4;
  CHSFontSpecification *v5;
  char v6;

  v4 = (CHSFontSpecification *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (self->_design == v5->_design
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects())
      {
        v6 = BSEqualArrays();
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  NSArray *fontFeatures;
  id v9;
  unint64_t v10;
  _QWORD v12[4];
  id v13;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendString:", self->_name);
  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_design);
  -[NSNumber floatValue](self->_size, "floatValue");
  v6 = (id)objc_msgSend(v3, "appendFloat:");
  -[NSNumber floatValue](self->_weight, "floatValue");
  v7 = (id)objc_msgSend(v3, "appendFloat:");
  fontFeatures = self->_fontFeatures;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __28__CHSFontSpecification_hash__block_invoke;
  v12[3] = &unk_1E2A5B2D8;
  v9 = v3;
  v13 = v9;
  -[NSArray enumerateObjectsUsingBlock:](fontFeatures, "enumerateObjectsUsingBlock:", v12);
  v10 = objc_msgSend(v9, "hash");

  return v10;
}

void __28__CHSFontSpecification_hash__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:", objc_msgSend(v4, "hash"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CHSFontSpecification _initWithFontSpecification:]([CHSFontSpecification alloc], "_initWithFontSpecification:", self);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v4, "encodeUInt64:forKey:", self->_design, CFSTR("design"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_size, CFSTR("size"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_weight, CFSTR("weight"));
  objc_msgSend(v4, "encodeCollection:forKey:", self->_fontFeatures, CFSTR("fontFeatures"));

}

- (CHSFontSpecification)initWithBSXPCCoder:(id)a3
{
  id v4;
  CHSFontSpecification *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSNumber *size;
  uint64_t v10;
  NSNumber *weight;
  uint64_t v12;
  uint64_t v13;
  NSArray *fontFeatures;

  v4 = a3;
  v5 = -[CHSFontSpecification init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeStringForKey:", CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_design = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("design"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("size"));
    v8 = objc_claimAutoreleasedReturnValue();
    size = v5->_size;
    v5->_size = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("weight"));
    v10 = objc_claimAutoreleasedReturnValue();
    weight = v5->_weight;
    v5->_weight = (NSNumber *)v10;

    v12 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v12, objc_opt_class(), CFSTR("fontFeatures"));
    v13 = objc_claimAutoreleasedReturnValue();
    fontFeatures = v5->_fontFeatures;
    v5->_fontFeatures = (NSArray *)v13;

  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)design
{
  return self->_design;
}

- (void)setDesign:(unint64_t)a3
{
  self->_design = a3;
}

- (NSNumber)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)weight
{
  return self->_weight;
}

- (void)setWeight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)fontFeatures
{
  return self->_fontFeatures;
}

- (void)setFontFeatures:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontFeatures, 0);
  objc_storeStrong((id *)&self->_weight, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
