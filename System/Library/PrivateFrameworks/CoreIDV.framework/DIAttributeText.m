@implementation DIAttributeText

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DIAttributeText;
  v4 = a3;
  -[DIAttribute encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_minLength, CFSTR("minLength"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_maxLength, CFSTR("maxLength"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isSecureText, CFSTR("isSecureText"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isSecureVisibleText, CFSTR("isSecureVisibleText"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isNumeric, CFSTR("isNumeric"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_luhnCheck, CFSTR("useLuhnCheck"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayFormatPlaceholder, CFSTR("displayFormatPlaceHolder"));

  os_unfair_lock_unlock(&self->super._lock);
}

- (DIAttributeText)initWithCoder:(id)a3
{
  id v4;
  DIAttributeText *v5;
  uint64_t v6;
  NSString *displayFormatPlaceholder;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DIAttributeText;
  v5 = -[DIAttribute initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_minLength = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minLength"));
    v5->_maxLength = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxLength"));
    v5->_isSecureText = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSecureText"));
    v5->_isSecureVisibleText = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSecureVisibleText"));
    v5->_isNumeric = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isNumeric"));
    v5->_luhnCheck = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useLuhnCheck"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayFormatPlaceHolder"));
    v6 = objc_claimAutoreleasedReturnValue();
    displayFormatPlaceholder = v5->_displayFormatPlaceholder;
    v5->_displayFormatPlaceholder = (NSString *)v6;

  }
  return v5;
}

- (DIAttributeText)init
{
  DIAttributeText *v2;
  DIAttributeText *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DIAttributeText;
  v2 = -[DIAttribute init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[DIAttribute setAttributeType:](v2, "setAttributeType:", 1);
    v3->_minLength = 0;
    v3->_maxLength = 0;
    v3->_isSecureText = 0;
    v3->_isSecureVisibleText = 0;
    v3->_isNumeric = 0;
    v3->_luhnCheck = 0;
  }
  return v3;
}

- (void)setCurrentValue:(id)a3
{
  void *v4;
  objc_super v5;
  objc_super v6;

  if (a3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:");
    v6.receiver = self;
    v6.super_class = (Class)DIAttributeText;
    -[DIAttribute setCurrentValue:](&v6, sel_setCurrentValue_, v4);

  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)DIAttributeText;
    -[DIAttribute setCurrentValue:](&v5, sel_setCurrentValue_);
  }
}

- (void)setDefaultValue:(id)a3
{
  void *v4;
  objc_super v5;
  objc_super v6;

  if (a3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:");
    v6.receiver = self;
    v6.super_class = (Class)DIAttributeText;
    -[DIAttribute setDefaultValue:](&v6, sel_setDefaultValue_, v4);

  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)DIAttributeText;
    -[DIAttribute setDefaultValue:](&v5, sel_setDefaultValue_);
  }
}

- (void)setMinLength:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_minLength = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setMaxLength:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_maxLength = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setIsSecureText:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_isSecureText = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setIsSecureVisibleText:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_isSecureVisibleText = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setIsNumeric:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_isNumeric = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setLuhnCheck:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_luhnCheck = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setDisplayFormatPlaceholder:(id)a3
{
  NSString *v4;
  NSString *displayFormatPlaceholder;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->super._lock);
  if (self->_displayFormatPlaceholder != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    displayFormatPlaceholder = self->_displayFormatPlaceholder;
    self->_displayFormatPlaceholder = v4;

  }
  os_unfair_lock_unlock(&self->super._lock);

}

- (NSString)getCurrentValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeText;
  -[DIAttribute getCurrentValue](&v3, sel_getCurrentValue);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)defaultValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeText;
  -[DIAttribute defaultValue](&v3, sel_defaultValue);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)minLength
{
  os_unfair_lock_s *p_lock;
  unint64_t minLength;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  minLength = self->_minLength;
  os_unfair_lock_unlock(p_lock);
  return minLength;
}

- (unint64_t)maxLength
{
  os_unfair_lock_s *p_lock;
  unint64_t maxLength;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  maxLength = self->_maxLength;
  os_unfair_lock_unlock(p_lock);
  return maxLength;
}

- (BOOL)isSecureText
{
  DIAttributeText *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  LOBYTE(v2) = v2->_isSecureText;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isSecureVisibleText
{
  DIAttributeText *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  LOBYTE(v2) = v2->_isSecureVisibleText;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isNumeric
{
  DIAttributeText *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  LOBYTE(v2) = v2->_isNumeric;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)useLuhnCheck
{
  DIAttributeText *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  LOBYTE(v2) = v2->_luhnCheck;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSString)displayFormatPlaceholder
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  v4 = self->_displayFormatPlaceholder;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  _BOOL4 isSecureText;
  void *v11;
  void *v12;
  objc_super v13;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", &stru_24C2D5A40);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)DIAttributeText;
  -[DIAttribute description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v4);

  os_unfair_lock_lock(&self->super._lock);
  if (self->_isNumeric)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("isNumeric: '%@'; "), v5);
  if (self->_isSecureVisibleText)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("isSecureVisibleText: '%@'; "), v6);
  if (self->_isSecureText)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("isSecureText: '%@'; "), v7);
  objc_msgSend(v3, "appendFormat:", CFSTR("maxLength: '%lu'; "), self->_maxLength);
  objc_msgSend(v3, "appendFormat:", CFSTR("minLength: '%lu'; "), self->_minLength);
  if (self->_luhnCheck)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("luhnCheck: '%@'; "), v8);
  if (self->_isSecureVisibleText)
  {
    os_unfair_lock_unlock(&self->super._lock);
  }
  else
  {
    isSecureText = self->_isSecureText;
    os_unfair_lock_unlock(&self->super._lock);
    if (!isSecureText)
    {
      -[DIAttributeText defaultValue](self, "defaultValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("defaultValue: '%@'; "), v11);

      -[DIAttributeText getCurrentValue](self, "getCurrentValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("currentValue: '%@'; "), v12);

      goto LABEL_17;
    }
  }
  objc_msgSend(v3, "appendString:", CFSTR("defaultValue: '[REDACTED]'; "));
  objc_msgSend(v3, "appendString:", CFSTR("currentValue: '[REDACTED]'; "));
LABEL_17:
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)displayFormatPaddingCharacters
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIAttributeText displayFormatPlaceholder](self, "displayFormatPlaceholder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5 == 1)
  {
    -[DIAttribute displayFormat](self, "displayFormat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      do
      {
        objc_msgSend(v6, "substringToIndex:", 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[DIAttributeText displayFormatPlaceholder](self, "displayFormatPlaceholder");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "isEqualToString:", v8) & 1) != 0)
        {

        }
        else
        {
          v9 = objc_msgSend(v3, "containsObject:", v7);

          if ((v9 & 1) == 0)
            objc_msgSend(v3, "addObject:", v7);
        }
        objc_msgSend(v6, "substringFromIndex:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = v10;
      }
      while (objc_msgSend(v10, "length"));
    }
    else
    {
      v10 = v6;
    }

  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = objc_msgSend(&unk_24C2DD700, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(&unk_24C2DD700);
          v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          -[DIAttribute displayFormat](self, "displayFormat");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "containsString:", v15);

          if (v17)
            objc_msgSend(v3, "addObject:", v15);
        }
        v12 = objc_msgSend(&unk_24C2DD700, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v12);
    }
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)submissionString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[DIAttributeText getCurrentValue](self, "getCurrentValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DIAttribute displayFormat](self, "displayFormat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      -[DIAttributeText displayFormatPaddingCharacters](self, "displayFormatPaddingCharacters", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v16;
        do
        {
          v11 = 0;
          v12 = v5;
          do
          {
            if (*(_QWORD *)v16 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), &stru_24C2D5A40);
            v5 = (void *)objc_claimAutoreleasedReturnValue();

            ++v11;
            v12 = v5;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:", v13);
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayFormatPlaceholder, 0);
}

@end
