@implementation DIAttributeLabel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  objc_super v6;

  p_lock = &self->super._lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend(v5, "encodeObject:forKey:", self->_buttonTitle, CFSTR("buttonTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detailTitle, CFSTR("detailTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detailSubtitle, CFSTR("detailSubtitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detailBody, CFSTR("detailBody"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_businessChatButtonTitle, CFSTR("businessChatButtonTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_businessChatIdentifier, CFSTR("businessChatIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_businessChatIntentName, CFSTR("businessChatIntentName"));
  os_unfair_lock_unlock(p_lock);
  v6.receiver = self;
  v6.super_class = (Class)DIAttributeLabel;
  -[DIAttribute encodeWithCoder:](&v6, sel_encodeWithCoder_, v5);

}

- (DIAttributeLabel)initWithCoder:(id)a3
{
  id v4;
  DIAttributeLabel *v5;
  uint64_t v6;
  NSString *buttonTitle;
  uint64_t v8;
  NSString *detailTitle;
  uint64_t v10;
  NSString *detailSubtitle;
  uint64_t v12;
  NSString *detailBody;
  uint64_t v14;
  NSString *businessChatButtonTitle;
  uint64_t v16;
  NSString *businessChatIdentifier;
  uint64_t v18;
  NSString *businessChatIntentName;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)DIAttributeLabel;
  v5 = -[DIAttribute initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buttonTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    buttonTitle = v5->_buttonTitle;
    v5->_buttonTitle = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("detailTitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    detailTitle = v5->_detailTitle;
    v5->_detailTitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("detailSubtitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    detailSubtitle = v5->_detailSubtitle;
    v5->_detailSubtitle = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buttonTitle"));
    v12 = objc_claimAutoreleasedReturnValue();
    detailBody = v5->_detailBody;
    v5->_detailBody = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("businessChatButtonTitle"));
    v14 = objc_claimAutoreleasedReturnValue();
    businessChatButtonTitle = v5->_businessChatButtonTitle;
    v5->_businessChatButtonTitle = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("businessChatIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    businessChatIdentifier = v5->_businessChatIdentifier;
    v5->_businessChatIdentifier = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("businessChatIntentName"));
    v18 = objc_claimAutoreleasedReturnValue();
    businessChatIntentName = v5->_businessChatIntentName;
    v5->_businessChatIntentName = (NSString *)v18;

  }
  return v5;
}

- (DIAttributeLabel)init
{
  DIAttributeLabel *v2;
  DIAttributeLabel *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DIAttributeLabel;
  v2 = -[DIAttribute init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[DIAttribute setAttributeType:](v2, "setAttributeType:", 6);
  return v3;
}

- (void)setDefaultValue:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeLabel;
  -[DIAttribute setDefaultValue:](&v3, sel_setDefaultValue_, a3);
}

- (void)setButtonTitle:(id)a3
{
  NSString *v4;
  NSString *buttonTitle;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->super._lock);
  if (self->_buttonTitle != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    buttonTitle = self->_buttonTitle;
    self->_buttonTitle = v4;

  }
  os_unfair_lock_unlock(&self->super._lock);

}

- (void)setDetailTitle:(id)a3
{
  NSString *v4;
  NSString *detailTitle;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->super._lock);
  if (self->_detailTitle != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    detailTitle = self->_detailTitle;
    self->_detailTitle = v4;

  }
  os_unfair_lock_unlock(&self->super._lock);

}

- (void)setDetailSubtitle:(id)a3
{
  NSString *v4;
  NSString *detailSubtitle;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->super._lock);
  if (self->_detailSubtitle != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    detailSubtitle = self->_detailSubtitle;
    self->_detailSubtitle = v4;

  }
  os_unfair_lock_unlock(&self->super._lock);

}

- (void)setDetailBody:(id)a3
{
  NSString *v4;
  NSString *detailBody;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->super._lock);
  if (self->_detailBody != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    detailBody = self->_detailBody;
    self->_detailBody = v4;

  }
  os_unfair_lock_unlock(&self->super._lock);

}

- (void)setBusinessChatButtonTitle:(id)a3
{
  NSString *v4;
  NSString *businessChatButtonTitle;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->super._lock);
  if (self->_businessChatButtonTitle != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    businessChatButtonTitle = self->_businessChatButtonTitle;
    self->_businessChatButtonTitle = v4;

  }
  os_unfair_lock_unlock(&self->super._lock);

}

- (void)setBusinessChatIdentifier:(id)a3
{
  NSString *v4;
  NSString *businessChatIdentifier;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->super._lock);
  if (self->_businessChatIdentifier != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    businessChatIdentifier = self->_businessChatIdentifier;
    self->_businessChatIdentifier = v4;

  }
  os_unfair_lock_unlock(&self->super._lock);

}

- (void)setBusinessChatIntentName:(id)a3
{
  NSString *v4;
  NSString *businessChatIntentName;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->super._lock);
  if (self->_businessChatIntentName != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    businessChatIntentName = self->_businessChatIntentName;
    self->_businessChatIntentName = v4;

  }
  os_unfair_lock_unlock(&self->super._lock);

}

- (NSString)defaultValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeLabel;
  -[DIAttribute defaultValue](&v3, sel_defaultValue);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)buttonTitle
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  v4 = self->_buttonTitle;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)detailTitle
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  v4 = self->_detailTitle;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)detailSubtitle
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  v4 = self->_detailSubtitle;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)detailBody
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  v4 = self->_detailBody;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)businessChatButtonTitle
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  v4 = self->_businessChatButtonTitle;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)businessChatIdentifier
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  v4 = self->_businessChatIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)businessChatIntentName
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  v4 = self->_businessChatIntentName;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)DIAttributeLabel;
  -[DIAttribute description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v4);

  -[DIAttributeLabel defaultValue](self, "defaultValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("defaultValue: '%@'; "), v5);

  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend(v3, "appendFormat:", CFSTR("buttonTitle: '%@'; "), self->_buttonTitle);
  objc_msgSend(v3, "appendFormat:", CFSTR("detailTitle: '%@'; "), self->_detailTitle);
  objc_msgSend(v3, "appendFormat:", CFSTR("detailSubtitle: '%@'; "), self->_detailSubtitle);
  objc_msgSend(v3, "appendFormat:", CFSTR("detailBody: '%@'; "), self->_detailBody);
  objc_msgSend(v3, "appendFormat:", CFSTR("businessChatButtonTitle: '%@'; "), self->_businessChatButtonTitle);
  objc_msgSend(v3, "appendFormat:", CFSTR("businessChatIdentifier: '%@'; "), self->_businessChatIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("businessChatIntentName: '%@'; "), self->_businessChatIntentName);
  os_unfair_lock_unlock(&self->super._lock);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessChatIntentName, 0);
  objc_storeStrong((id *)&self->_businessChatIdentifier, 0);
  objc_storeStrong((id *)&self->_businessChatButtonTitle, 0);
  objc_storeStrong((id *)&self->_detailBody, 0);
  objc_storeStrong((id *)&self->_detailSubtitle, 0);
  objc_storeStrong((id *)&self->_detailTitle, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
}

@end
