@implementation _WKWebExtensionWebNavigationURLPredicate

- (_WKWebExtensionWebNavigationURLPredicate)initWithTypeString:(id)a3 value:(id)a4 outErrorMessage:(id *)a5
{
  id v8;
  id v9;
  _WKWebExtensionWebNavigationURLPredicate *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  _WKWebExtensionWebNavigationURLPredicate *v16;
  uint64_t v18;
  id value;
  NSString *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  unint64_t v27;
  NSString *v28;
  void *v29;
  void *v30;
  NSString *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  unint64_t v35;
  NSString *v36;
  void *v37;
  unint64_t v38;
  NSString *v39;
  uint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  unint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id obj;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  objc_super v56;
  _BYTE v57[128];
  uint64_t v58;
  _QWORD v59[20];
  _QWORD v60[22];

  v60[20] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v56.receiver = self;
  v56.super_class = (Class)_WKWebExtensionWebNavigationURLPredicate;
  v10 = -[_WKWebExtensionWebNavigationURLPredicate init](&v56, sel_init);
  if (v10)
  {
    if (_MergedGlobals_38 == 1)
    {
      v11 = (void *)qword_1ECE71D18;
    }
    else
    {
      v59[0] = CFSTR("hostContains");
      v59[1] = CFSTR("hostEquals");
      v60[0] = &unk_1E356F910;
      v60[1] = &unk_1E356F928;
      v59[2] = CFSTR("hostPrefix");
      v59[3] = CFSTR("hostSuffix");
      v60[2] = &unk_1E356F940;
      v60[3] = &unk_1E356F958;
      v59[4] = CFSTR("pathContains");
      v59[5] = CFSTR("pathEquals");
      v60[4] = &unk_1E356F970;
      v60[5] = &unk_1E356F988;
      v59[6] = CFSTR("pathPrefix");
      v59[7] = CFSTR("pathSuffix");
      v60[6] = &unk_1E356F9A0;
      v60[7] = &unk_1E356F9B8;
      v59[8] = CFSTR("queryContains");
      v59[9] = CFSTR("queryEquals");
      v60[8] = &unk_1E356F9D0;
      v60[9] = &unk_1E356F9E8;
      v59[10] = CFSTR("queryPrefix");
      v59[11] = CFSTR("querySuffix");
      v60[10] = &unk_1E356FA00;
      v60[11] = &unk_1E356FA18;
      v59[12] = CFSTR("urlContains");
      v59[13] = CFSTR("urlEquals");
      v60[12] = &unk_1E356FA30;
      v60[13] = &unk_1E356FA48;
      v59[14] = CFSTR("urlMatches");
      v59[15] = CFSTR("originAndPathMatches");
      v60[14] = &unk_1E356FA60;
      v60[15] = &unk_1E356FA78;
      v59[16] = CFSTR("urlPrefix");
      v59[17] = CFSTR("urlSuffix");
      v60[16] = &unk_1E356FA90;
      v60[17] = &unk_1E356FAA8;
      v59[18] = CFSTR("schemes");
      v59[19] = CFSTR("ports");
      v60[18] = &unk_1E356FAC0;
      v60[19] = &unk_1E356FAD8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      qword_1ECE71D18 = (uint64_t)v11;
      _MergedGlobals_38 = 1;
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");
    v10->_type = v13;
    if (v13 >= 0xE)
    {
      switch(v13)
      {
        case 0xEuLL:
        case 0xFuLL:
          objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v9, 0, 0);
          v18 = objc_claimAutoreleasedReturnValue();
          value = v10->_value;
          v10->_value = (id)v18;

          if (v18)
            goto LABEL_7;
          WebKit::toErrorString(0, CFSTR("originAndPathMatches"), CFSTR("'%@' is not a valid regular expression"), v20, v9);
          v16 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_8;
        case 0x10uLL:
        case 0x11uLL:
        case 0x12uLL:
          goto LABEL_5;
        case 0x13uLL:
          v15 = objc_alloc_init(MEMORY[0x1E0CB3788]);
          if ((byte_1ECE71D11 & 1) == 0)
          {
            v42 = (void *)MEMORY[0x1E0C99E40];
            v43 = objc_opt_class();
            v58 = objc_opt_class();
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "orderedSetWithObjects:", v43, v44, 0);
            qword_1ECE71D20 = objc_claimAutoreleasedReturnValue();

            byte_1ECE71D11 = 1;
          }
          objc_opt_class();
          WTF::dynamic_objc_cast<NSArray>(v9);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v21, "count");

          if (!v49)
            goto LABEL_36;
          v22 = 0;
          v48 = v15;
          break;
        default:
          goto LABEL_7;
      }
      while (1)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v22);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@[%lu]"), CFSTR("ports"), v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = WebKit::validateObject(v51, v23, (void *)qword_1ECE71D20, a5);

        if (!v24)
          break;
        objc_opt_class();
        WTF::dynamic_objc_cast<NSNumber>(v51);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v25)
        {
          v27 = objc_msgSend(v25, "integerValue");
          if (v27 >= 0x10000)
          {
            WebKit::toErrorString(0, CFSTR("ports"), CFSTR("'%zd' is not a valid port"), v28, v27);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_39:

            break;
          }
          objc_msgSend(v15, "addIndex:", v27);
        }
        else
        {
          objc_opt_class();
          WTF::dynamic_objc_cast<NSArray>(v51);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v29;
          if (v29)
          {
            v47 = v29;
            if (objc_msgSend(v29, "count") != 2)
            {
              WebKit::toErrorString(0, CFSTR("ports"), CFSTR("a port range must specify 2 numbers"), v31);
              *a5 = (id)objc_claimAutoreleasedReturnValue();
              v26 = v30;
              goto LABEL_39;
            }
            v54 = 0u;
            v55 = 0u;
            v52 = 0u;
            v53 = 0u;
            obj = v30;
            v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
            if (v32)
            {
              v33 = *(_QWORD *)v53;
              while (2)
              {
                for (i = 0; i != v32; ++i)
                {
                  if (*(_QWORD *)v53 != v33)
                    objc_enumerationMutation(obj);
                  v35 = objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "integerValue");
                  if (v35 >= 0x10000)
                  {
                    WebKit::toErrorString(0, CFSTR("ports"), CFSTR("'%zd' is not a valid port"), v36, v35);
                    v15 = v48;
                    *a5 = (id)objc_claimAutoreleasedReturnValue();

                    goto LABEL_38;
                  }
                }
                v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
                if (v32)
                  continue;
                break;
              }
            }

            v30 = v47;
            v15 = v48;
            objc_msgSend(obj, "objectAtIndexedSubscript:", 0);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v37, "unsignedIntegerValue");

            objc_msgSend(obj, "objectAtIndexedSubscript:", 1);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v45, "unsignedIntegerValue");

            if (v38 <= v46)
            {
              WebKit::toErrorString(0, CFSTR("ports"), CFSTR("'%zd-%zd' is not a valid port range"), v39, v46, v38);
              *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:
              v26 = obj;
              goto LABEL_39;
            }
            objc_msgSend(v48, "addIndexesInRange:");
          }

        }
        if (++v22 == v49)
        {
LABEL_36:
          v40 = objc_msgSend(v15, "copy");
          v41 = v10->_value;
          v10->_value = (id)v40;

          goto LABEL_6;
        }
      }

      v16 = 0;
    }
    else
    {
LABEL_5:
      v14 = objc_msgSend(v9, "copy");
      v15 = v10->_value;
      v10->_value = (id)v14;
LABEL_6:

LABEL_7:
      v16 = v10;
    }
LABEL_8:

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)matchesURL:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  char v13;
  char v14;
  void *v15;
  BOOL v16;

  v4 = a3;
  v5 = self->_value;
  v6 = self->_value;
  v7 = self->_value;
  v8 = self->_value;
  switch(self->_type)
  {
    case 0:
      objc_msgSend(v4, "host");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
        v11 = (const __CFString *)v9;
      else
        v11 = &stru_1E351F1B8;
      objc_msgSend(CFSTR("."), "stringByAppendingString:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsString:", v5);
      goto LABEL_24;
    case 1:
      objc_msgSend(v4, "host");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "isEqualToString:", v5);
      goto LABEL_28;
    case 2:
      objc_msgSend(v4, "host");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "hasPrefix:", v5);
      goto LABEL_28;
    case 3:
      objc_msgSend(v4, "host");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "hasSuffix:", v5);
      goto LABEL_28;
    case 4:
      objc_msgSend(v4, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "containsString:", v5);
      goto LABEL_28;
    case 5:
      objc_msgSend(v4, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "isEqualToString:", v5);
      goto LABEL_28;
    case 6:
      objc_msgSend(v4, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "hasPrefix:", v5);
      goto LABEL_28;
    case 7:
      objc_msgSend(v4, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "hasSuffix:", v5);
      goto LABEL_28;
    case 8:
      objc_msgSend(v4, "query");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "containsString:", v5);
      goto LABEL_28;
    case 9:
      objc_msgSend(v4, "query");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "isEqualToString:", v5);
      goto LABEL_28;
    case 0xALL:
      objc_msgSend(v4, "query");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "hasPrefix:", v5);
      goto LABEL_28;
    case 0xBLL:
      objc_msgSend(v4, "query");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "hasSuffix:", v5);
      goto LABEL_28;
    case 0xCLL:
      objc_msgSend(v4, "_webkit_URLByRemovingFragment");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "absoluteString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsString:", v5);
      goto LABEL_24;
    case 0xDLL:
      objc_msgSend(v4, "_webkit_URLByRemovingFragment");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "absoluteString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", v5);
      goto LABEL_24;
    case 0xELL:
      objc_msgSend(v4, "_webkit_URLByRemovingFragment");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "absoluteString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v8, "rangeOfFirstMatchInString:options:range:", v10, 0, 0, objc_msgSend(v10, "length")) != 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_29;
    case 0xFLL:
      objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v4, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFragment:", 0);
      objc_msgSend(v10, "setQuery:", 0);
      objc_msgSend(v10, "string");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v8, "rangeOfFirstMatchInString:options:range:", v12, 0, 0, objc_msgSend(v12, "length")) != 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_25;
    case 0x10:
      objc_msgSend(v4, "_webkit_URLByRemovingFragment");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "absoluteString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "hasPrefix:", v5);
      goto LABEL_24;
    case 0x11:
      objc_msgSend(v4, "_webkit_URLByRemovingFragment");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "absoluteString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "hasSuffix:", v5);
LABEL_24:
      v16 = v13;
LABEL_25:

      goto LABEL_29;
    case 0x12:
      objc_msgSend(v4, "scheme");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v6, "containsObject:", v10);
      goto LABEL_28;
    case 0x13:
      objc_msgSend(v4, "port");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v7, "containsIndex:", objc_msgSend(v10, "unsignedIntegerValue"));
LABEL_28:
      v16 = v14;
LABEL_29:

      break;
    default:
      v16 = 0;
      break;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

@end
