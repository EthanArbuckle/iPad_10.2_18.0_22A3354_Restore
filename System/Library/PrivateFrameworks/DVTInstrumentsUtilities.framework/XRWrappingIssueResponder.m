@implementation XRWrappingIssueResponder

- (XRWrappingIssueResponder)initWithNextResponder:(id)a3 prototype:(id)a4
{
  id v6;
  id v7;
  XRWrappingIssueResponder *v8;
  XRWrappingIssueResponder *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)XRWrappingIssueResponder;
  v8 = -[XRWrappingIssueResponder init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_nextResponder, v6);
    objc_storeStrong((id *)&v9->_prototype, a4);
  }

  return v9;
}

- (XRWrappingIssueResponder)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  XRWrappingIssueResponder *Responder_prototype;

  objc_msgSend_defaultResponder(XRStandardIssueResponder, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dvtiuErrorWithCode_(MEMORY[0x24BDD1540], v7, 0, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  Responder_prototype = (XRWrappingIssueResponder *)objc_msgSend_initWithNextResponder_prototype_(self, v11, (uint64_t)v6, (uint64_t)v10, v12);

  return Responder_prototype;
}

- (void)handleIssue:(id)a3 type:(signed __int16)a4 from:(id)a5
{
  uint64_t v6;
  NSError *prototype;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id WeakRetained;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  void *v46;
  const char *v47;
  id v48;

  v6 = a4;
  v48 = a3;
  prototype = self->_prototype;
  v9 = a5;
  objc_msgSend_userInfo(prototype, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend_mutableCopy(v14, v15, v16, v17, v18);

  objc_msgSend_setObject_forKeyedSubscript_(v19, v20, (uint64_t)v48, *MEMORY[0x24BDD1398], v21);
  objc_msgSend_domain(self->_prototype, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_domain(v48, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_nextResponder);
  v37 = WeakRetained;
  if (v26 == v31)
  {
    objc_msgSend_handleIssue_type_from_(WeakRetained, v33, (uint64_t)v48, v6, (uint64_t)v9);
  }
  else
  {
    v38 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend_domain(self->_prototype, v33, v34, v35, v36);
    v39 = objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend_code(self->_prototype, v40, v41, v42, v43);
    objc_msgSend_errorWithDomain_code_userInfo_(v38, v45, v39, v44, (uint64_t)v19);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleIssue_type_from_(v37, v47, (uint64_t)v46, v6, (uint64_t)v9);

    v9 = (id)v39;
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_nextResponder);
  objc_storeStrong((id *)&self->_prototype, 0);
}

@end
