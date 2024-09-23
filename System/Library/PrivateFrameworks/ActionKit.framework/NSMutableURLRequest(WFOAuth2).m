@implementation NSMutableURLRequest(WFOAuth2)

- (void)wfo_setAuthorizationWithCredential:()WFOAuth2
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "isValid")
    && (objc_msgSend(v8, "tokenType"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "compare:options:", CFSTR("bearer"), 1),
        v4,
        !v5))
  {
    objc_msgSend(v8, "accessToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("Bearer "), "stringByAppendingString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v7, CFSTR("Authorization"));

  }
  else
  {
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", 0, CFSTR("Authorization"));
  }

}

- (void)wfo_setAuthorizationWithUsername:()WFOAuth2 password:
{
  __CFString *v7;
  id v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v7 = a4;
  v8 = v16;
  v9 = v7;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSMutableURLRequest+WFOAuth2.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("username"));

    v8 = 0;
  }
  v10 = &stru_24F8BBA48;
  if (v9)
    v10 = v9;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataUsingEncoding:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "base64EncodedStringWithOptions:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(CFSTR("Basic "), "stringByAppendingString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v14, CFSTR("Authorization"));

}

- (void)wfo_setBodyWithQueryItems:()WFOAuth2
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("application/x-www-form-urlencoded"), CFSTR("Content-Type"));
  v5 = v4;
  if (objc_msgSend(v5, "count"))
  {
    v19 = a1;
    v6 = (void *)objc_opt_new();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v18 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v12, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          WFHTTPFormEncodedString(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "value");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          WFHTTPFormEncodedString(v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendFormat:", CFSTR("%@=%@&"), v14, v16);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }

    objc_msgSend(v6, "deleteCharactersInRange:", objc_msgSend(v6, "length") - 1, 1);
    objc_msgSend(v6, "dataUsingEncoding:", 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v18;
    a1 = v19;
  }
  else
  {
    v17 = (void *)objc_opt_new();
  }

  objc_msgSend(a1, "setHTTPBody:", v17);
}

@end
