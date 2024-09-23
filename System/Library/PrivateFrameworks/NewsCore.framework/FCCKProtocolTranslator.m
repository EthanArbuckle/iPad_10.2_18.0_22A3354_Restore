@implementation FCCKProtocolTranslator

- (id)recordFromPRecord:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  double *v26;
  double *v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  double *v35;
  double *v36;
  double v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v58 = a1;
  v59 = 0;
  if (!a1 || !v3)
    goto LABEL_32;
  objc_msgSend(MEMORY[0x1E0C95088], "defaultRecordZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copy");

  v8 = objc_alloc(MEMORY[0x1E0C95070]);
  objc_msgSend(v4, "recordIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    v11 = *(id *)(v9 + 8);
    v12 = v11;
    if (v11)
    {
      v13 = (void *)*((_QWORD *)v11 + 1);
      goto LABEL_6;
    }
  }
  else
  {
    v12 = 0;
  }
  v13 = 0;
LABEL_6:
  v14 = v13;
  v15 = objc_msgSend(v8, "initWithRecordName:zoneID:", v14, v7);

  v16 = objc_alloc(MEMORY[0x1E0C95048]);
  objc_msgSend(v4, "type");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)v15;
  v19 = (void *)objc_msgSend(v16, "_initSkippingValidationWithRecordType:recordID:", v18, v15);

  objc_msgSend(v4, "etag");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v19;
  objc_msgSend(v19, "setEtag:", v20);

  v56 = (void *)v7;
  if (objc_msgSend(v4, "hasTimeStatistics"))
  {
    objc_msgSend(v4, "timeStatistics");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (!v21 || !*(_QWORD *)(v21 + 8))
    {
      objc_msgSend(v19, "setCreationDate:", 0);
      goto LABEL_14;
    }
    v23 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "timeStatistics");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    if (v24)
    {
      v26 = (double *)*(id *)(v24 + 8);
      v27 = v26;
      if (v26)
      {
        v28 = v26[1];
LABEL_12:
        objc_msgSend(v23, "dateWithTimeIntervalSinceReferenceDate:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setCreationDate:", v29);

LABEL_14:
        objc_msgSend(v4, "timeStatistics");
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = (void *)v30;
        if (!v30 || !*(_QWORD *)(v30 + 16))
        {
          objc_msgSend(v19, "setModificationDate:", 0);
          goto LABEL_21;
        }
        v32 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v4, "timeStatistics");
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)v33;
        if (v33)
        {
          v35 = (double *)*(id *)(v33 + 16);
          v36 = v35;
          if (v35)
          {
            v37 = v35[1];
LABEL_19:
            objc_msgSend(v32, "dateWithTimeIntervalSinceReferenceDate:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setModificationDate:", v38);

LABEL_21:
            goto LABEL_22;
          }
        }
        else
        {
          v36 = 0;
        }
        v37 = 0.0;
        goto LABEL_19;
      }
    }
    else
    {
      v27 = 0;
    }
    v28 = 0.0;
    goto LABEL_12;
  }
LABEL_22:
  objc_msgSend(v19, "setTrackChanges:", 0);
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v57 = v4;
  objc_msgSend(v4, "fields");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v61 != v42)
          objc_enumerationMutation(v39);
        v44 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_msgSend(v44, "identifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "name");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "hasPrefix:", CFSTR("_"));

        if ((v47 & 1) == 0)
        {
          objc_msgSend(v59, "valueStore");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "value");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCCKProtocolTranslator objectRepresentationFromFieldValue:](v58, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "identifier");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "name");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setObjectNoValidate:forKey:", v50, v52);

        }
      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
    }
    while (v41);
  }

  objc_msgSend(v59, "setTrackChanges:", 1);
  v4 = v57;
  objc_msgSend(v57, "conflictLoserEtags");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setConflictLoserEtags:", v53);

  objc_msgSend(v59, "setKnownToServer:", 1);
LABEL_32:

  return v59;
}

- (id)objectRepresentationFromFieldValue:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  double v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!a1)
  {
    v8 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v3, "listValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 || objc_msgSend(v4, "type") == 16)
  {

LABEL_5:
    objc_msgSend(v4, "listValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v4, "listValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          -[FCCKProtocolTranslator objectRepresentationFromFieldValue:](a1, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v8, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
      }
      while (v11);
    }

    goto LABEL_15;
  }
  if (objc_msgSend(v4, "type") == 9)
    goto LABEL_5;
  v8 = 0;
  switch(objc_msgSend(v4, "type"))
  {
    case 1u:
      objc_msgSend(v4, "bytesValue");
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 2u:
      v18 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v4, "dateValue");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (id)v19;
      if (v19)
        v21 = *(double *)(v19 + 8);
      else
        v21 = 0.0;
      objc_msgSend(v18, "dateWithTimeIntervalSinceReferenceDate:", v21);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 3u:
      objc_msgSend(v4, "stringValue");
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 5u:
      objc_msgSend(v4, "referenceValue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      -[FCCKProtocolTranslator referenceFromPReference:error:](v22, &v24);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v24;

      if ((v20 || !v8) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid field value (record identifier) from server: %@"), v20);
        *(_DWORD *)buf = 136315906;
        v30 = "-[FCCKProtocolTranslator objectRepresentationFromFieldValue:]";
        v31 = 2080;
        v32 = "FCCKProtocolTranslator.m";
        v33 = 1024;
        v34 = 251;
        v35 = 2114;
        v36 = v23;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
LABEL_28:

      break;
    case 7u:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "signedValue"));
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 8u:
      v17 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "doubleValue");
      objc_msgSend(v17, "numberWithDouble:");
      v16 = objc_claimAutoreleasedReturnValue();
LABEL_30:
      v8 = (void *)v16;
      break;
    default:
      break;
  }
LABEL_15:

  return v8;
}

- (id)fieldValueOfType:(void *)a3 withObject:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  FCCKPDate *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setType:", a2);
    switch((int)a2)
    {
      case 1:
        objc_msgSend(v6, "setBytesValue:", v5);
        break;
      case 2:
        v17 = objc_alloc_init(FCCKPDate);
        objc_msgSend(v6, "setDateValue:", v17);

        objc_msgSend(v5, "timeIntervalSinceReferenceDate");
        v19 = v18;
        objc_msgSend(v6, "dateValue");
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          *(_BYTE *)(v20 + 16) |= 1u;
          *(_QWORD *)(v20 + 8) = v19;
        }

        break;
      case 3:
        objc_msgSend(v6, "setStringValue:", v5);
        break;
      case 5:
        v21 = (void *)objc_opt_new();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v5, "recordID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCCKProtocolTranslator pRecordIdentifierFromRecordID:](a1, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setRecordIdentifier:", v23);

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[FCCKProtocolTranslator pRecordIdentifierFromRecordID:](a1, v5);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setRecordIdentifier:", v22);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_29;
            -[FCCKProtocolTranslator pReferenceFromReference:error:](a1, v5);
            v22 = v21;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }

LABEL_29:
        objc_msgSend(v6, "setReferenceValue:", v21);

        break;
      case 7:
        objc_msgSend(v6, "setSignedValue:", objc_msgSend(v5, "longLongValue"));
        break;
      case 8:
        objc_msgSend(v5, "doubleValue");
        objc_msgSend(v6, "setDoubleValue:");
        break;
      case 9:
      case 10:
      case 11:
      case 13:
      case 15:
      case 17:
      case 18:
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v24 = v5;
        v7 = v5;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v26;
          v11 = MEMORY[0x1E0C81028];
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v26 != v10)
                objc_enumerationMutation(v7);
              v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v12);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              {
                v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Nesting arrays not supported"));
                *(_DWORD *)buf = 136315906;
                v30 = "-[FCCKProtocolTranslator(RecordFields) fieldValueOfType:withObject:]";
                v31 = 2080;
                v32 = "FCCKRecordFieldConversion.m";
                v33 = 1024;
                v34 = 175;
                v35 = 2114;
                v36 = v15;
                _os_log_error_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

              }
              -[FCCKProtocolTranslator fieldValueFromObject:](a1, v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "addListValue:", v14);

              ++v12;
            }
            while (v9 != v12);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
          }
          while (v9);
        }

        v5 = v24;
        break;
      default:
        break;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)fieldValueFromObject:(uint64_t)a1
{
  void *v2;
  id v4;
  uint64_t v5;

  v2 = 0;
  if (a1 && a2)
  {
    v4 = a2;
    v5 = -[FCCKProtocolTranslator fieldValueTypeFromObject:](a1, v4);
    -[FCCKProtocolTranslator fieldValueOfType:withObject:](a1, v5, v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (uint64_t)fieldValueTypeFromObject:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  objc_class *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!a1)
  {
    v4 = 0;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = 2;
      goto LABEL_24;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = 3;
      goto LABEL_24;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
LABEL_11:
      v4 = 1;
      goto LABEL_24;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v3;
      if (!objc_msgSend(v5, "count"))
      {

        v4 = 9;
        goto LABEL_24;
      }
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      CKValidateRecordArrayValue(v5);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v4 = 13;
LABEL_18:

        goto LABEL_24;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = 11;
        goto LABEL_18;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = 10;
        goto LABEL_18;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (CFNumberIsFloatType((CFNumberRef)v6))
          v4 = 18;
        else
          v4 = 17;
        goto LABEL_18;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = 15;
        goto LABEL_18;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v12 = objc_alloc(MEMORY[0x1E0CB3940]);
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("Can't encode array %@ of unknown child class: %@"), v5, v14);
        *(_DWORD *)buf = 136315906;
        v17 = "-[FCCKProtocolTranslator(RecordFields) fieldValueTypeFromObject:]";
        v18 = 2080;
        v19 = "FCCKRecordFieldConversion.m";
        v20 = 1024;
        v21 = 98;
        v22 = 2114;
        v23 = v15;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v4 = 5;
        goto LABEL_24;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = objc_alloc(MEMORY[0x1E0CB3940]);
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("Can't encode object %@ of class %@"), v3, v10);
      *(_DWORD *)buf = 136315906;
      v17 = "-[FCCKProtocolTranslator(RecordFields) fieldValueTypeFromObject:]";
      v18 = 2080;
      v19 = "FCCKRecordFieldConversion.m";
      v20 = 1024;
      v21 = 110;
      v22 = 2114;
      v23 = v11;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    goto LABEL_11;
  }
  if (CFNumberIsFloatType((CFNumberRef)v3))
    v4 = 8;
  else
    v4 = 7;
LABEL_24:

  return v4;
}

+ (id)sharedInstance
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__FCCKProtocolTranslator_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (qword_1ED0F87E0 != -1)
    dispatch_once(&qword_1ED0F87E0, block);
  return (id)_MergedGlobals_210;
}

- (id)pRecordIdentifierFromRecordID:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString _FCCKPIdentifierWithType:](v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPRecordIdentifier setValue:]((uint64_t)v3, v5);

  objc_msgSend(v2, "zoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  v8 = (_QWORD *)objc_opt_new();
  objc_msgSend(v7, "zoneName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString _FCCKPIdentifierWithType:](v9, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPRecordZoneIdentifier setValue:]((uint64_t)v8, v10);

  objc_msgSend(v7, "ownerName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C94730]) & 1) == 0
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unknown owner"));
    v17 = 136315906;
    v18 = "-[FCCKProtocolTranslator pUserIdentifierFromUserRecordName:]";
    v19 = 2080;
    v20 = "FCCKProtocolTranslator.m";
    v21 = 1024;
    v22 = 68;
    v23 = 2114;
    v24 = v16;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v17, 0x26u);

  }
  -[NSString _FCCKPIdentifierWithType:](CFSTR("_defaultOwner"), 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPRecordZoneIdentifier setOwnerIdentifier:]((uint64_t)v8, v12);

  if (v8)
    v13 = (void *)v8[1];
  else
    v13 = 0;
  v14 = v13;

  if (v14)
    v14 = v8;

  -[FCCKPRecordIdentifier setZoneIdentifier:]((uint64_t)v3, v14);
  return v3;
}

- (id)pQueryFromQuery:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  FCCKPRecordType *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
  {
    v11 = 0;
    goto LABEL_24;
  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "predicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v7, "FCCKPQueryFiltersWithTranslator:error:", a1, &v32);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v32;

  if (v8)
  {
    CKVerifyFilters(v8);
    v10 = objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v12 = v8;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v29;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v29 != v14)
              objc_enumerationMutation(v12);
            -[FCCKPQuery addFilters:]((uint64_t)v6, *(void **)(*((_QWORD *)&v28 + 1) + 8 * v15++));
          }
          while (v13 != v15);
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        }
        while (v13);
      }

      v16 = objc_alloc_init(FCCKPRecordType);
      objc_msgSend(v5, "recordType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKPRecordType setName:](v16, "setName:", v17);

      -[FCCKPQuery addTypes:]((uint64_t)v6, v16);
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      objc_msgSend(v5, "sortDescriptors");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v25;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v25 != v20)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v21), "FCCKPQuerySort");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[FCCKPQuery addSorts:]((uint64_t)v6, v22);

            ++v21;
          }
          while (v19 != v21);
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
        }
        while (v19);
      }

      v11 = v6;
      goto LABEL_23;
    }
    v9 = (id)v10;
  }
  if (a3)
  {
    v9 = objc_retainAutorelease(v9);
    *a3 = v9;
  }

  v11 = 0;
LABEL_23:

LABEL_24:
  return v11;
}

void __40__FCCKProtocolTranslator_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_210;
  _MergedGlobals_210 = v0;

}

- (id)referenceFromPReference:(void *)a1 error:(_QWORD *)a2
{
  id v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v21;
  void *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(v3, "recordIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C95088];
  v6 = v4;
  objc_msgSend(v5, "defaultRecordZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v10 = objc_alloc(MEMORY[0x1E0C95070]);
  if (v6)
    v11 = (void *)v6[1];
  else
    v11 = 0;
  v12 = v11;

  if (v12)
    v13 = (void *)v12[1];
  else
    v13 = 0;
  v14 = v13;
  v15 = (void *)objc_msgSend(v10, "initWithRecordName:zoneID:", v14, v9);

  if (!v15)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid record identifier from server %@: %@"), v3, 0);
      *(_DWORD *)buf = 136315906;
      v24 = "-[FCCKProtocolTranslator referenceFromPReference:error:]";
      v25 = 2080;
      v26 = "FCCKProtocolTranslator.m";
      v27 = 1024;
      v28 = 121;
      v29 = 2114;
      v30 = v21;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v18 = 0;
    if (a2)
      goto LABEL_20;
    goto LABEL_21;
  }
  if (objc_msgSend(v3, "hasType"))
  {
    v16 = objc_msgSend(v3, "type");
    if (v16 == 1)
    {
      v17 = 1;
      goto LABEL_19;
    }
    if (v16 != 2)
    {
      if (v16 == 3)
      {
        v17 = *MEMORY[0x1E0C94A40];
        goto LABEL_19;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected reference type"));
        *(_DWORD *)buf = 136315906;
        v24 = "-[FCCKProtocolTranslator referenceFromPReference:error:]";
        v25 = 2080;
        v26 = "FCCKProtocolTranslator.m";
        v27 = 1024;
        v28 = 115;
        v29 = 2114;
        v30 = v22;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
    }
  }
  v17 = 0;
LABEL_19:
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C950C0]), "initWithRecordID:action:", v15, v17);
  if (a2)
  {
LABEL_20:
    v19 = objc_retainAutorelease(0);
    *a2 = 0;
  }
LABEL_21:

  return v18;
}

- (id)pReferenceFromReference:(uint64_t)a1 error:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v3, "recordID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKProtocolTranslator pRecordIdentifierFromRecordID:](a1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRecordIdentifier:", v6);

    if (objc_msgSend(v3, "referenceAction") == 1)
    {
      v7 = 1;
    }
    else
    {
      v8 = objc_msgSend(v3, "referenceAction");
      if (v8 == *MEMORY[0x1E0C94A40])
        v7 = 3;
      else
        v7 = 2;
    }
    objc_msgSend(v4, "setType:", v7);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
