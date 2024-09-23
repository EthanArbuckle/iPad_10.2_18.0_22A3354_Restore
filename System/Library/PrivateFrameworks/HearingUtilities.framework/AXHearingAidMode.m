@implementation AXHearingAidMode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXHearingAidMode)initWithCoder:(id)a3
{
  id v4;
  AXHearingAidMode *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXHearingAidMode;
  v5 = -[AXHearingAidMode init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXHearingAidMode setName:](v5, "setName:", v6);

    v5->_category = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("category"));
    v5->_index = objc_msgSend(v4, "decodeIntForKey:", CFSTR("index"));
    v5->_isSelected = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSelected"));
    v5->_ear = objc_msgSend(v4, "decodeIntForKey:", CFSTR("ear"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_category, CFSTR("category"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_index, CFSTR("index"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSelected, CFSTR("isSelected"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_ear, CFSTR("ear"));

}

- (AXHearingAidMode)initWithRepresentation:(id)a3
{
  id v4;
  AXHearingAidMode *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AXHearingAidMode;
  v5 = -[AXHearingAidMode init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXHearingAidMode setName:](v5, "setName:", v6);

    objc_msgSend(v4, "valueForKey:", CFSTR("category"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_category = objc_msgSend(v7, "integerValue");

    objc_msgSend(v4, "valueForKey:", CFSTR("index"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_index = objc_msgSend(v8, "intValue");

    objc_msgSend(v4, "valueForKey:", CFSTR("isSelected"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isSelected = objc_msgSend(v9, "BOOLValue");

    objc_msgSend(v4, "valueForKey:", CFSTR("ear"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_ear = objc_msgSend(v10, "intValue");

  }
  return v5;
}

- (id)transportRepresentation
{
  void *v3;
  NSString *name;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0C99D80];
  name = self->_name;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_category);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_index);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSelected);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_ear);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", name, CFSTR("name"), v5, CFSTR("category"), v6, CFSTR("index"), v7, CFSTR("isSelected"), v8, CFSTR("ear"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[AXHearingAidMode setName:](self, "setName:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AXHearingAidMode;
  -[AXHearingAidMode dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXHearingAidMode name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6)
      && (v7 = objc_msgSend(v4, "category"), v7 == -[AXHearingAidMode category](self, "category")))
    {
      v8 = objc_msgSend(v4, "index");
      v9 = v8 == -[AXHearingAidMode index](self, "index");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isStreamOrMixingStream
{
  return -[AXHearingAidMode isStream](self, "isStream") || -[AXHearingAidMode isMixingStream](self, "isMixingStream");
}

- (BOOL)isStream
{
  return -[AXHearingAidMode category](self, "category") > 199;
}

- (BOOL)isMixingStream
{
  return -[AXHearingAidMode category](self, "category") >= 100 && -[AXHearingAidMode category](self, "category") < 200;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)AXHearingAidMode;
  -[AXHearingAidMode description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidMode name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AXHearingAidMode isSelected](self, "isSelected"))
    v6 = CFSTR("selected");
  else
    v6 = CFSTR("not selected");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@ (%@) - %d: Category: %ld Ear: %d"), v4, v5, v6, -[AXHearingAidMode index](self, "index"), -[AXHearingAidMode category](self, "category"), -[AXHearingAidMode ear](self, "ear"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)category
{
  return self->_category;
}

- (void)setCategory:(int64_t)a3
{
  self->_category = a3;
}

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned __int8)a3
{
  self->_index = a3;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (int)ear
{
  return self->_ear;
}

- (void)setEar:(int)a3
{
  self->_ear = a3;
}

- (int)syncAttempts
{
  return self->syncAttempts;
}

- (void)setSyncAttempts:(int)a3
{
  self->syncAttempts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
