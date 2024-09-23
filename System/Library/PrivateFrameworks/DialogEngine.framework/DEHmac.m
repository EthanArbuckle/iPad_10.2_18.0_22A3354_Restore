@implementation DEHmac

- (DEHmac)initWithKey:(id)a3 iv:(id)a4
{
  id v6;
  id v7;
  DEHmac *v8;
  DEHmac *v9;
  NSData *hmac;
  id v11;
  id v12;
  DEHmac *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DEHmac;
  v8 = -[DEHmac init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    hmac = v8->_hmac;
    v8->_hmac = 0;

    v11 = objc_retainAutorelease(v6);
    CCHmacInit((CCHmacContext *)&v9->_context, 2u, (const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
    v12 = objc_retainAutorelease(v7);
    CCHmacUpdate((CCHmacContext *)&v9->_context, (const void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"));
    v13 = v9;
  }

  return v9;
}

- (void)writeData:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  if (!self->_hmac)
  {
    v4 = objc_retainAutorelease(v5);
    CCHmacUpdate((CCHmacContext *)&self->_context, (const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));
  }

}

- (void)close
{
  NSData *v3;
  NSData *hmac;

  if (!self->_hmac)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 32);
    v3 = (NSData *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CCHmacFinal((CCHmacContext *)&self->_context, (void *)-[NSData mutableBytes](v3, "mutableBytes"));
    hmac = self->_hmac;
    self->_hmac = v3;

  }
}

- (NSData)hmac
{
  return self->_hmac;
}

- (void)setHmac:(id)a3
{
  objc_storeStrong((id *)&self->_hmac, a3);
}

- ($1DC23E134A5F43A06C89BE309303CDCF)context
{
  return ($1DC23E134A5F43A06C89BE309303CDCF *)memcpy(retstr, &self->_context, sizeof($1DC23E134A5F43A06C89BE309303CDCF));
}

- (void)setContext:(id *)a3
{
  memcpy(&self->_context, a3, sizeof(self->_context));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hmac, 0);
}

+ (BOOL)verify:(id)a3 computed:(id)a4
{
  id v5;
  id v6;
  id v7;
  const void *v8;
  id v9;

  v5 = a3;
  v6 = a4;
  v7 = objc_retainAutorelease(v5);
  v8 = (const void *)objc_msgSend(v7, "bytes");
  v9 = objc_retainAutorelease(v6);
  LOBYTE(v6) = timingsafe_bcmp(v8, (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v7, "length")) == 0;

  return (char)v6;
}

@end
