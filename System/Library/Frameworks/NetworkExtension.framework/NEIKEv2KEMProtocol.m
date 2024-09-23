@implementation NEIKEv2KEMProtocol

- (NEIKEv2KEMProtocol)initWithMethod:(unint64_t)a3
{
  NEIKEv2KEMProtocol *v4;
  NEIKEv2KEMProtocol *v5;
  NEIKEv2KEMProtocol *v6;
  NSObject *v8;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NEIKEv2KEMProtocol;
  v4 = -[NEIKEv2KEMProtocol init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_method = a3;
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
  unint64_t v3;
  __CFString *v4;

  v3 = -[NEIKEv2KEMProtocol method](self, "method");
  v4 = CFSTR("None");
  switch(v3)
  {
    case 0uLL:
      return v4;
    case 1uLL:
      v4 = CFSTR("MODP768");
      break;
    case 2uLL:
      v4 = CFSTR("MODP1024");
      break;
    case 3uLL:
    case 4uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x1EuLL:
      goto LABEL_6;
    case 5uLL:
      v4 = CFSTR("MODP1536");
      break;
    case 0xEuLL:
      v4 = CFSTR("MODP2048");
      break;
    case 0xFuLL:
      v4 = CFSTR("MODP3072");
      break;
    case 0x10uLL:
      v4 = CFSTR("MODP4096");
      break;
    case 0x11uLL:
      v4 = CFSTR("MODP6144");
      break;
    case 0x12uLL:
      v4 = CFSTR("MODP8192");
      break;
    case 0x13uLL:
      v4 = CFSTR("RandomECP256");
      break;
    case 0x14uLL:
      v4 = CFSTR("RandomECP384");
      break;
    case 0x15uLL:
      v4 = CFSTR("RandomECP521");
      break;
    case 0x1FuLL:
      v4 = CFSTR("Curve25519");
      break;
    case 0x20uLL:
      v4 = CFSTR("Curve448");
      break;
    default:
      if (v3 == 11001)
      {
        v4 = CFSTR("Kyber768Private");
      }
      else if (v3 == 11002)
      {
        v4 = CFSTR("Kyber1024Private");
      }
      else
      {
LABEL_6:
        v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown[%llu]"), -[NEIKEv2KEMProtocol method](self, "method"));
      }
      break;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  if (v4 && objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[NEIKEv2KEMProtocol method](self, "method");
    v7 = objc_msgSend(v5, "method");

    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NEIKEv2KEMProtocol initWithMethod:](+[NEIKEv2KEMProtocol allocWithZone:](NEIKEv2KEMProtocol, "allocWithZone:", a3), "initWithMethod:", -[NEIKEv2KEMProtocol method](self, "method"));
}

- (unint64_t)method
{
  return self->_method;
}

@end
