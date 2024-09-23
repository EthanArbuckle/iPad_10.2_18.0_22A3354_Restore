@implementation CEMEventBase

+ (id)eventForPayload:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Type"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR("(nil)");
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  if (+[CEMRegisteredTypeResolver registeredClassWithIdentifier:](CEMRegisteredTypeResolver, "registeredClassWithIdentifier:", v9))
  {
    v10 = (id)objc_opt_new();
    v17 = 0;
    objc_msgSend(v10, "loadPayload:error:", v5, &v17);
    v11 = v17;
    v12 = v11;
    if (!v11)
    {
      v10 = v10;
      v15 = v10;
      goto LABEL_12;
    }
    if (!a4)
    {
      v15 = 0;
      goto LABEL_12;
    }
    v13 = objc_retainAutorelease(v11);
    v12 = v13;
  }
  else
  {
    if (!a4)
    {
      v15 = 0;
      goto LABEL_13;
    }
    v14 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not match event type: %@"), v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v10);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = 0;
  *a4 = v13;
LABEL_12:

LABEL_13:
  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CEMEventBase;
  v4 = -[CEMPayloadBase copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadType, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (NSString)payloadType
{
  return self->_payloadType;
}

- (void)setPayloadType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadType, 0);
}

@end
