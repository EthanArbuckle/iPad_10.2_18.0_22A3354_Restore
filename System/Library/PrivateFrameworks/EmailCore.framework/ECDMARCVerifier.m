@implementation ECDMARCVerifier

+ (void)partitionDKIMSignatureHeadersByIdentifierAlignment:(id)a3 forSender:(id)a4 strictAligned:(id *)a5 relaxedAligned:(id *)a6 unaligned:(id *)a7
{
  unint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  id *v21;
  id v22;
  id v23;
  unint64_t v24;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v22 = a4;
  objc_msgSend(v22, "domain");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "length"))
  {
    if (a5)
    {
      v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (a6)
        goto LABEL_4;
    }
    else
    {
      v25 = 0;
      if (a6)
      {
LABEL_4:
        v24 = (unint64_t)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (a7)
        {
LABEL_5:
          v11 = (unint64_t)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          goto LABEL_15;
        }
LABEL_14:
        v11 = 0;
LABEL_15:
        if (!v25 && !v24 && !v11)
          goto LABEL_42;
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v12 = v23;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        v21 = a5;
        v20 = a7;
        v14 = 0;
        if (!v13)
          goto LABEL_35;
        v15 = *(_QWORD *)v28;
        while (1)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v28 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            objc_msgSend(v17, "signingDomainIdentifier", v20);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v18, "length"))
            {
              if (objc_msgSend(v18, "ef_caseInsensitiveIsEqualToString:", v26))
              {
                objc_msgSend(v25, "addObject:", v17);
                goto LABEL_33;
              }
              if (v24 | v11)
              {
                if (!v14)
                {
                  objc_msgSend(v26, "_lp_highLevelDomainFromHost");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(v18, "_lp_highLevelDomainFromHost");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v19, "ef_caseInsensitiveIsEqualToString:", v14))
                {
                  objc_msgSend((id)v24, "addObject:", v17);

                  goto LABEL_33;
                }

              }
            }
            objc_msgSend((id)v11, "addObject:", v17);
LABEL_33:

          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          if (!v13)
          {
LABEL_35:

            if (v21)
            {
              objc_msgSend(v25, "ef_notEmpty");
              *v21 = (id)objc_claimAutoreleasedReturnValue();
            }
            if (a6)
            {
              objc_msgSend((id)v24, "ef_notEmpty");
              *a6 = (id)objc_claimAutoreleasedReturnValue();
            }
            if (v20)
            {
              objc_msgSend((id)v11, "ef_notEmpty");
              *v20 = (id)objc_claimAutoreleasedReturnValue();
            }

            goto LABEL_42;
          }
        }
      }
    }
    v24 = 0;
    if (a7)
      goto LABEL_5;
    goto LABEL_14;
  }
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  if (a7)
    *a7 = objc_retainAutorelease(v23);
LABEL_42:

}

- (ECDMARCVerifier)initWithRecordSource:(id)a3
{
  id v5;
  ECDMARCVerifier *v6;
  ECDMARCVerifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ECDMARCVerifier;
  v6 = -[ECDMARCVerifier init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_recordSource, a3);

  return v7;
}

- (int64_t)dmarcStatusForSender:(id)a3 dkimResult:(BOOL)a4 identifierAlignment:(int64_t)a5 receiverPolicy:(int64_t *)a6
{
  _BOOL4 v8;
  id v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int64_t v20;
  void *v22;
  void *v23;
  id v24;
  id v25;

  v8 = a4;
  v10 = a3;
  v11 = v10;
  if (a6)
    *a6 = 0;
  if (a5 == 2 && v8)
  {
    v12 = 2;
  }
  else
  {
    objc_msgSend(v10, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    -[ECDMARCVerifier _recordsForDomain:error:](self, "_recordsForDomain:error:", v13, &v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v25;
    v16 = objc_msgSend(v14, "count");
    if (!v16)
    {
      v22 = v15;
      v23 = v13;
      objc_msgSend(v13, "_lp_highLevelDomainFromHost");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      -[ECDMARCVerifier _recordsForDomain:error:](self, "_recordsForDomain:error:", v17, &v24);
      v18 = objc_claimAutoreleasedReturnValue();
      v15 = v24;

      v14 = (void *)v18;
      v13 = v23;
    }
    if (objc_msgSend(v14, "count") == 1
      && (objc_msgSend(v14, "firstObject"), (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      if (v16
        || (v20 = -[ECDMARCVerifier _policyForTag:dmarcRecord:](self, "_policyForTag:dmarcRecord:", CFSTR("sp"), v19)) == 0)
      {
        v20 = -[ECDMARCVerifier _policyForTag:dmarcRecord:](self, "_policyForTag:dmarcRecord:", CFSTR("p"), v19);
      }
      if (a6)
        *a6 = v20;
      if (v8)
      {
        if (-[ECDMARCVerifier _alignmentModeForDMARCRecord:](self, "_alignmentModeForDMARCRecord:", v19) <= a5)
          v12 = 2;
        else
          v12 = 3;
      }
      else
      {
        v12 = 3;
      }
    }
    else
    {
      v19 = 0;
      if (v15)
        v12 = 5;
      else
        v12 = 1;
    }

  }
  return v12;
}

- (int64_t)_policyForTag:(id)a3 dmarcRecord:(id)a4
{
  void *v4;
  int64_t v5;

  objc_msgSend(a4, "valueForTag:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("none")) & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("quarantine")) & 1) != 0)
  {
    v5 = 2;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("reject")))
  {
    v5 = 3;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)_alignmentModeForDMARCRecord:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "valueForTag:", CFSTR("adkim"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("s")))
    v4 = 2;
  else
    v4 = 1;

  return v4;
}

- (id)_recordsForDomain:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[ECDMARCVerifier recordSource](self, "recordSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getDMARCRecordsFromDomain:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "ef_filter:", &__block_literal_global_4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __43__ECDMARCVerifier__recordsForDomain_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "valueForTag:", CFSTR("v"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("DMARC1"));

  return v3;
}

- (ECDMARCRecordSource)recordSource
{
  return self->_recordSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordSource, 0);
}

@end
