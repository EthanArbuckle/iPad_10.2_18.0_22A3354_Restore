@implementation ATXWatchFace

- (ATXWatchFace)initWithStyle:(int64_t)a3 complications:(id)a4 selected:(BOOL)a5
{
  id v9;
  ATXWatchFace *v10;
  ATXWatchFace *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ATXWatchFace;
  v10 = -[ATXWatchFace init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_style = a3;
    objc_storeStrong((id *)&v10->_complications, a4);
    v11->_selected = a5;
  }

  return v11;
}

- (id)description
{
  void *v3;
  int64_t v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[ATXWatchFace style](self, "style");
  -[ATXWatchFace complications](self, "complications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXWatchFace isSelected](self, "isSelected");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ATXWatchFace: style: %ld, complications: %@, selected: %@"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXWatchFace)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  ATXWatchFace *v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style"));
  v6 = (void *)MEMORY[0x1A85A4F90]();
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = (void *)objc_msgSend(v7, "initWithObjects:", v8, v9, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("complications"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_pas_filteredArrayWithTest:", &__block_literal_global_57);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("selected"));
  if (v12)
    v14 = v12;
  else
    v14 = (void *)MEMORY[0x1E0C9AA60];
  v15 = -[ATXWatchFace initWithStyle:complications:selected:](self, "initWithStyle:complications:selected:", v5, v14, v13);

  return v15;
}

uint64_t __30__ATXWatchFace_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[ATXWatchFace style](self, "style"), CFSTR("style"));
  -[ATXWatchFace complications](self, "complications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("complications"));

  objc_msgSend(v5, "encodeBool:forKey:", -[ATXWatchFace isSelected](self, "isSelected"), CFSTR("selected"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[ATXWatchFace style](self, "style");
  -[ATXWatchFace complications](self, "complications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithStyle:complications:selected:", v5, v6, -[ATXWatchFace isSelected](self, "isSelected"));

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  ATXWatchFace *v4;
  ATXWatchFace *v5;
  BOOL v6;

  v4 = (ATXWatchFace *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXWatchFace isEqualToATXWatchFace:](self, "isEqualToATXWatchFace:", v5);

  return v6;
}

- (BOOL)isEqualToATXWatchFace:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  NSArray *complications;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  char v10;
  BOOL v11;

  v4 = a3;
  v5 = (unsigned __int8 *)v4;
  if (self->_style != *((_QWORD *)v4 + 2))
    goto LABEL_4;
  complications = self->_complications;
  v7 = (NSArray *)*((id *)v4 + 3);
  if (complications == v7)
  {

    goto LABEL_6;
  }
  v8 = v7;
  v9 = complications;
  v10 = -[NSArray isEqual:](v9, "isEqual:", v8);

  if ((v10 & 1) != 0)
  {
LABEL_6:
    v11 = self->_selected == v5[8];
    goto LABEL_7;
  }
LABEL_4:
  v11 = 0;
LABEL_7:

  return v11;
}

- (unint64_t)hash
{
  int64_t style;
  uint64_t v4;

  style = self->_style;
  v4 = -[NSArray hash](self->_complications, "hash");
  return self->_selected - (v4 - style + 32 * style) + 32 * (v4 - style + 32 * style);
}

- (int64_t)style
{
  return self->_style;
}

- (NSArray)complications
{
  return self->_complications;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complications, 0);
}

@end
