@implementation ASVError

- (id)localizedDescription
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASVError userInfo](self, "userInfo"));
  v4 = v3;
  if (!v3
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", NSLocalizedDescriptionKey))) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)ASVError;
    v6 = -[ASVError localizedDescription](&v8, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  return v5;
}

+ (id)errorWithCode:(unsigned int)a3 localizedDescription:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSErrorUserInfoKey v9;
  id v10;

  v5 = a4;
  v9 = NSLocalizedDescriptionKey;
  v10 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ASVError errorWithDomain:code:userInfo:](ASVError, "errorWithDomain:code:userInfo:", CFSTR("ASV"), a3, v6));

  return v7;
}

@end
