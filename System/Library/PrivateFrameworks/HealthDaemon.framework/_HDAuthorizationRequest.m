@implementation _HDAuthorizationRequest

- (void)invokeCompletionHandlerWithSuccess:(void *)a3 error:
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  if (a1)
  {
    v6 = *(_QWORD *)(a1 + 8);
    if (v6)
    {
      v7 = v5;
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 16))(v6, *(_QWORD *)(a1 + 16), a2);
      v5 = v7;
    }
  }

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[NSUUID UUIDString](self->_identifier, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p id:\"%@\">"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typesToRead, 0);
  objc_storeStrong((id *)&self->_typesToWrite, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
