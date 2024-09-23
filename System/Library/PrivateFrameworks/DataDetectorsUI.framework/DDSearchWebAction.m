@implementation DDSearchWebAction

- (id)localizedName
{
  return DDLocalizedString(CFSTR("Search Web"));
}

- (id)iconName
{
  return CFSTR("magnifyingglass.circle");
}

- (void)performFromView:(id)a3
{
  id v4;
  NSString *v5;
  NSString *query;
  NSString *v7;
  id v8;

  v4 = a3;
  if (self->super.super._result)
  {
    v8 = v4;
    DDResultGetMatchedString();
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = v5;
    DDPerformWebSearchFromQuery(v5);

    v4 = v8;
    goto LABEL_6;
  }
  query = self->_query;
  if (query)
  {
    v8 = v4;
    v5 = query;
    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)canBePerformedByOpeningURL
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
}

- (DDSearchWebAction)initWithQueryString:(id)a3 range:(_NSRange)a4 context:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  NSString *v10;
  NSString *query;
  DDSearchWebAction *v12;

  length = a4.length;
  location = a4.location;
  v9 = a5;
  objc_msgSend(a3, "substringWithRange:", location, length);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  query = self->_query;
  self->_query = v10;

  v12 = -[DDAction initWithURL:result:context:](self, "initWithURL:result:context:", 0, 0, v9);
  return v12;
}

@end
