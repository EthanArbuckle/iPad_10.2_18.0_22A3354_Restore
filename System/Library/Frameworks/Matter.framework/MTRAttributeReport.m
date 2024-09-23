@implementation MTRAttributeReport

- (MTRAttributeReport)initWithPath:(const void *)a3 value:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  MTRAttributeReport *v11;
  MTRAttributePath *v12;
  const char *v13;
  uint64_t v14;
  MTRAttributePath *path;
  objc_super v17;

  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MTRAttributeReport;
  v11 = -[MTRAttributeReport init](&v17, sel_init);
  if (v11)
  {
    v12 = [MTRAttributePath alloc];
    v14 = objc_msgSend_initWithPath_(v12, v13, (uint64_t)a3);
    path = v11->_path;
    v11->_path = (MTRAttributePath *)v14;

    objc_storeStrong(&v11->_value, a4);
    objc_storeStrong((id *)&v11->_error, a5);
  }

  return v11;
}

- (MTRAttributeReport)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  NSDictionary *v6;
  MTRAttributeReport *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  id value;
  MTRAttributeReport *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  NSError *v24;
  __CFString *v25;
  uint64_t v26;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  _BYTE v32[72];
  void *v33;
  uint64_t v34;
  objc_super v35;

  v6 = responseValue;
  v35.receiver = self;
  v35.super_class = (Class)MTRAttributeReport;
  v7 = -[MTRAttributeReport init](&v35, sel_init);
  if (v7)
  {
    v8 = objc_opt_class();
    if (sub_233CEC478(v6, CFSTR("attributePath"), v8, CFSTR("response-value attribute path is not an MTRAttributePath."), error))
    {
      objc_msgSend_objectForKeyedSubscript_(v6, v9, (uint64_t)CFSTR("attributePath"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v6, v11, (uint64_t)CFSTR("error"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = objc_opt_class();
        if ((sub_233CEC478(v6, CFSTR("error"), v13, CFSTR("response-value error is not an NSError."), error) & 1) != 0)
        {
          objc_storeStrong((id *)&v7->_path, v10);
          value = v7->_value;
          v7->_value = 0;

          objc_storeStrong((id *)&v7->_error, v12);
          v15 = v7;
LABEL_19:

          goto LABEL_20;
        }
LABEL_12:
        v15 = 0;
        goto LABEL_19;
      }
      v16 = objc_opt_class();
      if (!sub_233CEC478(v6, CFSTR("data"), v16, CFSTR("response-value data is not a data-value dictionary."), error))goto LABEL_12;
      objc_msgSend_objectForKeyedSubscript_(v6, v17, (uint64_t)CFSTR("data"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      v34 = 0;
      sub_234104468((uint64_t)v32);
      if ((sub_233CEF678(&v34, &v33, v18, (uint64_t)v32, error) & 1) == 0)
      {
        v15 = 0;
LABEL_18:
        sub_233C0BB74(&v33);
        sub_233CAF128(&v34);

        goto LABEL_19;
      }
      v21 = objc_msgSend__asConcretePath(v10, v19, v20);
      v31 = v22;
      v28 = xmmword_2504F0690;
      v29 = 2939;
      v30 = v21;
      sub_23400DD80((uint64_t)&v30, (uint64_t)v32, (uint64_t)&v28);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_DWORD)v28 == 181)
      {
        v25 = CFSTR("No known schema for decoding attribute value.");
        v26 = 12;
      }
      else
      {
        if (!(_DWORD)v28)
        {
          objc_storeStrong((id *)&v7->_path, v10);
          objc_storeStrong(&v7->_value, v23);
          v24 = v7->_error;
          v7->_error = 0;

          v15 = v7;
LABEL_17:

          goto LABEL_18;
        }
        v25 = CFSTR("Attribute decoding failed schema check.");
        v26 = 13;
      }
      sub_233CEC58C(v25, v26, error);
      v15 = 0;
      goto LABEL_17;
    }
  }
  v15 = 0;
LABEL_20:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRAttributeReport *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  uint64_t v19;
  int v20;
  __int16 v21;
  char v22;
  char v23;

  v4 = [MTRAttributeReport alloc];
  objc_msgSend_path(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend__asConcretePath(v7, v8, v9);
  v20 = (int)v10;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  objc_msgSend_value(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_error(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend_initWithPath_value_error_(v4, v16, (uint64_t)&v19, v12, v15);

  return v17;
}

- (MTRAttributePath)path
{
  return self->_path;
}

- (id)value
{
  return self->_value;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
