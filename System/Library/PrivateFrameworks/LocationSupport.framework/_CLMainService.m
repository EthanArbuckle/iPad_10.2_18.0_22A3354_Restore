@implementation _CLMainService

+ (id)getSilo
{
  if (qword_1ECE24D28 != -1)
    dispatch_once(&qword_1ECE24D28, &unk_1E45FB740);
  return (id)qword_1ECE24D20;
}

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

+ (BOOL)isSupported
{
  return 1;
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
