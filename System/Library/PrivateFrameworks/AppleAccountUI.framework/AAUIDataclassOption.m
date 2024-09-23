@implementation AAUIDataclassOption

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AAUIDataclassOption)initWithActions:(id)a3
{
  id v4;
  AAUIDataclassOption *v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AAUIDataclassOption;
  v5 = -[AAUIDataclassOption init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C8F2D0], "actionWithType:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "containsObject:", v6);

    objc_msgSend(MEMORY[0x1E0C8F2D0], "actionWithType:", 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "containsObject:", v8);

    v5->_editable = v7 & v9;
    v5->_enabled = v9 ^ 1;
  }

  return v5;
}

- (AAUIDataclassOption)initWithCoder:(id)a3
{
  id v4;
  AAUIDataclassOption *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AAUIDataclassOption;
  v5 = -[AAUIDataclassOption init](&v7, sel_init);
  if (v5)
  {
    v5->_editable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_editable"));
    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_enabled"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 editable;
  id v5;

  editable = self->_editable;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", editable, CFSTR("_editable"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enabled, CFSTR("_enabled"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enabled);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_editable);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>{ enabled: %@, editable: %@ }"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end
