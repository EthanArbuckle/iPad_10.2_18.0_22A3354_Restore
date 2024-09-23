@implementation _WKWebExtensionWebRequestFilter

- (_WKWebExtensionWebRequestFilter)initWithDictionary:(id)a3 outErrorMessage:(id *)a4
{
  id v6;
  _WKWebExtensionWebRequestFilter *v7;
  id v8;
  _WKWebExtensionWebRequestFilter *v9;
  void *v11;
  objc_super v12;
  uint64_t v13;
  _QWORD v14[4];
  _QWORD v15[4];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_WKWebExtensionWebRequestFilter;
  v7 = -[_WKWebExtensionWebRequestFilter init](&v12, sel_init);
  if (v7)
  {
    if ((_MergedGlobals_39 & 1) == 0)
    {
      v16[0] = CFSTR("urls");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      qword_1ECE71D48 = objc_claimAutoreleasedReturnValue();
      _MergedGlobals_39 = 1;
    }
    if ((byte_1ECE71D41 & 1) == 0)
    {
      v14[0] = CFSTR("urls");
      v13 = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v11;
      v14[1] = CFSTR("types");
      v15[1] = objc_opt_class();
      v14[2] = CFSTR("tabId");
      v15[2] = objc_opt_class();
      v14[3] = CFSTR("windowId");
      v15[3] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
      qword_1ECE71D50 = objc_claimAutoreleasedReturnValue();

      byte_1ECE71D41 = 1;
    }
    if (WebKit::validateDictionary(v6, 0, (void *)qword_1ECE71D48, (void *)qword_1ECE71D50, a4)
      && (-[_WKWebExtensionWebRequestFilter _initializeWithDictionary:](v7, "_initializeWithDictionary:", v6),
          v8 = (id)objc_claimAutoreleasedReturnValue(),
          (*a4 = v8) == 0))
    {
      v9 = v7;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
    *a4 = CFSTR("Runtime failure.");
  }

  return v9;
}

- (id)_initializeWithDictionary:(id)a3
{
  id v3;
  NSArray *v4;
  NSArray *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _WKWebExtensionMatchPattern *v12;
  _WKWebExtensionMatchPattern *v13;
  id v14;
  void *v15;
  void *v16;
  NSString *v17;
  id v18;
  NSArray *urlPatterns;
  id v20;
  NSSet *v21;
  NSSet *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  id v26;
  NSString *v27;
  void *v28;
  id v29;
  NSSet *types;
  id v31;
  void *v32;
  long double v33;
  double v34;
  unint64_t v35;
  BOOL v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  long double v42;
  double v43;
  unint64_t v44;
  BOOL v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  long double __y[18];

  __y[16] = *(long double *)MEMORY[0x1E0C80C00];
  v55 = a3;
  objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("urls"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v5 = (NSArray *)v3;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v57, __y, 16);
    if (v6)
    {
      v7 = 0;
      v8 = *(_QWORD *)v58;
      while (2)
      {
        v9 = 0;
        v10 = v7;
        do
        {
          if (*(_QWORD *)v58 != v8)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v9);
          v12 = [_WKWebExtensionMatchPattern alloc];
          v56 = v10;
          v13 = -[_WKWebExtensionMatchPattern initWithString:error:](v12, "initWithString:error:", v11, &v56);
          v7 = v56;

          if (!v13)
          {
            objc_msgSend(v7, "userInfo");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2938]);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            WebKit::toErrorString(0, CFSTR("urls"), CFSTR("'%@' is an invalid match pattern. %@"), v17, v11, v16);
            v14 = (id)objc_claimAutoreleasedReturnValue();

            v5 = v4;
            v4 = 0;
            goto LABEL_14;
          }
          -[NSArray addObject:](v4, "addObject:", v13);

          ++v9;
          v10 = v7;
        }
        while (v6 != v9);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v57, __y, 16);
        if (v6)
          continue;
        break;
      }
      v14 = 0;
    }
    else
    {
      v14 = 0;
      v7 = 0;
    }
LABEL_14:

  }
  else
  {
    v14 = 0;
    v4 = 0;
  }

  v18 = v14;
  urlPatterns = self->_urlPatterns;
  self->_urlPatterns = v4;

  if (!v18)
  {
    objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("types"));
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count"))
    {
      v21 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v22 = (NSSet *)v20;
      v23 = -[NSSet countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v57, __y, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v58;
        while (2)
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v58 != v24)
              objc_enumerationMutation(v22);
            v26 = *(id *)(*((_QWORD *)&v57 + 1) + 8 * i);
            objc_msgSend(&unk_1E356F780, "objectForKeyedSubscript:", v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v28)
            {
              WebKit::toErrorString(0, CFSTR("types"), CFSTR("'%@' is an unknown resource type"), v27, v26);
              v29 = (id)objc_claimAutoreleasedReturnValue();

              v22 = v21;
              v21 = 0;
              goto LABEL_27;
            }

            -[NSSet addObject:](v21, "addObject:", v28);
          }
          v23 = -[NSSet countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v57, __y, 16);
          if (v23)
            continue;
          break;
        }
      }
      v29 = 0;
LABEL_27:

    }
    else
    {
      v29 = 0;
      v21 = 0;
    }

    v18 = v29;
    types = self->_types;
    self->_types = v21;

    if (!v18)
    {
      objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("tabId"));
      v31 = (id)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v31)
      {
        objc_msgSend(v31, "doubleValue");
        v34 = v33;
        if (v33 == -1.0)
        {
          v35 = -256;
          v36 = 1;
          LOBYTE(v37) = -2;
        }
        else
        {
          LOBYTE(v37) = 0;
          v36 = 0;
          if ((v33 < 0.0 || ((*(_QWORD *)&v33 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE)
            && (unint64_t)(*(_QWORD *)&v33 - 1) > 0xFFFFFFFFFFFFELL)
          {
            v35 = 0;
          }
          else
          {
            v35 = 0;
            if (v33 < 1.84467441e19)
            {
              if (modf(v33, __y) == 0.0)
              {
                v37 = (unint64_t)v34;
                if ((unint64_t)v34 - 1 >= 0xFFFFFFFFFFFFFFFELL)
                  LOBYTE(v37) = -2;
                v35 = -256;
                if ((unint64_t)v34 - 1 < 0xFFFFFFFFFFFFFFFELL)
                  v35 = (unint64_t)v34 & 0xFFFFFFFFFFFFFF00;
                v36 = 1;
              }
              else
              {
                v36 = 0;
                LOBYTE(v37) = 0;
                v35 = 0;
              }
            }
          }
        }
        v38 = v35 & 0xFFFFFFFFFFFFFF00;
        v39 = v37;
      }
      else
      {
        v38 = 0;
        v36 = 0;
        v39 = 0;
      }

      self->_tabID.var0.__val_.m_identifier = v39 | v38;
      self->_tabID.__engaged_ = v36;

      objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("windowId"));
      v40 = (id)objc_claimAutoreleasedReturnValue();
      v41 = v40;
      if (v40)
      {
        objc_msgSend(v40, "doubleValue");
        v43 = v42;
        if (v42 == -1.0)
        {
          v44 = -256;
          v45 = 1;
          LOBYTE(v46) = -2;
        }
        else if (v42 == -2.0)
        {
          v44 = -256;
          v45 = 1;
          LOBYTE(v46) = -3;
        }
        else
        {
          LOBYTE(v46) = 0;
          v45 = 0;
          if ((v42 < 0.0 || ((*(_QWORD *)&v42 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE)
            && (unint64_t)(*(_QWORD *)&v42 - 1) > 0xFFFFFFFFFFFFELL)
          {
            v44 = 0;
          }
          else
          {
            v44 = 0;
            if (v42 < 1.84467441e19)
            {
              if (modf(v42, __y) == 0.0)
              {
                v46 = (unint64_t)v43;
                if ((unint64_t)v43 - 1 >= 0xFFFFFFFFFFFFFFFELL)
                  LOBYTE(v46) = -2;
                v44 = -256;
                if ((unint64_t)v43 - 1 < 0xFFFFFFFFFFFFFFFELL)
                  v44 = (unint64_t)v43 & 0xFFFFFFFFFFFFFF00;
                v45 = 1;
              }
              else
              {
                v45 = 0;
                LOBYTE(v46) = 0;
                v44 = 0;
              }
            }
          }
        }
        v47 = v44 & 0xFFFFFFFFFFFFFF00;
        v48 = v46;
      }
      else
      {
        v47 = 0;
        v45 = 0;
        v48 = 0;
      }

      self->_windowID.var0.__val_.m_identifier = v48 | v47;
      self->_windowID.__engaged_ = v45;

      v18 = 0;
    }
  }

  return v18;
}

- (BOOL)matchesRequestForResourceOfType:(int64_t)a3 URL:(id)a4 tabID:(double)a5 windowID:(double)a6
{
  id v10;
  NSSet *types;
  void *v12;
  BOOL v13;
  NSArray *urlPatterns;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  unint64_t v19;
  unint64_t m_identifier;
  double v21;
  BOOL v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  types = self->_types;
  if (!types
    || (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = -[NSSet containsObject:](types, "containsObject:", v12),
        v12,
        v13))
  {
    urlPatterns = self->_urlPatterns;
    if (urlPatterns)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v15 = urlPatterns;
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v25 != v17)
              objc_enumerationMutation(v15);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "matchesURL:", v10, (_QWORD)v24) & 1) != 0)
            {

              goto LABEL_14;
            }
          }
          v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v16)
            continue;
          break;
        }
      }

    }
    else
    {
LABEL_14:
      if (!self->_tabID.__engaged_ || (v19 = self->_tabID.var0.__val_.m_identifier, v19 == -2) || (double)v19 == a5)
      {
        if (!self->_windowID.__engaged_)
          goto LABEL_24;
        m_identifier = self->_windowID.var0.__val_.m_identifier;
        if (m_identifier == -2)
          goto LABEL_24;
        v21 = (double)m_identifier;
        if (m_identifier + 3 < 2)
          v21 = -1.0;
        if (v21 == a6)
        {
LABEL_24:
          v22 = 1;
          goto LABEL_23;
        }
      }
    }
  }
  v22 = 0;
LABEL_23:

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_urlPatterns, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_BYTE *)self + 16) = 0;
  *((_BYTE *)self + 24) = 0;
  *((_BYTE *)self + 32) = 0;
  return self;
}

@end
