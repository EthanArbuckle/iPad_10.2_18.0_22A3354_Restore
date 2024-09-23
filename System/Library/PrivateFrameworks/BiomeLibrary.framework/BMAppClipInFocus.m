@implementation BMAppClipInFocus

- (BMAppClipInFocus)initWithURLHash:(id)a3 clipBundleID:(id)a4 appBundleID:(id)a5 webAppBundleID:(id)a6 launchReason:(id)a7 fullURL:(id)a8 referrerURL:(id)a9 referrerBundleID:(id)a10
{
  id v17;
  BMAppClipInFocus *v18;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a4;
  v24 = a5;
  v23 = a6;
  v22 = a7;
  v21 = a8;
  v20 = a9;
  v17 = a10;
  v27.receiver = self;
  v27.super_class = (Class)BMAppClipInFocus;
  v18 = -[BMEventBase init](&v27, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v18->_URLHash, a3);
    objc_storeStrong((id *)&v18->_clipBundleID, a4);
    objc_storeStrong((id *)&v18->_appBundleID, a5);
    objc_storeStrong((id *)&v18->_webAppBundleID, a6);
    objc_storeStrong((id *)&v18->_launchReason, a7);
    objc_storeStrong((id *)&v18->_fullURL, a8);
    objc_storeStrong((id *)&v18->_referrerURL, a9);
    objc_storeStrong((id *)&v18->_referrerBundleID, a10);
  }

  return v18;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMAppClipInFocus URLHash](self, "URLHash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppClipInFocus clipBundleID](self, "clipBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppClipInFocus appBundleID](self, "appBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppClipInFocus webAppBundleID](self, "webAppBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppClipInFocus launchReason](self, "launchReason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppClipInFocus fullURL](self, "fullURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppClipInFocus referrerURL](self, "referrerURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppClipInFocus referrerBundleID](self, "referrerBundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMAppClipInFocus with URLHash: %@, clipBundleID: %@, appBundleID: %@, webAppBundleID: %@, launchReason: %@, fullURL: %@, referrerURL: %@, referrerBundleID: %@"), v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAppClipInFocus *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  int v17;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  BMAppClipInFocus *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BMAppClipInFocus;
  v5 = -[BMEventBase init](&v24, sel_init);
  if (!v5)
    goto LABEL_34;
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v9 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v8])
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = *v6;
        v14 = *(_QWORD *)&v4[v13];
        if (v14 == -1 || v14 >= *(_QWORD *)&v4[*v7])
          break;
        v15 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        if (v11++ >= 9)
        {
          v12 = 0;
          v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v17 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v17 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 24;
          goto LABEL_30;
        case 2u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 32;
          goto LABEL_30;
        case 3u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 40;
          goto LABEL_30;
        case 4u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 48;
          goto LABEL_30;
        case 5u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 56;
          goto LABEL_30;
        case 6u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 64;
          goto LABEL_30;
        case 7u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 72;
          goto LABEL_30;
        case 8u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 80;
LABEL_30:
          v21 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_33;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_33:
    v22 = 0;
  else
LABEL_34:
    v22 = v5;

  return v22;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_URLHash)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_clipBundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_appBundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_webAppBundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_launchReason)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_fullURL)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_referrerURL)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_referrerBundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMAppClipInFocus writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAppClipInFocus)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BMAppClipInFocus *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id *v24;
  id v25;
  uint64_t v26;
  id v27;
  id *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  id *v37;
  id v38;
  uint64_t v39;
  id v40;
  id *v41;
  id v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  id v53;
  void *v54;
  id *v55;
  id *v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  _QWORD v81[3];

  v81[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("URLHash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clipBundleID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v21 = 0;
          goto LABEL_33;
        }
        v28 = a4;
        v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v30 = *MEMORY[0x1E0D025B8];
        v78 = *MEMORY[0x1E0CB2D50];
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("clipBundleID"));
        v79 = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = v30;
        v11 = (void *)v31;
        v33 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v32, 2, v31);
        a4 = 0;
        v21 = 0;
        *v28 = v33;
        goto LABEL_32;
      }
      v65 = v9;
    }
    else
    {
      v65 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appBundleID"));
    v10 = objc_claimAutoreleasedReturnValue();
    v60 = (void *)v10;
    if (v10 && (v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v22 = 0;
          v21 = v65;
          goto LABEL_32;
        }
        v56 = a4;
        v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v35 = *MEMORY[0x1E0D025B8];
        v76 = *MEMORY[0x1E0CB2D50];
        v64 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("appBundleID"));
        v77 = v64;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (id)objc_msgSend(v34, "initWithDomain:code:userInfo:", v35, 2);
        a4 = 0;
        v22 = 0;
        *v56 = v36;
        v21 = v65;
LABEL_31:

        v11 = v60;
LABEL_32:

        goto LABEL_33;
      }
      v63 = v11;
    }
    else
    {
      v63 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("webAppBundleID"));
    v12 = objc_claimAutoreleasedReturnValue();
    v62 = (void *)v12;
    if (v12 && (v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v64 = 0;
          v21 = v65;
          goto LABEL_30;
        }
        v37 = a4;
        v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v39 = *MEMORY[0x1E0D025B8];
        v74 = *MEMORY[0x1E0CB2D50];
        v61 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("webAppBundleID"));
        v75 = v61;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v39, 2, v14);
        a4 = 0;
        v64 = 0;
        *v37 = v40;
        goto LABEL_73;
      }
      v64 = v13;
    }
    else
    {
      v64 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("launchReason"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v8;
    v55 = a4;
    if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v61 = 0;
LABEL_16:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fullURL"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v7;
      if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v57 = 0;
            a4 = 0;
            goto LABEL_28;
          }
          v17 = self;
          v58 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v45 = *MEMORY[0x1E0D025B8];
          v70 = *MEMORY[0x1E0CB2D50];
          v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("fullURL"));
          v71 = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (id)objc_msgSend(v58, "initWithDomain:code:userInfo:", v45, 2, v16);
          a4 = 0;
          v57 = 0;
          *v55 = v46;
          goto LABEL_27;
        }
        v57 = v15;
      }
      else
      {
        v57 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("referrerURL"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        v17 = self;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v18 = 0;
            a4 = 0;
            goto LABEL_27;
          }
          v52 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v47 = *MEMORY[0x1E0D025B8];
          v68 = *MEMORY[0x1E0CB2D50];
          v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("referrerURL"));
          v69 = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v47, 2, v19);
          a4 = 0;
          v18 = 0;
          *v55 = v48;
          goto LABEL_26;
        }
        v18 = v16;
      }
      else
      {
        v17 = self;
        v18 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("referrerBundleID"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v51 = *MEMORY[0x1E0D025B8];
            v66 = *MEMORY[0x1E0CB2D50];
            v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("referrerBundleID"));
            v67 = v49;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *v55 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v51, 2, v50);

          }
          v20 = 0;
          a4 = 0;
          goto LABEL_26;
        }
        v20 = v19;
      }
      else
      {
        v20 = 0;
      }
      a4 = -[BMAppClipInFocus initWithURLHash:clipBundleID:appBundleID:webAppBundleID:launchReason:fullURL:referrerURL:referrerBundleID:](v17, "initWithURLHash:clipBundleID:appBundleID:webAppBundleID:launchReason:fullURL:referrerURL:referrerBundleID:", v59, v65, v63, v64, v61, v57, v18, v20);
      v17 = (BMAppClipInFocus *)a4;
LABEL_26:

LABEL_27:
      self = v17;
      v7 = v54;
LABEL_28:
      v21 = v65;

      v8 = v59;
LABEL_29:

LABEL_30:
      v22 = v63;
      goto LABEL_31;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v61 = v14;
      goto LABEL_16;
    }
    if (a4)
    {
      v41 = a4;
      v42 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v43 = *MEMORY[0x1E0D025B8];
      v72 = *MEMORY[0x1E0CB2D50];
      v57 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("launchReason"));
      v73 = v57;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v43, 2, v15);
      a4 = 0;
      v61 = 0;
      *v41 = v44;
      goto LABEL_28;
    }
    v61 = 0;
LABEL_73:
    v21 = v65;
    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v8 = 0;
    goto LABEL_34;
  }
  v24 = a4;
  v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v26 = *MEMORY[0x1E0D025B8];
  v80 = *MEMORY[0x1E0CB2D50];
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("URLHash"));
  v81[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, &v80, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 2, v9);
  a4 = 0;
  v8 = 0;
  *v24 = v27;
LABEL_33:

LABEL_34:
  return (BMAppClipInFocus *)a4;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[8];
  _QWORD v28[10];

  v28[8] = *MEMORY[0x1E0C80C00];
  -[BMAppClipInFocus URLHash](self, "URLHash");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMAppClipInFocus clipBundleID](self, "clipBundleID");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMAppClipInFocus appBundleID](self, "appBundleID");
  v5 = objc_claimAutoreleasedReturnValue();
  -[BMAppClipInFocus webAppBundleID](self, "webAppBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppClipInFocus launchReason](self, "launchReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppClipInFocus fullURL](self, "fullURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppClipInFocus referrerURL](self, "referrerURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppClipInFocus referrerBundleID](self, "referrerBundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = CFSTR("URLHash");
  v11 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v11;
  v28[0] = v11;
  v27[1] = CFSTR("clipBundleID");
  v12 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v12;
  v28[1] = v12;
  v27[2] = CFSTR("appBundleID");
  v13 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v3;
  v20 = (void *)v13;
  v28[2] = v13;
  v27[3] = CFSTR("webAppBundleID");
  v14 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v4;
  v28[3] = v14;
  v27[4] = CFSTR("launchReason");
  v15 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v5;
  v28[4] = v15;
  v27[5] = CFSTR("fullURL");
  v16 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[5] = v16;
  v27[6] = CFSTR("referrerURL");
  v17 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[6] = v17;
  v27[7] = CFSTR("referrerBundleID");
  v18 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[7] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 8);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v9)
      goto LABEL_19;
LABEL_29:

    if (v8)
      goto LABEL_20;
    goto LABEL_30;
  }

  if (!v9)
    goto LABEL_29;
LABEL_19:
  if (v8)
    goto LABEL_20;
LABEL_30:

LABEL_20:
  if (!v7)

  if (!v6)
  if (v24)
  {
    if (v25)
      goto LABEL_26;
LABEL_32:

    if (v26)
      goto LABEL_27;
LABEL_33:

    goto LABEL_27;
  }

  if (!v25)
    goto LABEL_32;
LABEL_26:
  if (!v26)
    goto LABEL_33;
LABEL_27:

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMAppClipInFocus URLHash](self, "URLHash");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLHash");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMAppClipInFocus URLHash](self, "URLHash");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "URLHash");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_29;
    }
    -[BMAppClipInFocus clipBundleID](self, "clipBundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clipBundleID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMAppClipInFocus clipBundleID](self, "clipBundleID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clipBundleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_29;
    }
    -[BMAppClipInFocus appBundleID](self, "appBundleID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appBundleID");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMAppClipInFocus appBundleID](self, "appBundleID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appBundleID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_29;
    }
    -[BMAppClipInFocus webAppBundleID](self, "webAppBundleID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "webAppBundleID");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMAppClipInFocus webAppBundleID](self, "webAppBundleID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "webAppBundleID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_29;
    }
    -[BMAppClipInFocus launchReason](self, "launchReason");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "launchReason");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMAppClipInFocus launchReason](self, "launchReason");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "launchReason");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_29;
    }
    -[BMAppClipInFocus fullURL](self, "fullURL");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fullURL");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      -[BMAppClipInFocus fullURL](self, "fullURL");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fullURL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqual:", v41);

      if (!v42)
        goto LABEL_29;
    }
    -[BMAppClipInFocus referrerURL](self, "referrerURL");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "referrerURL");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v43 == (void *)v44)
    {

    }
    else
    {
      v45 = (void *)v44;
      -[BMAppClipInFocus referrerURL](self, "referrerURL");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "referrerURL");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isEqual:", v47);

      if (!v48)
      {
LABEL_29:
        v12 = 0;
LABEL_30:

        goto LABEL_31;
      }
    }
    -[BMAppClipInFocus referrerBundleID](self, "referrerBundleID");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "referrerBundleID");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50 == v51)
    {
      v12 = 1;
    }
    else
    {
      -[BMAppClipInFocus referrerBundleID](self, "referrerBundleID");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "referrerBundleID");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v52, "isEqual:", v53);

    }
    goto LABEL_30;
  }
  v12 = 0;
LABEL_31:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)URLHash
{
  return self->_URLHash;
}

- (NSString)clipBundleID
{
  return self->_clipBundleID;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (NSString)webAppBundleID
{
  return self->_webAppBundleID;
}

- (NSString)launchReason
{
  return self->_launchReason;
}

- (NSString)fullURL
{
  return self->_fullURL;
}

- (NSString)referrerURL
{
  return self->_referrerURL;
}

- (NSString)referrerBundleID
{
  return self->_referrerBundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referrerBundleID, 0);
  objc_storeStrong((id *)&self->_referrerURL, 0);
  objc_storeStrong((id *)&self->_fullURL, 0);
  objc_storeStrong((id *)&self->_launchReason, 0);
  objc_storeStrong((id *)&self->_webAppBundleID, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_clipBundleID, 0);
  objc_storeStrong((id *)&self->_URLHash, 0);
}

+ (unsigned)latestDataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  _DWORD *v7;

  if (a4 == 1)
  {
    v4 = (objc_class *)MEMORY[0x1E0D82B90];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

    v7 = -[BMAppClipInFocus initByReadFrom:]([BMAppClipInFocus alloc], "initByReadFrom:", v6);
    v7[4] = 1;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("URLHash"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clipBundleID"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("appBundleID"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("webAppBundleID"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("launchReason"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("fullURL"), 2, 0, 6, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("referrerURL"), 2, 0, 7, 13, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("referrerBundleID"), 2, 0, 8, 13, 0);
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1ED90;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("URLHash"), 1, 13, 0);
  v12[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clipBundleID"), 2, 13, 0);
  v12[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appBundleID"), 3, 13, 0);
  v12[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("webAppBundleID"), 4, 13, 0);
  v12[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("launchReason"), 5, 13, 0);
  v12[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("fullURL"), 6, 13, 0);
  v12[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("referrerURL"), 7, 13, 0);
  v12[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("referrerBundleID"), 8, 13, 0);
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
