@implementation NEIKEv2SignatureHashProtocol

- (NEIKEv2SignatureHashProtocol)initWithHashType:(unint64_t)a3
{
  NEIKEv2SignatureHashProtocol *v4;
  NEIKEv2SignatureHashProtocol *v5;
  NEIKEv2SignatureHashProtocol *v6;
  NSObject *v8;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NEIKEv2SignatureHashProtocol;
  v4 = -[NEIKEv2SignatureHashProtocol init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_hashType = a3;
    v6 = v4;
  }
  else
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_19BD16000, v8, OS_LOG_TYPE_FAULT, "[super init] failed", v9, 2u);
    }

  }
  return v5;
}

- (id)description
{
  return NEIKEv2HashTypeCreateString(-[NEIKEv2SignatureHashProtocol hashType](self, "hashType"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v6 = -[NEIKEv2SignatureHashProtocol hashType](self, "hashType");
    v7 = objc_msgSend(v5, "hashType");

    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)compare:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[NEIKEv2SignatureHashProtocol hashType](self, "hashType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "hashType");

  objc_msgSend(v7, "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithHashType:", -[NEIKEv2SignatureHashProtocol hashType](self, "hashType"));
}

- (unint64_t)hashType
{
  return self->_hashType;
}

@end
