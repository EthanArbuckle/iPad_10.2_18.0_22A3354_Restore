@implementation ENTestResultUploadRequest

+ (id)uploadRequestWithCertificate:(id)a3 healthAuthorityID:(id)a4 revisionToken:(id)a5 symmetricKey:(id)a6 temporaryExposureKeys:(id)a7 userMetadata:(id)a8 requestURL:(id)a9 URLSession:(id)a10 queue:(id)a11 error:(id *)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  double v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v46;
  void *v47;

  v17 = a8;
  v18 = a11;
  v19 = a10;
  v20 = a9;
  v46 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  CFDateGetTypeID();
  v47 = v17;
  CFDictionaryGetTypedValue();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(objc_alloc((Class)a1), "initWithRequestURL:URLSession:queue:", v20, v19, v18);

  v27 = objc_msgSend(v24, "copy");
  v28 = *(void **)(v26 + 80);
  *(_QWORD *)(v26 + 80) = v27;

  v29 = objc_msgSend(v23, "copy");
  v30 = *(void **)(v26 + 88);
  *(_QWORD *)(v26 + 88) = v29;

  v31 = objc_msgSend(v22, "copy");
  v32 = *(void **)(v26 + 96);
  *(_QWORD *)(v26 + 96) = v31;

  v33 = objc_msgSend(v21, "copy");
  v34 = *(void **)(v26 + 104);
  *(_QWORD *)(v26 + 104) = v33;

  v35 = objc_msgSend(v46, "copy");
  v36 = *(void **)(v26 + 112);
  *(_QWORD *)(v26 + 112) = v35;

  if (v25)
  {
    v37 = (void *)MEMORY[0x1E0CB37E0];
    objc_msgSend(v25, "timeIntervalSinceReferenceDate");
    objc_msgSend(v37, "numberWithUnsignedInt:", 144 * (((v38 + *MEMORY[0x1E0C9ADF0]) / 600.0) / 0x90));
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = *(void **)(v26 + 120);
    *(_QWORD *)(v26 + 120) = v39;

  }
  *(_BYTE *)(v26 + 128) = CFDictionaryGetInt64() != 0;
  objc_msgSend(v47, "objectForKeyedSubscript:", *MEMORY[0x1E0CAA278]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithBool:", CFDictionaryGetInt64() != 0);
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = *(void **)(v26 + 136);
    *(_QWORD *)(v26 + 136) = v42;

  }
  return (id)v26;
}

- (id)bodyJSON
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSString *requestRevisionToken;
  NSNumber *symptomOnsetInterval;
  NSNumber *isUserVaccinated;
  void *v19;
  NSArray *obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[3];
  _QWORD v28[3];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = self->_temporaryExposureKeys;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v27[0] = CFSTR("key");
        objc_msgSend(v7, "keyData");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v9;
        v27[1] = CFSTR("rollingStartNumber");
        objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedInt:", objc_msgSend(v7, "rollingStartNumber"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v28[1] = v10;
        v27[2] = CFSTR("rollingPeriod");
        objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedInt:", objc_msgSend(v7, "rollingPeriod"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v28[2] = v11;
        objc_msgSend(MEMORY[0x1E0C99D88], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v12);

      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v4);
  }

  v13 = objc_alloc_init(MEMORY[0x1E0C99E00]);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", self->_healthAuthorityID, CFSTR("healthAuthorityID"));
  -[NSData base64EncodedStringWithOptions:](self->_symmetricKey, "base64EncodedStringWithOptions:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("hmackey"));

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, CFSTR("temporaryExposureKeys"));
  objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithBool:", self->_userDidTravel);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("traveler"));

  objc_msgSend(v13, "setObject:forKeyedSubscript:", self->_certificate, CFSTR("verificationPayload"));
  requestRevisionToken = self->_requestRevisionToken;
  if (requestRevisionToken)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", requestRevisionToken, CFSTR("revisionToken"));
  symptomOnsetInterval = self->_symptomOnsetInterval;
  if (symptomOnsetInterval)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", symptomOnsetInterval, CFSTR("symptomOnsetInterval"));
  isUserVaccinated = self->_isUserVaccinated;
  if (isUserVaccinated)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", isUserVaccinated, CFSTR("vaccinated"));
  v19 = (void *)objc_msgSend(v13, "copy");

  return v19;
}

- (id)handleResponse:(id)a3 body:(id)a4
{
  id v5;
  NSString *v6;
  NSString *responseRevisionToken;
  NSNumber *v8;
  NSNumber *insertedExposures;

  v5 = a4;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  responseRevisionToken = self->_responseRevisionToken;
  self->_responseRevisionToken = v6;

  NSDictionaryGetNSNumber();
  v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  insertedExposures = self->_insertedExposures;
  self->_insertedExposures = v8;

  return 0;
}

- (NSString)responseRevisionToken
{
  return self->_responseRevisionToken;
}

- (NSNumber)insertedExposures
{
  return self->_insertedExposures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertedExposures, 0);
  objc_storeStrong((id *)&self->_responseRevisionToken, 0);
  objc_storeStrong((id *)&self->_isUserVaccinated, 0);
  objc_storeStrong((id *)&self->_symptomOnsetInterval, 0);
  objc_storeStrong((id *)&self->_temporaryExposureKeys, 0);
  objc_storeStrong((id *)&self->_symmetricKey, 0);
  objc_storeStrong((id *)&self->_requestRevisionToken, 0);
  objc_storeStrong((id *)&self->_healthAuthorityID, 0);
  objc_storeStrong((id *)&self->_certificate, 0);
}

@end
