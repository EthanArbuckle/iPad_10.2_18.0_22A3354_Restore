@implementation _HDOntologyManifestItem

- (_HDOntologyManifestItem)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

+ (id)manifestItemFromLine:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  _HDOntologyManifestItem *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  NSString *identifier;
  uint64_t v29;
  NSString *schemaType;
  void *v31;
  uint64_t v32;
  NSString *region;
  void *v34;
  uint64_t v35;
  NSString *locale;
  void *v37;
  uint64_t v38;
  NSURL *URL;
  uint64_t v40;
  NSString *checksum;
  int64_t v43;
  int64_t v44;
  int64_t v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int64_t v54;
  int64_t v55;
  int64_t v56;
  objc_super v57;

  v6 = a3;
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(","));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 9)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0;
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[_HDOntologyManifestItem _scanForInteger:string:label:error:]((uint64_t)a1, (uint64_t)&v56, v9, CFSTR("version"), (uint64_t)a4);

    v11 = 0;
    if (v10)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 0;
      objc_msgSend(v7, "objectAtIndexedSubscript:", 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = +[_HDOntologyManifestItem _scanForInteger:string:label:error:]((uint64_t)a1, (uint64_t)&v55, v13, CFSTR("schemaVersion"), (uint64_t)a4);

      v11 = 0;
      if (v14)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", 4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndexedSubscript:", 5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(&stru_1E6D11BB8, "isEqualToString:", v16))
        {

          v16 = 0;
        }
        v54 = 0;
        objc_msgSend(v7, "objectAtIndexedSubscript:", 6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = +[_HDOntologyManifestItem _scanForInteger:string:label:error:]((uint64_t)a1, (uint64_t)&v54, v17, CFSTR("size"), (uint64_t)a4);

        v11 = 0;
        if (v18)
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", 7);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v19);
          if (v20)
          {
            v53 = v19;
            objc_msgSend(v7, "objectAtIndexedSubscript:", 8);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = [_HDOntologyManifestItem alloc];
            v43 = v56;
            v44 = v55;
            v45 = v54;
            v22 = v8;
            v23 = v12;
            v24 = v15;
            v25 = v23;
            v52 = v24;
            v48 = v24;
            v47 = v16;
            v51 = v20;
            v46 = v20;
            v26 = v21;
            v49 = v25;
            v50 = v22;
            if (v11
              && (v57.receiver = v11,
                  v57.super_class = (Class)_HDOntologyManifestItem,
                  (v11 = objc_msgSendSuper2(&v57, sel_init)) != 0))
            {
              v27 = objc_msgSend(v22, "copy");
              identifier = v11->_identifier;
              v11->_identifier = (NSString *)v27;

              v29 = objc_msgSend(v25, "copy");
              schemaType = v11->_schemaType;
              v11->_schemaType = (NSString *)v29;

              v11->_schemaVersion = v44;
              v11->_version = v43;
              v31 = v48;
              v32 = objc_msgSend(v48, "copy");
              region = v11->_region;
              v11->_region = (NSString *)v32;

              v34 = v47;
              v35 = objc_msgSend(v47, "copy");
              locale = v11->_locale;
              v11->_locale = (NSString *)v35;

              v37 = v46;
              v38 = objc_msgSend(v46, "copy");
              URL = v11->_URL;
              v11->_URL = (NSURL *)v38;

              v40 = objc_msgSend(v26, "copy");
              checksum = v11->_checksum;
              v11->_checksum = (NSString *)v40;

              v11->_size = v45;
            }
            else
            {
              v34 = v47;
              v31 = v48;
              v37 = v46;
            }

            v15 = v52;
            v19 = v53;
            v20 = v51;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid URL string '%@'"), v19);
            v11 = 0;
          }

        }
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("line '%@' has %ld elements, but expected 9"), v6, objc_msgSend(v7, "count"));
    v11 = 0;
  }

  return v11;
}

+ (uint64_t)_scanForInteger:(void *)a3 string:(void *)a4 label:(uint64_t)a5 error:
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;

  v8 = a3;
  v9 = a4;
  objc_opt_self();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v8);
  v11 = objc_msgSend(v10, "scanInteger:", a2);
  if ((v11 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("%@ '%@' is not a valid integer"), v9, v8);

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)schemaType
{
  return self->_schemaType;
}

- (int64_t)schemaVersion
{
  return self->_schemaVersion;
}

- (int64_t)version
{
  return self->_version;
}

- (NSString)region
{
  return self->_region;
}

- (NSString)locale
{
  return self->_locale;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSString)checksum
{
  return self->_checksum;
}

- (int64_t)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checksum, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_schemaType, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
