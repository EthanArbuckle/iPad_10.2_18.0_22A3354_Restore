@implementation CNContact(MKExtras)

+ (id)mapsContactKeys
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[18];

  v11[17] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C972A8], "descriptorForRequiredKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0C96898];
  v11[0] = v0;
  v11[1] = v1;
  v2 = *MEMORY[0x1E0C966D0];
  v11[2] = *MEMORY[0x1E0C96790];
  v11[3] = v2;
  v3 = *MEMORY[0x1E0C966C0];
  v11[4] = *MEMORY[0x1E0C96780];
  v11[5] = v3;
  v4 = *MEMORY[0x1E0C967A0];
  v11[6] = *MEMORY[0x1E0C96798];
  v11[7] = v4;
  v5 = *MEMORY[0x1E0C967E0];
  v11[8] = *MEMORY[0x1E0C967D8];
  v11[9] = v5;
  v6 = *MEMORY[0x1E0C967B8];
  v11[10] = *MEMORY[0x1E0C967D0];
  v11[11] = v6;
  v7 = *MEMORY[0x1E0C967C0];
  v11[12] = *MEMORY[0x1E0C96758];
  v11[13] = v7;
  v8 = *MEMORY[0x1E0C967F0];
  v11[14] = *MEMORY[0x1E0C966A8];
  v11[15] = v8;
  v11[16] = *MEMORY[0x1E0C968A0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (uint64_t)_maps_isEqualToContact:()MKExtras
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v51;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  char v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  char v76;
  void *v77;
  uint64_t v78;
  char v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;

  v4 = a3;
  if (a1 != v4)
  {
    objc_msgSend(MEMORY[0x1E0C97200], "mapsContactKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(a1, "areKeysAvailable:", v5)
      || !objc_msgSend(v4, "areKeysAvailable:", v5))
    {
      v49 = 0;
LABEL_72:

      goto LABEL_73;
    }
    objc_msgSend(a1, "namePrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "namePrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqualToString:", v7))
    {
      v49 = 0;
LABEL_71:

      goto LABEL_72;
    }
    objc_msgSend(a1, "givenName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "givenName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isEqualToString:", v9))
    {
      v49 = 0;
LABEL_70:

      goto LABEL_71;
    }
    objc_msgSend(a1, "middleName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "middleName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "isEqualToString:", v11))
    {
      v49 = 0;
LABEL_69:

      goto LABEL_70;
    }
    objc_msgSend(a1, "familyName");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "familyName");
    v13 = objc_claimAutoreleasedReturnValue();
    v92 = (void *)v12;
    v14 = (void *)v12;
    v15 = (void *)v13;
    if (!objc_msgSend(v14, "isEqualToString:", v13))
    {
      v49 = 0;
LABEL_68:

      goto LABEL_69;
    }
    v89 = v10;
    objc_msgSend(a1, "nameSuffix");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nameSuffix");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v16;
    if (!objc_msgSend(v16, "isEqualToString:", v90))
    {
      v49 = 0;
      v10 = v89;
LABEL_67:

      goto LABEL_68;
    }
    objc_msgSend(a1, "nickname");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nickname");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v17;
    if (!objc_msgSend(v17, "isEqualToString:"))
    {
      v49 = 0;
      v10 = v89;
LABEL_66:

      goto LABEL_67;
    }
    objc_msgSend(a1, "phoneticGivenName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneticGivenName");
    v86 = v18;
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v18, "isEqualToString:"))
    {
      v49 = 0;
      v10 = v89;
LABEL_65:

      goto LABEL_66;
    }
    objc_msgSend(a1, "phoneticMiddleName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneticMiddleName");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v19;
    if (!objc_msgSend(v19, "isEqualToString:"))
    {
      v49 = 0;
      v10 = v89;
LABEL_64:

      goto LABEL_65;
    }
    objc_msgSend(a1, "phoneticFamilyName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneticFamilyName");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v20;
    if (!objc_msgSend(v20, "isEqualToString:", v81))
    {
      v49 = 0;
      v10 = v89;
LABEL_63:

      goto LABEL_64;
    }
    objc_msgSend(a1, "organizationName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "organizationName");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v21;
    if (!objc_msgSend(v21, "isEqualToString:", v69))
    {
      v49 = 0;
      v10 = v89;
LABEL_62:

      goto LABEL_63;
    }
    objc_msgSend(a1, "jobTitle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "jobTitle");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v22;
    if (!objc_msgSend(v22, "isEqualToString:", v62))
    {
      v49 = 0;
LABEL_61:
      v10 = v89;

      goto LABEL_62;
    }
    v60 = v15;
    objc_msgSend(a1, "phoneNumbers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneNumbers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v23;
    v26 = v24;
    v78 = objc_msgSend(v25, "count");
    v71 = v26;
    if (v78 != objc_msgSend(v26, "count"))
    {
      v49 = 0;
      v80 = v26;
LABEL_53:
      v51 = v25;
LABEL_60:

      v15 = v60;
      goto LABEL_61;
    }
    v64 = objc_msgSend(v25, "count");
    v68 = v25;
    if (v64)
    {
      v27 = 0;
      while (1)
      {
        objc_msgSend(v25, "objectAtIndexedSubscript:", v27);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "objectAtIndexedSubscript:", v27);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = objc_msgSend(v75, "isEqualIgnoringIdentifiers:", v72);

        if ((v79 & 1) == 0)
          break;
        ++v27;
        v25 = v68;
        if (v64 == v27)
          goto LABEL_20;
      }
      v49 = 0;
      v80 = v71;
      v25 = v68;
      goto LABEL_53;
    }
LABEL_20:

    objc_msgSend(a1, "emailAddresses");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "emailAddresses");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v28;
    v31 = v29;
    v61 = v30;
    v32 = objc_msgSend(v30, "count");
    v80 = v31;
    if (v32 != objc_msgSend(v31, "count"))
      goto LABEL_51;
    v57 = objc_msgSend(v61, "count");
    if (v57)
    {
      v33 = 0;
      while (1)
      {
        objc_msgSend(v61, "objectAtIndexedSubscript:", v33);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v33;
        objc_msgSend(v80, "objectAtIndexedSubscript:", v33);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend(v73, "isEqualIgnoringIdentifiers:", v65);

        if ((v76 & 1) == 0)
          break;
        ++v33;
        if (v57 == v34 + 1)
          goto LABEL_25;
      }
LABEL_51:
      v49 = 0;
      v77 = v61;

LABEL_59:
      v51 = v61;
      v25 = v68;
      goto LABEL_60;
    }
LABEL_25:

    objc_msgSend(a1, "postalAddresses");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postalAddresses");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v35;
    v38 = v36;
    v77 = v37;
    v39 = objc_msgSend(v37, "count");
    v74 = v38;
    if (v39 == objc_msgSend(v38, "count"))
    {
      v53 = objc_msgSend(v77, "count");
      if (!v53)
      {
LABEL_30:

        objc_msgSend(a1, "urlAddresses");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "urlAddresses");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v41;
        v44 = v42;
        v59 = v43;
        v45 = objc_msgSend(v43, "count");
        v56 = v44;
        if (v45 == objc_msgSend(v44, "count"))
        {
          v46 = objc_msgSend(v43, "count");
          if (v46)
          {
            v47 = 0;
            v54 = v46 - 1;
            do
            {
              objc_msgSend(v59, "objectAtIndexedSubscript:", v47, v54);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "objectAtIndexedSubscript:", v47);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = objc_msgSend(v48, "isEqualIgnoringIdentifiers:", v67);

              if (!(_DWORD)v49)
                break;
            }
            while (v54 != v47++);
          }
          else
          {
            v49 = 1;
          }
        }
        else
        {
          v49 = 0;
        }

        goto LABEL_58;
      }
      v40 = 0;
      while (1)
      {
        objc_msgSend(v77, "objectAtIndexedSubscript:", v40, v53);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "objectAtIndexedSubscript:", v40);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v58, "isEqualIgnoringIdentifiers:", v55);

        if ((v66 & 1) == 0)
          break;
        if (v53 == ++v40)
          goto LABEL_30;
      }
    }
    v49 = 0;
    v59 = v77;

LABEL_58:
    goto LABEL_59;
  }
  v49 = 1;
LABEL_73:

  return v49;
}

+ (const)_mapkit_sharedLocationContactIdentifer
{
  return CFSTR("ShareLocationContactIdentifier");
}

- (uint64_t)_mapkit_isSharedLocationContact
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "postalAddresses");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97200], "_mapkit_sharedLocationContactIdentifer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

@end
