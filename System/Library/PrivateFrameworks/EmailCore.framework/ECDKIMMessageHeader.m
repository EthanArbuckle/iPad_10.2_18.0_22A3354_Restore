@implementation ECDKIMMessageHeader

- (ECDKIMMessageHeader)initWithHeaderFieldName:(id)a3 headerBody:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  ECDKIMMessageHeader *v10;
  uint64_t v11;
  NSString *headerNameForCanonicalization;
  uint64_t v13;
  id v14;
  ECTagValueList *tagValueList;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  ECDKIMMessageHeader *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  objc_super v34;
  _BYTE v35[128];
  _QWORD v36[9];

  v36[7] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v34.receiver = self;
  v34.super_class = (Class)ECDKIMMessageHeader;
  v10 = -[ECDKIMMessageHeader init](&v34, sel_init);
  if (!v10)
    goto LABEL_63;
  v11 = objc_msgSend(v8, "copy");
  headerNameForCanonicalization = v10->_headerNameForCanonicalization;
  v10->_headerNameForCanonicalization = (NSString *)v11;

  v33 = 0;
  +[ECTagValueList tagValueListFromString:error:](ECTagValueList, "tagValueListFromString:error:", v9, &v33);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v33;
  tagValueList = v10->_tagValueList;
  v10->_tagValueList = (ECTagValueList *)v13;

  if (v14)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v14);

    goto LABEL_61;
  }
  v36[0] = CFSTR("v");
  v36[1] = CFSTR("a");
  v36[2] = CFSTR("b");
  v36[3] = CFSTR("bh");
  v36[4] = CFSTR("d");
  v36[5] = CFSTR("h");
  v36[6] = CFSTR("s");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 7);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v16);
        v20 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        -[ECTagValueList objectForKeyedSubscript:](v10->_tagValueList, "objectForKeyedSubscript:", v20, (_QWORD)v29);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21 == 0;

        if (v22)
        {
          if (a5)
          {
            -[ECDKIMMessageHeader _errorForMissingRequiredKey:](v10, "_errorForMissingRequiredKey:", v20);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }

          v24 = 0;
          goto LABEL_60;
        }
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      if (v17)
        continue;
      break;
    }
  }

  -[ECDKIMMessageHeader _parseVersion](v10, "_parseVersion");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if (a5)
      goto LABEL_58;
    goto LABEL_60;
  }
  -[ECDKIMMessageHeader _parseSigningAlgorithm](v10, "_parseSigningAlgorithm");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if (a5)
      goto LABEL_58;
    goto LABEL_60;
  }
  -[ECDKIMMessageHeader _parseSignatureDataWithHeaderBody:](v10, "_parseSignatureDataWithHeaderBody:", v9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if (a5)
      goto LABEL_58;
    goto LABEL_60;
  }
  -[ECDKIMMessageHeader _parseCanonicalizedBodyHash](v10, "_parseCanonicalizedBodyHash");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if (a5)
      goto LABEL_58;
    goto LABEL_60;
  }
  -[ECDKIMMessageHeader _parseMessageCanonicalizationAlgorithm](v10, "_parseMessageCanonicalizationAlgorithm");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if (a5)
      goto LABEL_58;
    goto LABEL_60;
  }
  -[ECDKIMMessageHeader _parseSigningDomainIdentifier](v10, "_parseSigningDomainIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if (a5)
      goto LABEL_58;
    goto LABEL_60;
  }
  -[ECDKIMMessageHeader _parseSignedHeaderFields](v10, "_parseSignedHeaderFields");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if (a5)
      goto LABEL_58;
    goto LABEL_60;
  }
  -[ECDKIMMessageHeader signingDomainIdentifier](v10, "signingDomainIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECDKIMMessageHeader _parseAgentOrUserIdentifierWithSigningDomainIdentifier:](v10, "_parseAgentOrUserIdentifierWithSigningDomainIdentifier:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    if (a5)
    {
      v26 = objc_retainAutorelease(v24);
LABEL_59:
      v24 = v26;
      *a5 = v26;
      goto LABEL_60;
    }
    goto LABEL_60;
  }
  -[ECDKIMMessageHeader _parseBodyLength](v10, "_parseBodyLength");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if (a5)
      goto LABEL_58;
    goto LABEL_60;
  }
  -[ECDKIMMessageHeader _parseQueryMethod](v10, "_parseQueryMethod");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if (a5)
      goto LABEL_58;
    goto LABEL_60;
  }
  -[ECDKIMMessageHeader _parseSelector](v10, "_parseSelector");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if (a5)
      goto LABEL_58;
    goto LABEL_60;
  }
  -[ECDKIMMessageHeader _parseSignatureTimestamp](v10, "_parseSignatureTimestamp");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if (a5)
      goto LABEL_58;
    goto LABEL_60;
  }
  -[ECDKIMMessageHeader _parseSignatureExpiration](v10, "_parseSignatureExpiration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if (a5)
      goto LABEL_58;
    goto LABEL_60;
  }
  -[ECDKIMMessageHeader _parseCopiedHeaderFields](v10, "_parseCopiedHeaderFields");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (!v23)
  {

LABEL_63:
    v27 = v10;
    goto LABEL_64;
  }
  if (a5)
  {
LABEL_58:
    v26 = objc_retainAutorelease(v23);
    goto LABEL_59;
  }
LABEL_60:

LABEL_61:
  v27 = 0;
LABEL_64:

  return v27;
}

- (id)debugDescription
{
  return -[ECTagValueList stringRepresentation](self->_tagValueList, "stringRepresentation");
}

- (id)_parseVersion
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[ECTagValueList objectForKeyedSubscript:](self->_tagValueList, "objectForKeyedSubscript:", CFSTR("v"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    -[ECDKIMMessageHeader _errorForMissingRequiredKey:](self, "_errorForMissingRequiredKey:", CFSTR("v"));
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v5 = (void *)v6;
    goto LABEL_7;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("1")) & 1) == 0)
  {
    -[ECDKIMMessageHeader _errorForInvalidRequiredKey:actualValue:expectedValue:](self, "_errorForInvalidRequiredKey:actualValue:expectedValue:", CFSTR("v"), v4, CFSTR("1"));
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_storeStrong((id *)&self->_version, v4);
  v5 = 0;
LABEL_7:

  return v5;
}

- (id)_parseSigningAlgorithm
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;

  -[ECTagValueList objectForKeyedSubscript:](self->_tagValueList, "objectForKeyedSubscript:", CFSTR("a"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("-"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") != 2)
    {
      -[ECDKIMMessageHeader _errorForInvalidRequiredKey:actualValue:expectedValue:](self, "_errorForInvalidRequiredKey:actualValue:expectedValue:", CFSTR("a"), v4, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

      goto LABEL_19;
    }
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("rsa")) & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("ed25519")) & 1) == 0)
      {
        -[ECDKIMMessageHeader _errorForInvalidRequiredKey:actualValue:expectedValue:](self, "_errorForInvalidRequiredKey:actualValue:expectedValue:", CFSTR("a"), v6, CFSTR("rsa or ed25519"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

        goto LABEL_18;
      }
      v7 = 1;
    }
    self->_signingAlgorithm = v7;
    objc_msgSend(v5, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("sha1")) & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("sha256")) & 1) == 0)
      {
        -[ECDKIMMessageHeader _errorForInvalidRequiredKey:actualValue:expectedValue:](self, "_errorForInvalidRequiredKey:actualValue:expectedValue:", CFSTR("a"), v9, CFSTR("sha1 or sha256"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      v10 = 1;
    }
    v8 = 0;
    self->_hashingAlgorithm = v10;
LABEL_16:

    goto LABEL_17;
  }
  -[ECDKIMMessageHeader _errorForMissingRequiredKey:](self, "_errorForMissingRequiredKey:", CFSTR("a"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v8;
}

- (id)_parseSignatureDataWithHeaderBody:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  NSString *bodyForCanonicalization;
  NSString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSString *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSString *v21;
  NSString *v22;
  void *v23;
  void *v24;

  v4 = a3;
  -[ECTagValueList objectForKeyedSubscript:](self->_tagValueList, "objectForKeyedSubscript:", CFSTR("b"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = objc_msgSend(v4, "rangeOfString:", v5);
    objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", v6, v7, &stru_1E7123500);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    bodyForCanonicalization = self->_bodyForCanonicalization;
    self->_bodyForCanonicalization = v8;

    v10 = self->_bodyForCanonicalization;
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NSString ef_rangeOfCharactersFromSet:options:](v10, "ef_rangeOfCharactersFromSet:options:", v11, 12);
    v14 = v13;

    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = self->_bodyForCanonicalization;
      objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[NSString ef_rangeOfCharactersFromSet:options:range:](v15, "ef_rangeOfCharactersFromSet:options:range:", v16, 4, v12, v14);
      v19 = v18;

      if (v17 != v12 || v19 != v14)
      {
        -[NSString substringWithRange:](self->_bodyForCanonicalization, "substringWithRange:", v17, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSString stringByReplacingCharactersInRange:withString:](self->_bodyForCanonicalization, "stringByReplacingCharactersInRange:withString:", v12, v14, v20);
        v21 = (NSString *)objc_claimAutoreleasedReturnValue();
        v22 = self->_bodyForCanonicalization;
        self->_bodyForCanonicalization = v21;

      }
    }
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v5, 1);
    if (v23)
    {
      objc_storeStrong((id *)&self->_signatureData, v23);
      v24 = 0;
    }
    else
    {
      -[ECDKIMMessageHeader _errorForInvalidRequiredKey:actualValue:expectedValue:](self, "_errorForInvalidRequiredKey:actualValue:expectedValue:", CFSTR("b"), v5, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    -[ECDKIMMessageHeader _errorForMissingRequiredKey:](self, "_errorForMissingRequiredKey:", CFSTR("b"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

- (id)_parseCanonicalizedBodyHash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ECTagValueList objectForKeyedSubscript:](self->_tagValueList, "objectForKeyedSubscript:", CFSTR("bh"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "ef_stringByRFC5322Unfolding");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "ef_rfc6376WhitespaceCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ef_stringByRemovingCharactersInSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "length"))
    {
      objc_storeStrong((id *)&self->_canonicalizedBodyHash, v7);
      v8 = 0;
    }
    else
    {
      -[ECDKIMMessageHeader _errorForInvalidRequiredKey:actualValue:expectedValue:](self, "_errorForInvalidRequiredKey:actualValue:expectedValue:", CFSTR("bh"), v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    -[ECDKIMMessageHeader _errorForMissingRequiredKey:](self, "_errorForMissingRequiredKey:", CFSTR("bh"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_parseMessageCanonicalizationAlgorithm
{
  unint64_t *p_bodyCanonicalizationAlgorithm;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;

  self->_bodyCanonicalizationAlgorithm = 0;
  self->_headerCanonicalizationAlgorithm = 0;
  p_bodyCanonicalizationAlgorithm = &self->_bodyCanonicalizationAlgorithm;
  -[ECTagValueList objectForKeyedSubscript:](self->_tagValueList, "objectForKeyedSubscript:", CFSTR("c"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("/"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") >= 3)
    {
      -[ECDKIMMessageHeader _errorForInvalidOptionalKey:actualValue:expectedValue:](self, "_errorForInvalidOptionalKey:actualValue:expectedValue:", CFSTR("c"), v5, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

      goto LABEL_21;
    }
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("simple")) & 1) != 0)
      {
        v9 = 0;
      }
      else
      {
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("relaxed")) & 1) == 0)
          goto LABEL_18;
        v9 = 1;
      }
      self->_headerCanonicalizationAlgorithm = v9;

    }
    if (objc_msgSend(v6, "count") != 2)
    {
      v7 = 0;
      goto LABEL_20;
    }
    objc_msgSend(v6, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("simple")) & 1) != 0)
    {
      v10 = 0;
LABEL_17:
      v7 = 0;
      *p_bodyCanonicalizationAlgorithm = v10;
LABEL_19:

      goto LABEL_20;
    }
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("relaxed")) & 1) != 0)
    {
      v10 = 1;
      goto LABEL_17;
    }
LABEL_18:
    -[ECDKIMMessageHeader _errorForInvalidOptionalKey:actualValue:expectedValue:](self, "_errorForInvalidOptionalKey:actualValue:expectedValue:", CFSTR("c"), v8, CFSTR("simple or relaxed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  v7 = 0;
LABEL_21:

  return v7;
}

- (id)_parseSigningDomainIdentifier
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[ECTagValueList objectForKeyedSubscript:](self->_tagValueList, "objectForKeyedSubscript:", CFSTR("d"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[ECDKIMMessageHeader _errorForMissingRequiredKey:](self, "_errorForMissingRequiredKey:", CFSTR("d"));
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v4 = (void *)v5;
    goto LABEL_7;
  }
  if (!-[ECDKIMMessageHeader _isValidDomain:](self, "_isValidDomain:", v3))
  {
    -[ECDKIMMessageHeader _errorForInvalidRequiredKey:actualValue:expectedValue:](self, "_errorForInvalidRequiredKey:actualValue:expectedValue:", CFSTR("d"), v3, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_storeStrong((id *)&self->_signingDomainIdentifier, v3);
  v4 = 0;
LABEL_7:

  return v4;
}

- (BOOL)_isValidDomain:(id)a3
{
  id v3;
  BOOL v4;
  uint64_t v6;
  int v7;
  int v8;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") < 3)
  {
LABEL_2:
    v4 = 0;
    goto LABEL_3;
  }
  v6 = objc_msgSend(v3, "rangeOfString:", CFSTR("."));
  v7 = objc_msgSend(v3, "characterAtIndex:", 0);
  v8 = objc_msgSend(v3, "characterAtIndex:", objc_msgSend(v3, "length") - 1);
  v4 = 0;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL && v7 != 46 && v7 != 45 && v8 != 46 && v8 != 45)
  {
    if (objc_msgSend(v3, "rangeOfString:", CFSTR(".-")) == 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(v3, "rangeOfString:", CFSTR("-.")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 = +[ECEmailAddressParser validateDomain:](ECEmailAddressParser, "validateDomain:", v3);
      goto LABEL_3;
    }
    goto LABEL_2;
  }
LABEL_3:

  return v4;
}

- (id)_parseSignedHeaderFields
{
  void *v2;
  NSArray *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *signedHeaderFields;
  void *v14;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[ECTagValueList objectForKeyedSubscript:](self->_tagValueList, "objectForKeyedSubscript:", CFSTR("h"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v2;
  if (v2)
  {
    objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(":"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
    {
      v3 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v17, "count"));
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v4 = v17;
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v5)
      {
        v6 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v20 != v6)
              objc_enumerationMutation(v4);
            v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "lowercaseString");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "ef_stringByRFC5322Unfolding");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSArray addObject:](v3, "addObject:", v12);
          }
          v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v5);
      }

      signedHeaderFields = self->_signedHeaderFields;
      self->_signedHeaderFields = v3;

      v14 = 0;
    }
    else
    {
      -[ECDKIMMessageHeader _errorForInvalidRequiredKey:actualValue:expectedValue:](self, "_errorForInvalidRequiredKey:actualValue:expectedValue:", CFSTR("h"), v18, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    -[ECDKIMMessageHeader _errorForMissingRequiredKey:](self, "_errorForMissingRequiredKey:", CFSTR("h"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)_parseAgentOrUserIdentifierWithSigningDomainIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *agentOrUserIdentifier;

  v4 = a3;
  -[ECTagValueList objectForKeyedSubscript:](self->_tagValueList, "objectForKeyedSubscript:", CFSTR("i"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
LABEL_5:
    agentOrUserIdentifier = self->_agentOrUserIdentifier;
    self->_agentOrUserIdentifier = v7;

    goto LABEL_6;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@%@"), v4);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

  return 0;
}

- (id)_parseBodyLength
{
  void *v3;
  void *v4;
  void *v5;
  void *bodyLength;
  NSNumber *v7;
  NSNumber *v8;

  -[ECTagValueList objectForKeyedSubscript:](self->_tagValueList, "objectForKeyedSubscript:", CFSTR("l"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v5 = 0;
    bodyLength = self->_bodyLength;
    self->_bodyLength = 0;
LABEL_8:

    goto LABEL_9;
  }
  if ((unint64_t)objc_msgSend(v3, "length") < 0x4D)
  {
    bodyLength = (void *)objc_opt_new();
    objc_msgSend(bodyLength, "setNumberStyle:", 0);
    objc_msgSend(bodyLength, "setGeneratesDecimalNumbers:", 0);
    objc_msgSend(bodyLength, "numberFromString:", v4);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_bodyLength;
    self->_bodyLength = v7;

    if (self->_bodyLength)
    {
      v5 = 0;
    }
    else
    {
      -[ECDKIMMessageHeader _errorForInvalidOptionalKey:actualValue:expectedValue:](self, "_errorForInvalidOptionalKey:actualValue:expectedValue:", CFSTR("l"), v4, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_8;
  }
  -[ECDKIMMessageHeader _errorForInvalidOptionalKey:actualValue:expectedValue:](self, "_errorForInvalidOptionalKey:actualValue:expectedValue:", CFSTR("l"), v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v5;
}

- (id)_parseQueryMethod
{
  return 0;
}

- (id)_parseSelector
{
  void *v3;

  -[ECTagValueList objectForKeyedSubscript:](self->_tagValueList, "objectForKeyedSubscript:", CFSTR("s"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_storeStrong((id *)&self->_selector, v3);

  return 0;
}

- (id)_parseSignatureTimestamp
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[ECTagValueList objectForKeyedSubscript:](self->_tagValueList, "objectForKeyedSubscript:", CFSTR("t"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = 0.0;
  if (v3 && (unint64_t)objc_msgSend(v3, "length") <= 0xC)
  {
    objc_msgSend(v4, "doubleValue");
    v5 = v6;
  }
  self->_signatureTimestamp = v5;

  return 0;
}

- (id)_parseSignatureExpiration
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[ECTagValueList objectForKeyedSubscript:](self->_tagValueList, "objectForKeyedSubscript:", CFSTR("x"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = 0.0;
  if (v3 && (unint64_t)objc_msgSend(v3, "length") <= 0xC)
  {
    objc_msgSend(v4, "doubleValue");
    v5 = v6;
  }
  self->_signatureExpiration = v5;

  return 0;
}

- (id)_parseCopiedHeaderFields
{
  return 0;
}

- (id)_errorForMissingRequiredKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DKIM signature is missing required key '%@'"), v3, *MEMORY[0x1E0CB2D68]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ECDKIMMessageHeaderParseError"), 100, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_errorForInvalidRequiredKey:(id)a3 actualValue:(id)a4 expectedValue:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v12 = *MEMORY[0x1E0CB2D68];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DKIM signature required key '%@' has invalid value '%@'"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ECDKIMMessageHeaderParseError"), 101, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_errorForInvalidOptionalKey:(id)a3 actualValue:(id)a4 expectedValue:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v12 = *MEMORY[0x1E0CB2D68];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DKIM signature optional key '%@' has invalid value '%@'"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ECDKIMMessageHeaderParseError"), 102, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)version
{
  return self->_version;
}

- (unint64_t)signingAlgorithm
{
  return self->_signingAlgorithm;
}

- (unint64_t)hashingAlgorithm
{
  return self->_hashingAlgorithm;
}

- (NSData)signatureData
{
  return self->_signatureData;
}

- (NSString)canonicalizedBodyHash
{
  return self->_canonicalizedBodyHash;
}

- (unint64_t)bodyCanonicalizationAlgorithm
{
  return self->_bodyCanonicalizationAlgorithm;
}

- (unint64_t)headerCanonicalizationAlgorithm
{
  return self->_headerCanonicalizationAlgorithm;
}

- (NSString)signingDomainIdentifier
{
  return self->_signingDomainIdentifier;
}

- (NSArray)signedHeaderFields
{
  return self->_signedHeaderFields;
}

- (NSString)agentOrUserIdentifier
{
  return self->_agentOrUserIdentifier;
}

- (NSNumber)bodyLength
{
  return self->_bodyLength;
}

- (NSArray)queryMethods
{
  return self->_queryMethods;
}

- (NSString)selector
{
  return self->_selector;
}

- (double)signatureTimestamp
{
  return self->_signatureTimestamp;
}

- (double)signatureExpiration
{
  return self->_signatureExpiration;
}

- (NSArray)copiedHeaderFields
{
  return self->_copiedHeaderFields;
}

- (NSString)headerNameForCanonicalization
{
  return self->_headerNameForCanonicalization;
}

- (NSString)bodyForCanonicalization
{
  return self->_bodyForCanonicalization;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyForCanonicalization, 0);
  objc_storeStrong((id *)&self->_headerNameForCanonicalization, 0);
  objc_storeStrong((id *)&self->_copiedHeaderFields, 0);
  objc_storeStrong((id *)&self->_selector, 0);
  objc_storeStrong((id *)&self->_queryMethods, 0);
  objc_storeStrong((id *)&self->_bodyLength, 0);
  objc_storeStrong((id *)&self->_agentOrUserIdentifier, 0);
  objc_storeStrong((id *)&self->_signedHeaderFields, 0);
  objc_storeStrong((id *)&self->_signingDomainIdentifier, 0);
  objc_storeStrong((id *)&self->_canonicalizedBodyHash, 0);
  objc_storeStrong((id *)&self->_signatureData, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_tagValueList, 0);
}

@end
