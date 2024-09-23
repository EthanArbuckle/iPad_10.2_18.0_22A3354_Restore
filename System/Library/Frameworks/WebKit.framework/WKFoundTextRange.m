@implementation WKFoundTextRange

+ (id)foundTextRangeWithWebFoundTextRange:(WebFoundTextRange *)a3
{
  WKFoundTextRange *v4;
  const __CFString *v5;

  v4 = objc_alloc_init(WKFoundTextRange);
  -[WKFoundTextRange setLocation:](v4, "setLocation:", a3->var0);
  -[WKFoundTextRange setLength:](v4, "setLength:", a3->var1);
  if (a3->var2.var0.m_impl.m_ptr)
    v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v5 = &stru_1E351F1B8;
  -[WKFoundTextRange setFrameIdentifier:](v4, "setFrameIdentifier:", v5);
  -[WKFoundTextRange setOrder:](v4, "setOrder:", a3->var3);
  return (id)(id)CFMakeCollectable(v4);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WKFoundTextRange;
  -[WKFoundTextRange dealloc](&v3, sel_dealloc);
}

- (id)start
{
  return +[WKFoundTextPosition textPositionWithOffset:order:](WKFoundTextPosition, "textPositionWithOffset:order:", -[WKFoundTextRange location](self, "location"), -[WKFoundTextRange order](self, "order"));
}

- (id)end
{
  return +[WKFoundTextPosition textPositionWithOffset:order:](WKFoundTextPosition, "textPositionWithOffset:order:", -[WKFoundTextRange length](self, "length") + -[WKFoundTextRange location](self, "location"), -[WKFoundTextRange order](self, "order"));
}

- (BOOL)isEmpty
{
  return 0;
}

- (WebFoundTextRange)webFoundTextRange
{
  NSString *v5;
  const __CFString *v6;
  WebFoundTextRange *result;
  StringImpl *v8;

  retstr->var0 = -[WKFoundTextRange location](self, "location");
  retstr->var1 = -[WKFoundTextRange length](self, "length");
  v5 = -[WKFoundTextRange frameIdentifier](self, "frameIdentifier");
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)v5, v6);
  retstr->var2.var0.m_impl.m_ptr = v8;
  result = -[WKFoundTextRange order](self, "order");
  retstr->var3 = (unint64_t)result;
  return result;
}

- (unint64_t)location
{
  return self->_location;
}

- (void)setLocation:(unint64_t)a3
{
  self->_location = a3;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

- (NSString)frameIdentifier
{
  return self->_frameIdentifier;
}

- (void)setFrameIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)order
{
  return self->_order;
}

- (void)setOrder:(unint64_t)a3
{
  self->_order = a3;
}

@end
