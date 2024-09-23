@implementation RequestLocalizations

- (RequestLocalizations)initWithApprove:(id)a3 body:(id)a4 decline:(id)a5 title:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  RequestLocalizations *v15;
  RequestLocalizations *v16;
  NSString *v17;
  NSString *title;
  NSString *v19;
  NSString *body;
  NSString *v21;
  NSString *approve;
  NSString *v23;
  NSString *decline;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  v15 = 0;
  if (v10 && v11 && v12 && v13)
  {
    v26.receiver = self;
    v26.super_class = (Class)RequestLocalizations;
    v16 = -[RequestLocalizations init](&v26, "init");
    if (v16)
    {
      v17 = (NSString *)objc_msgSend(v14, "copy");
      title = v16->_title;
      v16->_title = v17;

      v19 = (NSString *)objc_msgSend(v11, "copy");
      body = v16->_body;
      v16->_body = v19;

      v21 = (NSString *)objc_msgSend(v10, "copy");
      approve = v16->_approve;
      v16->_approve = v21;

      v23 = (NSString *)objc_msgSend(v12, "copy");
      decline = v16->_decline;
      v16->_decline = v23;

    }
    self = v16;
    v15 = self;
  }

  return v15;
}

- (RequestLocalizations)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  RequestLocalizations *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("approve")));
  v6 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("body")));
  v9 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    v10 = v8;
  else
    v10 = 0;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("decline")));
  v12 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    v13 = v11;
  else
    v13 = 0;

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title")));
  v15 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    v16 = v14;
  else
    v16 = 0;

  v17 = -[RequestLocalizations initWithApprove:body:decline:title:](self, "initWithApprove:body:decline:title:", v7, v10, v13, v16);
  return v17;
}

- (id)compile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[4];

  v9[0] = CFSTR("approve");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RequestLocalizations approve](self, "approve"));
  v10[0] = v3;
  v9[1] = CFSTR("body");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RequestLocalizations body](self, "body"));
  v10[1] = v4;
  v9[2] = CFSTR("decline");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RequestLocalizations decline](self, "decline"));
  v10[2] = v5;
  v9[3] = CFSTR("title");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RequestLocalizations title](self, "title"));
  v10[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 4));

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RequestLocalizations compile](self, "compile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RequestLocalizations ap_generateDescriptionWithSubObjects:](self, "ap_generateDescriptionWithSubObjects:", v3));

  return v4;
}

- (NSString)approve
{
  return self->_approve;
}

- (NSString)body
{
  return self->_body;
}

- (NSString)decline
{
  return self->_decline;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_decline, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_approve, 0);
}

@end
