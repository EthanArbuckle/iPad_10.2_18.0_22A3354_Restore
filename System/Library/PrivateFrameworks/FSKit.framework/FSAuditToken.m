@implementation FSAuditToken

+ ($115C4C562B26FF47E01F9F4EA65B5887)getOurToken
{
  __int128 v4;

  if (getOurToken_onceToken != -1)
    dispatch_once(&getOurToken_onceToken, &__block_literal_global_5);
  v4 = unk_256A09890;
  *(_OWORD *)retstr->var0 = getOurToken_ourToken;
  *(_OWORD *)&retstr->var0[4] = v4;
  return result;
}

uint64_t __27__FSAuditToken_getOurToken__block_invoke()
{
  NSObject *v0;
  uint64_t result;
  audit_token_t v2;
  mach_msg_type_number_t task_info_outCnt;

  task_info_outCnt = 8;
  if (task_info(*MEMORY[0x24BDAEC58], 0xFu, (task_info_t)getOurToken_ourToken, &task_info_outCnt))
  {
    fskit_std_log();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      LOWORD(v2.val[0]) = 0;
      _os_log_impl(&dword_23B2A6000, v0, OS_LOG_TYPE_INFO, "Error getting our own audit token", (uint8_t *)&v2, 2u);
    }

  }
  v2 = *(audit_token_t *)getOurToken_ourToken;
  audit_token_to_pid(&v2);
  v2 = *(audit_token_t *)getOurToken_ourToken;
  audit_token_to_pidversion(&v2);
  v2 = *(audit_token_t *)getOurToken_ourToken;
  result = audit_token_to_ruid(&v2);
  ourUID = result;
  didSetup = 1;
  return result;
}

- (FSAuditToken)initWithToken:(id *)a3
{
  char *v4;
  FSAuditToken *v5;
  __int128 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FSAuditToken;
  v4 = -[FSAuditToken init](&v8, sel_init);
  v5 = (FSAuditToken *)v4;
  if (v4)
  {
    v6 = *(_OWORD *)a3->var0;
    *(_OWORD *)(v4 + 24) = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)(v4 + 8) = v6;
    if ((didSetup & 1) == 0)
      objc_msgSend((id)objc_opt_class(), "getOurToken");
  }
  return v5;
}

- (FSAuditToken)init
{
  void *v3;
  __int128 v5;
  __int128 v6;

  v5 = 0u;
  v6 = 0u;
  v3 = (void *)objc_opt_class();
  if (v3)
  {
    objc_msgSend(v3, "getOurToken", v5, v6);
  }
  else
  {
    v5 = 0u;
    v6 = 0u;
  }
  return -[FSAuditToken initWithToken:](self, "initWithToken:", &v5);
}

+ (id)token
{
  return objc_alloc_init((Class)a1);
}

+ (id)tokenWithToken:(id *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithToken:", a3);
}

+ (id)tokenWithData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length") == 32)
    v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithToken:", objc_msgSend(objc_retainAutorelease(v4), "bytes"));
  else
    v5 = 0;

  return v5;
}

- (FSAuditToken)tokenWithRuid:(unsigned int)a3
{
  _DWORD *v4;

  v4 = (_DWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithToken:", &self->_token);
  v4[5] = a3;
  return (FSAuditToken *)v4;
}

- (unsigned)euid
{
  __int128 v2;
  audit_token_t v4;

  v2 = *(_OWORD *)&self->_token.val[4];
  *(_OWORD *)v4.val = *(_OWORD *)self->_token.val;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_euid(&v4);
}

- (unsigned)egid
{
  __int128 v2;
  audit_token_t v4;

  v2 = *(_OWORD *)&self->_token.val[4];
  *(_OWORD *)v4.val = *(_OWORD *)self->_token.val;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_egid(&v4);
}

- (unsigned)ruid
{
  __int128 v2;
  audit_token_t v4;

  v2 = *(_OWORD *)&self->_token.val[4];
  *(_OWORD *)v4.val = *(_OWORD *)self->_token.val;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_ruid(&v4);
}

- (unsigned)rgid
{
  __int128 v2;
  audit_token_t v4;

  v2 = *(_OWORD *)&self->_token.val[4];
  *(_OWORD *)v4.val = *(_OWORD *)self->_token.val;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_rgid(&v4);
}

- (int)pid
{
  __int128 v2;
  audit_token_t v4;

  v2 = *(_OWORD *)&self->_token.val[4];
  *(_OWORD *)v4.val = *(_OWORD *)self->_token.val;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_pid(&v4);
}

- (int)pidversion
{
  __int128 v2;
  audit_token_t v4;

  v2 = *(_OWORD *)&self->_token.val[4];
  *(_OWORD *)v4.val = *(_OWORD *)self->_token.val;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_pidversion(&v4);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)audit_token
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBytes:length:forKey:", &self->_token, 32, CFSTR("FSAuditToken.token"));
}

- (FSAuditToken)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  __int128 *v6;
  __int128 v7;
  objc_super v9;
  uint64_t v10;

  v4 = a3;
  v10 = 0;
  v9.receiver = self;
  v9.super_class = (Class)FSAuditToken;
  v5 = -[FSAuditToken init](&v9, sel_init);
  if (v5)
  {
    v6 = (__int128 *)objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("FSAuditToken.token"), &v10);
    if (v10 == 32)
    {
      v7 = *v6;
      *(_OWORD *)(v5 + 24) = v6[1];
      *(_OWORD *)(v5 + 8) = v7;
    }
    else
    {

      v5 = 0;
    }
    if ((didSetup & 1) == 0)
      objc_msgSend((id)objc_opt_class(), "getOurToken");
  }

  return (FSAuditToken *)v5;
}

- (BOOL)isOurUID
{
  unsigned int v2;

  v2 = -[FSAuditToken ruid](self, "ruid");
  return v2 == ourUID;
}

@end
