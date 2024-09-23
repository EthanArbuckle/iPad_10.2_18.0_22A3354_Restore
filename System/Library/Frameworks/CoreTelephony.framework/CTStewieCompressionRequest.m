@implementation CTStewieCompressionRequest

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTStewieCompressionRequest data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CTStewieCompressionRequest data](self, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", data length=%lu"), objc_msgSend(v5, "length"));

  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR(", data=nil"));
  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  CTStewieCompressionRequest *v5;
  CTStewieCompressionRequest *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v5 = (CTStewieCompressionRequest *)a3;
  if (v5 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[CTStewieCompressionRequest data](self, "data");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7
        || (-[CTStewieCompressionRequest data](v6, "data"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[CTStewieCompressionRequest data](self, "data");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTStewieCompressionRequest data](v6, "data");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

        if (v7)
        {
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {
        v10 = 1;
      }

      goto LABEL_11;
    }
    v10 = 0;
  }
LABEL_12:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTStewieCompressionRequest data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setData:", v7);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CTStewieCompressionRequest data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("data"));

}

- (CTStewieCompressionRequest)initWithCoder:(id)a3
{
  id v4;
  CTStewieCompressionRequest *v5;
  uint64_t v6;
  NSData *data;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTStewieCompressionRequest;
  v5 = -[CTStewieCompressionRequest init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
