@implementation MCMClientCodeSignIndex

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[MCMClientCodeSignIndex isEqualToClientCodeSignIndex:](self, "isEqualToClientCodeSignIndex:", v4);

  return v5;
}

- (BOOL)isEqualToClientCodeSignIndex:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  if (-[NSData isEqualToData:](self->_cdhash, "isEqualToData:", v4[1]))
    v5 = -[NSString isEqualToString:](self->_identifier, "isEqualToString:", v4[2]);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSData hash](self->_cdhash, "hash");
  return -[NSString hash](self->_identifier, "hash") ^ v3;
}

- (MCMClientCodeSignIndex)initWithCDHash:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  MCMClientCodeSignIndex *v9;
  MCMClientCodeSignIndex *v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MCMClientCodeSignIndex;
  v9 = -[MCMClientCodeSignIndex init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cdhash, a3);
    objc_storeStrong((id *)&v10->_identifier, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_cdhash, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MCMClientCodeSignIndex initWithCDHash:identifier:]([MCMClientCodeSignIndex alloc], "initWithCDHash:identifier:", self->_cdhash, self->_identifier);
}

@end
