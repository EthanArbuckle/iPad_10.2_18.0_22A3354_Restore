@implementation _CLUnSupportedService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;
  id v6;

  v6 = a3;
  v5 = a4 + 1;
  if (v5 < objc_msgSend(v6, "count"))
    objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", v6, v5);

}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

+ (id)getSilo
{
  if (qword_1EE64C760 != -1)
    dispatch_once(&qword_1EE64C760, &unk_1E45FBC48);
  return 0;
}

+ (BOOL)isSupported
{
  return 0;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end
