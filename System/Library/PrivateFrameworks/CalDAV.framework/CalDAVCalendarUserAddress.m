@implementation CalDAVCalendarUserAddress

- (CalDAVCalendarUserAddress)initWithAddress:(id)a3 preferred:(int64_t)a4
{
  id v6;
  CalDAVCalendarUserAddress *v7;
  CalDAVCalendarUserAddress *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CalDAVCalendarUserAddress;
  v7 = -[CalDAVCalendarUserAddress init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[CalDAVCalendarUserAddress setAddress:](v7, "setAddress:", v6);
    -[CalDAVCalendarUserAddress setPreferred:](v8, "setPreferred:", a4);
  }

  return v8;
}

+ (int64_t)defaultPreferredAttribute
{
  return -1;
}

+ (id)packCalDAVUserAdress:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("packedCalendarUserAddressAddress");
  v3 = a3;
  objc_msgSend(v3, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("packedCalendarUserAddressPreferred");
  v12[0] = v5;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = objc_msgSend(v3, "preferred");

  objc_msgSend(v6, "numberWithInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)unpackCalDAVUserAdress:(id)a3
{
  id v3;
  CalDAVCalendarUserAddress *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CalDAVCalendarUserAddress *v9;

  v3 = a3;
  v4 = [CalDAVCalendarUserAddress alloc];
  v5 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("packedCalendarUserAddressAddress"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("packedCalendarUserAddressPreferred"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[CalDAVCalendarUserAddress initWithAddress:preferred:](v4, "initWithAddress:preferred:", v7, objc_msgSend(v8, "integerValue"));
  return v9;
}

+ (id)preferredAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(a1, "_minPreferredAddress:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(a1, "_preferredAddressNoPreferred:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  v4 = a3;
  -[CalDAVCalendarUserAddress address](self, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

+ (id)_minPreferredAddress:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "preferred");
        if (v10 != objc_msgSend((id)objc_opt_class(), "defaultPreferredAttribute"))
        {
          if (v6)
          {
            v11 = objc_msgSend(v6, "preferred");
            if (v11 > objc_msgSend(v9, "preferred"))
            {
              v12 = v9;

              v6 = v12;
            }
          }
          else
          {
            v6 = v9;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_preferredAddressNoPreferred:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  id v25;
  void *v26;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") == 1)
  {
    v6 = v5;
LABEL_3:
    objc_msgSend(v6, "objectAtIndex:", 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  v28 = v5;
  v29 = v3;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (!v9)
  {
    v11 = 0;
    v30 = 0;
    v31 = 0;
    v12 = 0;
LABEL_24:

LABEL_25:
    if (v11)
    {
      v7 = v11;

      goto LABEL_27;
    }
    if (v12)
    {
      v7 = v12;

      v26 = v31;
    }
    else
    {
      if (!v31)
      {
        v5 = v28;
        v3 = v29;
        v7 = v30;
        if (v30)
          goto LABEL_34;
        if (!objc_msgSend(v8, "count"))
        {
          v7 = 0;
          goto LABEL_34;
        }
        v6 = v8;
        goto LABEL_3;
      }
      v7 = v31;
      v26 = v30;
    }

    goto LABEL_33;
  }
  v10 = v9;
  v11 = 0;
  v30 = 0;
  v31 = 0;
  v12 = 0;
  v13 = *(_QWORD *)v34;
  obj = v8;
LABEL_6:
  v14 = 0;
  while (1)
  {
    if (*(_QWORD *)v34 != v13)
      objc_enumerationMutation(obj);
    v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v14);
    objc_msgSend(v15, "address");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "absoluteString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lowercaseString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v18, "hasPrefix:", CFSTR("https")) & 1) != 0)
    {
      v19 = v12;
      v20 = v11;
      v12 = v15;
LABEL_17:
      v24 = v15;

      v11 = v20;
      goto LABEL_18;
    }
    objc_msgSend(v15, "address");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "absoluteString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "hasPrefix:", CFSTR("/"));

    if ((v23 & 1) != 0)
    {
      v19 = v31;
      v20 = v11;
      v31 = v15;
      goto LABEL_17;
    }
    if ((objc_msgSend(v18, "hasPrefix:", CFSTR("http")) & 1) != 0)
    {
      v19 = v30;
      v20 = v11;
      v30 = v15;
      goto LABEL_17;
    }
    if ((objc_msgSend(v18, "hasPrefix:", CFSTR("mailto")) & 1) != 0)
      break;
    v19 = v11;
    v20 = v15;
    if (objc_msgSend(v18, "hasPrefix:", CFSTR("tel")))
      goto LABEL_17;
LABEL_18:

    if (v10 == ++v14)
    {
      v8 = obj;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v10)
        goto LABEL_6;
      goto LABEL_24;
    }
  }
  v25 = v15;

  v8 = obj;
  if (!v25)
    goto LABEL_25;
  v7 = v25;

LABEL_27:
LABEL_33:
  v5 = v28;
  v3 = v29;
LABEL_34:

  return v7;
}

- (BOOL)isSameAsUserAddressURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[CalDAVCalendarUserAddress address](self, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "compareAddressURL:localURL:", v4, v6);

  return (char)v5;
}

+ (BOOL)compareAddressURL:(id)a3 localString:(id)a4
{
  void *v6;
  id v7;
  void *v8;

  if (!a3 || !a4)
    return 0;
  v6 = (void *)MEMORY[0x24BDBCF48];
  v7 = a3;
  objc_msgSend(v6, "URLWithString:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "compareAddressURL:localURL:", v7, v8);

  return (char)a1;
}

+ (BOOL)compareAddressURL:(id)a3 localURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  BOOL v30;
  int v32;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeSlashIfNeeded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeSlashIfNeeded");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "caseInsensitiveCompare:", v10);

  if (v11)
  {
    objc_msgSend(v5, "relativePath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeSlashIfNeeded");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "relativePath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeSlashIfNeeded");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13 || v13 == v15 || objc_msgSend(v13, "caseInsensitiveCompare:", v15))
    {
      objc_msgSend(v6, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqualToString:", v17);

      if (v18)
      {
        objc_msgSend(v6, "port");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "port");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        if (v19)
        {
          if (v20 && (objc_msgSend(v19, "isEqualToNumber:", v20) & 1) != 0)
          {
LABEL_9:
            objc_msgSend(v6, "host");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "host");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v22, "isEqualToString:", v23) & 1) == 0)
            {
              v24 = objc_msgSend(v22, "length");
              v25 = objc_msgSend(v23, "length");
              if (v24 >= v25)
                v26 = v23;
              else
                v26 = v22;
              if (v24 >= v25)
                v27 = v22;
              else
                v27 = v23;
              v28 = v26;
              v29 = v27;
              if (objc_msgSend(v28, "rangeOfString:", CFSTR(".")) == 0x7FFFFFFFFFFFFFFFLL)
              {
                v32 = objc_msgSend(v29, "hasPrefix:", v28);

                if (v32)
                  goto LABEL_18;
              }
              else
              {

              }
              v30 = 0;
              goto LABEL_26;
            }
LABEL_18:
            v30 = 1;
LABEL_26:

            goto LABEL_27;
          }
        }
        else if (!v20)
        {
          goto LABEL_9;
        }
        v30 = 0;
LABEL_27:

        goto LABEL_28;
      }
      v30 = 0;
    }
    else
    {
      v30 = 1;
    }
LABEL_28:

    goto LABEL_29;
  }
  v30 = 1;
LABEL_29:

  return v30;
}

- (NSURL)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (int64_t)preferred
{
  return self->_preferred;
}

- (void)setPreferred:(int64_t)a3
{
  self->_preferred = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
}

@end
