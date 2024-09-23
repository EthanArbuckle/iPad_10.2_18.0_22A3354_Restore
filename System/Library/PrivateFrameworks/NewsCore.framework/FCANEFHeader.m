@implementation FCANEFHeader

- (_QWORD)initWithHeaderData:(void *)a3 wrappingKeyID:(void *)a4 wrappedKey:(void *)a5 contentType:
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  objc_super v23;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v23.receiver = a1;
  v23.super_class = (Class)FCANEFHeader;
  v13 = objc_msgSendSuper2(&v23, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v9, "copy");
    v15 = (void *)v13[4];
    v13[4] = v14;

    v16 = objc_msgSend(v10, "copy");
    v17 = (void *)v13[1];
    v13[1] = v16;

    v18 = objc_msgSend(v11, "copy");
    v19 = (void *)v13[2];
    v13[2] = v18;

    v20 = objc_msgSend(v12, "copy");
    v21 = (void *)v13[3];
    v13[3] = v20;

  }
  return v13;
}

- (_QWORD)initWithFilePath:(_QWORD *)a1
{
  _QWORD *v2;
  void *v3;
  _QWORD *v4;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingAtPath:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[FCANEFHeader initWithFileHandle:](v2, v3);
    objc_msgSend(v3, "closeFile");
    v2 = v4;

  }
  return v2;
}

- (_QWORD)initWithFileHandle:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD *v7;
  void *v9;
  id v10;
  void *v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *v31;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "readDataOfLength:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length") == 4
      && (v6 = objc_retainAutorelease(v5), *(_DWORD *)objc_msgSend(v6, "bytes") == 1178947137))
    {
      objc_msgSend(v4, "readDataOfLength:", 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "length") == 2)
      {
        v10 = objc_retainAutorelease(v9);
        objc_msgSend(v4, "readDataOfLength:", bswap32(*(unsigned __int16 *)objc_msgSend(v10, "bytes")) >> 16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
        {
          objc_msgSend(v11, "subdataWithRange:", 0, 1);
          v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v13 = *(unsigned __int8 *)objc_msgSend(v12, "bytes");
          if (objc_msgSend(v11, "length") <= v13)
          {
            v7 = 0;
          }
          else
          {
            objc_msgSend(v11, "subdataWithRange:", 1, v13);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13 + 2;
            if (v13 + 2 <= objc_msgSend(v11, "length"))
            {
              v30 = v12;
              objc_msgSend(v11, "subdataWithRange:", v13 + 1, 1);
              v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v16 = *(unsigned __int8 *)objc_msgSend(v29, "bytes");
              v17 = v14 + v16;
              if (v14 + v16 <= objc_msgSend(v11, "length"))
              {
                objc_msgSend(v11, "subdataWithRange:", v14, v16);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if (v17 >= objc_msgSend(v11, "length"))
                {
                  v7 = 0;
                  v12 = v30;
                  v15 = v31;
                  v21 = v28;
                  v18 = v29;
                }
                else
                {
                  v19 = v17 + 1;
                  objc_msgSend(v11, "subdataWithRange:", v17, 1);
                  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  v20 = *(unsigned __int8 *)objc_msgSend(v27, "bytes");
                  if (v19 + v20 <= objc_msgSend(v11, "length"))
                  {
                    objc_msgSend(v11, "subdataWithRange:", v19, v20);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v25 = v22;
                    if (objc_msgSend(v22, "length"))
                      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v22, 4, v22);
                    else
                      v23 = 0;
                    v15 = v31;
                    objc_msgSend(MEMORY[0x1E0C99DF0], "data", v25);
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "appendData:", v6);
                    objc_msgSend(v24, "appendData:", v10);
                    objc_msgSend(v24, "appendData:", v11);
                    v21 = v28;
                    a1 = -[FCANEFHeader initWithHeaderData:wrappingKeyID:wrappedKey:contentType:](a1, v24, v31, v28, v23);

                    v7 = a1;
                  }
                  else
                  {
                    v7 = 0;
                    v15 = v31;
                    v21 = v28;
                  }

                  v18 = v29;
                  v12 = v30;
                }

              }
              else
              {
                v7 = 0;
                v12 = v30;
                v15 = v31;
                v18 = v29;
              }

            }
            else
            {
              v7 = 0;
              v15 = v31;
            }

          }
        }
        else
        {
          v7 = 0;
        }

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (FCANEFHeader)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCANEFHeader init]";
    v9 = 2080;
    v10 = "FCANEFHeader.m";
    v11 = 1024;
    v12 = 206;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCANEFHeader init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerData, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_wrappedKey, 0);
  objc_storeStrong((id *)&self->_wrappingKeyID, 0);
}

@end
