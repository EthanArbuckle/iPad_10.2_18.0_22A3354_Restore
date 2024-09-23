@implementation TMOAuth

- (TMOAuth)initWithURL:(id)a3 method:(id)a4 postParameters:(id)a5 nonce:(id)a6 consumerKey:(id)a7 consumerSecret:(id)a8 token:(id)a9 tokenSecret:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  __CFString *v23;
  TMOAuth *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  NSString *headerString;
  void *v57;
  void *v58;
  void *v59;
  TMOAuth *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  const __CFString *v66;
  void *v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  objc_super v73;
  _BYTE v74[128];
  _QWORD v75[5];
  _QWORD v76[7];

  v76[5] = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = (__CFString *)a10;
  v73.receiver = self;
  v73.super_class = (Class)TMOAuth;
  v24 = -[TMOAuth init](&v73, sel_init);
  if (v24)
  {
    v66 = v23;
    v68 = (uint64_t)v21;
    v25 = v20;
    v26 = objc_alloc(MEMORY[0x24BDBCED8]);
    v75[0] = CFSTR("oauth_timestamp");
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v19;
    v29 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v27, "timeIntervalSince1970");
    objc_msgSend(v29, "stringWithFormat:", CFSTR("%f"), round(v30));
    v67 = v22;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v75[1] = CFSTR("oauth_nonce");
    v75[2] = CFSTR("oauth_version");
    v76[2] = CFSTR("1.0");
    v76[3] = CFSTR("HMAC-SHA1");
    v76[0] = v31;
    v76[1] = v28;
    v61 = v25;
    v62 = v28;
    v75[3] = CFSTR("oauth_signature_method");
    v75[4] = CFSTR("oauth_consumer_key");
    v76[4] = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v76, v75, 5);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v26, "initWithDictionary:", v32);

    if (v67 && objc_msgSend(v67, "length"))
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v67, CFSTR("oauth_token"));
    objc_msgSend(v16, "query");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    type metadata for some(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v65 = v16;
    objc_msgSend(v16, "absoluteString");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "componentsSeparatedByString:", CFSTR("?"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = v38;
    v59 = v35;
    v63 = v18;
    v64 = v17;
    generateBaseString(v38, v17, (uint64_t)v33, v35, v18);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v24;
    objc_storeStrong((id *)&v24->_baseString, v39);
    v57 = v39;
    sign(v39, v68, v66);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v40, CFSTR("oauth_signature"));

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v42 = v33;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v70 != v45)
            objc_enumerationMutation(v42);
          v47 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i);
          v48 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v42, "objectForKeyedSubscript:", v47);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          TMURLEncode(v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "stringWithFormat:", CFSTR("%@=\"%@\"), v47, v50, v57, v58, v59);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addObject:", v51);

        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
      }
      while (v44);
    }

    v52 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v41, "componentsJoinedByString:", CFSTR(","));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "stringWithFormat:", CFSTR("OAuth %@"), v53);
    v54 = objc_claimAutoreleasedReturnValue();
    v24 = v60;
    headerString = v60->_headerString;
    v60->_headerString = (NSString *)v54;

    v17 = v64;
    v16 = v65;
    v19 = v62;
    v18 = v63;
    v20 = v61;
    v22 = v67;
    v21 = (id)v68;
    v23 = (__CFString *)v66;
  }

  return v24;
}

- (NSString)baseString
{
  return self->_baseString;
}

- (NSString)headerString
{
  return self->_headerString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerString, 0);
  objc_storeStrong((id *)&self->_baseString, 0);
}

+ (id)headerForURL:(id)a3 method:(id)a4 postParameters:(id)a5 nonce:(id)a6 consumerKey:(id)a7 consumerSecret:(id)a8 token:(id)a9 tokenSecret:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  TMOAuth *v24;
  void *v25;

  v16 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  v24 = -[TMOAuth initWithURL:method:postParameters:nonce:consumerKey:consumerSecret:token:tokenSecret:]([TMOAuth alloc], "initWithURL:method:postParameters:nonce:consumerKey:consumerSecret:token:tokenSecret:", v23, v22, v21, v20, v19, v18, v17, v16);

  -[TMOAuth headerString](v24, "headerString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

@end
