@implementation FigCaptureSinkConfiguration

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *v6;
  int v7;

  if (self == a3)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v5 = -[FigCaptureSinkConfiguration sinkType](self, "sinkType"),
          v5 == objc_msgSend(a3, "sinkType")))
    {
      v6 = -[FigCaptureSinkConfiguration sinkID](self, "sinkID");
      if (v6 == (NSString *)objc_msgSend(a3, "sinkID")
        || (v7 = -[NSString isEqual:](-[FigCaptureSinkConfiguration sinkID](self, "sinkID"), "isEqual:", objc_msgSend(a3, "sinkID"))) != 0)
      {
        LOBYTE(v7) = 1;
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (NSString)sinkID
{
  return self->_sinkID;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setSinkID:", -[FigCaptureSinkConfiguration sinkID](self, "sinkID"));
  return v4;
}

- (void)setSinkID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  objc_class *v4;
  const char *Name;

  v3 = xpc_dictionary_create(0, 0, 0);
  -[FigCaptureSinkConfiguration sinkID](self, "sinkID");
  FigXPCMessageSetCFString();
  v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  xpc_dictionary_set_string(v3, "class", Name);
  return v3;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SINK %p:%@"), self, +[FigCaptureSinkConfiguration stringForSinkType:](FigCaptureSinkConfiguration, "stringForSinkType:", -[FigCaptureSinkConfiguration sinkType](self, "sinkType")));
}

+ (id)stringForSinkType:(int)a3
{
  return (id)FigCaptureSinkTypeNameMap[a3];
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSinkConfiguration;
  -[FigCaptureSinkConfiguration dealloc](&v3, sel_dealloc);
}

- (FigCaptureSinkConfiguration)initWithXPCEncoding:(id)a3
{
  FigCaptureSinkConfiguration *v3;
  objc_super v5;

  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)FigCaptureSinkConfiguration;
    v3 = -[FigCaptureSinkConfiguration init](&v5, sel_init);
    if (v3)
      FigXPCMessageCopyCFString();
  }
  else
  {

    return 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigCaptureSinkConfiguration)initWithCoder:(id)a3
{
  FigCaptureSinkConfiguration *v4;

  v4 = -[FigCaptureSinkConfiguration init](self, "init");
  if (v4)
    v4->_sinkID = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "sinkID"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_sinkID, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "sinkID"));
}

- (int)sinkType
{
  return 0;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_sinkID, "hash");
}

@end
