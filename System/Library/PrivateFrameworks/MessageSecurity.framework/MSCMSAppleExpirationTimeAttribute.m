@implementation MSCMSAppleExpirationTimeAttribute

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113635.100.9.3"), 0);
}

- (MSCMSAppleExpirationTimeAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  __CFString *v14;
  uint64_t v15;
  id v16;
  const __CFString *v17;
  MSCMSAppleExpirationTimeAttribute *v18;
  MSCMSAppleExpirationTimeAttribute *v19;
  uint64_t v20;
  NSDate *expirationTime;
  objc_super v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a3;
  objc_msgSend(v6, "attributeType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("1.2.840.113635.100.9.3"));

  if ((v8 & 1) == 0)
  {
    if (a4)
    {
      v14 = MSErrorCMSDomain[0];
      v16 = *a4;
      v17 = CFSTR("Not an Expiration Time attribute according to AttributeType");
      v15 = -26275;
      goto LABEL_10;
    }
LABEL_11:
    v18 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v6, "attributeValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 != 1)
  {
    if (a4)
    {
      v14 = MSErrorCMSDomain[0];
      v16 = *a4;
      v17 = CFSTR("Expiration Time Attribute MUST have a single signed attribute value");
      v15 = -50;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v24 = 0;
  v25 = 0;
  objc_msgSend(v6, "attributeValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndex:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = nsheim_decode_Time(v12);

  if (v13)
  {
    if (a4)
    {
      v14 = MSErrorASN1Domain[0];
      v15 = v13;
      v16 = *a4;
      v17 = CFSTR("unable to decode Expiration Time value");
LABEL_10:
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v14, v15, v16, v17);
      v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    goto LABEL_11;
  }
  v23.receiver = self;
  v23.super_class = (Class)MSCMSAppleExpirationTimeAttribute;
  v19 = -[MSCMSAppleExpirationTimeAttribute init](&v23, sel_init);
  if (v19)
  {
    if ((_DWORD)v24 == 2 || (_DWORD)v24 == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v25);
      v20 = objc_claimAutoreleasedReturnValue();
      expirationTime = v19->_expirationTime;
      v19->_expirationTime = (NSDate *)v20;

    }
    else if (a4)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorASN1Domain[0], -26275, *a4, CFSTR("invalid Time choice in Expiration Time"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  free_Time();
  self = v19;
  v18 = self;
LABEL_19:

  return v18;
}

- (MSCMSAppleExpirationTimeAttribute)initWithExpirationTime:(id)a3
{
  id v5;
  MSCMSAppleExpirationTimeAttribute *v6;
  MSCMSAppleExpirationTimeAttribute *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSCMSAppleExpirationTimeAttribute;
  v6 = -[MSCMSAppleExpirationTimeAttribute init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_expirationTime, a3);

  return v7;
}

- (id)encodeAttributeWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MSCMSAttribute *v11;
  void *v12;
  void *v13;
  MSCMSAttribute *v14;
  __int16 v16;
  __int16 v17;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", -1609459200.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 1546300800.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSDate compare:](self->_expirationTime, "compare:", v5) == NSOrderedAscending
    || -[NSDate compare:](self->_expirationTime, "compare:", v6) == NSOrderedDescending)
  {
    v17 = 3864;
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", &v17, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    generalizedTimeStringFromDate(self->_expirationTime);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 3351;
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", &v16, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UTCStringFromDate(self->_expirationTime);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  objc_msgSend(v8, "dataUsingEncoding:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendData:", v10);

  v11 = [MSCMSAttribute alloc];
  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113635.100.9.3"), a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MSCMSAttribute initWithAttributeType:values:](v11, "initWithAttributeType:values:", v12, v13);

  return v14;
}

- (NSDate)expirationTime
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationTime, 0);
}

@end
