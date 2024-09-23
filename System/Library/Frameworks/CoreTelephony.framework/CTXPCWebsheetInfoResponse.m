@implementation CTXPCWebsheetInfoResponse

- (CTXPCWebsheetInfoResponse)initWithURLString:(id)a3 postdata:(id)a4
{
  return -[CTXPCWebsheetInfoResponse initWithURLString:postdata:type:](self, "initWithURLString:postdata:type:", a3, a4, 0);
}

- (CTXPCWebsheetInfoResponse)initWithURLString:(id)a3 postdata:(id)a4 type:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  CTXPCWebsheetInfoResponse *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("urlString"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("postdata"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("type"));
  v14.receiver = self;
  v14.super_class = (Class)CTXPCWebsheetInfoResponse;
  v12 = -[CTXPCMessage initWithNamedArguments:](&v14, sel_initWithNamedArguments_, v11);

  return v12;
}

- (CTXPCWebsheetInfoResponse)initWithURL:(id)a3 postdata:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CTXPCWebsheetInfoResponse *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("url"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("postdata"));
  v11.receiver = self;
  v11.super_class = (Class)CTXPCWebsheetInfoResponse;
  v9 = -[CTXPCMessage initWithNamedArguments:](&v11, sel_initWithNamedArguments_, v8);

  return v9;
}

- (NSString)urlString
{
  void *v2;
  id v3;
  id v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("urlString"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

- (NSURL)url
{
  void *v2;
  id v3;
  id v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("url"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSURL *)v4;
}

- (NSDictionary)postdata
{
  void *v2;
  id v3;
  id v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("postdata"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSDictionary *)v4;
}

- (NSString)type
{
  void *v2;
  id v3;
  id v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("type"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

+ (id)allowedClassesForArguments
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCWebsheetInfoResponse;
  objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  v7[3] = objc_opt_class();
  v7[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
