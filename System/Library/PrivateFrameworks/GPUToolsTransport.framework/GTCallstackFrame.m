@implementation GTCallstackFrame

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCallstackFrame)initWithCoder:(id)a3
{
  id v4;
  GTCallstackFrame *v5;
  uint64_t v6;
  NSURL *file;
  uint64_t v8;
  NSString *functionName;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GTCallstackFrame;
  v5 = -[GTCallstackFrame init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("file"));
    v6 = objc_claimAutoreleasedReturnValue();
    file = v5->_file;
    v5->_file = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("functionName"));
    v8 = objc_claimAutoreleasedReturnValue();
    functionName = v5->_functionName;
    v5->_functionName = (NSString *)v8;

    v5->_line = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("line"));
    v5->_column = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("column"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *file;
  id v5;

  file = self->_file;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", file, CFSTR("file"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_functionName, CFSTR("functionName"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_line, CFSTR("line"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_column, CFSTR("column"));

}

- (NSURL)file
{
  return self->_file;
}

- (void)setFile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)line
{
  return self->_line;
}

- (void)setLine:(unsigned int)a3
{
  self->_line = a3;
}

- (unsigned)column
{
  return self->_column;
}

- (void)setColumn:(unsigned int)a3
{
  self->_column = a3;
}

- (NSString)functionName
{
  return self->_functionName;
}

- (void)setFunctionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_file, 0);
}

@end
