@implementation MCSingleSignOnPayloadKerberosInfo

- (MCSingleSignOnPayloadKerberosInfo)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCSingleSignOnPayloadKerberosInfo *v10;
  uint64_t v11;
  id v12;
  NSString *principalName;
  uint64_t v14;
  NSString *realm;
  uint64_t v16;
  id v17;
  NSString *certificateUUID;
  uint64_t v19;
  NSArray *appIdentifierMatches;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _BOOL4 v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSArray *v32;
  NSString *v34;
  uint64_t v35;
  NSArray *URLPrefixMatches;
  NSArray *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  _BOOL4 v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSArray *v49;
  uint64_t v50;
  NSString *accountGUID;
  uint64_t v52;
  const __CFString *v53;
  uint64_t v54;
  NSArray *obj;
  NSString *obja;
  uint64_t v57;
  id *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  id v74;
  id v75;
  id v76;
  id v77;
  objc_super v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v78.receiver = self;
  v78.super_class = (Class)MCSingleSignOnPayloadKerberosInfo;
  v10 = -[MCSingleSignOnPayloadKerberosInfo init](&v78, sel_init);
  if (!v10)
    goto LABEL_26;
  v77 = 0;
  +[MCProfile removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("PrincipalName"), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v77);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v77;
  principalName = v10->_principalName;
  v10->_principalName = (NSString *)v11;

  if (!v12)
  {
    v76 = 0;
    +[MCProfile removeRequiredNonZeroLengthStringInDictionary:key:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeRequiredNonZeroLengthStringInDictionary:key:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("Realm"), CFSTR("MCPayloadErrorDomain"), 2002, CFSTR("ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v76);
    v14 = objc_claimAutoreleasedReturnValue();
    v12 = v76;
    realm = v10->_realm;
    v10->_realm = (NSString *)v14;

  }
  v75 = v12;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("PayloadCertificateUUID"), 0, &v75);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v75;

  certificateUUID = v10->_certificateUUID;
  v10->_certificateUUID = (NSString *)v16;

  if (!v17)
  {
    v74 = 0;
    +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("AppIdentifierMatches"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v74);
    v19 = objc_claimAutoreleasedReturnValue();
    v17 = v74;
    appIdentifierMatches = v10->_appIdentifierMatches;
    v10->_appIdentifierMatches = (NSArray *)v19;

    if (!v17)
    {
      v58 = a5;
      v59 = v9;
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v21 = v10->_appIdentifierMatches;
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
      if (v22)
      {
        v23 = v22;
        v17 = 0;
        v24 = *(_QWORD *)v71;
        while (2)
        {
          v25 = 0;
          v26 = v17;
          do
          {
            if (*(_QWORD *)v71 != v24)
              objc_enumerationMutation(v21);
            v27 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * v25);
            v69 = v26;
            v28 = -[MCSingleSignOnPayloadKerberosInfo validateAppIdentifierMatch:outError:](v10, "validateAppIdentifierMatch:outError:", v27, &v69);
            v17 = v69;

            if (!v28)
            {
              +[MCPayload badFieldValueErrorWithField:underlyingError:](MCPayload, "badFieldValueErrorWithField:underlyingError:", CFSTR("AppIdentifierMatches"), v17);
              v29 = objc_claimAutoreleasedReturnValue();

              v17 = (id)v29;
              a5 = v58;
              v9 = v59;
              goto LABEL_16;
            }
            ++v25;
            v26 = v17;
          }
          while (v23 != v25);
          v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
          if (v23)
            continue;
          break;
        }
      }
      else
      {
        v17 = 0;
      }

      if (-[NSArray count](v10->_appIdentifierMatches, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10->_appIdentifierMatches);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "allObjects");
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = v10->_appIdentifierMatches;
        v10->_appIdentifierMatches = (NSArray *)v31;

      }
      else
      {
        v30 = v10->_appIdentifierMatches;
        v10->_appIdentifierMatches = (NSArray *)&unk_1E4212D48;
      }
      a5 = v58;
      v9 = v59;

      if (!v17)
      {
        v34 = v10->_principalName;
        if (v34 && -[NSString rangeOfString:](v34, "rangeOfString:", CFSTR("@")) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v53 = CFSTR("PrincipalName");
        }
        else
        {
          if (-[NSString rangeOfString:](v10->_realm, "rangeOfString:", CFSTR("@")) == 0x7FFFFFFFFFFFFFFFLL)
          {
            v68 = 0;
            +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("URLPrefixMatches"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v68);
            v35 = objc_claimAutoreleasedReturnValue();
            v17 = v68;
            URLPrefixMatches = v10->_URLPrefixMatches;
            v10->_URLPrefixMatches = (NSArray *)v35;

            if (!-[NSArray count](v10->_URLPrefixMatches, "count"))
            {
              v37 = v10->_URLPrefixMatches;
              v10->_URLPrefixMatches = (NSArray *)&unk_1E4212D60;

            }
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v10->_URLPrefixMatches, "count"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = 0u;
            v67 = 0u;
            v64 = 0u;
            v65 = 0u;
            obj = v10->_URLPrefixMatches;
            v39 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v64, v79, 16);
            if (v39)
            {
              v40 = v39;
              v57 = *(_QWORD *)v65;
              while (2)
              {
                v41 = 0;
                v42 = v17;
                do
                {
                  if (*(_QWORD *)v65 != v57)
                    objc_enumerationMutation(obj);
                  v43 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v41);
                  v62 = v42;
                  v63 = 0;
                  v44 = -[MCSingleSignOnPayloadKerberosInfo validateURLPrefixMatch:outNormalizedString:outError:](v10, "validateURLPrefixMatch:outNormalizedString:outError:", v43, &v63, &v62);
                  v45 = v63;
                  v17 = v62;

                  if (!v44)
                  {
                    v46 = v38;
                    +[MCPayload badFieldValueErrorWithField:underlyingError:](MCPayload, "badFieldValueErrorWithField:underlyingError:", CFSTR("URLPrefixMatches"), v17);
                    v54 = objc_claimAutoreleasedReturnValue();

                    v17 = (id)v54;
                    a5 = v58;
                    v9 = v59;

                    goto LABEL_48;
                  }
                  objc_msgSend(v38, "addObject:", v45);

                  ++v41;
                  v42 = v17;
                }
                while (v40 != v41);
                v40 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v64, v79, 16);
                if (v40)
                  continue;
                break;
              }
            }

            v46 = v38;
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v38);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "allObjects");
            v48 = objc_claimAutoreleasedReturnValue();
            v49 = v10->_URLPrefixMatches;
            v10->_URLPrefixMatches = (NSArray *)v48;

            v9 = v59;
            if (objc_msgSend(v59, "isStub"))
            {
              a5 = v58;
              if (!v17)
              {
                v61 = 0;
                +[MCProfile removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("AccountGUID"), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v61);
                v50 = objc_claimAutoreleasedReturnValue();
                v17 = v61;
                accountGUID = v10->_accountGUID;
                v10->_accountGUID = (NSString *)v50;

                if (!v17)
                {
                  v60 = 0;
                  +[MCProfile removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("AccountTypeGUID"), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v60);
                  v52 = objc_claimAutoreleasedReturnValue();
                  v17 = v60;
                  obja = v10->_accountTypeGUID;
                  v10->_accountTypeGUID = (NSString *)v52;

                }
              }
            }
            else
            {
              a5 = v58;
            }
LABEL_48:

LABEL_16:
            if (!v17)
              goto LABEL_26;
            goto LABEL_23;
          }
          v53 = CFSTR("Realm");
        }
        +[MCPayload badFieldValueErrorWithField:](MCPayload, "badFieldValueErrorWithField:", v53);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
    }
  }
LABEL_23:
  if (a5)
    *a5 = objc_retainAutorelease(v17);

  v10 = 0;
LABEL_26:

  return v10;
}

- (BOOL)validateAppIdentifierMatch:(id)a3 outError:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("*")) & 1) != 0
    || (v6 = objc_msgSend(v5, "rangeOfString:options:", CFSTR("*"), 12),
        v6 == objc_msgSend(v5, "rangeOfString:", CFSTR("*")))
    && (v6 == 0x7FFFFFFFFFFFFFFFLL
     || objc_msgSend(v5, "rangeOfString:options:", CFSTR(".*"), 12) != 0x7FFFFFFFFFFFFFFFLL))
  {
    v17 = 1;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("SSO_BAD_APP_IDENTIFIER_MATCH_P_PATTERN"), v7, v8, v9, v10, v11, v12, v13, v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCOSSErrorDomain"), 34000, v15, CFSTR("MCFatalError"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
      *a4 = objc_retainAutorelease(v16);

    v17 = 0;
  }

  return v17;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MCSingleSignOnPayloadKerberosInfo;
  -[MCSingleSignOnPayloadKerberosInfo description](&v20, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[MCSingleSignOnPayloadKerberosInfo principalName](self, "principalName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MCSingleSignOnPayloadKerberosInfo principalName](self, "principalName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Principal     : %@\n"), v6);

  }
  -[MCSingleSignOnPayloadKerberosInfo realm](self, "realm");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MCSingleSignOnPayloadKerberosInfo realm](self, "realm");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Realm         : %@\n"), v8);

  }
  -[MCSingleSignOnPayloadKerberosInfo certificateUUID](self, "certificateUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MCSingleSignOnPayloadKerberosInfo certificateUUID](self, "certificateUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Cert UUID     : %@\n"), v10);

  }
  -[MCSingleSignOnPayloadKerberosInfo URLPrefixMatches](self, "URLPrefixMatches");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[MCSingleSignOnPayloadKerberosInfo URLPrefixMatches](self, "URLPrefixMatches");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("URL Prefix Matches:\n%@\n"), v12);

  }
  -[MCSingleSignOnPayloadKerberosInfo accountGUID](self, "accountGUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[MCSingleSignOnPayloadKerberosInfo accountGUID](self, "accountGUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Acct GUID     : %@\n"), v14);

  }
  -[MCSingleSignOnPayloadKerberosInfo accountTypeGUID](self, "accountTypeGUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[MCSingleSignOnPayloadKerberosInfo accountTypeGUID](self, "accountTypeGUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("AcctType GUID : %@\n"), v16);

  }
  -[MCSingleSignOnPayloadKerberosInfo appIdentifierMatches](self, "appIdentifierMatches");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[MCSingleSignOnPayloadKerberosInfo appIdentifierMatches](self, "appIdentifierMatches");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("App Matches:\n%@\n"), v18);

  }
  return v4;
}

- (BOOL)validateURLPrefixMatch:(id)a3 outNormalizedString:(id *)a4 outError:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  BOOL v29;
  id v30;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;

  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", v7);
  v9 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v8, "scheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("http")))
  {

  }
  else
  {
    objc_msgSend(v8, "scheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("https"));

    if (!v12)
      goto LABEL_10;
  }
  objc_msgSend(v8, "fragment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (!v14)
  {
    objc_msgSend(v8, "query");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");

    if (!v16)
    {
      objc_msgSend(v8, "host");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "rangeOfString:options:", CFSTR("*"), 4);
      if ((objc_msgSend(v17, "isEqualToString:", CFSTR("*")) & 1) == 0
        && (objc_msgSend(v17, "isEqualToString:", CFSTR("*.")) & 1) == 0
        && (objc_msgSend(v17, "isEqualToString:", CFSTR(".")) & 1) == 0
        && (!objc_msgSend(v17, "hasPrefix:", CFSTR("*"))
         || objc_msgSend(v17, "hasPrefix:", CFSTR("*.")))
        && (v18 == 0x7FFFFFFFFFFFFFFFLL || !v18))
      {
        v32 = objc_msgSend(v8, "rangeOfHost");
        if (objc_msgSend(v17, "hasPrefix:", CFSTR("*.")))
        {
          objc_msgSend(v8, "string");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "substringToIndex:", objc_msgSend(CFSTR("*."), "length") + v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v9, "hasPrefix:", v34);

          if (v35)
            objc_msgSend(v9, "deleteCharactersInRange:", v32, 1);
        }
        if (objc_msgSend(v9, "rangeOfString:options:", CFSTR("/"), 12) == 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v9, "appendString:", CFSTR("/"));
        v30 = (id)objc_msgSend(v9, "copy");

        if (a4)
        {
          v30 = objc_retainAutorelease(v30);
          *a4 = v30;
        }
        v29 = 1;
        goto LABEL_13;
      }

    }
  }
LABEL_10:

  v19 = (void *)MEMORY[0x1E0CB35C8];
  MCErrorArray(CFSTR("SSO_BAD_URL_MATCH_PATTERN_P_PATTERN"), v20, v21, v22, v23, v24, v25, v26, v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCOSSErrorDomain"), 34001, v27, CFSTR("MCFatalError"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = objc_retainAutorelease(v28);

  v29 = 0;
  v30 = 0;
LABEL_13:

  return v29;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCSingleSignOnPayloadKerberosInfo principalName](self, "principalName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MCSingleSignOnPayloadKerberosInfo principalName](self, "principalName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("PrincipalName"));

  }
  -[MCSingleSignOnPayloadKerberosInfo realm](self, "realm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MCSingleSignOnPayloadKerberosInfo realm](self, "realm");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("Realm"));

  }
  -[MCSingleSignOnPayloadKerberosInfo URLPrefixMatches](self, "URLPrefixMatches");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MCSingleSignOnPayloadKerberosInfo URLPrefixMatches](self, "URLPrefixMatches");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("URLPrefixMatches"));

  }
  -[MCSingleSignOnPayloadKerberosInfo accountTypeGUID](self, "accountTypeGUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MCSingleSignOnPayloadKerberosInfo accountTypeGUID](self, "accountTypeGUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("AccountTypeGUID"));

  }
  -[MCSingleSignOnPayloadKerberosInfo accountGUID](self, "accountGUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MCSingleSignOnPayloadKerberosInfo accountGUID](self, "accountGUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("AccountGUID"));

  }
  -[MCSingleSignOnPayloadKerberosInfo appIdentifierMatches](self, "appIdentifierMatches");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[MCSingleSignOnPayloadKerberosInfo appIdentifierMatches](self, "appIdentifierMatches");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("AppIdentifierMatches"));

  }
  return v3;
}

- (NSString)principalName
{
  return self->_principalName;
}

- (void)setPrincipalName:(id)a3
{
  objc_storeStrong((id *)&self->_principalName, a3);
}

- (NSString)realm
{
  return self->_realm;
}

- (void)setRealm:(id)a3
{
  objc_storeStrong((id *)&self->_realm, a3);
}

- (NSString)certificateUUID
{
  return self->_certificateUUID;
}

- (void)setCertificateUUID:(id)a3
{
  objc_storeStrong((id *)&self->_certificateUUID, a3);
}

- (NSArray)URLPrefixMatches
{
  return self->_URLPrefixMatches;
}

- (void)setURLPrefixMatches:(id)a3
{
  objc_storeStrong((id *)&self->_URLPrefixMatches, a3);
}

- (NSArray)appIdentifierMatches
{
  return self->_appIdentifierMatches;
}

- (void)setAppIdentifierMatches:(id)a3
{
  objc_storeStrong((id *)&self->_appIdentifierMatches, a3);
}

- (NSString)accountGUID
{
  return self->_accountGUID;
}

- (void)setAccountGUID:(id)a3
{
  objc_storeStrong((id *)&self->_accountGUID, a3);
}

- (NSString)accountTypeGUID
{
  return self->_accountTypeGUID;
}

- (void)setAccountTypeGUID:(id)a3
{
  objc_storeStrong((id *)&self->_accountTypeGUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountTypeGUID, 0);
  objc_storeStrong((id *)&self->_accountGUID, 0);
  objc_storeStrong((id *)&self->_appIdentifierMatches, 0);
  objc_storeStrong((id *)&self->_URLPrefixMatches, 0);
  objc_storeStrong((id *)&self->_certificateUUID, 0);
  objc_storeStrong((id *)&self->_realm, 0);
  objc_storeStrong((id *)&self->_principalName, 0);
}

@end
