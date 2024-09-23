@implementation NEFilterBrowserFlow

- (NEFilterBrowserFlow)initWithCoder:(id)a3
{
  id v4;
  NEFilterBrowserFlow *v5;
  uint64_t v6;
  NSURL *parentURL;
  uint64_t v8;
  NSURLRequest *request;
  uint64_t v10;
  NSURLResponse *response;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NEFilterBrowserFlow;
  v5 = -[NEFilterFlow initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ParentURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    parentURL = v5->_parentURL;
    v5->_parentURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URLRequest"));
    v8 = objc_claimAutoreleasedReturnValue();
    request = v5->_request;
    v5->_request = (NSURLRequest *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URLResponse"));
    v10 = objc_claimAutoreleasedReturnValue();
    response = v5->_response;
    v5->_response = (NSURLResponse *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NEFilterBrowserFlow;
  v4 = a3;
  -[NEFilterFlow encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[NEFilterBrowserFlow parentURL](self, "parentURL", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ParentURL"));

  -[NEFilterBrowserFlow request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("URLRequest"));

  -[NEFilterBrowserFlow response](self, "response");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("URLResponse"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NEFilterBrowserFlow;
  v4 = -[NEFilterFlow copyWithZone:](&v12, sel_copyWithZone_, a3);
  -[NEFilterBrowserFlow parentURL](self, "parentURL");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[20];
  v4[20] = v5;

  -[NEFilterBrowserFlow request](self, "request");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v4[18];
  v4[18] = v7;

  -[NEFilterBrowserFlow response](self, "response");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v4[19];
  v4[19] = v9;

  return v4;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v5 = *(_QWORD *)&a3;
  v13.receiver = self;
  v13.super_class = (Class)NEFilterBrowserFlow;
  -[NEFilterFlow descriptionWithIndent:options:](&v13, sel_descriptionWithIndent_options_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFilterBrowserFlow parentURL](self, "parentURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  a4 |= 1uLL;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("parentHostname"), v5, a4);

  -[NEFilterBrowserFlow request](self, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("request"), v5, a4);

  -[NEFilterBrowserFlow response](self, "response");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("response"), v5, a4);

  return v7;
}

- (BOOL)createNewFlowReply:(id)a3 controlSocket:(int)a4 verdict:(id)a5 context:(id)a6
{
  id v9;
  _BYTE *v10;
  const char *v11;
  id v12;
  BOOL v13;
  id v14;
  int v15;
  void *v16;
  SEL v17;
  id v18;
  void *v19;
  const char *v20;
  NSObject *v22;
  const char *v23;
  NEFilterAbsoluteVerdict *v24;
  uint8_t v25[16];

  v9 = a3;
  v10 = a5;
  v12 = a6;
  if (v10
    || (+[NEFilterNewFlowVerdict allowVerdict](NEFilterNewFlowVerdict, "allowVerdict"),
        (v10 = (_BYTE *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if ((v10[12] & 1) != 0)
    {
      v14 = objc_getProperty(v10, v11, 32, 1);
      v15 = isa_nsstring(v14);

      if (v15)
      {
        objc_msgSend(v12, "URLAppendStringMap");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_getProperty(v10, v17, 32, 1);
        objc_msgSend(v16, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (isa_nsstring(v19))
        {
          v20 = (const char *)objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
          if (v20)
            xpc_dictionary_set_string(v9, "url-append-string", v20);
        }

      }
      xpc_dictionary_set_uint64(v9, "verdict-peek", 0);
      xpc_dictionary_set_uint64(v9, "verdict-pass", 0xFFFFFFFFFFFFFFFFLL);
      goto LABEL_12;
    }
  }
  if (objc_msgSend(v10, "drop"))
  {
    v13 = -[NEFilterBrowserFlow createDropReply:verdict:context:]((_BOOL8)self, v9, v10, v12);
    goto LABEL_13;
  }
  xpc_dictionary_set_uint64(v9, "verdict-peek", objc_msgSend(v10, "peekInboundBytes"));
  xpc_dictionary_set_uint64(v9, "verdict-pass", objc_msgSend(v10, "filterInbound") - 1);
  if (objc_msgSend(v10, "filterOutbound"))
  {
    ne_log_obj();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_19BD16000, v22, OS_LOG_TYPE_INFO, "Filtering outbound data is not currently supported for browser flows.", v25, 2u);
    }

  }
  if (!objc_msgSend(v10, "filterInbound"))
  {
LABEL_12:
    v13 = 1;
    goto LABEL_13;
  }
  v24 = -[NEFilterAbsoluteVerdict initWithDrop:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:]([NEFilterAbsoluteVerdict alloc], "initWithDrop:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:", 0, 0, objc_msgSend(v10, "peekInboundBytes"), -1, 0);
  if (self)
    objc_setProperty_atomic(self, v23, v24, 104);

  v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)createDataReply:(id)a3 controlSocket:(int)a4 direction:(int64_t)a5 verdict:(id)a6 context:(id)a7
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  char v15;
  id Property;
  const char *v17;
  id v18;
  id v19;
  SEL v20;
  uint64_t v21;
  SEL v22;

  v11 = a3;
  v12 = a6;
  v13 = a7;
  v15 = -[NEFilterFlow updateCurrentVerdictFromDataVerdict:direction:](self, v12, a5);
  if (self)
    Property = objc_getProperty(self, v14, 104, 1);
  else
    Property = 0;
  if (objc_msgSend(Property, "drop"))
  {
    v15 = -[NEFilterBrowserFlow createDropReply:verdict:context:]((_BOOL8)self, v11, v12, v13);
  }
  else
  {
    v18 = v11;
    if (self)
    {
      v19 = objc_getProperty(self, v17, 104, 1);
      if (a5 == 2)
      {
        xpc_dictionary_set_uint64(v18, "verdict-peek", objc_msgSend(v19, "inboundPeekOffset"));
        v21 = objc_msgSend(objc_getProperty(self, v20, 104, 1), "inboundPassOffset");
      }
      else
      {
        xpc_dictionary_set_uint64(v18, "verdict-peek", objc_msgSend(v19, "outboundPeekOffset"));
        v21 = objc_msgSend(objc_getProperty(self, v22, 104, 1), "outboundPassOffset");
      }
      xpc_dictionary_set_uint64(v18, "verdict-pass", v21);
    }

  }
  return v15;
}

- (BOOL)createDataCompleteReply:(id)a3 controlSocket:(int)a4 direction:(int64_t)a5 verdict:(id)a6 context:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  BOOL v17;
  char v18;

  v10 = *(_QWORD *)&a4;
  v12 = a3;
  v13 = a6;
  v14 = a7;
  if (objc_msgSend(v13, "drop"))
  {
    v15 = v13;
  }
  else
  {
    +[NEFilterDataVerdict allowVerdict](NEFilterDataVerdict, "allowVerdict");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;
  v17 = -[NEFilterBrowserFlow createDataReply:controlSocket:direction:verdict:context:](self, "createDataReply:controlSocket:direction:verdict:context:", v12, v10, a5, v15, v14);
  v18 = objc_msgSend(v16, "drop") ^ 1 | v17;

  return v18;
}

- (NSURLRequest)request
{
  return (NSURLRequest *)objc_getProperty(self, a2, 144, 1);
}

- (void)setRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSURLResponse)response
{
  return (NSURLResponse *)objc_getProperty(self, a2, 152, 1);
}

- (void)setResponse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSURL)parentURL
{
  return (NSURL *)objc_getProperty(self, a2, 160, 1);
}

- (void)setParentURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentURL, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (BOOL)createDropReply:(void *)a3 verdict:(void *)a4 context:
{
  id v7;
  _BYTE *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  id v15;
  const char *v16;
  void *v17;
  int v18;
  const char *v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  __CFString *v32;
  const char *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  const char *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  const char *v66;
  id v67;
  uint64_t v68;
  void *v70;
  char v71;
  void *v72;
  __CFString *v73;
  __CFString *v74;
  __CFString *v75;
  void *v76;
  __CFString *v77;
  void *v78;
  id v79;
  id v80;
  id v81;
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    xpc_dictionary_set_BOOL(v7, "verdict-drop", 1);
    objc_msgSend(v9, "_principalObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "filterConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "organization");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v10, "filterConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "organization");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v16 = (const char *)objc_msgSend(v15, "UTF8String");

      if (v16)
        xpc_dictionary_set_string(v7, "organization", v16);
    }
    if (!v8 || (v8[11] & 1) == 0)
    {
      a1 = 1;
LABEL_56:

      goto LABEL_57;
    }
    objc_getProperty(v8, v13, 16, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = isa_nsstring(v17);

    if (!v18)
    {
      a1 = 0;
      v33 = "x-apple-content-filter://nefilter-unblock";
LABEL_42:
      objc_getProperty(v8, v19, 24, 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = isa_nsstring(v56);

      if (v57)
      {
        objc_msgSend(v9, "remediationMap");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "objectForKeyedSubscript:", NEFilterProviderRemediationMapRemediationButtonTexts);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        if (isa_nsdictionary(v59))
        {
          objc_getProperty(v8, v60, 24, 1);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "objectForKeyedSubscript:", v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          v63 = v62;
          if ((isa_nsstring(v63) & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "stringByAddingPercentEncodingWithAllowedCharacters:", v64);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%20"), CFSTR(" "));
            v81 = (id)objc_claimAutoreleasedReturnValue();

            v66 = "Request Access";
            if (v81)
            {
              v67 = objc_retainAutorelease(v81);
              v68 = objc_msgSend(v67, "UTF8String");
              if (v68)
                v66 = (const char *)v68;
            }
            else
            {
              v67 = 0;
            }
          }
          else
          {

            v67 = 0;
            v66 = "Request Access";
          }

        }
        else
        {
          v66 = "Request Access";
        }

      }
      else
      {
        v66 = "Request Access";
      }
      xpc_dictionary_set_string(v7, "remediation-url", v33);
      xpc_dictionary_set_string(v7, "remediation-button-text", v66);
      goto LABEL_56;
    }
    objc_msgSend(v9, "remediationMap");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", NEFilterProviderRemediationMapRemediationURLs);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!isa_nsdictionary(v21))
    {
      a1 = 0;
      v33 = "x-apple-content-filter://nefilter-unblock";
LABEL_41:

      goto LABEL_42;
    }
    objc_getProperty(v8, v22, 16, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "filterConfiguration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v24;
    v27 = (id)a1;
    v28 = v25;
    v80 = v27;
    if (!isa_nsstring(v26))
    {
      v34 = 0;
LABEL_35:

      v33 = "x-apple-content-filter://nefilter-unblock";
      if (v34)
      {
        v55 = objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
        a1 = v55 != 0;
        if (v55)
          v33 = (const char *)v55;
      }
      else
      {
        a1 = 0;
      }

      goto LABEL_41;
    }
    v78 = v21;
    v29 = objc_msgSend(v26, "mutableCopy");
    objc_msgSend(v27, "URL");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = (void *)v29;
    if (v30)
    {
      objc_msgSend(v27, "URL");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "absoluteString");
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v32 = &stru_1E3CC53C8;
    }

    v77 = v32;
    v35 = (void *)-[__CFString mutableCopy](v32, "mutableCopy");
    objc_msgSend(v27, "URL");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "scheme");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "replaceOccurrencesOfString:withString:options:range:", v37, &stru_1E3CC53C8, 0, 0, objc_msgSend(v35, "length"));

    objc_msgSend(v35, "replaceOccurrencesOfString:withString:options:range:", CFSTR("://"), &stru_1E3CC53C8, 0, 0, objc_msgSend(v35, "length"));
    v76 = v35;
    objc_msgSend(v72, "replaceOccurrencesOfString:withString:options:range:", CFSTR("NE_FLOW_URL"), v35, 0, 0, objc_msgSend(v72, "length"));
    objc_msgSend(v27, "URL");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "host");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      objc_msgSend(v27, "URL");
      v40 = v28;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "host");
      v42 = (const __CFString *)objc_claimAutoreleasedReturnValue();

      v28 = v40;
    }
    else
    {
      v42 = &stru_1E3CC53C8;
    }

    objc_msgSend(v72, "replaceOccurrencesOfString:withString:options:range:", CFSTR("NE_FLOW_HOSTNAME"), v42, 0, 0, objc_msgSend(v72, "length"));
    objc_msgSend(v28, "organization");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      objc_msgSend(v28, "organization");
      v44 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v44 = &stru_1E3CC53C8;
    }

    objc_msgSend(v72, "replaceOccurrencesOfString:withString:options:range:", CFSTR("NE_ORGANIZATION"), v44, 0, 0, objc_msgSend(v72, "length"));
    objc_msgSend(v28, "username");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v28;
    v74 = (__CFString *)v42;
    v75 = (__CFString *)v44;
    if (v45)
    {
      objc_msgSend(v28, "username");
      v46 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v46 = &stru_1E3CC53C8;
    }

    v73 = (__CFString *)v46;
    objc_msgSend(v72, "replaceOccurrencesOfString:withString:options:range:", CFSTR("NE_USERNAME"), v46, 0, 0, objc_msgSend(v72, "length"));
    objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "stringByAddingPercentEncodingWithAllowedCharacters:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49;
    if (v49)
    {
      objc_msgSend(v49, "scheme");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "lowercaseString");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v52, "isEqualToString:", CFSTR("http")))
      {

LABEL_30:
        v34 = v48;
LABEL_34:

        v28 = v79;
        v21 = v78;
        goto LABEL_35;
      }
      objc_msgSend(v50, "scheme");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "lowercaseString");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v53, "isEqualToString:", CFSTR("https"));

      if ((v71 & 1) != 0)
        goto LABEL_30;
    }
    ne_log_obj();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v54, OS_LOG_TYPE_ERROR, "URL is not http or https", buf, 2u);
    }

    v34 = 0;
    goto LABEL_34;
  }
LABEL_57:

  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
