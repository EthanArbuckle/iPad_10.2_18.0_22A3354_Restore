@implementation XRSchemaErrorReplacementElement

- (XRSchemaErrorReplacementElement)initWithName:(id)a3 key:(id)a4 replacementString:(id)a5
{
  id v8;
  id v9;
  id v10;
  XRSchemaErrorReplacementElement *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  XRSchemaErrorReplacementElement *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)XRSchemaErrorReplacementElement;
  v11 = -[XRSchemaErrorReplacementElement init](&v23, sel_init);
  v15 = v11;
  if (v11)
  {
    objc_msgSend_setName_(v11, v12, (uint64_t)v8, v13, v14);
    objc_msgSend_setKey_(v15, v16, (uint64_t)v9, v17, v18);
    objc_msgSend_setReplacementString_(v15, v19, (uint64_t)v10, v20, v21);
  }

  return v15;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)replacementString
{
  return self->_replacementString;
}

- (void)setReplacementString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementString, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
