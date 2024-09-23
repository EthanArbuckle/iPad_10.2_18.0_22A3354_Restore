@implementation NEFilterVerdict

- (NEFilterVerdict)initWithCoder:(id)a3
{
  id v4;
  NEFilterVerdict *v5;
  uint64_t v6;
  NSString *remediationURLMapKey;
  uint64_t v8;
  NSString *remediationButtonTextMapKey;
  uint64_t v10;
  NSString *urlAppendStringMapKey;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NEFilterVerdict;
  v5 = -[NEFilterVerdict init](&v13, sel_init);
  if (v5)
  {
    v5->_drop = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Drop"));
    v5->_remediate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Remediate"));
    v5->_urlAppendString = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("URLAppendString"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RemediationURLMapKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    remediationURLMapKey = v5->_remediationURLMapKey;
    v5->_remediationURLMapKey = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RemediationButtonTextMapKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    remediationButtonTextMapKey = v5->_remediationButtonTextMapKey;
    v5->_remediationButtonTextMapKey = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URLAppendStringKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    urlAppendStringMapKey = v5->_urlAppendStringMapKey;
    v5->_urlAppendStringMapKey = (NSString *)v10;

    v5->_needRules = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("NeedRules"));
    v5->_shouldReport = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ShouldReport"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  SEL v4;
  SEL v5;
  SEL v6;
  id Property;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeBool:forKey:", -[NEFilterVerdict drop](self, "drop"), CFSTR("Drop"));
  if (self)
  {
    objc_msgSend(v8, "encodeBool:forKey:", self->_remediate, CFSTR("Remediate"));
    objc_msgSend(v8, "encodeBool:forKey:", self->_urlAppendString, CFSTR("URLAppendString"));
    objc_msgSend(v8, "encodeObject:forKey:", objc_getProperty(self, v4, 16, 1), CFSTR("RemediationURLMapKey"));
    objc_msgSend(v8, "encodeObject:forKey:", objc_getProperty(self, v5, 24, 1), CFSTR("RemediationButtonTextMapKey"));
    Property = objc_getProperty(self, v6, 32, 1);
  }
  else
  {
    objc_msgSend(v8, "encodeBool:forKey:", 0, CFSTR("Remediate"));
    objc_msgSend(v8, "encodeBool:forKey:", 0, CFSTR("URLAppendString"));
    objc_msgSend(v8, "encodeObject:forKey:", 0, CFSTR("RemediationURLMapKey"));
    objc_msgSend(v8, "encodeObject:forKey:", 0, CFSTR("RemediationButtonTextMapKey"));
    Property = 0;
  }
  objc_msgSend(v8, "encodeObject:forKey:", Property, CFSTR("URLAppendStringKey"));
  objc_msgSend(v8, "encodeBool:forKey:", -[NEFilterVerdict needRules](self, "needRules"), CFSTR("NeedRules"));
  objc_msgSend(v8, "encodeBool:forKey:", -[NEFilterVerdict shouldReport](self, "shouldReport"), CFSTR("ShouldReport"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  const char *v5;
  BOOL remediate;
  BOOL urlAppendString;
  id Property;
  id v9;
  id v10;

  v4 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setDrop:", -[NEFilterVerdict drop](self, "drop"));
  if (self)
  {
    remediate = self->_remediate;
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  remediate = 0;
  if (v4)
LABEL_3:
    v4[11] = remediate;
LABEL_4:
  if (self)
  {
    urlAppendString = self->_urlAppendString;
    if (!v4)
      goto LABEL_7;
    goto LABEL_6;
  }
  urlAppendString = 0;
  if (v4)
LABEL_6:
    v4[12] = urlAppendString;
LABEL_7:
  if (self)
  {
    Property = objc_getProperty(self, v5, 16, 1);
    if (!v4)
      goto LABEL_10;
    goto LABEL_9;
  }
  Property = 0;
  if (v4)
LABEL_9:
    objc_setProperty_atomic(v4, v5, Property, 16);
LABEL_10:
  if (self)
  {
    v9 = objc_getProperty(self, v5, 24, 1);
    if (!v4)
      goto LABEL_13;
    goto LABEL_12;
  }
  v9 = 0;
  if (v4)
LABEL_12:
    objc_setProperty_atomic(v4, v5, v9, 24);
LABEL_13:
  if (!self)
  {
    v10 = 0;
    if (!v4)
      goto LABEL_16;
    goto LABEL_15;
  }
  v10 = objc_getProperty(self, v5, 32, 1);
  if (v4)
LABEL_15:
    objc_setProperty_atomic(v4, v5, v10, 32);
LABEL_16:
  objc_msgSend(v4, "setNeedRules:", -[NEFilterVerdict needRules](self, "needRules", v10));
  objc_msgSend(v4, "setShouldReport:", -[NEFilterVerdict shouldReport](self, "shouldReport"));
  return v4;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  SEL v8;
  SEL v9;
  SEL v10;
  id Property;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEFilterVerdict drop](self, "drop"), CFSTR("drop"), v5, a4);
  if (self)
  {
    objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", self->_remediate, CFSTR("remediate"), v5, a4);
    objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEFilterVerdict needRules](self, "needRules"), CFSTR("needRules"), v5, a4);
    objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEFilterVerdict shouldReport](self, "shouldReport"), CFSTR("shouldReport"), v5, a4);
    objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", self->_pause, CFSTR("pause"), v5, a4);
    objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", self->_urlAppendString, CFSTR("urlAppendString"), v5, a4);
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v8, 32, 1), CFSTR("urlAppendStringMapKey"), v5, a4);
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v9, 16, 1), CFSTR("remediationURLMapKey"), v5, a4);
    Property = objc_getProperty(self, v10, 24, 1);
  }
  else
  {
    objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", 0, CFSTR("remediate"), v5, a4);
    objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", objc_msgSend(0, "needRules"), CFSTR("needRules"), v5, a4);
    objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", objc_msgSend(0, "shouldReport"), CFSTR("shouldReport"), v5, a4);
    objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", 0, CFSTR("pause"), v5, a4);
    objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", 0, CFSTR("urlAppendString"), v5, a4);
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", 0, CFSTR("urlAppendStringMapKey"), v5, a4);
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", 0, CFSTR("remediationURLMapKey"), v5, a4);
    Property = 0;
  }
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", Property, CFSTR("remediationButtonTextMapKey"), v5, a4);
  return v7;
}

- (id)description
{
  return -[NEFilterVerdict descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 0);
}

- (NEFilterVerdict)initWithDrop:(BOOL)a3 remediate:(BOOL)a4
{
  NEFilterVerdict *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NEFilterVerdict;
  result = -[NEFilterVerdict init](&v7, sel_init);
  if (result)
  {
    result->_drop = a3;
    result->_remediate = a4;
  }
  return result;
}

- (int64_t)filterAction
{
  int64_t result;
  _BOOL4 v4;

  if (-[NEFilterVerdict drop](self, "drop") && (!self || !self->_remediate))
    return 2;
  v4 = -[NEFilterVerdict drop](self, "drop");
  result = 0;
  if (self && v4)
  {
    if (self->_remediate)
      return 3;
    else
      return 0;
  }
  return result;
}

- (BOOL)shouldReport
{
  return self->_shouldReport;
}

- (void)setShouldReport:(BOOL)shouldReport
{
  self->_shouldReport = shouldReport;
}

- (BOOL)needRules
{
  return self->_needRules;
}

- (void)setNeedRules:(BOOL)a3
{
  self->_needRules = a3;
}

- (BOOL)drop
{
  return self->_drop;
}

- (void)setDrop:(BOOL)a3
{
  self->_drop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlAppendStringMapKey, 0);
  objc_storeStrong((id *)&self->_remediationButtonTextMapKey, 0);
  objc_storeStrong((id *)&self->_remediationURLMapKey, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
