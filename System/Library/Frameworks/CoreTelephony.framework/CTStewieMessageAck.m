@implementation CTStewieMessageAck

- (CTStewieMessageAck)init
{
  CTStewieMessageAck *v2;
  CTStewieMessageAck *v3;
  NSError *error;
  CTStewieMessageAck *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CTStewieMessageAck;
  v2 = -[CTStewieMessageAck init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_success = 0;
    error = v2->_error;
    v2->_error = 0;

    v3->_transportType = 0;
    v5 = v3;
  }

  return v3;
}

- (CTStewieMessageAck)initWithError:(id)a3
{
  id v5;
  CTStewieMessageAck *v6;
  CTStewieMessageAck *v7;
  CTStewieMessageAck *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTStewieMessageAck;
  v6 = -[CTStewieMessageAck init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_success = 0;
    objc_storeStrong((id *)&v6->_error, a3);
    v7->_transportType = 0;
    v8 = v7;
  }

  return v7;
}

- (id)description
{
  void *v3;
  _BOOL4 v4;
  const __CFString *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTStewieMessageAck success](self, "success");
  v5 = CFSTR("NO");
  if (v4)
    v5 = CFSTR("YES");
  objc_msgSend(v3, "appendFormat:", CFSTR(", success=%@"), v5);
  -[CTStewieMessageAck error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", error=%@"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR(", transportType=%s"), CTStewieTransportTypeAsString(-[CTStewieMessageAck transportType](self, "transportType")));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToMessageAck:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  int v7;
  BOOL v8;
  void *v9;
  void *v10;
  int64_t v11;

  v6 = a3;
  v7 = -[CTStewieMessageAck success](self, "success");
  if (v7 == objc_msgSend(v6, "success"))
  {
    -[CTStewieMessageAck error](self, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 == v10
      || (-[CTStewieMessageAck error](self, "error"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "error"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqual:", v4)))
    {
      v11 = -[CTStewieMessageAck transportType](self, "transportType");
      v8 = v11 == objc_msgSend(v6, "transportType");
      if (v9 == v10)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_8;
  }
  v8 = 0;
LABEL_9:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  CTStewieMessageAck *v4;
  BOOL v5;

  v4 = (CTStewieMessageAck *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTStewieMessageAck isEqualToMessageAck:](self, "isEqualToMessageAck:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setSuccess:", -[CTStewieMessageAck success](self, "success"));
  -[CTStewieMessageAck error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setError:", v7);

  objc_msgSend(v5, "setTransportType:", -[CTStewieMessageAck transportType](self, "transportType"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", -[CTStewieMessageAck success](self, "success"), CFSTR("success"));
  -[CTStewieMessageAck error](self, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("error"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieMessageAck transportType](self, "transportType"), CFSTR("transportType"));
}

- (CTStewieMessageAck)initWithCoder:(id)a3
{
  id v4;
  CTStewieMessageAck *v5;
  uint64_t v6;
  NSError *error;
  CTStewieMessageAck *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTStewieMessageAck;
  v5 = -[CTStewieMessageAck init](&v10, sel_init);
  if (v5)
  {
    v5->_success = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("success"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v6 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v6;

    v5->_transportType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transportType"));
    v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
