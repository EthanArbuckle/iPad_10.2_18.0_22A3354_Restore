@implementation CLNotifierServiceAdapter

- (void)setAdaptedNotifier:(CLNotifierBase *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend_universe(self, a2, (uint64_t)a3, v3, v4);
  v12 = (void *)objc_msgSend_silo(v7, v8, v9, v10, v11);
  objc_msgSend_assertInside(v12, v13, v14, v15, v16);
  if (self->_notifier)
  {
    if (qword_1EE16D448 != -1)
      dispatch_once(&qword_1EE16D448, &unk_1E29545C8);
    v21 = qword_1EE16D440;
    if (os_log_type_enabled((os_log_t)qword_1EE16D440, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v28 = 0;
      v29 = 2082;
      v30 = "";
      v31 = 2082;
      v32 = "assert";
      v33 = 2081;
      v34 = "nullptr == _notifier";
      _os_log_impl(&dword_18F1DC000, v21, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D448 != -1)
        dispatch_once(&qword_1EE16D448, &unk_1E29545C8);
    }
    v22 = qword_1EE16D440;
    if (os_signpost_enabled((os_log_t)qword_1EE16D440))
    {
      *(_DWORD *)buf = 68289539;
      v28 = 0;
      v29 = 2082;
      v30 = "";
      v31 = 2082;
      v32 = "assert";
      v33 = 2081;
      v34 = "nullptr == _notifier";
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D448 != -1)
        dispatch_once(&qword_1EE16D448, &unk_1E29545C8);
    }
    v23 = qword_1EE16D440;
    if (os_log_type_enabled((os_log_t)qword_1EE16D440, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v28 = 0;
      v29 = 2082;
      v30 = "";
      v31 = 2082;
      v32 = "assert";
      v33 = 2081;
      v34 = "nullptr == _notifier";
      _os_log_impl(&dword_18F1DC000, v23, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_27:
    abort_report_np();
  }
  if (!a3)
    return;
  if ((objc_msgSend_valid(self, v17, v18, v19, v20) & 1) == 0)
  {
    if (qword_1EE16D448 != -1)
      dispatch_once(&qword_1EE16D448, &unk_1E29545C8);
    v24 = qword_1EE16D440;
    if (os_log_type_enabled((os_log_t)qword_1EE16D440, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v28 = 0;
      v29 = 2082;
      v30 = "";
      v31 = 2082;
      v32 = "assert";
      v33 = 2081;
      v34 = "[self valid]";
      _os_log_impl(&dword_18F1DC000, v24, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D448 != -1)
        dispatch_once(&qword_1EE16D448, &unk_1E29545C8);
    }
    v25 = qword_1EE16D440;
    if (os_signpost_enabled((os_log_t)qword_1EE16D440))
    {
      *(_DWORD *)buf = 68289539;
      v28 = 0;
      v29 = 2082;
      v30 = "";
      v31 = 2082;
      v32 = "assert";
      v33 = 2081;
      v34 = "[self valid]";
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D448 != -1)
        dispatch_once(&qword_1EE16D448, &unk_1E29545C8);
    }
    v26 = qword_1EE16D440;
    if (os_log_type_enabled((os_log_t)qword_1EE16D440, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v28 = 0;
      v29 = 2082;
      v30 = "";
      v31 = 2082;
      v32 = "assert";
      v33 = 2081;
      v34 = "[self valid]";
      _os_log_impl(&dword_18F1DC000, v26, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_27;
  }
  self->_notifier = a3;
}

- (CLNotifierBase)notifier
{
  return self->_notifier;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 4) = (char *)self + 40;
  return self;
}

- (CLNotifierServiceAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLNotifierServiceAdapter;
  return -[CLIntersiloService initWithInboundProtocol:outboundProtocol:](&v3, sel_initWithInboundProtocol_outboundProtocol_, &unk_1EE17B578, &unk_1EE183AA8);
}

- (void)invalidate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = (void *)objc_msgSend_universe(self, a2, v2, v3, v4);
  v11 = (void *)objc_msgSend_silo(v6, v7, v8, v9, v10);
  objc_msgSend_assertInside(v11, v12, v13, v14, v15);
  objc_msgSend_setValid_(self, v16, 0, v17, v18);
  self->_notifier = 0;
}

- (void)register:(id)a3 forNotification:(int)a4 registrationInfo:(id)a5
{
  uint64_t v6;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CLNotifierBase *notifier;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = *(_QWORD *)&a4;
  v9 = (void *)objc_msgSend_universe(self, a2, (uint64_t)a3, *(uint64_t *)&a4, (uint64_t)a5);
  v14 = (void *)objc_msgSend_silo(v9, v10, v11, v12, v13);
  objc_msgSend_assertInside(v14, v15, v16, v17, v18);
  notifier = self->_notifier;
  v23 = objc_msgSend_notifierClientNumForCoparty_(self, v20, (uint64_t)a3, v21, v22);
  (*((void (**)(CLNotifierBase *, uint64_t, uint64_t, id))notifier->var0 + 5))(notifier, v23, v6, a5);
}

- (void)unregister:(id)a3 forNotification:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CLNotifierBase *notifier;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v5 = *(_QWORD *)&a4;
  v8 = (void *)objc_msgSend_universe(self, a2, (uint64_t)a3, *(uint64_t *)&a4, v4);
  v13 = (void *)objc_msgSend_silo(v8, v9, v10, v11, v12);
  objc_msgSend_assertInside(v13, v14, v15, v16, v17);
  notifier = self->_notifier;
  v22 = objc_msgSend_notifierClientNumForCoparty_(self, v19, (uint64_t)a3, v20, v21);
  (*((void (**)(CLNotifierBase *, uint64_t, uint64_t))notifier->var0 + 7))(notifier, v22, v5);
}

- (void)forget:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  map<unsigned long, int, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, int>>> *p_clients;
  char *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *p_pair1;
  unint64_t v20;
  BOOL v21;
  char **v22;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *v23;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> **v24;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *v25;
  BOOL v26;
  uint64_t *v27;

  v7 = (void *)objc_msgSend_universe(self, a2, (uint64_t)a3, v3, v4);
  v12 = (void *)objc_msgSend_silo(v7, v8, v9, v10, v11);
  objc_msgSend_assertInside(v12, v13, v14, v15, v16);
  p_clients = &self->_clients;
  left = (char *)self->_clients.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    p_pair1 = &self->_clients.__tree_.__pair1_;
    do
    {
      v20 = *((_QWORD *)left + 4);
      v21 = v20 >= (unint64_t)a3;
      if (v20 >= (unint64_t)a3)
        v22 = (char **)left;
      else
        v22 = (char **)(left + 8);
      if (v21)
        p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)left;
      left = *v22;
    }
    while (*v22);
    if (p_pair1 != &self->_clients.__tree_.__pair1_ && p_pair1[4].__value_.__left_ <= a3)
    {
      (*((void (**)(CLNotifierBase *, _QWORD))self->_notifier->var0 + 4))(self->_notifier, LODWORD(p_pair1[5].__value_.__left_));
      v23 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)p_pair1[1].__value_.__left_;
      if (v23)
      {
        do
        {
          v24 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> **)v23;
          v23 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)v23->__value_.__left_;
        }
        while (v23);
      }
      else
      {
        v25 = p_pair1;
        do
        {
          v24 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> **)v25[2].__value_.__left_;
          v26 = *v24 == v25;
          v25 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)v24;
        }
        while (!v26);
      }
      if (p_clients->__tree_.__begin_node_ == p_pair1)
        p_clients->__tree_.__begin_node_ = v24;
      v27 = (uint64_t *)self->_clients.__tree_.__pair1_.__value_.__left_;
      --self->_clients.__tree_.__pair3_.__value_;
      sub_18F3BEC40(v27, (uint64_t *)p_pair1);
      operator delete(p_pair1);
    }
  }
}

- (int)notifierClientNumForCoparty:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CLNotifierBase *notifier;
  map<unsigned long, int, std::less<unsigned long>, std::allocator<std::pair<const unsigned long, int>>> *p_clients;
  char *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *v21;
  unint64_t v22;
  BOOL v23;
  char **v24;
  int v25;
  unint64_t *v26;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *v27;
  unint64_t v28;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *v29;
  void *v30;
  uint64_t *v31;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend_universe(self, a2, (uint64_t)a3, v3, v4);
  v12 = (void *)objc_msgSend_silo(v7, v8, v9, v10, v11);
  objc_msgSend_assertInside(v12, v13, v14, v15, v16);
  notifier = self->_notifier;
  if (!notifier)
  {
    if (qword_1EE16D448 != -1)
      dispatch_once(&qword_1EE16D448, &unk_1E29545C8);
    v33 = qword_1EE16D440;
    if (os_log_type_enabled((os_log_t)qword_1EE16D440, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v37 = 0;
      v38 = 2082;
      v39 = "";
      v40 = 2082;
      v41 = "assert";
      v42 = 2081;
      v43 = "_notifier";
      _os_log_impl(&dword_18F1DC000, v33, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D448 != -1)
        dispatch_once(&qword_1EE16D448, &unk_1E29545C8);
    }
    v34 = qword_1EE16D440;
    if (os_signpost_enabled((os_log_t)qword_1EE16D440))
    {
      *(_DWORD *)buf = 68289539;
      v37 = 0;
      v38 = 2082;
      v39 = "";
      v40 = 2082;
      v41 = "assert";
      v42 = 2081;
      v43 = "_notifier";
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v34, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE16D448 != -1)
        dispatch_once(&qword_1EE16D448, &unk_1E29545C8);
    }
    v35 = qword_1EE16D440;
    if (os_log_type_enabled((os_log_t)qword_1EE16D440, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v37 = 0;
      v38 = 2082;
      v39 = "";
      v40 = 2082;
      v41 = "assert";
      v42 = 2081;
      v43 = "_notifier";
      _os_log_impl(&dword_18F1DC000, v35, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
    __break(1u);
  }
  p_clients = &self->_clients;
  p_pair1 = &self->_clients.__tree_.__pair1_;
  left = (char *)self->_clients.__tree_.__pair1_.__value_.__left_;
  if (!left)
    goto LABEL_13;
  v21 = &self->_clients.__tree_.__pair1_;
  do
  {
    v22 = *((_QWORD *)left + 4);
    v23 = v22 >= (unint64_t)a3;
    if (v22 >= (unint64_t)a3)
      v24 = (char **)left;
    else
      v24 = (char **)(left + 8);
    if (v23)
      v21 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)left;
    left = *v24;
  }
  while (*v24);
  if (v21 != p_pair1 && v21[4].__value_.__left_ <= a3)
    return (int)v21[5].__value_.__left_;
LABEL_13:
  v25 = (*((uint64_t (**)(CLNotifierBase *, id))notifier->var0 + 3))(notifier, a3);
  v26 = (unint64_t *)p_pair1->__value_.__left_;
  v27 = p_pair1;
  if (p_pair1->__value_.__left_)
  {
    while (1)
    {
      while (1)
      {
        v27 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)v26;
        v28 = v26[4];
        if (v28 <= (unint64_t)a3)
          break;
        v26 = (unint64_t *)v27->__value_.__left_;
        p_pair1 = v27;
        if (!v27->__value_.__left_)
          goto LABEL_20;
      }
      if (v28 >= (unint64_t)a3)
        break;
      v26 = (unint64_t *)v27[1].__value_.__left_;
      if (!v26)
      {
        p_pair1 = v27 + 1;
        goto LABEL_20;
      }
    }
  }
  else
  {
LABEL_20:
    v29 = v27;
    v27 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)operator new(0x30uLL);
    v27[4].__value_.__left_ = a3;
    LODWORD(v27[5].__value_.__left_) = 0;
    v27->__value_.__left_ = 0;
    v27[1].__value_.__left_ = 0;
    v27[2].__value_.__left_ = v29;
    p_pair1->__value_.__left_ = v27;
    v30 = *(void **)p_clients->__tree_.__begin_node_;
    v31 = (uint64_t *)v27;
    if (v30)
    {
      p_clients->__tree_.__begin_node_ = v30;
      v31 = (uint64_t *)p_pair1->__value_.__left_;
    }
    sub_18F3BE62C((uint64_t *)p_clients->__tree_.__pair1_.__value_.__left_, v31);
    ++p_clients->__tree_.__pair3_.__value_;
  }
  LODWORD(v27[5].__value_.__left_) = v25;
  return v25;
}

- (NSString)debugDescription
{
  void *v3;
  NSString *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *begin_node;
  char v13;
  CLNotifierServiceAdapter *left;
  CLNotifierServiceAdapter *v15;
  BOOL v16;
  objc_super v18;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v18.receiver = self;
  v18.super_class = (Class)CLNotifierServiceAdapter;
  v4 = -[CLIntersiloService debugDescription](&v18, sel_debugDescription);
  v11 = (void *)objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("%@\nClientIntegerMap: (\n"), v6, v7, v4);
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)self->_clients.__tree_.__begin_node_;
  if (begin_node != &self->_clients.__tree_.__pair1_)
  {
    v13 = 0;
    do
    {
      if ((v13 & 1) != 0)
        objc_msgSend_appendString_(v11, v8, (uint64_t)CFSTR(",\n"), v9, v10);
      objc_msgSend_appendFormat_(v11, v8, (uint64_t)CFSTR("%p = %d"), v9, v10, begin_node[4].__value_.__left_, LODWORD(begin_node[5].__value_.__left_));
      left = (CLNotifierServiceAdapter *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v15 = left;
          left = (CLNotifierServiceAdapter *)left->super.super.isa;
        }
        while (left);
      }
      else
      {
        do
        {
          v15 = (CLNotifierServiceAdapter *)begin_node[2].__value_.__left_;
          v16 = v15->super.super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)v15;
        }
        while (!v16);
      }
      v13 = 1;
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)v15;
    }
    while (v15 != (CLNotifierServiceAdapter *)&self->_clients.__tree_.__pair1_);
  }
  objc_msgSend_appendString_(v11, v8, (uint64_t)CFSTR("\n)\n"), v9, v10);
  return (NSString *)v11;
}

- (void).cxx_destruct
{
  sub_18F3D372C((_QWORD *)self->_clients.__tree_.__pair1_.__value_.__left_);
}

@end
