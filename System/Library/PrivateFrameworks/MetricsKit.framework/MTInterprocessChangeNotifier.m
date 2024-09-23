@implementation MTInterprocessChangeNotifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (MTInterprocessChangeNotifier)initWithIdentifier:(id)a3 onChange:(id)a4
{
  id v6;
  id v7;
  MTInterprocessChangeNotifier *v8;
  uint64_t v9;
  NSString *identifier;
  const char *v11;
  NSObject *v12;
  MTInterprocessChangeNotifier *v13;
  _QWORD handler[4];
  id v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MTInterprocessChangeNotifier;
  v8 = -[MTInterprocessChangeNotifier init](&v17, sel_init);
  if (!v8)
    goto LABEL_6;
  +[MTInterprocessChangeNotifier fullIdentifier:](MTInterprocessChangeNotifier, "fullIdentifier:", v6);
  v9 = objc_claimAutoreleasedReturnValue();
  identifier = v8->_identifier;
  v8->_identifier = (NSString *)v9;

  v8->_token = -1;
  v11 = -[NSString UTF8String](v8->_identifier, "UTF8String");
  dispatch_get_global_queue(0, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __60__MTInterprocessChangeNotifier_initWithIdentifier_onChange___block_invoke;
  handler[3] = &unk_24C7A1818;
  v16 = v7;
  LODWORD(v11) = notify_register_dispatch(v11, &v8->_token, v12, handler);

  if (!(_DWORD)v11 && v8->_token != -1)
  {

LABEL_6:
    v13 = v8;
    goto LABEL_7;
  }

  v13 = 0;
LABEL_7:

  return v13;
}

+ (id)fullIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MTMetricsKit:%@"), a3);
}

- (void)dealloc
{
  objc_super v3;

  -[MTInterprocessChangeNotifier stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)MTInterprocessChangeNotifier;
  -[MTInterprocessChangeNotifier dealloc](&v3, sel_dealloc);
}

- (void)stop
{
  int token;

  token = self->_token;
  if ((token & 0x80000000) == 0 && notify_is_valid_token(token))
  {
    notify_cancel(self->_token);
    self->_token = -1;
  }
}

uint64_t __60__MTInterprocessChangeNotifier_initWithIdentifier_onChange___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)notify
{
  if ((self->_token & 0x80000000) == 0)
    notify_post(-[NSString UTF8String](self->_identifier, "UTF8String"));
}

+ (void)notify:(id)a3
{
  id v3;

  objc_msgSend(a1, "fullIdentifier:", a3);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  notify_post((const char *)objc_msgSend(v3, "UTF8String"));

}

@end
