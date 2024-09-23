@implementation _APUICardRequestCompactSatisfactionCriteria

- (BOOL)canSatisfyCardRequest:(id)a3
{
  return objc_msgSend(a3, "format") == 2;
}

- (unint64_t)servicePriorityForRequest:(id)a3
{
  id v4;
  unint64_t v5;
  objc_super v7;

  v4 = a3;
  if (-[_APUICardRequestCompactSatisfactionCriteria canSatisfyCardRequest:](self, "canSatisfyCardRequest:", v4))
  {
    v5 = 2;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_APUICardRequestCompactSatisfactionCriteria;
    v5 = -[APUICardRequestSatisfactionCriteria servicePriorityForRequest:](&v7, sel_servicePriorityForRequest_, v4);
  }

  return v5;
}

@end
