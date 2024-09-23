@implementation ASCArtwork

- (ASCArtwork)initWithURLTemplate:(id)a3 width:(double)a4 height:(double)a5 decoration:(id)a6 preferredCrop:(id)a7 preferredFormat:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  ASCArtwork *v18;
  uint64_t v19;
  id dataSource;
  uint64_t v21;
  NSString *decoration;
  uint64_t v23;
  NSString *preferredCrop;
  uint64_t v25;
  NSString *preferredFormat;
  objc_super v28;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v28.receiver = self;
  v28.super_class = (Class)ASCArtwork;
  v18 = -[ASCArtwork init](&v28, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    dataSource = v18->_dataSource;
    v18->_dataSource = (id)v19;

    v18->_width = a4;
    v18->_height = a5;
    v21 = objc_msgSend(v15, "copy");
    decoration = v18->_decoration;
    v18->_decoration = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    preferredCrop = v18->_preferredCrop;
    v18->_preferredCrop = (NSString *)v23;

    v25 = objc_msgSend(v17, "copy");
    preferredFormat = v18->_preferredFormat;
    v18->_preferredFormat = (NSString *)v25;

  }
  return v18;
}

- (ASCArtwork)initWithImage:(id)a3 decoration:(id)a4
{
  id v7;
  id v8;
  ASCArtwork *v9;
  ASCArtwork *v10;
  double v11;
  double v12;
  uint64_t v13;
  NSString *decoration;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ASCArtwork;
  v9 = -[ASCArtwork init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_dataSource, a3);
    objc_msgSend(v7, "size");
    v10->_width = v11;
    objc_msgSend(v7, "size");
    v10->_height = v12;
    v13 = objc_msgSend(v8, "copy");
    decoration = v10->_decoration;
    v10->_decoration = (NSString *)v13;

    objc_storeStrong((id *)&v10->_preferredCrop, CFSTR("bb"));
    objc_storeStrong((id *)&v10->_preferredFormat, CFSTR("png"));
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCArtwork)initWithCoder:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ASCArtwork *v12;
  ASCArtwork *v13;
  double v14;
  double v15;
  ASCArtwork *v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BOOL8 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  objc_super v50;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  v6 = objc_opt_class();
  v7 = (void *)objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("dataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("decoration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredCrop"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredFormat"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v50.receiver = self;
          v50.super_class = (Class)ASCArtwork;
          v12 = -[ASCArtwork init](&v50, sel_init);
          v13 = v12;
          if (v12)
          {
            objc_storeStrong(&v12->_dataSource, v8);
            objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("width"));
            v13->_width = v14;
            objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("height"));
            v13->_height = v15;
            v13->_isPortrait = v15 >= v13->_width;
            objc_storeStrong((id *)&v13->_decoration, v9);
            objc_storeStrong((id *)&v13->_preferredCrop, v10);
            objc_storeStrong((id *)&v13->_preferredFormat, v11);
          }
          self = v13;
          v16 = self;
        }
        else
        {
          v41 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          if (v41)
            -[ASCArtwork initWithCoder:].cold.4(v41, v42, v43, v44, v45, v46, v47, v48);
          v16 = 0;
        }

      }
      else
      {
        v33 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v33)
          -[ASCArtwork initWithCoder:].cold.3(v33, v34, v35, v36, v37, v38, v39, v40);
        v16 = 0;
      }

    }
    else
    {
      v25 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v25)
        -[ASCArtwork initWithCoder:].cold.2(v25, v26, v27, v28, v29, v30, v31, v32);
      v16 = 0;
    }

  }
  else
  {
    v17 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v17)
      -[ASCArtwork initWithCoder:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
    v16 = 0;
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[ASCArtwork dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dataSource"));

  -[ASCArtwork width](self, "width");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("width"));
  -[ASCArtwork height](self, "height");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("height"));
  -[ASCArtwork decoration](self, "decoration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("decoration"));

  -[ASCArtwork preferredCrop](self, "preferredCrop");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("preferredCrop"));

  -[ASCArtwork preferredFormat](self, "preferredFormat");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("preferredFormat"));

}

- (UIImage)embeddedImage
{
  void *v3;
  void *v4;
  UIImage *v5;

  objc_opt_class();
  -[ASCArtwork dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v4;
    else
      v3 = 0;
  }
  v5 = v3;

  return v5;
}

- (NSString)URLTemplate
{
  id v3;
  void *v4;
  id v5;
  __CFString *v6;

  objc_opt_class();
  -[ASCArtwork dataSource](self, "dataSource");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  if (v5)
    v6 = (__CFString *)objc_msgSend(v5, "copy");
  else
    v6 = CFSTR("<embedded image>");

  return (NSString *)v6;
}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCArtwork dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCArtwork width](self, "width");
  -[ASCHasher combineDouble:](v3, "combineDouble:");
  -[ASCArtwork height](self, "height");
  -[ASCHasher combineDouble:](v3, "combineDouble:");
  -[ASCArtwork decoration](self, "decoration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  -[ASCArtwork preferredCrop](self, "preferredCrop");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  -[ASCArtwork preferredFormat](self, "preferredFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  v8 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  ASCArtwork *v4;
  ASCArtwork *v5;
  ASCArtwork *v6;
  char v7;
  ASCArtwork *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v28;

  v4 = (ASCArtwork *)a3;
  if (self != v4)
  {
    objc_opt_class();
    v5 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v8 = v6;

    if (!v8)
    {
      v7 = 0;
LABEL_28:

      goto LABEL_29;
    }
    -[ASCArtwork dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCArtwork dataSource](v8, "dataSource");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9 && v10)
    {
      if (!objc_msgSend(v9, "isEqual:", v10))
        goto LABEL_26;
    }
    else if (v9 != (void *)v10)
    {
LABEL_26:
      v7 = 0;
LABEL_27:

      goto LABEL_28;
    }
    -[ASCArtwork width](self, "width");
    v13 = v12;
    -[ASCArtwork width](v8, "width");
    if (v13 != v14)
      goto LABEL_26;
    -[ASCArtwork height](self, "height");
    v16 = v15;
    -[ASCArtwork height](v8, "height");
    if (v16 != v17)
      goto LABEL_26;
    -[ASCArtwork decoration](self, "decoration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCArtwork decoration](v8, "decoration");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v18 && v19)
    {
      if (objc_msgSend(v18, "isEqual:", v19))
      {
LABEL_20:
        -[ASCArtwork preferredCrop](self, "preferredCrop");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCArtwork preferredCrop](v8, "preferredCrop");
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v22;
        if (v21 && v22)
        {
          if (objc_msgSend(v21, "isEqual:", v22))
            goto LABEL_23;
        }
        else if (v21 == (void *)v22)
        {
LABEL_23:
          -[ASCArtwork preferredFormat](self, "preferredFormat");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[ASCArtwork preferredFormat](v8, "preferredFormat");
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = (void *)v25;
          v28 = v24;
          if (v24 && v25)
            v7 = objc_msgSend(v24, "isEqual:", v25);
          else
            v7 = v24 == (void *)v25;

          goto LABEL_36;
        }
        v7 = 0;
LABEL_36:

        goto LABEL_37;
      }
    }
    else if (v18 == (void *)v19)
    {
      goto LABEL_20;
    }
    v7 = 0;
LABEL_37:

    goto LABEL_27;
  }
  v7 = 1;
LABEL_29:

  return v7;
}

- (id)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCArtwork URLTemplate](self, "URLTemplate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("URLTemplate"));

  -[ASCArtwork width](self, "width");
  -[ASCDescriber addDouble:withName:](v3, "addDouble:withName:", CFSTR("width"));
  -[ASCArtwork height](self, "height");
  -[ASCDescriber addDouble:withName:](v3, "addDouble:withName:", CFSTR("height"));
  -[ASCArtwork decoration](self, "decoration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("decoration"));

  -[ASCArtwork preferredCrop](self, "preferredCrop");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, CFSTR("preferredCrop"));

  -[ASCArtwork preferredFormat](self, "preferredFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v7, CFSTR("preferredFormat"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)makeURLWithSubstitutions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[ASCArtwork URLTemplate](self, "URLTemplate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__ASCArtwork_makeURLWithSubstitutions___block_invoke;
  v10[3] = &unk_1E7560660;
  v11 = v6;
  v7 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10);

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __39__ASCArtwork_makeURLWithSubstitutions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", v6, v5, 0, 0, objc_msgSend(v4, "length"));

}

- (double)width
{
  return self->_width;
}

- (double)height
{
  return self->_height;
}

- (BOOL)isPortrait
{
  return self->_isPortrait;
}

- (NSString)decoration
{
  return self->_decoration;
}

- (NSString)preferredCrop
{
  return self->_preferredCrop;
}

- (NSString)preferredFormat
{
  return self->_preferredFormat;
}

- (id)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_preferredFormat, 0);
  objc_storeStrong((id *)&self->_preferredCrop, 0);
  objc_storeStrong((id *)&self->_decoration, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCArtwork because dataSource was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCArtwork because decoration was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCArtwork because preferredCrop was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCArtwork because preferredFormat was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
