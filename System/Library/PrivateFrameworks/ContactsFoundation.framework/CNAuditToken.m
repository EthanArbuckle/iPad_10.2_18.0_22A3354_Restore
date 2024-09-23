@implementation CNAuditToken

- ($115C4C562B26FF47E01F9F4EA65B5887)audit_token
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

+ (id)auditToken:(id *)a3
{
  CNAuditToken *v4;
  __int128 v5;

  v4 = objc_alloc_init(CNAuditToken);
  v5 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v4->_audit_token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v4->_audit_token.val[4] = v5;
  return v4;
}

@end
