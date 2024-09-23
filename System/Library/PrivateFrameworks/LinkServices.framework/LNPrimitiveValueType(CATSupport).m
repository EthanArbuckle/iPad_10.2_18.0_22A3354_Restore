@implementation LNPrimitiveValueType(CATSupport)

- (const)cat_dialogType
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "typeIdentifier");
  if ((unint64_t)(v1 - 1) > 9)
    return CFSTR("dialog.String");
  else
    return off_1E45DCE00[v1 - 1];
}

- (id)cat_value:()CATSupport
{
  id v4;
  void *v5;
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
  void *v19;
  id v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _QWORD v71[9];
  _QWORD v72[9];
  const __CFString *v73;
  void *v74;
  void *v75;
  const __CFString *v76;
  void *v77;
  const __CFString *v78;
  void *v79;
  const __CFString *v80;
  _QWORD v81[3];

  v81[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  switch(objc_msgSend(a1, "typeIdentifier"))
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      objc_msgSend(v4, "value");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      v80 = CFSTR("secs");
      v7 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v9 = v8;
        else
          v9 = 0;
      }
      else
      {
        v9 = 0;
      }
      v20 = v9;

      objc_msgSend(v20, "timeIntervalSince1970");
      v22 = v21;

      objc_msgSend(v7, "numberWithDouble:", v22);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v81[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, &v80, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 9:
      v78 = CFSTR("secs");
      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v13 = v12;
        else
          v13 = 0;
      }
      else
      {
        v13 = 0;
      }
      v23 = v13;

      objc_msgSend(v11, "dateFromComponents:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "timeIntervalSince1970");
      objc_msgSend(v10, "numberWithDouble:");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_29:
      break;
    case 10:
      v76 = CFSTR("values");
      v73 = CFSTR("address");
      v71[0] = CFSTR("administrativeArea");
      objc_msgSend(v4, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v14;
        else
          v15 = 0;
      }
      else
      {
        v15 = 0;
      }
      v26 = v15;

      objc_msgSend(v26, "administrativeArea");
      v27 = objc_claimAutoreleasedReturnValue();

      v72[0] = v27;
      v71[1] = CFSTR("country");
      objc_msgSend(v4, "value");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = (void *)v27;
      if (v28)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v29 = v28;
        else
          v29 = 0;
      }
      else
      {
        v29 = 0;
      }
      v32 = v29;

      objc_msgSend(v32, "country");
      v33 = objc_claimAutoreleasedReturnValue();

      v72[1] = v33;
      v71[2] = CFSTR("countryCode");
      objc_msgSend(v4, "value");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v35 = v34;
        else
          v35 = 0;
      }
      else
      {
        v35 = 0;
      }
      v36 = v35;

      objc_msgSend(v36, "ISOcountryCode");
      v37 = objc_claimAutoreleasedReturnValue();

      v72[2] = v37;
      v71[3] = CFSTR("locality");
      objc_msgSend(v4, "value");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = (void *)v37;
      if (v38)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v39 = v38;
        else
          v39 = 0;
      }
      else
      {
        v39 = 0;
      }
      v40 = v39;

      objc_msgSend(v40, "locality");
      v41 = objc_claimAutoreleasedReturnValue();

      v72[3] = v41;
      v71[4] = CFSTR("name");
      objc_msgSend(v4, "value");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (v42)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v43 = v42;
        else
          v43 = 0;
      }
      else
      {
        v43 = 0;
      }
      v44 = v43;

      objc_msgSend(v44, "name");
      v45 = objc_claimAutoreleasedReturnValue();

      v72[4] = v45;
      v71[5] = CFSTR("postCode");
      objc_msgSend(v4, "value");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = (void *)v45;
      if (v46)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v47 = v46;
        else
          v47 = 0;
      }
      else
      {
        v47 = 0;
      }
      v48 = v47;

      objc_msgSend(v48, "postalCode");
      v49 = objc_claimAutoreleasedReturnValue();

      v72[5] = v49;
      v71[6] = CFSTR("subAdministrativeArea");
      objc_msgSend(v4, "value");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = (void *)v49;
      if (v50)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v51 = v50;
        else
          v51 = 0;
      }
      else
      {
        v51 = 0;
      }
      v52 = v51;

      objc_msgSend(v52, "subAdministrativeArea");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      v72[6] = v53;
      v71[7] = CFSTR("subThoroughfare");
      objc_msgSend(v4, "value");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (v54)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v55 = v54;
        else
          v55 = 0;
      }
      else
      {
        v55 = 0;
      }
      v56 = v55;

      objc_msgSend(v56, "subThoroughfare");
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      v72[7] = v57;
      v71[8] = CFSTR("thoroughfare");
      objc_msgSend(v4, "value");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (void *)v41;
      v60 = (void *)v33;
      if (v58)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v61 = v58;
        else
          v61 = 0;
      }
      else
      {
        v61 = 0;
      }
      v62 = v61;

      objc_msgSend(v62, "thoroughfare");
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      v72[8] = v63;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 9);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v64;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v65;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v66;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 11:
      objc_msgSend(v4, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v17 = v16;
        else
          v17 = 0;
      }
      else
      {
        v17 = 0;
      }
      v30 = v17;

      objc_msgSend(v30, "absoluteString");
      v31 = objc_claimAutoreleasedReturnValue();
      goto LABEL_39;
    case 12:
      objc_msgSend(v4, "value");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v19 = v18;
        else
          v19 = 0;
      }
      else
      {
        v19 = 0;
      }
      v30 = v19;

      objc_msgSend(v30, "string");
      v31 = objc_claimAutoreleasedReturnValue();
LABEL_39:
      v5 = (void *)v31;

      break;
    default:
      v5 = 0;
      break;
  }

  return v5;
}

- (const)cat_keyPath
{
  uint64_t v1;
  const __CFString *v2;

  v1 = objc_msgSend(a1, "typeIdentifier");
  v2 = CFSTR("longLocation");
  if (v1 != 10)
    v2 = 0;
  if (v1 == 8)
    return CFSTR("dateTimeDescriptive");
  else
    return v2;
}

@end
