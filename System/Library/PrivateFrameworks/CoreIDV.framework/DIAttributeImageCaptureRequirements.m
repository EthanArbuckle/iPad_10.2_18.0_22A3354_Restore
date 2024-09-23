@implementation DIAttributeImageCaptureRequirements

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_selection, CFSTR("selection"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_minHeight, CFSTR("minHeight"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_minWidth, CFSTR("minWidth"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_preferredHeight, CFSTR("preferredHeight"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_preferredWidth, CFSTR("preferredWidth"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_ratioHeight, CFSTR("ratioHeight"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_ratioWidth, CFSTR("ratioWidth"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_minBorderPadding, CFSTR("minBorderPadding"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedEncoding, CFSTR("supportedEncoding"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userMessage, CFSTR("userMessage"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_liveliness, CFSTR("liveliness"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_timeout, CFSTR("timeout"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maxRetakeCount, CFSTR("maxRetakeCount"));

  os_unfair_lock_unlock(p_lock);
}

- (DIAttributeImageCaptureRequirements)initWithCoder:(id)a3
{
  id v4;
  DIAttributeImageCaptureRequirements *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *supportedEncoding;
  uint64_t v11;
  NSString *userMessage;

  v4 = a3;
  v5 = -[DIAttributeImageCaptureRequirements init](self, "init");
  if (v5)
  {
    v5->_selection = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("selection"));
    v5->_minHeight = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minHeight"));
    v5->_minWidth = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minWidth"));
    v5->_preferredHeight = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preferredHeight"));
    v5->_preferredWidth = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preferredWidth"));
    v5->_ratioHeight = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ratioHeight"));
    v5->_ratioWidth = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ratioWidth"));
    v5->_minBorderPadding = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minBorderPadding"));
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("supportedEncoding"));
    v9 = objc_claimAutoreleasedReturnValue();
    supportedEncoding = v5->_supportedEncoding;
    v5->_supportedEncoding = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userMessage"));
    v11 = objc_claimAutoreleasedReturnValue();
    userMessage = v5->_userMessage;
    v5->_userMessage = (NSString *)v11;

    v5->_liveliness = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("liveliness"));
    v5->_timeout = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("timeout"));
    v5->_maxRetakeCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxRetakeCount"));
  }

  return v5;
}

- (DIAttributeImageCaptureRequirements)initWithImageCaptureRequirements:(id)a3
{
  id v4;
  DIAttributeImageCaptureRequirements *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSArray *supportedEncoding;
  uint64_t v10;
  NSString *userMessage;

  v4 = a3;
  v5 = -[DIAttributeImageCaptureRequirements init](self, "init");
  if (v5)
  {
    v5->_selection = objc_msgSend(v4, "selection");
    v5->_minHeight = objc_msgSend(v4, "minHeight");
    v5->_minWidth = objc_msgSend(v4, "minWidth");
    v5->_preferredHeight = objc_msgSend(v4, "preferredHeight");
    v5->_preferredWidth = objc_msgSend(v4, "preferredWidth");
    v5->_ratioHeight = objc_msgSend(v4, "ratioHeight");
    v5->_ratioWidth = objc_msgSend(v4, "ratioWidth");
    v5->_minBorderPadding = objc_msgSend(v4, "minBorderPadding");
    v6 = objc_alloc(MEMORY[0x24BDBCE30]);
    objc_msgSend(v4, "supportedEncoding");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithArray:copyItems:", v7, 1);
    supportedEncoding = v5->_supportedEncoding;
    v5->_supportedEncoding = (NSArray *)v8;

    objc_msgSend(v4, "userMessage");
    v10 = objc_claimAutoreleasedReturnValue();
    userMessage = v5->_userMessage;
    v5->_userMessage = (NSString *)v10;

    v5->_liveliness = objc_msgSend(v4, "liveliness");
    v5->_timeout = objc_msgSend(v4, "timeout");
    v5->_maxRetakeCount = objc_msgSend(v4, "maxRetakeCount");
  }

  return v5;
}

- (DIAttributeImageCaptureRequirements)init
{
  DIAttributeImageCaptureRequirements *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeImageCaptureRequirements;
  result = -[DIAttributeImageCaptureRequirements init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)setSelection:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_selection = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setMinHeight:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_minHeight = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setMinWidth:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_minWidth = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setPreferredHeight:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_preferredHeight = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setPreferredWidth:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_preferredWidth = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setRatioHeight:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_ratioHeight = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setRatioWidth:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_ratioWidth = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setMinBorderPadding:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_minBorderPadding = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setCompressionRatio:(id)a3
{
  NSNumber *v4;
  NSNumber *compressionRatio;
  NSNumber *v6;

  v6 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_compressionRatio != v6)
  {
    v4 = (NSNumber *)-[NSNumber copyWithZone:](v6, "copyWithZone:", 0);
    compressionRatio = self->_compressionRatio;
    self->_compressionRatio = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setMaximumCompressionRatio:(id)a3
{
  NSNumber *v4;
  NSNumber *maximumCompressionRatio;
  NSNumber *v6;

  v6 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_maximumCompressionRatio != v6)
  {
    v4 = (NSNumber *)-[NSNumber copyWithZone:](v6, "copyWithZone:", 0);
    maximumCompressionRatio = self->_maximumCompressionRatio;
    self->_maximumCompressionRatio = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setUserMessage:(id)a3
{
  NSString *v4;
  NSString *userMessage;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_userMessage != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    userMessage = self->_userMessage;
    self->_userMessage = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setSupportedEncoding:(id)a3
{
  NSArray *v4;
  NSArray *supportedEncoding;
  NSArray *v6;

  v6 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_supportedEncoding != v6)
  {
    v4 = (NSArray *)-[NSArray copyWithZone:](v6, "copyWithZone:", 0);
    supportedEncoding = self->_supportedEncoding;
    self->_supportedEncoding = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setLiveliness:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_liveliness = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setTimeout:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_timeout = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setMaxRetakeCount:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_maxRetakeCount = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)selection
{
  os_unfair_lock_s *p_lock;
  unint64_t selection;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  selection = self->_selection;
  os_unfair_lock_unlock(p_lock);
  return selection;
}

- (unint64_t)minHeight
{
  os_unfair_lock_s *p_lock;
  unint64_t minHeight;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  minHeight = self->_minHeight;
  os_unfair_lock_unlock(p_lock);
  return minHeight;
}

- (unint64_t)minWidth
{
  os_unfair_lock_s *p_lock;
  unint64_t minWidth;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  minWidth = self->_minWidth;
  os_unfair_lock_unlock(p_lock);
  return minWidth;
}

- (unint64_t)preferredHeight
{
  os_unfair_lock_s *p_lock;
  unint64_t preferredHeight;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  preferredHeight = self->_preferredHeight;
  os_unfair_lock_unlock(p_lock);
  return preferredHeight;
}

- (unint64_t)preferredWidth
{
  os_unfair_lock_s *p_lock;
  unint64_t preferredWidth;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  preferredWidth = self->_preferredWidth;
  os_unfair_lock_unlock(p_lock);
  return preferredWidth;
}

- (unint64_t)ratioHeight
{
  os_unfair_lock_s *p_lock;
  unint64_t ratioHeight;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  ratioHeight = self->_ratioHeight;
  os_unfair_lock_unlock(p_lock);
  return ratioHeight;
}

- (unint64_t)ratioWidth
{
  os_unfair_lock_s *p_lock;
  unint64_t ratioWidth;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  ratioWidth = self->_ratioWidth;
  os_unfair_lock_unlock(p_lock);
  return ratioWidth;
}

- (unint64_t)minBorderPadding
{
  os_unfair_lock_s *p_lock;
  unint64_t minBorderPadding;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  minBorderPadding = self->_minBorderPadding;
  os_unfair_lock_unlock(p_lock);
  return minBorderPadding;
}

- (NSNumber)compressionRatio
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_compressionRatio;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSNumber)maximumCompressionRatio
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_maximumCompressionRatio;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)userMessage
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_userMessage;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)supportedEncoding
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_supportedEncoding;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)liveliness
{
  DIAttributeImageCaptureRequirements *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_liveliness;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)timeout
{
  os_unfair_lock_s *p_lock;
  unint64_t timeout;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  timeout = self->_timeout;
  os_unfair_lock_unlock(p_lock);
  return timeout;
}

- (unint64_t)maxRetakeCount
{
  os_unfair_lock_s *p_lock;
  unint64_t maxRetakeCount;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  maxRetakeCount = self->_maxRetakeCount;
  os_unfair_lock_unlock(p_lock);
  return maxRetakeCount;
}

- (id)description
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v3, "appendFormat:", CFSTR("selection: '%lu'; "), self->_selection);
  objc_msgSend(v3, "appendFormat:", CFSTR("minHeight: '%lu'; "), self->_minHeight);
  objc_msgSend(v3, "appendFormat:", CFSTR("minWidth: '%lu'; "), self->_minWidth);
  objc_msgSend(v3, "appendFormat:", CFSTR("preferredHeight: '%lu'; "), self->_preferredHeight);
  objc_msgSend(v3, "appendFormat:", CFSTR("preferredWidth: '%lu'; "), self->_preferredWidth);
  objc_msgSend(v3, "appendFormat:", CFSTR("ratioHeight: '%lu'; "), self->_ratioHeight);
  objc_msgSend(v3, "appendFormat:", CFSTR("ratioWidth: '%lu'; "), self->_ratioWidth);
  objc_msgSend(v3, "appendFormat:", CFSTR("minBorderPadding: '%lu'; "), self->_minBorderPadding);
  objc_msgSend(v3, "appendFormat:", CFSTR("supportedEncoding: ["));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_supportedEncoding;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("%@, "), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR("]; "));
  objc_msgSend(v3, "appendFormat:", CFSTR("userMessage: '%@'; "), self->_userMessage);
  if (self->_liveliness)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("liveliness: '%@'; "), v9);
  objc_msgSend(v3, "appendFormat:", CFSTR("timeout: '%lu'; "), self->_timeout);
  objc_msgSend(v3, "appendFormat:", CFSTR("maxRetakeCount: '%lu'; "), self->_maxRetakeCount);
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumCompressionRatio, 0);
  objc_storeStrong((id *)&self->_compressionRatio, 0);
  objc_storeStrong((id *)&self->_userMessage, 0);
  objc_storeStrong((id *)&self->_supportedEncoding, 0);
}

@end
