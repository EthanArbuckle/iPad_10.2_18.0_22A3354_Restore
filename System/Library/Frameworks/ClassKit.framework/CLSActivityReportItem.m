@implementation CLSActivityReportItem

- (CLSActivityReportItem)initWithCoder:(id)a3
{
  id v4;
  CLSActivityReportItem *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSString *identifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CLSActivityReportItem;
  v5 = -[CLSActivityReportItem init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("identifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  const char *v5;
  const char *v6;
  id v7;

  title = self->_title;
  v7 = a3;
  objc_msgSend_encodeObject_forKey_(v7, v5, (uint64_t)title, CFSTR("title"));
  objc_msgSend_encodeObject_forKey_(v7, v6, (uint64_t)self->_identifier, CFSTR("identifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CLSActivityReportItem;
  v4 = -[CLSReportItem copyWithZone:](&v14, sel_copyWithZone_, a3);
  objc_msgSend_title(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTitle_(v4, v8, (uint64_t)v7);

  objc_msgSend_identifier(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIdentifier_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CLSActivityReportItem;
  -[CLSReportItem dictionaryRepresentation](&v13, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_title(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)v6, CFSTR("title"));

  objc_msgSend_identifier(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v11, (uint64_t)v10, CFSTR("identifier"));

  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
