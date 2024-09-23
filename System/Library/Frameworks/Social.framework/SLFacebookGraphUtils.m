@implementation SLFacebookGraphUtils

+ (void)likeURL:(id)a3 account:(id)a4 completion:(id)a5
{
  objc_msgSend(a1, "_likeURL:requestMethod:account:completion:", a3, 1, a4, a5);
}

+ (void)unlikeURL:(id)a3 account:(id)a4 completion:(id)a5
{
  objc_msgSend(a1, "_likeURL:requestMethod:account:completion:", a3, 2, a4, a5);
}

+ (void)_likeURL:(id)a3 requestMethod:(int64_t)a4 account:(id)a5 completion:(id)a6
{
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v7 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0C8F1D0];
  v9 = a6;
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 3, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a6 + 2))(v9, v10);

}

+ (void)fetchLikeStatusForURL:(id)a3 flags:(id)a4 account:(id)a5 completion:(id)a6
{
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v7 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0C8F1D0];
  v9 = a6;
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 3, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a6 + 2))(v9, 0, v10);

}

+ (id)_parseServerResponse:(id)a3 error:(id *)a4
{
  id *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v4 = a4;
  v21[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 4, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v4)
  {
    if (v5)
      goto LABEL_9;
LABEL_7:
    v4 = 0;
    goto LABEL_22;
  }
  if (*v4)
    v7 = 1;
  else
    v7 = v5 == 0;
  if (v7)
    goto LABEL_7;
LABEL_9:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("error"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (v4)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "objectForKey:", CFSTR("code"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKey:", CFSTR("message"));
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v10;
          v12 = (void *)MEMORY[0x1E0CB35C8];
          if (v9 && v10)
          {
            v13 = objc_msgSend(v9, "integerValue");
            v20 = *MEMORY[0x1E0CB2D50];
            v21[0] = v11;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v12;
            v16 = v13;
          }
          else
          {
            v18 = CFSTR("json");
            v19 = v8;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v12;
            v16 = 1;
          }
          objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociald.facebook"), v16, v14);
          *v4 = (id)objc_claimAutoreleasedReturnValue();

        }
        v4 = 0;
      }
    }
    else
    {
      v4 = v6;
    }

  }
  else
  {
    v4 = v6;
  }
LABEL_22:

  return v4;
}

+ (id)_likeQueryStringForURL:(id)a3 flags:(unint64_t)a4
{
  char v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT user_id FROM url_like WHERE user_id = me() and url=\"%@\"), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("me"));

    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0)
        goto LABEL_4;
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT name, uid FROM user WHERE uid IN (SELECT user_id FROM url_like WHERE user_id IN (SELECT uid2 FROM friend WHERE uid1=me()) AND url=\"%@\")"), v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("friends");
      goto LABEL_9;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT like_count FROM link_stat where url=\"%@\"), v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("globalCount"));

  if ((v4 & 8) != 0)
    goto LABEL_8;
LABEL_4:
  if ((v4 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT user_id FROM url_like WHERE user_id IN (Select uid2 from friend where uid1 = me()) and url=\"%@\"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("friendCount");
LABEL_9:
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v8);

  }
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v6, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v11, 4);

  return v12;
}

@end
