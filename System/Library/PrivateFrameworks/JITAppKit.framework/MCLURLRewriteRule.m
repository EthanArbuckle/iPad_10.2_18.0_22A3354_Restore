@implementation MCLURLRewriteRule

+ (id)urlRewriteRuleFromHost:(id)a3 toHost:(id)a4 ignoreHosts:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v17;
  id v18;
  id v19;
  id v22;
  uint64_t v23;
  int v24;
  int v25;
  void (*v26)(id *, void *, void *);
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id location[2];
  Class v36;

  v36 = (Class)a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v34 = 0;
  objc_storeStrong(&v34, a4);
  v33 = 0;
  objc_storeStrong(&v33, a5);
  v5 = (id)objc_msgSend(location[0], "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("\\."));
  v6 = location[0];
  location[0] = v5;

  v7 = (id)objc_msgSend(location[0], "stringByReplacingOccurrencesOfString:withString:", CFSTR("*"), CFSTR(".*"));
  v8 = location[0];
  location[0] = v7;

  v9 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(https?://)%@(/.*)"), location[0]);
  v10 = location[0];
  location[0] = v9;

  v32 = 0;
  v30 = 0;
  v22 = (id)objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", location[0], 1, &v30);
  objc_storeStrong(&v32, v30);
  v31 = v22;
  if (v32)
    NSLog(CFSTR("Error compiling regular expression.Error: %@"), v32);
  v11 = (id)objc_msgSend(v34, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("\\."));
  v12 = v34;
  v34 = v11;

  v13 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("$1%@$2"), v34);
  v14 = v34;
  v34 = v13;

  v17 = objc_alloc(MEMORY[0x24BDBCEF0]);
  v29 = (id)objc_msgSend(v17, "initWithCapacity:", objc_msgSend(v33, "count"));
  v18 = v33;
  v23 = MEMORY[0x24BDAC760];
  v24 = -1073741824;
  v25 = 0;
  v26 = __63__MCLURLRewriteRule_urlRewriteRuleFromHost_toHost_ignoreHosts___block_invoke;
  v27 = &unk_24E099558;
  v28 = v29;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", &v23);
  v15 = [v36 alloc];
  v19 = (id)objc_msgSend(v15, "initWithMatchPattern:replacePattern:replaceTemplate:ignoreHosts:", v31, v31, v34, v29);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(location, 0);
  return v19;
}

void __63__MCLURLRewriteRule_urlRewriteRuleFromHost_toHost_ignoreHosts___block_invoke(id *a1, void *a2, void *a3)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v11;
  id obj;
  id v13;
  id v14[3];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v14[2] = a3;
  v14[1] = a1;
  v3 = (id)objc_msgSend(location[0], "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("\\."));
  v4 = location[0];
  location[0] = v3;

  v5 = (id)objc_msgSend(location[0], "stringByReplacingOccurrencesOfString:withString:", CFSTR("*"), CFSTR(".*"));
  v6 = location[0];
  location[0] = v5;

  v7 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(".*%@.*"), location[0]);
  v8 = location[0];
  location[0] = v7;

  v14[0] = 0;
  obj = 0;
  v11 = (id)objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", location[0], 1, &obj);
  objc_storeStrong(v14, obj);
  v13 = v11;
  if (v14[0])
    NSLog(CFSTR("Error compiling regular expression.Error: %@"), v14[0]);
  else
    objc_msgSend(a1[4], "addObject:", v13);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v14, 0);
  objc_storeStrong(location, 0);
}

- (MCLURLRewriteRule)initWithMatchPattern:(id)a3 replacePattern:(id)a4 replaceTemplate:(id)a5 ignoreHosts:(id)a6
{
  MCLURLRewriteRule *v6;
  uint64_t v7;
  NSString *replaceTemplate;
  uint64_t v9;
  NSSet *ignoreHosts;
  MCLURLRewriteRule *v12;
  objc_super v16;
  id v17;
  id v18;
  id v19;
  id location[2];
  MCLURLRewriteRule *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v18 = 0;
  objc_storeStrong(&v18, a5);
  v17 = 0;
  objc_storeStrong(&v17, a6);
  v6 = v21;
  v21 = 0;
  v16.receiver = v6;
  v16.super_class = (Class)MCLURLRewriteRule;
  v21 = -[MCLURLRequestRewriteRule initWithMatchExpression:block:](&v16, sel_initWithMatchExpression_block_, location[0], 0);
  objc_storeStrong((id *)&v21, v21);
  if (v21)
  {
    objc_storeStrong((id *)&v21->_replacePattern, v19);
    v7 = objc_msgSend(v18, "copy");
    replaceTemplate = v21->_replaceTemplate;
    v21->_replaceTemplate = (NSString *)v7;

    v9 = objc_msgSend(v17, "copy");
    ignoreHosts = v21->_ignoreHosts;
    v21->_ignoreHosts = (NSSet *)v9;

  }
  v12 = v21;
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v21, 0);
  return v12;
}

- (void)rewriteURLRequest:(id)a3
{
  uint64_t v3;
  NSString *v4;
  id v5;
  id v6;
  NSSet *ignoreHosts;
  id v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(_QWORD *, void *, BOOL *);
  void *v14;
  id v15[2];
  __int128 v16;
  uint64_t v17;
  uint64_t *v18;
  int v19;
  int v20;
  char v21;
  __int128 v22;
  id v23;
  id location[2];
  MCLURLRewriteRule *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = (id)objc_msgSend(location[0], "URL");
  v23 = (id)objc_msgSend(v6, "absoluteString");

  v3 = objc_msgSend(v23, "length");
  v27 = 0;
  v26 = v3;
  v28 = 0;
  v29 = v3;
  *(_QWORD *)&v22 = 0;
  *((_QWORD *)&v22 + 1) = v3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x20000000;
  v20 = 32;
  v21 = 0;
  ignoreHosts = v25->_ignoreHosts;
  v10 = MEMORY[0x24BDAC760];
  v11 = -1073741824;
  v12 = 0;
  v13 = __39__MCLURLRewriteRule_rewriteURLRequest___block_invoke;
  v14 = &unk_24E099580;
  v15[0] = v23;
  v16 = v22;
  v15[1] = &v17;
  -[NSSet enumerateObjectsUsingBlock:](ignoreHosts, "enumerateObjectsUsingBlock:", &v10);
  if ((v18[3] & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v4 = -[NSRegularExpression stringByReplacingMatchesInString:options:range:withTemplate:](v25->_replacePattern, "stringByReplacingMatchesInString:options:range:withTemplate:", v23, 0, v22, v25->_replaceTemplate);
    v5 = v23;
    v23 = v4;

    v8 = (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v23);
    if (v8)
      objc_msgSend(location[0], "setURL:", v8);
    objc_storeStrong(&v8, 0);
    v9 = 0;
  }
  objc_storeStrong(v15, 0);
  _Block_object_dispose(&v17, 8);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

void __39__MCLURLRewriteRule_rewriteURLRequest___block_invoke(_QWORD *a1, void *a2, BOOL *a3)
{
  BOOL v5;
  id v6[2];
  BOOL *v7;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7 = a3;
  v6[1] = a1;
  v6[0] = (id)objc_msgSend(location[0], "firstMatchInString:options:range:", a1[4], 0, a1[6], a1[7]);
  v5 = 0;
  if (v6[0])
    v5 = objc_msgSend(v6[0], "range") != 0x7FFFFFFFFFFFFFFFLL;
  *v7 = v5;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v5;
  objc_storeStrong(v6, 0);
  objc_storeStrong(location, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreHosts, 0);
  objc_storeStrong((id *)&self->_replaceTemplate, 0);
  objc_storeStrong((id *)&self->_replacePattern, 0);
}

@end
