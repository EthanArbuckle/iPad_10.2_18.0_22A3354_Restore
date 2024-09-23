@implementation SLAbsintheSigningSession

- (SLAbsintheSigningSession)initWithCertURL:(id)a3 sessionURL:(id)a4
{
  id v7;
  id v8;
  SLAbsintheSigningSession *v9;
  SLAbsintheSigningSession *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SLAbsintheSigningSession;
  v9 = -[SLAbsintheSigningSession init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_certURL, a3);
    objc_storeStrong((id *)&v10->_sessionURL, a4);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  IW1PcFszqNK((uint64_t)self->_context);
  v3.receiver = self;
  v3.super_class = (Class)SLAbsintheSigningSession;
  -[SLAbsintheSigningSession dealloc](&v3, sel_dealloc);
}

- (BOOL)establish
{
  uint64_t v2;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  BOOL v9;
  void *v10;
  id v11;
  int v12;
  BOOL v13;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  int v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  NACContextOpaque_ **p_context;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  unsigned int v59;
  uint64_t v60;
  id v61;
  id v62;
  _QWORD v63[2];
  _QWORD v64[2];
  void *v65;
  const __CFString *v66;
  void *v67;
  const __CFString *v68;
  _QWORD v69[3];

  v69[1] = *MEMORY[0x1E0C80C00];
  _SLLog(v2, 7, CFSTR("Fetching Absinthe cert."));
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", self->_certURL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0;
  v62 = 0;
  objc_msgSend(MEMORY[0x1E0CB39A0], "sendSynchronousRequest:returningResponse:error:", v5, &v62, &v61);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v62;
  v8 = v61;
  if (v6)
    v9 = v8 == 0;
  else
    v9 = 0;
  if (v9)
  {
    v44 = objc_msgSend(v6, "length");
    _SLLog(v2, 7, CFSTR("Got Absinthe cert: %d bytes."));
    v60 = 0;
    v59 = 0;
    _SLLog(v2, 7, CFSTR("Initializing Absinthe session."));
    v11 = objc_retainAutorelease(v6);
    KxmB0CKvgWt(objc_msgSend(v11, "bytes", v44), objc_msgSend(v11, "length"));
    if (v12)
    {
      _SLLog(v2, 3, CFSTR("NACInit failed, status: %d"));
      v10 = 0;
      goto LABEL_8;
    }
    p_context = &self->_context;
    _SLLog(v2, 7, CFSTR("session info request: %p of size %lu"));
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v60, v59, v60, v59);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "base64Encoding");
    v16 = objc_claimAutoreleasedReturnValue();

    v68 = CFSTR("absinthe-operations");
    v66 = CFSTR("create-session-info");
    v63[0] = CFSTR("id");
    v63[1] = CFSTR("request");
    v64[0] = &unk_1E75ADDD8;
    v64[1] = v16;
    v53 = (void *)v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
    v20 = objc_claimAutoreleasedReturnValue();

    v58 = 0;
    v54 = (void *)v20;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v20, 0, &v58);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v58;
    v23 = (void *)v21;
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v21, 4);
    -[SLAbsintheSigningSession _urlEncodedString:](self, "_urlEncodedString:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = v25;
    if (v22)
    {
      _SLLog(v2, 3, CFSTR("Building Absinthe operation JSON failed: %@"));
      v10 = 0;
      v26 = 1;
      v27 = v23;
      v28 = v54;
LABEL_26:

      v13 = v26 == 0;
      goto LABEL_9;
    }
    v29 = (void *)MEMORY[0x1E0CB37A8];
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", self->_sessionURL);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "requestWithURL:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v25, "dataUsingEncoding:", 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setHTTPBody:", v32);

    objc_msgSend(v31, "addValue:forHTTPHeaderField:", CFSTR("Absinthe/2.0 Thunderhill (com.apple.social.facebook)"), CFSTR("User-Agent"));
    v56 = 0;
    v57 = v7;
    objc_msgSend(MEMORY[0x1E0CB39A0], "sendSynchronousRequest:returningResponse:error:", v31, &v57, &v56);
    v33 = objc_claimAutoreleasedReturnValue();
    v49 = v57;

    v34 = v56;
    v10 = v34;
    v48 = (void *)v33;
    if (v34 || !v33)
    {
      objc_msgSend(v34, "localizedDescription");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      _SLLog(v2, 3, CFSTR("Could not connect to session URL: %@"));
      v22 = 0;
      v26 = 1;
      v27 = v23;
      v28 = v54;
LABEL_25:

      v7 = v49;
      goto LABEL_26;
    }
    v47 = v31;
    v55 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v33, 0, &v55);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v55;
    v22 = v36;
    v27 = v23;
    if (v36)
    {
      objc_msgSend(v36, "localizedDescription");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      _SLLog(v2, 3, CFSTR("JSON parsing failed: %@"));
      v26 = 1;
    }
    else
    {
      v45 = v35;
      objc_msgSend(v35, "objectForKey:", CFSTR("absinthe-results"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectForKey:", CFSTR("create-session-info"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "lastObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectForKey:", CFSTR("session-info"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = v54;
      if (!v37)
      {
        _SLLog(v2, 3, CFSTR("Could not get session info from server response."));
        v26 = 1;
        v35 = v45;
LABEL_24:

        v31 = v47;
        goto LABEL_25;
      }
      v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64Encoding:", v37);
      _SLLog(v2, 7, CFSTR("Initialized Absinthe session. Establishing key..."));
      v51 = (uint64_t)*p_context;
      v41 = objc_retainAutorelease(v40);
      nDYmeMqvWb(v51, objc_msgSend(v41, "bytes"), objc_msgSend(v41, "length"));
      if (v42)
      {
        _SLLog(v2, 3, CFSTR("NACKeyEstablishment failed, status: %d"));
        v26 = 1;
      }
      else
      {
        v26 = 0;
      }
      v35 = v45;

    }
    v28 = v54;
    goto LABEL_24;
  }
  v10 = v8;
  objc_msgSend(v8, "localizedDescription");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v2, 3, CFSTR("Could not get Absinthe cert: %@"));

LABEL_8:
  v13 = 0;
LABEL_9:

  return v13;
}

- (id)signatureForData:(id)a3
{
  uint64_t v3;
  id v5;
  NACContextOpaque_ *context;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v12;

  if (!self->_context)
    return 0;
  v12 = 0;
  v5 = a3;
  _SLLog(v3, 7, CFSTR("Signing data."));
  context = self->_context;
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");

  t1BoNctgaUu66((uint64_t)context, v8, v9, (uint64_t)&v12);
  if (v10)
    _SLLog(v3, 3, CFSTR("NACSign failed, status: %d"));
  return 0;
}

- (id)_urlEncodedString:(id)a3
{
  return (id)objc_autoreleaseReturnValue((id)CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)a3, 0, CFSTR(":/?#[]@!$&‚Äö√Ñ√¥()*+,;='"),
                                               0x8000100u));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionURL, 0);
  objc_storeStrong((id *)&self->_certURL, 0);
}

@end
