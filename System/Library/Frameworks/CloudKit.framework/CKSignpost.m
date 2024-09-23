@implementation CKSignpost

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

+ (id)signpost
{
  return objc_alloc_init(CKSignpost);
}

- (CKSignpost)init
{
  uint64_t v2;

  if (qword_1ECD96F00 != -1)
    dispatch_once(&qword_1ECD96F00, &unk_1E1F58A98);
  return (CKSignpost *)objc_msgSend_initWithLog_(self, a2, qword_1ECD96EF8, v2);
}

- (OS_os_log)log
{
  return self->_log;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (CKSignpost)initWithLog:(id)a3
{
  NSObject *v5;
  CKSignpost *v6;
  CKSignpost *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKSignpost;
  v6 = -[CKSignpost init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_log, a3);
    v7->_identifier = os_signpost_id_generate(v5);
  }

  return v7;
}

@end
