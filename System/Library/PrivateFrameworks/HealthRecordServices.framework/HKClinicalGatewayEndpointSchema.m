@implementation HKClinicalGatewayEndpointSchema

- (HKClinicalGatewayEndpointSchema)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKClinicalGatewayEndpointSchema)initWithAuth:(id)a3 body:(id)a4 enabled:(BOOL)a5 form:(id)a6 headers:(id)a7 method:(id)a8 minCompatibleAPIVersion:(int64_t)a9 name:(id)a10 query:(id)a11 URL:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  HKClinicalGatewayEndpointSchema *v25;
  uint64_t v26;
  NSString *auth;
  uint64_t v28;
  NSDictionary *body;
  uint64_t v30;
  NSArray *form;
  uint64_t v32;
  NSArray *headers;
  uint64_t v34;
  NSString *method;
  uint64_t v36;
  NSString *name;
  uint64_t v38;
  NSArray *query;
  uint64_t v40;
  NSString *URL;
  id v43;
  objc_super v44;

  v43 = a3;
  v18 = a4;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v44.receiver = self;
  v44.super_class = (Class)HKClinicalGatewayEndpointSchema;
  v25 = -[HKClinicalGatewayEndpointSchema init](&v44, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v43, "copy");
    auth = v25->_auth;
    v25->_auth = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    body = v25->_body;
    v25->_body = (NSDictionary *)v28;

    v25->_enabled = a5;
    v30 = objc_msgSend(v19, "copy");
    form = v25->_form;
    v25->_form = (NSArray *)v30;

    v32 = objc_msgSend(v20, "copy");
    headers = v25->_headers;
    v25->_headers = (NSArray *)v32;

    v34 = objc_msgSend(v21, "copy");
    method = v25->_method;
    v25->_method = (NSString *)v34;

    v25->_minCompatibleAPIVersion = a9;
    v36 = objc_msgSend(v22, "copy");
    name = v25->_name;
    v25->_name = (NSString *)v36;

    v38 = objc_msgSend(v23, "copy");
    query = v25->_query;
    v25->_query = (NSArray *)v38;

    v40 = objc_msgSend(v24, "copy");
    URL = v25->_URL;
    v25->_URL = (NSString *)v40;

  }
  return v25;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HKClinicalGatewayEndpointSchema *v6;
  HKClinicalGatewayEndpointSchema *v7;
  HKClinicalGatewayEndpointSchema *v8;
  NSString *auth;
  NSString *v10;
  uint64_t v11;
  NSString *v12;
  void *v13;
  char v14;
  NSDictionary *body;
  NSDictionary *v16;
  uint64_t v17;
  NSDictionary *v18;
  uint64_t v19;
  NSDictionary *v20;
  void *v21;
  _BOOL4 enabled;
  NSDictionary *v23;
  NSDictionary *v24;
  void *v25;
  void *v26;
  NSArray *form;
  NSArray *v28;
  uint64_t v29;
  NSArray *v30;
  NSArray *v31;
  uint64_t v32;
  NSArray *v33;
  void *v34;
  NSArray *headers;
  BOOL v37;
  uint64_t v38;
  NSArray *v39;
  NSArray *v40;
  uint64_t v41;
  NSArray *v42;
  void *v43;
  void *v44;
  void *method;
  uint64_t v46;
  NSString *v47;
  int64_t v48;
  NSArray *v49;
  int64_t minCompatibleAPIVersion;
  NSString *name;
  uint64_t v52;
  NSString *v53;
  uint64_t v54;
  NSString *v55;
  void *v56;
  NSArray *query;
  uint64_t v58;
  NSArray *v59;
  uint64_t v60;
  NSArray *v61;
  void *v62;
  void *v63;
  NSString *URL;
  uint64_t v65;
  NSString *v66;
  uint64_t v67;
  NSString *v68;
  void *v69;
  NSString *v70;
  NSString *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSArray *v76;
  NSString *v77;
  void *v78;
  void *v79;
  void *v80;
  NSArray *v81;
  NSString *v82;
  NSString *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  NSArray *v89;
  void *v90;
  void *v91;
  NSArray *v92;
  void *v93;
  NSDictionary *v94;
  void *v95;
  NSArray *v96;
  NSArray *v97;
  NSString *v98;
  void *v99;
  void *v100;

  v6 = (HKClinicalGatewayEndpointSchema *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = 0;
LABEL_29:

      goto LABEL_30;
    }
    auth = self->_auth;
    -[HKClinicalGatewayEndpointSchema auth](v8, "auth");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (auth != v10)
    {
      -[HKClinicalGatewayEndpointSchema auth](v8, "auth");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v14 = 0;
        goto LABEL_28;
      }
      v3 = (void *)v11;
      v12 = self->_auth;
      -[HKClinicalGatewayEndpointSchema auth](v8, "auth");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSString isEqualToString:](v12, "isEqualToString:", v13))
      {
        v14 = 0;
LABEL_27:

        goto LABEL_28;
      }
      v100 = v13;
    }
    body = self->_body;
    -[HKClinicalGatewayEndpointSchema body](v8, "body");
    v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    if (body != v16)
    {
      -[HKClinicalGatewayEndpointSchema body](v8, "body");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
        goto LABEL_25;
      v4 = (void *)v17;
      v18 = self->_body;
      -[HKClinicalGatewayEndpointSchema body](v8, "body");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v18;
      v21 = (void *)v19;
      if ((-[NSDictionary isEqual:](v20, "isEqual:", v19) & 1) == 0)
      {

LABEL_24:
        goto LABEL_25;
      }
      v99 = v21;
    }
    enabled = self->_enabled;
    if (enabled != -[HKClinicalGatewayEndpointSchema enabled](v8, "enabled"))
    {
      v14 = 0;
      if (body == v16)
      {
LABEL_22:

        goto LABEL_26;
      }
LABEL_21:

      goto LABEL_22;
    }
    v98 = auth;
    v23 = v16;
    v24 = body;
    v25 = v3;
    v26 = v4;
    form = self->_form;
    -[HKClinicalGatewayEndpointSchema form](v8, "form");
    v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v97 = form;
    if (form == v28)
    {
      v4 = v26;
      v3 = v25;
      v94 = v24;
      goto LABEL_32;
    }
    v95 = v25;
    -[HKClinicalGatewayEndpointSchema form](v8, "form");
    v29 = objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v93 = (void *)v29;
      v30 = v28;
      v31 = self->_form;
      -[HKClinicalGatewayEndpointSchema form](v8, "form");
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = v31;
      v34 = (void *)v32;
      if (-[NSArray isEqualToArray:](v33, "isEqualToArray:", v32))
      {
        v94 = v24;
        v88 = v34;
        v28 = v30;
        v4 = v26;
        v3 = v25;
LABEL_32:
        v16 = v23;
        headers = self->_headers;
        -[HKClinicalGatewayEndpointSchema headers](v8, "headers");
        v96 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v92 = headers;
        v37 = headers == v96;
        auth = v98;
        if (!v37)
        {
          -[HKClinicalGatewayEndpointSchema headers](v8, "headers");
          v38 = objc_claimAutoreleasedReturnValue();
          if (!v38)
          {

            if (v97 == v28)
            {

            }
            else
            {

            }
            v56 = v99;
            if (v94 == v16)
              goto LABEL_25;
            goto LABEL_64;
          }
          v87 = (void *)v38;
          v90 = v4;
          v39 = v28;
          v40 = self->_headers;
          -[HKClinicalGatewayEndpointSchema headers](v8, "headers");
          v41 = objc_claimAutoreleasedReturnValue();
          v42 = v40;
          v43 = (void *)v41;
          if (!-[NSArray isEqualToArray:](v42, "isEqualToArray:", v41))
          {

            if (v97 == v39)
            {

            }
            else
            {

            }
            if (v94 != v16)
            {

            }
            goto LABEL_25;
          }
          v85 = v43;
          v28 = v39;
          v4 = v90;
        }
        method = self->_method;
        -[HKClinicalGatewayEndpointSchema method](v8, "method");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = method;
        if (method == v91)
        {
          v89 = v28;
          minCompatibleAPIVersion = self->_minCompatibleAPIVersion;
          if (minCompatibleAPIVersion != -[HKClinicalGatewayEndpointSchema minCompatibleAPIVersion](v8, "minCompatibleAPIVersion"))
          {
            v14 = 0;
            v49 = v97;
            goto LABEL_100;
          }
        }
        else
        {
          -[HKClinicalGatewayEndpointSchema method](v8, "method");
          v46 = objc_claimAutoreleasedReturnValue();
          if (!v46)
          {

            if (v92 == v96)
            {

            }
            else
            {

            }
            if (v97 != v28)
            {

            }
            if (v94 == v16)
              goto LABEL_25;

            goto LABEL_24;
          }
          v84 = (void *)v46;
          v89 = v28;
          v47 = self->_method;
          -[HKClinicalGatewayEndpointSchema method](v8, "method");
          method = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[NSString isEqualToString:](v47, "isEqualToString:", method))
          {

            if (v92 == v96)
            {

            }
            else
            {

            }
            if (v97 != v89)
            {

            }
            if (v94 != v16)
            {

            }
            goto LABEL_25;
          }
          v48 = self->_minCompatibleAPIVersion;
          if (v48 != -[HKClinicalGatewayEndpointSchema minCompatibleAPIVersion](v8, "minCompatibleAPIVersion"))
          {
            v14 = 0;
            v49 = v97;
LABEL_99:

LABEL_100:
            if (v92 != v96)
            {

            }
            if (v49 != v89)
            {

            }
            if (v94 == v16)
              goto LABEL_22;
            goto LABEL_21;
          }
        }
        name = self->_name;
        -[HKClinicalGatewayEndpointSchema name](v8, "name");
        v83 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (name == v83)
        {
          v79 = method;
          v82 = name;
LABEL_69:
          query = self->_query;
          -[HKClinicalGatewayEndpointSchema query](v8, "query");
          v81 = (NSArray *)objc_claimAutoreleasedReturnValue();
          v76 = query;
          v77 = name;
          if (query == v81)
          {
            method = v79;
          }
          else
          {
            -[HKClinicalGatewayEndpointSchema query](v8, "query");
            v58 = objc_claimAutoreleasedReturnValue();
            if (!v58)
            {
              v14 = 0;
              v49 = v97;
              method = v79;
              goto LABEL_96;
            }
            v75 = (void *)v58;
            v59 = self->_query;
            -[HKClinicalGatewayEndpointSchema query](v8, "query");
            v60 = objc_claimAutoreleasedReturnValue();
            v61 = v59;
            v62 = (void *)v60;
            method = v79;
            if (!-[NSArray isEqualToArray:](v61, "isEqualToArray:", v60))
            {

              v14 = 0;
LABEL_116:
              v71 = v83;
              v63 = v86;
              if (v82 == v83)
              {
LABEL_119:

                if (v63 == v91)
                {
                  v72 = v4;
                }
                else
                {
                  v72 = v4;

                }
                if (v92 != v96)
                {

                }
                if (v97 != v89)
                {

                }
                if (v94 != v16)
                {

                }
                goto LABEL_22;
              }

LABEL_118:
              v71 = v83;
              goto LABEL_119;
            }
            v74 = v62;
          }
          URL = self->_URL;
          -[HKClinicalGatewayEndpointSchema URL](v8, "URL");
          v65 = objc_claimAutoreleasedReturnValue();
          v66 = URL;
          v14 = URL == (NSString *)v65;
          if (!v14)
          {
            v80 = (void *)v65;
            -[HKClinicalGatewayEndpointSchema URL](v8, "URL");
            v67 = objc_claimAutoreleasedReturnValue();
            if (v67)
            {
              v68 = self->_URL;
              v73 = (void *)v67;
              -[HKClinicalGatewayEndpointSchema URL](v8, "URL");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = -[NSString isEqualToString:](v68, "isEqualToString:", v69);

              if (v76 == v81)
              {

              }
              else
              {

              }
              goto LABEL_116;
            }
            v66 = (NSString *)v80;
          }

          if (v76 == v81)
          {

            v70 = v83;
            v49 = v97;
            if (v82 == v83)
            {
LABEL_98:

              if (v86 == v91)
                goto LABEL_100;
              goto LABEL_99;
            }
LABEL_97:

            v70 = v83;
            goto LABEL_98;
          }

          v49 = v97;
LABEL_96:

          v70 = v83;
          if (v82 == v83)
            goto LABEL_98;
          goto LABEL_97;
        }
        -[HKClinicalGatewayEndpointSchema name](v8, "name");
        v52 = objc_claimAutoreleasedReturnValue();
        if (!v52)
        {
          v14 = 0;
          v63 = v86;
          goto LABEL_118;
        }
        v82 = name;
        v78 = (void *)v52;
        v53 = self->_name;
        -[HKClinicalGatewayEndpointSchema name](v8, "name");
        v54 = objc_claimAutoreleasedReturnValue();
        v55 = v53;
        name = (NSString *)v54;
        if (-[NSString isEqualToString:](v55, "isEqualToString:", v54))
        {
          v79 = method;
          goto LABEL_69;
        }

        if (v86 == v91)
        {

        }
        else
        {

        }
        if (v92 != v96)
        {

        }
        if (v97 != v89)
        {

        }
        if (v94 != v16)
        {
          v56 = v99;
LABEL_64:

          goto LABEL_24;
        }
LABEL_25:

        v14 = 0;
LABEL_26:
        v13 = v100;
        if (auth != v10)
          goto LABEL_27;
LABEL_28:

        goto LABEL_29;
      }

      v44 = v99;
      if (v24 != v23)
        goto LABEL_44;
    }
    else
    {

      if (v24 != v23)
      {
        v44 = v99;
LABEL_44:

        goto LABEL_46;
      }
    }

LABEL_46:
    v14 = 0;
    v13 = v100;
    v3 = v95;
    if (v98 == v10)
      goto LABEL_28;
    goto LABEL_27;
  }
  v14 = 1;
LABEL_30:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  _BOOL8 enabled;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;

  v3 = -[NSString hash](self->_auth, "hash");
  v4 = -[NSDictionary hash](self->_body, "hash") ^ v3;
  enabled = self->_enabled;
  v6 = v4 ^ enabled ^ -[NSArray hash](self->_form, "hash");
  v7 = -[NSArray hash](self->_headers, "hash");
  v8 = v6 ^ v7 ^ -[NSString hash](self->_method, "hash") ^ self->_minCompatibleAPIVersion;
  v9 = -[NSString hash](self->_name, "hash");
  v10 = v9 ^ -[NSArray hash](self->_query, "hash");
  return v8 ^ v10 ^ -[NSString hash](self->_URL, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  NSDictionary *body;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  body = self->_body;
  if (body)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", body, 0, &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v14;
    if (!v7)
    {
      _HKInitializeLogging();
      v9 = (void *)*MEMORY[0x24BDD2FF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
      {
        v10 = v9;
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v16 = v12;
        v17 = 2114;
        v18 = v13;
        v19 = 2114;
        v20 = v8;
        _os_log_error_impl(&dword_2163C4000, v10, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ failed to encode JSON to data: %{public}@", buf, 0x20u);

      }
    }

  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v5, "encodeObject:forKey:", self->_auth, CFSTR("auth"));
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("body"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enabled, CFSTR("enabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_form, CFSTR("form"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_headers, CFSTR("headers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_method, CFSTR("method"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_minCompatibleAPIVersion, CFSTR("minCompatibleAPIVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_query, CFSTR("query"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_URL, CFSTR("URL"));

}

- (HKClinicalGatewayEndpointSchema)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  HKClinicalGatewayEndpointSchema *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("auth"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("body"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v29 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 0, &v29);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v29;
      if (!v8)
      {
        _HKInitializeLogging();
        v10 = (void *)*MEMORY[0x24BDD2FF8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
        {
          v20 = v10;
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v31 = v22;
          v32 = 2114;
          v33 = v23;
          v34 = 2114;
          v35 = v9;
          _os_log_error_impl(&dword_2163C4000, v20, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ failed to decode data to JSON: %{public}@", buf, 0x20u);

        }
      }

    }
    else
    {
      v8 = 0;
    }
    if ((objc_msgSend(v5, "containsValueForKey:", CFSTR("enabled")) & 1) != 0)
    {
      v12 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("enabled"));
      objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("method"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 && (objc_msgSend(v5, "containsValueForKey:", CFSTR("minCompatibleAPIVersion")) & 1) != 0)
      {
        v14 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("minCompatibleAPIVersion"));
        objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v27 = v14;
          objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v26, CFSTR("form"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v26, CFSTR("headers"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v26, CFSTR("query"));
            v28 = v15;
            v17 = v16;
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            self = -[HKClinicalGatewayEndpointSchema initWithAuth:body:enabled:form:headers:method:minCompatibleAPIVersion:name:query:URL:](self, "initWithAuth:body:enabled:form:headers:method:minCompatibleAPIVersion:name:query:URL:", v6, v8, v12, v25, v24, v13, v27, v28, v18, v17);

            v16 = v17;
            v15 = v28;

            v11 = self;
          }
          else
          {
            objc_msgSend(v5, "hrs_failWithCocoaValueNotFoundError");
            v11 = 0;
          }

        }
        else
        {
          objc_msgSend(v5, "hrs_failWithCocoaValueNotFoundError");
          v11 = 0;
        }

      }
      else
      {
        objc_msgSend(v5, "hrs_failWithCocoaValueNotFoundError");
        v11 = 0;
      }

    }
    else
    {
      objc_msgSend(v5, "hrs_failWithCocoaValueNotFoundError");
      v11 = 0;
    }

  }
  else
  {
    objc_msgSend(v5, "hrs_failWithCocoaValueNotFoundError");
    v11 = 0;
  }

  return v11;
}

- (NSString)auth
{
  return self->_auth;
}

- (NSDictionary)body
{
  return self->_body;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (NSArray)form
{
  return self->_form;
}

- (NSArray)headers
{
  return self->_headers;
}

- (NSString)method
{
  return self->_method;
}

- (int64_t)minCompatibleAPIVersion
{
  return self->_minCompatibleAPIVersion;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)query
{
  return self->_query;
}

- (NSString)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_form, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_auth, 0);
}

@end
