@implementation NEIKEv2RekeyChildContext

- (id)description
{
  id v3;
  uint64_t childID;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self)
    childID = self->_childID;
  else
    childID = 0;
  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("rekey child context with child id %u"), childID);
}

@end
