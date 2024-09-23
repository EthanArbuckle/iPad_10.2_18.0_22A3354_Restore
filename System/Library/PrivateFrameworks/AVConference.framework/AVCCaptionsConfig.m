@implementation AVCCaptionsConfig

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)AVCCaptionsConfig;
  -[AVCCaptionsConfig dealloc](&v3, sel_dealloc);
}

+ (id)stringFromUsage:(unsigned __int8)a3
{
  const char *v3;

  if ((a3 - 1) > 2)
    v3 = "Unknown";
  else
    v3 = off_1E9E53E48[(char)(a3 - 1)];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s(%hhu)"), v3, a3);
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)AVCCaptionsConfig;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ %@ locale=%@ usage=%@ }"), -[AVCCaptionsConfig description](&v3, sel_description), self->_locale, +[AVCCaptionsConfig stringFromUsage:](AVCCaptionsConfig, "stringFromUsage:", self->_usage));
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (unsigned)usage
{
  return self->_usage;
}

- (void)setUsage:(unsigned __int8)a3
{
  self->_usage = a3;
}

+ (BOOL)isValidUsage:(unsigned __int8)a3
{
  return (a3 - 1) < 3;
}

@end
