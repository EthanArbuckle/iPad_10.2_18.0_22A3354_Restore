@implementation BKStringTranscriptTarget

- (BKStringTranscriptTarget)init
{
  BKStringTranscriptTarget *v2;
  NSMutableString *v3;
  NSMutableString *string;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKStringTranscriptTarget;
  v2 = -[BKStringTranscriptTarget init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    string = v2->_string;
    v2->_string = v3;

  }
  return v2;
}

- (void)writeString:(id)a3
{
  -[NSMutableString appendString:](self->_string, "appendString:", a3);
}

- (void)writePrefix:(id)a3 label:(id)a4 args:(char *)a5
{
  NSMutableString *string;
  __CFString *v9;

  string = self->_string;
  v9 = (__CFString *)a4;
  CFStringAppendFormat((CFMutableStringRef)string, 0, (CFStringRef)a3);
  CFStringAppendFormatAndArguments((CFMutableStringRef)self->_string, 0, v9, a5);

  CFStringAppend((CFMutableStringRef)self->_string, CFSTR("\n"));
}

- (id)build
{
  return self->_string;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
