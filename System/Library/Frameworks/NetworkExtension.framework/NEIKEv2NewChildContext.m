@implementation NEIKEv2NewChildContext

- (id)description
{
  id v3;
  NEIKEv2ChildSA *childSA;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self)
  {
    childSA = self->_childSA;
    if (childSA)
      childSA = (NEIKEv2ChildSA *)childSA->_childID;
  }
  else
  {
    childSA = 0;
  }
  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("new child request with id %u"), childSA);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childSA, 0);
}

@end
