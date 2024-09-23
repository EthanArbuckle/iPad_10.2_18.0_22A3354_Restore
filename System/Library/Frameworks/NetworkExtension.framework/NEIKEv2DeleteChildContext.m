@implementation NEIKEv2DeleteChildContext

- (id)description
{
  id v3;
  uint64_t childID;
  NSError *reasonError;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self)
  {
    childID = self->_childID;
    reasonError = self->_reasonError;
  }
  else
  {
    childID = 0;
    reasonError = 0;
  }
  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("delete child with id %u, reason %@"), childID, reasonError);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasonError, 0);
}

@end
