@implementation AXSSMotionTrackingVideoFileInput

+ (id)videoFileInputWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:", v5);
  else
    v6 = 0;

  return v6;
}

- (AXSSMotionTrackingVideoFileInput)initWithName:(id)a3
{
  id v4;
  AXSSMotionTrackingVideoFileInput *v5;
  uint64_t v6;
  NSString *name;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXSSMotionTrackingVideoFileInput;
  v5 = -[AXSSMotionTrackingInput init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->__name;
    v5->__name = (NSString *)v6;

  }
  return v5;
}

- (NSString)name
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[AXSSMotionTrackingVideoFileInput _name](self, "_name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (Test Video File)"), v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return (NSString *)v5;
}

- (unint64_t)trackingType
{
  return 1;
}

- (BOOL)isVideoFile
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AXSSMotionTrackingVideoFileInput name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AXSSMotionTrackingVideoFileInput _name](self, "_name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_name);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encodeObject:forKey:", v5, v6);

  }
}

- (AXSSMotionTrackingVideoFileInput)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  AXSSMotionTrackingVideoFileInput *v8;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && objc_msgSend(v7, "length"))
    v8 = (AXSSMotionTrackingVideoFileInput *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:", v7);
  else
    v8 = 0;

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)AXSSMotionTrackingVideoFileInput;
  -[AXSSMotionTrackingVideoFileInput description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSMotionTrackingVideoFileInput _name](self, "_name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)supportsExpressions
{
  return 1;
}

- (id)plistDictionary
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)AXSSMotionTrackingVideoFileInput;
  -[AXSSMotionTrackingInput plistDictionary](&v13, sel_plistDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    objc_msgSend(v3, "addEntriesFromDictionary:", v4);
  -[AXSSMotionTrackingVideoFileInput _name](self, "_name");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[AXSSMotionTrackingVideoFileInput _name](self, "_name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      -[AXSSMotionTrackingVideoFileInput _name](self, "_name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_name);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v10);

    }
  }
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

- (AXSSMotionTrackingVideoFileInput)initWithPlistDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AXSSMotionTrackingVideoFileInput *v7;

  v4 = a3;
  NSStringFromSelector(sel_name);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "length"))
  {
    self = -[AXSSMotionTrackingVideoFileInput initWithName:](self, "initWithName:", v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)_name
{
  return self->__name;
}

- (void)set_name:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__name, 0);
}

@end
