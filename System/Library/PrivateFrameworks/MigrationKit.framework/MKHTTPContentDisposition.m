@implementation MKHTTPContentDisposition

- (MKHTTPContentDisposition)initWithHeaderValue:(id)a3
{
  id v4;
  MKHTTPContentDisposition *v5;
  MKHTTPContentDisposition *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  MKHTTPContentDisposition *v30;
  MKHTTPContentDisposition *v31;
  id v32;
  id v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)MKHTTPContentDisposition;
  v5 = -[MKHTTPContentDisposition init](&v39, sel_init);
  v6 = v5;
  if (v5)
  {
    v30 = v5;
    v32 = v4;
    v33 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(";"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v36;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v36 != v9)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v10), "componentsSeparatedByString:", CFSTR("="), v30);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "count") == 2)
          {
            objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if ((unint64_t)objc_msgSend(v17, "length") >= 2)
            {
              objc_msgSend(v14, "lowercaseString");
              v18 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v17, "substringWithRange:", 1, objc_msgSend(v17, "length") - 2);
              v19 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v33, "setObject:forKey:", v19, v18);
              v14 = (void *)v18;
              v17 = (void *)v19;
            }

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v8);
    }
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("filename"), v30);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR(" "));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByRemovingPercentEncoding");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v31;
    -[MKHTTPContentDisposition setFilename:](v31, "setFilename:", v22);

    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("folder"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR(" "));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringByRemovingPercentEncoding");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKHTTPContentDisposition setFolder:](v31, "setFolder:", v25);

    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("original_filename"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR(" "));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringByRemovingPercentEncoding");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKHTTPContentDisposition setOriginalFilename:](v31, "setOriginalFilename:", v28);

    v4 = v32;
  }

  return v6;
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)folder
{
  return self->_folder;
}

- (void)setFolder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)originalFilename
{
  return self->_originalFilename;
}

- (void)setOriginalFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalFilename, 0);
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_filename, 0);
}

@end
