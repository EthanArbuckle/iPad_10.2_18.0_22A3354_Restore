@implementation _APUICardRequestCustomIntentSatisfactionCriteria

- (BOOL)canSatisfyCardRequest:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  objc_msgSend(a3, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v3, "apui_intent"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "_type") == 2;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)servicePriorityForRequest:(id)a3
{
  id v4;
  unint64_t v5;
  objc_super v7;

  v4 = a3;
  if (-[_APUICardRequestCustomIntentSatisfactionCriteria canSatisfyCardRequest:](self, "canSatisfyCardRequest:", v4))
  {
    v5 = 2;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_APUICardRequestCustomIntentSatisfactionCriteria;
    v5 = -[APUICardRequestSatisfactionCriteria servicePriorityForRequest:](&v7, sel_servicePriorityForRequest_, v4);
  }

  return v5;
}

@end
