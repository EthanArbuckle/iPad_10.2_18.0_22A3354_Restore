@implementation HMDTokenBasedStructuredReader

- (int64_t)tokenType
{
  -[HMDTokenBasedStructuredReader _bufferInitialTokenIfNecessary]((uint64_t *)self);
  return self->_token.type;
}

- (id)error
{
  if (self->_token.type == -2)
    return self->_token.value;
  else
    return 0;
}

- (void)failWithError:(id)a3
{
  id v4;
  _HMDStructuredDataToken *p_token;
  void *v6;
  id v7;

  v4 = a3;
  p_token = &self->_token;
  if (p_token->type != -2)
  {
    v6 = v4;
    v7 = v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    p_token->type = -2;
    objc_storeStrong(&p_token->value, v6);
    v4 = v7;
    if (!v7)
    {

      v4 = 0;
    }
  }

}

- (unint64_t)beginArray
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HMDTokenBasedStructuredReader _consumeTokenOfType:]((uint64_t)self, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = -1;

  return v4;
}

- (void)endArray
{
  id v2;

  v2 = -[HMDTokenBasedStructuredReader _consumeTokenOfType:]((uint64_t)self, 2);
}

- (unint64_t)beginDictionary
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HMDTokenBasedStructuredReader _consumeTokenOfType:]((uint64_t)self, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = -1;

  return v4;
}

- (id)readDictionaryKey
{
  return -[HMDTokenBasedStructuredReader _consumeTokenOfType:]((uint64_t)self, 5);
}

- (void)endDictionary
{
  id v2;

  v2 = -[HMDTokenBasedStructuredReader _consumeTokenOfType:]((uint64_t)self, 4);
}

- (void)readNull
{
  id v2;

  v2 = -[HMDTokenBasedStructuredReader _consumeTokenOfType:]((uint64_t)self, 6);
}

- (BOOL)readBoolean
{
  void *v2;
  char v3;

  -[HMDTokenBasedStructuredReader _consumeTokenOfType:]((uint64_t)self, 7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)readString
{
  return -[HMDTokenBasedStructuredReader _consumeTokenOfType:]((uint64_t)self, 8);
}

- (id)readNumber
{
  return -[HMDTokenBasedStructuredReader _consumeTokenOfType:]((uint64_t)self, 9);
}

- (id)readData
{
  return -[HMDTokenBasedStructuredReader _consumeTokenOfType:]((uint64_t)self, 10);
}

- (id)readDate
{
  return -[HMDTokenBasedStructuredReader _consumeTokenOfType:]((uint64_t)self, 11);
}

- (id)readUUID
{
  return -[HMDTokenBasedStructuredReader _consumeTokenOfType:]((uint64_t)self, 12);
}

- (_HMDStructuredDataToken)readToken
{
  int64_t type;
  id v4;
  int64_t v5;
  void *v6;
  _HMDStructuredDataToken result;

  -[HMDTokenBasedStructuredReader _bufferInitialTokenIfNecessary]((uint64_t *)self);
  type = self->_token.type;
  v4 = self->_token.value;
  -[HMDTokenBasedStructuredReader _consumeToken]((uint64_t *)self);
  v5 = type;
  v6 = v4;
  result.value = v6;
  result.type = v5;
  return result;
}

- (void)skipToken
{
  -[HMDTokenBasedStructuredReader _bufferInitialTokenIfNecessary]((uint64_t *)self);
  -[HMDTokenBasedStructuredReader _consumeToken]((uint64_t *)self);
}

- (_HMDStructuredDataToken)nextTokenAfterToken:(const _HMDStructuredDataToken *)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  v5 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (void).cxx_destruct
{

}

- (void)_bufferInitialTokenIfNecessary
{
  uint64_t *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (a1)
  {
    v1 = a1 + 1;
    if (!a1[1])
    {
      v2 = objc_msgSend(a1, "nextTokenAfterToken:", 0);
      v3 = (void *)v1[1];
      *v1 = v2;
      v1[1] = v4;

    }
  }
}

- (void)_consumeToken
{
  uint64_t *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (a1)
  {
    v1 = a1 + 1;
    if (a1[1] >= 1)
    {
      v2 = objc_msgSend(a1, "nextTokenAfterToken:", a1 + 1);
      v3 = (void *)v1[1];
      *v1 = v2;
      v1[1] = v4;

    }
  }
}

- (id)_consumeTokenOfType:(uint64_t)a1
{
  uint64_t v4;
  id v5;
  void *v7;
  void *v8;

  if (!a1)
  {
LABEL_7:
    v5 = 0;
    return v5;
  }
  -[HMDTokenBasedStructuredReader _bufferInitialTokenIfNecessary]((uint64_t *)a1);
  v4 = *(_QWORD *)(a1 + 8);
  if (v4 != a2)
  {
    if (v4 != -2)
    {
      HMDStructuredDataTokenTypeAsString(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      HMDStructuredDataTokenTypeAsString(*(_QWORD *)(a1 + 8));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "failWithReason:", CFSTR("Expected <%@> but found <%@>"), v7, v8);

    }
    goto LABEL_7;
  }
  v5 = *(id *)(a1 + 16);
  -[HMDTokenBasedStructuredReader _consumeToken]((uint64_t *)a1);
  return v5;
}

@end
