@implementation WKContentRuleList

- (Object)_apiObject
{
  return (Object *)&self->_contentRuleList;
}

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::ContentRuleList::~ContentRuleList((API::ContentRuleList *)&self->_contentRuleList);
    v4.receiver = self;
    v4.super_class = (Class)WKContentRuleList;
    -[WKContentRuleList dealloc](&v4, sel_dealloc);
  }
}

- (NSString)identifier
{
  if (*(_QWORD *)(*(_QWORD *)&self->_contentRuleList.data.__lx[16] + 16))
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

+ (BOOL)_supportsRegularExpression:(id)a3
{
  const WTF::String *v3;
  WTF::StringImpl *v4;
  BOOL v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v8;

  MEMORY[0x19AEABCC8](&v8, a3);
  v5 = API::ContentRuleList::supportsRegularExpression((API::ContentRuleList *)&v8, v3);
  v6 = v8;
  v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v4);
    else
      *(_DWORD *)v6 -= 2;
  }
  return v5;
}

+ (id)_parseRuleList:(id)a3
{
  const WTF::String *v3;
  unint64_t v4;
  std::error_category *v5;
  int v6;
  WTF::StringImpl *v7;
  void *v8;
  std::string *v9;
  uint64_t v10;
  std::string v12;
  std::error_code v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  MEMORY[0x19AEABCC8](&v12, a3);
  v4 = API::ContentRuleList::parseRuleList((API::ContentRuleList *)&v12, v3);
  v6 = v4;
  *(_QWORD *)&v13.__val_ = v4;
  v13.__cat_ = v5;
  v7 = (WTF::StringImpl *)v12.__r_.__value_.__r.__words[0];
  v12.__r_.__value_.__r.__words[0] = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, (WTF::StringImpl *)v5);
      if (v6)
        goto LABEL_5;
      return 0;
    }
    *(_DWORD *)v7 -= 2;
  }
  if (!v6)
    return 0;
LABEL_5:
  v14 = *MEMORY[0x1E0CB2BF8];
  v8 = (void *)MEMORY[0x1E0CB3940];
  std::error_code::message(&v12, &v13);
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v9 = &v12;
  else
    v9 = (std::string *)v12.__r_.__value_.__r.__words[0];
  v15[0] = objc_msgSend(v8, "stringWithFormat:", CFSTR("Rule list parsing failed: %s"), v9);
  v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 6, v10);
}

@end
