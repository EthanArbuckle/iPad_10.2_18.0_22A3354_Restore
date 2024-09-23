@implementation FCNetworkEventGroupKey

- (unint64_t)hash
{
  uint64_t eventType;
  unint64_t sessionID;
  unint64_t v4;

  if (self)
  {
    eventType = self->_eventType;
    sessionID = self->_sessionID;
    self = (FCNetworkEventGroupKey *)self->_respondingPOP;
    v4 = sessionID ^ eventType;
  }
  else
  {
    v4 = 0;
  }
  return -[FCNetworkEventGroupKey hash](self, "hash") ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t *v5;
  int eventType;
  int v7;
  unint64_t sessionID;
  uint64_t v9;
  void *v10;
  NSString *respondingPOP;
  uint64_t v12;
  NSString *v13;
  char v14;

  v4 = (uint64_t *)a3;
  v5 = v4;
  if (self)
  {
    eventType = self->_eventType;
    if (v4)
    {
LABEL_3:
      v7 = *((_DWORD *)v4 + 2);
      goto LABEL_4;
    }
  }
  else
  {
    eventType = 0;
    if (v4)
      goto LABEL_3;
  }
  v7 = 0;
LABEL_4:
  if (eventType != v7)
  {
LABEL_13:
    v14 = 0;
    goto LABEL_14;
  }
  if (self)
  {
    sessionID = self->_sessionID;
    if (v4)
    {
LABEL_7:
      v9 = v4[2];
      goto LABEL_8;
    }
  }
  else
  {
    sessionID = 0;
    if (v4)
      goto LABEL_7;
  }
  v9 = 0;
LABEL_8:
  if (sessionID != v9)
    goto LABEL_13;
  v10 = (void *)MEMORY[0x1E0DE7910];
  if (!self)
  {
    respondingPOP = 0;
    if (v4)
      goto LABEL_11;
LABEL_20:
    v12 = 0;
    goto LABEL_12;
  }
  respondingPOP = self->_respondingPOP;
  if (!v4)
    goto LABEL_20;
LABEL_11:
  v12 = v4[3];
LABEL_12:
  v13 = respondingPOP;
  v14 = objc_msgSend(v10, "nf_object:isEqualToObject:", v13, v12);

LABEL_14:
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_respondingPOP, 0);
}

@end
