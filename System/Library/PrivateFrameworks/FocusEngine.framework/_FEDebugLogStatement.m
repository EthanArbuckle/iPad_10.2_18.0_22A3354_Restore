@implementation _FEDebugLogStatement

- (_FEDebugLogStatement)init
{
  _FEDebugLogStatement *v2;
  _FEDebugLogStatement *v3;
  NSString *prefix;
  NSString *text;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_FEDebugLogStatement;
  v2 = -[_FEDebugLogStatement init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    prefix = v2->_prefix;
    v2->_prefix = (NSString *)&stru_250D3AA90;

    text = v3->_text;
    v3->_text = (NSString *)&stru_250D3AA90;

  }
  return v3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (unint64_t)indentLevel
{
  return self->_indentLevel;
}

- (void)setIndentLevel:(unint64_t)a3
{
  self->_indentLevel = a3;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
}

@end
