@implementation BMPeopleSuggesterSuggestLessFeedback

- (BMPeopleSuggesterSuggestLessFeedback)initWithIdentifier:(id)a3 bundleId:(id)a4 derivedIdentifier:(id)a5 conversationIdentifier:(id)a6 handle:(id)a7 contactIdentifier:(id)a8 itemIdentifier:(id)a9 groupIdentifier:(id)a10 deviceIdentifier:(id)a11 userIdentifier:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  BMPeopleSuggesterSuggestLessFeedback *v22;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;

  v33 = a3;
  v32 = a4;
  v25 = a5;
  v31 = a5;
  v26 = a6;
  v30 = a6;
  v29 = a7;
  v27 = a8;
  v28 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  v21 = a12;
  v34.receiver = self;
  v34.super_class = (Class)BMPeopleSuggesterSuggestLessFeedback;
  v22 = -[BMEventBase init](&v34, sel_init);
  if (v22)
  {
    v22->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v22->_identifier, a3);
    objc_storeStrong((id *)&v22->_bundleId, a4);
    objc_storeStrong((id *)&v22->_derivedIdentifier, v25);
    objc_storeStrong((id *)&v22->_conversationIdentifier, v26);
    objc_storeStrong((id *)&v22->_handle, a7);
    objc_storeStrong((id *)&v22->_contactIdentifier, v27);
    objc_storeStrong((id *)&v22->_itemIdentifier, a9);
    objc_storeStrong((id *)&v22->_groupIdentifier, a10);
    objc_storeStrong((id *)&v22->_deviceIdentifier, a11);
    objc_storeStrong((id *)&v22->_userIdentifier, a12);
  }

  return v22;
}

- (NSString)description
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
  void *v14;
  id v15;

  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMPeopleSuggesterSuggestLessFeedback identifier](self, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPeopleSuggesterSuggestLessFeedback bundleId](self, "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPeopleSuggesterSuggestLessFeedback derivedIdentifier](self, "derivedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPeopleSuggesterSuggestLessFeedback conversationIdentifier](self, "conversationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPeopleSuggesterSuggestLessFeedback handle](self, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPeopleSuggesterSuggestLessFeedback contactIdentifier](self, "contactIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPeopleSuggesterSuggestLessFeedback itemIdentifier](self, "itemIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPeopleSuggesterSuggestLessFeedback groupIdentifier](self, "groupIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPeopleSuggesterSuggestLessFeedback deviceIdentifier](self, "deviceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPeopleSuggesterSuggestLessFeedback userIdentifier](self, "userIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("BMPeopleSuggesterSuggestLessFeedback with identifier: %@, bundleId: %@, derivedIdentifier: %@, conversationIdentifier: %@, handle: %@, contactIdentifier: %@, itemIdentifier: %@, groupIdentifier: %@, deviceIdentifier: %@, userIdentifier: %@"), v14, v3, v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMPeopleSuggesterSuggestLessFeedback *v5;
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
  BMPeopleSuggesterSuggestLessFeedback *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BMPeopleSuggesterSuggestLessFeedback;
  v5 = -[BMEventBase init](&v24, sel_init);
  if (!v5)
    goto LABEL_36;
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
          goto LABEL_32;
        case 2u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 32;
          goto LABEL_32;
        case 3u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 40;
          goto LABEL_32;
        case 4u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 48;
          goto LABEL_32;
        case 5u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 56;
          goto LABEL_32;
        case 6u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 64;
          goto LABEL_32;
        case 7u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 72;
          goto LABEL_32;
        case 8u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 80;
          goto LABEL_32;
        case 9u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 88;
          goto LABEL_32;
        case 0xAu:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 96;
LABEL_32:
          v21 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_35;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_35:
    v22 = 0;
  else
LABEL_36:
    v22 = v5;

  return v22;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_derivedIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_conversationIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_handle)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_contactIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_itemIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_groupIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_deviceIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_userIdentifier)
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
  -[BMPeopleSuggesterSuggestLessFeedback writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMPeopleSuggesterSuggestLessFeedback)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BMPeopleSuggesterSuggestLessFeedback *v25;
  id *v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  BMPeopleSuggesterSuggestLessFeedback *v35;
  id v36;
  void *v37;
  id v38;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  uint64_t v73;
  id v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  id *v86;
  id v87;
  id v88;
  id v90;
  void *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  id v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  id v101;
  uint64_t v102;
  id v103;
  uint64_t v104;
  id v105;
  uint64_t v106;
  id v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  _QWORD v111[3];

  v111[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleId"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    if (v91 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v8 = 0;
          v25 = 0;
          goto LABEL_61;
        }
        v26 = a4;
        v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v28 = *MEMORY[0x1E0D025B8];
        v108 = *MEMORY[0x1E0CB2D50];
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleId"));
        v109 = v29;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v109, &v108, 1);
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = v27;
        v9 = (void *)v30;
        v32 = (id)objc_msgSend(v31, "initWithDomain:code:userInfo:", v28, 2, v30);
        v25 = 0;
        v8 = 0;
        *v26 = v32;
        goto LABEL_60;
      }
      v86 = a4;
      v8 = v91;
    }
    else
    {
      v86 = a4;
      v8 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("derivedIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v86)
        {
          v29 = 0;
          v25 = 0;
          goto LABEL_60;
        }
        v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v41 = v8;
        v42 = *MEMORY[0x1E0D025B8];
        v106 = *MEMORY[0x1E0CB2D50];
        v88 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("derivedIdentifier"));
        v107 = v88;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1);
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = v42;
        v8 = v41;
        v25 = 0;
        v29 = 0;
        *v86 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v44, 2, v43);
        v10 = (void *)v43;
LABEL_59:

LABEL_60:
        goto LABEL_61;
      }
      v87 = v9;
    }
    else
    {
      v87 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("conversationIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v9;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v86)
        {
          v88 = 0;
          v25 = 0;
          v29 = v87;
          goto LABEL_59;
        }
        v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v46 = v8;
        v47 = *MEMORY[0x1E0D025B8];
        v104 = *MEMORY[0x1E0CB2D50];
        v84 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("conversationIdentifier"));
        v105 = v84;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v45;
        v9 = v83;
        v49 = v47;
        v8 = v46;
        v25 = 0;
        v88 = 0;
        *v86 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", v49, 2, v11);
        v29 = v87;
        goto LABEL_58;
      }
      v88 = v10;
    }
    else
    {
      v88 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("handle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v10;
    v82 = v6;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v86)
        {
          v84 = 0;
          v25 = 0;
          v29 = v87;
          goto LABEL_58;
        }
        v85 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v50 = v8;
        v51 = *MEMORY[0x1E0D025B8];
        v102 = *MEMORY[0x1E0CB2D50];
        v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("handle"));
        v103 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1);
        v52 = objc_claimAutoreleasedReturnValue();
        v53 = v51;
        v8 = v50;
        v80 = (void *)v52;
        v54 = (id)objc_msgSend(v85, "initWithDomain:code:userInfo:", v53, 2);
        v25 = 0;
        v84 = 0;
        *v86 = v54;
        v29 = v87;
        goto LABEL_92;
      }
      v12 = v7;
      v84 = v11;
    }
    else
    {
      v12 = v7;
      v84 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("contactIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    v77 = v11;
    v80 = (void *)v13;
    if (!v13 || (v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v15 = 0;
      goto LABEL_19;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = v14;
LABEL_19:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("itemIdentifier"));
      v16 = objc_claimAutoreleasedReturnValue();
      v7 = v12;
      v76 = (void *)v16;
      if (v16)
      {
        v17 = (void *)v16;
        objc_opt_class();
        v71 = v15;
        v18 = v17;
        v6 = v82;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v79 = 0;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v86)
            {
              v79 = 0;
              v25 = 0;
              v15 = v71;
              goto LABEL_56;
            }
            v60 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v61 = v8;
            v62 = *MEMORY[0x1E0D025B8];
            v98 = *MEMORY[0x1E0CB2D50];
            v78 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("itemIdentifier"));
            v99 = v78;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = v62;
            v8 = v61;
            v25 = 0;
            v79 = 0;
            *v86 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v63, 2, v33);
            v15 = v71;
            goto LABEL_55;
          }
          v79 = v18;
        }
        v15 = v71;
      }
      else
      {
        v79 = 0;
        v6 = v82;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("groupIdentifier"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v8;
      if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v86)
          {
            v78 = 0;
            v25 = 0;
            goto LABEL_55;
          }
          v64 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v65 = *MEMORY[0x1E0D025B8];
          v96 = *MEMORY[0x1E0CB2D50];
          v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("groupIdentifier"));
          v97 = v36;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = (id)objc_msgSend(v64, "initWithDomain:code:userInfo:", v65, 2, v34);
          v25 = 0;
          v78 = 0;
          *v86 = v66;
          goto LABEL_53;
        }
        v78 = v33;
      }
      else
      {
        v78 = 0;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceIdentifier"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v7;
      if (v34 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v86)
          {
            v36 = 0;
            v25 = 0;
            goto LABEL_54;
          }
          v35 = self;
          v72 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v67 = *MEMORY[0x1E0D025B8];
          v94 = *MEMORY[0x1E0CB2D50];
          v38 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("deviceIdentifier"));
          v95 = v38;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = (id)objc_msgSend(v72, "initWithDomain:code:userInfo:", v67, 2, v37);
          v25 = 0;
          v36 = 0;
          *v86 = v68;
          goto LABEL_52;
        }
        v35 = self;
        v36 = v34;
      }
      else
      {
        v35 = self;
        v36 = 0;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("userIdentifier"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v37 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v86)
          {
            v90 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v73 = *MEMORY[0x1E0D025B8];
            v92 = *MEMORY[0x1E0CB2D50];
            v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("userIdentifier"));
            v93 = v69;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            *v86 = (id)objc_msgSend(v90, "initWithDomain:code:userInfo:", v73, 2, v70);

          }
          v38 = 0;
          v25 = 0;
          goto LABEL_52;
        }
        v38 = v37;
      }
      else
      {
        v38 = 0;
      }
      v25 = -[BMPeopleSuggesterSuggestLessFeedback initWithIdentifier:bundleId:derivedIdentifier:conversationIdentifier:handle:contactIdentifier:itemIdentifier:groupIdentifier:deviceIdentifier:userIdentifier:](v35, "initWithIdentifier:bundleId:derivedIdentifier:conversationIdentifier:handle:contactIdentifier:itemIdentifier:groupIdentifier:deviceIdentifier:userIdentifier:", v74, v75, v87, v88, v84, v15, v79, v78, v36, v38);
      v35 = v25;
LABEL_52:
      self = v35;

      v7 = v74;
LABEL_53:
      v10 = v81;
LABEL_54:

      v8 = v75;
LABEL_55:

      v9 = v83;
      v11 = v77;
LABEL_56:

      v29 = v87;
LABEL_57:

LABEL_58:
      goto LABEL_59;
    }
    if (v86)
    {
      v55 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v56 = *MEMORY[0x1E0D025B8];
      v100 = *MEMORY[0x1E0CB2D50];
      v79 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("contactIdentifier"));
      v101 = v79;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1);
      v57 = objc_claimAutoreleasedReturnValue();
      v58 = v55;
      v9 = v83;
      v76 = (void *)v57;
      v59 = (id)objc_msgSend(v58, "initWithDomain:code:userInfo:", v56, 2);
      v25 = 0;
      v15 = 0;
      *v86 = v59;
      v7 = v12;
      v6 = v82;
      goto LABEL_56;
    }
    v15 = 0;
    v25 = 0;
    v29 = v87;
    v7 = v12;
LABEL_92:
    v6 = v82;
    goto LABEL_57;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    goto LABEL_4;
  }
  if (!a4)
  {
    v25 = 0;
    v7 = 0;
    goto LABEL_62;
  }
  v19 = a4;
  v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v21 = *MEMORY[0x1E0D025B8];
  v110 = *MEMORY[0x1E0CB2D50];
  v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("identifier"));
  v111[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v111, &v110, 1);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v21;
  v8 = (id)v22;
  v91 = (void *)v23;
  v25 = 0;
  v7 = 0;
  *v19 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v24, 2);
LABEL_61:

LABEL_62:
  return v25;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[10];
  _QWORD v37[12];

  v37[10] = *MEMORY[0x1E0C80C00];
  -[BMPeopleSuggesterSuggestLessFeedback identifier](self, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMPeopleSuggesterSuggestLessFeedback bundleId](self, "bundleId");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMPeopleSuggesterSuggestLessFeedback derivedIdentifier](self, "derivedIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  -[BMPeopleSuggesterSuggestLessFeedback conversationIdentifier](self, "conversationIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  -[BMPeopleSuggesterSuggestLessFeedback handle](self, "handle");
  v7 = objc_claimAutoreleasedReturnValue();
  -[BMPeopleSuggesterSuggestLessFeedback contactIdentifier](self, "contactIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  -[BMPeopleSuggesterSuggestLessFeedback itemIdentifier](self, "itemIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPeopleSuggesterSuggestLessFeedback groupIdentifier](self, "groupIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPeopleSuggesterSuggestLessFeedback deviceIdentifier](self, "deviceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPeopleSuggesterSuggestLessFeedback userIdentifier](self, "userIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = CFSTR("identifier");
  v12 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v12;
  v37[0] = v12;
  v36[1] = CFSTR("bundleId");
  v13 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v13;
  v37[1] = v13;
  v36[2] = CFSTR("derivedIdentifier");
  v14 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v3;
  v27 = (void *)v14;
  v37[2] = v14;
  v36[3] = CFSTR("conversationIdentifier");
  v15 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v4;
  v26 = (void *)v15;
  v37[3] = v15;
  v36[4] = CFSTR("handle");
  v16 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v5;
  v25 = (void *)v16;
  v37[4] = v16;
  v36[5] = CFSTR("contactIdentifier");
  v17 = (void *)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v6;
  v37[5] = v17;
  v36[6] = CFSTR("itemIdentifier");
  v18 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v7;
  v37[6] = v18;
  v36[7] = CFSTR("groupIdentifier");
  v20 = v35;
  if (!v35)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v8;
  v37[7] = v20;
  v36[8] = CFSTR("deviceIdentifier");
  v22 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37[8] = v22;
  v36[9] = CFSTR("userIdentifier");
  v23 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37[9] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 10);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v10)
      goto LABEL_23;
  }
  else
  {

    if (v10)
      goto LABEL_23;
  }

LABEL_23:
  if (!v35)

  if (!v9)
  if (!v21)

  if (!v19)
  if (!v31)

  if (v32)
  {
    if (v33)
      goto LABEL_35;
LABEL_40:

    if (v34)
      goto LABEL_36;
LABEL_41:

    goto LABEL_36;
  }

  if (!v33)
    goto LABEL_40;
LABEL_35:
  if (!v34)
    goto LABEL_41;
LABEL_36:

  return v30;
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
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v62;
  void *v63;
  void *v64;
  void *v65;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMPeopleSuggesterSuggestLessFeedback identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMPeopleSuggesterSuggestLessFeedback identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_37;
    }
    -[BMPeopleSuggesterSuggestLessFeedback bundleId](self, "bundleId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleId");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMPeopleSuggesterSuggestLessFeedback bundleId](self, "bundleId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_37;
    }
    -[BMPeopleSuggesterSuggestLessFeedback derivedIdentifier](self, "derivedIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "derivedIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMPeopleSuggesterSuggestLessFeedback derivedIdentifier](self, "derivedIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "derivedIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_37;
    }
    -[BMPeopleSuggesterSuggestLessFeedback conversationIdentifier](self, "conversationIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "conversationIdentifier");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMPeopleSuggesterSuggestLessFeedback conversationIdentifier](self, "conversationIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "conversationIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_37;
    }
    -[BMPeopleSuggesterSuggestLessFeedback handle](self, "handle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handle");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMPeopleSuggesterSuggestLessFeedback handle](self, "handle");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handle");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_37;
    }
    -[BMPeopleSuggesterSuggestLessFeedback contactIdentifier](self, "contactIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contactIdentifier");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      -[BMPeopleSuggesterSuggestLessFeedback contactIdentifier](self, "contactIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contactIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqual:", v41);

      if (!v42)
        goto LABEL_37;
    }
    -[BMPeopleSuggesterSuggestLessFeedback itemIdentifier](self, "itemIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemIdentifier");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v43 == (void *)v44)
    {

    }
    else
    {
      v45 = (void *)v44;
      -[BMPeopleSuggesterSuggestLessFeedback itemIdentifier](self, "itemIdentifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "itemIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isEqual:", v47);

      if (!v48)
        goto LABEL_37;
    }
    -[BMPeopleSuggesterSuggestLessFeedback groupIdentifier](self, "groupIdentifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "groupIdentifier");
    v50 = objc_claimAutoreleasedReturnValue();
    if (v49 == (void *)v50)
    {

    }
    else
    {
      v51 = (void *)v50;
      -[BMPeopleSuggesterSuggestLessFeedback groupIdentifier](self, "groupIdentifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "groupIdentifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v52, "isEqual:", v53);

      if (!v54)
        goto LABEL_37;
    }
    -[BMPeopleSuggesterSuggestLessFeedback deviceIdentifier](self, "deviceIdentifier");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceIdentifier");
    v56 = objc_claimAutoreleasedReturnValue();
    if (v55 == (void *)v56)
    {

    }
    else
    {
      v57 = (void *)v56;
      -[BMPeopleSuggesterSuggestLessFeedback deviceIdentifier](self, "deviceIdentifier");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceIdentifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v58, "isEqual:", v59);

      if (!v60)
      {
LABEL_37:
        v12 = 0;
LABEL_38:

        goto LABEL_39;
      }
    }
    -[BMPeopleSuggesterSuggestLessFeedback userIdentifier](self, "userIdentifier");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userIdentifier");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62 == v63)
    {
      v12 = 1;
    }
    else
    {
      -[BMPeopleSuggesterSuggestLessFeedback userIdentifier](self, "userIdentifier");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userIdentifier");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v64, "isEqual:", v65);

    }
    goto LABEL_38;
  }
  v12 = 0;
LABEL_39:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)derivedIdentifier
{
  return self->_derivedIdentifier;
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
  objc_storeStrong((id *)&self->_derivedIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (unsigned)latestDataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  _DWORD *v4;
  objc_class *v5;
  id v6;
  void *v7;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    v5 = (objc_class *)MEMORY[0x1E0D82B90];
    v6 = a3;
    v7 = (void *)objc_msgSend([v5 alloc], "initWithData:", v6);

    v4 = -[BMPeopleSuggesterSuggestLessFeedback initByReadFrom:]([BMPeopleSuggesterSuggestLessFeedback alloc], "initByReadFrom:", v7);
    v4[4] = 0;

  }
  return v4;
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
  void *v11;
  id v13;
  _QWORD v14[11];

  v14[10] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleId"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("derivedIdentifier"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("conversationIdentifier"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("handle"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contactIdentifier"), 2, 0, 6, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("itemIdentifier"), 2, 0, 7, 13, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("groupIdentifier"), 2, 0, 8, 13, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deviceIdentifier"), 2, 0, 9, 13, 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userIdentifier"), 2, 0, 10, 13, 0);
  v14[0] = v2;
  v14[1] = v3;
  v14[2] = v4;
  v14[3] = v5;
  v14[4] = v6;
  v14[5] = v7;
  v14[6] = v8;
  v14[7] = v9;
  v14[8] = v10;
  v14[9] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1FFC0;
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
  void *v11;
  void *v13;
  _QWORD v14[11];

  v14[10] = *MEMORY[0x1E0C80C00];
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 1, 13, 0);
  v14[0] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleId"), 2, 13, 0);
  v14[1] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("derivedIdentifier"), 3, 13, 0);
  v14[2] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("conversationIdentifier"), 4, 13, 0);
  v14[3] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("handle"), 5, 13, 0);
  v14[4] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contactIdentifier"), 6, 13, 0);
  v14[5] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("itemIdentifier"), 7, 13, 0);
  v14[6] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("groupIdentifier"), 8, 13, 0);
  v14[7] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceIdentifier"), 9, 13, 0);
  v14[8] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userIdentifier"), 10, 13, 0);
  v14[9] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
