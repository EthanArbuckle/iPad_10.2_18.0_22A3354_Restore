@implementation MEMessageEncodingResult

- (MEMessageEncodingResult)initWithEncodedMessage:(MEEncodedOutgoingMessage *)encodedMessage signingError:(NSError *)signingError encryptionError:(NSError *)encryptionError
{
  MEEncodedOutgoingMessage *v9;
  NSError *v10;
  NSError *v11;
  MEMessageEncodingResult *v12;
  MEMessageEncodingResult *v13;
  objc_super v15;

  v9 = encodedMessage;
  v10 = signingError;
  v11 = encryptionError;
  v15.receiver = self;
  v15.super_class = (Class)MEMessageEncodingResult;
  v12 = -[MEMessageEncodingResult init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_encodedMessage, encodedMessage);
    objc_storeStrong((id *)&v13->_signingError, signingError);
    objc_storeStrong((id *)&v13->_encryptionError, encryptionError);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MEMessageEncodingResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MEMessageEncodingResult *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_encodedMessage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_signingError"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_encryptionError"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MEMessageEncodingResult initWithEncodedMessage:signingError:encryptionError:](self, "initWithEncodedMessage:signingError:encryptionError:", v5, v6, v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MEMessageEncodingResult encodedMessage](self, "encodedMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_encodedMessage"));

  -[MEMessageEncodingResult signingError](self, "signingError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_signingError"));

  -[MEMessageEncodingResult encryptionError](self, "encryptionError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_encryptionError"));

}

- (MEEncodedOutgoingMessage)encodedMessage
{
  return self->_encodedMessage;
}

- (NSError)signingError
{
  return self->_signingError;
}

- (NSError)encryptionError
{
  return self->_encryptionError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionError, 0);
  objc_storeStrong((id *)&self->_signingError, 0);
  objc_storeStrong((id *)&self->_encodedMessage, 0);
}

@end
