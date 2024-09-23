@implementation DAResolvedRecipient

- (id)description
{
  DAResolvedRecipient *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  uint64_t v11;
  DAResolvedRecipient *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v2 = self;
  v39 = *MEMORY[0x1E0C80C00];
  v3 = 0x1E0CB3000uLL;
  v4 = (void *)MEMORY[0x1E0CB37A0];
  v36.receiver = self;
  v36.super_class = (Class)DAResolvedRecipient;
  -[DAResolvedRecipient description](&v36, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ status %ld"), v5, -[DAResolvedRecipient status](v2, "status"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[DAResolvedRecipient mResolvedEmailToX509Certs](v2, "mResolvedEmailToX509Certs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR(" email->certs status %ld "), -[DAResolvedRecipient certificatesStatus](v2, "certificatesStatus"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v9);

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[DAResolvedRecipient mResolvedEmailToX509Certs](v2, "mResolvedEmailToX509Certs");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v27)
    {
      v26 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v33 != v26)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v6, "appendFormat:", CFSTR("%@: "), v11);
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          v12 = v2;
          -[DAResolvedRecipient mResolvedEmailToX509Certs](v2, "mResolvedEmailToX509Certs");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v29;
            do
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v29 != v17)
                  objc_enumerationMutation(v14);
                objc_msgSend(v6, "appendFormat:", CFSTR("<cert data length %ld hash %ld> "), objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "length"), objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "hash"));
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
            }
            while (v16);
          }

          v2 = v12;
        }
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      }
      while (v27);
    }

    v3 = 0x1E0CB3000;
  }
  else
  {
    objc_msgSend(v6, "appendString:", CFSTR(" email->certs "));
    if (-[DAResolvedRecipient certificatesStatus](v2, "certificatesStatus"))
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("status %ld "), -[DAResolvedRecipient certificatesStatus](v2, "certificatesStatus"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendString:", v19);

    }
    objc_msgSend(v6, "appendString:", CFSTR("(null)"));
  }
  -[DAResolvedRecipient mergedFreeBusy](v2, "mergedFreeBusy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(*(id *)(v3 + 1952), "stringWithFormat:", CFSTR(" email->availability status %ld "), -[DAResolvedRecipient availabilityStatus](v2, "availabilityStatus"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v21);

    -[DAResolvedRecipient mergedFreeBusy](v2, "mergedFreeBusy");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v22);

  }
  else
  {
    objc_msgSend(v6, "appendString:", CFSTR(" email->availability "));
    if (-[DAResolvedRecipient certificatesStatus](v2, "certificatesStatus"))
    {
      objc_msgSend(*(id *)(v3 + 1952), "stringWithFormat:", CFSTR("status %ld "), -[DAResolvedRecipient availabilityStatus](v2, "availabilityStatus"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendString:", v23);

    }
    objc_msgSend(v6, "appendString:", CFSTR("(null)"));
  }
  return v6;
}

- (void)addCert:(id)a3 forEmailAddress:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v6 = a3;
  -[DAResolvedRecipient mResolvedEmailToX509Certs](self, "mResolvedEmailToX509Certs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)objc_opt_new();
    -[DAResolvedRecipient setMResolvedEmailToX509Certs:](self, "setMResolvedEmailToX509Certs:", v8);

  }
  -[DAResolvedRecipient mResolvedEmailToX509Certs](self, "mResolvedEmailToX509Certs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = (void *)objc_opt_new();
    -[DAResolvedRecipient mResolvedEmailToX509Certs](self, "mResolvedEmailToX509Certs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v15);

  }
  -[DAResolvedRecipient mResolvedEmailToX509Certs](self, "mResolvedEmailToX509Certs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v6);

}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (int64_t)certificatesStatus
{
  return self->_certificatesStatus;
}

- (void)setCertificatesStatus:(int64_t)a3
{
  self->_certificatesStatus = a3;
}

- (int64_t)availabilityStatus
{
  return self->_availabilityStatus;
}

- (void)setAvailabilityStatus:(int64_t)a3
{
  self->_availabilityStatus = a3;
}

- (NSString)mergedFreeBusy
{
  return self->_mergedFreeBusy;
}

- (void)setMergedFreeBusy:(id)a3
{
  objc_storeStrong((id *)&self->_mergedFreeBusy, a3);
}

- (NSMutableDictionary)mResolvedEmailToX509Certs
{
  return self->_mResolvedEmailToX509Certs;
}

- (void)setMResolvedEmailToX509Certs:(id)a3
{
  objc_storeStrong((id *)&self->_mResolvedEmailToX509Certs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mResolvedEmailToX509Certs, 0);
  objc_storeStrong((id *)&self->_mergedFreeBusy, 0);
}

@end
