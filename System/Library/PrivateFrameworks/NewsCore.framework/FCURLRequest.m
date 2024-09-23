@implementation FCURLRequest

uint64_t __26__FCURLRequest_comparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  _QWORD *v4;
  id *v5;
  id *v6;
  uint64_t v7;
  id v8;
  BOOL v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  if (a2)
  {
    v5 = a2;
    v6 = v5;
    if (v4)
      v7 = v4[3];
    else
      v7 = 0;
    v8 = v5[3];
    v9 = v7 < (uint64_t)v8;
    v10 = v7 > (uint64_t)v8;
    if (v9)
      v11 = -1;
    else
      v11 = v10;
    if (!v11)
    {
      if (v4)
        v12 = v4[4];
      else
        v12 = 0;
      v13 = v5[4];
      v11 = objc_msgSend(v13, "compare:", v12);

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  FCDescription *v3;
  void *v4;
  void *v5;
  unint64_t priority;
  void *v7;
  void *v8;
  NSString *loggingKey;
  void *v10;
  void *v12;
  void *v13;
  void *v14;

  v3 = -[FCDescription initWithObject:]([FCDescription alloc], "initWithObject:", self);
  if (self)
  {
    -[NSURLRequest URL](self->_URLRequest, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCDescription addField:value:](v3, "addField:value:", CFSTR("URL"), v5);

    priority = self->_priority;
  }
  else
  {
    objc_msgSend(0, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCDescription addField:value:](v3, "addField:value:", CFSTR("URL"), v13);

    priority = 0;
  }
  FCStringFromRelativePriority(priority);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("priority"), v7);

  if (self)
  {
    -[NSDate description](self->_dateInitiated, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCDescription addField:object:](v3, "addField:object:", CFSTR("dateInitiated"), v8);

    loggingKey = self->_loggingKey;
  }
  else
  {
    objc_msgSend(0, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCDescription addField:object:](v3, "addField:object:", CFSTR("dateInitiated"), v14);

    loggingKey = 0;
  }
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("loggingKey"), loggingKey);
  -[FCDescription descriptionString](v3, "descriptionString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_loggingKey, 0);
  objc_storeStrong((id *)&self->_dateInitiated, 0);
  objc_storeStrong((id *)&self->_URLRequest, 0);
}

@end
