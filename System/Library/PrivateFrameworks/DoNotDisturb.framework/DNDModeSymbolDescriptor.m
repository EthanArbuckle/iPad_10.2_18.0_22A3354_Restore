@implementation DNDModeSymbolDescriptor

- (DNDModeSymbolDescriptor)initWithTintStyle:(unint64_t)a3 tintColorNames:(id)a4 imageName:(id)a5
{
  id v9;
  id v10;
  DNDModeSymbolDescriptor *v11;
  DNDModeSymbolDescriptor *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)DNDModeSymbolDescriptor;
  v11 = -[DNDModeSymbolDescriptor init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_tintStyle = a3;
    objc_storeStrong((id *)&v11->_tintColorNames, a4);
    objc_storeStrong((id *)&v12->_imageName, a5);
  }

  return v12;
}

- (NSString)primaryTintColorName
{
  void *v3;

  v3 = -[NSArray count](self->_tintColorNames, "count");
  if (v3)
  {
    -[NSArray firstObject](self->_tintColorNames, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[DNDModeSymbolDescriptor tintStyle](self, "tintStyle");
  -[DNDModeSymbolDescriptor tintColorNames](self, "tintColorNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[DNDModeSymbolDescriptor imageName](self, "imageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  DNDModeSymbolDescriptor *v4;
  DNDModeSymbolDescriptor *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = (DNDModeSymbolDescriptor *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[DNDModeSymbolDescriptor tintStyle](self, "tintStyle");
      if (v6 != -[DNDModeSymbolDescriptor tintStyle](v5, "tintStyle"))
      {
        v14 = 0;
LABEL_27:

        goto LABEL_28;
      }
      -[DNDModeSymbolDescriptor tintColorNames](self, "tintColorNames");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDModeSymbolDescriptor tintColorNames](v5, "tintColorNames");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[DNDModeSymbolDescriptor tintColorNames](self, "tintColorNames");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          v14 = 0;
LABEL_26:

          goto LABEL_27;
        }
        v10 = (void *)v9;
        -[DNDModeSymbolDescriptor tintColorNames](v5, "tintColorNames");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v14 = 0;
LABEL_25:

          goto LABEL_26;
        }
        -[DNDModeSymbolDescriptor tintColorNames](self, "tintColorNames");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDModeSymbolDescriptor tintColorNames](v5, "tintColorNames");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v12, "isEqual:", v13))
        {
          v14 = 0;
LABEL_24:

          goto LABEL_25;
        }
        v24 = v13;
        v25 = v12;
        v26 = v11;
        v27 = v10;
      }
      -[DNDModeSymbolDescriptor imageName](self, "imageName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDModeSymbolDescriptor imageName](v5, "imageName");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v15 == (void *)v16)
      {

        v14 = 1;
      }
      else
      {
        v17 = (void *)v16;
        -[DNDModeSymbolDescriptor imageName](self, "imageName");
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = (void *)v18;
          -[DNDModeSymbolDescriptor imageName](v5, "imageName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            -[DNDModeSymbolDescriptor imageName](self, "imageName");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDModeSymbolDescriptor imageName](v5, "imageName");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v23, "isEqual:", v21);

          }
          else
          {
            v14 = 0;
          }

        }
        else
        {

          v14 = 0;
        }
      }
      v11 = v26;
      v10 = v27;
      v13 = v24;
      v12 = v25;
      if (v7 == v8)
        goto LABEL_26;
      goto LABEL_24;
    }
    v14 = 0;
  }
LABEL_28:

  return v14;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[DNDModeSymbolDescriptor tintStyle](self, "tintStyle");
  -[DNDModeSymbolDescriptor tintColorNames](self, "tintColorNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDModeSymbolDescriptor imageName](self, "imageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; tintStyle: %lu; tintColorNames: %@; imageName: %@>"),
    v4,
    self,
    v5,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  DNDMutableModeSymbolDescriptor *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  DNDMutableModeSymbolDescriptor *v8;

  v4 = [DNDMutableModeSymbolDescriptor alloc];
  v5 = -[DNDModeSymbolDescriptor tintStyle](self, "tintStyle");
  -[DNDModeSymbolDescriptor tintColorNames](self, "tintColorNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDModeSymbolDescriptor imageName](self, "imageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[DNDMutableModeSymbolDescriptor initWithTintStyle:tintColorNames:imageName:](v4, "initWithTintStyle:tintColorNames:imageName:", v5, v6, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDModeSymbolDescriptor tintStyle](self, "tintStyle"), CFSTR("style"));
  -[DNDModeSymbolDescriptor tintColorNames](self, "tintColorNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("colors"));

  -[DNDModeSymbolDescriptor imageName](self, "imageName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("imageName"));

}

- (DNDModeSymbolDescriptor)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  DNDModeSymbolDescriptor *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style"));
  v6 = (void *)MEMORY[0x1E0C99E60];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("colors"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[DNDModeSymbolDescriptor initWithTintStyle:tintColorNames:imageName:](self, "initWithTintStyle:tintColorNames:imageName:", v5, v9, v10);
  return v11;
}

- (unint64_t)tintStyle
{
  return self->_tintStyle;
}

- (NSArray)tintColorNames
{
  return self->_tintColorNames;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_tintColorNames, 0);
}

@end
