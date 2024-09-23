@implementation HDMigrateECGClassificationAverageHRAndPayload

uint64_t ___HDMigrateECGClassificationAverageHRAndPayload_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  char v8;
  double v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  char v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  int v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  id v41;
  char v42;
  void *v43;
  id v44;
  char v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id obj;
  uint64_t v58;
  id v59;
  id v60;
  _QWORD v62[5];
  _QWORD v63[4];
  id v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  uint64_t v68;
  char v69;
  _QWORD v70[5];
  _QWORD v71[4];
  id v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD v75[4];
  id v76;
  id v77;
  void *v78;
  _QWORD v79[4];
  id v80;
  void *v81;
  double v82;
  double v83;
  _QWORD v84[4];
  id v85;
  uint64_t v86;
  double v87;
  _QWORD v88[4];
  id v89;
  _QWORD aBlock[5];
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  char v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v55 = HDSQLiteColumnAsInt64();
  MEMORY[0x1BCCAB18C](a2, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1BCCAB1A4](a2, 2);
  v52 = HDSQLiteColumnAsInt64();
  v5 = MEMORY[0x1BCCAB1A4](a2, 4);
  v6 = MEMORY[0x1BCCAB1A4](a2, 5);
  MEMORY[0x1BCCAB18C](a2, 6);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if ((MEMORY[0x1BCCAB204](a2, 7) & 1) != 0)
    v7 = 0;
  else
    v7 = HDSQLiteColumnAsInt64();
  v8 = MEMORY[0x1BCCAB204](a2, 8);
  v9 = MEMORY[0x1BCCAB1A4](a2, 8);
  v10 = MEMORY[0x1BCCAB204](a2, 9);
  v11 = HDSQLiteColumnAsInt64();
  objc_msgSend(*(id *)(a1 + 32), "protectedDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 40);
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = ___HDMigrateECGClassificationAverageHRAndPayload_block_invoke_2;
  v70[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v70[4] = v55;
  v14 = objc_msgSend(v12, "executeSQL:error:bindingHandler:enumerationHandler:", v13, a3, v70, 0);

  if (v14)
  {
    if (v11 > 1)
      v15 = 1;
    else
      v15 = v10;
    if (v15)
      v16 = 2;
    else
      v16 = v11;
    objc_msgSend(*(id *)(a1 + 32), "protectedDatabase");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 48);
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = ___HDMigrateECGClassificationAverageHRAndPayload_block_invoke_3;
    v63[3] = &unk_1E6CF9A00;
    v65 = v55;
    v64 = v54;
    v66 = v7;
    v69 = v8 ^ 1;
    v67 = v9;
    v68 = v16;
    LODWORD(v18) = objc_msgSend(v17, "executeSQL:error:bindingHandler:enumerationHandler:", v18, a3, v63, 0);

    if ((_DWORD)v18)
    {
      if (v11)
        v19 = v10;
      else
        v19 = 1;
      if ((v19 & 1) != 0)
        goto LABEL_69;
      v60 = *(id *)(a1 + 32);
      v59 = v53;
      v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v96 = 0u;
      v97 = 0u;
      v98 = 0u;
      v99 = 0u;
      v21 = objc_msgSend(&unk_1E6DF9248, "countByEnumeratingWithState:objects:count:", &v96, v100, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v97;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v97 != v22)
              objc_enumerationMutation(&unk_1E6DF9248);
            v24 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * i);
            v25 = objc_msgSend(v24, "integerValue");
            switch(v25)
            {
              case 201:
                if ((v11 & 0x80) != 0)
                  goto LABEL_38;
                break;
              case 202:
                if ((v11 & 0x200) != 0)
                  goto LABEL_38;
                break;
              case 203:
              case 208:
              case 209:
              case 210:
                continue;
              case 204:
                if ((v11 & 0x100) != 0)
                  goto LABEL_38;
                break;
              case 205:
                if ((v11 & 2) != 0)
                  goto LABEL_38;
                break;
              case 206:
                if ((v11 & 0x10) != 0)
                  goto LABEL_38;
                break;
              case 207:
                if ((v11 & 4) != 0)
                  goto LABEL_38;
                break;
              case 211:
                if ((v11 & 0x40) != 0)
                  goto LABEL_38;
                break;
              default:
                if (v25 == 167 && (v11 & 8) != 0)
LABEL_38:
                  objc_msgSend(v20, "setObject:forKeyedSubscript:", &unk_1E6DFCAA0, v24);
                break;
            }
          }
          v21 = objc_msgSend(&unk_1E6DF9248, "countByEnumeratingWithState:objects:count:", &v96, v100, 16);
        }
        while (v21);
      }
      v96 = 0u;
      v97 = 0u;
      v98 = 0u;
      v99 = 0u;
      obj = v20;
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v100, 16);
      if (v26)
      {
        v58 = *(_QWORD *)v97;
LABEL_43:
        v27 = 0;
        while (1)
        {
          if (*(_QWORD *)v97 != v58)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v27);
          v95 = 0;
          v95 = objc_msgSend(v28, "integerValue");
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v95, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3A28], "hk_v3UUIDWithNameSpace:name:", v59, v29);
          v30 = objc_claimAutoreleasedReturnValue();
          v91 = 0;
          v92 = &v91;
          v93 = 0x2020000000;
          v94 = 0;
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = ___HDInsertECGSymptomsAndCreateAssociationWithECGSamples_block_invoke;
          aBlock[3] = &unk_1E6CE8540;
          aBlock[4] = &v91;
          v31 = _Block_copy(aBlock);
          objc_msgSend(v60, "protectedDatabase");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v88[0] = MEMORY[0x1E0C809B0];
          v88[1] = 3221225472;
          v88[2] = ___HDInsertECGSymptomsAndCreateAssociationWithECGSamples_block_invoke_2;
          v88[3] = &unk_1E6CE9508;
          v33 = (id)v30;
          v89 = v33;
          LOBYTE(v30) = objc_msgSend(v32, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT COUNT(*) FROM objects WHERE uuid=?"), a3, v88, v31);

          if ((v30 & 1) != 0)
          {
            if (v92[3] <= 0)
            {
              objc_msgSend(v60, "protectedDatabase");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v84[0] = MEMORY[0x1E0C809B0];
              v84[1] = 3221225472;
              v84[2] = ___HDInsertECGSymptomsAndCreateAssociationWithECGSamples_block_invoke_3;
              v84[3] = &unk_1E6CE8518;
              v85 = v33;
              v86 = v52;
              v87 = v4;
              v36 = objc_msgSend(v35, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO objects (uuid, provenance, creation_date) VALUES (?, ?, ?)"), a3, v84, 0);

              objc_msgSend(v60, "protectedDatabase");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "lastInsertRowID");
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              v39 = v38 ? v36 : 0;
              if ((v39 & 1) != 0)
              {
                objc_msgSend(v60, "protectedDatabase");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v79[0] = MEMORY[0x1E0C809B0];
                v79[1] = 3221225472;
                v79[2] = ___HDInsertECGSymptomsAndCreateAssociationWithECGSamples_block_invoke_4;
                v79[3] = &unk_1E6CF9A50;
                v41 = v38;
                v82 = v5;
                v83 = v6;
                v80 = v41;
                v81 = v28;
                v42 = objc_msgSend(v40, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO samples (data_id, start_date, end_date, data_type) VALUES (?, ?, ?, ?)"), a3, v79, 0);

                if ((v42 & 1) != 0)
                {
                  objc_msgSend(v60, "protectedDatabase");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  v75[0] = MEMORY[0x1E0C809B0];
                  v75[1] = 3221225472;
                  v75[2] = ___HDInsertECGSymptomsAndCreateAssociationWithECGSamples_block_invoke_5;
                  v75[3] = &unk_1E6CE7C30;
                  v44 = v41;
                  v76 = v44;
                  v77 = obj;
                  v78 = v28;
                  v45 = objc_msgSend(v43, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO category_samples (data_id, value) VALUES (?, ?)"), a3, v75, 0);

                  if ((v45 & 1) != 0)
                  {
                    objc_msgSend(v60, "protectedDatabase");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    v71[0] = MEMORY[0x1E0C809B0];
                    v71[1] = 3221225472;
                    v71[2] = ___HDInsertECGSymptomsAndCreateAssociationWithECGSamples_block_invoke_6;
                    v71[3] = &unk_1E6CE8518;
                    v73 = v55;
                    v72 = v44;
                    v74 = v52;
                    v47 = objc_msgSend(v46, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO correlations (correlation, object, provenance) VALUES (?, ?, ?)"), a3, v71, 0);

                    v34 = v47 ^ 1;
                  }
                  else
                  {
                    v34 = 1;
                  }

                }
                else
                {
                  v34 = 1;
                }

              }
              else
              {
                v34 = 1;
              }

            }
            else
            {
              v34 = 3;
            }
          }
          else
          {
            v34 = 1;
          }

          _Block_object_dispose(&v91, 8);
          if (v34 != 3)
          {
            if (v34)
              break;
          }
          if (v26 == ++v27)
          {
            v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v100, 16);
            if (v26)
              goto LABEL_43;
            goto LABEL_67;
          }
        }
      }
      else
      {
LABEL_67:
        v34 = 0;
      }

      v48 = v34 == 0;
      if (!v34)
      {
LABEL_69:
        objc_msgSend(*(id *)(a1 + 32), "protectedDatabase");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = *(_QWORD *)(a1 + 56);
        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = ___HDMigrateECGClassificationAverageHRAndPayload_block_invoke_4;
        v62[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
        v62[4] = v55;
        v48 = objc_msgSend(v49, "executeSQL:error:bindingHandler:enumerationHandler:", v50, a3, v62, 0);

      }
    }
    else
    {
      v48 = 0;
    }

  }
  else
  {
    v48 = 0;
  }

  return v48;
}

uint64_t ___HDMigrateECGClassificationAverageHRAndPayload_block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t ___HDMigrateECGClassificationAverageHRAndPayload_block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4;
  const char *v5;

  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 40));
  v4 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes");
  if (v4)
    v5 = (const char *)v4;
  else
    v5 = "";
  sqlite3_bind_blob(a2, 2, v5, objc_msgSend(*(id *)(a1 + 32), "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_int64(a2, 3, *(_QWORD *)(a1 + 48));
  if (*(_BYTE *)(a1 + 72))
    sqlite3_bind_double(a2, 4, *(double *)(a1 + 56));
  else
    sqlite3_bind_null(a2, 4);
  return sqlite3_bind_int64(a2, 5, *(_QWORD *)(a1 + 64));
}

uint64_t ___HDMigrateECGClassificationAverageHRAndPayload_block_invoke_4(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

@end
