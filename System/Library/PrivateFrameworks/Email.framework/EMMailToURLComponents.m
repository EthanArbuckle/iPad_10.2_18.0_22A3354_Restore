@implementation EMMailToURLComponents

+ (id)componentsWithURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:", v4);

  return v5;
}

- (EMMailToURLComponents)init
{
  return -[EMMailToURLComponents initWithURL:](self, "initWithURL:", 0);
}

- (EMMailToURLComponents)initWithURL:(id)a3
{
  id v4;
  EMMailToURLComponents *v5;
  EMMailToURLComponents *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EMMailToURLComponents;
  v5 = -[EMMailToURLComponents init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[EMMailToURLComponents _decomposeURL:](v5, "_decomposeURL:", v4);

  return v6;
}

- (void)_decomposeURL:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSString *v27;
  void *v28;
  int v29;
  NSString *v30;
  uint64_t v31;
  NSArray *v32;
  NSArray *toRecipients;
  NSArray *v34;
  NSArray *ccRecipients;
  NSArray *v36;
  NSArray *bccRecipients;
  NSString *subject;
  NSString *v39;
  NSString *body;
  NSString *v41;
  NSString *from;
  NSString *v43;
  void *context;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSString *v58;
  NSString *v59;
  NSString *v60;
  id obj;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
    goto LABEL_48;
  v50 = v3;
  objc_msgSend(v3, "absoluteString");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v55, "rangeOfString:options:", CFSTR("mailto:"), 9);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_47;
  v6 = v4;
  context = (void *)MEMORY[0x1BCCC8A30]();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "substringFromIndex:", v5 + v6);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v51, "rangeOfString:", CFSTR("?"));
  v9 = v7;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v45 = 0;
    v10 = v51;
  }
  else
  {
    objc_msgSend(v51, "substringFromIndex:", v7 + v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "substringToIndex:", v9);
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("&"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }
  v13 = (void *)MEMORY[0x1E0D1E448];
  v52 = v10;
  objc_msgSend(v10, "stringByRemovingPercentEncoding");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addressListFromHeaderValue:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = v15;
  if (objc_msgSend(v15, "count"))
    objc_msgSend(v56, "addObjectsFromArray:", v15);
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v45;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
  if (!v16)
  {
    v59 = 0;
    v60 = 0;
    v58 = 0;
    goto LABEL_40;
  }
  v59 = 0;
  v60 = 0;
  v58 = 0;
  v17 = *(_QWORD *)v63;
  v48 = *MEMORY[0x1E0D1E600];
  v46 = *MEMORY[0x1E0D1E518];
  v47 = *MEMORY[0x1E0D1E520];
  do
  {
    v18 = 0;
    do
    {
      if (*(_QWORD *)v63 != v17)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v18);
      v21 = objc_msgSend(v19, "rangeOfString:", CFSTR("="));
      if (v21 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v22 = v20;
        objc_msgSend(v19, "substringToIndex:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "lowercaseString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "substringFromIndex:", v21 + v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "length") && objc_msgSend(v25, "length"))
        {
          objc_msgSend(v25, "ef_stringByReplacingPercentEscapesUsingEncoding:", 4);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v24, "isEqualToString:", CFSTR("body")))
          {
            objc_msgSend(v26, "ef_stringByEscapingForMessageBody");
            v27 = v60;
            v60 = (NSString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_23;
          }
          if (objc_msgSend(v24, "isEqualToString:", CFSTR("subject")))
          {
            v27 = v59;
            v59 = v26;
            goto LABEL_23;
          }
          objc_msgSend(MEMORY[0x1E0C99E98], "em_mailToFromQueryItemKey");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v24, "ef_caseInsensitiveIsEqualToString:", v28);

          if (v29)
          {
            v27 = v58;
            v58 = v26;
            goto LABEL_23;
          }
          if ((objc_msgSend(v24, "isEqualToString:", CFSTR("attachment")) & 1) == 0
            && (objc_msgSend(v24, "isEqualToString:", CFSTR("attachdircontent")) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0D1E448], "addressListFromHeaderValue:", v26);
            v30 = (NSString *)objc_claimAutoreleasedReturnValue();
            v27 = v30;
            if (v30 && -[NSString count](v30, "count"))
            {
              if (objc_msgSend(v24, "isEqualToString:", v48))
                objc_msgSend(v56, "addObjectsFromArray:", v27);
              if (objc_msgSend(v24, "isEqualToString:", v47))
                objc_msgSend(v53, "addObjectsFromArray:", v27);
              if (objc_msgSend(v24, "isEqualToString:", v46))
                objc_msgSend(v54, "addObjectsFromArray:", v27);
            }
LABEL_23:

          }
        }
        else
        {
          v26 = v25;
        }

      }
      ++v18;
    }
    while (v16 != v18);
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
    v16 = v31;
  }
  while (v31);
LABEL_40:

  if (objc_msgSend(v56, "count"))
  {
    v32 = (NSArray *)objc_msgSend(v56, "copy");
    toRecipients = self->_toRecipients;
    self->_toRecipients = v32;

  }
  if (objc_msgSend(v53, "count"))
  {
    v34 = (NSArray *)objc_msgSend(v53, "copy");
    ccRecipients = self->_ccRecipients;
    self->_ccRecipients = v34;

  }
  if (objc_msgSend(v54, "count"))
  {
    v36 = (NSArray *)objc_msgSend(v54, "copy");
    bccRecipients = self->_bccRecipients;
    self->_bccRecipients = v36;

  }
  subject = self->_subject;
  self->_subject = v59;
  v39 = v59;

  body = self->_body;
  self->_body = v60;
  v41 = v60;

  from = self->_from;
  self->_from = v58;
  v43 = v58;

  objc_autoreleasePoolPop(context);
LABEL_47:

  v3 = v50;
LABEL_48:

}

- (NSArray)toRecipients
{
  return self->_toRecipients;
}

- (NSArray)ccRecipients
{
  return self->_ccRecipients;
}

- (NSArray)bccRecipients
{
  return self->_bccRecipients;
}

- (NSString)subject
{
  return self->_subject;
}

- (NSString)body
{
  return self->_body;
}

- (NSString)from
{
  return self->_from;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_from, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_bccRecipients, 0);
  objc_storeStrong((id *)&self->_ccRecipients, 0);
  objc_storeStrong((id *)&self->_toRecipients, 0);
}

@end
