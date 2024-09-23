@implementation ENTApplicationException

- (ENTApplicationException)initWithType:(int)a3 reason:(id)a4
{
  const __CFString *v4;
  objc_super v6;

  self->_type = a3;
  if ((a3 - 1) > 4)
    v4 = CFSTR("Unknown");
  else
    v4 = *(&off_24F8B5908 + (a3 - 1));
  v6.receiver = self;
  v6.super_class = (Class)ENTApplicationException;
  return -[ENTApplicationException initWithName:reason:userInfo:](&v6, sel_initWithName_reason_userInfo_, v4, a4, 0);
}

- (void)write:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "writeStructBeginWithName:", CFSTR("TApplicationException"));
  -[ENTApplicationException reason](self, "reason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v6, "writeFieldBeginWithName:type:fieldID:", CFSTR("message"), 11, 1);
    -[ENTApplicationException reason](self, "reason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "writeString:", v5);

    objc_msgSend(v6, "writeFieldEnd");
  }
  objc_msgSend(v6, "writeFieldBeginWithName:type:fieldID:", CFSTR("type"), 8, 2);
  objc_msgSend(v6, "writeI32:", self->_type);
  objc_msgSend(v6, "writeFieldEnd");
  objc_msgSend(v6, "writeFieldStop");
  objc_msgSend(v6, "writeStructEnd");

}

+ (id)read:(id)a3
{
  id v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v3 = a3;
  v10 = 0;
  objc_msgSend(v3, "readStructBeginReturningName:", 0);
  objc_msgSend(v3, "readFieldBeginReturningName:type:fieldID:", 0, (char *)&v10 + 4, &v10);
  v4 = HIDWORD(v10);
  if (HIDWORD(v10))
  {
    v5 = 0;
    v6 = 0;
    while (1)
    {
      if ((_DWORD)v10 == 2)
      {
        if (v4 != 8)
          goto LABEL_9;
        v5 = objc_msgSend(v3, "readI32");
      }
      else
      {
        if ((_DWORD)v10 != 1 || v4 != 11)
        {
LABEL_9:
          +[ENTProtocolUtil skipType:onProtocol:](ENTProtocolUtil, "skipType:onProtocol:");
          goto LABEL_10;
        }
        objc_msgSend(v3, "readString");
        v7 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v7;
      }
LABEL_10:
      objc_msgSend(v3, "readFieldEnd");
      objc_msgSend(v3, "readFieldBeginReturningName:type:fieldID:", 0, (char *)&v10 + 4, &v10);
      v4 = HIDWORD(v10);
      if (!HIDWORD(v10))
        goto LABEL_13;
    }
  }
  v6 = 0;
  v5 = 0;
LABEL_13:
  objc_msgSend(v3, "readStructEnd");
  +[ENTApplicationException exceptionWithType:reason:](ENTApplicationException, "exceptionWithType:reason:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)exceptionWithType:(int)a3 reason:(id)a4
{
  uint64_t v4;
  id v5;
  ENTApplicationException *v6;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v6 = -[ENTApplicationException initWithType:reason:]([ENTApplicationException alloc], "initWithType:reason:", v4, v5);

  return v6;
}

@end
