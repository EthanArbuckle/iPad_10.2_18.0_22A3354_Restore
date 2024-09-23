@implementation MSMessageLiveLayout

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSMessageLiveLayout)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is unavailable. Please use -initWithAlternateLayout: instead."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (MSMessageLiveLayout)initWithAlternateLayout:(MSMessageTemplateLayout *)alternateLayout
{
  MSMessageTemplateLayout *v5;
  MSMessageTemplateLayout *v6;
  id *v7;
  MSMessageLiveLayout *v8;
  id v10;
  objc_super v11;

  v5 = alternateLayout;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("An alternate layout is required for display on devices that don't have this app installed."), 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  v6 = v5;
  v11.receiver = self;
  v11.super_class = (Class)MSMessageLiveLayout;
  v7 = -[MSMessageLayout _init](&v11, sel__init);
  v8 = (MSMessageLiveLayout *)v7;
  if (v7)
    objc_storeStrong(v7 + 2, alternateLayout);

  return v8;
}

- (MSMessageLiveLayout)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  MSMessageLiveLayout *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("alternateLayout"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MSMessageLiveLayout initWithAlternateLayout:](self, "initWithAlternateLayout:", v8);
  v10 = (void *)MEMORY[0x1E0C99E60];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v12, CFSTR("requiredCapabilities"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[MSMessageLiveLayout setRequiredCapabilities:](v9, "setRequiredCapabilities:", v13);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  MSMessageTemplateLayout *alternateLayout;
  id v5;

  alternateLayout = self->_alternateLayout;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", alternateLayout, CFSTR("alternateLayout"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requiredCapabilities, CFSTR("requiredCapabilities"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  MSMessageLiveLayout *v6;
  void *v7;

  v5 = -[MSMessageTemplateLayout copyWithZone:](self->_alternateLayout, "copyWithZone:");
  v6 = -[MSMessageLiveLayout initWithAlternateLayout:](+[MSMessageLiveLayout allocWithZone:](MSMessageLiveLayout, "allocWithZone:", a3), "initWithAlternateLayout:", v5);
  -[MSMessageLiveLayout requiredCapabilities](self, "requiredCapabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSMessageLiveLayout setRequiredCapabilities:](v6, "setRequiredCapabilities:", v7);

  return v6;
}

- (id)_sanitizedCopy
{
  MSMessageLiveLayout *v3;
  void *v4;
  void *v5;
  MSMessageLiveLayout *v6;
  void *v7;

  v3 = [MSMessageLiveLayout alloc];
  -[MSMessageLiveLayout alternateLayout](self, "alternateLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_sanitizedCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MSMessageLiveLayout initWithAlternateLayout:](v3, "initWithAlternateLayout:", v5);

  -[MSMessageLiveLayout requiredCapabilities](self, "requiredCapabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSMessageLiveLayout setRequiredCapabilities:](v6, "setRequiredCapabilities:", v7);

  return v6;
}

- (NSArray)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (void)setRequiredCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_requiredCapabilities, a3);
}

- (MSMessageTemplateLayout)alternateLayout
{
  return self->_alternateLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateLayout, 0);
  objc_storeStrong((id *)&self->_requiredCapabilities, 0);
}

@end
