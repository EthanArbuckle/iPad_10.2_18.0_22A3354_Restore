@implementation DECryptor

- (DECryptor)init
{
  void *v3;
  void *v4;
  DECryptor *v5;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = -[DECryptor initWithWriter:operation:key:iv:](self, "initWithWriter:operation:key:iv:", 0, 0, v3, v4);

  return v5;
}

- (DECryptor)initWithWriter:(id)a3 operation:(unsigned int)a4 key:(id)a5 iv:(id)a6
{
  id v11;
  id v12;
  id v13;
  DECryptor *v14;
  DECryptor *v15;
  const void *v16;
  id v17;
  objc_super v19;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)DECryptor;
  v14 = -[DECryptor init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_writer, a3);
    if (a4 >= 2)
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Unsupported crypto operation in DECryptor"));
LABEL_5:

      v15 = 0;
      goto LABEL_6;
    }
    v15->_cryptor = 0;
    v15->_operation = a4;
    v16 = (const void *)objc_msgSend(objc_retainAutorelease(v13), "bytes");
    v17 = objc_retainAutorelease(v12);
    if (CCCryptorCreateWithMode(a4, 4u, 0, 0, v16, (const void *)objc_msgSend(v17, "bytes"), objc_msgSend(v17, "length"), 0, 0, 0, 2u, &v15->_cryptor))
    {
      goto LABEL_5;
    }
  }
LABEL_6:

  return v15;
}

- (void)dealloc
{
  _CCCryptor *cryptor;
  objc_super v4;

  cryptor = self->_cryptor;
  if (cryptor)
  {
    CCCryptorRelease(cryptor);
    self->_cryptor = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DECryptor;
  -[DECryptor dealloc](&v4, sel_dealloc);
}

- (void)writeData:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _CCCryptor *cryptor;
  id v8;
  size_t dataOutMoved;

  v4 = a3;
  dataOutMoved = 0;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", CCCryptorGetOutputLength(self->_cryptor, objc_msgSend(v4, "length"), 0));
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (void *)objc_msgSend(v5, "mutableBytes");
  cryptor = self->_cryptor;
  v8 = objc_retainAutorelease(v4);
  if (CCCryptorUpdate(cryptor, (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), v6, objc_msgSend(v5, "length"), &dataOutMoved))
  {
    +[DELogging error:](DELogging, "error:", CFSTR("Failed to perform crypto operation"));
  }
  else
  {
    objc_msgSend(v5, "setLength:", dataOutMoved);
    -[DEWriter writeData:](self->_writer, "writeData:", v5);
  }

}

- (void)close
{
  id v3;
  size_t dataOutMoved;

  dataOutMoved = 0;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", CCCryptorGetOutputLength(self->_cryptor, 0, 1));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (CCCryptorFinal(self->_cryptor, (void *)objc_msgSend(v3, "mutableBytes"), objc_msgSend(v3, "length"), &dataOutMoved))
  {
    +[DELogging error:](DELogging, "error:", CFSTR("Failed to perform final crypto operation"));
  }
  else
  {
    objc_msgSend(v3, "setLength:", dataOutMoved);
    -[DEWriter writeData:](self->_writer, "writeData:", v3);
    -[DEWriter close](self->_writer, "close");
  }

}

- (DEWriter)writer
{
  return self->_writer;
}

- (void)setWriter:(id)a3
{
  objc_storeStrong((id *)&self->_writer, a3);
}

- (_CCCryptor)cryptor
{
  return self->_cryptor;
}

- (void)setCryptor:(_CCCryptor *)a3
{
  self->_cryptor = a3;
}

- (unsigned)operation
{
  return self->_operation;
}

- (void)setOperation:(unsigned int)a3
{
  self->_operation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writer, 0);
}

@end
