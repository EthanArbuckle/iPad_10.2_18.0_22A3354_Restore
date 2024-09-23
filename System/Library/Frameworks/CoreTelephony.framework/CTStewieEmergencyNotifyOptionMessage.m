@implementation CTStewieEmergencyNotifyOptionMessage

- (CTStewieEmergencyNotifyOptionMessage)initWithNotifyOption:(int64_t)a3 error:(id *)a4
{
  CTStewieEmergencyNotifyOptionMessage *v4;
  CTStewieEmergencyNotifyOptionMessage *v6;
  CTStewieEmergencyNotifyOptionMessage *v7;
  void *v8;
  void *v9;
  objc_super v11;
  uint64_t v12;
  _QWORD v13[2];

  v4 = self;
  v13[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v7 = (CTStewieEmergencyNotifyOptionMessage *)a4;
    if (!a4)
      goto LABEL_8;
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = CFSTR("Invalid notifyOption");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v9);
    v7->super.isa = (Class)(id)objc_claimAutoreleasedReturnValue();

LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  v11.receiver = self;
  v11.super_class = (Class)CTStewieEmergencyNotifyOptionMessage;
  v6 = -[CTStewieEmergencyNotifyOptionMessage init](&v11, sel_init, a3, a4);
  if (!v6)
  {
    v4 = 0;
    goto LABEL_7;
  }
  v6->_notifyOption = a3;
  v4 = v6;
  v7 = v4;
LABEL_8:

  return v7;
}

- (NSString)description
{
  void *v3;
  unint64_t v4;
  const char *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTStewieEmergencyNotifyOptionMessage notifyOption](self, "notifyOption");
  if (v4 > 3)
    v5 = "???";
  else
    v5 = off_1E1530DC0[v4];
  objc_msgSend(v3, "appendFormat:", CFSTR(", notifyOption=%s"), v5);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (BOOL)isEqualToEmergencyUpdateNotifyOptionMessage:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  v5 = -[CTStewieEmergencyNotifyOptionMessage notifyOption](self, "notifyOption");
  LOBYTE(v5) = v5 == objc_msgSend(v4, "notifyOption");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  CTStewieEmergencyNotifyOptionMessage *v4;
  BOOL v5;

  v4 = (CTStewieEmergencyNotifyOptionMessage *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTStewieEmergencyNotifyOptionMessage isEqualToEmergencyUpdateNotifyOptionMessage:](self, "isEqualToEmergencyUpdateNotifyOptionMessage:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setNotifyOption:", -[CTStewieEmergencyNotifyOptionMessage notifyOption](self, "notifyOption"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieEmergencyNotifyOptionMessage notifyOption](self, "notifyOption"), CFSTR("notifyOption"));

}

- (CTStewieEmergencyNotifyOptionMessage)initWithCoder:(id)a3
{
  id v4;
  CTStewieEmergencyNotifyOptionMessage *v5;
  CTStewieEmergencyNotifyOptionMessage *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CTStewieEmergencyNotifyOptionMessage;
  v5 = -[CTStewieEmergencyNotifyOptionMessage init](&v8, sel_init);
  if (v5)
  {
    -[CTStewieEmergencyNotifyOptionMessage setNotifyOption:](v5, "setNotifyOption:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("notifyOption")));
    v6 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)notifyOption
{
  return self->_notifyOption;
}

- (void)setNotifyOption:(int64_t)a3
{
  self->_notifyOption = a3;
}

@end
